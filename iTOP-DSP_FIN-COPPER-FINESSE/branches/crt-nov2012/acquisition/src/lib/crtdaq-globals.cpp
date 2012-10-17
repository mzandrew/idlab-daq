#include <string>

using namespace std;

struct timeval _g_start, _g_end, _g_watchdog;

// Set in config_file.cpp
bool           _g_fins_enabled[4];
string         _g_location_of_raw_datafiles;
string         _g_location_of_status_and_log_files;
unsigned short _g_fin_bitmask;
unsigned short _g_verbosity;
signed short   _g_temperature_redline;
unsigned short _g_threshold_scan_low_limit;
unsigned short _g_threshold_scan_high_limit;
unsigned short _g_threshold_scan_step_size;
string         _g_current_date_string;

char*    _g_cprdevpath = "/dev/copper/copper";
int      _g_cprfd;

// Filled in DebugInfoWarningError.cpp
FILE *_g_debug;
FILE *_g_debug2;
FILE *_g_info;
FILE *_g_warning;
FILE *_g_error;
