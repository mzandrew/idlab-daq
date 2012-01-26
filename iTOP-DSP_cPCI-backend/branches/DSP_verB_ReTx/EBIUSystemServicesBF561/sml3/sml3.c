#include "sml3.h"

unsigned short int sdram_dummy;
//unsigned long int l3_a[l2_buffer_length];
//unsigned long int l3_b[l2_buffer_length];
//unsigned short int l3_c[524288];
//unsigned short int l3_d[0x14];

#ifndef SQUEEZE_BUFFERS_INTO_L2
	// for DMA 1 channel 0   --   Receive data from FPGA
	#pragma section ("sdram_bank0")
	#pragma align 4
	struct dma_descriptor_struct dma_descriptor[number_of_blocks];
	#pragma section ("sdram_bank0")
	#pragma align 4
	unsigned short int buffer0[number_of_blocks][NN];
	#pragma section ("sdram_bank0")
	#pragma align 4
	unsigned short int ASIC_pedestal[NUMBER_OF_CHANNELS_PER_CORE][NUMBER_OF_SAMPLES_PER_ASIC_CHANNEL];
	#pragma section ("sdram_bank0")
	#pragma align 4
	signed short int ASIC_delta_t[NUMBER_OF_CHANNELS_PER_CORE][N];
	
	#pragma section ("sdram_bank0")
	#pragma align 4
	DMA_descriptor_large dma_descriptor_Tx[number_of_blocks]; 

	
	//for DMA1  channel 1   -- Transmit data to FPGA
	#pragma section ("sdram_bank1")
	#pragma align 4
	unsigned short int buffer1[number_of_blocks][NN];
	
#endif

/*
#pragma align 4
//#pragma section ("sdram_bank1")
unsigned short int buffer1[number_of_blocks][size_of_block];
#pragma align 4
//#pragma section ("sdram_bank2")
unsigned short int buffer2[number_of_blocks][size_of_block];
#pragma align 4
//#pragma section ("sdram_bank3")
unsigned short int buffer3[number_of_blocks][size_of_block];
*/
//struct from_fpga_block_struct from_fpga_block[12000];

//unsigned long int from_fpga_dma_descriptor_table[8];
//sizeof(struct from_fpga_block_struct)
//sizeof(from_fpga_block_struct)
