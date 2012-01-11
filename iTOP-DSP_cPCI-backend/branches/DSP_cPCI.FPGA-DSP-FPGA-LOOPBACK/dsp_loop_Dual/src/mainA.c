/*****************************************************************************
 * test.c
 *****************************************************************************/

/* Place program arguments in the following string, or delete the definition
   if arguments will be passed from the command line. */
#include "system.h"

int main(void)
{
	int j;
	int chk_sum = 0;
	int temp = 0;
	unsigned int *test_buffer[2];

	*pFIO0_DIR = 0x0007; //Initialize PF[0], PF[1], PF[2] as output
	ssync();
	adi_core_b_enable(); //Call on Core B to sit idle
	ssync();

//----------Set up descriptors
	tDMA_descriptor DMA_PPI1[2];
	DMA_PPI1[0].NDPL = ((unsigned long int)&DMA_PPI1[1]) & 0xffff;
	DMA_PPI1[0].NDPH = (((unsigned long int)&DMA_PPI1[1]) & 0xffff0000)>>16;
	DMA_PPI1[0].SAL = ((unsigned long int)buffer16) & 0xffff;
	DMA_PPI1[0].SAH = (((unsigned long int)buffer16) & 0xffff0000)>>16;
	DMA_PPI1[0].DMACFG = DMA1_CONF|0x1;
	DMA_PPI1[1].NDPL = ((unsigned long int)&DMA_PPI1[1]) & 0xffff;
	DMA_PPI1[1].NDPH = (((unsigned long int)&DMA_PPI1[1]) & 0xffff0000)>>16;
	DMA_PPI1[1].SAL = ((unsigned long int)&term) & 0xffff;
	DMA_PPI1[1].SAH = (((unsigned long int)&term) & 0xffff0000)>>16;
	DMA_PPI1[1].DMACFG = (DMA1_CONF|0x1)&0x00FF;
//-----------------------------

/*
	1. Configure DMA registers as appropriate for desired DMA operating mode.
	2. Enable the DMA channel for operation.
	3. Configure appropriate PPI registers.
	4. Enable the PPI by writing a 1 to bit 0 in PPIx_CONTROL.
*/

	InitInterrupts_Tx();

	InitPPI1(&DMA_PPI1[0]);
	ssync();
	
//	printf("B0_addr: 0x%x, B1_addr: 0x%x, B2_addr: 0x%x, B3_addr: 0x%x\n",&buffer0,&buffer1,&buffer2,&buffer3);
//	printf("PPI1_CONTROL: 0x%x, DMA1_1_CONFIG: 0x%x, DMA1_1_IRQ: 0x%x\n",*pPPI1_CONTROL, *pDMA1_1_CONFIG,*pDMA1_1_IRQ_STATUS);

	*pFIO0_FLAG_S = 0x4;	//Assert FIFO Reset
	for(j=0; j<10;j++);
	ssync();
	*pFIO0_FLAG_C = 0x4;	//Deassert FIFO Reset
	ssync();

	while(!buffer_full);
	EnablePPI1();
	ssync();

	while(*pDMA1_1_IRQ_STATUS & DMA_RUN);
	DisablePPI1();
	ssync();

	printf("PPI1 Disabled\n");

	for(j=0;j<SIZE_QEV/2;j++){
		chk_sum = chk_sum + buffer32[j];
	}

	printf("Chk_Sum: 0x%x\n",chk_sum);
/*	
	test_buffer[0] = (unsigned int)&buffer32[NUM_PACKET_QEV];
	test_buffer[1] = (unsigned int)&buffer32[TWICE_NUM_WORD_PACKET];
	printf("test: 0x%x\n",test_buffer[1][0]);
*/	
	return 0;
}


