#include "crtdaq-globals.h"
#include "cprdaq.h"

void generate_skeleton_command_packet(void) {
  unsigned long int skeleton_packet[8] = {
    _g_packet_header, 0x8c, _g_protocol_freeze_date, 0xb01dface, 0x00000000,
    0xa0001, 0xe3657b35, _g_packet_footer
  };
  unsigned long int *uint32_packet = (unsigned long int *) _g_command_packet;
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

void generate_complex_command_packet(unsigned long int command, 
				     const command_arguments_type& command_arguments) {
  generate_skeleton_command_packet();
  unsigned long int *uint32_packet = (unsigned long int *) _g_command_packet;
  uint32_packet[4] = command;
  for (int i=0; i<NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET; i++) {
    uint32_packet[5+i] = command_arguments.uint32[i];
  }
  calculate_checksum_and_insert_into_packet(uint32_packet);
}

void send_complex_command_packet_to_all_enabled_channels(unsigned long int command, 
							 const command_arguments_type& command_arguments) {
  generate_complex_command_packet(command, command_arguments);
  cprdaq_send_data(_g_command_packet, 560, _g_fin_bitmask);
}

void generate_command_packet(unsigned long int command, unsigned long int argument) {
  generate_skeleton_command_packet();
  unsigned long int *uint32_packet = (unsigned long int *) _g_command_packet;
  uint32_packet[4] = command;
  uint32_packet[5] = argument;
  calculate_checksum_and_insert_into_packet(uint32_packet);
}

void send_command_packet_to_all_enabled_channels(unsigned long int command, unsigned long int argument) {
  generate_command_packet(command, argument);
  cprdaq_send_data(_g_command_packet, 560, _g_fin_bitmask); 
}


void send_command_packet_to_some_enabled_channels(unsigned long int command, 
						  unsigned long int argument, 
						  unsigned short int channel_bitmask) {
  generate_command_packet(command, argument);
  cprdaq_send_data(_g_command_packet, 560, channel_bitmask); 
}

