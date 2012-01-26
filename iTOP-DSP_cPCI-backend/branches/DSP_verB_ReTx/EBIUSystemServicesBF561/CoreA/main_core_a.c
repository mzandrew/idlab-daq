#include <stdlib.h>
#include <stdio.h>
#include <sys/exception.h>
#include <cdefBF561.h>
#include <ccblkfn.h>
#include <signal.h>
//#include <services/services.h>

#include "../system.h"
#include "../sml3/sml3.h"
#include "../sml2/l2.h"
#include "../../src/initialize_sdram.h"
#include "../../src/initialize_pll.h"
#include "../../src/initialize_ppi.h"
//#include "../../src/initialize_pll_with_system_services.h"
//#include "../../src/initialize_sdram_with_system_services.h"
#include "../../src/buttons_and_leds.h"
#include "../../src/generic.h"
#include "../../src/dma.h"
#include "../../src/dsp-fin-waveform-processing.h"
#include "../../src/dsp-fin-process-waveform.h"

int main(void) {
//	unsigned long int i = 0;
//	unsigned short int counter = 0;
	unsigned short int number_of_points, i;

	disable_interrupts_for_dma_transfers_from_fpga_via_ppi0(); //include both DMA1_0 ppi0 and DMA1_1 ppi1
	//disable_interrupts_for_dma_transfers_from_ppi1_to_fpga();  

	*pFIO0_FLAG_D = 0x0000;
	*pFIO0_DIR = 0xffff;
	
	number_of_unprocessed_waveforms = 0;
	waveform_transfers_from_fpga_are_allowed = 1;
	waveform_transfers_from_fpga_are_desired = 0;
	index_of_next_waveform_to_process = 0;
	
	number_of_untransmitted_waveforms = 0;
	
	/* init for DMA1_1 */
	chan1_transmitData.cur_tx_buf_num = 0;	   /* current buffer is transmitting */ 
	chan1_transmitData.valid_tx_buf_num = 0;   /* number of buffers are ready to transmit */
	chan1_transmitData.buffer_wrapAround_times = 0;  /* All buffers are filled and flag it. */
	chan1_transmitData.DMA1_1_onUse = false;
	chan1_transmitData.DMA1_1_pause = true;
	
	initialized = 1;
	if (!initialized) {
//		setup_SDRAM_using_system_services();
//		SetupSDRAM();
//		setup_SDRAM();
//		asm("nop;");
	
		enable_core_b();
	
/*		setup_PLL(a, b, c):
		VCO = CLKIN/2*a, CCLK = VCO/(2^b), SCLK = VCO/(c)
		VCO = 30MHz/2*34 = 510MHz, CCLK = VCO/(2^0) = 510MHz, SCLK = VCO/(4) = 127.5MHz
*/
//		setup_PLL(34, 0, 4); // 510MHz / 127.5MHz
//		setup_PLL(35, 0, 4); // 525MHz / 131.25MHz
//		setup_PLL(40, 0, 5); // 600MHz / 120MHz
//		SetPower_core_a(); // not 600MHz / not 120MHz
//		asm("nop;");
	
		initialized = 1;
//		adi_pwr_Terminate();
//		adi_ebiu_Terminate();
	}
//	setup_SDRAM();
//	setup_PLL(16, 0, 4);
	setup_PLL(32, 0, 5);
//	setup_PLL(32, 0, 4); // 533.333 MHz / 133.333 MHz
//	setup_PLL(36, 0, 5); // 600     MHz / 120     MHz

//	setup_leds_and_buttons();
//	check_for_user_software_reset_button_press();
//	turn_off_led_pf0();
//	toggle_led_pf0();

//	pulse();

	delay_ms(15);

	// leave this enabled:
	number_of_points = 512;
	init_fit(number_of_points);
	setup_real_fft();
	ad_fft_init();

	for (i=0;i<number_of_points;i++) {
		y_floating[i] = 7.0 + 3.0*i;
		y_fixed[i] = 7 + 3*i;
	}
	ssync();
		*pFIO0_FLAG_S = 1<<1;
	fit_me(number_of_points, 0);
		*pFIO0_FLAG_C = 1<<1;
	ssync();
		*pFIO0_FLAG_S = 1<<2;
	fit_me(number_of_points, 1);
		*pFIO0_FLAG_C = 1<<2;
	ssync();
		*pFIO0_FLAG_S = 1<<3;
	fit_me(number_of_points, 2);
		*pFIO0_FLAG_C = 1<<3;

/*
	number_of_points = 64;
//	init_fit(number_of_points);
	for (i=0;i<number_of_points;i++) {
		yy[i] = 4.0 + 2.0*i;
	}
	ssync();
//		*pFIO0_FLAG_S = 1<<3;
//	fit_me(number_of_points, 0);
//		*pFIO0_FLAG_C = 1<<3;
	ssync();
		*pFIO0_FLAG_S = 1<<4;
	fit_me(number_of_points, 1);
		*pFIO0_FLAG_C = 1<<4;

	number_of_points = 24;
//	init_fit(number_of_points);
	for (i=0;i<number_of_points;i++) {
		yy[i] = 6.0 + 1.0*i;
	}
	ssync();
//		*pFIO0_FLAG_S = 1<<5;
//	fit_me(number_of_points, 0);
//		*pFIO0_FLAG_C = 1<<5;
	ssync();
		*pFIO0_FLAG_S = 1<<6;
	fit_me(number_of_points, 1);
		*pFIO0_FLAG_C = 1<<6;
*/

	delay_ms(15);

	delay_ms(0.1);
	clear_buffers();
	delay_ms(0.1);
	check_buffers();
//	*pFIO0_FLAG_D = 0x01;
	delay_ms(0.1);

//	pulse();

	// order should be setup dma, setup ppi, setup interrupts, enable dma, enable ppi, enable fpga transfers
	/************* DMA 1  channel 0  ***********************/
	setup_dma_transfers_from_fpga_via_ppi0();
	setup_ppi_transfers_from_fpga_via_ppi0();
	setup_interrupts_for_dma_transfers_from_fpga_via_ppi0();
	setup_dma_unidirectional_burst_lengths();

	/************* DMA 1  channel 1 ************************/
	setup_dma_transfers_from_ppi1_to_fpga(0);
	setup_ppi_transfers_via_ppi1_to_fpga();
	setup_interrupts_for_dma_transfers_from_ppi1_to_fpag();

	
	//enable DMA1 channel 0 and PPI0	
	enable_dma_transfers_from_fpga_via_ppi0();
	enable_ppi_transfers_from_fpga_via_ppi0();
	//setup_timer4();
	setup_timer10();
	
	//test to enable PPI1. It should not be here
	//enable_ppi_transfers_via_ppi1_to_fpga();
	
/*
	//enable DMA1 channel 1 and PPI1
	enable_interrupts_for_dma_transfers_from_ppi1_to_fpga();
 	enable_dma_transfers_from_ppi1_to_fpga();
 	enable_ppi_transfers_via_ppi1_to_fpga();
	ssync();
	
*/

 	
 	
	enable_waveform_transfers_from_fpga();
	


//  enable dma and ppi1 when transmitting buffer is ready 
//	enable_dma_transfers_from_ppi1_to_fpga();     enable DMA before enable PPI 
//	enable_ppi_transfers_via_ppi1_to_fpga();
//	pulse();
	delay_ms(0.110);
//	pulse();
//	disable_waveform_transfers_from_fpga();

	/*	sans optimizations, at CCLK=533.333MHz and SCLK=106MHz,
		13.65us to get 1024 words through a 75MHz bus (and the corresponding dma transfer occurs simultaneously and does not go more than (size of the dma/ppi fifo + 1) 32 bit dma transfers to sdram)
			*25us arbitrary delay
		13us to transfer the data back from sdram to local "l1" memory
		or 85us to transfer the data back from sdram to local if it's concurrent with sustained primary transfers
		175us to "analyse" the data in l1
		or or if the primary and secondary dma transfers are done completely in the background, it takes 215us to analyse the data in l1
	*/
	while(1) {
//			delay_ms(0.025);
			int i, j;
			for(i=0; i<10; i++)
			{
				 j= i+5;
			}
			process_another_waveform();
/*			if (number_of_unprocessed_waveforms==0) {
				delay_ms(0.100);
				enable_waveform_transfers_from_fpga();
				delay_ms(0.200);
				disable_waveform_transfers_from_fpga();
				delay_ms(0.100);
			}
*/
	};
}

