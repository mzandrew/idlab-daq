#ifndef CRTDAQ_GLOBALS_H_
#define CRTDAQ_GLOBALS_H_

#include <string>

using namespace std;

extern struct timeval _g_start, _g_end, _g_watchdog;

// Set in config_file.cpp
extern bool           _g_fins_enabled[4];
extern string         _g_location_of_raw_datafiles;
extern string         _g_location_of_status_and_log_files;
extern unsigned short _g_fin_bitmask;
extern unsigned short _g_verbosity;
extern signed short   _g_temperature_redline;
extern unsigned short _g_threshold_scan_low_limit;
extern unsigned short _g_threshold_scan_high_limit;
extern unsigned short _g_threshold_scan_step_size;
extern string         _g_current_date_string;


// Filled in DebugInfoWarningError.cpp
extern FILE *_g_debug;
extern FILE *_g_debug2;
extern FILE *_g_info;
extern FILE *_g_warning;
extern FILE *_g_error;

extern const char* _g_cprdevpath;
extern int         _g_cprfd;      // Assigned in cprdsp-fin-daq.cpp


#endif //CRTDAQ_GLOBALS_H_
