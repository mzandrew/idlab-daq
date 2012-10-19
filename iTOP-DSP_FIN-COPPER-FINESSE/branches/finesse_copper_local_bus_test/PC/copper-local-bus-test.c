/* originally finesse_type.c
 * modified 2010 March-April by mza to test DSP_FIN copper local bus vhdl program
 */

#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h> // rand(), srand()
#include <time.h>   // time(), clock()
#include <sys/mman.h>
#include "find_pci_path.h"

#define LOOP_CONSTANT (1000000)
#define ARRAY_SIZE (256)
#define ARRAY_PARTIAL_RANGE__FIRST (0x40)
#define ARRAY_PARTIAL_RANGE__LAST  (0x7f)

int slot = -1;
unsigned long localbus_addr;
unsigned char *localbus;
unsigned long csr[4] = { 0x00100000, 0x00100200, 0x00100400, 0x00100600 };
char *plx9054_path;

#define BIG_ARRAY_SIZE (8000000)
unsigned long int array[BIG_ARRAY_SIZE];
void test_local_bus__measure_write_data_rate(void);
void test_local_bus__measure_read_data_rate(void);
void test_local_bus__measure_write_and_then_read_data_rate(unsigned short int should_do_write_test, unsigned short int should_do_read_test);
void test_local_bus(void);
unsigned long int pseudo_random(unsigned long int first, unsigned long int last);
void test_local_bus__measure_write_and_then_read_data_rate__interleaved(void);

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

void test_local_bus(void) {
	while(1) {
//		test_local_bus__measure_write_data_rate();
//		test_local_bus__measure_read_data_rate();
//		test_local_bus__measure_write_and_then_read_data_rate(1, 1);
		test_local_bus__measure_write_and_then_read_data_rate__interleaved();
	}
}

void test_local_bus__measure_write_data_rate(void) {
	test_local_bus__measure_write_and_then_read_data_rate(1, 0);
}

void test_local_bus__measure_read_data_rate(void) {
	test_local_bus__measure_write_and_then_read_data_rate(0, 1);
}

void test_local_bus__measure_write_and_then_read_data_rate(unsigned short int should_do_write_test, unsigned short int should_do_read_test) {
	unsigned long int number_of_writes = 0, number_of_reads = 0, number_of_errors = 0, number_of_loops = 0;
	unsigned short int value;
	srand(time(NULL));
	clock_t start_writing, done_writing, start_reading, done_reading;
	unsigned long int i, j;
	if (1) {
		for (i=0; i<BIG_ARRAY_SIZE; i++) {
			array[i] = pseudo_random(0x0, 0xff);
		}
		if (should_do_write_test) {
			start_writing = clock();
			for (i=0; i<BIG_ARRAY_SIZE; i++) {
				j = pseudo_random(ARRAY_PARTIAL_RANGE__FIRST, ARRAY_PARTIAL_RANGE__LAST);
				FINESSE_CSR_WR(slot, j, array[i]);
				number_of_writes++;
			}
			done_writing = clock();
			float seconds_for_write = ((float) (done_writing - start_writing)) / CLOCKS_PER_SEC;
			if (seconds_for_write) {
				float kilobytes_per_second_write = 1.0e-3 * number_of_writes / seconds_for_write;
				printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (write)\n", number_of_writes, seconds_for_write, kilobytes_per_second_write);
			}
			number_of_writes = 0;
		}
		if (should_do_read_test) {
			start_reading = clock();
			for (i=0; i<BIG_ARRAY_SIZE; i++) {
				j = pseudo_random(ARRAY_PARTIAL_RANGE__FIRST, ARRAY_PARTIAL_RANGE__LAST);
				FINESSE_CSR(slot, j);
				number_of_reads++;
			}
			done_reading = clock();
			float seconds_for_read  = ((float) (done_reading - start_reading)) / CLOCKS_PER_SEC;
			if (seconds_for_read) {
				float kilobytes_per_second_read  = 1.0e-3 * number_of_reads / seconds_for_read;
				printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (read)\n", number_of_reads, seconds_for_read, kilobytes_per_second_read);
			}
			number_of_reads = 0;
		}
	}
}

void test_local_bus__measure_write_and_then_read_data_rate__interleaved(void) {
	unsigned long int number_of_writes = 0, number_of_reads = 0, number_of_errors = 0, number_of_loops = 0;
	static unsigned long int millions_of_transfers = 0, number_of_transfers = 0;
	unsigned short int value;
	srand(time(NULL));
	clock_t start, done;
	unsigned long int i, j;
	if (1) {
		for (i=0; i<BIG_ARRAY_SIZE; i++) {
			array[i] = pseudo_random(0x0, 0xff);
		}
			start = clock();
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
//				if (number_of_transfers>=1000000) {
//					number_of_transfers -= 1000000;
//					millions_of_transfers++;
//				}
			}
			done = clock();
			unsigned long int m = (number_of_transfers - (number_of_transfers % 1000000)) / 1000000;
			number_of_transfers -= 1000000 * m;
			millions_of_transfers += m;
			float seconds = ((float) (done - start)) / CLOCKS_PER_SEC;
			if (seconds) {
				float kilobytes_per_second = 1.0e-3 * number_of_writes / seconds;
				printf("%d bytes in %4.1f seconds = %4.0f kilobytes per second (write, then read) (%d errors in %d M transfers)\n", number_of_writes, seconds, kilobytes_per_second, number_of_errors, millions_of_transfers);
			}
			number_of_writes = 0;
			number_of_reads = 0;
	}
}

