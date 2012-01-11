/************
** system.h
*************/
#include <stdlib.h>
#include <stdio.h>
#include <sys/exception.h>
#include <cdefBF561.h>
#include <ccblkfn.h>
#include "interruptA.h"
#include "interruptB.h"

#define TWICE_NUM_WORD_PACKET (280)	//# of 16bit words in a packet (280)
#define NUM_PACKET_QEV (1)		//# of packets in QEV (132)
#define SIZE_QEV (TWICE_NUM_WORD_PACKET*NUM_PACKET_QEV)
#define length (4)

//--RX
#define DMA0_CONF (0x759A)
#define PPI0_CONF (0x393C)

//--TX
#define DMA1_CONF (0x7598)
#define PPI1_CONF (0x390E)

struct sDMA_descriptor {
	unsigned short int NDPL;
	unsigned short int NDPH;
	unsigned short int SAL;
	unsigned short int SAH;
	unsigned short int DMACFG;
};
typedef struct sDMA_descriptor tDMA_descriptor;

//------------RX
extern tDMA_descriptor DMA_PPI0[4];

void InitPPI0(tDMA_descriptor* First_Header);
void DisablePPI0(void);
void EnablePPI0(void);

//------------TX
extern tDMA_descriptor DMA_PPI1[4];


void InitPPI1(tDMA_descriptor* First_Header);
void DisablePPI1(void);
void EnablePPI1(void);

extern volatile unsigned short *buffer16;
extern volatile unsigned int buffer32[];
extern volatile short term;

extern volatile bool buffer_full;
