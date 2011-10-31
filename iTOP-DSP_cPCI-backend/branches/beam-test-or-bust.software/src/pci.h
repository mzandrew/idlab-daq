#ifndef idlab_pci
#define idlab_pci

#include "../contrib/stdPCI.h"

extern stdPCI pci;

int setup_pci(int id);
void close_pci(int id);

#endif

