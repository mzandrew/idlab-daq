#ifndef __READFIBER_H__
#define __READFIBER_H__

#include "stdPCI.h"

#define DATASIZE 72800

int init_fiber();
int read_fiber(int card, int ch, void* target_buffer);

int clear_veto(int id);

#endif
