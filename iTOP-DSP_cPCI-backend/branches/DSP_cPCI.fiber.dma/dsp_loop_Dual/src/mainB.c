#include "system.h"

/*****************************************************************************
 * Core B
 * mainB.c
 * Chester Lim
 *****************************************************************************/

//volatile int rx_count = 0;
 
int main( void )
{
	int temp = 0;
	int i;
	
//----------Set up descriptors
	for(i=0;i<num_buf;i++){
		buffer16[i] = (unsigned short*)buffer32[i];
	}

	tDMA_descriptor DMA_PPI0[num_buf];
	for(i=0;i<num_buf;i++){
		DMA_PPI0[i].NDPL = ((unsigned long int)&DMA_PPI0[i+1]) & 0xffff;
		DMA_PPI0[i].NDPH = (((unsigned long int)&DMA_PPI0[i+1]) & 0xffff0000)>>16;
		DMA_PPI0[i].SAL = ((unsigned long int)buffer16[i]) & 0xffff;
		DMA_PPI0[i].SAH = (((unsigned long int)buffer16[i]) & 0xffff0000)>>16;
		DMA_PPI0[i].DMACFG = (DMA0_CONF|0x1);
	}
	DMA_PPI0[num_buf-1].NDPL = ((unsigned long int)&DMA_PPI0[0]) & 0xffff;
	DMA_PPI0[num_buf-1].NDPH = (((unsigned long int)&DMA_PPI0[0]) & 0xffff0000)>>16;
	DMA_PPI0[num_buf-1].SAL = ((unsigned long int)buffer16[num_buf-1]) & 0xffff;
	DMA_PPI0[num_buf-1].SAH = (((unsigned long int)buffer16[num_buf-1]) & 0xffff0000)>>16;
	DMA_PPI0[num_buf-1].DMACFG = (DMA0_CONF|0x1);	
//-----------------------------

	InitInterrupts_Rx();	
	printf("Entered CoreB\n");	
	buffer_full = false;

	InitPPI0(&DMA_PPI0[0]);
	ssync();

	EnablePPI0();

	while(1){

		
	}
}
