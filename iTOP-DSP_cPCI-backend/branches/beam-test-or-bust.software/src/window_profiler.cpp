// 2011-?? Andrew Wong
// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include <stdio.h>
#include <getopt.h>

int main(int argc, char** argv) {
	if (argc == 1) {
		fprintf(stderr, "retrieve data from fiber optic link through PCI bus and write it to disk\n");
		fprintf(stderr, "syntax: %s [args] card_id\n", argv[0]);
		fprintf(stderr, "use \"%s --help\" to see valid arg values\n\n", argv[0]);
		return -1;
	}

	// variables that can be changed via parameters
	bool verbose = false;                        // verbose mode
	// getopt parsing
    int c;
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	char logprefix[100] = "log";                 // prefix of log files generated
	bool ch_en[4] = {true, true, true, true};    // enable flag for each channel

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
		if (c == -1) break; // this breaks the while(1) loop after there are no more options
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

	int card_id = atoi(argv[1]);
	if (optind < argc) {
		card_id = atoi(argv[optind]);
	} else {
		fprintf(stderr, "please specify a card_id # on the command line\n");
	}

	channel_bitmask = 0;
	for(int i=0; i<4; i++) {
		if (ch_en[i]) {
			channel_bitmask |= 1<<i;
		}
	}

	channel_bitmask = 0x8;

	setup_pci(card_id);
	should_soft_trigger = true;
	readout_all_pending_data();
	setup_default_log_filenames();
	open_logfiles_for_all_enabled_channels();

//	set_start_and_end_windows(  0, 511); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows(256, 511); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows(  0, 255); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows(100, 200); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows( 10,  20); usleep(10000); readout_N_events(1);

//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);

//	set_start_and_end_windows(508, 511); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(510,   1); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(511,   2); usleep(10000); readout_N_events(2);

//	set_start_and_end_windows(510,   1); usleep(10000); readout_N_events(2); // this has start_window > end_window
//	set_start_and_end_windows(  1,   7); usleep(10000); readout_N_events(2); // this has start_window set to an odd number
//	set_start_and_end_windows(  0,   8); usleep(10000); readout_N_events(2); // this has end_window set to an even number

	//set_start_and_end_windows( 16,  31); usleep(10000); readout_N_events(1);

	should_soft_trigger = true;
	send_front_end_trigger_veto_clear();
	usleep(10000);
	for (int i = 0; i < 32; i += 4) {	
		set_start_and_end_windows( i,  i+3); usleep(10000); readout_N_events(100);
	}

	close_all_logfiles();
	close_pci();

	return 0;
}

