#include <fstream>
#include <iostream>

using namespace std;

#include "crtdaq-globals.h"
#include "cprdaq.h"
#include "generic.h"


void close_logfile(void) {
  if (_g_logfile_open) {
    //cout << "closing logfile" << endl;
    fprintf(_g_debug, "closing logfile\n");
    _g_logfile << endl << flush;
    _g_logfile.close();
  }
  _g_logfile_open = false;
}


void update_logfile_with_the_number_of_readout_events_for_this_spill(void) {
  if (_g_logfile_open) {
    _g_logfile << _g_number_of_readout_events_for_this_spill
               << " " << _g_run_type << endl << flush;
  }
}

string experiment_number_string(void) {
  string expNN = "exp";
  char temp[6];
  sprintf(temp, "%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER, 
	  _g_experiment_number);
  expNN += temp;
  return expNN;
}


void open_logfile(void) {
  if (!_g_logfile_open) {
    //cout << "opening logfile" << endl;
    _g_logfile_filename = _g_location_of_status_and_log_files;
    create_directory_if_necessary(_g_logfile_filename.c_str());
    _g_logfile_filename += "/";
    _g_logfile_filename += experiment_number_string();
    create_directory_if_necessary(_g_logfile_filename.c_str());
    _g_logfile_filename += "/logfile";
    _g_logfile.open(_g_logfile_filename.c_str(), fstream::app);
    if (_g_logfile) {
      _g_logfile_open = true;
      _g_logfile << endl << flush;
      fprintf(_g_debug, "logfile `%s' opened\n", _g_logfile_filename.c_str());
    } else {
      fprintf(_g_error, "ERROR opening logfile %s\n", _g_logfile_filename.c_str());
      _g_logfile_open = false;
    }
  }
}

void update_logfile_with_base_filename(void) {
  if (_g_logfile_open) {
    _g_logfile << _g_base_filename << " " << flush;
  }
}

