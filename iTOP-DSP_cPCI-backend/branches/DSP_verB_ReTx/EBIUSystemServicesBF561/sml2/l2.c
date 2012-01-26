#include "l2.h"

//unsigned long int l2_a[l2_buffer_length];

//#pragma section ("l2_shared")
unsigned short int initialized = 0;

#ifdef SQUEEZE_BUFFERS_INTO_L2
	#pragma section ("l2_shared")
	#pragma align 4
	struct dma_descriptor_struct dma_descriptor[number_of_blocks];
	#pragma align 4
	unsigned short int buffer0[number_of_blocks][NN];
	#pragma align 4
	unsigned short int ASIC_pedestal[NUMBER_OF_CHANNELS_PER_CORE][NUMBER_OF_SAMPLES_PER_ASIC_CHANNEL];
	#pragma align 4
	signed short int ASIC_delta_t[NUMBER_OF_CHANNELS_PER_CORE][N];
#endif

