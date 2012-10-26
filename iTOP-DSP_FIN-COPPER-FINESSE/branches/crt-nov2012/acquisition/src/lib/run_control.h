#ifndef RUN_CONTROL_H_
#define RUN_CONTROL_H_

void wait_for_all_links_to_come_up(const string& fibers_reqd);
void readout_all_pending_data();
void setup_filenames_for_data();
void setup_run_type(const string& run_type);
void open_data_file();
void start_timer(void);
void increment_spill_number();
void open_data_file_to_prepare_for_next_spill();
void close_data_file();
void show_temps();
int stop_timer_in_seconds();
int watchdog_timer_in_seconds();
bool readout_an_event(bool block);
void close_data_file_to_prepare_for_next_spill();

#endif // RUN_CONTROL_H_

