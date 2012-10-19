using namespace std;

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

#include "crtdaq-globals.h"
#include "config_file.h"
#include "generic.h"
#include "DebugInfoWarningError.h"


fstream status_file;
string status_file_line[200];
string status_filename;
bool status_file_is_open = false;
int number_of_lines_in_status_file;

void open_status_file_for_reading_and_writing(void) {
  if (!status_file_is_open) {
    status_filename = _g_location_of_status_and_log_files;
    create_directory_if_necessary(status_filename.c_str());
    //          status_filename += "/";
    //          status_filename += _g_experiment_number_string();
    //          create_directory_if_necessary(status_filename.c_str());
    status_filename += "/status";

    status_file.open(status_filename.c_str(), fstream::in | fstream::out);
    if (!status_file) {
      status_file.close();
      status_file.clear();
      
      if (access( status_filename.c_str(), F_OK ) < 0) {
	if (_g_warning)
	  fprintf(_g_warning, 
		  "Cannot find status file `%s'; creating new one\n",
		  status_filename.c_str());

	ofstream temp(status_filename.c_str());
	set_current_date_string();
	temp << "# status file generated at " << _g_current_date_string << endl;
	temp << "experiment_number=" << _g_experiment_number << endl;
	temp << "run_number=" << _g_run_number << endl;
	temp << "spill_number=" << _g_spill_number << endl;
	temp << "event_number=" << _g_event_number << endl;
	temp.close();
	open_status_file_for_reading_and_writing();
      } 
      else {
	cerr << "Status file `" << status_filename 
	     << "' exists but cannot be opened" << endl;
	exit(12);
      }
    }        
  }
}

void write_status_file(void) {
  status_file.clear();
  status_file.seekg(0, fstream::beg);
  int position;
  string key, value;
  for (int i=0; i<number_of_lines_in_status_file; i++) {
    if (status_file_line[i].length() && status_file_line[i][0] != '#') {
      position = status_file_line[i].find('=');

      if (position == string::npos)
	continue;

      if (position<200) {
        key   = status_file_line[i].substr(0, position);
        value = status_file_line[i].substr(position+1);
        if (key == "experiment_number") {
          ostringstream temp;
          temp << _g_experiment_number;
          value = temp.str();
        } 

	else if (key == "run_number") {
          ostringstream temp;
          temp << _g_run_number;
          value = temp.str();
        } 

	else if (key == "spill_number") {
          ostringstream temp;
          temp << _g_spill_number;
          value = temp.str();
        } 

	else if (key == "event_number") {
          ostringstream temp;
          temp << _g_event_number;

          value = temp.str();
        }

        status_file_line[i] = key;
        status_file_line[i] += "=";
        status_file_line[i] += value;
      }
    }
    status_file << status_file_line[i] << endl;
  }
  status_file.seekg(0, fstream::beg);
  status_file.clear();
}

void read_status_file(void) {
  status_file.seekg(0, fstream::beg); // beggin' strips:  "it's bacon!"
  status_file.clear();
  string line, key, value;
  int first_equals_sign_position;
  int i = 0;
  while (status_file) {
    getline(status_file, line);
    status_file_line[i] = line;
    i++;

    if (! line.length()) 
      continue;

    if (line[0] == '#') 
      continue;

    first_equals_sign_position = line.find('=');
    if (first_equals_sign_position == string::npos)
      continue; 

    key   = line.substr(0, first_equals_sign_position);
    value = line.substr(first_equals_sign_position+1);

    if (key == "experiment_number") {
      _g_experiment_number = atoi(value.c_str());
      fprintf(_g_debug, "setting _g_experiment_number to %d\n", 
	      _g_experiment_number);
    } 
    
    else if (key == "run_number") {
      _g_run_number = atoi(value.c_str());
      fprintf(_g_debug, "setting run_number to %d\n", _g_run_number);
    } 

    else if (key == "spill_number") {
      _g_spill_number = atoi(value.c_str());
      fprintf(_g_debug, "setting _g_spill_number to %d\n", _g_spill_number);
    } 

    else if (key == "event_number") {
      _g_event_number = atoi(value.c_str());
      fprintf(_g_debug, "setting _g_event_number to %ld\n", _g_event_number);
    } 

    else {
      fprintf(_g_debug, 
	      "unhandled key/value pair in config file: \"%s\" = \"%s\"\n", 
	      key.c_str(), value.c_str());
    }
  } // dogs don't know it's not bacon.

  number_of_lines_in_status_file = i-1;
  fprintf(_g_debug, "number of lines in status file: %d\n", 
	  number_of_lines_in_status_file);
  status_file.seekg(0, fstream::beg);
  status_file.clear();
}

