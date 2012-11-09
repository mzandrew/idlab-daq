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

enum packet_type {COMMAND,ACKNOWLEDGE,ERROR};
enum command_type {PING,READ,WRITE};

class packet {
	public:
		packet();
		~packet();
		////////COMMANDS TO CREATE PACKETS//////////////////////
		//Create a skeleton command packet with no commands
		//The default arguments set command ID to 0 and the board_id to 0x0000
		//Reset the current packet
		void ClearPacket();
		//So the first command will have ID = 1 and be a broadcast command
		void CreateCommandPacket(unsigned int base_command_id = 0, unsigned int board_id = 0);
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
	private:
		std::vector<unsigned int> payload_data;
		unsigned int command_id;
};

//Some extra utilities that are outside of the class definition
char sanitize_char(char mychar);

#endif
