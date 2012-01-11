#include "interruptA.h"
#include <sys\exception.h>

/********************************************************************************/
/***** Defines the interrupt service routines for CoreA						*****/
/********************************************************************************/


EX_INTERRUPT_HANDLER(PPI1_TxIsr) {

	*pDMA1_1_IRQ_STATUS |= DMA_DONE;		// acknowledge interrupt
	ssync();
	
	*pFIO0_FLAG_C = 0x1;	//FIFO WR_EN = 0
	ssync();
}

EX_EXCEPTION_HANDLER(ex_handler_TX) {
	while(1);
}
