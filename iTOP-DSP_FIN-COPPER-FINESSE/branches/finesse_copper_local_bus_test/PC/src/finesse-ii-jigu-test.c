/* originally finesse_type.c
 * modified 2010 March-April by mza to test DSP_FIN copper local bus and fifo
 * with finesse ii jigu board
 */

#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h> // rand(), srand()
#include <time.h>   // time(), clock(), timeval
// clock is cpu time, time is real time
#include <sys/mman.h>
#include "find_pci_path.h"
#include <unistd.h> // usleep()

#define LOOP_CONSTANT (1000000)
#define ARRAY_SIZE (256)
#define ARRAY_PARTIAL_RANGE__FIRST (0x40)
//#define ARRAY_PARTIAL_RANGE__LAST  (0x47)
#define ARRAY_PARTIAL_RANGE__LAST  (0x6f)
//#define ARRAY_PARTIAL_RANGE__LAST  (0x7f)
#define ARRAY_PARTIAL_RANGE__LENGTH (ARRAY_PARTIAL_RANGE__LAST - ARRAY_PARTIAL_RANGE__FIRST + 1)

int slot = -1;
unsigned long localbus_addr;
unsigned char *localbus;
unsigned long csr[4] = {0x00100000, 0x00100200, 0x00100400, 0x00100600};
char *plx9054_path;
struct timeval start1, end1, result1, start2, end2, result2;

#define BIG_ARRAY_SIZE (8000000)
unsigned long int array[BIG_ARRAY_SIZE];
void test_local_bus__measure_write_data_rate(void);
void test_local_bus__measure_read_data_rate(void);
void test_local_bus__measure_write_and_then_read_data_rate(unsigned short int should_do_write_test, unsigned short int should_do_read_test);
void test_local_bus(void);
unsigned long int pseudo_random(unsigned long int first, unsigned long int last);
void
test_local_bus__measure_write_and_then_read_data_rate__interleaved__single(void);
void
test_local_bus__measure_write_and_then_read_data_rate__interleaved__blocky(void);
void test_local_bus__write_and_then_read__blocky(void);
void write_to_jigu_fifo(unsigned long int value);

void write_value_to_finesse_local_bus_address(unsigned long int value, unsigned long int address);
unsigned long int read_value_from_finesse_local_bus_address(unsigned long int address);
void msleep(unsigned long int milliseconds);

int timeval_subtract (struct timeval *result, struct timeval *end, struct timeval *start);

#define FINESSE_CSR(slot,regno) ((*((volatile unsigned long *)(localbus+csr[slot]+regno*4)) >> 24 )& 0xff)
#define FINESSE_CSR_WR(slot,regno,regval) (*((volatile unsigned long *)(localbus+csr[slot]+regno*4)) = (regval << 24))
static unsigned char * localbus_map(unsigned long base);
static unsigned long localbus_find_addr(const char *path);

unsigned long int pseudo_random(unsigned long int first, unsigned long int last) {
	unsigned long int pr = rand();
	unsigned long int diff = last - first + 1;
//	printf("%d ", pr);
	pr /= 256;
//	printf("%d ", pr);
	pr *= diff;
//	printf("%d ", pr);
	pr = pr / (RAND_MAX / 256);
//	printf("%d ", pr);
	pr += first;
//	printf("%d ", pr);
//	printf("\n");
	if (last<pr) { pr = last; }
	if (pr<first) { pr = first; }
	return pr;
}

static unsigned long localbus_find_addr(const char *path) {
	typedef struct { unsigned long word[4]; unsigned long bar[4]; } pcichip;
	pcichip chip;
	int i, fd, ret;
	fd = open(path, O_RDONLY);
	if (fd < 0) {
		perror("open");
		return 0;
	}
	ret = read(fd, &chip, sizeof(chip));
	if (ret != sizeof(chip)) {
		perror("scan pci bar");
		close(fd);
		return 0;
	}
	close(fd);
	return chip.bar[2];
}

static unsigned char * localbus_map(unsigned long base) {
	int memfd;
	unsigned char * p;
	memfd = open("/dev/mem", O_RDWR);
	if (memfd == -1) {
		perror("open /dev/mem");
		return NULL;
	}
	p = mmap(0, 0x1000000, PROT_READ|PROT_WRITE, MAP_SHARED, memfd, base);
	if (p == (unsigned char *)0xFFFFFFFF) {
		perror("mmap");
		return NULL;
	}
	close(memfd);
	return p;
}

