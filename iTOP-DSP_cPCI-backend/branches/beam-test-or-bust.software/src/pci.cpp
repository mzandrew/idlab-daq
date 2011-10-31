// 2011-?? Andrew Wong
// 2011-?? mza

#include "pci.h"
#include <stdio.h>

char default_device_name[15] = "/dev/altixpci0";	// PCI file handle
char *device_name;   // note: this will point to an argv c-string or a stack variable from main() e.g. DO NOT FREE THIS VARIABLE
stdPCI pci;

int setup_pci(int id) {
	device_name = default_device_name; // device name "/dev/altixpci0"
	// open the PCI handles
	fprintf(stderr, "attempting to open device \"%s\"...\n", device_name);
	if (pci.createHandles(device_name) < 0) {
		fprintf(stderr, "open PCI handles failed.  Is the driver loaded?\n");
		exit(-2);
	}
	// lock the desired card
	fprintf(stderr, "locking card %d\n", id);
	if (pci.lockCard(id) < 0) {
		fprintf(stderr, "lock card failed\n");
		if (id == 0)
			fprintf(stderr, "\ncard ID is set to zero.  Did you forgot to specify the card ID?\n\n");
		exit(-3);
	}
}

void close_pci(int id) {
	pci.unlockCard(id);
	pci.freeHandles();
}

