#include <cdefBF561.h>
#include "generic.h"

// from bf561_prom16.dsp
#define UPPER_( x ) (((x) >> 16) & 0x0000FFFF)
#define LOWER_( x ) ((x) & 0x0000FFFF)
#define CoreA_Code_SRAM (0xFFA00000) // Core A Code SRAM 16k

void software_reset(void) {
//	goto CoreA_Code_SRAM;
//	asm("P2.L = LOWER_(CoreA_Code_SRAM); P2.H = UPPER_(CoreA_Code_SRAM); JUMP(P2);");
	asm("P2.L = 0x0000; P2.H = 0xffa0; JUMP(P2);");
}

void enable_core_b(void) {
	*pSICA_SYSCR &= 0xffdf;
}

/*
void delay_ms(unsigned long int value) {
	unsigned long int n, m = value*number_of_for_loop_cycles_per_millisecond;
	for (n=0; n<m; n++) {
//		l2_b[0] = n;
//		l3_c[0] = n;
//		if ((n%16)==0) { l3_c[0] = 0x0000; l3_c[1] = 0x0000; }
	}
}
*/

void delay_ms(float value) {
	unsigned long int n, m = value * number_of_for_loop_cycles_per_millisecond;
	for (n=0; n<m; n++) {
//		l2_b[0] = n;
//		l3_c[0] = n;
//		if ((n%16)==0) { l3_c[0] = 0x0000; l3_c[1] = 0x0000; }
	}
}
