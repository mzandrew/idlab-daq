// 2011-09 Andrew Wong
// 2011-11 mza

using namespace std;

#include "acquisition.h"
#include "read_CAMAC.h"
#include <string>
#include <iostream>
#include <stdio.h>
#include <fcntl.h>

struct CAMAC_crate crates[10];
int crate_count = 0;

int CAMAC_fd = -7; // negative to avoid problem closing an unopened file
string CAMAC_filename;
string old_CAMAC_filename;

//1 = display output data, 2 = display data sent and retrieved with each operation
//#define DEBUG_FLAG 1

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
	printf("sent %d bytes to CAMAC controller\n", count);
	printf("stack initialized:\n");
	for(int i=0; i < stack_cmd_len; i++) {
//		printf("%08lx\n", stack_cmd[i]);
	}
	printf("\n\n");
//	xxusb_stack_write(crates[0].hnd, 2, stack_cmd);
  return 0;
}

int read_camac(void* target_buffer) {
// use this if you want to use execute, which is known to work but likely slower
	memcpy(target_buffer, stack_cmd, 1024);
	return xxusb_stack_execute(crates[0].hnd, (long int*)target_buffer);
//	fprintf(stderr, ".");
//	return xxusb_bulk_read(crates[0].hnd, (char*)target_buffer, 1024, 1000);
}

