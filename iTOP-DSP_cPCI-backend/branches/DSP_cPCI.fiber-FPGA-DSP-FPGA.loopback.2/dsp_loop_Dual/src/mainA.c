/*****************************************************************************
 * CoreA
 * mainA.c
 * Chester Lim
 *****************************************************************************/

/* Place program arguments in the following string, or delete the definition
   if arguments will be passed from the command line. */
#include "system.h"

//volatile int tx_count = 0;

int main(void)
{
	int j,i;
	int chk_sum = 0;
	unsigned int *test_buffer[2];

	*pFIO0_DIR = 0x0007; //Initialize PF[0], PF[1], PF[2] as output
	ssync();
	adi_core_b_enable(); //Call on Core B
	ssync();

//----------Set up descriptors

	tDMA_descriptor DMA_PPI1[1];
/*	
	DMA_PPI1[0].NDPL = ((unsigned long int)&DMA_PPI1[0]) & 0xffff;
	DMA_PPI1[0].NDPH = (((unsigned long int)&DMA_PPI1[0]) & 0xffff0000)>>16;
	DMA_PPI1[0].SAL = ((unsigned long int)buffer16[0]) & 0xffff;
	DMA_PPI1[0].SAH = (((unsigned long int)buffer16[0]) & 0xffff0000)>>16;
	DMA_PPI1[0].DMACFG = (DMA1_CONF|0x1)&0x00FF;
*/
//-----------------------------

/*
	1. Configure DMA registers as appropriate for desired DMA operating mode.
	2. Enable the DMA channel for operation.
	3. Configure appropriate PPI registers.
	4. Enable the PPI by writing a 1 to bit 0 in PPIx_CONTROL.
*/

	printf("Entered CoreA\n");	
	InitInterrupts_Tx();
	
	while(1){
		chk_sum = 0;

		if(tx_count != rx_count){
			for(j=0;j<TWICE_NUM_WORD_PACKET/2;j++){
				chk_sum = chk_sum + buffer32[tx_count][j];
			}
			chk_sum = chk_sum - buffer32[tx_count][138];
			printf("Chk_Sum: 0x%x\n",chk_sum);
		
			DMA_PPI1[0].NDPL = ((unsigned long int)&DMA_PPI1[0]) & 0xffff;
			DMA_PPI1[0].NDPH = (((unsigned long int)&DMA_PPI1[0]) & 0xffff0000)>>16;
			DMA_PPI1[0].SAL = ((unsigned long int)buffer16[tx_count]) & 0xffff;
			DMA_PPI1[0].SAH = (((unsigned long int)buffer16[tx_count]) & 0xffff0000)>>16;
			DMA_PPI1[0].DMACFG = (DMA1_CONF|0x1)&0x00FF;

			InitPPI1(&DMA_PPI1[0]);
			ssync();
		
			EnablePPI1();
			while(*pDMA1_1_IRQ_STATUS & DMA_RUN);
			DisablePPI1();
		}
		else{		

		}
	
	}
//	return 0;
}


