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

int stdPCI::createHandles(char* dev) {
	// function doesn't (shouldn't) modify dev
	num_cards = altix_initialize((char*)dev);
	
#ifdef ALTIX_DEBUG
	if(geteuid() != 0)
	{
		printf("libaltix:  Most setups will require root privileges to access the PCI device\n");
	}
#endif
	fd = open(dev, O_RDWR);

	if (fd <0)
	{
		fprintf(stderr, "libaltix: could not open device %s, make sure the driver is loaded.\n", dev);
		return ALTIX_NOT_INITIALIZED;
	}
	int result;
	cards = altix_get_cards(fd, &result);

#ifdef ALTIX_DEBUG
printf("libaltix: %d pci cards", sizeof(cards)/sizeof(altix_pci_card_info));
#endif
	return fd;
}

int stdPCI::freeHandles() {
	close(fd);
	return 0;
}

int stdPCI::readData(char* buffer, int size, int id) {
	CHECK_CARD_ID;

	if (altix_poll_read(fd) == 0)
		return 0;

	return read(fd, (void*)buffer, size);
}

int stdPCI::sendData(const char* buffer, int size, int id) {
	CHECK_CARD_ID;

	if (altix_poll_write(fd) == 0)
		return 0;


	return write(fd, (void*)buffer, size);
}

int stdPCI::setPosition(int pos, int id) {
	CHECK_CARD_ID;
	
	// TODO: add more error checking

	lseek(fd, pos, SEEK_SET);

	return 0;
}

int stdPCI::rewind() {
	return setPosition(0);
	
}

int stdPCI::setCard(int id) {
	if (card_id != -1)
		unlockCard(card_id);
	
	if (lockCard(id) == ALTIX_OK) {
		card_id = id;
		return ALTIX_OK;
	}
	return ALTIX_CARD_NOT_VALID;
}

int stdPCI::lockCard(int id) {
	int result = altix_lock_card(fd, id);

	if (result == ALTIX_OK) {
		return altix_toggle_dma(fd);
	}
	else
		return result;

	if (id == -1)
		return ALTIX_CARD_NOT_VALID;
	
	int cid = id;

	if(ioctl(fd, ALTIX_IOCTL_LOCK, &cid) == 0)  {
		card_id = cid;
		return ALTIX_OK;
	}
	#ifdef ALTIX_DEBUG
		printf("Lock error: %d\n", errno);
	#endif
	if(errno == EBUSY)
		return ALTIX_CARD_BUSY;
	else
		return ALTIX_CARD_NOT_VALID;	
}

int stdPCI::unlockCard(int id) {
	return altix_release_card(fd, id);
	int result = altix_release_card(fd, id);

	if (result == 0)
		card_id = -1;

	return result;

	int cid = id;

	if(ioctl(fd, ALTIX_IOCTL_RELEASE, &cid) == 0) {
		card_id = -1;
		return ALTIX_OK;
	}
	if(errno == EBUSY)
		return ALTIX_CARD_BUSY;
	if(errno == ENODEV)
		return ALTIX_CARD_NOT_VALID;
		
	return 0;
}

int stdPCI::getCardCount() { return num_cards; }

int stdPCI::getMemoryLength(int id) {
	for(unsigned int i=0; i < num_cards; i++)
		if (cards[i].id == id) {
			if (cards[i].memlen > 2048) return 2048;
			return cards[i].memlen;
		}
	
	return ALTIX_CARD_NOT_VALID;
}

int stdPCI::selectChannel(int ch) {
//	printf("switch_channel: %d %d\n", fd, ch);
	int result = altix_switch_channel(fd, ch);
	altix_enable_chan(fd, true);
	return result;
}

vector<int> stdPCI::getIDList() {
	vector<int> result;

	for(unsigned int i=0; i < num_cards; i++)
		result.push_back(cards[i].id);
		
	return result;
}

int stdPCI::sendVetoClear() {
	return altix_send_pulse(fd, 1);
}

int stdPCI::readSignals() {
	int signals = 0;
	if (altix_read_pulse(fd, &signals) == ALTIX_OK) {
//		printf("state of signals on front-panel:  %08x\n", signals);
	}
	return signals;
}

