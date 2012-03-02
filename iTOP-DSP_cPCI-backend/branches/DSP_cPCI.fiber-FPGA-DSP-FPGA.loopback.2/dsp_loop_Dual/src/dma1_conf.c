/************
** dma1_conf.c
*************/
#include "system.h"


void InitPPI1(tDMA_descriptor* First_Header)
{
	// configure Timer10 for PPI SIZE_QEV sync - not enabled yet
	*pTMRS4_DISABLE = TIMDIS10;						//disable Timer
	*pTMRS4_STATUS = (TIMIL10 | TOVL_ERR10 | TRUN10);	// clear status

	*pTIMER10_PERIOD = TWICE_NUM_WORD_PACKET;
	*pTIMER10_WIDTH = 0x1;		// some small dutycycle
	*pTIMER10_CONFIG   = TIN_SEL | PWM_OUT | PULSE_HI | PERIOD_CNT | CLK_SEL | EMU_RUN;	
	ssync();
	
	*pTMRS4_DISABLE = TIMDIS11;						//disable Timer
	*pTMRS4_STATUS = (TIMIL11 | TOVL_ERR11 | TRUN11);	// clear status

	*pTIMER11_PERIOD = (SIZE_QEV) * sizeof(short);
	*pTIMER11_WIDTH = SIZE_QEV;		// entire data
	*pTIMER11_CONFIG   = TIN_SEL | PWM_OUT | PULSE_HI | PERIOD_CNT | CLK_SEL | EMU_RUN;	
	ssync();
	
	// configure PPI1 - not enabled yet
	
//                   POLS      | POLC      | DLEN[2:0] | SKIP_EO   | SKIP_EN  | DMA32    | PACK_EN  | FLD_SEL  | PORT_CFG[1:0] | XFR_TYPE[1:0] | PORT_DIR | PORT_EN
//	*pPPI1_CONTROL = (0x0<<15) | (0x0<<14) | (0x7<<11) | (0x0<<10) | (0x0<<9) | (0x1<<8) | (0x1<<7) | (0x0<<6) | (0x2<<4)      | (0x0<<2)      | (0x1<<1) | (0x0<<0);
	*pPPI1_CONTROL = PPI1_CONF;//0x18E;
	
	*pPPI1_COUNT = TWICE_NUM_WORD_PACKET;
	ssync();

	// configure DMA for PPI1 - not enabled yet
	*pDMA1_1_X_COUNT = TWICE_NUM_WORD_PACKET * sizeof(short)/length;
	*pDMA1_1_Y_COUNT = NUM_PACKET_QEV;
	*pDMA1_1_X_MODIFY = length;		
	*pDMA1_1_Y_MODIFY = length;
	*pDMA1_1_NEXT_DESC_PTR = First_Header;
	
//                     FLOW     |  NDSIZE    |  DI_EN   |  DI_SEL  |  RESTART |   DMA2D  |  WDSIZE   |  WNR     |  DMAEN	
//	*pDMA1_1_CONFIG = (0x7<<12) | (0x5<<8)   | (0x0<<7) | (0x1<<6) | (0x1<<5) | (0x0<<4) | (0x2<<2)  | (0x0<<1) | (0x0<<0);
	*pDMA1_1_CONFIG = DMA1_CONF;//0x7498;
	
	ssync();
	
}

void DisablePPI1(){
	*pFIO0_FLAG_C = 0x1;	//FIFO WR_EN = 0
	ssync();
	// stop transfers
    *pTMRS4_DISABLE |= (TIMEN10|TIMEN11);
    ssync();
    *pPPI1_CONTROL &= ~PORT_EN;
    ssync();
    *pDMA1_1_CONFIG &= ~DMAEN;
    ssync();
    buffer_full = false;
    ssync();
}

void EnablePPI1(){
    *pFIO0_FLAG_S = 0x1;	//FIFO WR_EN = 1
    ssync();
    // start transfers
    *pDMA1_1_CONFIG |= DMAEN;
    ssync();
    *pPPI1_CONTROL |= PORT_EN;
    ssync();
    *pTMRS4_ENABLE |= (TIMEN10|TIMEN11);
    ssync();
}
