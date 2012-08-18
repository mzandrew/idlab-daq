using namespace std;

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <string.h>
#include <stdlib.h>
#include "acquisition.h"
#include "config_file.h"
#include "DebugInfoWarningError.h"

fstream status_file;
string status_file_line[200];
string status_filename;
bool status_file_is_open = false;
int number_of_lines_in_status_file;

void open_status_file_for_reading_and_writing(void) {
	if (!status_file_is_open) {
		status_filename = location_of_status_and_log_files;
		create_directory_if_necessary(status_filename.c_str());
//		status_filename += "/";
//		status_filename += experiment_number_string();
//		create_directory_if_necessary(status_filename.c_str());
		status_filename += "/status";
		status_file.open(status_filename.c_str(), fstream::in | fstream::out);
		if (!status_file) {
			cerr << "ERROR:  cannot find status file in destination directory \"" << location_of_status_and_log_files << "\"" << endl;
			exit(12);
		}
	}
}

void write_status_file(void) {
	status_file.clear();
	status_file.seekg(0, fstream::beg);
//			cout << "experiment_number = " << experiment_number << endl;
//			cout << "run_number = " << run_number << endl;
//			cout << "spill_number = " << spill_number << endl;
	int position;
	string key, value;
	for (int i=0; i<number_of_lines_in_status_file; i++) {
		if (status_file_line[i].length() && status_file_line[i][0] != '#') {
			position = status_file_line[i].find('=');
			if (position == string::npos) { continue; }
			if (position<200) {
				key   = status_file_line[i].substr(0, position);
				value = status_file_line[i].substr(position+1);
				if (!strncmp(key.c_str(), "experiment_number", 45)) {
//					char temp[256];
//					sprintf(temp, "%d", experiment_number);
					ostringstream temp;
//					cout << experiment_number;
					temp << experiment_number;
					value = temp.str();
				} else if (!strncmp(key.c_str(), "run_number", 45)) {
//					char temp[256];
//					sprintf(temp, "%d", run_number);
//					value = temp;
					ostringstream temp;
//					cout << run_number;
					temp << run_number;
					value = temp.str();
				} else if (!strncmp(key.c_str(), "spill_number", 45)) {
//					char temp[256];
//					sprintf(temp, "%d", spill_number);
//					value = temp;
					ostringstream temp;
//					cout << spill_number;
					temp << spill_number;
//					cout << "temp: : << temp << endl;
					value = temp.str();
				} else if (!strncmp(key.c_str(), "event_number", 45)) {
//					char temp[256];
//					sprintf(temp, "%d", event_number);
//					value = temp;
					ostringstream temp;
//					cout << event_number;
					temp << event_number;
//					cout << "temp: : << temp << endl;
					value = temp.str();
				}
				status_file_line[i] = key;
				status_file_line[i] += "=";
				status_file_line[i] += value;
			}
		}
		status_file << status_file_line[i] << endl;
	}
//			cout << "experiment_number = " << experiment_number << endl;
//			cout << "run_number = " << run_number << endl;
//			cout << "spill_number = " << spill_number << endl;
	status_file.seekg(0, fstream::beg);
	status_file.clear();
//	status_file.close();
//			cout << "experiment_number = " << experiment_number << endl;
//			cout << "run_number = " << run_number << endl;
//			cout << "spill_number = " << spill_number << endl;
}

void read_status_file(void) {
	status_file.seekg(0, fstream::beg); // beggin' strips:  "it's bacon!"
	status_file.clear();
	string line, key, value;
	int first_equals_sign_position;
#define MAX_STRING_LENGTH (200)
	int i = 0;
	while (status_file) {
		getline(status_file, line);
		status_file_line[i] = line;
		i++;
		if (! line.length()) continue;
		if (line[0] == '#') continue;
		first_equals_sign_position = line.find('=');
		if (first_equals_sign_position == string::npos) { continue; }
		key   = line.substr(0, first_equals_sign_position);
		value = line.substr(first_equals_sign_position+1);
		if (!strncmp(key.c_str(), "experiment_number", MAX_STRING_LENGTH)) {
			experiment_number = atoi(value.c_str());
			//cout << "setting experiment_number to " << experiment_number << endl;
			fprintf(debug, "setting experiment_number to %d", experiment_number);
		} else if (!strncmp(key.c_str(), "run_number", MAX_STRING_LENGTH)) {
			run_number = atoi(value.c_str());
			//cout << "setting run_number to " << run_number << endl;
			fprintf(debug, "setting run_number to %d", run_number);
		} else if (!strncmp(key.c_str(), "spill_number", MAX_STRING_LENGTH)) {
			spill_number = atoi(value.c_str());
			//cout << "setting spill_number to " << spill_number << endl;
			fprintf(debug, "setting spill_number to %d", spill_number);
		} else if (!strncmp(key.c_str(), "event_number", MAX_STRING_LENGTH)) {
			event_number = atoi(value.c_str());
			//cout << "setting event_number to " << event_number << endl;
			fprintf(debug, "setting event_number to %d", event_number);
//		} else if (!strncmp(key.c_str(), "", MAX_STRING_LENGTH)) {
		} else {
			//cout << "unhandled key/value pair: " << key.c_str() << " = " << value.c_str() << endl;
			fprintf(debug, "unhandled key/value pair in config file: \"%s\" = \"%s\"\n", key.c_str(), value.c_str());
		}
	} // dogs don't know it's not bacon.
	//run_number++;
	number_of_lines_in_status_file = i-1;
	fprintf(debug, "number of lines in status file: %d\n", number_of_lines_in_status_file);
	status_file.seekg(0, fstream::beg);
	status_file.clear();
//	status_file.close();
}

