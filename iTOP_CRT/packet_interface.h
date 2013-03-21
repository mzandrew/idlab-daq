#ifndef PACKET_INTERFACE__H
#define PACKET_INTERFACE__H

#include <vector>
#include <fstream>

#define MAXIMUM_PACKET_SIZE (512)  //In words
#define MINIMUM_PACKET_SIZE (7)    //In words (ping response)

#define PACKET_HEADER           (0x00BE11E2) //hex:BELLE2
#define PACKET_TYPE_COMMAND     (0x646f6974) //ascii:"doit"
#define PACKET_TYPE_ACKNOWLEDGE (0x6f6b6179) //ascii:"okay"
#define PACKET_TYPE_ERROR       (0x7768613f) //ascii:"wha?"
#define PACKET_TYPE_EVENT       (0x65766e74) //ascii:"evnt"
#define PACKET_TYPE_WAVEFORM    (0x77617665) //ascii:"wave"
#define COMMAND_TYPE_PING       (0x70696e67) //ascii:"ping"
#define COMMAND_TYPE_READ       (0x72656164) //ascii:"read"
#define COMMAND_TYPE_WRITE      (0x72697465) //ascii:"rite"

#define REGISTER_WORD_NUMBER    (6)
#define MASK_REGISTER_ADDR      (0x0000FFFF) 
#define MASK_REGISTER_VAL       (0xFFFF0000)

#define SCROD_ID_WORD_NUMBER    (3)
#define MASK_SCROD_REV          (0x00FF0000)
#define MASK_SCROD_ID           (0x0000FFFF)
#define CURRENT_SCROD_REV       (0xA2)

#define FREEZE_DATE_WORD_NUMBER  (4)
#define EVENT_NUMBER_WORD_NUMBER (5)
#define TRIGGER_TYPE_WORD_NUMBER (6)
#define TRIGGER_TYPE_MASK       (0x000000FF)
#define EVENT_FLAGS_WORD_NUMBER  (7)
#define EVENT_FLAGS_MASK        (0x000000FF)
#define N_WAVEFORMS_WORD_NUMBER  (8)
#define N_AUXILIARY_WORD_NUMBER  (9)

#define WAVE_EVENT_NUMBER_WORD_NUMBER (5)
#define REF_WINDOW_WORD_NUMBER   (4)
#define N_SEGMENTS_WORD_NUMBER   (6)
#define SEG_WINDOW_WORD_NUMBER   (7)
#define MASK_SEG_WINDOW         (0x000001FF)
#define MASK_SEG_CH             (0x00000E00)
#define MASK_SEG_ROW            (0x00003000)
#define MASK_SEG_COL            (0x0000C000)
#define N_POINTS_WORD_NUMBER     (8)
#define FIRST_POINT_WORD_NUMBER  (9)
#define MASK_ADC_EVEN           (0x00000FFF)
#define MASK_ADC_ODD            (0x0FFF0000)

#define MASK_COMMAND_ID         (0x0FFFFFFF)
#define FLAG_SUPPRESS_RESPONSE  (0x80000000)

typedef unsigned int packet_word_t;

enum PacketType   {kUNDEFINED,kCOMMAND,kACKNOWLEDGE,kERROR,kEVENT,kWAVEFORM};
enum CommandType  {kPING,kREAD,kWRITE,kQUIETWRITE};

class packet {
	public:
		////CONSTRUCTORS////
		//Default constructor, creates empty packet
		packet();
		//Creates a packet using data from initial_array[0] to array[size-1]
		//  size is in bytes/chars
		packet(char *initial_array, unsigned int size);
		//Same as above, but takes an array of unsigned ints
		//  size is in number of words
		packet(packet_word_t *initial_array, unsigned int size);
		//Scans for a packet header in stream starting from pos, reads 
		//a number of words based on the length field (one after the header),
		//and returns pos just after the end of the detected packet.
		//If the packet fails any checks, pos will be returned just after
		//the first detected header to allow for rescanning.
		packet(char *stream, unsigned int &pos, unsigned int max_size);
		//Does the same as above but using an ifstream object
		packet(std::ifstream &fin, unsigned int max_size);
		//Default destructor
		~packet();

