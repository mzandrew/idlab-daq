#ifndef CRTDAQ_GLOBALS_H_
#define CRTDAQ_GLOBALS_H_

#include <string>

using namespace std;


#define NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER           (2)
#define MAXNFIN 4


extern struct timeval _g_start, _g_end, _g_watchdog;

// Set in config_file.cpp
extern string         _g_fins_requested;
extern bool           _g_fins_enabled[MAXNFIN];
extern int            _g_findev[MAXNFIN];
extern const char*    _g_findevpath[MAXNFIN];
extern unsigned short _g_fin_bitmask;

extern string         _g_location_of_raw_datafiles;
extern string         _g_location_of_status_and_log_files;
extern string         _g_base_filename;
extern string         _g_data_filename;
extern int            _g_data_fd;
extern string         _g_camac_filename;
extern string         _g_run_type;
extern unsigned short _g_verbosity;
extern signed short   _g_temperature_redline;

extern char _g_red[13];
extern char _g_yellow[13];
extern char _g_white[13];

extern unsigned short _g_threshold_scan_low_limit;
extern unsigned short _g_threshold_scan_high_limit;
extern unsigned short _g_threshold_scan_step_size;
extern string         _g_current_date_string;

extern int _g_run_number;
extern int _g_spill_number;
extern int _g_experiment_number;
extern int _g_event_number;

extern int _g_number_of_readout_events_for_this_spill;


extern bool _g_logfile_open;
extern string _g_logfile_filename;
extern ofstream _g_logfile;

// Filled in DebugInfoWarningError.cpp
extern FILE *_g_debug;
extern FILE *_g_debug2;
extern FILE *_g_info;
extern FILE *_g_warning;
extern FILE *_g_error;

extern const char* _g_cprdevpath;
extern int         _g_cprdev;      // Assigned in cprdsp-fin-daq.cpp

extern void (*_g_call_this_on_ctrl_c)(void); 

void crtdaq_default_ctrl_c_handler();
void crtdaq_dump_globals();


#endif //CRTDAQ_GLOBALS_H_
