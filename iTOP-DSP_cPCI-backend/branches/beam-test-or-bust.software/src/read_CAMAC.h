#ifndef __READCAMAC_H__
#define __READCAMAC_H__

extern "C" {
#include "../contrib/libxxusb.h"
}

#include <stdio.h>
#include <string.h>

#define CAMAC_SLOTS       25
#define DEBUG_FLAG        0

struct CAMAC_crate {
  short int inUse[CAMAC_SLOTS];            // 1 if slot is used, 0 if empty
  short int readFunction[CAMAC_SLOTS];     // which function to use to read data
  unsigned int dataMask[CAMAC_SLOTS];
  short int channels[CAMAC_SLOTS];         // how many readout channels exist for the module
  
  short int CountFlag[CAMAC_SLOTS];      // Use address 0 of module to 
                                         // increment CAMAC event? 1 - yes
                                         //                        0 - no
  
  char serial[10];
  usb_dev_handle *hnd;
  
  short int output_order[CAMAC_SLOTS];
  short int output_order_len;
};

int init_camac(const char* settings_file);
int read_camac(void* target_buffer);
int read_data_from_CAMAC_and_write_to_CAMAC_file(void);
void open_CAMAC_file(void);
//extern int CAMAC_fd;
extern FILE *CAMAC_fd;

#endif

