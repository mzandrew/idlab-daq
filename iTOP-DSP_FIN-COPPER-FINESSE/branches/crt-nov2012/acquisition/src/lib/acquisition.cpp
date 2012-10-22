using namespace std;

#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h> // to catch ctrl-c
#include "acquisition.h"

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
unsigned long int event_number_for_fiber[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int event_number_from_most_recent_packet[NUMBER_OF_SCRODS_TO_READOUT];
unsigned char unsigned_char_byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];
unsigned long int word_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_WORDS];
         char     byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];
unsigned short int maybe_should_skip_writing_this_event_to_disk = 0;

unsigned long int header = 0x00be11e2;
unsigned long int protocol_freeze_date = 0x20111213;
unsigned long int packet_type[NUMBER_OF_PACKET_TYPES] = { 0x00c0ffee, 0x0000eada, 0x000f00da, 0x000ab0de, 0xce11b10c };
unsigned long int footer = 0x62504944;
unsigned long int packet[NUMBER_OF_WORDS_IN_A_PACKET];

float temperature_float[NUMBER_OF_SCRODS_TO_READOUT];
unsigned short int feedback_enables_and_goals[6] = { 0, 1950, 0, 0, 0, 0};

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
#ifndef NO_CAMAC
	if (CAMAC_initialized) {
		close_CAMAC_controller();
		close_CAMAC_file();
		if (using_CAMAC3377) {
			close_CAMAC3377_file();
		}
	}
#endif //NO_CAMAC
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
			fprintf(_g_error, "ERROR opening logfile %s\n", logfile_filename.c_str());
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
	_g_call_this_on_ctrl_c = callback;
	(void) signal(SIGINT, caught_ctrl_c);
}

