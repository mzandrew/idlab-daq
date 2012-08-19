using namespace std;

#include <string>
#include "DebugInfoWarningError.h"
#include "generic.h"

#define NUMBER_OF_SPACES_TO_RESERVE_FOR_EVENT_NUMBER_CONSOLE_OUTPUT (4)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER (2)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_RUN_NUMBER        (3)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_SPILL_NUMBER      (3)

string experiment_number_string(void);
void generate_new_base_filename(void);
void increment_spill_number(void);
void update_logfile_with_the_number_of_readout_events_for_this_spill_and_close_all_files(void);
void graceful_exit(void);
void close_all_files(void);
void close_logfile(void);
void open_logfile(void);
void update_logfile_with_the_number_of_readout_events_for_this_spill(void);
void update_logfile_with_base_filename(void);
void setup_to_catch_ctrl_c(void (*callback)(void) = graceful_exit);
void caught_ctrl_c(int sig);
void setup_run_type(string type);
void setup_for_console_output(void);
void wait_for_all_links_to_come_up(unsigned short int bitmask);

extern bool channel_enabled[4];
extern string location_of_raw_datafiles;
extern string location_of_status_and_log_files;
extern unsigned short int channel_bitmask;
extern unsigned short int experiment_number;
extern unsigned short int run_number;
extern unsigned short int spill_number;
extern unsigned long int event_number;
extern string base_filename;
extern ofstream logfile;
extern bool logfile_open;
extern unsigned short int verbosity;
extern signed short int temperature_redline;

extern unsigned short int threshold_scan_low_limit;
extern unsigned short int threshold_scan_high_limit;
extern unsigned short int threshold_scan_step_size;
extern char red[13], yellow[13], white[13];

