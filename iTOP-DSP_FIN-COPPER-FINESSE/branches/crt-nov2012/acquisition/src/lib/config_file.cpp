using namespace std;

#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>

#include "crtdaq-globals.h"
#include "config_file.h"
#include "cprdsp-fin-daq.h"
#include "DebugInfoWarningError.h"

void set_enabled_fins(const string& fins) {
  for (int i=0; i<=3; i++) {
    _g_fins_enabled[i] = false;
  }
  if (fins.find('0') != string::npos) { _g_fins_enabled[0] = true; }
  if (fins.find('1') != string::npos) { _g_fins_enabled[1] = true; }
  if (fins.find('2') != string::npos) { _g_fins_enabled[2] = true; }
  if (fins.find('3') != string::npos) { _g_fins_enabled[3] = true; }

  int cprfin_bitmask = cprdsp_fin_daq_enabled_fins();
  _g_fin_bitmask = 0;  
  
  for(int i=0; i<=3; i++) {
    if (!_g_fins_enabled[i])
      continue;

    _g_fin_bitmask |= 1<<i;      
    
    if (((cprfin_bitmask >> i) & 0x1 == 0) && 
	(_g_fin_bitmask & 0x1 == 1))
      {
	fprintf(_g_error, "Request received in config file to enable"
		" FIN %d, but this card is not enabled in the"
		" `copper' driver configuration\n", i);
	abort();
      }	  
  }      
}

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

    if (key == "fins") {
      set_enabled_fins(value);
    } 
    
    else if (key == "dsp") {
      // Need something here.
    } 
    
    else if (key == "location_of_raw_datafiles") {
      _g_location_of_raw_datafiles = value;
      fprintf(_g_debug, "location to store raw datafiles = \"%s\"\n", 
	      _g_location_of_raw_datafiles.c_str());
    } 

    else if (key == "location_of_status_and_log_files") {
      _g_location_of_status_and_log_files = value;
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

