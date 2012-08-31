#ifndef acquisition_h
#define acquisition_h

using namespace std;
#include <string>

#define NUMBER_OF_SPACES_TO_RESERVE_FOR_EVENT_NUMBER_CONSOLE_OUTPUT (4)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER           (2)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_RUN_NUMBER                  (4)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_SPILL_NUMBER                (4)

// defined here so there aren't a bunch of magic fours hanging around in the code:
#define NUMBER_OF_BYTES_IN_A_WORD (4)

// configuration input for our system:
#define NUMBER_OF_ROWS_IN_BOARD_STACK (4)
#define NUMBER_OF_COLUMNS_IN_BOARD_STACK (4)
#define NUMBER_OF_WORDS_IN_A_PACKET (140)
#define NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT (132)

#define NUMBER_OF_DSP_cPCI_BOARDS_TO_READOUT (1)

#if NUMBER_OF_DSP_cPCI_BOARDS_TO_READOUT==1
	#define NUMBER_OF_SCRODS_TO_READOUT (4)
#else
	#if NUMBER_OF_DSP_cPCI_BOARDS_TO_READOUT==2
		#define NUMBER_OF_SCRODS_TO_READOUT (8)
	#endif
#endif

// calculated (values in units of BYTES are calculated from those given in WORDS):
#define QUARTER_EVENT_SIZE_IN_WORDS (NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT)
#define QUARTER_EVENT_SIZE_IN_BYTES (QUARTER_EVENT_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
#define WHOLE_EVENT_SIZE_IN_WORDS (NUMBER_OF_SCRODS_TO_READOUT*QUARTER_EVENT_SIZE_IN_BYTES)
#define WHOLE_EVENT_SIZE_IN_BYTES (WHOLE_EVENT_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
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

#include "generic.h"
#include "DebugInfoWarningError.h"
#include "config_file.h"
#include "status_file.h"
#include "packet_builder.h"
#include "commands.h"

//#define using_DSP_cPCI
//#define using_CAMAC

//#ifdef using_DSP_cPCI
#include "fiber.h"
//#endif

//#ifdef using_CAMAC
#include "CAMAC.h"
//#endif

#define using_CAMAC3377 (0)

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

#include <sys/time.h>
void start_timer(void);
int watchdog_timer_in_seconds(void);
int stop_timer(struct timeval* begin = NULL);
int stop_timer_in_seconds(void);
extern struct timeval start, end, watchdog;
extern float temperature_float[NUMBER_OF_SCRODS_TO_READOUT];

extern bool channel_enabled[4];
extern string location_of_raw_datafiles;
extern string location_of_status_and_log_files;
extern unsigned short int channel_bitmask;
extern unsigned short int experiment_number;
extern unsigned short int run_number;
extern unsigned short int spill_number;
extern unsigned long int event_number;
extern unsigned long int event_number_for_fiber[NUMBER_OF_SCRODS_TO_READOUT];
extern unsigned long int event_number_from_most_recent_packet[NUMBER_OF_SCRODS_TO_READOUT];
extern string base_filename;
extern ofstream logfile;
extern bool logfile_open;
extern unsigned short int verbosity;
extern signed short int temperature_redline;

extern unsigned char unsigned_char_byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];
extern unsigned long int number_of_readout_events_for_this_spill;

extern unsigned short int threshold_scan_low_limit;
extern unsigned short int threshold_scan_high_limit;
extern unsigned short int threshold_scan_step_size;
extern char red[13], yellow[13], white[13];

extern unsigned long int word_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_WORDS];
extern          char     byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];

void clear_buffer(unsigned short int channel_number);
void copy_byte_buffer_to_word_buffer(unsigned short int channel);
unsigned long int find_word_position_of_first_header_in_buffer(unsigned short int channel, unsigned long last_word_position_to_look_in_buffer);

void copy_packet(unsigned long int *source);
void analyze_packet(unsigned long int packet_number, unsigned short int channel);

#endif

