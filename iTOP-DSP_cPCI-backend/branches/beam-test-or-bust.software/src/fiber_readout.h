#ifndef fiber_readout
#define fiber_readout

#include <string>

// defined here so there aren't a bunch of magic fours hanging around in the code:
#define NUMBER_OF_BYTES_IN_A_WORD (4)

// configuration input for our system:
#define NUMBER_OF_WORDS_IN_A_PACKET (140)
#define NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT (132)
#define NUMBER_OF_SCRODS_TO_READOUT (4)
#define SUGGESTED_NUMBER_OF_PARTS_IN_WHICH_TO_READ_EACH_QUARTER_EVENT (1.8)

#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS (1)
//#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_PARTIAL_QUARTER_EVENTS (10000)
//#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS (0)
#define NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_PARTIAL_QUARTER_EVENTS (0)

// calculated (values in units of BYTES are calculated from those given in WORDS):
#define QUARTER_EVENT_SIZE_IN_WORDS (NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT)
#define QUARTER_EVENT_SIZE_IN_BYTES (QUARTER_EVENT_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
#define WHOLE_EVENT_SIZE_IN_WORDS (NUMBER_OF_SCRODS_TO_READOUT*QUARTER_EVENT_SIZE_IN_BYTES)
#define WHOLE_EVENT_SIZE_IN_BYTES (WHOLE_EVENT_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
#define MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS (25067) // measured with readout_all_pending_data.cpp
#define MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES (MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
#define PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS (QUARTER_EVENT_SIZE_IN_WORDS/SUGGESTED_NUMBER_OF_PARTS_IN_WHICH_TO_READ_EACH_QUARTER_EVENT)
#define PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES (PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)

#define QUARTER_EVENT_BUFFER_SIZE_IN_WORDS (22000)
#define QUARTER_EVENT_BUFFER_SIZE_IN_BYTES (QUARTER_EVENT_BUFFER_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)

#define SINGLE_PACKET_BUFFER_SIZE_IN_BYTES (NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD)

#define PACKET_HEADER_INDEX (0)
#define PACKET_SIZE_INDEX (1)
#define PACKET_PROTOCOL_FREEZE_DATE_INDEX (2)
#define PACKET_TYPE_INDEX (3)
#define EVENT_NUMBER_INDEX (4)
#define PACKET_NUMBER_INDEX (5)
#define PACKET_CHECKSUM_INDEX (NUMBER_OF_WORDS_IN_A_PACKET-2)
#define PACKET_FOOTER_INDEX (NUMBER_OF_WORDS_IN_A_PACKET-1)

extern unsigned long int packet[NUMBER_OF_WORDS_IN_A_PACKET];
extern unsigned long int number_of_errors_for_this_quarter_event[NUMBER_OF_SCRODS_TO_READOUT];
extern unsigned long int event_number;
extern unsigned long long int time_for_single_event_readout;
extern unsigned long int word_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_WORDS];
extern          char     byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];
extern unsigned long int number_of_bytes_read_so_far[NUMBER_OF_SCRODS_TO_READOUT];
extern unsigned long int total_number_of_errors;
extern string event_fiber_packet_string, info_string[NUMBER_OF_SCRODS_TO_READOUT], error_string[NUMBER_OF_SCRODS_TO_READOUT];
extern unsigned short int channel_bitmask;
extern int fd[4]; // file descriptors for output datafiles
extern unsigned long int total_number_of_readout_events;
//extern char logprefix[100];                 // prefix of log files generated

#define NUMBER_OF_BYTES_TO_READ_AT_ONE_TIME (100256)
void readout_all_pending_data(void);

#define NUMBER_OF_PACKET_TYPES (4)

#include <sys/time.h>
void start_timer();
int stop_timer(struct timeval* begin = NULL);
extern struct timeval start, end, watchdog;

unsigned int read_quarter_events_from_all_enabled_channels(unsigned char channel_bitmask, bool should_not_return_until_at_least_some_data_comes_through);
void reset_trigger_flip_flop(void);
inline void clear_buffer(unsigned short int channel_number);
inline void copy_byte_buffer_to_word_buffer(unsigned short int channel);
void copy_packet(unsigned long int *source);
void analyze_packet(unsigned long int packet_number, unsigned short int channel);
inline unsigned long int find_word_position_of_first_header_in_buffer(unsigned short int channel, unsigned long last_word_position_to_look_in_buffer);

void send_soft_trigger_request_command_packet(void);
void set_event_number(unsigned long int event_number);
void set_start_and_end_windows(unsigned long int start_window, unsigned long int end_window);
void global_reset(void);
void clear_scaler_counters(void);
void readout_N_events(unsigned long int N);
int open_files_for_output_and_read_N_events(char *logprefix, unsigned long int N);

#endif

