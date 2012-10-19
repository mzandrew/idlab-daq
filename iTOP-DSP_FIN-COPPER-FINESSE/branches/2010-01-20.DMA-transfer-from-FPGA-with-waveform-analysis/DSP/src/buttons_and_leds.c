#include <ccblkfn.h>
#include <cdefBF561.h>
#include "buttons_and_leds.h"

void setup_leds_and_buttons(void) {
	turn_off_led_pf0();
	turn_off_led_pf1();
	*pFIO0_DIR   |=  0x0003; // led outputs pf0 and pf1
	
	*pFIO0_DIR   &= ~0x000c; // button inputs pf2 and pf3
	*pFIO0_POLAR &= ~0x000c; // button inputs pf2 and pf3
	*pFIO0_EDGE  &= ~0x000c; // button inputs pf2 and pf3
	*pFIO0_BOTH  &= ~0x000c; // button inputs pf2 and pf3
	*pFIO0_INEN  |=  0x000c; // button inputs pf2 and pf3
}

unsigned short int state_of_button_pf2(void) {
	return (*pFIO0_FLAG_D) & 0x0004;
}

unsigned short int state_of_button_pf3(void) {
	return (*pFIO0_FLAG_D) & 0x0008;
}

void pulse_led_on_pf0_indefinitely(unsigned short int frequency) {
	int i;
	*pFIO0_DIR |= 0x0001;
	unsigned long int m = 15967214 / 2 / frequency;
	unsigned long int n = 2*m;
	while(1) {
		if (n>0) {
			if (n>m) {
				*pFIO0_FLAG_D |= 0x0001;
			} else {
				*pFIO0_FLAG_D &= ~0x0001;
			}
			n--;
		} else {
			n = 2*m;
		}
//		for (i=0; i<NumberOfElementsInALargeBlockOfRAM; i++) {
//			c[i] *= c[i];
//		}
	}	
}
