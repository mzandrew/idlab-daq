#include <ccblkfn.h>
#include <cdefBF561.h>
#include "initialize_pll.h"

const short int clock_divide_before_pll = 0x1; // this sets the DF bit in the PLL

//#pragma section ("L2_shared")

unsigned long int core_voltage_to_vlev(float voltage);
void setup_core_voltage_from_vlev(unsigned long int vlev);
void check_core_voltage(unsigned long int pll_multiplier, unsigned long int log_base_2_of_core_divider);
void run_PLL_programming_sequence(void);
void bypass_PLL(void);
void use_PLL(void);

/*	from hardware reference page 8-28
	VLEV	VLEV		Voltage
	(hex)	(bin)
			0000-0101	Reserved
	0x6		0110		0.85 volts
	0x7		0111		0.90 volts
	0x8		1000		0.95 volts
	0x9		1001		1.00 volts
	0xa		1010		1.05 volts
	0xb		1011		1.10 volts
	0xc		1100		1.15 volts
	0xd		1101		1.20 volts // default upon reset
	0xe		1110		Reserved
	0xf		1111		Reserved
*/

/*const float voltage_levels[16] = {
	0.0, 0.0, 0.0, 0.0, 0.0, 0.0
	0.85, 0.9, 0.95, 1.0, 1.05, 1.1, 1.15, 1.2,
	0.0, 0.0
};*/

unsigned long int core_voltage_to_vlev(float voltage) {
	// input is the minimum voltage to function
	// so give it the next higher vlev setting unless it matches exactly
	unsigned long int vlev = 0xf;
		if (voltage <= 1.389) { vlev = 0xf; } // lowest measured for this vlev
		if (voltage <= 1.322) { vlev = 0xe; } // lowest measured for this vlev
		if (voltage <= 1.269) { vlev = 0xd; } // lowest measured for this vlev
		if (voltage <= 1.216) { vlev = 0xc; } // lowest measured for this vlev
		if (voltage <= 1.164) { vlev = 0xb; } // lowest measured for this vlev
	if (voltage <= 1.05) { vlev = 0xa; }
	if (voltage <= 1.00) { vlev = 0x9; }
	if (voltage <= 0.95) { vlev = 0x8; }
	if (voltage <= 0.90) { vlev = 0x7; }
	if (voltage <= 0.85) { vlev = 0x6; }
//	vlev = 0xa;
	return vlev;
}

void setup_core_voltage_from_vlev(unsigned long int vlev) {
	unsigned long int vr_ctl = *pVR_CTL;
	vr_ctl &= ~(0xf<<4);
	vr_ctl |= vlev<<4;
	*pVR_CTL = vr_ctl;
	run_PLL_programming_sequence();
}

/*	from hardware reference page 8-28
	fCCLK CCLK Frequency (VDDINT = 1.2825 V minimum)	600 MHz - external voltage regulation required for stable operation for 600MHz
	fCCLK CCLK Frequency (VDDINT = 1.1875 V minimum)	500 MHz
	fCCLK CCLK Frequency (VDDINT = 1.045 V minimum)		444 MHz
	fCCLK CCLK Frequency (VDDINT = 0.95 V minimum)		350 MHz
	fCCLK CCLK Frequency (VDDINT = 0.855 V minimum)		300 MHz
	fCCLK CCLK Frequency (VDDINT = 0.8 V minimum)		250 MHz
*/

void check_core_voltage(unsigned long int pll_multiplier, unsigned long int log_base_2_of_core_divider) {
	//unsigned long int modified_log_base_2_of_core_divider = log_base_2_of_core_divider ? log_base_2_of_core_divider : 64;
	unsigned long int modified_pll_multiplier = pll_multiplier;
	if (pll_multiplier==0) { modified_pll_multiplier = 64; }
	//unsigned long int desired_core_frequency = CLKIN_FREQUENCY * pll_multiplier / (0x1<<modified_log_base_2_of_core_divider);
	unsigned long int desired_core_frequency = (CLKIN_FREQUENCY * modified_pll_multiplier) >>(log_base_2_of_core_divider+clock_divide_before_pll);
//	unsigned long int vlev = core_voltage_to_vlev(0.85);
	float voltage = 1.2825; // should be the maximum required ever
//	if (desired_core_frequency <= 600e6) { voltage = 1.2825; }
	if (desired_core_frequency <= 500e6) { voltage = 1.1875; }
	if (desired_core_frequency <= 444e6) { voltage = 1.0450; }
	if (desired_core_frequency <= 350e6) { voltage = 0.9500; }
	if (desired_core_frequency <= 300e6) { voltage = 0.8550; }
	if (desired_core_frequency <= 250e6) { voltage = 0.8000; }
	setup_core_voltage_from_vlev(core_voltage_to_vlev(voltage));
//	adi_pwr_SetMaxFreqForVolt( ADI_PWR_VLEV_130 );
}

unsigned short int pll_control_register_value;
void bypass_PLL(void) {
	// change from full to active mode
	pll_control_register_value |= (0x1<<8);
//	(*pPLL_CTL) |= (0x1<<8);
//	*pPLL_CTL = (*pPLL_CTL) | (0x1<<8);
	run_PLL_programming_sequence();
}

void use_PLL(void) {
	// change from active to full mode
	pll_control_register_value &= (~(0x1<<8));
//	(*pPLL_CTL) &= ~(0x1<<8);
//	*pPLL_CTL = (*pPLL_CTL) & (~(0x1<<8));
	run_PLL_programming_sequence();
}

void setup_PLL(unsigned long int pll_multiplier, unsigned long int log_base_2_of_core_divider, unsigned long int system_clock_divider) {
	check_core_voltage(pll_multiplier, log_base_2_of_core_divider);
	if (system_clock_divider==0) { system_clock_divider = 1; }
	pll_control_register_value = (pll_multiplier<<9) | (clock_divide_before_pll<<0); // if clock_divide_before_pll=1, the input clock to be divided before being fed into the pll
	bypass_PLL();
	*pPLL_DIV = (log_base_2_of_core_divider<<4) | (system_clock_divider<<0);
	*pPLL_LOCKCNT = 2400; // required pll settle time for 60MHz input clock
	use_PLL();
}

void run_PLL_programming_sequence(void) {
//	asm("ssync; cli r0; idle; sti r0; ssync;");
	*pPLL_CTL = pll_control_register_value;
	asm("ssync; [--sp] = r0; cli r0; idle; sti r0; r0 = [sp++]; ssync;");
}