int main(int argc, char *argv[]) {
	int i, usage_error = 0;
	plx9054_path = get_copper_plx9054_path();
	for( i=1; i<argc; i++ ){
		if( !strncmp("--slot=",argv[i],7) ){
			slot = argv[i][7];
			slot = tolower(slot)-'a';
		}
		else {
			usage_error ++;
		}
	}
	if( slot<0 || slot>3 ) usage_error ++;
	if( usage_error ){
		fprintf(stderr, "usage: finesse_type --slot=SLOT\n");
		exit(2);
	}
	if( getuid() ){
		fprintf(stderr, "finesse_type: Permission denied\n");
		exit(1);
	}
	localbus_addr = localbus_find_addr(plx9054_path);
	localbus = localbus_map(localbus_addr);
	test_local_bus();
	return 0;
}

void test_local_bus__write_and_then_read__blocky(void) {
	unsigned long int number_of_writes = 0, number_of_reads = 0, number_of_errors = 0, number_of_loops = 0;
	static unsigned long int millions_of_transfers = 0, number_of_transfers = 0;
	unsigned short int value;
	srand(time(NULL));
//	clock_t start, done;
	unsigned long int i, j, k;
	if (1) {
		for (i=0; i<ARRAY_PARTIAL_RANGE__LENGTH; i++) {
			array[i] = pseudo_random(0x0, 0xff);
		}
//		start = clock();
		gettimeofday(&start1, NULL);	
//		unsigned long i_max = BIG_ARRAY_SIZE / ARRAY_PARTIAL_RANGE__LENGTH;
//		for (i=0; i<i_max; i++) {
			for (j=ARRAY_PARTIAL_RANGE__FIRST; j<=ARRAY_PARTIAL_RANGE__LAST; j++) {
				k = j - ARRAY_PARTIAL_RANGE__FIRST;
//				printf("writing 0x%02x to address 0x%02x\n", array[k], j);
				FINESSE_CSR_WR(slot, j, array[k]);
				number_of_writes++;
			}
			number_of_transfers++;
			for (j=ARRAY_PARTIAL_RANGE__LAST; j>=ARRAY_PARTIAL_RANGE__FIRST; j--) {
//			for (j=ARRAY_PARTIAL_RANGE__FIRST; j<=ARRAY_PARTIAL_RANGE__LAST; j++) {
				k = j - ARRAY_PARTIAL_RANGE__FIRST;
				value = FINESSE_CSR(slot, j);
//				printf("read 0x%02x from address 0x%02x\n", value, j);
				number_of_reads++;
//				printf("address 0x%02x: 0x%02x (written); 0x%02x (read back)\n", j, array[k], value);
				if (j == 0x57 || j == 0x63 || j >= 0x7a) {
//					printf("address 0x%02x: 0x%02x (written); 0x%02x (read back)\n", j, array[k], value);
				} else {
					if (value != array[k]) {
						number_of_errors++;
						printf("value at [0x%02x]: 0x%02x != 0x%02x (%d errors in %d transfers)\n", j, value, array[k], number_of_errors, number_of_transfers);
					}
				}
			}
//		}
//		done = clock();
		gettimeofday(&end1, NULL);	
		unsigned long int m = (number_of_transfers - (number_of_transfers % 1000000)) / 1000000;
		number_of_transfers -= 1000000 * m;
		millions_of_transfers += m;
//		float seconds = ((float) (done - start)) / CLOCKS_PER_SEC;
		timeval_subtract(&result1, &end1, &start1);
		float seconds = result1.tv_sec + result1.tv_usec / 1000000.0;
		if (seconds) {
			float kilobytes_per_second = 1.0e-3 * number_of_writes / seconds;
//			printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (write, then read) (%d errors in %d M transfers)\n", number_of_writes, seconds, kilobytes_per_second, number_of_errors, millions_of_transfers);
		}
		number_of_writes = 0;
		number_of_reads = 0;
	}
}

