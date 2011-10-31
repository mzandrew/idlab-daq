// 2011-?? Andrew Wong
// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include <stdio.h>
#include <getopt.h>

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
//	long long target = (long long)1048576*1024;  // # of bytes to read
	bool ch_en[4] = {true, true, true, true};    // enable flag for each channel
	int stdout_ch = -1;			     // specified channel to go to stdout, if any
	// getopt parsing
    int c;
    int digit_optind = 0;
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	while (1) {
		int this_option_optind = optind ? optind : 1;
		int option_index = 0;
		static struct option long_options[] = {
		    {"logprefix", 1, 0, 'p'},
		    {"verbose", 0, 0, 'v'},
		    {"help", 0, 0, 'h'},
		    {"chan", 1, 0, 'c'},
		    {"number", 1, 0, 'c'},
		    {0, 0, 0, 0}
		};
		c = getopt_long (argc, argv, "c:n:h:p:v", long_options, &option_index);
		if (c == -1)
		    break; // this breaks the while(1) loop after there are no more options
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

		case 'n':
			total_number_of_quarter_events_to_read_per_fiber_channel = atoi(optarg);
			fprintf(stdout, "acquiring %ld quarter events per enabled fiber channel\n", total_number_of_quarter_events_to_read_per_fiber_channel);
			break;

		case 'p':
			strncpy(logprefix, optarg, 100);
		    fprintf (stdout, "using log file prefix \"%s\"\n", optarg);
		    break;

//		case 'o':
//			stdout_ch = atoi(optarg);
//			fprintf(stdout, "sending channel %d data to stdout\n", stdout_ch);
//			break;

		case 'h':
		case '?':
			fprintf(stderr, "options: \n"
				"         -c 0123: sets channels to read; default is all enabled\n"
				"         -p [prefix]: sets prefix of log files generated (default 'log')\n"
				"         -h: help: prints this help screen\n"
				"         -v: verbose mode: prints updates when data is transmitted\n\n"
				"long versions of these parameters also exist:\n"
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
	} else {
		fprintf(stderr, "please specify a card id # on the command line\n");
	}
	// end parsing command-line arguments
	fprintf(stdout, "\n");

	// other variables
	int fd[4];				// file descriptors for output logs
	long long lastprint;			// MB count of last disk IO (for verbose mode)
	char* buffer = new char[QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];	// buffer for sent data
	char* buffer2 = new char[QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];	// buffer for incoming data

//	long long total[4] = {0,0,0,0};		// total # of bytes read
	int val2;				// tmp value for # of bytes read in last operation
	int read[4];				// # of bytes read on most recent xfer (per chan)
	bool readdata[4] = {false, false, false, false};	// flag if data was read and flow control should be sent on 0 bytes read

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
//			printf("%d %d\n", stdout_ch, i);
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
//	for(int i=0; i < 4; i++)
//		if (ch_en[i] == false)
//			total[i] = target;

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
//	send_command_packet_to_all_enabled_channels(0x01001500, 0x00000000); // clear scaler counters
//	send_command_packet_to_all_enabled_channels(0xeeeee01a, 0x00000000); // set trigger thresholds for all channels
//	send_command_packet_to_all_enabled_channels(0xeeeee01a, 0x0000077b); // set trigger thresholds for all channels
//	send_command_packet_to_all_enabled_channels(0x5555b1a5, 0x00000000); // set Vbias values for all channels
//	send_command_packet_to_all_enabled_channels(0x5555b1a5, 0x0000044c); // set Vbias values for all channels
//	send_command_packet_to_all_enabled_channels(0x1bac2dac, 0x00000000); // set DACs to default built-in values
//	setup_default_DAC_settings(); // just initialize the array locally
//	send_DAC_setting_command();
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x00000000); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000001ff); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000003ff); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000005ff); // set all DACs to given argument

//	send_command_packet_to_all_enabled_channels(0x000001ff, 0x00000000); // set start window
//	send_command_packet_to_all_enabled_channels(0x000101ff, 0x00000003); // set end window

//	usleep(10000);
	set_start_and_end_windows(0x00000010, 0x00000013);
	set_event_number(0x00000008);

	usleep(10000);
	readout_all_pending_data();
	usleep(10000);
	send_soft_trigger_request_command_packet();
	usleep(10000);

//	while (1) {
	for (unsigned long int i=0; i<total_number_of_quarter_events_to_read_per_fiber_channel; i++) {
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
						printf("\nerror %ld writing to disk", return_value);
					} else if (return_value > 0) {
//						printf("\nwrote %d bytes to file", return_value);
					}
				}
			}
			if (i<total_number_of_quarter_events_to_read_per_fiber_channel-1) {
				send_soft_trigger_request_command_packet();
			}
		}
//		printf("\n");
		usleep(NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS);
	}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	printf("\n");
	printf("\ntotal number of readout events = %ld", total_number_of_readout_events);
	printf("\n        total number of errors = %ld", total_number_of_errors);
	//printf("\nnumber of times exactly one packet was missing = %d", histogram_of_incomplete_events_560);
	//printf("\nnumber of times some other number of words was missing = %d", histogram_of_incomplete_events_other);
	printf("\n");

	close_pci();
	
	for(int i=0; i<4; i++) {
		if (ch_en[i] == true) {
//			fprintf(stderr, "ch%d: %lld bytes - read: %lld us, logging %lld us, total %lld us\n", i, total[i], readtime[i], writetime[i], readtime[i] + writetime[i]);
			close(fd[i]);
		}
	}

	return 0;
}