void check_l1_buffer(void);

void check_for_user_software_reset_button_press(void) {
	if (state_of_button_pf2()) {
		software_reset();
	}
}

unsigned short int check_waveform(unsigned char which_waveform, unsigned short int i) {
	unsigned short int output = 0, temp;
	if (which_waveform=='a') {
		temp = waveform_a[i];
	} else {
		temp = waveform_b[i];
	}
	if (temp==0x555) { output |= (1<<2); } // fpga-side init value
//	if (temp>=1500 && temp<1600) { output |= (1<<3); }
//	if (temp>=1600 && temp<1700) { output |= (1<<4); }
//	if (temp>=1400 && temp<1500) { output |= (1<<5); }
//	if (temp>=1300 && temp<1400) { output |= (1<<6); }
	if (temp< 1300 && temp>=1700) { output |= (1<<3); }
	if (temp>=1550 && temp<1700) { output |= (1<<4); }
	if (temp>=1400 && temp<1550) { output |= (1<<5); }
	if (temp>=1300 && temp<1400) { output |= (1<<6); }
	return output;
}

unsigned short int check_waveform_old(unsigned char which_waveform, unsigned short int i) {
	unsigned short int output = 0, temp;
	if (which_waveform=='a') {
		temp = waveform_a[i];
	} else {
		temp = waveform_b[i];
	}
	     if (temp==0x635          ) { output |= (1<<2); } // dsp-side init value
	else if (temp==0x555          ) { output |= (1<<3); } // fpga-side init value
	else if (             temp<128) { output |= (1<<4); }
	else if (temp>=128 && temp<256) { output |= (1<<5); }
	else if (temp>=256 && temp<512) { output |= (1<<6); }
	return output;
}

