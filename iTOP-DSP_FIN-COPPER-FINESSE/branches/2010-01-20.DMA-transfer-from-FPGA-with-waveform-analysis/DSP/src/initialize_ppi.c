#include <ccblkfn.h>
#include <cdefBF561.h>
#include "initialize_ppi.h"

//#pragma section ("l2_sram")

void setup_programmable_flags_for_ppi1(void) {
	// outputs:
	*pFIO0_DIR   |=  ppi1_outputs;
	// inputs:
	*pFIO0_DIR   &= ~ppi1_inputs;
	*pFIO0_POLAR &= ~ppi1_inputs;
	*pFIO0_EDGE  &= ~ppi1_inputs;
	*pFIO0_BOTH  &= ~ppi1_inputs;
	*pFIO0_INEN  |=  ppi1_inputs;
}

unsigned short int state_of_ppi1_flag_pf15(void) {
	return (*pFIO0_FLAG_D) & (1<<15);
}
