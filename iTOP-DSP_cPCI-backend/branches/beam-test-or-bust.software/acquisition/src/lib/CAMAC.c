// 2011-09 Andrew Wong
// 2011-11 mza, Inami, Kurtis
// 2012 Kurtis

using namespace std;

#include "acquisition.h"
#include "CAMAC.h"
#include <string>
#include <iostream>
#include <iomanip>
#include <stdio.h>
#include <fcntl.h>

bool CAMAC_initialized = false;

int CAMAC_fd = -7; // negative to avoid problem closing an unopened file
string CAMAC_filename;
string old_CAMAC_filename;

#ifdef CAMAC_SLAC_SCANNING
int N_crates = 1;
string crate_serial_number[1] = {"CC0163"};
unsigned int crate_serial_number_hex[1] = {0x00CC0163};
CC_USB *camac_crate[1];
#endif
#ifdef CAMAC_SLAC_CRT
int N_crates = 2;
string crate_serial_number[2] = {"CC0132", "CC0131"};
unsigned int crate_serial_number_hex[2] = {0x00CC0132, 0x00CC0131};
CC_USB *camac_crate[2];
#endif

int init_CAMAC_controller() {
	// Create the crates
	for (int i = 0; i < N_crates; ++i) {
		camac_crate[i] = new CC_USB(crate_serial_number[i]);
	}
        //Make sure the crate isn't still in "trigger on I1" mode
	cout << "Turning off autotrigger mode...";
	for (int i = 0; i < N_crates; ++i) {
		camac_crate[i]->TriggerOnI1(false);
	}
	cout << "done." << endl;
	//Read out everything leftover from the CAMAC module over USB
	for (int i = 0; i < N_crates; ++i) {
		int n_old_events = 0;
		while(camac_crate[i]->ReadAndDiscard() > 0) {
			n_old_events++;
			if (n_old_events == 1) {
				cout << "Found old events in the buffer... trying to clear it now." << endl;
			}
		}
		if (n_old_events > 0) {
			cout << "Read out " << dec << n_old_events << hex << " left over in crate " << i << "." << endl;
		}
	}
	// read in CAMAC crate modules
#ifdef CAMAC_SLAC_SCANNING
	camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),21, 8,true)); //Lecroy 2228A, slot 21, 8 channels (11-bit), clearing
#endif
#ifdef CAMAC_SLAC_CRT
        //Add modules for upper crate
        camac_crate[0]->AddModule(new Phillips_7186(camac_crate[0]->GetHandle(), 7)); //Phillips 7186, slot 7, 16 ch (4 ch bits, 12 data bits)  //Added 2012-08-01, trigger phase TDC to ch16
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(), 8, 4, false)); //Jorway Model 84 QUAD Scaler, slot  8, 4 ch (24-bit), nonclearing
        camac_crate[0]->AddModule(new Phillips_7186(camac_crate[0]->GetHandle(), 9)); //Phillips 7186, slot  9, 16 ch, 16-bit (4 ch bits, 12 data bits)
        camac_crate[0]->AddModule(new Phillips_7186(camac_crate[0]->GetHandle(),10)); //Phillips 7186, slot 10, 16 ch, 16-bit (4 ch bits, 12 data bits)
        camac_crate[0]->AddModule(new Phillips_7186(camac_crate[0]->GetHandle(),11)); //Phillips 7186, slot 11, 16 ch, 16-bit (4 ch bits, 12 data bits)
        camac_crate[0]->AddModule(new Phillips_7186(camac_crate[0]->GetHandle(),12)); //Phillips 7186, slot 12, 16 ch, 16-bit (4 ch bits, 12 data bits)
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),13,12,true)); //Lecroy 2249W, slot 13, 12 channels (12-bit), clearing
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),14,12,true)); //Lecroy 2249W, slot 14, 12 channels (12-bit), clearing
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),16,12,true)); //Lecroy 2551, slot 16, 12 channels (24-bit), clearing
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),17,12,true)); //Lecroy 2551, slot 17, 12 channels (24-bit), clearing
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),19, 8,true)); //Lecroy 2228A, slot 19, 8 channels (11-bit), clearing
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),20, 8,true)); //Lecroy 2228A, slot 20, 8 channels (11-bit), clearing
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),21, 8,true)); //Lecroy 2228A, slot 21, 8 channels (11-bit), clearing
        //Add modules for lower crate
        camac_crate[1]->AddModule(new LeCroy_3377(camac_crate[1]->GetHandle(), 1));   //Actually a LeCroy 2277, TODO: double check commands & format
        camac_crate[1]->AddModule(new LeCroy_3377(camac_crate[1]->GetHandle(), 3));   //as above
        camac_crate[1]->AddModule(new LeCroy_3377(camac_crate[1]->GetHandle(), 5));   //as above
        camac_crate[1]->AddModule(new LeCroy_3377(camac_crate[1]->GetHandle(), 7));   //as above
        camac_crate[1]->AddModule(new LeCroy_3377(camac_crate[1]->GetHandle(), 9));   //as above
        camac_crate[1]->AddModule(new LeCroy_3377(camac_crate[1]->GetHandle(),11));   //as above
        camac_crate[1]->AddModule(new Phillips_7186(camac_crate[1]->GetHandle(),16)); //Actually a Phillips 7166, but commands & format appear same
        camac_crate[1]->AddModule(new Phillips_7186(camac_crate[1]->GetHandle(),18)); //Actually a Phillips 7166, but commands & format appear same
