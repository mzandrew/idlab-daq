#include "system.h"
//#include <sys\exception.h>
#include <stdio.h>

/********************************************************************************/
/***** Defines the interrupt service routines for CoreA						*****/
/********************************************************************************/


EX_INTERRUPT_HANDLER(PPI0_RxIsr) {

	*pDMA1_0_IRQ_STATUS |= DMA_DONE;		// acknowledge interrupt
	ssync();

	rx_count++;
	rx_count = (rx_count) % num_buf;
	
	if((rx_count + 2)%num_buf == tx_count)
		*pFIO0_FLAG_C = 0x2;	//Stop data
}



EX_EXCEPTION_HANDLER(ex_handler_RX) {
	while(1);
}
