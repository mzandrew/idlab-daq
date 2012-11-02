#ifndef CPRDAQ_H_
#define CPRDAQ_H_

#include <sys/types.h>

void cprdaq_reset_fifo_and_finesse();
int cprdaq_available_fins();
int cprdaq_enable_fins(string fins_requested);
int cprdaq_enable_fins(int fins_requested);
int cprdaq_init();
void cprdaq_term();
void cprdaq_close_data_file();
int cprdaq_open_data_file();
unsigned short cprdaq_link_status();
int cprdaq_send_veto_clear();
void reset_trigger_flip_flop(void);
int cprdaq_read_event(u_int32_t *buf, int bufsize, bool block);
int cprdaq_send_data(u_int32_t *buf, int len, unsigned short mask);
int cprdaq_enable_loopback(const unsigned int mask);


#endif //CPRDAQ_H_
