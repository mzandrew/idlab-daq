#ifndef CPRDAQ_H_
#define CPRDAQ_H_


void cprdaq_reset_fifo_and_finesse();
int cprdaq_available_fins();
int cprdaq_enable_fins(string fins_requested);
int cprdaq_enable_fins(int fins_requested);
int cprdaq_init();
void cprdaq_term();
void cprdaq_close_data_file();
int cprdaq_open_data_file();

#endif //CPRDAQ_H_
