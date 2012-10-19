#include <cdefBF561.h>
#include <ccblkfn.h>
#include "../EBIUSystemServicesBF561/system.h"
#include "dsp-fin-waveform-processing.h"
#include "dsp-fin-process-waveform.h"
#include "dma.h"

unsigned long int number_of_unprocessed_waveforms;
unsigned long int index_of_next_waveform_to_process;
unsigned short int waveform_transfers_from_fpga_are_allowed;
unsigned short int waveform_transfers_from_fpga_are_desired;
unsigned short int number_of_l1_waveforms_that_are_currently_being_transferred = 0;
unsigned short int number_of_l1_waveforms_that_have_new_data = 0;

unsigned short int check_buffer(unsigned short int i, unsigned short int j, unsigned short int k);
unsigned short int check_waveform(unsigned char which_waveform, unsigned short int i);
void predicate_changes_to_state_machine_for_waveform_transfer_from_fpga(void);
void finished_processing_another_waveform(void);
void disable_waveform_transfers_from_fpga(void);
void start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1(unsigned char which_waveform);
void wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1(void);
void pulse(unsigned short int bit_position);
void pulse_multiple(unsigned short int mask);
void show_number_of_unprocessed_waveforms(void);
void output_pulses_proportional_to(unsigned short int bit_position, unsigned long int t);

unsigned_integer *x_fixed, *y_fixed;
signed_integer a_fixed, b_fixed;

//EX_INTERRUPT_HANDLER(finished_getting_waveform_from_fpga_interrupt_service_routine) {
_Pragma("interrupt") void finished_getting_waveform_from_fpga_interrupt_service_routine(void) {
	finished_another_waveform_transfer_from_fpga();
}

void output_pulse_width_proportional_to(unsigned short int bit, signed long int n) {
	u32 v = 0, i;
	if (n>0) {
		v = n;
	} else if (n<0) {
		v = -n;
	}
	if (v) {
		*pFIO0_FLAG_S = 1<<bit;
		for (i=0; i<v; i++) {
			asm("nop;");
		}
		*pFIO0_FLAG_C = 1<<bit;
	}
}

void output_pulse_duty_cycle_proportional_to(unsigned short int bit, unsigned long int total_width, signed long int n) {
	u32 i;
	if (n<0) {
		n = -n;
	}
	if (n>total_width) {
		n = total_width;
	}
	*pFIO0_FLAG_S = 1<<bit;
	for (i=0; i<n; i++) {
		asm("nop;");
	}
	*pFIO0_FLAG_C = 1<<bit;
	for (; i<total_width; i++) {
		asm("nop;");
	}
}

void finished_another_waveform_transfer_from_fpga(void) {
//	*pFIO0_FLAG_D |= 0xfe;
//	*pFIO0_FLAG_D &= 0x01;
	number_of_unprocessed_waveforms++; // this needs to be atomic (but is 32bit, so we'd have to check the output in assembly language to see that it's atomic)	
//	show_number_of_unprocessed_waveforms();
	predicate_changes_to_state_machine_for_waveform_transfer_from_fpga();
	acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga(); // maybe swap the order of these last two?
//	asm("RTI;"); // automatically inserted with the EX_INTERRUPT_HANDLER(){} thing
}

void show_reason_for_aborting_analysis(unsigned short int n) {
	pulse(2);
	pulse(3);
	pulse(4);
	pulse(5);
	pulse(6);
	u32 a = 1, i;
	if (n>6) { n -= 5; a++; }
	if (n>6) { n -= 5; a++; }
	for (i=0; i<a; i++) {
		pulse(n);
	}
	pulse(6);
	pulse(5);
	pulse(4);
	pulse(3);
	pulse(2);
}

void pulse(unsigned short int bit_position) {
	*pFIO0_FLAG_S = 1<<bit_position;
	*pFIO0_FLAG_C = 1<<bit_position;
}

void pulse_multiple(unsigned short int mask) {
	*pFIO0_FLAG_S = mask;
	*pFIO0_FLAG_C = mask;
}

void show_number_of_unprocessed_waveforms(void) {
	unsigned short int i;
	for (i=0; i<number_of_unprocessed_waveforms; i++) {
		pulse(6);
	}
}

void predicate_changes_to_state_machine_for_waveform_transfer_from_fpga(void) {
//	pulse(5);
	if (number_of_unprocessed_waveforms>UNPROCESSED_WAVEFORM_THRESHOLD) {
		*pFIO0_FLAG_C = 0x0001; // this tells the fpga to stop sending data after the current waveform has finished sending
	} else {
		if (waveform_transfers_from_fpga_are_desired && waveform_transfers_from_fpga_are_allowed) {
			*pFIO0_FLAG_S = 0x0001; // this tells the fpga to send some data as soon as it comes through and contine sending data as it comes
		} else {
			*pFIO0_FLAG_C = 0x0001; // this tells the fpga to stop sending data after the current waveform has finished sending
		}
	}
}

void finished_processing_another_waveform(void) {
	number_of_unprocessed_waveforms--; // this needs to be atomic (but is 32bit, so we'd have to check the output in assembly language to see that it's atomic)	
//	show_number_of_unprocessed_waveforms();
	predicate_changes_to_state_machine_for_waveform_transfer_from_fpga();
}

