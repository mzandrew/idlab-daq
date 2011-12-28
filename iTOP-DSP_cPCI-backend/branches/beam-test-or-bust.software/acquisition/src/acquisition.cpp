#include "acquisition.h"

using namespace std;

#include <iostream>
#include <fstream>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include "fiber_readout.h"

bool channel_enabled[4];
string location_of_raw_datafiles = "../logdir";
string location_of_status_and_log_files = ".";
unsigned short int channel_bitmask = 0xf;
unsigned short int experiment_number = 7;
unsigned short int run_number = 8;
unsigned short int spill_number = 9;
unsigned long int event_number = 10;
string current_date_string;
string base_filename;
unsigned short int threshold_scan_low_limit;
unsigned short int threshold_scan_high_limit;
unsigned short int threshold_scan_step_size;
ofstream logfile;
string logfile_filename = "work/logfile";
bool logfile_open = false;

void set_current_date_string(void) {
	char temp[256];
	time_t rawtime;
	struct tm *timeinfo;
	time(&rawtime);
	timeinfo = localtime(&rawtime);
	strftime(temp, 255, "%Y-%m-%d+%H:%M:%S", timeinfo);
	current_date_string = temp;
//	cout << current_date_string << endl;
}

bool file_exists (string filename) {
	// borrowed from http://stackoverflow.com/questions/230062/whats-the-best-way-to-check-if-a-file-exists-in-c-cross-platform
	struct stat buffer; 
	return (stat (filename.c_str(), &buffer) == 0);
}

void create_directory_if_necessary(string dirname) {
	if (!file_exists(dirname)) {
		//cout << "dir \"" << dirname << "\" does not exist" << endl;
		mkdir(dirname.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
		if (!file_exists(dirname)) {
			cout << "ERROR:  could not create directory \"" << dirname << "\"" << endl;
			exit(10);
		}
	}
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
	sprintf(temp, "exp%02d", experiment_number);
	base_filename += temp;
	sprintf(temp, ".run%04d", run_number);
	base_filename += temp;
	sprintf(temp, ".spill%04d", spill_number);
	base_filename += temp;
	sprintf(temp, ".%s", current_date_string.c_str());
	base_filename += temp;
}

void increment_spill_number(void) {
	spill_number++;
}

void update_logfile_with_the_number_of_readout_events_for_this_spill(void) {
	if (logfile_open) {
		logfile << number_of_readout_events_for_this_spill << endl << flush;
	}
}

void open_logfile(void) {
	if (!logfile_open) {
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
			fprintf(stderr, "ERROR opening logfile %s\n", logfile_filename.c_str());
			logfile_open = false;
		}
	}
}

