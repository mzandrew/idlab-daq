#ifndef fiber_h
#define fiber_h

#include <string>
#include "pci.h"

#define SUGGESTED_NUMBER_OF_PARTS_IN_WHICH_TO_READ_EACH_QUARTER_EVENT (1.8)

#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS (1)
//#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS (1000000)
//#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_PARTIAL_QUARTER_EVENTS (10000)
//#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS (0)
#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_PARTIAL_QUARTER_EVENTS (0)

#define MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS (25067) // measured with readout_all_pending_data.cpp
#define MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES (MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
#define PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS (QUARTER_EVENT_SIZE_IN_WORDS/SUGGESTED_NUMBER_OF_PARTS_IN_WHICH_TO_READ_EACH_QUARTER_EVENT)
#define PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES (PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)

extern unsigned long int packet[NUMBER_OF_WORDS_IN_A_PACKET];
extern unsigned long int number_of_errors_for_this_quarter_event[NUMBER_OF_SCRODS_TO_READOUT];
extern unsigned long long int time_for_single_event_readout;
extern unsigned long int word_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_WORDS];
extern          char     byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];
extern unsigned long int number_of_bytes_read_so_far[NUMBER_OF_SCRODS_TO_READOUT];
extern unsigned long int total_number_of_errors;
extern string event_fiber_packet_string, info_string[NUMBER_OF_SCRODS_TO_READOUT], error_string[NUMBER_OF_SCRODS_TO_READOUT];
//extern int fd[NUMBER_OF_SCRODS_TO_READOUT]; // file descriptors for output datafiles
extern unsigned long int total_number_of_readout_events;
//extern char logprefix[100];                 // prefix of log files generated
extern string filename[NUMBER_OF_SCRODS_TO_READOUT];
extern bool files_are_open;
extern bool should_soft_trigger;
extern unsigned short int feedback_enables_and_goals[6];

#define NUMBER_OF_BYTES_TO_READ_AT_ONE_TIME (100256)
void readout_all_pending_data(void);

void reset_trigger_flip_flop(void);

int readout_an_event(bool should_not_return_until_at_least_some_data_comes_through);
void readout_N_events(unsigned long int N);
int open_files_for_output_and_read_N_events(unsigned long int N);
void open_files_for_all_enabled_fiber_channels(void);
void close_all_fiber_files(void);
void setup_filenames_for_fiber(void);
void wait_for_start_of_spill(void);
void wait_for_spill_to_finish(void);
bool spill_is_active(void);
void close_fiber_files_to_prepare_for_next_spill(void);
void open_fiber_files_to_prepare_for_next_spill(void);

#endif

