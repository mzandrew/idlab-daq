#include "read_fiber.h"
#include "read_CAMAC.h"

#include <sys/time.h>
#include <time.h>
#include <stdio.h>
#include <unistd.h>

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

#define SECONDS *1000000
#define CARD_ID  2
#define CAMAC_FILENAME "CAMAC_config.txt"
#define NUM_CHAN   4
#define BENCHMARK

int main() {

	long long spill_timeout = 10 SECONDS;      // define spill timeout
	int spill_number = 0;                      // spill number
	time_t spill_timestamp;            // spill timestamp
	time_t event_timestamp;            // event timestamp
	char spill_filename[100];                  // spill filename
	char event_filename[100];                  // event filename
	char buffer[1000000];                       // buffer to readout data

	init_fiber();
	init_camac(CAMAC_FILENAME);

	sleep(5);

	return 0;

#ifdef BENCHMARK
	struct timeval benchmark;
	gettimeofday(&benchmark, NULL);
	int benchmark_count = 0;
#endif


	//% matt's loop
	//% while (true) {
	while (true) {
		// probably want to poll to see when the next spill is starting, somehow

		//%   increment spill number;
		spill_number++;

		//%   generate timestamp for new spill file(s) ();
		time(&spill_timestamp);
		start_timer();

		//%   generate new filename(s) from that timestamp and spill number, ensure the file(s) do not yet exist and create them();
		strftime( spill_filename, 100, "%Y-%m-%d_%H-%M-%S", localtime(&spill_timestamp) );

		//%   while (spill timeout has not yet occurred) {
		while (stop_timer() < spill_timeout) {

			//%     read a whole event from the fibers();
				for(int i=0; i < NUM_CHAN; i++)
					read_fiber(CARD_ID, i, (void*)&buffer[400+i*DATASIZE]);   // put CAMAC data first

			//%     read an event's worth of CAMAC data();
				int count = read_camac((void*)buffer);

				if (count <= 0)
					continue;

					printf("\rread %d bytes...", count);

			//%     generate event timestamp();
				time(&event_timestamp);

			//%     save timestamped event data to file(s)();

				// insert fancier code to handle writing buffer to disk (or put it in a function)
				strftime( event_filename, 100, "%Y-%m-%d_%H-%M-%S.raw", localtime(&spill_timestamp));
				int fd = open(event_filename, O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
				if (fd < 0)
					printf("open fail\n");

				printf("wrote %d bytes\n", write(fd, buffer, 400) );
				close(fd);

			//%     clear veto();
				clear_veto(CARD_ID);

//				return 0;
				sleep(1);

#ifdef BENCHMARK
				benchmark_count++;
				if ((benchmark_count % 1000) == 0) {
					printf("benchmark: read %d events in %d us\n", benchmark_count, stop_timer(&benchmark) );
					if (benchmark_count >= 1000000) return 0;
				}
#endif

		//%   }
		}
		//%   sync disks();
		

	//% }
	}

}
