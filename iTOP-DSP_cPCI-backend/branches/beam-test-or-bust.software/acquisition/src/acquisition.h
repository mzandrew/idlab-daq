using namespace std;

#include <string>

void set_current_date_string(void);
bool file_exists (string filename);
void create_directory_if_necessary(string dirname);
void generate_new_base_filename(void);
void increment_spill_number(void);
void update_logfile_with_the_number_of_readout_events_for_this_spill_and_close_all_files(void);
void close_all_files(void);
void close_logfile(void);
void open_logfile(void);
void update_logfile_with_the_number_of_readout_events_for_this_spill(void);
void update_logfile_with_base_filename(void);
void setup_to_catch_ctrl_c(void (*callback)(void));
void caught_ctrl_c(int sig);
void setup_run_type(string type);

extern bool channel_enabled[4];
extern string location_of_raw_datafiles;
extern string location_of_status_and_log_files;
extern unsigned short int channel_bitmask;
extern unsigned short int experiment_number;
extern unsigned short int run_number;
extern unsigned short int spill_number;
extern unsigned long int event_number;
extern string current_date_string;
extern string base_filename;
extern ofstream logfile;
extern bool logfile_open;

extern unsigned short int threshold_scan_low_limit;
extern unsigned short int threshold_scan_high_limit;
extern unsigned short int threshold_scan_step_size;

