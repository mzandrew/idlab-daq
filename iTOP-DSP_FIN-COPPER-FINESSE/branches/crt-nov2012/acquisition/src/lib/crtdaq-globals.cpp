#include <string>

using namespace std;

struct timeval _g_start, _g_end, _g_watchdog;

// Set in config_file.cpp
bool           _g_fins_enabled[4]                  = {0, 0, 0, 0};
string         _g_location_of_raw_datafiles        = ".";
string         _g_location_of_status_and_log_files = ".";
unsigned short _g_fin_bitmask                      = 0;
unsigned short _g_verbosity                        = 1; 
signed short   _g_temperature_redline              = 40;

unsigned short _g_threshold_scan_low_limit         = 1310;
unsigned short _g_threshold_scan_high_limit        = 2620;
unsigned short _g_threshold_scan_step_size         = 10;
string         _g_current_date_string              = "no_date";

char*    _g_cprdevpath = "/dev/copper/copper";
int      _g_cprfd      = 0;

// Filled in DebugInfoWarningError.cpp
FILE *_g_debug   = 0;
FILE *_g_debug2  = 0;
FILE *_g_info    = 0;
FILE *_g_warning = 0;
FILE *_g_error   = 0;
