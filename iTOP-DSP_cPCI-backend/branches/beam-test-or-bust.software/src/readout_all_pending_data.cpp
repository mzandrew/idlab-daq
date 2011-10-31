// 2011-?? Andrew Wong
// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <getopt.h>
#include <string.h>
#include <ctype.h>
#include <string>

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

	setup_pci(id);
	readout_all_pending_data();
	close_pci();
	
	return 0;
}

