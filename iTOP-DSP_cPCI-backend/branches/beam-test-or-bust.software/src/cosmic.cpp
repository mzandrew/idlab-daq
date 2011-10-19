// 2011-?? Andrew Wong
// 2011-?? mza

#include "../contrib/stdPCI.h"
#include "pci.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <getopt.h>
#include <string.h>
#include <ctype.h>
#include <string>

//#define BUFFER_SIZE 65536
#define BUFFER_SIZE 300000

inline unsigned int read_quarter_events_from_all_enabled_channels(unsigned char channel_bitmask, bool should_not_return_until_at_least_some_data_comes_through);
void reset_trigger_flip_flop(void);

unsigned long int histogram_of_incomplete_events_560 = 0;
unsigned long int histogram_of_incomplete_events_other = 0;
unsigned long long int time_for_single_event_readout;
unsigned long int event_number = 0;

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

#define BUFFER_SIZE_IN_WORDS (22000)
#define BUFFER_SIZE_IN_BYTES (BUFFER_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
unsigned long int word_buffer[NUMBER_OF_SCRODS_TO_READOUT][BUFFER_SIZE_IN_WORDS];
         char     byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][BUFFER_SIZE_IN_BYTES];
unsigned char unsigned_char_byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][BUFFER_SIZE_IN_BYTES];
string event_fiber_packet_string, info_string[NUMBER_OF_SCRODS_TO_READOUT], error_string[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int event_number_from_most_recent_packet[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int number_of_errors_for_this_quarter_event[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int total_number_of_errors;

unsigned long int header = 0x00be11e2;
unsigned long int protocol_freeze_date = 0x20111016;
#define NUMBER_OF_PACKET_TYPES (3)
unsigned long int packet_type[NUMBER_OF_PACKET_TYPES] = { 0x00c0ffee, 0x0000eada, 0x000f00da };
unsigned long int footer = 0x62504944;

#define PACKET_HEADER_INDEX (0)
#define PACKET_SIZE_INDEX (1)
#define PACKET_PROTOCOL_FREEZE_DATE_INDEX (2)
#define PACKET_TYPE_INDEX (3)
#define EVENT_NUMBER_INDEX (4)
#define PACKET_NUMBER_INDEX (5)
#define PACKET_CHECKSUM_INDEX (NUMBER_OF_WORDS_IN_A_PACKET-2)
#define PACKET_FOOTER_INDEX (NUMBER_OF_WORDS_IN_A_PACKET-1)

unsigned long int number_of_bytes_read_so_far[NUMBER_OF_SCRODS_TO_READOUT];
char *command_packet = new char[BUFFER_SIZE];

void start_timer();
int stop_timer(struct timeval* begin = NULL);
struct timeval start, end, watchdog;

void start_timer() {
	gettimeofday(&start, NULL);	
}

int stop_timer(struct timeval* begin) {
	if (begin == NULL)
		begin = &start;
	int sec, usec;
	gettimeofday(&end, NULL);
	sec = end.tv_sec - begin->tv_sec;
	usec = end.tv_usec - begin->tv_usec;
	return sec*1000000+usec;
}

unsigned long int calculate_checksum_and_insert_into_packet(unsigned long int* packet) {
	unsigned long int checksum = 0;
	for(int i=0; i<140; i++) {
		if (i != 138) {
			checksum += packet[i];
		}
	}
	packet[138] = checksum;
}

int setup_pci(int id) {
	// open the PCI handles
	fprintf(stderr, "opening %s\n", device_name);
	if (pci.createHandles(device_name) < 0) {
		fprintf(stderr, "open PCI handles failed.  Is the driver loaded?\n");
		exit(-1);
	}
	// lock the desired card
	fprintf(stderr, "locking card %d\n", id);
	if (pci.lockCard(id) < 0) {
		fprintf(stderr, "lock card failed\n");
		if (id == 0)
			fprintf(stderr, "\ncard ID is set to zero.  Did you forgot to specify the card ID on the command line?\n\n");
		exit(-1);
	}
}

void generate_skeleton_command_packet(void) {
 	unsigned long int skeleton_packet[8] = {0xbe11e2, 0x8c, protocol_freeze_date, 0xb01dface, 0x00000000, 0xa0001, 0xe3657b35, 0x62504944};
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	for(int i=0; i<140; i++) {
		if (i <= 4) {
			uint32_packet[i] = skeleton_packet[i];
		} else if (i <= 136) {
			uint32_packet[i] = 0;
			//uint32_packet[i] = i - 3;
		} else {
			uint32_packet[i] = skeleton_packet[i-132];
		}
	}
}

//#define NUMBER_OF_ASICS_IN_BOARD_STACK (16)
#define NUMBER_OF_ROWS_IN_BOARD_STACK (4)
#define NUMBER_OF_COLUMNS_IN_BOARD_STACK (4)
struct DAC_settings {
	unsigned short trigger_test_channel_threshold  [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short trigger_comparator_bias         [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short trigger_threshold_01            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short trigger_threshold_23            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short trigger_threshold_45            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short trigger_threshold_67            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short comparator_output_width         [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short sampling_rate_adjustment_PFET   [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short sampling_rate_adjustment_NFET   [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short buffer_amplifier_bias           [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short Wilkinson_ramp_buffer_bias      [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short Wilkinson_ramp_current_bias     [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short Wilkinson_comparator_bias       [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short Wilkinson_comparator_pullup_bias[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
	unsigned short Wilkinson_clock_rate            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
//	unsigned short spare                           [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
};
DAC_settings DAC_settings;

void setup_default_DAC_settings(void) {
	for (int i=0; i<NUMBER_OF_ROWS_IN_BOARD_STACK; i++) {
		for (int j=0; j<NUMBER_OF_COLUMNS_IN_BOARD_STACK; j++) {
			DAC_settings.trigger_test_channel_threshold[i][j]   = 0x000;
			DAC_settings.trigger_comparator_bias[i][j]          = 0x3e8;
			DAC_settings.trigger_threshold_01[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_23[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_45[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_67[i][j]             = 0x76c;
			DAC_settings.comparator_output_width[i][j]          = 0x578;
			DAC_settings.sampling_rate_adjustment_PFET[i][j]    = 0xc9e;
			DAC_settings.sampling_rate_adjustment_NFET[i][j]    = 0x428;
			DAC_settings.buffer_amplifier_bias[i][j]            = 0x44c;
			DAC_settings.Wilkinson_ramp_buffer_bias[i][j]       = 0x640;
			DAC_settings.Wilkinson_ramp_current_bias[i][j]      = 0x7d0;
			DAC_settings.Wilkinson_comparator_bias[i][j]        = 0x384;
			DAC_settings.Wilkinson_comparator_pullup_bias[i][j] = 0xce4;
			DAC_settings.Wilkinson_clock_rate[i][j]             = 0xaf0;
//			DAC_settings.spare[i][j]                            = ;
		}
	}
}

void send_DAC_setting_command(void) {
	generate_skeleton_command_packet();
	unsigned short int j, k, m, n;
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	uint32_packet[4] = 0x0bac2dac;
//	uint32_packet[4] = 0x4bac2dac;
//	uint32_packet[5] = 0x03ff03ff;
	uint32_packet[5] = 0;
	for (int i=6; i<=125; i++) {
//		uint32_packet[i] = 0x03ff03ff;
//		uint32_packet[i] = 0x01ff01ff;
		uint32_packet[i] = 0x00000000;
		j = (i-6);   // j = 0, 1, 2, 3, 4, 5, 6, 7
		k =     j/2; // k = 0, 0, 1, 1, 2, 2, 3, 3
		m = 4*(j&1); // m = 0, 4, 0, 4, 0, 4, 0, 4
		n =     m+2; // n = 2, 6, 2, 6, 2, 6, 2, 6
//		o =     m+1; // o = 1, 5, 1, 5, 1, 5, 1, 5
//		p =     n+1; // p = 3, 7, 3, 7, 3, 7, 3, 7
		m /= 2;      // m = 0, 2, 0, 2, 0, 2, 0, 2
		n /= 2;      // n = 1, 3, 1, 3, 1, 3, 1, 3
//		p /= 2;      // p = 0, 2, 0, 2, 0, 2, 0, 2
//		o /= 2;      // o = 1, 3, 1, 3, 1, 3, 1, 3
		       if (i<= 13) { // trigger biases
		} else if (i<= 45) { // trigger thresholds
		} else if (i<= 53) { // trigger widths
		} else if (i<= 61) { // sampling rates +
		} else if (i<= 69) { // sampling rates -
		} else if (i<= 77) { // analog transfer buffer biases
			j = i-70; k = j/2; m = 2*(j&1); n = m+1;
//			uint32_packet[i] = (DAC_settings.buffer_amplifier_bias[k][n] << 16)
//			                  + DAC_settings.buffer_amplifier_bias[k][m];
		} else if (i<= 85) { // Wilkinson ramp buffer biases
		} else if (i<= 93) { // Wilkinson ramp current biases
		} else if (i<=101) { // Wilkinson clock rates
		} else if (i<=109) { // Wilkinson comparator biases
		} else if (i<=117) { // Wilkinson comparator pull-up biases
		} else if (i<=125) { // test trigger channel thresholds
			j = i-118; k = j/2; m = 2*(j&1); n = m+1;
			uint32_packet[i] = (DAC_settings.trigger_test_channel_threshold[k][n] << 16)
			                  + DAC_settings.trigger_test_channel_threshold[k][m];
		}
		// the rest don't matter
	}
	calculate_checksum_and_insert_into_packet(uint32_packet);
	for (unsigned short int j=0; j<NUMBER_OF_SCRODS_TO_READOUT; j++) {
		pci.selectChannel(j);
		pci.sendData(command_packet, 560);
	}
}

void generate_command_packet(unsigned long int command, unsigned long int argument) {
	generate_skeleton_command_packet();
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	uint32_packet[4] = command;
	uint32_packet[5] = argument;
	calculate_checksum_and_insert_into_packet(uint32_packet);
}

void send_command_packet_to_all_enabled_channels(unsigned long int command, unsigned long int argument) {
	generate_command_packet(command, argument);
	for (unsigned short int j=0; j<NUMBER_OF_SCRODS_TO_READOUT; j++) {
		pci.selectChannel(j);
		pci.sendData(command_packet, 560);
	}
}

void reset_trigger_flip_flop(void) {
//	pci.selectChannel(i);
//	pci.sendData(, 560);
//	printf("\nsending signal to clear trigger flip flop");
	pci.sendVetoClear();
}

int main(int argc, char** argv) {
	if (argc == 1) {
		fprintf(stderr, "retrieve data from all four channels and dump to binary file\n");
		fprintf(stderr, "syntax: %s [args] id\n", argv[0]);
		fprintf(stderr, "use --help parameter to see valid arg values\n\n");
		return -1;
	}

	// variables that can be changed via parameters
	int id = atoi(argv[1]);                      // card ID
	int blocksize = 2048;                        // # of bytes to read before changing channels
	bool verbose = false;                        // verbose mode
	char logprefix[100] = "log";                 // prefix of log files generated
	long long target = (long long)1048576*1024;  // # of bytes to read
	bool ch_en[4] = {true, true, true, true};    // enable flag for each channel
	int stdout_ch = -1;			     // specified channel to go to stdout, if any
	// getopt parsing
    int c;
    int digit_optind = 0;

	while (1) {
		int this_option_optind = optind ? optind : 1;
		int option_index = 0;
		static struct option long_options[] = {
		    {"total", 1, 0, 't'},
		    {"blocksize", 1, 0, 'b'},
		    {"logprefix", 1, 0, 'p'},
		    {"verbose", 0, 0, 'v'},
		    {"help", 0, 0, 'h'},
		    {"chan", 1, 0, 'c'},
		    {0, 0, 0, 0}
		};
		c = getopt_long (argc, argv, "o:c:fht:b:p:v",
		         long_options, &option_index);
		if (c == -1)
		    break;
			switch (c) {
		case 0:
		    fprintf (stderr, "option %s", long_options[option_index].name);
		    if (optarg)
		        fprintf (stderr, " with arg %s", optarg);
		    fprintf (stderr, "\n");
		    break;

		case 'c':
			ch_en[0] = ch_en[1] = ch_en[2] = ch_en[3] = false;
			for(int i=0; i < strlen(optarg); i++) {
				int ch = optarg[i] - '0';
				if (ch >= 0 && ch <= 3) {
					ch_en[ch] = true;
				}
			}
			fprintf(stderr, "enabled channels: ");
			for(int i=0; i < 4; i++) if (ch_en[i]) fprintf(stderr, "CH%d ", i);
			fprintf(stderr, "\n");
			break;

		case 'v':
		    fprintf (stderr, "verbose mode\n");
			verbose = true;
		    break;

		case 't':
			target = (long long)atoi(optarg);
			if (optarg[strlen(optarg) - 1] == 'G') { target *= 1000000000; }
			if (optarg[strlen(optarg) - 1] == 'M') { target *= 1000000; }
			if (optarg[strlen(optarg) - 1] == 'k') { target *= 1000; }
			
			if (optarg[0] == '*') {
				target = (long long)1 << (sizeof(long long)* 8 - 2);
			}

		    fprintf (stderr, "option total with value '%lld'\n", target);

		    break;

		case 'b':
			blocksize = atoi(optarg);
		    fprintf (stderr, "option blocksize with value '%d'\n", blocksize);
			if (blocksize > BUFFER_SIZE) {
				fprintf(stderr, "  WARNING: blocksize is too large, setting to %d", BUFFER_SIZE);
				blocksize = BUFFER_SIZE;
			}

		    break;

		case 'p':
			strncpy(logprefix, optarg, 100);
		    fprintf (stderr, "option prefix with value '%s'\n", optarg);
		    break;

		case 'o':
			stdout_ch = atoi(optarg);
			fprintf(stderr, "sending channel %d data to stdout\n", stdout_ch);
			break;

		case 'h':
	       case '?':
			fprintf(stderr, "options: \n"
				"         -c 0123: sets channels to read; default is all enabled\n"
                        	"         -t [size]: sets total size of data to read\n"
				"         -b [size]: sets size to transfer per operation\n"
				"         -p [prefix]: sets prefix of log files generated (default 'log')\n"
				"         -h: help: prints this help screen\n"
				"         -o [channel]: outputs a specific channel to stdout (binary)\n"
				"         -v: verbose mode: prints updates when data is transmitted\n\n"
				"long versions of these parameters also exist: --total, --blocksize,\n"
				"--chan, --logprefix, --verbose, --help\n\n"
			);

			return 0;
		    break;

		default:
		    fprintf (stderr, "?? getopt returned character code 0%o ??\n", c);
		}
	}

	if (optind < argc) {
		id = atoi(argv[optind]);
	}
	// end parsing command-line arguments

	// other variables
	int fd[4];				// file descriptors for output logs
	long long lastprint;			// MB count of last disk IO (for verbose mode)
	char* buffer = new char[BUFFER_SIZE];	// buffer for sent data
	char* buffer2 = new char[BUFFER_SIZE];	// buffer for incoming data

	device_name = default_device_name;			// device name "/dev/altixpci0"

	long long total[4] = {0,0,0,0};		// total # of bytes read
	int val2;				// tmp value for # of bytes read in last operation
	int read[4];				// # of bytes read on most recent xfer (per chan)
	bool readdata[4] = {false, false, false, false};	// flag if data was read and flow
								// control should be sent on 0 bytes
								// read

	// check if proposed output files exist.  Note that we don't open any yet, because
	// if they are opened, the files get created.  If any of the files exist, we do not
	// want to create any of the other files.
	for(int i=0; i < 4; i++) {
		char filename[105] = "";
		sprintf(filename, "%s%d.rawdata", logprefix, i);
//		sprintf(filename, "%s", logprefix);
		if (stdout_ch == i) continue;
		if (ch_en[i]) {
			struct stat st;
			if(stat(filename ,&st) == 0) {
			        fprintf(stderr, "ERROR: %s already exists, bailing\n", filename);
				return 0;
			}
		}
	}

	// open and create the log files
	for(int i=0; i < 4; i++) {
		char filename[105] = "";
		sprintf(filename, "%s%d.rawdata", logprefix, i);
		//sprintf(filename, "%s", logprefix);
		if (ch_en[i]) {
			printf("%d %d\n", stdout_ch, i);
			if (stdout_ch == i) continue;
			fd[i] = open(filename, O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
			if (fd[i] < 0) 
				fprintf(stderr, "warning: failed to create file %s\n", filename);
		}
	}

	if (stdout_ch != -1)
		fd[stdout_ch] = STDOUT_FILENO;

	long long readtime[4] = {0,0,0,0}, writetime[4] = {0,0,0,0};  // time to read/write, rolling

	// set totals for unused channels so they don't hold up readout process
	for(int i=0; i < 4; i++)
		if (ch_en[i] == false)
			total[i] = target;

	setup_pci(id);

	unsigned short int channel_bitmask = 0;
	for(int i=0; i<4; i++) {
		if (ch_en[i]) {
			channel_bitmask |= 1<<i;
		}
	}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		number_of_errors_for_this_quarter_event[i] = 0;
	}
	unsigned long int total_number_of_readout_events = 0;

//	send_command_packet_to_all_enabled_channels(0x33333333, 0x00000000); // global reset
//	usleep(500000); // wait for FPGA to reset everything and bring fiber link up again
	send_command_packet_to_all_enabled_channels(0xe0000000, 0x00000008); // set event number
	usleep(1000);
//	send_command_packet_to_all_enabled_channels(0x1bac2dac, 0x00000000); // set DACs to default built-in values
	setup_default_DAC_settings(); // just initialize the array locally
	send_DAC_setting_command();
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x00000001); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000001ff); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000003ff); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000005ff); // set all DACs to given argument

//	while (1) {
//	for (unsigned long int i=0; i<1000000; i++) {
//	for (unsigned long int i=0; i<26000; i++) {
	for (unsigned long int i=0; i<1000; i++) {
//	for (unsigned long int i=0; i<100; i++) {
		event_number++;
		read_quarter_events_from_all_enabled_channels(channel_bitmask, true); // should_wait = true for cosmic or first data from a spill/fill structure, rest should be should_wait = false
		reset_trigger_flip_flop();
		time_for_single_event_readout = (long long) stop_timer();
//		printf("\napproximate time for last readout = %d us", time_for_single_event_readout);
		total_number_of_readout_events++;
		//write_quarter_events_to_disk();
		long int return_value;
		for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
			if (
				((i==3) && (channel_bitmask & 0x8)) ||
				((i==2) && (channel_bitmask & 0x4)) ||
				((i==1) && (channel_bitmask & 0x2)) ||
				((i==0) && (channel_bitmask & 0x1))
				) {
				if (number_of_bytes_read_so_far[i]) {
					return_value = write(fd[i], byte_buffer[i], number_of_bytes_read_so_far[i]);
					//return_value = write(fd[i], byte_buffer[i], QUARTER_EVENT_SIZE_IN_BYTES);
					if (return_value == -1) {
						printf("\nerror %d writing to disk", return_value);
					} else if (return_value > 0) {
//						printf("\nwrote %d bytes to file", return_value);
					}
				}
			}
		}
//		printf("\n");
		usleep(NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS);
	}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	printf("\n");
	printf("\ntotal number of readout events = %d", total_number_of_readout_events);
	printf("\n        total number of errors = %d", total_number_of_errors);
	//printf("\nnumber of times exactly one packet was missing = %d", histogram_of_incomplete_events_560);
	//printf("\nnumber of times some other number of words was missing = %d", histogram_of_incomplete_events_other);
	printf("\n");

	pci.freeHandles();
	
	fprintf(stderr, "\ndone!\n");

	for(int i=0; i < 4; i++) {
		if (ch_en[i] == false)
			continue;

		fprintf(stderr, "ch%d: %lld bytes - read: %lld us, logging %lld us, total %lld us\n", i, total[i], readtime[i], writetime[i], readtime[i] + writetime[i]);
		close(fd[i]);
	}

	return 0;
}

inline void clear_buffer(unsigned short int channel_number) {
	for (unsigned long int i=0; i<BUFFER_SIZE_IN_WORDS; i++) {
		word_buffer[channel_number][i] = 0;
	}
	for (unsigned long int i=0; i<BUFFER_SIZE_IN_BYTES; i++) {
		byte_buffer[channel_number][i] = 0;
	}
}

// this is the stupid-monkey way of doing this:
inline void copy_byte_buffer_to_word_buffer(unsigned short int channel) {
	for (unsigned long int i=0; i<BUFFER_SIZE_IN_BYTES; i++) {
		unsigned_char_byte_buffer[channel][i] = byte_buffer[channel][i];
	}
	for (unsigned long int i=0; i<BUFFER_SIZE_IN_WORDS; i++) {
		unsigned long int j = i * NUMBER_OF_BYTES_IN_A_WORD;
		//if ((word_buffer[channel][i] & 0x00ff0000) >> 16 == 0xbe) {
		word_buffer[channel][i] =
			((unsigned_char_byte_buffer[channel][j+3]) << 24) |
			((unsigned_char_byte_buffer[channel][j+2]) << 16) |
			((unsigned_char_byte_buffer[channel][j+1]) <<  8) |
			((unsigned_char_byte_buffer[channel][j+0]) <<  0);
	}
}

inline unsigned long int find_word_position_of_first_header_in_buffer(unsigned short int channel, unsigned long last_word_position_to_look_in_buffer) {
	unsigned long int index = 22222;
	if (last_word_position_to_look_in_buffer >= BUFFER_SIZE_IN_WORDS) {
		last_word_position_to_look_in_buffer = BUFFER_SIZE_IN_WORDS - 1;
	}
	for (unsigned long int i=0; i<=last_word_position_to_look_in_buffer; i++) {
		if (word_buffer[channel][i] == header) {
			index = i;
			if (index > 0) {
				char temp[256];
				sprintf(temp, " skipped ahead %d words to find header;", index);
				error_string[channel] += temp;
			}
			return index;
		}
	}
	return index;
}

unsigned long int packet[NUMBER_OF_WORDS_IN_A_PACKET];

// this is the stupid-monkey way of doing this:
void copy_packet(unsigned long int *source) {
	for (unsigned long int i=0; i<NUMBER_OF_WORDS_IN_A_PACKET; i++) {
		packet[i] = source[i];
	}
}

void analyze_packet(unsigned long int packet_number, unsigned short int channel) {
	unsigned long int checksum = 0;
	unsigned long int packet_number_from_packet;
	if (packet[PACKET_HEADER_INDEX] != header) {
		error_string[channel] += " bad header;";
//		printf(" bad header"); // this should never be called, since matching against a header is how it got here
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet[PACKET_SIZE_INDEX] != NUMBER_OF_WORDS_IN_A_PACKET) {
		error_string[channel] += " bad packet size;";
//		printf(" bad packet size");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet[PACKET_PROTOCOL_FREEZE_DATE_INDEX] != protocol_freeze_date) {
		error_string[channel] += " bad protocol freeze date;";
//		printf(" bad protocol freeze date");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	unsigned short int packet_type_is_okay = 0;
	for (int i=0; i<NUMBER_OF_PACKET_TYPES; i++) {
		if (packet[PACKET_TYPE_INDEX] == packet_type[i]) {
			packet_type_is_okay++;
		}
	}
	if (!packet_type_is_okay) {
		error_string[channel] += " bad packet type;";
//		printf(" bad packet type");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	packet_number_from_packet = (packet[PACKET_NUMBER_INDEX] & 0x00ff0000) >> 16;
	if (packet_number_from_packet != packet_number) {
		error_string[channel] += " packet_number didn't match;";
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet_number==0) {
		//info_string[channel] += packet[EVENT_NUMBER_INDEX];
		char temp[256];
		sprintf(temp, "event_number[%09d]: ", packet[EVENT_NUMBER_INDEX]);
		info_string[channel] += temp;
	} else {
		if (event_number_from_most_recent_packet[channel] != packet[EVENT_NUMBER_INDEX]) {
			error_string[channel] += " event_number changed in the middle of an event (";
			error_string[channel] += event_number_from_most_recent_packet[channel];
			error_string[channel] += " vs ";
			error_string[channel] += packet[EVENT_NUMBER_INDEX];
			error_string[channel] += ");";
			number_of_errors_for_this_quarter_event[channel]++;
		}
	}
	event_number_from_most_recent_packet[channel] = packet[EVENT_NUMBER_INDEX];
	for (unsigned long int i=0; i<NUMBER_OF_WORDS_IN_A_PACKET; i++) {
		if (i != PACKET_CHECKSUM_INDEX) {
			checksum += packet[i];
		}
	}
	checksum &= 0xffffffff;
	if (0) {
	if (checksum != packet[PACKET_CHECKSUM_INDEX]) {
		char temp[256];
//		error_string[channel] += " checksums do not match;";
//		error_string[channel] += " checksum is ";
		sprintf(temp, "0x%08x", packet[PACKET_CHECKSUM_INDEX]);
		error_string[channel] += temp;
		error_string[channel] += " - ";
//		error_string[channel] += " but should be ";
		sprintf(temp, "0x%08x", checksum);
		error_string[channel] += temp;
		error_string[channel] += " = ";
//		error_string[channel] += " the difference is ";
		sprintf(temp, "0x%08x", packet[PACKET_CHECKSUM_INDEX]-checksum);
		error_string[channel] += temp;
		error_string[channel] += ";";
//		printf(" checksums do not match");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	}
	if (packet[PACKET_FOOTER_INDEX] != footer) {
		error_string[channel] += " bad footer;";
//		printf(" bad footer");
		number_of_errors_for_this_quarter_event[channel]++;
	}
//	if (error_string[channel].length() && packet_number == 0) {
	if (error_string[channel].length()) {
//		printf("%s%s", event_fiber_packet_string.c_str(), error_string[channel].c_str());
		error_string[channel] = "";
	}
	if (info_string[channel].length()) {
		printf("%s", info_string[channel].c_str());
		info_string[channel] = "";
	}
	printf("P");
}

inline unsigned int read_quarter_events_from_all_enabled_channels(unsigned char channel_bitmask, bool should_not_return_until_at_least_some_data_comes_through) {
	unsigned long int desired_number_of_bytes_to_read_right_now[NUMBER_OF_SCRODS_TO_READOUT];
	unsigned long int desired_number_of_bytes_to_read[NUMBER_OF_SCRODS_TO_READOUT];
	unsigned short int word_position_of_first_header[NUMBER_OF_SCRODS_TO_READOUT];
	bool header_has_been_seen[NUMBER_OF_SCRODS_TO_READOUT];
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		              number_of_bytes_read_so_far[i] = 0;
		          desired_number_of_bytes_to_read[i] = channel_bitmask & (1<<i) ? QUARTER_EVENT_SIZE_IN_BYTES : 0;
		desired_number_of_bytes_to_read_right_now[i] = channel_bitmask & (1<<i) ? PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES : 0;
		header_has_been_seen[i] = false;
		word_position_of_first_header[i] = 33333;
	}
	unsigned long int number_of_bytes_actually_read;
	unsigned long int word_position_of_first_found_header;
	unsigned long int number_of_extra_words_we_need_to_read;
	unsigned long int number_of_extra_bytes_we_need_to_read;
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		clear_buffer(i);
	}
	unsigned long int number_of_bytes_read_from_any_channels_for_all_loop_iterations = 0;
	unsigned long int number_of_bytes_read_from_any_channels_for_this_loop_iteration;
	unsigned short int dry_loop_iterations = 0;
	unsigned short int maximum_number_of_allowed_dry_loop_iterations = 10;
	bool should_synchronize_stream_with_header_and_request_more_data_to_compensate = true;
	bool should_ensure_last_word_acquired_is_a_footer = true;
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		info_string[i] = "";
		error_string[i] = "";
		total_number_of_errors += number_of_errors_for_this_quarter_event[i];
		number_of_errors_for_this_quarter_event[i] = 0;
				//pci.selectChannel(i);
				//char temp[4];
				//number_of_bytes_actually_read = pci.readData(temp, 4);
	}
	while (
		// bug/future:  this is effectively hardcoding NUMBER_OF_SCRODS_TO_READOUT to 4 here:
		number_of_bytes_read_so_far[0] < desired_number_of_bytes_to_read[0] ||
		number_of_bytes_read_so_far[1] < desired_number_of_bytes_to_read[1] ||
		number_of_bytes_read_so_far[2] < desired_number_of_bytes_to_read[2] ||
		number_of_bytes_read_so_far[3] < desired_number_of_bytes_to_read[3]
	) {
		number_of_bytes_read_from_any_channels_for_this_loop_iteration = 0;
		usleep(NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_PARTIAL_QUARTER_EVENTS);
		for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
			if (number_of_bytes_read_so_far[i] < desired_number_of_bytes_to_read[i]) {
				pci.selectChannel(i);
				unsigned long int number_of_bytes_remaining_to_read = desired_number_of_bytes_to_read[i] - number_of_bytes_read_so_far[i];
				if (number_of_bytes_read_so_far[i] + desired_number_of_bytes_to_read_right_now[i] > desired_number_of_bytes_to_read[i]) {
					desired_number_of_bytes_to_read_right_now[i] = number_of_bytes_remaining_to_read;
				}
				if (desired_number_of_bytes_to_read_right_now[i] > MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES) {
					desired_number_of_bytes_to_read_right_now[i] = MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES;
				}
				desired_number_of_bytes_to_read_right_now[i] = (desired_number_of_bytes_to_read_right_now[i] >> 2) << 2; // make sure it's aligned to a 4-byte boundary
				number_of_bytes_actually_read = pci.readData(byte_buffer[i] + number_of_bytes_read_so_far[i], desired_number_of_bytes_to_read_right_now[i]);
				number_of_bytes_read_so_far[i] += number_of_bytes_actually_read;
				number_of_bytes_read_from_any_channels_for_this_loop_iteration += number_of_bytes_actually_read;
				if (number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0 && number_of_bytes_actually_read > 0) {
					start_timer();
				}
				number_of_bytes_read_from_any_channels_for_all_loop_iterations += number_of_bytes_actually_read;
				if (should_not_return_until_at_least_some_data_comes_through && number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0) {
				} else {
//					printf("\nch%d: %d / %d (%d)", i, number_of_bytes_read_so_far[i], desired_number_of_bytes_to_read[i], desired_number_of_bytes_to_read_right_now[i]);
				}
				copy_byte_buffer_to_word_buffer(i);
				if (should_synchronize_stream_with_header_and_request_more_data_to_compensate && !header_has_been_seen[i]) {
					word_position_of_first_found_header = find_word_position_of_first_header_in_buffer(i, number_of_bytes_read_so_far[i]/NUMBER_OF_BYTES_IN_A_WORD); // bug/future:  unsure why the -1 has to be here;
					if (word_position_of_first_found_header < number_of_bytes_read_so_far[i]/NUMBER_OF_BYTES_IN_A_WORD) {
						header_has_been_seen[i] = true;
						word_position_of_first_header[i] = word_position_of_first_found_header;
						number_of_extra_words_we_need_to_read = word_position_of_first_found_header;
						number_of_extra_bytes_we_need_to_read = number_of_extra_words_we_need_to_read * NUMBER_OF_BYTES_IN_A_WORD;
						desired_number_of_bytes_to_read[i] += number_of_extra_bytes_we_need_to_read;
//						printf(" ... header found at word %d", i, word_position_of_first_header[i]);
						//analyze_packet(word_buffer[i] + word_position_of_first_header[i]);
//						copy_packet(word_buffer[i] + word_position_of_first_header[i] + 1);
//						analyze_packet();
					}
				}
				if (number_of_bytes_actually_read) {
					printf(".");
				}
			}
		}
		if (should_not_return_until_at_least_some_data_comes_through && number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0) {
		} else if (number_of_bytes_read_from_any_channels_for_this_loop_iteration == 0) {
			dry_loop_iterations++;
			if (dry_loop_iterations > maximum_number_of_allowed_dry_loop_iterations) {
//				printf(" ... aborting this event");
				for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
					unsigned long int a = desired_number_of_bytes_to_read[i] - number_of_bytes_read_so_far[i];
					if (a == 560) {
						histogram_of_incomplete_events_560++;
					} else if (a == desired_number_of_bytes_to_read[i]) {
					} else if (a > 0) {
						histogram_of_incomplete_events_other++;
					}
				}
				printf("O");
				break;
			} else {
//				printf("didn't get any data from any channels; ready to quit\n");
			}
		}
	}
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		if (desired_number_of_bytes_to_read[i]) {
			printf("\n");
		}
		if (number_of_bytes_read_so_far[i] > 0 && number_of_bytes_read_so_far[i] == desired_number_of_bytes_to_read[i])
 {
//			for (unsigned long int j=0; j<((number_of_bytes_read_so_far[i])>>2); j++) {
			for (unsigned long int j=0; j<NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT; j++) {
				copy_packet(word_buffer[i] + word_position_of_first_header[i] + j * NUMBER_OF_WORDS_IN_A_PACKET);
				char temp[256];
				sprintf(temp, "\nevent[%d] fiber_ch[%d] packet[%3d]: ", event_number, i, j);
				event_fiber_packet_string = temp;
				analyze_packet(j, i);
			}
			if (number_of_errors_for_this_quarter_event[i]) {
				printf(" %d errors in that quarter event; ", number_of_errors_for_this_quarter_event[i]);
			}
			printf(" Q ");
		}
	}
	printf(" E ");
}

//inline unsigned int read_quarter_event_from_channel(unsigned short int channel) {
//}

