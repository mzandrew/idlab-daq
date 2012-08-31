#include "acquisition.h"

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

