using namespace std;

//#include <stdio.h>
//#include <string.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>
#include "pci.h"
#include "parse_config_file.h"
#include "acquisition.h"

int parse_config_file(string filename) {
	ifstream config_file(filename.c_str());
	if (!config_file) {
		cout << "Could not open config file \"" << filename.c_str() << "\"" << endl;
		return 1;
	}

	// the following part was borrowed from http://www.adp-gmbh.ch/cpp/config_file.html
	string line, key, value;
	int first_equals_sign_position;
#define MAX_STRING_LENGTH (200)
	while (config_file) {
		getline(config_file, line);
		if (! line.length()) continue;
		if (line[0] == '#') continue;
		first_equals_sign_position = line.find('=');
		key   = line.substr(0, first_equals_sign_position);
		value = line.substr(first_equals_sign_position+1);
		if (!strncmp(key.c_str(), "channels", MAX_STRING_LENGTH)) {
			string channels = value;
			//cout << "setting channels to " << channels << endl;
			for (int i=0; i<=3; i++) {
				channel_enabled[i] = false;
			}
			if (channels.find('0') != string::npos) { channel_enabled[0] = true; }
			if (channels.find('1') != string::npos) { channel_enabled[1] = true; }
			if (channels.find('2') != string::npos) { channel_enabled[2] = true; }
			if (channels.find('3') != string::npos) { channel_enabled[3] = true; }
			for (int i=0; i<=3; i++) {
				if (channel_enabled[i]) { cout << "channel " << i << " is enabled" << endl; }
			}
			channel_bitmask = 0;
			for(int i=0; i<=3; i++) {
				if (channel_enabled[i]) {
					channel_bitmask |= 1<<i;
				}
			}
		} else if (!strncmp(key.c_str(), "card", MAX_STRING_LENGTH)) {
			card_id = atoi(value.c_str());
			cout << "acquiring data from card " << card_id << endl;
		} else if (!strncmp(key.c_str(), "location_of_raw_datafiles", MAX_STRING_LENGTH)) {
			location_of_raw_datafiles = value;
			cout << "location to store raw datafiles: \"" << location_of_raw_datafiles << "\"" << endl;
		} else if (!strncmp(key.c_str(), "location_of_status_and_log_files", MAX_STRING_LENGTH)) {
			location_of_status_and_log_files = value;
//		} else if (!strncmp(key.c_str(), "", MAX_STRING_LENGTH)) {
		} else {
			cout << "unhandled key/value pair: " << key.c_str() << " = " << value.c_str() << endl;
		}
	}
}