void test_local_bus__measure_write_and_then_read_data_rate(unsigned short int should_do_write_test, unsigned short int should_do_read_test) {
	unsigned long int number_of_writes = 0, number_of_reads = 0, number_of_errors = 0, number_of_loops = 0;
	unsigned short int value;
	srand(time(NULL));
//	clock_t start_writing, done_writing, start_reading, done_reading;
	unsigned long int i, j;
	if (1) {
		for (i=0; i<BIG_ARRAY_SIZE; i++) {
			array[i] = pseudo_random(0x0, 0xff);
		}
		if (should_do_write_test) {
//			start_writing = clock();
			gettimeofday(&start1, NULL);
			for (i=0; i<BIG_ARRAY_SIZE; i++) {
				j = pseudo_random(ARRAY_PARTIAL_RANGE__FIRST, ARRAY_PARTIAL_RANGE__LAST);
				FINESSE_CSR_WR(slot, j, array[i]);
				number_of_writes++;
			}
//			done_writing = clock();
			gettimeofday(&end1, NULL);
			timeval_subtract(&result1, &end1, &start1);
//			float seconds_for_write = ((float) (done_writing - start_writing)) / CLOCKS_PER_SEC;
			float seconds_for_write = result1.tv_sec + result1.tv_usec / 1000000.0;
			if (seconds_for_write) {
				float kilobytes_per_second_write = 1.0e-3 * number_of_writes / seconds_for_write;
				printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (write)\n", number_of_writes, seconds_for_write, kilobytes_per_second_write);
			}
			number_of_writes = 0;
		}
		if (should_do_read_test) {
//			start_reading = clock();
			gettimeofday(&start2, NULL);
			for (i=0; i<BIG_ARRAY_SIZE; i++) {
				j = pseudo_random(ARRAY_PARTIAL_RANGE__FIRST, ARRAY_PARTIAL_RANGE__LAST);
				FINESSE_CSR(slot, j);
				number_of_reads++;
			}
//			done_reading = clock();
			gettimeofday(&end2, NULL);
			timeval_subtract(&result2, &end2, &start2);
//			float seconds_for_read  = ((float) (done_reading - start_reading)) / CLOCKS_PER_SEC;
			float seconds_for_read = result2.tv_sec + result2.tv_usec / 1000000.0;
			if (seconds_for_read) {
				float kilobytes_per_second_read  = 1.0e-3 * number_of_reads / seconds_for_read;
				printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (read)\n", number_of_reads, seconds_for_read, kilobytes_per_second_read);
			}
			number_of_reads = 0;
		}
	}
}

// the following function ran for 135,112,000,000 transfers with 0 errors with the
// copper local bus DSP_FIN revC firmware that was in use on 2010-07-07
// it worked flawlessly with the same firmware the next day for 22,808,000,000 transfers
void test_local_bus__measure_write_and_then_read_data_rate__interleaved__single(void) {
	unsigned long int number_of_writes = 0, number_of_reads = 0, number_of_errors = 0, number_of_loops = 0;
	static unsigned long int millions_of_transfers = 0, number_of_transfers = 0;
	unsigned short int value;
	srand(time(NULL));
//	clock_t start, done;
	unsigned long int i, j;
	if (1) {
		for (i=0; i<BIG_ARRAY_SIZE; i++) {
			array[i] = pseudo_random(0x0, 0xff);
		}
//			start = clock();
			gettimeofday(&start1, NULL);
			for (i=0; i<BIG_ARRAY_SIZE; i++) {
				j = pseudo_random(ARRAY_PARTIAL_RANGE__FIRST, ARRAY_PARTIAL_RANGE__LAST);
				FINESSE_CSR_WR(slot, j, array[i]);
				value = FINESSE_CSR(slot, j);
				if (j == 0x57 || j == 0x63 || j >= 0x7a) {
				} else {
					if (value != array[i]) {
						printf("value at [0x%02x]: 0x%02x != 0x%02x (%d errors in %d M transfers)\n", j, value, array[i], number_of_errors, millions_of_transfers);
						number_of_errors++;
					}
				}
				number_of_writes++;
				number_of_reads++;
				number_of_transfers++;
			}
//			done = clock();
			gettimeofday(&end1, NULL);
			timeval_subtract(&result1, &end1, &start1);
			unsigned long int m = (number_of_transfers - (number_of_transfers % 1000000)) / 1000000;
			number_of_transfers -= 1000000 * m;
			millions_of_transfers += m;
//			float seconds = ((float) (done - start)) / CLOCKS_PER_SEC;
			timeval_subtract(&result1, &end1, &start1);
			float seconds = result1.tv_sec + result1.tv_usec / 1000000.0;
			if (seconds) {
				float kilobytes_per_second = 1.0e-3 * number_of_writes / seconds;
				printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (write, then read) (%d errors in %d M transfers) [single]\n", number_of_writes, seconds, kilobytes_per_second, number_of_errors, millions_of_transfers);
			number_of_writes = 0;
			number_of_reads = 0;
			}
	}
}

