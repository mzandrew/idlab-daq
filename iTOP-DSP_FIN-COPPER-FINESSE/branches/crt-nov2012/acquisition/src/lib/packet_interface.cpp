#include "packet_interface.h"
#include <stdio.h>

#include "crtdaq-globals.h"

using namespace std;

unsigned int packet::command_id = 0;

packet::packet() {}
packet::~packet() {}

void packet::CreateCommandPacket(unsigned int base_command_id, 
				 unsigned short int board_id) 
{
  //  command_id = base_command_id;
  //This is a command packet, so start adding to the payload...
  payload_data.push_back(PACKET_TYPE_COMMAND);
  payload_data.push_back( (unsigned int) board_id );
}

void packet::AddPingToPacket() {
  unsigned int command_checksum = 0;
  payload_data.push_back(command_id);
  command_checksum += command_id;
  command_id++;
  payload_data.push_back(COMMAND_TYPE_PING);
  command_checksum += COMMAND_TYPE_PING;
  payload_data.push_back(command_checksum);
}

void packet::AddReadToPacket(unsigned short int reg_id) {
  unsigned int command_checksum = 0;
  payload_data.push_back(command_id);
  command_checksum += command_id;
  command_id++;
  payload_data.push_back(COMMAND_TYPE_READ);
  command_checksum += COMMAND_TYPE_READ;
  payload_data.push_back( (unsigned int) reg_id);
  command_checksum += (unsigned int) reg_id;
  payload_data.push_back(command_checksum);
}

void packet::AddWriteToPacket(unsigned short int reg_id, 
			      unsigned short int reg_data) 
{
  unsigned int command_checksum = 0;
  payload_data.push_back(command_id);
  command_checksum += command_id;
  command_id++;
  payload_data.push_back(COMMAND_TYPE_WRITE);
  command_checksum += COMMAND_TYPE_WRITE;
  unsigned int temp_word = 0;
  temp_word |= (reg_data << 16) | (reg_id);
  payload_data.push_back(temp_word);
  command_checksum += temp_word;
  payload_data.push_back(command_checksum);
}

int packet::GetTotalSize() {
  //Payload data does not include overall header or the size itself
  //or the packet checksum.
  //So we should add an extra 3 words for the data out
  return (payload_data.size() + 3);
}

int packet::GetPayloadSize() {
  //Payload data vector does not include the checksum
  //So we should add an extra word for the data out
  return (payload_data.size() + 1);
}

unsigned int *packet::AssemblePacket(int &total_size_in_words) {
  total_size_in_words = this->GetTotalSize();
  unsigned int *packet_data = new unsigned int[total_size_in_words];
  unsigned int packet_checksum = 0;
  packet_data[0] = PACKET_HEADER;
  packet_data[1] = this->GetPayloadSize();
  int counter = 2;
  for (vector<unsigned int>::iterator i = payload_data.begin();
       i != payload_data.end(); ++i) {
    packet_data[counter] = (*i);
    counter++;
  }
  for (int i = 0; i < counter; ++i) {
    packet_checksum += packet_data[i];
  }
  packet_data[counter] = packet_checksum;
  return packet_data;
}

void packet::PrintPacket() {
  int size = 0;
  unsigned int *data = this->AssemblePacket(size);
  for (int i = 0; i < size; ++i) {
    char words[4];
    for (int j = 0; j < 4; ++j) {
      words[j] = (data[i] & (0xFF << (j*8))) >> (j*8);
    }
    printf("[%04d]: %08x\t%c%c%c%c\n",i,data[i],
	   words[3],words[2],words[1],words[0]);
  }
  delete [] data;
}

unsigned int packet::GetCurrentCommandID() {
  return command_id;
}


void
generate_skeleton_command_packet(void) 
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);
}

unsigned long 
calculate_checksum_and_insert_into_packet(unsigned long* packet) 
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}

void 
setup_default_DAC_settings(void)
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}

void 
send_DAC_setting_command(void)
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}

void 
generate_command_packet(unsigned long command, 
			     unsigned long argument)
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}

void 
send_command_packet_to_all_enabled_channels(unsigned long command, 
					    unsigned long argument)
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}

void 
send_command_packet_to_some_enabled_channels
(unsigned long command, unsigned long argument,  
 unsigned short int channel_bitmask)
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}

void 
generate_complex_command_packet
(unsigned long command, const command_arguments_type& command_arguments)
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}

void 
send_complex_command_packet_to_all_enabled_channels
(unsigned long command, 
 const command_arguments_type& command_arguments)
{
  fprintf(_g_error, "Call to unimplemented function:\n\t%s::%s\n",
	  __FILE__, __func__);  
}




