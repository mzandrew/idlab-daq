#include "command_packet_builder.h"

DAC_settings_type DAC_settings;
char *command_packet = new char[SINGLE_PACKET_BUFFER_SIZE_IN_BYTES];

void generate_skeleton_command_packet(void) {
 	unsigned long int skeleton_packet[8] = {
		header, 0x8c, protocol_freeze_date, 0xb01dface, 0x00000000,
		0xa0001, 0xe3657b35, footer
	};
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	for(int i=0; i<140; i++) {
		if (i <= 4) {
			uint32_packet[i] = skeleton_packet[i];
		} else if (i <= 136) {
			uint32_packet[i] = 0;
			//uint32_packet[i] = i - 3;
		} else {
			uint32_packet[i] = skeleton_packet[i-132];
		}
	}
}

unsigned long int calculate_checksum_and_insert_into_packet(unsigned long int* packet) {
	unsigned long int checksum = 0;
	for(int i=0; i<140; i++) {
		if (i != 138) {
			checksum += packet[i];
		}
	}
	packet[138] = checksum;
}

void setup_default_DAC_settings(void) {
	for (int i=0; i<NUMBER_OF_ROWS_IN_BOARD_STACK; i++) {
		for (int j=0; j<NUMBER_OF_COLUMNS_IN_BOARD_STACK; j++) {
			DAC_settings.trigger_test_channel_threshold[i][j]   = 0x000;
			DAC_settings.trigger_comparator_bias[i][j]          = 0x3e8;
			DAC_settings.trigger_threshold_01[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_23[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_45[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_67[i][j]             = 0x76c;
			DAC_settings.comparator_output_width[i][j]          = 0x578;
			DAC_settings.sampling_rate_adjustment_PFET[i][j]    = 0xc9e;
			DAC_settings.sampling_rate_adjustment_NFET[i][j]    = 0x428;
			DAC_settings.buffer_amplifier_bias[i][j]            = 0x44c;
			DAC_settings.Wilkinson_ramp_buffer_bias[i][j]       = 0x640;
			DAC_settings.Wilkinson_ramp_current_bias[i][j]      = 0x7d0;
			DAC_settings.Wilkinson_comparator_bias[i][j]        = 0x384;
			DAC_settings.Wilkinson_comparator_pullup_bias[i][j] = 0xce4;
			DAC_settings.Wilkinson_clock_rate[i][j]             = 0xaf0;
//			DAC_settings.spare[i][j]                            = ;
		}
	}
}

void send_DAC_setting_command(void) {
	generate_skeleton_command_packet();
	unsigned short int j, k, m, n;
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	uint32_packet[4] = 0x0bac2dac;
//	uint32_packet[4] = 0x4bac2dac;
//	uint32_packet[5] = 0x03ff03ff;
	uint32_packet[5] = 0;
	for (int i=6; i<=125; i++) {
//		uint32_packet[i] = 0x03ff03ff;
//		uint32_packet[i] = 0x01ff01ff;
		uint32_packet[i] = 0x00000000;
		j = (i-6);   // j = 0, 1, 2, 3, 4, 5, 6, 7
		k =     j/2; // k = 0, 0, 1, 1, 2, 2, 3, 3
		m = 4*(j&1); // m = 0, 4, 0, 4, 0, 4, 0, 4
		n =     m+2; // n = 2, 6, 2, 6, 2, 6, 2, 6
//		o =     m+1; // o = 1, 5, 1, 5, 1, 5, 1, 5
//		p =     n+1; // p = 3, 7, 3, 7, 3, 7, 3, 7
		m /= 2;      // m = 0, 2, 0, 2, 0, 2, 0, 2
		n /= 2;      // n = 1, 3, 1, 3, 1, 3, 1, 3
//		p /= 2;      // p = 0, 2, 0, 2, 0, 2, 0, 2
//		o /= 2;      // o = 1, 3, 1, 3, 1, 3, 1, 3
		       if (i<= 13) { // trigger biases
		} else if (i<= 45) { // trigger thresholds
		} else if (i<= 53) { // trigger widths
		} else if (i<= 61) { // sampling rates +
		} else if (i<= 69) { // sampling rates -
		} else if (i<= 77) { // analog transfer buffer biases
			j = i-70; k = j/2; m = 2*(j&1); n = m+1;
//			uint32_packet[i] = (DAC_settings.buffer_amplifier_bias[k][n] << 16)
//			                  + DAC_settings.buffer_amplifier_bias[k][m];
		} else if (i<= 85) { // Wilkinson ramp buffer biases
		} else if (i<= 93) { // Wilkinson ramp current biases
		} else if (i<=101) { // Wilkinson clock rates
		} else if (i<=109) { // Wilkinson comparator biases
		} else if (i<=117) { // Wilkinson comparator pull-up biases
		} else if (i<=125) { // test trigger channel thresholds
			j = i-118; k = j/2; m = 2*(j&1); n = m+1;
			uint32_packet[i] = (DAC_settings.trigger_test_channel_threshold[k][n] << 16)
			                  + DAC_settings.trigger_test_channel_threshold[k][m];
		}
		// the rest don't matter
	}
	calculate_checksum_and_insert_into_packet(uint32_packet);
	for (unsigned short int j=0; j<NUMBER_OF_SCRODS_TO_READOUT; j++) {
		pci.selectChannel(j);
		pci.sendData(command_packet, 560);
	}
}

void generate_complex_command_packet(unsigned long int command, command_arguments_type command_arguments) {
	generate_skeleton_command_packet();
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	uint32_packet[4] = command;
	for (int i=0; i<NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET; i++) {
		uint32_packet[5+i] = command_arguments.uint32[i];
	}
	calculate_checksum_and_insert_into_packet(uint32_packet);
}

void send_complex_command_packet_to_all_enabled_channels(unsigned long int command, command_arguments_type command_arguments) {
	generate_complex_command_packet(command, command_arguments);
	for (unsigned short int j=0; j<NUMBER_OF_SCRODS_TO_READOUT; j++) {
		pci.selectChannel(j);
		pci.sendData(command_packet, 560);
	}
}

void generate_command_packet(unsigned long int command, unsigned long int argument) {
	generate_skeleton_command_packet();
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	uint32_packet[4] = command;
	uint32_packet[5] = argument;
	calculate_checksum_and_insert_into_packet(uint32_packet);
}

void send_command_packet_to_all_enabled_channels(unsigned long int command, unsigned long int argument) {
	generate_command_packet(command, argument);
	for (unsigned short int j=0; j<NUMBER_OF_SCRODS_TO_READOUT; j++) {
		pci.selectChannel(j);
		pci.sendData(command_packet, 560);
	}
}

void send_command_packet_to_some_enabled_channels(unsigned long int command, unsigned long int argument, unsigned short int channel_bitmask) {
	generate_command_packet(command, argument);
	for (unsigned short int j=0; j<NUMBER_OF_SCRODS_TO_READOUT; j++) {
		if (channel_bitmask & (1<<j)) {
			//printf("would have sent this to fiber channel %d", j);
			pci.selectChannel(j);
			pci.sendData(command_packet, 560);
		}
	}
}