#endif
	// build the command stack
	for (int i = 0; i < N_crates; ++i) {
	        camac_crate[i]->LoadPrimaryCommandStack();
	        camac_crate[i]->SetTriggerDelay(20);
	        camac_crate[i]->SetSingleEventMode();
	        camac_crate[i]->TriggerOnI1(true);
	}

	fprintf(debug, "stack initialized and single event mode set");
	fprintf(debug, "\n\n");
	return 0;
}

void close_CAMAC_controller() {
	for (int i = 0; i < N_crates; ++i) {
		camac_crate[i]->TriggerOnI1(false);
	}
	for (int i = 0; i < N_crates; ++i) {
		camac_crate[i]->Close();
	}
}

void close_CAMAC_file(void) {
	if (CAMAC_fd >= 0) {
		//cout << "closing CAMAC file" << endl;
		fprintf(debug, "closing CAMAC file\n");
//		fprintf(stdout, "closing CAMAC file \"%s\"\n", old_CAMAC_filename.c_str());
//		fprintf(stdout, "\"%s\" closed\n", old_CAMAC_filename.c_str());
		close(CAMAC_fd);
	}
}

void open_CAMAC_file(void) {
	//cout << "opening CAMAC file" << endl;
	fprintf(debug, "opening CAMAC file\n");
	CAMAC_filename = base_filename;
	CAMAC_filename += ".camac";
	CAMAC_fd = open(CAMAC_filename.c_str(), O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
	if (CAMAC_fd < 0) {
		fprintf(error, "ERROR: failed to create CAMAC file \"%s\"\n", CAMAC_filename.c_str());
	} else {
		old_CAMAC_filename = CAMAC_filename;
		//fprintf(stdout, "opened CAMAC file \"%s\"\n", CAMAC_filename.c_str());
		fprintf(info, "%s\n", CAMAC_filename.c_str());
	}
}

void open_CAMAC_file_to_prepare_for_next_spill(void) {
	open_CAMAC_file();
}

void close_CAMAC_file_to_prepare_for_next_spill(void) {
	close_CAMAC_file();
}

int read_data_from_CAMAC_and_write_to_CAMAC_file(void) {

	int bytes_out = 0;
	for (int i = 0; i < N_crates; ++i) {
		write(CAMAC_fd, (char *) &crate_serial_number_hex[i], sizeof(unsigned int));
		int number_of_short_uint_data_words = camac_crate[i]->ReadFcntl(BINARY_FILE, CAMAC_fd);
		number_of_short_uint_data_words += 2;  //Add 2 for the crate serial number
		fprintf(info, "C%d[%d] ", i, number_of_short_uint_data_words*sizeof(unsigned short int));
		bytes_out += number_of_short_uint_data_words*sizeof(unsigned short int);
	}

	if (bytes_out <= 0) {
		return 0;
	} else {
		return bytes_out;
	}
}

// --------------------------------------------------------------------------

CC_USB::CC_USB(string sn) {
	serial_number = sn;
	crate_handle = NULL;
	for (int i = 0; i < 24; ++i) {
		modules[i] = NULL;
	}
	this->Open();
}

CC_USB::~CC_USB() {
	for (int i = 0; i < N_SLOTS; ++i) {
		if (modules[i]) {
			delete modules[i];
		}
	}
	if (crate_handle) {
		Close();
	}
}

string CC_USB::GetSerialNumber() {
	return serial_number;
}

usb_dev_handle *CC_USB::GetHandle() {
	return crate_handle;
}

void CC_USB::Open() {
	if (crate_handle != NULL) {
		cout << "Crate already appears to be open!  Ignoring command." << endl;
	} else {
		crate_handle = xxusb_serial_open((char *) serial_number.c_str());
		if (!crate_handle) {
			cout << "Couldn't open communications with CC_USB " << serial_number << endl;
			exit(14);
		}
	}
}

void CC_USB::Close() {
	if (!crate_handle) {
		cout << "Crate already appears to be closed!  Ignoring command." << endl;
	} else {
		int closed = xxusb_device_close(crate_handle);
		if (!closed) {
			cout << "Couldn't close crate!" << endl;
		} else {
			crate_handle = NULL;
		}
	}
}

void CC_USB::AddModule(CAMAC_module *module_to_add) {
	int new_slot = module_to_add->GetSlot();  //CAMAC slots are numbered starting from 1...
	if (modules[new_slot-1] != NULL) {
		cout << "Error!  Slot " << new_slot << " is already occupied!  Ignoring request." << endl;
		return;
	} else {
		modules[new_slot-1] = module_to_add; //TODO: double check the indexing on this
	}
}

void CC_USB::ReadAndClearAllModulesOnce(OUTPUT_METHOD output_type, ofstream *fout) {
	for (int i = 0; i < N_SLOTS; ++i) {
		if (modules[i]) {
			modules[i]->ClearingRead(output_type, fout);
		}
	}
}

void CC_USB::LoadPrimaryCommandStack() {
	short stack_address = 2; //This is the "regular" stack
	//First grab all the commands for the modules that we're reading out
	vector<long> command_list;
	//Calculate the expected buffer size as we go
	buffer_size = 0;
	for (int i = 0; i < N_SLOTS; ++i) {
		if (modules[i]) {
			modules[i]->AddReadToStack(command_list);
			buffer_size += modules[i]->GetNChannels() * 4; //4 since it will be a char buffer and we're reading 32-bits at a time
		}
	}
	//Double the buffer just for good measure?  TODO: check this
	buffer_size *= 2;
	//Add one command for writing the end marker (see p. 28 of CC_USB manual)
	command_list.push_back( CreateSimpleCommand(0,16,0,false) );

	//Now use those commands to build the stack
	long *command_stack = new long[command_list.size()+2];
	//First word in the stack is the number of words, not including this one, but including the footer
	int word = 0;
	command_stack[word++] = command_list.size()+1; 
	for (vector<long>::iterator i = command_list.begin(); i != command_list.end(); ++i) {
		command_stack[word++] = (*i);
	}
	//Last word is the stack end marker 
	command_stack[word++] = STACK_END_MARKER;
	
	//Now actually send the stack to the module
	int stack_write_return = xxusb_stack_write(crate_handle, stack_address, command_stack);
	
	//Now read back the command stack to verify that it matches
	long *verification_stack = new long[command_list.size()+2];
	int stack_read_return = xxusb_stack_read(crate_handle,2,verification_stack);
	bool success = true; 
	if (stack_read_return <= 0 || stack_write_return <= 0) {
		cout << "xxusb_stack_write_returned: " << stack_write_return << endl;
		cout << "xxusb_stack_read returned : " << stack_read_return << endl;
		success = false;
	} else {
		cout << "=======COMMAND STACK========" << endl;
		cout << "\tWRITTEN\tREAD_BACK" << endl;
		for (int i = 0; i < command_list.size()+2; ++i) {
			cout << "\t0x" << hex << setw(4) << setfill('0') << command_stack[i];
			cout << "\t0x" << hex << setw(4) << setfill('0') << verification_stack[i]; 
			cout << dec << endl;
			if (command_stack[i] != verification_stack[i]) {
//				cout << "Mismatch during readback of stack!" << endl;
				success = false;
			}
		}
	}

	//Clean up
	delete command_stack;	
	delete verification_stack;

	if (!success) {
		cout << "Failed to verify CC_USB command stack!  Trying to load again..." << endl;
		sleep(1);
		CAMAC_Z(this->GetHandle());
		sleep(1);
		this->LoadPrimaryCommandStack();
	} else {
		cout << "Verified CC_USB command stack." << endl;
	}
}

void CC_USB::TriggerOnI1(bool trigger_setting) {
	long address = 0x1;
	long data = 0x0;
	if (trigger_setting) {
		data |= 0x1;
	}
	xxusb_register_write(crate_handle, address, data);

	//Somehow reading back the command register never works properly...
	//Is it a write only register?  TODO: Check manual to verify.
/*
	long data_readback;
	xxusb_register_read(crate_handle, address, &data_readback);

	cout << "Action register: " << hex << data << "\t" << data_readback << dec << endl;
	if (data != data_readback) {
		cout << "Failed to verify action register.  Trying again..." << endl;
		this->TriggerOnI1(trigger_setting);
	} else {
		cout << "Trigger on I1: " << (trigger_setting?"true":"false") << endl;
	}
*/	
}

void CC_USB::SetTriggerDelay(unsigned short int delay) {
	if (delay > 255) {
		cout << "Invalid trigger delay value!  Terminating execution!" << endl;
		exit(1);
	}
	//N=25,F=16,A=2 (lowest 8 bits are the delay in us)
	int N = 25, F = 16, A = 2;
	long data = 0x0;
	data |= delay;
	int Q, X;
	CAMAC_write(crate_handle,N,A,F,data,&Q,&X);

	//Read back the delay (N=25,F=0,A=2)
	F = 0;
	long data_readback;
	CAMAC_read(crate_handle,N,A,F,&data_readback,&Q,&X);
	
	if (data != data_readback) {
		cout << "Failed to verify trigger delay.  Trying again..." << endl;
		this->SetTriggerDelay(delay);
	} else {
		cout << "Trigger delay set to: " << delay << " us." << endl;
	}	
	
}

void CC_USB::SetSingleEventMode() {
	long data = 0x7; //Sets single event mode readout
//	data |= 0x100;   //Adds the second optional header word
	//N=25,F=16,A=1 (see p. 15 of CC_USB manual)
	int N = 25, F = 16, A = 1;
	int Q, X;
	CAMAC_write(crate_handle,N,A,F,data,&Q,&X);
	
	//Read back the data
	F = 0;
	long data_readback;
	CAMAC_read(crate_handle,N,A,F,&data_readback,&Q,&X);

	if (data != data_readback) {
		cout << "Failed to verify single event mode readout.  Trying again..." << endl;
		sleep(1);
		this->SetSingleEventMode();
	} else {
		cout << "Single event mode readout set." << endl;
	}	

}

int CC_USB::ReadAndDiscard() {
	unsigned int *buffer = new unsigned int[DEFAULT_BUFFER_SIZE]();
	int bytes_read = xxusb_bulk_read(crate_handle,(char *) buffer,DEFAULT_BUFFER_SIZE,STACK_READ_AND_DISCARD_TIMEOUT);
	delete buffer;
	return bytes_read;
}

int CC_USB::Read(OUTPUT_METHOD output_type, ofstream *fout) {
	//TODO: The buffer size elsewhere in the code is in "words," which we consider an unsigned int
	//      However, the crate controller uses unsigned short ints as a more fundamental unit.
	unsigned short int *buffer = new unsigned short int[buffer_size*2]();
	int bytes_read = xxusb_bulk_read(crate_handle,(char *) buffer,buffer_size*sizeof(unsigned int),STACK_READ_TIMEOUT);

	if (bytes_read <= 0) {
		cout << "xxusb_bulk_read returned: " << bytes_read << endl;
		delete buffer;
		return 0;
	}

	int number_of_short_uint_data_words = 0;
	for (int i = 0; i < buffer_size*2 - 1; ++i) {
		//Check for the end of event marker
		if (buffer[i] == 0xFFFF && buffer[i+1] == 0xFFFF) {
			number_of_short_uint_data_words = i+1+1; //+1 to get the last footer word, and +1 since we start from 0
			break;
		} 
	}
	if (number_of_short_uint_data_words == 0) {
		cout << "Couldn't find end of event marker!" << endl;
	}
	if (output_type == STDOUT) {
		for (int i = 0; i < number_of_short_uint_data_words; ++i) {
			cout << "0x" << hex << setw(4) << setfill('0') << buffer[i] << " " << dec;
		}
		cout << endl;
	} else if (output_type == ASCII_FILE) {
		//TODO
	} else if (output_type == BINARY_FILE) {
		//TODO
	} else if (output_type == NONE) {
		//Don't do anything
	}

	delete[] buffer;
	return bytes_read;

}

int CC_USB::ReadFcntl(OUTPUT_METHOD output_type, int fd) {
	//TODO: The buffer size elsewhere in the code is in "words," which we consider an unsigned int
	//      However, the crate controller uses unsigned short ints as a more fundamental unit.
	unsigned short int *buffer = new unsigned short int[buffer_size*2]();
	int bytes_read = xxusb_bulk_read(crate_handle,(char *) buffer,buffer_size*sizeof(unsigned int),STACK_READ_TIMEOUT);

	if (bytes_read <= 0) {
		cout << "xxusb_bulk_read returned: " << bytes_read << endl;
		delete buffer;
		return 0;
	}

	int number_of_short_uint_data_words = 0;
	for (int i = 0; i < buffer_size*2 - 1; ++i) {
		//Check for the end of event marker
		if (buffer[i] == 0xFFFF && buffer[i+1] == 0xFFFF) {
			number_of_short_uint_data_words = i+1+1; //+1 to get the last footer word, and +1 since we start from 0
			break;
		} 
	}
	if (number_of_short_uint_data_words == 0) {
		cout << "Couldn't find end of event marker!" << endl;
	}

	if (output_type == STDOUT) {
		for (int i = 0; i < number_of_short_uint_data_words; ++i) {
			cout << hex << buffer[i] << " ";
		}
		cout << endl;
	} else if (output_type == ASCII_FILE) {
		//TODO
	} else if (output_type == BINARY_FILE) {
		write(fd, (char *) buffer, number_of_short_uint_data_words * sizeof(unsigned short int));
	} else if (output_type == NONE) {
		//Don't do anything
	}

	delete[] buffer;
	return number_of_short_uint_data_words;
}

/////////////////////

CAMAC_module::CAMAC_module(usb_dev_handle *hnd, int in_N, int in_ch, bool in_use_clearing_read) : crate_handle(hnd), N(in_N), channels(in_ch), use_clearing_read(in_use_clearing_read) {}

CAMAC_module::~CAMAC_module() {}

int CAMAC_module::GetNChannels() {
	return channels;
}

int CAMAC_module::GetSlot() {
	return N;
}

void CAMAC_module::ClearingRead(OUTPUT_METHOD output_type, ofstream *fout) {
	int F = 2;
	vector<long> data;
	vector<int> Q, X;
	this->ClearingRead(data,Q,X);

	if (output_type == STDOUT) {
		cout << this->GetSlot() << " " << this->GetNChannels();
		for (vector<long>::iterator i = data.begin(); i != data.end(); ++i) {
			cout << " " << (*i);
		}
		cout << endl;
	} else if (output_type == ASCII_FILE) {
		(*fout) << this->GetSlot() << " " << this->GetNChannels();
		for (vector<long>::iterator i = data.begin(); i != data.end(); ++i) {
			(*fout) << " " << (*i);
		}
		(*fout) << endl;
	} else if (output_type == BINARY_FILE) {
		fout->write( (char *) &N, sizeof(int) );
		fout->write( (char *) &channels, sizeof(int) );
		for (vector<long>::iterator i = data.begin(); i != data.end(); ++i) {
			fout->write( (char *) &(*i), sizeof(long) );
		}
	} else if (output_type == NONE) {
		//Do nothing
	}
}

void CAMAC_module::NonClearingRead(OUTPUT_METHOD output_type, ofstream *fout) {
	int F = 0;
	vector<long> data;
	vector<int> Q, X;
	this->ClearingRead(data,Q,X);

	if (output_type == STDOUT) {
		cout << this->GetSlot() << " " << this->GetNChannels();
		for (vector<long>::iterator i = data.begin(); i != data.end(); ++i) {
			cout << " " << (*i);
		}
		cout << endl;
	} else if (output_type == ASCII_FILE) {
		(*fout) << this->GetSlot() << " " << this->GetNChannels();
		for (vector<long>::iterator i = data.begin(); i != data.end(); ++i) {
			(*fout) << " " << (*i);
		}
		(*fout) << endl;
	} else if (output_type == BINARY_FILE) {
		fout->write( (char *) &N, sizeof(int) );
		fout->write( (char *) &channels, sizeof(int) );
		for (vector<long>::iterator i = data.begin(); i != data.end(); ++i) {
			fout->write( (char *) &(*i), sizeof(long) );
		}
	} else if (output_type == NONE) {
		//Do nothing
	}
}

void CAMAC_module::AddReadToStack(vector<long> &current_stack) {
	//Add a marker that says what slot we're reading
	current_stack.push_back( CreateSimpleCommand(0,16,0,false) ); //N0, A0, F16 (write marker word), see p. 23
	current_stack.push_back( this->GetSlot() );
	if (use_clearing_read) {
		this->AddClearingReadToStack(current_stack);
	} else {
		this->AddNonClearingReadToStack(current_stack);
	}
	//Add a marker that says this slot is done 
	current_stack.push_back( CreateSimpleCommand(0,16,0,false) ); //N0, A0, F16 (write marker word), see p. 23
	current_stack.push_back( 0xDDDD );
}

void generic_CAMAC_module::ClearingRead(vector<long> &data, vector<int> &Q, vector<int> &X) {
	int F = 2;
	long this_data;
	int this_Q, this_X;
	for (int A = 0; A < channels; ++A) {
		CAMAC_read(crate_handle,N,A,F,&this_data,&this_Q,&this_X);
		data.push_back(this_data);
		Q.push_back(this_Q);
		X.push_back(this_X);
	}
}

void generic_CAMAC_module::NonClearingRead(vector<long> &data, vector<int> &Q, vector<int> &X) {
	int F = 0;
	long this_data;
	int this_Q, this_X;
	for (int A = 0; A < channels; ++A) {
		CAMAC_read(crate_handle,N,A,F,&this_data,&this_Q,&this_X);
		data.push_back(this_data);
		Q.push_back(this_Q);
		X.push_back(this_X);
	}
}

void generic_CAMAC_module::AddClearingReadToStack(vector<long> &current_stack) {
	//Normal read is an F(2), starting at A(0)
	long word1 = CreateSimpleCommand(N,2,0);
	word1 |= CONTINUATION_BIT; 
	current_stack.push_back(word1);
	//This sets up address scan mode to automatically step through commands
	long word2 = CONTINUATION_BIT | ADDRESS_SCAN_BIT;
	current_stack.push_back(word2);
	//Defines the number of times to repeat the command
	long word3 = (long) channels; //Maybe this should be channels - 1?
	current_stack.push_back(word3);
}

void generic_CAMAC_module::AddNonClearingReadToStack(vector<long> &current_stack) {
	//Normal read is an F(2), starting at A(0)
	long word1 = CreateSimpleCommand(N,0,0);
	word1 |= CONTINUATION_BIT; 
	current_stack.push_back(word1);
	//This sets up address scan mode to automatically step through commands
	long word2 = CONTINUATION_BIT | ADDRESS_SCAN_BIT;
	current_stack.push_back(word2);
	//Defines the number of times to repeat the command
	long word3 = (long) channels; //Maybe this should be channels - 1?
	current_stack.push_back(word3);
}

void Phillips_7186::NonClearingRead(vector<long> &data, vector<int> &Q, vector<int> &X) {
	//Readout all 16 channels with F(0)A(0-15)
	int F = 0;
	long this_data;
	int this_Q, this_X;
	for (int A = 0; A < channels; ++A) {
		CAMAC_read(crate_handle,N,A,F,&this_data,&this_Q,&this_X);
		//Data is of the format 0xNTTT, where N is channel number and TTT is the TDC value
		this_data &= 0x0FFF;
		data.push_back(this_data);
		Q.push_back(this_Q);
		X.push_back(this_X);
	}
}

void Phillips_7186::ClearingRead(vector<long> &data, vector<int> &Q, vector<int> &X) {
	//Readout all 16 channels with F(0)A(0-15)
	int F = 0;
	long this_data;
	int this_Q, this_X;
	for (int A = 0; A < channels; ++A) {
		CAMAC_read(crate_handle,N,A,F,&this_data,&this_Q,&this_X);
		//Data is of the format 0xNTTT, where N is channel number and TTT is the TDC value
		this_data &= 0x0FFF;
		data.push_back(this_data);
		Q.push_back(this_Q);
		X.push_back(this_X);
	}
	//And clear manually
	F = 9; //F(9)A(any) does a clear
	CAMAC_read(crate_handle,N,0,F,&this_data,&this_Q,&this_X);
}

void Phillips_7186::AddClearingReadToStack(vector<long> &current_stack) {
	//Read sparse data is F(4)A(0)
	long word1 = CreateSimpleCommand(N,4,0);
	word1 |= CONTINUATION_BIT;
	current_stack.push_back(word1);
	//Read in Q-stop mode, continue until Q = 0;
	long word2 = CONTINUATION_BIT | Q_STOP_BIT;
	current_stack.push_back(word2);
	//Maximum number of times to repeat command.  There's no buffering, so max # of hits is # of channels.
	long word3 = (long) channels;
	current_stack.push_back(word3);	
}

void LeCroy_3377::ClearingRead(vector<long> &data, vector<int> &Q, vector<int> &X) {
	//Readout all 32 channels with F(0)A(0) [repeat until Q = 0)
	int F = 0;
	int A = 0;
	long this_data;
	int this_Q, this_X;
	do {
		CAMAC_read(crate_handle,N,A,F,&this_data,&this_Q,&this_X);
		if (this_Q == 1) {
			data.push_back(this_data); //TODO: unmask the data here, implement multihit per channel
		}
	} while (this_Q == 1);
}

void LeCroy_3377::AddClearingReadToStack(vector<long> &current_stack) {
        //Read event FIFO is F(0)A(0)
        long word1 = CreateSimpleCommand(N,0,0);
        word1 |= CONTINUATION_BIT;
        current_stack.push_back(word1);
        //Read in Q-stop mode, continue until Q = 0;
        long word2 = CONTINUATION_BIT | Q_STOP_BIT;
        current_stack.push_back(word2);
        //Maximum number of times to repeat command.  
	//TODO: There IS buffering on this module, so we can potentially get more words.
        long word3 = (long) channels;
        current_stack.push_back(word3);
}

long CreateSimpleCommand(int N, int F, int A, bool long_mode) {	
	long word = F + 32*A + 512*N + 16384*( int(long_mode) );
	return word;
}