// this function worked flawlessly with the firmware from 2010-04-08 for 27,471,000,000 transfers
void test_local_bus__measure_write_and_then_read_data_rate__interleaved__blocky(void) {
	unsigned long int number_of_writes = 0, number_of_reads = 0, number_of_loops = 0;
	static unsigned long int millions_of_transfers = 0, number_of_transfers = 0, number_of_errors = 0;
	unsigned short int value;
	srand(time(NULL));
//	clock_t start, done;
	unsigned long int i, j, k;
	if (1) {
		for (i=0; i<BIG_ARRAY_SIZE; i++) {
			array[i] = pseudo_random(0x0, 0xff);
		}
//		start = clock();
		gettimeofday(&start1, NULL);	
		unsigned long i_max = BIG_ARRAY_SIZE / ARRAY_PARTIAL_RANGE__LENGTH;
		for (i=0; i<i_max; i++) {
			for (j=ARRAY_PARTIAL_RANGE__FIRST; j<=ARRAY_PARTIAL_RANGE__LAST; j++) {
				k = i * ARRAY_PARTIAL_RANGE__LENGTH + j - ARRAY_PARTIAL_RANGE__FIRST;
				FINESSE_CSR_WR(slot, j, array[k]);
				number_of_writes++;
			}
			for (j=ARRAY_PARTIAL_RANGE__LAST; j>=ARRAY_PARTIAL_RANGE__FIRST; j--) {
//			for (j=ARRAY_PARTIAL_RANGE__FIRST; j<=ARRAY_PARTIAL_RANGE__LAST; j++) {
				k = i * ARRAY_PARTIAL_RANGE__LENGTH + j - ARRAY_PARTIAL_RANGE__FIRST;
				value = FINESSE_CSR(slot, j);
				if (j == 0x57 || j == 0x63 || j >= 0x7a) {
				} else {
					if (value != array[k]) {
						printf("value at [0x%02x]: 0x%02x != 0x%02x (%d errors in %d M transfers)\n", j, value, array[k], number_of_errors, millions_of_transfers);
						number_of_errors++;
					}
				}
				number_of_reads++;
				number_of_transfers++;
			}
		}
//		done = clock();
		gettimeofday(&end1, NULL);
		timeval_subtract(&result1, &end1, &start1);
		float seconds = result1.tv_sec + result1.tv_usec / 1000000.0;
		unsigned long int m = (number_of_transfers - (number_of_transfers % 1000000)) / 1000000;
		number_of_transfers -= 1000000 * m;
		millions_of_transfers += m;
//		float seconds = ((float) (done - start)) / CLOCKS_PER_SEC;
		if (seconds) {
			float kilobytes_per_second = 1.0e-3 * number_of_writes / seconds;
			printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (write, then read) (%d errors in %d M transfers) [blocky]\n", number_of_writes, seconds, kilobytes_per_second, number_of_errors, millions_of_transfers);
		}
		number_of_writes = 0;
		number_of_reads = 0;
	}
}

void test_local_bus__measure_write_data_rate(void) {
	test_local_bus__measure_write_and_then_read_data_rate(1, 0);
}

void test_local_bus__measure_read_data_rate(void) {
	test_local_bus__measure_write_and_then_read_data_rate(0, 1);
}

/*
Subtract the `struct timeval' values X and Y,
storing the result in RESULT.
Return 1 if the difference is negative, otherwise 0.
*/
// copied & modified from info page for libc / elapsed time
int timeval_subtract (struct timeval *result, struct timeval *end, struct timeval *start) {
       /* Perform the carry for the later subtraction by updating Y. */
       if (end->tv_usec < start->tv_usec) {
         int nsec = (start->tv_usec - end->tv_usec) / 1000000 + 1;
         start->tv_usec -= 1000000 * nsec;
         start->tv_sec += nsec;
       }
       if (end->tv_usec - start->tv_usec > 1000000) {
         int nsec = (end->tv_usec - start->tv_usec) / 1000000;
         start->tv_usec += 1000000 * nsec;
         start->tv_sec -= nsec;
       }
       /* Compute the time remaining to wait.
          `tv_usec' is certainly positive. */
       result->tv_sec = end->tv_sec - start->tv_sec;
       result->tv_usec = end->tv_usec - start->tv_usec;
       /* Return 1 if result is negative. */
       return end->tv_sec < start->tv_sec;
}

