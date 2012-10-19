#include "../../EBIUSystemServicesBF561/system.h"

void clear_buffers(void);
void check_buffers(void);
void enable_waveform_transfers_from_fpga(void);
void process_another_waveform(void);
void setup_dma_unidirectional_burst_lengths(void);
void fixed_point_fit_data_to_straight_line(index number_of_points);
void show_reason_for_aborting_analysis(unsigned short int n);
void output_pulse_width_proportional_to(unsigned short int bit, signed long int n);
void output_pulse_duty_cycle_proportional_to(unsigned short int bit, unsigned long int total_width, signed long int n);
void show_a_waveform(unsigned short *a_waveform);
