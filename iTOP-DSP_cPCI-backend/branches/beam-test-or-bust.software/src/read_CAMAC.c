// 2011-09 Andrew Wong
// 2011-11 mza

#include "read_CAMAC.h"
#include <stdio.h>
#include <fcntl.h>

struct CAMAC_crate crates[10];
int crate_count = 0;

//int CAMAC_fd;
FILE *CAMAC_fd;

//1 = display output data, 2 = display data sent and retrieved with each operation
#define DEBUG_FLAG 1

long stack_cmd[1024];
int stack_cmd_len = 1;

int init_camac(const char* settings_file) {
//  printf("init_camac\n");  

  bzero(&crates, sizeof(struct CAMAC_crate) * 10);
  
  // read in CAMAC crate modules
  FILE* fconfig = fopen(settings_file, "r");
  char buffer[1024];
  
  fscanf(fconfig, "%s", buffer);
  while (!feof(fconfig)) {
    if (buffer[0] != ':') {
      printf("ERROR: expected ':' at beginning of word\n");
      return 1;
    }
    
    strcpy(crates[crate_count].serial, buffer+1);   // +1 because  : is the first character
    
    // this is where we read in the modules
    fscanf(fconfig, "%s", buffer);
    while (!feof(fconfig) && buffer[0] != ':') {
      // first value is slot number
      int slot = atoi(buffer);
      if (DEBUG_FLAG)
        printf("slot: %i\n",slot);
      crates[crate_count].inUse[slot] = 1;
      
      // update output order length
      crates[crate_count].output_order[crates[crate_count].output_order_len] = slot;
      crates[crate_count].output_order_len++;
      
      // second value is number of channels
      fscanf(fconfig, "%s", buffer);
      int ch = atoi(buffer);
      if (DEBUG_FLAG)
        printf("\t#channels: %i\n",ch);
      crates[crate_count].channels[slot] = ch;
      
      // next value is F function used
      fscanf(fconfig, "%s", buffer);
      int funct;
      sscanf(buffer,"%i",&funct);
      if (DEBUG_FLAG)
        printf("\tread : F%i\n",funct);
      crates[crate_count].readFunction[slot] = funct;

      // next value is data mask
      fscanf(fconfig, "%s", buffer);
      unsigned int mask;
      sscanf(buffer, "%x", &mask);
      if (DEBUG_FLAG)
        printf("\tdata mask: %#x\n",mask);
      crates[crate_count].dataMask[slot] = mask;

      fscanf(fconfig, "%s", buffer);  // omit dummy item
      fscanf(fconfig, "%s", buffer);
    }
    
    crate_count++;
  }
  
  // open our handles
  for(int i=0; i < crate_count; i++) {
    crates[i].hnd = xxusb_serial_open(crates[i].serial);
    
    if (!crates[i].hnd) {
      printf("WARNING: %s failed to open\n", crates[i].serial);
      return -1;
    }
    CAMAC_Z(crates[i].hnd);
    CAMAC_C(crates[i].hnd);
	long int retval;
	int q, x;
  }

#define ENCODE_COMMAND(N, A, F)  ( 512*N + 32*A + F )

  // build the command stack
    for(int i=0; i < crate_count; i++) {
      for(int j=0; j < crates[i].output_order_len; j++) {
	int slot = crates[i].output_order[j];

	for(int k=0; k < crates[i].channels[slot]; k++) {
	  if(crates[i].readFunction[slot] == 99) {	  
		stack_cmd[stack_cmd_len++] = ENCODE_COMMAND( slot, 0, 0);
	  }
	  else {
		stack_cmd[stack_cmd_len++] = ENCODE_COMMAND( slot, k, crates[i].readFunction[slot] );
	  }
	}
      }
    }
 
	stack_cmd[0] = stack_cmd_len - 1;
	int count = xxusb_stack_write(crates[0].hnd, 2, stack_cmd);

	printf("%d bytes sent to controller\n", count);

	printf("stack initialized:\n");
	for(int i=0; i < stack_cmd_len; i++)
		printf("%08lx\n", stack_cmd[i]);

	printf("\n\n");

//	xxusb_stack_write(crates[0].hnd, 2, stack_cmd);
  return 0;
}

int read_camac(void* target_buffer) {
// use this if you want to use execute, which is known to work but likely slower
	memcpy(target_buffer, stack_cmd, 400);
	return xxusb_stack_execute(crates[0].hnd, (long int*)target_buffer);
//	fprintf(stderr, ".");

//	return xxusb_bulk_read(crates[0].hnd, (char*)target_buffer, 400, 1000);
}

void open_CAMAC_file(void) {
	char filename[] = "logdir/CAMAC_data.txt";
	//CAMAC_fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
	CAMAC_fd = fopen(filename, "w");
	if (CAMAC_fd < 0) fprintf(stderr, "WARNING: failed to create file \"%s\"\n", filename);
}

int read_data_from_CAMAC_and_write_to_CAMAC_file(void) {
	static int CAMAC_count = 0; // number of readouts
	char buffer[400];
	int count = read_camac((void*) buffer);
//	count *= 4; // presumably it's 32 bit data?
	unsigned long int *uint32 = (unsigned long int *) buffer;
	if (count <= 0) {
		return 0;
	} else {
		CAMAC_count++;
		printf("read %d bytes from CAMAC\n", count);
		buffer[count-1] = 0;
//		int return_value = fprintf(CAMAC_fd, buffer, count);
//		int return_value = fprintf(CAMAC_fd, "CAMAC readout #%d (%d bytes): \"%s\"\n", CAMAC_count, count, buffer);
		fprintf(CAMAC_fd, "CAMAC readout #%d (%d bytes):\n", CAMAC_count, count);
		for (int i=0; i<count; i++) {
			fprintf(CAMAC_fd, "%u ", uint32[i]);
			if (i%4==3) { fprintf(CAMAC_fd, " "); }
			if (i%8==7) { fprintf(CAMAC_fd, "\n"); }
		}
//		if (return_value == -1) {
//			fprin
//		}
		return count;
	}
}

