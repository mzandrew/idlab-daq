#ifndef DSP_FIN_WAVEFORM_PROCESS_H
#define DSP_FIN_WAVEFORM_PROCESS_H
#include "datatypes.h"
#include "../EBIUSystemServicesBF561/system.h"

unsigned long int number_of_unprocessed_waveforms;
unsigned long int index_of_next_waveform_to_process;
unsigned short int waveform_transfers_from_fpga_are_allowed;
unsigned short int waveform_transfers_from_fpga_are_desired;
unsigned short int check_buffer(unsigned short int i, unsigned short int j, unsigned short int k);
unsigned short int check_waveform(unsigned char which_waveform, unsigned short int i);
unsigned_integer *x_fixed, *y_fixed;
signed_integer a_fixed, b_fixed;

void clear_buffers(void);
void check_buffers(void);
void enable_waveform_transfers_from_fpga(void);
void process_another_waveform(void);
void setup_dma_unidirectional_burst_lengths(void);
//void fixed_point_fit_data_to_straight_line(index number_of_points);
void show_reason_for_aborting_analysis(unsigned short int n);
void output_pulse_width_proportional_to(unsigned short int bit, signed long int n);
void output_pulse_duty_cycle_proportional_to(unsigned short int bit, unsigned long int total_width, signed long int n);
void show_a_waveform(unsigned short *a_waveform);

void predicate_changes_to_state_machine_for_waveform_transfer_from_fpga(void);
void finished_processing_another_waveform(void);
void disable_waveform_transfers_from_fpga(void);
void start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1(unsigned char which_waveform);
void wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1(void);
void pulse(unsigned short int bit_position);
void pulse_multiple(unsigned short int mask);
void show_number_of_unprocessed_waveforms(void);
void output_pulses_proportional_to(unsigned short int bit_position, unsigned long int t);


#endif
