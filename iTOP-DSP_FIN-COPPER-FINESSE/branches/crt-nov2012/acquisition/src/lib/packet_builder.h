#ifndef packet_builder_h
#define packet_builder_h

#include <sys/types.h>

#include "crtdaq-globals.h"

struct DAC_settings_type {
  unsigned short trigger_test_channel_threshold  [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_comparator_bias         [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_01            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_23            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_45            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_67            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short comparator_output_width         [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short sampling_rate_adjustment_PFET   [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short sampling_rate_adjustment_NFET   [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short buffer_amplifier_bias           [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_ramp_buffer_bias      [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_ramp_current_bias     [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_comparator_bias       [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_comparator_pullup_bias[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_clock_rate            [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  //    unsigned short spare                           [NROW_BOARDSTACK][NCOL_BOARDSTACK];
};

struct command_arguments_type {
  u_int32_t uint32[NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET];
};


void generate_skeleton_command_packet(void);
u_int32_t calculate_checksum_and_insert_into_packet(u_int32_t* packet);
void setup_default_DAC_settings(void);
void send_DAC_setting_command(void);
void generate_command_packet(u_int32_t command, 
			     u_int32_t argument);
void send_command_packet_to_all_enabled_channels(u_int32_t command, 
						 u_int32_t argument);
void send_command_packet_to_some_enabled_channels(u_int32_t command, 
						  u_int32_t argument, 
						  unsigned short int channel_bitmask);

void generate_complex_command_packet(u_int32_t command, 
				     const command_arguments_type& command_arguments);
void send_complex_command_packet_to_all_enabled_channels(u_int32_t command, 
							 const command_arguments_type& command_arguments);

#endif