void write_value_to_finesse_local_bus_address(unsigned long int value, unsigned long int address) {
	FINESSE_CSR_WR(slot, address, value);
}

unsigned long int read_value_from_finesse_local_bus_address(unsigned long int address) {
	unsigned long int value;
	value = FINESSE_CSR(slot, address);
	return value;
}

void msleep(unsigned long int milliseconds) {
	usleep(milliseconds * 1000);
}

void write_to_jigu_fifo(unsigned long int value) {
	unsigned short int hh, hl, lh, ll;
	hh = (value & 0xff000000) >> 24;
	hl = (value & 0x00ff0000) >> 16;
	lh = (value & 0x0000ff00) >> 8;
	ll =  value & 0x000000ff;
	write_value_to_finesse_local_bus_address(hh, 0x04);
	write_value_to_finesse_local_bus_address(hl, 0x05);
	write_value_to_finesse_local_bus_address(lh, 0x06);
	write_value_to_finesse_local_bus_address(ll, 0x07); // this write performs the action
}

#define	COPPER_FF_RST 0x00000050 // COPPER Event FIFO & FINESSE Soft Reset
#define	COPPER_FF_RW  0x000000B8 // COPPER Event FIFO Single Read/Write Control
#define COPPER_FF_RA  0x00000110 // COPPER Event FIFO Ach Single Read
#define COPPER_FF_RB  0x00000114 // COPPER Event FIFO Bch Single Read
#define COPPER_FF_RC  0x00000118 // COPPER Event FIFO Cch Single Read
#define COPPER_FF_RD  0x0000011C // COPPER Event FIFO Dch Single Read

unsigned long int read_value_from_finesse_fifo(void) {
	//unsigned long int a = *(unsigned long *) (localbus + csr[slot] + COPPER_FF_RA + 4*slot);
	unsigned long int a = *(unsigned long *) (localbus + COPPER_FF_RA + 4*slot);
	return a;
}

void test_local_bus(void) {
	unsigned long int i, j, k, l, m, n, switches, a, b, c, d;
	write_value_to_finesse_local_bus_address(0x02, 0xff);
	write_value_to_finesse_local_bus_address(0x03, 0x00);
	//*(unsigned long *) (localbus + csr[slot] + COPPER_FF_RW) = 1;
	while (1) {
		for (i=0x00000000; i<=0xffffffff; i++) {
			j =  i & 0x000000ff;
			k = (i & 0x0000ff00) >> 8;
			l = (i & 0x00ff0000) >> 16;
			m = (i & 0xff000000) >> 24;
			write_value_to_finesse_local_bus_address(m, 0x0a);
			write_value_to_finesse_local_bus_address(l, 0x0b);
			write_value_to_finesse_local_bus_address(k, 0x0c);
			write_value_to_finesse_local_bus_address(j, 0x00);
			switches = read_value_from_finesse_local_bus_address(0x01);
//			printf("switches:  0x%02x\n", switches);
			*(unsigned long *) (localbus + COPPER_FF_RW) = 0;
			write_to_jigu_fifo(0x12345678);
			write_to_jigu_fifo(0x12345678);
//			write_to_jigu_fifo(0x12345678);
//			write_to_jigu_fifo(0x12345678);
//			write_to_jigu_fifo(0x12345678);
//			write_to_jigu_fifo(0x12345678);
//			write_to_jigu_fifo(0x12345678);
//			write_to_jigu_fifo(0x12345678);
//			write_to_jigu_fifo(0xabcdef01);
//			write_to_jigu_fifo(0x6543210f);
//			write_to_jigu_fifo(0x89abcdef);
//			msleep(switches);
			msleep(17);
			*(unsigned long *) (localbus + COPPER_FF_RW) = 1;
			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
//			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
//			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
//			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
//			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
//			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
//			a = read_value_from_finesse_fifo(); printf(" 0x%08x", a);
			printf("\n");
		}
	}
}

