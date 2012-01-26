#include <cdefBf561.h>
#include <ccblkfn.h>
#include "../sml3/sml3.h"
//#include "../../src/initialize_pll_with_system_services.h"
#include "../sml2/l2.h"

void main() {
	if (!initialized) {
//		SetPower_core_b();
//		idle();
//		adi_pwr_Terminate();
	}
	while(1) {
	    asm("nop;");
		idle();
/*
		#ifdef  DEBUG_INFO
		buffer0[0][0] = 0xDCBA;
		buffer0[0][1] = 0xEFCF;
#endif
*/
	}
}
