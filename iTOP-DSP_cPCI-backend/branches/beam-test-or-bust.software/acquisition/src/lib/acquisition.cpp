using namespace std;

#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h> // to catch ctrl-c
#include "acquisition.h"
#include "fiber.h"
#include "pci.h"
#include "CAMAC.h"

void (*call_this_on_ctrl_c)(void) = graceful_exit;

bool channel_enabled[4];
string location_of_raw_datafiles = "../logdir";
string location_of_status_and_log_files = ".";
unsigned short int channel_bitmask = 0xf;
unsigned short int experiment_number = 7;
unsigned short int run_number = 8;
unsigned short int spill_number = 9;
unsigned long int event_number = 10;
string base_filename;
unsigned short int threshold_scan_low_limit;
unsigned short int threshold_scan_high_limit;
unsigned short int threshold_scan_step_size;
ofstream logfile;
string logfile_filename = "work/logfile";
bool logfile_open = false;
string run_type = "unknown";
unsigned short int verbosity = 3;
signed short int temperature_redline = 50;

string experiment_number_string(void) {
	string expNN = "exp";
	char temp[6];
	sprintf(temp, "%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER, experiment_number);
	expNN += temp;
	return expNN;
}

void generate_new_base_filename(void) {
	set_current_date_string();
	char temp[25];
	base_filename = location_of_raw_datafiles;
	//create_directory_if_necessary(base_filename.c_str());
	base_filename += "/";
	base_filename += experiment_number_string();
	create_directory_if_necessary(base_filename.c_str());
	base_filename += "/";
	sprintf(temp, "exp%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER, experiment_number);
	base_filename += temp;
	sprintf(temp, ".run%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_RUN_NUMBER, run_number);
	base_filename += temp;
	sprintf(temp, ".spill%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_SPILL_NUMBER, spill_number);
	base_filename += temp;
	sprintf(temp, ".%s", current_date_string.c_str());
	base_filename += temp;
}

void increment_spill_number(void) {
	spill_number++;
}

void update_logfile_with_the_number_of_readout_events_for_this_spill(void) {
	if (logfile_open) {
		logfile << number_of_readout_events_for_this_spill << " " << run_type.c_str() << endl << flush;
	}
}

void update_logfile_with_the_number_of_readout_events_for_this_spill_and_close_all_files(void) {
	update_logfile_with_the_number_of_readout_events_for_this_spill();
	close_all_files();
}

void close_all_files(void) {
	//cout << "closing all files" << endl;
	fprintf(debug, "closing all files\n");
	close_logfile();
	if (CAMAC_initialized) {
		close_CAMAC_controller();
		close_CAMAC_file();
		if (using_CAMAC3377) {
			close_CAMAC3377_file();
		}
	}
	close_all_fiber_files();
	close_pci();
}

void close_logfile(void) {
	if (logfile_open) {
		//cout << "closing logfile" << endl;
		fprintf(debug, "closing logfile\n");
		logfile << endl << flush;
		logfile.close();
	}
	logfile_open = false;
}

void open_logfile(void) {
	if (!logfile_open) {
		//cout << "opening logfile" << endl;
		fprintf(debug, "opening logfile\n");
		logfile_filename = location_of_status_and_log_files;
		create_directory_if_necessary(logfile_filename.c_str());
		logfile_filename += "/";
		logfile_filename += experiment_number_string();
		create_directory_if_necessary(logfile_filename.c_str());
		logfile_filename += "/logfile";
		logfile.open(logfile_filename.c_str(), fstream::app);
		if (logfile) {
			logfile_open = true;
			logfile << endl << flush;
		} else {
			fprintf(error, "ERROR opening logfile %s\n", logfile_filename.c_str());
			logfile_open = false;
		}
	}
}

void update_logfile_with_base_filename(void) {
	if (logfile_open) {
		logfile << base_filename.c_str() << " " << flush;
	}
}

void setup_run_type(string type) {
	run_type = type;
}

void graceful_exit(void) {
	update_logfile_with_the_number_of_readout_events_for_this_spill_and_close_all_files();
	exit(13);
}

void setup_to_catch_ctrl_c(void (*callback)(void)) {
	setup_for_console_output();
	//call_this_on_ctrl_c = (void *) close_all_files;
	call_this_on_ctrl_c = callback;
	(void) signal(SIGINT, caught_ctrl_c);
}

void caught_ctrl_c(int sig) {
	//cout << endl << "caught ctrl-c" << endl;
	fprintf(error, "caught ctrl-c\n");
	call_this_on_ctrl_c();
	(void) signal(SIGINT, SIG_DFL);
	exit(0);
}

char red[13], yellow[13], white[13];
void setup_for_console_output(void) {
	sprintf(red,    "%c[%d;%d;%dm", 0x1b, 0, 30 + 1, 40);
	sprintf(yellow, "%c[%d;%d;%dm", 0x1b, 0, 30 + 3, 40);
	sprintf(white,  "%c[%d;%d;%dm", 0x1b, 0, 30 + 7, 40);
}

void wait_for_all_links_to_come_up(unsigned short int bitmask) {
	unsigned short int link_status = pci.getLinkStatus();
	if ((link_status & bitmask) != bitmask) {
		fprintf(warning, "waiting for all enabled channels to bring link up...");
		fflush(warning);
		while ((link_status & bitmask) != bitmask) {
			link_status = pci.getLinkStatus();
			usleep(50000);
//		fprintf(debug, "\n");
		}
		fprintf(warning, "\n");
	}
}