void enable_waveform_transfers_from_fpga(void) {
	// they will only commence, however, if the number of unprocessed waveforms is <= the ~threshold
//	*pFIO0_FLAG_S = 1<<4;
	waveform_transfers_from_fpga_are_desired = 1;
	predicate_changes_to_state_machine_for_waveform_transfer_from_fpga();
}

void disable_waveform_transfers_from_fpga(void) {
	waveform_transfers_from_fpga_are_desired = 0;
	predicate_changes_to_state_machine_for_waveform_transfer_from_fpga();
//	*pFIO0_FLAG_C = 1<<4;
}

void start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1(unsigned char which_waveform) {
	setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer(which_waveform, index_of_next_waveform_to_process++);
	if (index_of_next_waveform_to_process>=number_of_blocks) {
		index_of_next_waveform_to_process = 0;
	}
	initiate_dma_transfer_from_l3_buffer_to_l1_buffer();
	number_of_l1_waveforms_that_are_currently_being_transferred++;
}

void wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1(void) {
	wait_until_mdma1_stream0_is_paused_or_stopped();
	number_of_l1_waveforms_that_are_currently_being_transferred--;
	number_of_l1_waveforms_that_have_new_data++;
	finished_processing_another_waveform(); // to adjust the count of unprocessed waveforms
}

void process_another_waveform(void) {
//	static unsigned short int this_transfer_has_occured_at_least_one_time = 0;
	static unsigned char which_waveform = 'a';
	unsigned char next_waveform = which_waveform;
/*	if (number_of_unprocessed_waveforms>0 && this_transfer_has_occured_at_least_one_time==0) {
		start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1(which_waveform);
		wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1();
		// at this point, waveform a is filled with new data
		this_transfer_has_occured_at_least_one_time = 1;
	}
		// && this_transfer_has_occured_at_least_one_time==1) {
*/
// this function either runs the second if block (2), the first and third (13) or all three (123)
	if (number_of_l1_waveforms_that_are_currently_being_transferred) {
//		pulse(4);
// bug/future:  this is a fudge:  make it a chain of dma transfers instead
// also, this will have to poll some out-of-band data in sdram for the pedestal offset
			#define fake_channel_number (14)
			#define fake_offset (1536)
			wait_until_mdma1_stream0_is_paused_or_stopped();
			setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer(which_waveform, fake_channel_number, fake_offset);
			initiate_dma_transfer_from_l3_buffer_to_l1_buffer();
			wait_until_mdma1_stream0_is_paused_or_stopped();
			setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer(which_waveform, fake_channel_number);
			initiate_dma_transfer_from_l3_buffer_to_l1_buffer();
		wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1();
//		next_waveform = (which_waveform == 'a') ? 'b' : 'a';
		if (which_waveform=='a') {
			next_waveform = 'b';
		} else {
			next_waveform = 'a';
		}
	}
	if (number_of_unprocessed_waveforms>0) {
//		pulse(5);
		start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1(next_waveform);
	}
	if (number_of_l1_waveforms_that_have_new_data) {
		// at this point, waveform 'which_waveform' is filled with new data
//		pulse(6);
		if (which_waveform=='a') {
			process_waveform(waveform_a);
		} else {
			process_waveform(waveform_b);
		}
//		*pFIO0_FLAG_C = 0xfffe;
		number_of_l1_waveforms_that_have_new_data--;
		which_waveform = next_waveform;
	}
}

void output_pulses_proportional_to(unsigned short int bit_position, unsigned long int t) {
	unsigned long int i;
	if (t==0) {
		*pFIO0_FLAG_S = 1<<bit_position;
		pulse(2);
		*pFIO0_FLAG_C = 1<<bit_position;
	} else if (t>65535) {
		*pFIO0_FLAG_S = 1<<bit_position;
		pulse(3);
		*pFIO0_FLAG_C = 1<<bit_position;
	} else {
		for (i=0; i<t; i++) {
			pulse(bit_position);
		}
	}
}

void setup_dma_unidirectional_burst_lengths(void) {
	// analog devices should have enabled this by default
	// (because enabling it changed it from not working to working):
	//               MDMA         peripheral external   internal l1
	//               |            |          |          |
	*pDMA1_TC_PER = (0x1f<<11) | (0x7<<8) | (0xf<<4) | (0xf<<0);
	/* this may have to be tweaked so that it corresponds to the ratio of the
	 number of incoming waveforms that can be transferred in the time it takes
	  to process one waveform in software
	  this composite number is in SCLK cycles, and is not measured in actual dma transfer cycles
	*/
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

void show_a_waveform(unsigned short *a_waveform) {
	unsigned long i;
	*pFIO0_FLAG_C = 0xfffe;
	for (i=0; i<N; i++) {
//		*pFIO0_FLAG_D = a_waveform[i] && 0x3fff;
		*pFIO0_FLAG_S = a_waveform[i] && 0x3ffe;
		*pFIO0_FLAG_S = 0x8000;
		*pFIO0_FLAG_C = 0xfffe;
	}
/*	*pFIO0_FLAG_C = 0xfffe;
	for (i=N; i<NN; i++) {
//		*pFIO0_FLAG_D = a_waveform[i] && 0x3fff;
		*pFIO0_FLAG_S = a_waveform[i] && 0x3ffe;
		*pFIO0_FLAG_S = 0x4000;
		*pFIO0_FLAG_C = 0xfffe;
	}
*/
}
