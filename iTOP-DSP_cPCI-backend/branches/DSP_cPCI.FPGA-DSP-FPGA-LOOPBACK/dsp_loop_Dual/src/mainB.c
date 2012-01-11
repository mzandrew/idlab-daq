#include "system.h"

/*****************************************************************************
 * Core B
 * Idle_CoreB.c
 *****************************************************************************/

 
void clear_buffers(void) {
	unsigned int i;
	for (i=0; i<SIZE_QEV/2; i++) {
		buffer32[i] = 0;
	}
	term = 0;
}


int main( void )
{
	int j;

//----------Set up descriptors
	tDMA_descriptor DMA_PPI0[2];
	DMA_PPI0[0].NDPL = ((unsigned long int)&DMA_PPI0[1]) & 0xffff;
	DMA_PPI0[0].NDPH = (((unsigned long int)&DMA_PPI0[1]) & 0xffff0000)>>16;
	DMA_PPI0[0].SAL = ((unsigned long int)buffer16) & 0xffff;
	DMA_PPI0[0].SAH = (((unsigned long int)buffer16) & 0xffff0000)>>16;
	DMA_PPI0[0].DMACFG = DMA0_CONF|0x1;
	DMA_PPI0[1].NDPL = ((unsigned long int)&DMA_PPI0[1]) & 0xffff;
	DMA_PPI0[1].NDPH = (((unsigned long int)&DMA_PPI0[1]) & 0xffff0000)>>16;
	DMA_PPI0[1].SAL = ((unsigned long int)&term) & 0xffff;
	DMA_PPI0[1].SAH = (((unsigned long int)&term) & 0xffff0000)>>16;
	DMA_PPI0[1].DMACFG = (DMA0_CONF|0x1)&0x00FF;	
//-----------------------------
	
	printf("Entered CoreB\n");
//	printf("B32_addr: 0x%x, B16_addr: 0x%x\n",&buffer32,&buffer16);
	
	buffer_full = false;
	InitInterrupts_Rx();
	
	clear_buffers();

	InitPPI0(&DMA_PPI0[0]);
	ssync();
	EnablePPI0();
	ssync();
	
	while(*pDMA1_0_IRQ_STATUS & DMA_RUN);
	DisablePPI0();
	ssync();


	return 0;
}
