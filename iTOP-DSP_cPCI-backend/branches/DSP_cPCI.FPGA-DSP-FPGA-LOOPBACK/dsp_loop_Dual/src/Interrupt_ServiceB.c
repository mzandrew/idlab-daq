#include "interruptB.h"
#include <sys\exception.h>


/********************************************************************************/
/***** Defines the interrupt service routines for CoreA						*****/
/********************************************************************************/


EX_INTERRUPT_HANDLER(PPI0_RxIsr) {

	*pDMA1_0_IRQ_STATUS |= DMA_DONE;		// acknowledge interrupt
	ssync();

	*pFIO0_FLAG_C = 0x2;	//FIFO WR_EN = 0
	ssync();
}



EX_EXCEPTION_HANDLER(ex_handler_RX) {
	while(1);
}
