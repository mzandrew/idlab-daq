using namespace std;

#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>

#include "crtdaq-globals.h"
#include "config_file.h"
#include "cprdaq.h"
#include "generic.h"
#include "DebugInfoWarningError.h"

int parse_config_file(string filename) {
  setup_DebugInfoWarningError();
  ifstream config_file(filename.c_str());
  if (!config_file) {
    fprintf(_g_error, "Could not open config file \"%s\"\n", filename.c_str());
    return 1;
  }

  string line, key, value;
  int first_equals_sign_position;
  while (config_file) {
    getline(config_file, line);

    if (! line.length())  
      continue;

    if (line[0] == '#') 
      continue; 

    first_equals_sign_position = line.find('=');
    if (first_equals_sign_position == string::npos) 
      continue; 

    key   = line.substr(0, first_equals_sign_position);
    value = line.substr(first_equals_sign_position+1);

    if (key == "fins") 
      _g_fins_requested = tolower(mytrim(value));
        
    else if (key == "fibers") 
      _g_fibers_requested = tolower(mytrim(value));
    
    else if (key == "dsp") {
    } 
    
    else if (key == "location_of_raw_datafiles") {
      _g_location_of_raw_datafiles = mytrim(value);
      fprintf(_g_debug, "location to store raw datafiles = \"%s\"\n", 
	      _g_location_of_raw_datafiles.c_str());
    } 

    else if (key == "location_of_status_and_log_files") {
      _g_location_of_status_and_log_files = mytrim(value);
    } 

    else if (key == "threshold_scan_low_limit") {
      _g_threshold_scan_low_limit = atoi(value.c_str());
    } 
    
    else if (key == "threshold_scan_high_limit") {
      _g_threshold_scan_high_limit = atoi(value.c_str());
    } 

    else if (key == "threshold_scan_step_size") {
      _g_threshold_scan_step_size = atoi(value.c_str());
    } 
    
    else if (key == "verbosity") {
      _g_verbosity = atoi(value.c_str());
    } 

    else if (key == "temperature_redline") {
      _g_temperature_redline = atoi(value.c_str());
    } 

    else {
      fprintf(_g_debug, 
	      "unhandled key/value pair in config file: \"%s\" = \"%s\"\n", 
	      key.c_str(), value.c_str());
    }
  }
  setup_DebugInfoWarningError();
}

