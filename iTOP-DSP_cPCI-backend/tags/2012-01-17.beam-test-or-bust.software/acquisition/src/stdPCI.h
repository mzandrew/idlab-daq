#ifndef __STDPCI_H__
#define __STDPCI_H__

#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h> 
#include <stdint.h>
#include <vector>
using namespace std;

#include "../contrib/altix_userland.h"

extern "C"{
#include "../contrib/libaltix.h"
}

#define CHECK_CARD_ID       if (card_id == -1)             \
								lockCard(id);              \
							if (card_id == -1)             \
								return ALTIX_CARD_NOT_VALID


class stdPCI {
public:
	int createHandles(char* dev);
	int freeHandles();

	int readData(char* buffer, int size, int id=-1);
	int sendData(const char* buffer, int size, int id = -1);
	
	int setPosition(int pos, int id = -1);
	int rewind();
	
	int setCard(int id);
	int lockCard(int id);
	int unlockCard(int id);
	int getCardCount();
	int getMemoryLength(int id);
	
	int selectChannel(int ch);
	int sendVetoClear();

	vector<int> getIDList();
	int readSignals();
	
private:
	int fd;
	int card_id; // current card
	
	altix_pci_card_info* cards;
	unsigned long num_cards;
};

#endif
