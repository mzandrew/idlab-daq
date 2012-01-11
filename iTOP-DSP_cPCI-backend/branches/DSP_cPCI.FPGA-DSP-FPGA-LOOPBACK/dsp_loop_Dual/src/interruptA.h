#include <sys\exception.h>
#include "cdefBF561.h"
#include "ccblkfn.h"
//#include "system.h"

void InitInterrupts_Tx(void);

EX_INTERRUPT_HANDLER(PPI1_TxIsr);

EX_EXCEPTION_HANDLER(ex_handler_TX);
