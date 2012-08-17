// 2011-?? Andrew Wong
// 2011-?? mza

#include <stdio.h>
#include "pci.h"
#include "DebugInfoWarningError.h"

char default_device_name[15] = "/dev/altixpci0";	// PCI file handle
char *device_name;   // note: this will point to an argv c-string or a stack variable from main() e.g. DO NOT FREE THIS VARIABLE
stdPCI pci;
int card_id;

int setup_pci(int id) {
	card_id = id;
	device_name = default_device_name; // device name "/dev/altixpci0"
	// open the PCI handles
	fprintf(debug, "attempting to open card #%d on device \"%s\"...\n", card_id, device_name);
	if (pci.createHandles(device_name) < 0) {
		fprintf(error, "open PCI handles failed.  Is the driver loaded?\n");
		exit(-2);
	}
	// lock the desired card
	fprintf(debug, "locking DSP_cPCI revB card #%d\n", card_id);
	if (pci.lockCard(card_id) < 0) {
		fprintf(error, "lock card failed\n");
		if (card_id == 0) fprintf(error, "\ncard ID is set to zero.  Did you forgot to specify the card ID?\n\n");
		exit(-3);
	}
}

void close_pci(void) {
	fprintf(debug, "closing DSP_cPCI revB card #%d\n", card_id);
	pci.unlockCard(card_id);
	pci.freeHandles();
}