		////////PACKET MANIPULATION//////////////////////
		//Clears the payload data and checksum of a packet
		void ClearPacket();

		//Return the total size or payload size
		int GetTotalSize();
		int GetPayloadSize();
		//Creates your packet on the heap and passes back
		//a pointer.  You are responsible for deleting it after you're
		//done with it.
		packet_word_t* AssemblePacket(int &total_size_in_words);
		/////////GENERIC COMMANDS/////////////////////////////
		void Print();
		PacketType GetPacketType();
		bool IsValid();
		//Specific commands to given packet types//
		//Reads register reg and value val.  Returns whether read was successful.
		bool ReadRegister(unsigned short int &reg, unsigned short int &val);
		bool ScrodId(unsigned short int &rev, unsigned int &id);
		bool FreezeDate(unsigned int &date);
		bool EventNumber(unsigned int &evtnum);
		bool TriggerType(unsigned char &trigtype);
		bool EventFlags(unsigned char &evtflags);
		bool NWaveforms(unsigned int &n_waveforms);
		bool NAuxiliary(unsigned int &n_auxiliary);
		bool RefWindow(unsigned short int &ref_window);
		bool AsicWindow(unsigned char &asic_col, unsigned char &asic_row, unsigned char &asic_ch, unsigned short int &asic_window);
		bool AsicAdc(unsigned short int *adc);

		//Create new packets
		static packet *CreateCommandPacket(CommandType command, unsigned short int scrod_id = 0, unsigned short int reg = 0, unsigned short int  val = 0, unsigned short int scrod_rev = CURRENT_SCROD_REV);
	protected:
		void RecalculateStoredChecksum();
		//Check a number of items in the packet to see if it has a valid structure
		//  note that this does not check the checksum.
		bool ContainsAPlausiblyValidStructure(packet_word_t *array, unsigned int size);
		//Read a packet from an array of unsigned ints and a size
		void ReadPacket(packet_word_t *initial_array, unsigned int size);

		std::vector<packet_word_t> payload_data;
		packet_word_t stored_checksum;
		bool packet_is_valid;
};



/*
class command_packet : public packet {
	public:
		//Verbosity flags
		enum Verbosity {kNORMAL, kQUIET};
		//////CONSTRUCTORS/////
		//Single command constructor with a command 
		//Examples:
		//  1) ping broadcast                    : command_packet a(kPING);
		//  2) ping to SCROD 32                  : command_packet a(kPING,32);
		//  3) read SCROD 32 reg 23              : command_packet a(kREAD,32,23);
		//  4) write 1027 to SCROD 32 reg 23     : command_packet a(kWRITE,32,23,1027);
		//  5) as above with response suppressed : command_packet a(kQUIETWRITE,32,23,1027);
		//  6) quiet broadcast write 1 to reg 21 : command_packet a(kQUIETWRITE,0,21,1);
		//Command IDs are taken from a global variable that increments when a new command is created
		command_packet(command_type command, unsigned int scrod_id = 0, unsigned short int reg_id = 0, unsigned short int reg_val = 0);

		/////MULTI-COMMAND SUPPORT////
		//Not implemented at the moment.
		//
		//Add commands to the packet for multi-command use
		//void AddPingToPacket();
		//void AddReadToPacket(unsigned short int reg_id);
		//void AddWriteToPacket(unsigned short int reg_id, 
		//                      unsigned short int reg_data);
		//
};

class response_packet : public packet {
	public:
		//Constructors are the same as those for the base class

		//Accessors for the guts of a packet
		unsigned int GetScrodId();
		unsigned int GetRegister();
		unsigned int GetValue();
		unsigned int GetResponseType();
		//Check against a single command packet 
		bool CommandWasExecutedSuccessfully(command packet);
		
};

//Still to be added... empty for now
class event_header_packet : public packet {

};
class waveform_packet : public packet {

};
*/
#endif

