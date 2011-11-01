#ifndef idlab_pci
#define idlab_pci

#include "../contrib/stdPCI.h"

extern stdPCI pci;
extern int card_id;

int setup_pci(int id);
void close_pci(void);

#endif