void open_CAMAC_file(void) {
	if (CAMAC_fd >= 0) {
		//fprintf(stdout, "closing CAMAC file \"%s\"\n", old_CAMAC_filename.c_str());
		fprintf(stdout, "\"%s\" closed\n", old_CAMAC_filename.c_str());
		close(CAMAC_fd);
	}
	CAMAC_filename = base_filename;
	CAMAC_filename += ".camac";
	CAMAC_fd = open(CAMAC_filename.c_str(), O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
	if (CAMAC_fd < 0) {
		fprintf(stderr, "ERROR: failed to create CAMAC file \"%s\"\n", CAMAC_filename.c_str());
	} else {
		old_CAMAC_filename = CAMAC_filename;
		//fprintf(stdout, "opened CAMAC file \"%s\"\n", CAMAC_filename.c_str());
		fprintf(stdout, "\"%s\" open\n", CAMAC_filename.c_str());
	}
}

void split_CAMAC_file_to_prepare_for_next_spill(void) {
	open_CAMAC_file();
}

int read_data_from_CAMAC_and_write_to_CAMAC_file(void) {
//	static unsigned int CAMAC_count = 0; // number of readouts
	static unsigned int CAMAC_header = 0x12345678;
	char buffer[1024];
	int count = read_camac((void*) buffer);
//	count *= 4; // presumably it's 32 bit data?
	unsigned long int *uint32 = (unsigned long int *) buffer;
	if (count <= 0) {
		return 0;
	} else {
//		CAMAC_count++;
		//printf("read %d bytes from CAMAC\n", count);
		printf("C[%d] ", count);
		buffer[count-1] = 0;
//		int return_value = fprintf(CAMAC_fd, buffer, count);
//		int return_value = fprintf(CAMAC_fd, "CAMAC readout #%d (%d bytes): \"%s\"\n", CAMAC_count, count, buffer);
		//fprintf(CAMAC_fd, "CAMAC readout #%d (%d bytes):\n", CAMAC_count, count);
//		unsigned int temp = 0x00be11e2;
//		write(CAMAC_fd, (char *) &temp, sizeof(unsigned int));
		write(CAMAC_fd, (char *) &CAMAC_header, sizeof(unsigned int));
		write(CAMAC_fd, (char *) &event_number, sizeof(unsigned int));
		write(CAMAC_fd, buffer, 116*4);
//		for (int i=0; i<count; i++) {
//			//fprintf(CAMAC_fd, "%u ", uint32[i]);
//			//write(CAMAC_fd, "%u ", uint32[i]);
//			write(CAMAC_fd, uint32[i], sizeof(unsigned int) * 4);
//			//if (i%4==3) { fprintf(CAMAC_fd, " "); }
//			//if (i%8==7) { fprintf(CAMAC_fd, "\n"); }
//		}
//		if (return_value == -1) {
//			fprin
//		}
		return count;
	}
}

//####### for 3377

#define NUMBER_OF_3377s_TO_READOUT (3)
unsigned short int slot[NUMBER_OF_3377s_TO_READOUT] = { 18, 19, 20 };

int CAMAC3377_fd = -7; // negative to avoid problem closing an unopened file
string CAMAC3377_filename;
string old_CAMAC3377_filename;

void open_CAMAC3377_file(void) {
	if (CAMAC3377_fd >= 0) {
		//fprintf(stdout, "closing CAMAC3377 file \"%s\"\n", old_CAMAC3377_filename.c_str());
		fprintf(stdout, "\"%s\" closed\n", old_CAMAC3377_filename.c_str());
		close(CAMAC_fd);
	}
	CAMAC3377_filename = base_filename;
	CAMAC3377_filename += ".3377";
	CAMAC3377_fd = open(CAMAC_filename.c_str(), O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
	if (CAMAC3377_fd < 0) {
		fprintf(stderr, "ERROR: failed to create CAMAC3377 file \"%s\"\n", CAMAC3377_filename.c_str());
	} else {
		old_CAMAC3377_filename = CAMAC3377_filename;
		//fprintf(stdout, "opened CAMAC3377 file \"%s\"\n", CAMAC3377_filename.c_str());
		fprintf(stdout, "\"%s\" open\n", CAMAC3377_filename.c_str());
	}
}

void split_CAMAC3377_file_to_prepare_for_next_spill(void) {
	open_CAMAC3377_file();
}

void CAMAC_initialize_3377s(void) {
	long data, lam;
	int q=0, x=0;
	for (int i=0; i<NUMBER_OF_3377s_TO_READOUT; i++) {
		cout << "initializing 3377 #" << i << "..." << endl;
		// default program mode is common stop mode
		CAMAC_read(crates[0].hnd,slot[i],0,9,0,&q,&x);
		CAMAC_read(crates[0].hnd,slot[i],0,30,0,&q,&x); // set program mode to common stop and resets the Xilinx gate array
	}
	for (int i=0; i<NUMBER_OF_3377s_TO_READOUT; i++) {
		while (1) {
			CAMAC_read(crates[0].hnd,slot[i],0,13,0,&q,&x); // done programming flag (loop until q-1)
			if (!q) { break; }
		}
//		while (1) {
//			// supposed to test 25 here before 13
//			CAMAC_read(crates[0].hnd,slot[i],0,12,0,&q,&x); // test if Xilinx ready for data
//			if (!q) { break; }
//		}
////		cout << q << endl;
		CAMAC_read(crates[0].hnd,slot[i],0,9,0,&q,&x); // clears all data and events
		CAMAC_write(crates[0].hnd,slot[i],0,17,i,&q,&x); // write control registers
		CAMAC_write(crates[0].hnd,slot[i],1,17,0x0,&q,&x); // write control registers
		CAMAC_write(crates[0].hnd,slot[i],2,17,0x804,&q,&x); // write control registers (max 4 hits, 0x80*8ns=1024ns)
		CAMAC_write(crates[0].hnd,slot[i],3,17,0x0,&q,&x); // write control registers
		CAMAC_read(crates[0].hnd,slot[i],0,26,0,&q,&x); // enable lam
		CAMAC_read(crates[0].hnd,slot[i],1,26,0,&q,&x); // enable acquisition mode
//		cout << " is complete." << endl;
	}
}

void CAMAC_read_3377s(void) {
        static unsigned int Event_Header = 0x87654321;
	long data;
	char buffer[10000];
	unsigned int buffer_size=0;
	int q=0, x=0;
	for (int i=0; i<NUMBER_OF_3377s_TO_READOUT; i++) {
	  for(int j=0; j<100; j++){
	    CAMAC_read(crates[0].hnd,slot[i],2,27,0,&q,&x); // test readiness
	    if(q){
	      while (1) {
		CAMAC_read(crates[0].hnd,slot[i],0,0,&data,&q,&x); // read multi-hit fifo
		//cout << "Read: " << hex << data << " " << q << " " << x << endl;
		buffer[buffer_size]=(char)(data&0xFFFF);
		buffer_size++;
		if (!q) { break; }
	      }
	      break;
	    }
	    usleep(100);
	  }
	  CAMAC_read(crates[0].hnd,slot[i],0,9,0,&q,&x); // clears all data and events
	}

	//write to file
	write(CAMAC3377_fd, (char *) &Event_Header, sizeof(unsigned int));
	write(CAMAC3377_fd, (char *) &event_number, sizeof(unsigned int));
	write(CAMAC3377_fd, (char *) &buffer_size, sizeof(unsigned int));
	write(CAMAC3377_fd, buffer, buffer_size);
	//cout<<"3377: buffer_size="<<buffer_size<<endl;
}
