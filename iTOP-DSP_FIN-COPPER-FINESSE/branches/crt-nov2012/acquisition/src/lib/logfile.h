#ifndef LOGFILE_H_
#define LOGFILE_H_

void close_logfile(void);
void close_all_files(void);
void update_logfile_with_the_number_of_readout_events_for_this_spill(void);
void update_logfile_with_the_number_of_readout_events_for_this_spill_and_close_all_files(void);
void graceful_exit(void);
void open_logfile(void);
void update_logfile_with_base_filename(void);
string experiment_number_string(void);

#endif //LOGFILE_H_