void caught_ctrl_c(int sig) {
	//cout << endl << "caught ctrl-c" << endl;
	fprintf(error, "caught ctrl-c\n");
	_g_call_this_on_ctrl_c();
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

// this is the stupid-monkey way of doing this:
void copy_packet(unsigned long int *source) {
	for (unsigned long int i=0; i<NUMBER_OF_WORDS_IN_A_PACKET; i++) {
		packet[i] = source[i];
	}
}

void analyze_packet(unsigned long int packet_number, unsigned short int channel) {
	unsigned long int checksum = 0;
	unsigned long int packet_number_from_packet;
	if (packet[PACKET_HEADER_INDEX] != header) {
		error_string[channel] += " bad header;";
//		printf(" bad header"); // this should never be called, since matching against a header is how it got here
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet[PACKET_SIZE_INDEX] != NUMBER_OF_WORDS_IN_A_PACKET) {
		error_string[channel] += " bad packet size;";
//		printf(" bad packet size");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet[PACKET_PROTOCOL_FREEZE_DATE_INDEX] != protocol_freeze_date) {
		error_string[channel] += " bad protocol freeze date;";
//		printf(" bad protocol freeze date");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	unsigned short int packet_type_is_okay = 0;
	for (int i=0; i<NUMBER_OF_PACKET_TYPES; i++) {
		if (packet[PACKET_TYPE_INDEX] == packet_type[i]) {
			packet_type_is_okay++;
		}
	}
	if (!packet_type_is_okay) {
		error_string[channel] += " bad packet type;";
//		printf(" bad packet type");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	packet_number_from_packet = (packet[PACKET_NUMBER_INDEX] & 0x00ff0000) >> 16;
	if (packet_number_from_packet != packet_number) {
		error_string[channel] += " packet_number didn't match;";
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet_number==0) {
		//info_string[channel] += packet[EVENT_NUMBER_INDEX];
		char temp[256];
		//sprintf(temp, "event_number[%09ld] ", packet[EVENT_NUMBER_INDEX]);
		event_number_for_fiber[channel] = packet[EVENT_NUMBER_INDEX];
//		fprintf(warning, "{%d,%d}", event_number, event_number_for_fiber[channel]);
		if (event_number_for_fiber[channel] == event_number + 1) {
			sprintf(temp, "f%d[%0*ld] ", channel, NUMBER_OF_SPACES_TO_RESERVE_FOR_EVENT_NUMBER_CONSOLE_OUTPUT, event_number_for_fiber[channel]);
		} else {
			sprintf(temp, "f%d[%s%0*ld%s] ", channel, red, NUMBER_OF_SPACES_TO_RESERVE_FOR_EVENT_NUMBER_CONSOLE_OUTPUT, event_number_for_fiber[channel], white);
		}
		info_string[channel] += temp;
	} else {
		if (event_number_from_most_recent_packet[channel] != packet[EVENT_NUMBER_INDEX]) {
			error_string[channel] += " event_number changed in the middle of an event (";
			error_string[channel] += event_number_from_most_recent_packet[channel];
			error_string[channel] += " vs ";
			error_string[channel] += packet[EVENT_NUMBER_INDEX];
			error_string[channel] += ");";
			number_of_errors_for_this_quarter_event[channel]++;
		}
	}
	event_number_from_most_recent_packet[channel] = packet[EVENT_NUMBER_INDEX];
	for (unsigned long int i=0; i<NUMBER_OF_WORDS_IN_A_PACKET; i++) {
		if (i != PACKET_CHECKSUM_INDEX) {
			checksum += packet[i];
		}
	}
	checksum &= 0xffffffff;
	if (0) {
	if (checksum != packet[PACKET_CHECKSUM_INDEX]) {
		char temp[256];
//		error_string[channel] += " checksums do not match;";
//		error_string[channel] += " checksum is ";
		sprintf(temp, "0x%08lx", packet[PACKET_CHECKSUM_INDEX]);
		error_string[channel] += temp;
		error_string[channel] += " - ";
//		error_string[channel] += " but should be ";
		sprintf(temp, "0x%08lx", checksum);
		error_string[channel] += temp;
		error_string[channel] += " = ";
//		error_string[channel] += " the difference is ";
		sprintf(temp, "0x%08lx", packet[PACKET_CHECKSUM_INDEX]-checksum);
		error_string[channel] += temp;
		error_string[channel] += ";";
//		printf(" checksums do not match");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	}
	if (packet[PACKET_FOOTER_INDEX] != footer) {
		error_string[channel] += " bad footer;";
//		printf(" bad footer");
		number_of_errors_for_this_quarter_event[channel]++;
	}
//	if (error_string[channel].length() && packet_number == 0) {
	if (error_string[channel].length()) {
		fprintf(debug2, "%s%s", event_fiber_packet_string.c_str(), error_string[channel].c_str());
		error_string[channel] = "";
	}
	if (info_string[channel].length()) {
		fprintf(info, "%s", info_string[channel].c_str());
		info_string[channel] = "";
	}
	if (number_of_errors_for_this_quarter_event[channel]) {
		fprintf(warning, "%ld errors for this QE\n", number_of_errors_for_this_quarter_event[channel]);
	}
//	printf("P");
}

struct timeval start, end, watchdog;

void start_timer(void) {
	gettimeofday(&start, NULL);	
	gettimeofday(&watchdog, NULL);	
}

int watchdog_timer_in_seconds(void) {
	gettimeofday(&end, NULL);
	return end.tv_sec - watchdog.tv_sec;
}

int stop_timer(struct timeval* begin) {
	if (begin == NULL) {
		begin = &start;
	}
	int sec, usec;
	gettimeofday(&end, NULL);
	sec = end.tv_sec - begin->tv_sec;
	usec = end.tv_usec - begin->tv_usec;
	return sec*1000000+usec;
}

int stop_timer_in_seconds(void) {
	gettimeofday(&end, NULL);
	return end.tv_sec - start.tv_sec;
}

float temperature(unsigned short int fiber_channel) {
	unsigned short int temperature = word_buffer[fiber_channel][140*130+126];
	//printf("temperature: %d\n", temperature);
	float ftemperature = temperature/16.0;
	//printf("temperature of module %d: %3.4f degrees C\n", fiber_channel, ftemperature);
	return ftemperature;
}

void show_temperature_for_channel(unsigned short int channel_number) {
	signed short int t = (signed short int) temperature_float[channel_number];
	//cout << t << "C ";
	if (t >= temperature_redline) {
		fprintf(info, "%s%2dC%s ", red, t, white);
	} else {
		fprintf(info, "%2dC ", t);
	}
}

void check_and_synchronize_event_numbers(void) {
	unsigned short int need_to_set_event_number = 0;
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		if (channel_bitmask & (1<<i)) {
			if (event_number_for_fiber[i] != event_number) {
				need_to_set_event_number++;
			}
		}
	}
	if (need_to_set_event_number) {
		//cout << endl << "error detected in event_number reported back from " << need_to_set_event_number << " SCROD(s).  resetting the event number...";
		//fprintf(warning, "error detected in event_number from %d SCRODs. resetting...\n", need_to_set_event_number);
//		fprintf(warning, "resetting event_number...\n");
		set_event_number(event_number);
	}
}

void clear_buffer(unsigned short int channel_number) {
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_WORDS; i++) {
		word_buffer[channel_number][i] = 0;
	}
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_BYTES; i++) {
		byte_buffer[channel_number][i] = 0;
	}
}

// this is the stupid-monkey way of doing this:
void copy_byte_buffer_to_word_buffer(unsigned short int channel) {
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_BYTES; i++) {
		unsigned_char_byte_buffer[channel][i] = byte_buffer[channel][i];
	}
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_WORDS; i++) {
		unsigned long int j = i * NUMBER_OF_BYTES_IN_A_WORD;
		//if ((word_buffer[channel][i] & 0x00ff0000) >> 16 == 0xbe) {
		word_buffer[channel][i] =
			((unsigned_char_byte_buffer[channel][j+3]) << 24) |
			((unsigned_char_byte_buffer[channel][j+2]) << 16) |
			((unsigned_char_byte_buffer[channel][j+1]) <<  8) |
			((unsigned_char_byte_buffer[channel][j+0]) <<  0);
	}
}

unsigned long int find_word_position_of_first_header_in_buffer(unsigned short int channel, unsigned long last_word_position_to_look_in_buffer) {
	unsigned long int index = 22222;
	if (last_word_position_to_look_in_buffer >= QUARTER_EVENT_BUFFER_SIZE_IN_WORDS) {
		last_word_position_to_look_in_buffer = QUARTER_EVENT_BUFFER_SIZE_IN_WORDS - 1;
	}
	for (unsigned long int i=0; i<=last_word_position_to_look_in_buffer; i++) {
		if (word_buffer[channel][i] == header) {
			index = i;
			if (index > 0) {
				char temp[256];
				sprintf(temp, " skipped ahead %ld words to find header;", index);
				error_string[channel] += temp;
			}
			return index;
		}
	}
	return index;
}

