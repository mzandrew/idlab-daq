/*****************************************************************************
 * system.h
 * Chester Lim
 *****************************************************************************/
 
#include <stdlib.h>
#include <stdio.h>
#include <sys/exception.h>
#include <cdefBF561.h>
#include <ccblkfn.h>


#define TWICE_NUM_WORD_PACKET (280)	//# of 16bit words in a packet (280)
#define NUM_PACKET_QEV (1)		//# of packets in QEV (132)
#define SIZE_QEV (TWICE_NUM_WORD_PACKET*NUM_PACKET_QEV)
#define length (4)
#define num_buf (132)

//--RX
#define DMA0_CONF (0x758A)
#define PPI0_CONF (0x390C)

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

//------------RX DMA & PPI
extern tDMA_descriptor DMA_PPI0[3];

void InitPPI0(tDMA_descriptor* First_Header);
void DisablePPI0(void);
void EnablePPI0(void);

//------------TX DMA & PPI
extern tDMA_descriptor DMA_PPI1[1];

void InitPPI1(tDMA_descriptor* First_Header);
void DisablePPI1(void);
void EnablePPI1(void);

//------------RX Interrupt
void InitInterrupts_Rx(void);
EX_INTERRUPT_HANDLER(PPI0_RxIsr);
EX_EXCEPTION_HANDLER(ex_handler_RX);

//------------TX Interrupt
void InitInterrupts_Tx(void);
EX_INTERRUPT_HANDLER(PPI1_TxIsr);
EX_EXCEPTION_HANDLER(ex_handler_TX);

/*
extern volatile unsigned short *buffer0_16;
extern volatile unsigned int buffer0[140];
extern volatile unsigned short *buffer1_16;
extern volatile unsigned int buffer1[140];
extern volatile unsigned short *buffer2_16;
extern volatile unsigned int buffer2[140];
*/

extern volatile unsigned short *buffer16[num_buf];
extern volatile unsigned int buffer32[num_buf][TWICE_NUM_WORD_PACKET/2];

extern volatile bool buffer_full;
extern volatile unsigned int rx_count;
extern volatile unsigned int tx_count;
