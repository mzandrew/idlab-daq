#include "system.h"
//#include <sys\exception.h>
#include <stdio.h>

/********************************************************************************/
/***** Defines the interrupt service routines for CoreA						*****/
/********************************************************************************/


EX_INTERRUPT_HANDLER(PPI1_TxIsr) {

	*pDMA1_1_IRQ_STATUS |= DMA_DONE;		// acknowledge interrupt
	ssync();
	
	tx_count++;
	tx_count = (tx_count) % num_buf;
	
	if((rx_count + 2)%num_buf != tx_count)
		*pFIO0_FLAG_S = 0x2;	//Allow data
	
}

EX_EXCEPTION_HANDLER(ex_handler_TX) {
	while(1);
}
