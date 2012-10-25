#include <iostream>
#include <fstream>
#include <string>

#include "crtdaq-globals.h" 

using namespace std;

struct timeval _g_tstart, _g_tend, _g_watchdog;

// Set in config_file.cpp
string         _g_fins_requested  = "";
string         _g_fibers_requested = "";
bool           _g_fins_enabled[4] = {0, 0, 0, 0};
int            _g_findev[4]       = {0, 0, 0, 0};
const char    *_g_findevpath[4]   = {"/dev/copper/cprdsp-fin:a",
				     "/dev/copper/cprdsp-fin:b",
				     "/dev/copper/cprdsp-fin:c",
				     "/dev/copper/cprdsp-fin:d"};
unsigned short _g_fin_bitmask     = 0;
string         _g_fiber_bitmask   = 0;

int            _g_nfins_enabled   = 0;
int            _g_nfibers_enabled = 0;

int            _g_nscrods_to_readout = 0; 

string         _g_location_of_raw_datafiles        = "/home/craigb/daqdbg/data";
string         _g_location_of_status_and_log_files = "/home/craigb/daqdbg/log";
string         _g_data_filename                    = "<unspecified>";
int            _g_data_fd                          = 0;
string         _g_camac_filename                   = "<unspecified>";
unsigned short _g_verbosity                        = 1;
signed short   _g_temperature_redline              = 40;
string         _g_run_type                         = "<unspecified>";

float         *_g_temperature_float                = NULL;

bool           _g_should_soft_trigger              = false;
unsigned int   _g_feedback_enables_and_goals[6]    = {0,0,0,0,0,0};

char _g_red[13], _g_yellow[13], _g_white[13];

unsigned short _g_threshold_scan_low_limit         = 1310;
unsigned short _g_threshold_scan_high_limit        = 2620;
unsigned short _g_threshold_scan_step_size         = 10;
string         _g_current_date_string              = "no_date";

int _g_run_number        = 1;
int _g_spill_number      = 1;
int _g_experiment_number = 1;
int _g_event_number      = 1;

int _g_number_of_readout_events_for_this_spill      = 0;
int _g_total_number_of_readout_events               = 0;
int _g_number_of_seconds_this_spill_has_been_active = 0;
int _g_number_of_seconds_since_last_event           = 0;

bool     _g_logfile_open     = false;
string   _g_logfile_filename = "logfile";
ofstream _g_logfile;
string   _g_base_filename    = "~/daqdbg/nov2012crt";

int         _g_copper_subsys = 0;
int         _g_copper_crate  = 0;
int         _g_copper_slot   = 0;
const char *_g_cprdevpath    = "/dev/copper/copper";
int         _g_cprdev        = 0;

// Filled in DebugInfoWarningError.cpp
FILE *_g_debug   = 0;
FILE *_g_debug2  = 0;
FILE *_g_info    = 0;
FILE *_g_warning = 0;
FILE *_g_error   = 0;

//struct DAC_settings_type _g_DAC_settings;
//char             *_g_command_packet       = new char[SINGLE_PACKET_BUFFER_SIZE_IN_BYTES];
// unsigned long     _g_packet_header        = 0;
// unsigned long     _g_protocol_freeze_date = 0;
// unsigned long     _g_packet_footer        = 0;
// unsigned long     _g_packet_type[NUMBER_OF_PACKET_TYPES];


void crtdaq_default_ctrl_c_handler() {
  cerr << "SIGINT received, exiting without flushing buffers" << endl;
  exit(13);
}

void (*_g_call_this_on_ctrl_c)(void) = crtdaq_default_ctrl_c_handler;

void crtdaq_dump_globals() {
  cout << "\t_g_fins_enabled = {"
       << _g_fins_enabled[0] << ", "
       << _g_fins_enabled[1] << ", "
       << _g_fins_enabled[2] << ", "
       << _g_fins_enabled[3] << "}" << endl;
  cout << "\t_g_fin_bitmask = " << _g_fin_bitmask << endl;


  cout << "\t_g_location_of_raw_datafiles = "
       << _g_location_of_raw_datafiles << endl;
  cout << "\t_g_location_of_status_and_log_files = "
       << _g_location_of_status_and_log_files << endl;
  cout << "\t_g_fin_bitmask = "
       << _g_fin_bitmask << endl;
  cout << "\t_g_verbosity = "
       << _g_verbosity << endl;
  cout << "\t_g_temperature_redline = "
       << _g_temperature_redline << endl;

  cout << "\t_g_threshold_scan_low_limit = "
       << _g_threshold_scan_low_limit << endl;
  cout << "\t_g_threshold_scan_high_limit = "
       << _g_threshold_scan_high_limit << endl;
  cout << "\t_g_threshold_scan_step_size = "
       << _g_threshold_scan_step_size << endl;
  cout << "\t_g_current_date_string = "
       << _g_current_date_string << endl;

  cout << "\t_g_run_number = "
       << _g_run_number << endl;
  cout << "\t_g_spill_number = "
       << _g_spill_number << endl;
  cout << "\t_g_experiment_number = "
       << _g_experiment_number << endl;
  cout << "\t_g_event_number = "
       << _g_event_number << endl;

  cout << "\t_g_number_of_readout_events_for_this_spill = "
       << _g_number_of_readout_events_for_this_spill << endl;
  cout << "\t_g_run_type = "
       << _g_run_type << endl;

  cout << "\t_g_logfile_open = "
       << _g_logfile_open << endl;
  cout << "\t_g_logfile_filename = "
       << _g_logfile_filename << endl;
  cout << "\t_g_logfile = "
       << _g_logfile << endl;;
  cout << "\t_g_base_filename = "
       << _g_base_filename << endl;

  cout << "\t_g_cprdevpath = "
       << _g_cprdevpath << endl;
  cout << "\t_g_cprdev = "
       << _g_cprdev << endl;

  cout << "\t_g_debug = "
       << _g_debug << endl;
  cout << "\t_g_debug = "
       << _g_debug << endl;
  cout << "\t_g_info = "
       << _g_info << endl;
  cout << "\t_g_warning = "
       << _g_warning << endl;
  cout << "\t_g_error = "
       << _g_error << endl;



}
