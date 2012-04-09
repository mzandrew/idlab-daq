#include "read_fiber.h"

stdPCI pci;

int init_fiber() {
	return 0;
	return pci.createHandles("/dev/altixpci0");
}

int read_fiber(int card, int ch, void* target_buffer) {
	return 0;
	pci.lockCard(card);
	pci.selectChannel(ch);

	// do readout
	char *buf = (char*)target_buffer;
	int result = pci.readData(buf, DATASIZE);

	pci.unlockCard(card);
	return result;
}

int clear_veto(int id) {
	return 0;
	pci.lockCard(id);
	int result = pci.sendVetoClear();
	pci.unlockCard(id);

	return result;
}

