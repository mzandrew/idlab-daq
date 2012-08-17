using namespace std;

#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>
#include "pci.h"
#include "parse_config_file.h"
#include "acquisition.h"
#include "DebugInfoWarningError.h"

void enable_channels_for_DSP_cPCI_card(string channels, int card) {
	for (int i=0; i<=3; i++) {
		channel_enabled[i] = false;
	}
	if (channels.find('0') != string::npos) { channel_enabled[0] = true; }
	if (channels.find('1') != string::npos) { channel_enabled[1] = true; }
	if (channels.find('2') != string::npos) { channel_enabled[2] = true; }
	if (channels.find('3') != string::npos) { channel_enabled[3] = true; }
	for (int i=0; i<=3; i++) {
		if (channel_enabled[i]) {
			//cout << "channel " << i << " is enabled" << endl;
			fprintf(debug, "channel %d is enbled\n", i);
		}
	}
	channel_bitmask = 0;
	for(int i=0; i<=3; i++) {
		if (channel_enabled[i]) {
			channel_bitmask |= 1<<i;
		}
	}
}

int parse_config_file(string filename) {
	setup_DebugInfoWarningError();
	ifstream config_file(filename.c_str());
	if (!config_file) {
		//cout << "Could not open config file \"" << filename.c_str() << "\"" << endl;
		fprintf(error, "Could not open config file \"%s\"\n", filename.c_str());
		return 1;
	}

	// the following part was borrowed from http://www.adp-gmbh.ch/cpp/config_file.html
	string line, key, value;
	int first_equals_sign_position;
#define MAX_STRING_LENGTH (200)
	while (config_file) {
		getline(config_file, line);
		if (! line.length()) { continue; }
		if (line[0] == '#') { continue; }
		first_equals_sign_position = line.find('=');
		if (first_equals_sign_position == string::npos) { continue; }
		key   = line.substr(0, first_equals_sign_position);
		value = line.substr(first_equals_sign_position+1);
//		cout << "key[" << key << "] value[" << value << "]" << endl;
		if (!strncmp(key.c_str(), "channels", MAX_STRING_LENGTH)) {
			string channels = value;
			//cout << "setting channels to " << channels << endl;
			enable_channels_for_DSP_cPCI_card(channels, card_id); // dummy card # here
		} else if (!strncmp(key.c_str(), "card", MAX_STRING_LENGTH)) {
			card_id = atoi(value.c_str());
			//cout << "acquiring data from card " << card_id << endl;
			fprintf(debug, "acquiring data from card %d\n", card_id);
		} else if (!strncmp(key.c_str(), "dsp", MAX_STRING_LENGTH)) {
//			cout << "DSP!!!" << endl;
		} else if (!strncmp(key.c_str(), "cPCI", 4)) {
//			cout << "cPCI!!!" << endl;
		} else if (!strncmp(key.c_str(), "DSP_cPCI", 8)) {
			int first_square_bracket_position = key.find('[');
			if (first_square_bracket_position == string::npos) { continue; }
			string card_string = key.substr(first_square_bracket_position+1);
			int card = atoi(card_string.c_str());
//			DSP_cPCI[card] = atoi(value.c_str());
//			cout << "!!!acquiring data from card " << card << endl;
			string channels = value;
			//cout << "setting channels to " << channels << endl;
//			enable_channels_for_DSP_cPCI_card(channels, card);
		} else if (!strncmp(key.c_str(), "location_of_raw_datafiles", MAX_STRING_LENGTH)) {
			location_of_raw_datafiles = value;
			//cout << "location to store raw datafiles: \"" << location_of_raw_datafiles << "\"" << endl;
			fprintf(debug, "location to store raw datafiles = \"%s\"\n", location_of_raw_datafiles.c_str());
		} else if (!strncmp(key.c_str(), "location_of_status_and_log_files", MAX_STRING_LENGTH)) {
			location_of_status_and_log_files = value;
//		} else if (!strncmp(key.c_str(), "", MAX_STRING_LENGTH)) {
		} else if (!strncmp(key.c_str(), "threshold_scan_low_limit", MAX_STRING_LENGTH)) {
			threshold_scan_low_limit = atoi(value.c_str());
		} else if (!strncmp(key.c_str(), "threshold_scan_high_limit", MAX_STRING_LENGTH)) {
			threshold_scan_high_limit = atoi(value.c_str());
		} else if (!strncmp(key.c_str(), "threshold_scan_step_size", MAX_STRING_LENGTH)) {
			threshold_scan_step_size = atoi(value.c_str());
		} else if (!strncmp(key.c_str(), "verbosity", MAX_STRING_LENGTH)) {
			verbosity = atoi(value.c_str());
		} else if (!strncmp(key.c_str(), "temperature_redline", MAX_STRING_LENGTH)) {
			temperature_redline = atoi(value.c_str());
		} else {
			//cout << "unhandled key/value pair in config file: " << key.c_str() << " = " << value.c_str() << endl;
			fprintf(debug, "unhandled key/value pair in config file: \"%s\" = \"%s\"\n", key.c_str(), value.c_str());
		}
	}
	setup_DebugInfoWarningError();
}

