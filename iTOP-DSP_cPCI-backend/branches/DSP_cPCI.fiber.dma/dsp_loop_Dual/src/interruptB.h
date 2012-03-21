#include <sys\exception.h>
#include "cdefBF561.h"
#include "ccblkfn.h"


void InitInterrupts_Rx(void);

EX_INTERRUPT_HANDLER(PPI0_RxIsr);

EX_EXCEPTION_HANDLER(ex_handler_RX);

