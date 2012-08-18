#ifndef command_packet_builder
#define command_packet_builder

#include "pci.h"
#include "fiber.h"

void generate_skeleton_command_packet(void);
unsigned long int calculate_checksum_and_insert_into_packet(unsigned long int* packet);
void setup_default_DAC_settings(void);
void send_DAC_setting_command(void);
void generate_command_packet(unsigned long int command, unsigned long int argument);
void send_command_packet_to_all_enabled_channels(unsigned long int command, unsigned long int argument);
void send_command_packet_to_some_enabled_channels(unsigned long int command, unsigned long int argument, unsigned short int channel_bitmask);

#define NUMBER_OF_ROWS_IN_BOARD_STACK (4)
#define NUMBER_OF_COLUMNS_IN_BOARD_STACK (4)

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
//	unsigned short spare                           [NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
};

extern DAC_settings_type DAC_settings;
extern char *command_packet;
extern unsigned long int header;
extern unsigned long int protocol_freeze_date;
extern unsigned long int packet_type[NUMBER_OF_PACKET_TYPES];
extern unsigned long int footer;

#define NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET (14)
struct command_arguments_type {
	unsigned long int uint32[NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET];
};
void generate_complex_command_packet(unsigned long int command, command_arguments_type command_arguments);
void send_complex_command_packet_to_all_enabled_channels(unsigned long int command, command_arguments_type command_arguments);

#endif

