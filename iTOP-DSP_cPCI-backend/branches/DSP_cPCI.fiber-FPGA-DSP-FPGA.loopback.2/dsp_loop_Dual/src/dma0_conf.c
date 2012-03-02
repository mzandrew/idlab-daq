/************
** dma0_conf.c
*************/
#include "system.h"


void InitPPI0(tDMA_descriptor* First_Header)
{
//                   POLS      | POLC      | DLEN[2:0] | SKIP_EO   | SKIP_EN  | DMA32    | PACK_EN  | FLD_SEL  | PORT_CFG[1:0] | XFR_TYPE[1:0] | PORT_DIR | PORT_EN
//	*pPPI0_CONTROL = (0x0<<15) | (0x0<<14) | (0x7<<11) | (0x0<<10) | (0x0<<9) | (0x1<<8) | (0x1<<7) | (0x0<<6) | (0x2<<4)      | (0x0<<2)      | (0x1<<1) | (0x0<<0);
	*pPPI0_CONTROL = PPI0_CONF;//0x18E;
	
	*pPPI0_FRAME = NUM_PACKET_QEV;
	ssync();

	// configure DMA for PPI0 - not enabled yet
	*pDMA1_0_X_COUNT = TWICE_NUM_WORD_PACKET * sizeof(short)/length;
	*pDMA1_0_Y_COUNT = 1;//NUM_PACKET_QEV;
	*pDMA1_0_X_MODIFY = length;		
	*pDMA1_0_Y_MODIFY = length;
	*pDMA1_0_NEXT_DESC_PTR = First_Header;
	
//                     FLOW     |  NDSIZE    |  DI_EN   |  DI_SEL  |  RESTART |   DMA2D  |  WDSIZE   |  WNR     |  DMAEN	
//	*pDMA1_0_CONFIG = (0x7<<12) | (0x5<<8)   | (0x0<<7) | (0x1<<6) | (0x1<<5) | (0x0<<4) | (0x2<<2)  | (0x0<<1) | (0x0<<0);
	*pDMA1_0_CONFIG = DMA0_CONF;//0x7498;
	
	ssync();
	
}

void DisablePPI0(){
	// disable transfers
    *pPPI0_CONTROL &= ~PORT_EN;
    ssync();
    *pDMA1_0_CONFIG &= ~DMAEN;
    ssync();
    *pFIO0_FLAG_C = 0x2;	//Stop data
    ssync();
    buffer_full = true;
    ssync();
}

void EnablePPI0(){
    // enable transfers
    *pDMA1_0_CONFIG |= DMAEN;
    ssync();
    *pPPI0_CONTROL |= PORT_EN;
    ssync();
    *pFIO0_FLAG_S = 0x2;	//Request data
    ssync();
}
