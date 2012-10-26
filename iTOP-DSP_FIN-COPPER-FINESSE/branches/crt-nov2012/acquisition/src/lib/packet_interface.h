#ifndef PACKET_INTERFACE__H
#define PACKET_INTERFACE__H

#include <vector>

#define PACKET_HEADER           (0x00BE11E2) //hex:BELLE2
#define PACKET_TYPE_COMMAND     (0x646f6974) //ascii:"doit"
#define PACKET_TYPE_ACKNOWLEDGE (0x6f6b6179) //ascii:"okay"
#define PACKET_TYPE_ERROR       (0x7768613f) //ascii:"wha?"
#define COMMAND_TYPE_PING       (0x70696e67) //ascii:"ping"
#define COMMAND_TYPE_READ       (0x72656164) //ascii:"read"
#define COMMAND_TYPE_WRITE      (0x72697465) //ascii:"rite"

#define NUMBER_OF_ROWS_IN_BOARD_STACK   (4)
#define NUMBER_OF_COLUMNS_IN_BOARD_STACK   (4)
#define NUMBER_OF_PACKET_TYPES (5)
#define NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET (14)

enum packet_type {COMMAND,ACKNOWLEDGE,ERROR};
enum command_type {PING,READ,WRITE};

class packet {   
 public:
  packet();
  ~packet();
  ////////COMMANDS TO CREATE PACKETS//////////////////////
  //Create a skeleton command packet with no commands
  //The default arguments set command ID to 0 and the board_id to 0x0000
  //So the first command will have ID = 1 and be a broadcast command
  void CreateCommandPacket(unsigned int base_command_id = 0, 
			   unsigned short int board_id = 0x0000);
  //Add a command to the packet
  void AddPingToPacket();
  void AddReadToPacket(unsigned short int reg_id);
  void AddWriteToPacket(unsigned short int reg_id,
                        unsigned short int reg_data);
  //Return the total size or payload size
  int GetTotalSize();
  int GetPayloadSize();
  //Creates your packet on the heap and passes back
  //a pointer.  You are responsible for deleting it after you're
  //done with it.
  unsigned int* AssemblePacket(int &total_size_in_words);
  /////////GENERIC COMMANDS/////////////////////////////
  void PrintPacket();
  /////////COMMANDS TO READ PACKETS////////////////////
  void ReadPacket(unsigned int *data);
  
  static unsigned int GetCurrentCommandID();

 private:
  std::vector<unsigned int> payload_data;
  static unsigned int command_id;

};

struct DAC_settings_type {
  unsigned short trigger_test_channel_threshold  
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_comparator_bias         
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_01            
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_23            
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_45            
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short trigger_threshold_67            
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short comparator_output_width         
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short sampling_rate_adjustment_PFET   
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short sampling_rate_adjustment_NFET   
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short buffer_amplifier_bias           
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_ramp_buffer_bias      
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_ramp_current_bias     
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_comparator_bias       
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_comparator_pullup_bias
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
  unsigned short Wilkinson_clock_rate            
	[NUMBER_OF_ROWS_IN_BOARD_STACK][NUMBER_OF_COLUMNS_IN_BOARD_STACK];
};

struct command_arguments_type {
  unsigned long uint32[NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET];
};


void 
generate_skeleton_command_packet(void);

unsigned long 
calculate_checksum_and_insert_into_packet(unsigned long* packet);

void 
setup_default_DAC_settings(void);

void 
send_DAC_setting_command(void);

void 
generate_command_packet(unsigned long command, 
			     unsigned long argument);

void 
send_command_packet_to_all_enabled_channels(unsigned long command, 
					    unsigned long argument);

void 
send_command_packet_to_some_enabled_channels
(unsigned long command, unsigned long argument,  
 unsigned short int channel_bitmask);

void 
generate_complex_command_packet
(unsigned long command, const command_arguments_type& command_arguments);

void 
send_complex_command_packet_to_all_enabled_channels
(unsigned long command, 
 const command_arguments_type& command_arguments);


#endif
