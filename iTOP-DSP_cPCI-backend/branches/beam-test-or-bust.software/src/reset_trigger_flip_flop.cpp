#include "../contrib/stdPCI.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <getopt.h>
#include <string.h>
#include <ctype.h>

//#define BUFFER_SIZE 65536
#define BUFFER_SIZE 300000

inline unsigned int read_quarter_events_from_all_enabled_channels(unsigned char channel_bitmask);

// defined here so there aren't a bunch of magic fours hanging around in the code:
#define NUMBER_OF_BYTES_IN_A_WORD (4)

// configuration input for our system:
#define NUMBER_OF_WORDS_IN_A_PACKET (140)
#define NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT (130)
#define NUMBER_OF_SCRODS_TO_READOUT (4)
#define SUGGESTED_NUMBER_OF_PARTS_IN_WHICH_TO_READ_EACH_QUARTER_EVENT (4) // be careful that the quarter event size is a multiple of this number

// calculated (values in units of BYTES are calculated from those given in WORDS):
#define QUARTER_EVENT_SIZE_IN_WORDS (NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT)
#define QUARTER_EVENT_SIZE_IN_BYTES (QUARTER_EVENT_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
#define WHOLE_EVENT_SIZE_IN_WORDS (NUMBER_OF_SCRODS_TO_READOUT*QUARTER_EVENT_SIZE_IN_BYTES)
#define WHOLE_EVENT_SIZE_IN_BYTES (WHOLE_EVENT_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
#define MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS (QUARTER_EVENT_SIZE_IN_WORDS/SUGGESTED_NUMBER_OF_PARTS_IN_WHICH_TO_READ_EACH_QUARTER_EVENT)
#define MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES (MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)

#define BUFFER_SIZE_IN_WORDS (22000)
#define BUFFER_SIZE_IN_BYTES (BUFFER_SIZE_IN_WORDS*NUMBER_OF_BYTES_IN_A_WORD)
unsigned long int word_buffer[NUMBER_OF_SCRODS_TO_READOUT][BUFFER_SIZE_IN_WORDS];
         char     byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][BUFFER_SIZE_IN_BYTES];
unsigned long int header = 0x00be11e2;

#define debug(message) (fprintf(STDOUT, (message)); fprintf(STDOUT, "\n");)
#define error(message) (fprintf(STDERR, (message)); fprintf(STDERR, "\n");)

char* device_name;   // note: this will point to an argv c-string
					 // or a stack variable from main()
					 // e.g. DO NOT FREE THIS VARIABLE
stdPCI pci;

void start_timer();
int stop_timer(struct timeval* begin = NULL);

struct timeval start, end, watchdog;

int get_terminal_width() {
	struct winsize ws; 

	if (ioctl(0,TIOCGWINSZ,&ws)!=0) { 
	fprintf(stderr,"TIOCGWINSZ:%s\n",strerror(errno)); 
	} 
	return ws.ws_col;
}

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
	bool ack = false;                            // flow control mode
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
		    {"flow", 0, 0, 'f'},
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
			for(int i=0; i < 4; i++)
				if (ch_en[i])
					fprintf(stderr, "CH%d ", i);

			fprintf(stderr, "\n");
			break;

	       case 'f':
		    fprintf (stderr, "flow control mode\n");
			ack = true;
		    break;

	       case 'v':
		    fprintf (stderr, "verbose mode\n");
			verbose = true;
		    break;

	       case 't':
			target = (long long)atoi(optarg);
			if (optarg[strlen(optarg) - 1] == 'G')
				target *= 1000000000;
			if (optarg[strlen(optarg) - 1] == 'M')
				target *= 1000000;
			if (optarg[strlen(optarg) - 1] == 'k')
				target *= 1000;
			
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
			fprintf(stderr, "options: -f: flow control: send flow control packet when buffer empties\n"
				"         -c 0123: sets channels to read; default is all enabled\n"
                        	"         -t [size]: sets total size of data to read\n"
				"         -b [size]: sets size to transfer per operation\n"
				"         -p [prefix]: sets prefix of log files generated (default 'log')\n"
				"         -h: help: prints this help screen\n"
				"         -o [channel]: outputs a specific channel to stdout (binary)\n"
				"         -v: verbose mode: prints updates when data is transmitted\n\n"
				"long versions of these parameters also exist: --flow, --total, --blocksize,\n"
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


// end parsing

	// other variables
	int fd[4];				// file descriptors for output logs
	long long lastprint;			// MB count of last disk IO (for verbose mode)
	char* buffer = new char[BUFFER_SIZE];	// buffer for sent data
	char* buffer2 = new char[BUFFER_SIZE];	// buffer for incoming data
	char* flowpkt = new char[BUFFER_SIZE];	// buffer for flow control packet

	char default_device_name[15] = "/dev/altixpci0";	// PCI file handle
	device_name = default_device_name;			// device name

	long long total[4] = {0,0,0,0};		// total # of bytes read
	int val2;				// tmp value for # of bytes read in last operation
	int read[4];				// # of bytes read on most recent xfer (per chan)
	bool readdata[4] = {false, false, false, false};	// flag if data was read and flow
								// control should be sent on 0 bytes
								// read

	if (stdout_ch != -1)
		fd[stdout_ch] = STDOUT_FILENO;

	// open the PCI handles
	fprintf(stderr, "opening %s\n", device_name);
	if (pci.createHandles(device_name) < 0) {
		fprintf(stderr, "open PCI handles failed.  Is the driver loaded?\n");
		return -1;
	}

	// lock the desired card
	fprintf(stderr, "locking card %d\n", id);
	if (pci.lockCard(id) < 0) {
		fprintf(stderr, "lock card failed\n");
		if (id == 0)
			fprintf(stderr, "\nID is set to zero.  Did you forgot to specify ID on the command line?\n\n");
		return -1;
	}

	pci.sendVetoClear();
	pci.freeHandles();

	return 0;
}

