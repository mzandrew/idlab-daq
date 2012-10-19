#include <ccblkfn.h>
#include <cdefBF561.h>
#include "initialize_sdram.h"
#include "generic.h"
#include "../EBIUSystemServicesBF561/sml3/sml3.h"
//#include "sml3/sml3.h"

//#pragma section ("l2_sram")

/*
if (1)
	const float sclk_frequency = 133333333.333; // in Hz
	const float sclk_period = 7.5e-9; // in s
} else if (0) {
	const float sclk_frequency = 120000000; // in Hz
	const float sclk_period = 8.333e-9; // in s
} else if (0) {
	const float sclk_frequency = 100000000; // in Hz
	const float sclk_period = 10e-9; // in s
}
*/

unsigned long int sdram_global_control_register(u16 width, u16 cddbg, u16 tcsr, u16 emren, u16 fbbrw, u16 ebufe, u16 srfs, u16 psse, u16 psm, u16 pupsd, u16 twr, u16 trcd, u16 trp, u16 tras, u16 pasr, u16 cl, u16 sck1e, u16 sctle);
unsigned long int sdram_global_control_register(u16 width, u16 cddbg, u16 tcsr,
	u16 emren, u16 fbbrw, u16 ebufe, u16 srfs, u16 psse, u16 psm, u16 pupsd,
	u16 twr, u16 trcd, u16 trp, u16 tras, u16 pasr, u16 cl, u16 sck1e, u16 sctle) {
	return (width<<31) | (cddbg<<30) | (tcsr<<29) | (emren<<28) | (fbbrw<<26) |
		(ebufe<<25) | (srfs<<24) | (psse<<23) | (psm<<22) | (pupsd<<21) |
		(twr<<19) | (trcd<<15) | (trp<<11) | (tras<<6) | (pasr<<4) | (cl<<2) |
		(sck1e<<1) | (sctle<<0);
}

void setup_SDRAM(void) {
	unsigned short int sdram_global_control_register_base_value;
//	return;
//	*pEBIU_SDSTAT = 0xffff; // clear sticky error bit
//	*pEBIU_SDSTAT = 0x10; // clear sticky error bit
	delay_ms(1);
	*pEBIU_SDGCTL &= ~SCTLE;
	delay_ms(1);
	ssync();
	delay_ms(1);
	
//	*pEBIU_SDGCTL = 0x0211998c; // for MT48LC64M8A2-75 @ 133MHz wired to one clock
//	*pEBIU_SDGCTL = 0x0211998c; // for MT48LC64M8A2-75 @ 127.5MHz wired to one clock
//	*pEBIU_SDGCTL = 0x0211998c; // for MT48LC64M8A2-75 @ 120MHz wired to one clock
//	*pEBIU_SDGCTL = ; // for MT48LC64M8A2-75 @ 100MHz wired to one clock
//                                                                                                psse
//                                                                                                |  psm
//                                                                                       fbbrw    |  |  pupsd
//                                                                                       0        1  1  1                       1=sctle
	sdram_global_control_register_base_value = sdram_global_control_register(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 3, 3, 6, 0, 3, 0, 0); // for MT48LC64M8A2-75 anything less than 133MHz wired to one clock
//	sdram_global_control_register_base_value = sdram_global_control_register(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3, 3, 6, 0, 3, 0, 0); // for MT48LC64M8A2-75 anything less than 133MHz wired to one clock
	*pEBIU_SDGCTL = sdram_global_control_register_base_value;
	delay_ms(1);
	ssync();
	delay_ms(1);
	
//	*pEBIU_SDRRC = 1030; // 133MHz, 8192, 64ms, tRAS = 6, tRP = 3
//	*pEBIU_SDRRC = 987; // 127.5MHz, 8192, 64ms, tRAS = 6, tRP = 3
	*pEBIU_SDRRC = 928; // 120MHz, 8192, 64ms, tRAS = 6, tRP = 3
//	*pEBIU_SDRRC = ; // 100MHz, 8192, 64ms, tRAS = , tRP = 
//	*pEBIU_SDRRC = 300; // a guess for 60MHz
	delay_ms(1);
	ssync();
	delay_ms(1);
	
	*pEBIU_SDBCTL = 0x35353535; // 11bits of column address, enable all banks, 64MiB per bank
//	*pEBIU_SDSTAT = 0xffff; // clear sticky error bit
	delay_ms(1);
	ssync();
	delay_ms(1);
	
	*pEBIU_SDGCTL |= SCTLE;
	delay_ms(1);
	ssync();
	delay_ms(1);
//	if (*pEBIU_SDSTAT & SDRS) {
		*pEBIU_SDGCTL |= PSS;
		delay_ms(1);
		ssync();
		delay_ms(1);
		sdram_dummy = 0x1234;
//	}
}

void old_setup_SDRAM(void) {
	*pEBIU_SDGCTL &= ~SCTLE;
	ssync();
	*pEBIU_SDGCTL = 0x0411998c;
	ssync();
	*pEBIU_SDGCTL |= SCTLE;
	ssync();
	*pEBIU_SDGCTL |= PSS;
	ssync();
//	unsigned long int *a;
//	a = 0;
//	unsigned long int b = *a;
}