void clear_buffers(void) {
	unsigned short int i, j;
	for (i=0; i<N; i++) {
		*pFIO0_FLAG_S = 0x0002;
		for (j=0; j<N; j++) {
			buffer0[i][j] = 0x635;
//			buffer1[i][j] = 1;
//			buffer2[i][j] = 129;
//			buffer3[i][j] = 257;
		}
		*pFIO0_FLAG_C = 0x0002;
	}
}

unsigned short int check_buffer(unsigned short int i, unsigned short int j, unsigned short int k) {
	unsigned short int temp, output = 0;
	     if (i==0) { temp = buffer0[j][k]; }
//	else if (i==1) { temp = buffer1[j][k]; }
//	else if (i==2) { temp = buffer2[j][k]; }
//	else if (i==3) { temp = buffer3[j][k]; }
	else           { temp = 888; }
	     if (temp==0x635          ) { output |= (1<<2); } // dsp-side init value
	else if (temp==0x555          ) { output |= (1<<3); } // fpga-side init value
	else if (             temp<128) { output |= (1<<4); }
	else if (temp>=128 && temp<256) { output |= (1<<5); }
	else if (temp>=256 && temp<512) { output |= (1<<6); }
//	else if (temp!=0x000 && temp!=0x001 && temp!=0x002) {
	return output;
}

void check_buffers(void) {
	unsigned short int i, j, k, saved_state;
//	delay_ms(10);
//	saved_state = (*pFIO0_FLAG_D) & 0x01;
//	*pFIO0_FLAG_D = saved_state | 0x02;
	for (i=0; i<4; i++) {
		for (j=0; j<number_of_blocks; j++) {
			for (k=0; k<N; k++) {
//				*pFIO0_FLAG_D = saved_state | 0x02 | check_buffer(i, j, k);
			}
//			*pFIO0_FLAG_D = saved_state | 0x02;
		}
//		*pFIO0_FLAG_D = saved_state;
//		delay_ms(10);
	}
//	*pFIO0_FLAG_D = saved_state;
}

#pragma section ("L1_data_a")
unsigned short int waveform_a[NN];
unsigned short int pedestal_a[N];
unsigned short int delta_t_a[N];
#ifdef FPGA_OFF
unsigned short int waveform_buf[NN];
unsigned short int waveform_split[N];
unsigned short int x_t[N];
unsigned short int x_T[N];
#endif

#pragma section ("L1_data_b")
unsigned short int waveform_b[NN];
unsigned short int pedestal_b[N];
unsigned short int delta_t_b[N];
