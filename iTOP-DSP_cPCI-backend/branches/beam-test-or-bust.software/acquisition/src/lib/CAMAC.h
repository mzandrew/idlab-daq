// 2011 mza
// 2012 Kurtis

#ifndef __CAMAC_H__
#define __CAMAC_H__

#include "libxx_usb.h"

#include <stdio.h>
#include <fstream>
#include <string>
#include <vector>

#define DEBUG_FLAG   (0)
#define CAMAC_SLAC_SCANNING
//#define CAMAC_SLAC_CRT
//#define CAMAC_ITOP

int init_CAMAC_controller();
void close_CAMAC_controller();

int read_data_from_CAMAC_and_write_to_CAMAC_file(void);
void open_CAMAC_file(void);
void close_CAMAC_file(void);
void open_CAMAC_file_to_prepare_for_next_spill(void);
void close_CAMAC_file_to_prepare_for_next_spill(void);

extern int CAMAC_fd;
extern bool CAMAC_initialized;

void open_CAMAC3377_file(void);
void close_CAMAC3377_file(void);
void open_CAMAC3377_file_to_prepare_for_next_spill(void);
void close_CAMAC3377_file_to_prepare_for_next_spill(void);
void CAMAC_initialize_3377s(void);
void CAMAC_read_3377s(void);

extern int CAMAC3377_fd;

#define N_SLOTS (24)

#define CONTINUATION_BIT (0x8000)
#define ADDRESS_SCAN_BIT (0x0020)
#define Q_STOP_BIT       (0x0010)

#define STACK_END_MARKER (0xFFFF)
#define STACK_READ_TIMEOUT (60*1000) //in ms
#define STACK_READ_AND_DISCARD_TIMEOUT (100) //in ms

#define DEFAULT_BUFFER_SIZE      (4096) //TODO: check units here, words or bytes?

enum OUTPUT_METHOD {ASCII_FILE, BINARY_FILE, STDOUT, NONE};
class CC_USB;
class CAMAC_module;
class generic_CAMAC_module;
class Phillips_7186;
class LeCroy_3377;

class CC_USB {
	public:
		//Constructor with serial number as input
		CC_USB(std::string sn);
		//Destructor
		~CC_USB();
		//Retrieves the serial number of the module
		std::string GetSerialNumber();
		//Get the usb_dev_handle to the crate
		usb_dev_handle *GetHandle();
		//Open communications with the crate
		void Open();
		//Close communications with the crate
		void Close();
		//Add a module to the crate
		void AddModule(CAMAC_module *module_to_add);
		//Simple read of all modules, write to an ofstream in binary or ASCII format, or to stdout
		void ReadAndClearAllModulesOnce(OUTPUT_METHOD output_type = STDOUT, std::ofstream *fout = NULL);
		//Set up the primary command stack
		void LoadPrimaryCommandStack();
		//Activate autotriggering (execute primary command stack on receipt of I1)
		void TriggerOnI1(bool trigger_setting = true);
		//Set the trigger delay in us [0-255] (from trigger @ I1 to execution of command stack)
		void SetTriggerDelay(unsigned short int delay = 10);
		//Set single event mode buffering
		//This also sets the second header word to indicate the number of words in the output stream
		void SetSingleEventMode();	
		//Read from the buffer with a short timeout, and discard the buffer
		int ReadAndDiscard();
		//Read event from the buffer.  Returns the number of bytes read from USB.
		int Read(OUTPUT_METHOD output_type = STDOUT, std::ofstream *fout = NULL);
		//Read event from the buffer, but use write/read instead of ofstream.
		int ReadFcntl(OUTPUT_METHOD output_type = STDOUT, int fd = -1);
		
	private:
		std::string serial_number;
		usb_dev_handle *crate_handle;
		CAMAC_module *modules[N_SLOTS];
		int buffer_size;
};

//Virtual class for a CAMAC module.
class CAMAC_module {
	public:
		CAMAC_module(usb_dev_handle *hnd, int in_N, int in_ch, bool in_use_clearing_read = true);
		~CAMAC_module();
		//Simple readout that returns data, Q, and X in vectors of long, int, and int, respectively
		//Purely virtual, since the read method should be defined for various modules
		virtual void ClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X) = 0;
		virtual void NonClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X) = 0;
		//Simple readout that writes the data to an ofstream in binary or ASCII file, or stdout
		virtual void ClearingRead(OUTPUT_METHOD output_type = STDOUT, std::ofstream *fout = NULL);
		virtual void NonClearingRead(OUTPUT_METHOD output_type = STDOUT, std::ofstream *fout = NULL);
		virtual void AddReadToStack(std::vector<long> &current_stack);
		virtual void AddClearingReadToStack(std::vector<long> &current_stack) = 0;
		virtual void AddNonClearingReadToStack(std::vector<long> &current_stack) = 0;
		int GetNChannels();
		int GetSlot();
	protected:
		int N;  //Slot number
		int channels; //Number of channels
		bool use_clearing_read; //Flag to determine whether we want a clearing or non-clearing read
		usb_dev_handle *crate_handle;
};

//A generic CAMAC module.  F(2) is assumed to be a clearing read that
//clears on the last A value.
//Stack implementation of the read is done with a complex command that
//repeats the F(2) command until A(channels-1).
class generic_CAMAC_module : public CAMAC_module {
	public:
		generic_CAMAC_module(usb_dev_handle *hnd, int in_N, int in_ch, bool in_use_clearing_read) : CAMAC_module(hnd,in_N,in_ch,in_use_clearing_read) {};
		void ClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X);
		void NonClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X);
		void AddClearingReadToStack(std::vector<long> &current_stack);
		void AddNonClearingReadToStack(std::vector<long> &current_stack);
};

//Implementation of the Phillips 7186 CAMAC module (16 channel TDC)
class Phillips_7186 : public CAMAC_module {
	public:
		Phillips_7186(usb_dev_handle *hnd, int in_N) : CAMAC_module(hnd,in_N,16,true) {};
		void ClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X);
		void NonClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X);
		void AddClearingReadToStack(std::vector<long> &current_stack);
		void AddNonClearingReadToStack(std::vector<long> &current_stack) {} //Not implemented;
};

//Implementation of the LeCroy 3377 CAMAC module (32 channel TDC)
class LeCroy_3377 : public CAMAC_module {
	public:
		LeCroy_3377(usb_dev_handle *hnd, int in_N) : CAMAC_module(hnd,in_N,32) {};
		void ClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X);
		void NonClearingRead(std::vector<long> &data, std::vector<int> &Q, std::vector<int> &X) {} //Not implemented;
		void AddClearingReadToStack(std::vector<long> &current_stack);
		void AddNonClearingReadToStack(std::vector<long> &current_stack) {} //Not implemented;
};

//Utility function to create a simple command word
long CreateSimpleCommand(int N, int F, int A, bool long_mode = true);

#endif

