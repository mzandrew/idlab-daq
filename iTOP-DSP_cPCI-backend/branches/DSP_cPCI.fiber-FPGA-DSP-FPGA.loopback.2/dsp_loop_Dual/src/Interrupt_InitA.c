#include "system.h"
//#include <sys\exception.h>

/********************************************************************************/
/***** setup of interrupts on core A										*****/
/********************************************************************************/

void InitInterrupts_Tx(void)
{ 	

	register_handler(ik_ivg9, PPI1_TxIsr);		// assign ISR to interrupt vector

	*pSICA_IAR1 = Peripheral_IVG(12,9);			// assign interrupt channel 12 (DMA1_1) to IVG8

	*pILAT |= EVT_IVG9;							// clear pending IVG8 interrupts
	ssync();
	*pSICA_IMASK0 |= SIC_MASK(12);
	ssync();

}

