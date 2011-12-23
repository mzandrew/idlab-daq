#include "EventStructure.h"
#include <iostream>

using namespace std;

packet_read_status PacketData::ReadPacketFromFile(ifstream &fin) {
	software_checksum = 0;
	dword packet_words[WORDS_IN_PACKET] = {0};
	//Search the file for a packet and event header
	bool found_misplaced_header = false;
	do {
		if (fin.eof()) {
			return END_OF_FILE;
		}
		fin.read((char*)&packet_words[0], sizeof(dword));
	} while (packet_words[0] != PACKET_HEADER);
	software_checksum += packet_words[0];

	for (int i = 1; i < WORDS_IN_PACKET; ++i) {
		fin.read((char*)&packet_words[i], sizeof(dword));
		software_checksum += packet_words[i];
		if (packet_words[i] == PACKET_HEADER) {
			found_misplaced_header = true;
			packet_words[0] = packet_words[i];
			software_checksum = packet_words[i];
			i = 0;
		}
	}

	for (int i = 0; i < WORDS_IN_PACKET; ++i) {
		if (i == 0) packet_header = packet_words[i];
		if (i == 1) packet_size   = packet_words[i];
		if (i == 2) protocol_date = packet_words[i];
		if (i == 3) packet_type   = packet_words[i];
		if (i == 4) event_number  = packet_words[i];
		if (i == 5) packet_number_and_origin_window = packet_words[i];
		if (i >= 6 && i <= 136) packet_data[i-6] = packet_words[i];
		if (i == 137) scrod_id    = packet_words[i];
		if (i == 138) checksum    = packet_words[i];
		if (i == 139) footer      = packet_words[i];
	}

	//The checksum should not be included in itself.
	software_checksum -= this->checksum;

	if (found_misplaced_header) {
		return MISPLACED_PACKET;
	} else {
		return SUCCESS;
	}

}

unsigned int PacketData::CheckPacket() {
	unsigned int this_status = 0;
	if (this->packet_header != PACKET_HEADER) { 
		this_status |= BAD_HEADER;
//		cout << hex << "Header is " << packet_header << " but expected " << PACKET_HEADER << dec << endl;
	}
	if (this->packet_size != PACKET_SIZE) { 
		this_status |= BAD_SIZE;
	}
	if (this->protocol_date != PROTOCOL_FREEZE_DATE) {
		this_status |= BAD_DATE;
//		cout << hex << "Date is " << protocol_date << " but expected " << PROTOCOL_FREEZE_DATE << dec << endl;
	}
	if (this->packet_type != PACKET_TYPE_HEADER       && 
	    this->packet_type != PACKET_TYPE_WAVEFORM     &&
	    this->packet_type != PACKET_TYPE_TRIGGER      &&
	    this->packet_type != PACKET_TYPE_HOUSEKEEPING &&
	    this->packet_type != PACKET_TYPE_FOOTER) {
		this_status |= BAD_TYPE;
	}
	if (this->scrod_id != SCROD_ID_FIXED) {
//		this_status |= BAD_SCROD_ID;
	}
	if (this->checksum != software_checksum) {
		this_status |= BAD_CHECKSUM;
	}
	if (this->footer != PACKET_FOOTER) {
		this_status |= BAD_FOOTER;
	}
	return this_status;
};

unsigned short int PacketData::GetASICRow(int window) {
	if (window == 0) {
		return ( (this->packet_number_and_origin_window & MASK_ASIC_ROW) >> 28);
	} else {
		return ( (this->packet_data[32+(window-1)*33] & MASK_ASIC_ROW) >> 28);	
	}
};

unsigned short int PacketData::GetASICColumn(int window) {
	if (window == 0) {
		return ( (this->packet_number_and_origin_window & MASK_ASIC_COLUMN) >> 24);
	} else {
		return ( (this->packet_data[32+(window-1)*33] & MASK_ASIC_COLUMN) >> 24);
	}
};

unsigned short int PacketData::GetPacketNumber(int window) {
	if (window == 0) {
		return ( (this->packet_number_and_origin_window & MASK_PACKET_NUMBER) >> 16);
	} else {
		return ( (this->packet_data[32+(window-1)*33] & MASK_PACKET_NUMBER) >> 16);
	}
};

unsigned short int PacketData::GetASICChannel(int window) {
	if (window == 0) {
		return ( (this->packet_number_and_origin_window & MASK_ASIC_CHANNEL) >> 12);
	} else {
		return ( (this->packet_data[32+(window-1)*33] & MASK_ASIC_CHANNEL) >> 12);
	}
};

unsigned short int PacketData::GetOriginWindow(int window) {
	if (window == 0) {
		return ( (this->packet_number_and_origin_window & MASK_ORIGIN_WINDOW) );
	} else {
		return ( (this->packet_data[32+(window-1)*33] & MASK_ORIGIN_WINDOW) );
	}
};

unsigned short int PacketData::GetWaveformPoint(int window, int sample) {
	unsigned int word = this->packet_data[window*33 + sample/2];
	unsigned int raw_word = this->packet_data[window*33 + sample/2];
	if (sample % 2 == 0) {
		word = word & MASK_EVEN_ADC;
	} else {
		word = (word & MASK_ODD_ADC) >> 16;
	}
	unsigned short int return_word = word;
	if (word > 4095) cout << hex << raw_word << dec << endl;

	return return_word;
};

void PacketData::GetTriggerStream(int col, int row, int ch, bool *stream) {
	unsigned int mask = (0x1);
	for (int i = 0; i < 16; ++i) {
		stream[i] = (bool) ( ( (this->packet_data[col*16+row*4+ch/2]) >> (i+16*(ch%2)) ) & mask );
	}
}

unsigned short int PacketData::GetTriggerScaler(int col, int row, int ch) {
	unsigned int mask = (0xFFFF);
	unsigned short int return_word = (( (this->packet_data[64+col*16+row*4+ch/2]) >> (16*(ch%2)) ) & mask);
	return return_word;
}

unsigned short int PacketData::GetTemperature() {
	unsigned short int return_word = (this->packet_data[120] & MASK_TEMPERATURE);
	return return_word;
}

unsigned short int PacketData::GetTRGbias(int col, int row) {
	unsigned short int return_word = (this->packet_data[0 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetTRGthresh(int col, int row, int ch) {
	unsigned int word = this->packet_data[8 + col*8 + row*2 + ch/4];
	unsigned int return_word = (word >> ((ch/2)%2==1)*16) & MASK_DAC;
//	cout << hex << word << endl;	
//	cout << hex << return_word << endl;
	return return_word;
}

unsigned short int PacketData::GetWbias(int col, int row) {
	unsigned short int return_word = (this->packet_data[40 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetVadjP(int col, int row) {
	unsigned short int return_word = (this->packet_data[48 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetVadjN(int col, int row) {
	unsigned short int return_word = (this->packet_data[56 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetVbias(int col, int row) {
	unsigned short int return_word = (this->packet_data[64 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetSBbias(int col, int row) {
	unsigned short int return_word = (this->packet_data[72 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetIsel(int col, int row) {
	unsigned short int return_word = (this->packet_data[80 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetVdly(int col, int row) {
	unsigned short int return_word = (this->packet_data[88 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetCMPbias(int col, int row) {
	unsigned short int return_word = (this->packet_data[96 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetPUbias(int col, int row) {
	unsigned short int return_word = (this->packet_data[104 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetTRGthreshref(int col, int row) {
	unsigned short int return_word = (this->packet_data[112 + col*2 + (row/2)] >> (row%2*16)) & MASK_DAC;
	return return_word;
}

unsigned short int PacketData::GetWilkCounter(int col, int row) {
	unsigned short int return_word = (this->packet_data[1 + col*4 + row]);
//	cout << "return_word = " << hex << return_word << dec << endl;
	return return_word;
}

short int PacketData::GetSampRateCounter(int col, int row) {
	unsigned short int counter_short = this->packet_data[18 + col*4 + row];
	unsigned short int *return_word_addr = (unsigned short int *) &counter_short;
//	short int return_word = (this->packet_data[18 + col*4 + row]);
	short int return_word = (*return_word_addr);
	return return_word;
}

EventData::EventData() {
	file_handle = NULL;
	ConfigTree = NULL;
	EventTree = NULL;
	C = NULL;
}

EventData::~EventData() {
	if (file_handle) delete file_handle;
	if (ConfigTree) delete ConfigTree;
	if (EventTree) delete EventTree;
	if (C) delete C;
}

void EventData::Draw() {
//	if (!C) {
//		C = new TCanvas();
//		C->Divide(4,4);
//	}
}

TFile* EventData::OpenROOTFile(const char *root_filename) {
	TFile *file_handle = new TFile(root_filename,"RECREATE");
	//A simple one-entry-per-file tree for variables that are static
	ConfigTree = new TTree("ConfigTree","Configuration Data");
	ConfigTree->Branch("RawFilename"   , RawFilename_cstr     ,"RawFilename/C");
	ConfigTree->Branch("FiberChannel"  , &FiberChannel        ,"FiberChannel/s");
	ConfigTree->Branch("SCROD_Revision", SCROD_Revision_cstr  ,"SCROD_Revision/C");
	ConfigTree->Branch("SCROD_ID"      , &SCROD_ID            ,"SCROD_ID/s");
	ConfigTree->Branch("ASIC_ID"       , ASIC_ID              ,"ASIC_ID[4][4]/s");
	ConfigTree->Branch("ExpNumber"     , &ExpNumber           ,"ExpNumber/i");
	ConfigTree->Branch("RunNumber"     , &RunNumber           ,"RunNumber/i");
	ConfigTree->Branch("SpillNumber"   , &SpillNumber         ,"SpillNumber/i");
	ConfigTree->Branch("StartTime"     , &StartTime           ,"StartTime/I");

	//Set a few configuration variables to default values
	RawFilename = "Uninitialized";
	FiberChannel = 0;
	sprintf(SCROD_Revision_cstr,"Uninitialized");
	SCROD_ID = 0;
	ExpNumber = 0;
	RunNumber = 0;
	SpillNumber = 0;
	StartTime = 0;

	//A seperate tree for variables that get updated once per event
	EventTree = new TTree("EventTree","Event Data");
	//Module information
	EventTree->Branch("EventNumber"          ,&EventNumber,"EventNumber/i");
	EventTree->Branch("Temperature"          ,&Temperature,"Temperature/s");
	//DAC Settings
	EventTree->Branch("ASIC_TRGbias"         ,ASIC_TRGbias,"ASIC_TRGbias[4][4]/s");
	EventTree->Branch("ASIC_TRGthresh"       ,ASIC_TRGthresh,"ASIC_TRGthresh[4][4][8]/s");
	EventTree->Branch("ASIC_Wbias"           ,ASIC_Wbias,"ASIC_Wbias[4][4]/s");
	EventTree->Branch("ASIC_VadjP"           ,ASIC_VadjP,"ASIC_VadjP[4][4]/s");
	EventTree->Branch("ASIC_VadjN"           ,ASIC_VadjN,"ASIC_VadjN[4][4]/s");
	EventTree->Branch("ASIC_Vbias"           ,ASIC_Vbias,"ASIC_Vbias[4][4]/s");
	EventTree->Branch("ASIC_SBbias"          ,ASIC_SBbias,"ASIC_SBbias[4][4]/s");
	EventTree->Branch("ASIC_Isel"            ,ASIC_Isel,"ASIC_Isel[4][4]/s");
	EventTree->Branch("ASIC_CMPbias"         ,ASIC_CMPbias,"ASIC_CMPbias[4][4]/s");
	EventTree->Branch("ASIC_PUbias"          ,ASIC_PUbias,"ASIC_PUbias[4][4]/s");
	EventTree->Branch("ASIC_Vdly"            ,ASIC_Vdly,"ASIC_Vdly[4][4]/s");
	EventTree->Branch("ASIC_TRGthreshref"    ,ASIC_TRGthreshref,"ASIC_TRGthreshref[4][4]/s");
	//Feedback related
	EventTree->Branch("ASIC_WilkCounter"     ,ASIC_WilkCounter,"ASIC_WilkCounter[4][4]/s");
	EventTree->Branch("ASIC_SampRateCounter" ,ASIC_SampRateCounter,"ASIC_SampRateCounter[4][4]/S");
	EventTree->Branch("ASIC_TrigWidthCounter",ASIC_TrigWidthCounter,"ASIC_TrigWidthCounter[4][4]/s");
	//Channel specific information
	EventTree->Branch("ASIC_ADC"             ,ASIC_ADC,"ASIC_ADC[4][4][8][4][64]/s");
	EventTree->Branch("ASIC_OriginWindow"    ,ASIC_OriginWindow,"ASIC_OriginWindow[4][4][8][4]/s");
	EventTree->Branch("ASIC_TriggerStream"   ,ASIC_TriggerStream,"ASIC_TriggerStream[4][4][8][16]/O"); //boolean
	EventTree->Branch("ASIC_Scaler"          ,ASIC_Scaler,"ASIC_Scaler[4][4][8]/s");

	return file_handle;
};

void EventData::WriteConfigTree(const char *input_filename, const char *configuration_file, bool using_manual_scrod_id, unsigned short int manual_scrod_id) {
	string RawFilename_string = input_filename;
	int str_length = RawFilename_string.length();
	string ReducedFilename = RawFilename_string.substr(str_length-50,str_length);
	sprintf(RawFilename_cstr,"%s",ReducedFilename.c_str());
	
	string TimeString = ReducedFilename.substr(0,19);
	char time_string[36];
	strcpy(time_string,TimeString.c_str());

	string ExperimentInfo = ReducedFilename.substr(20, ReducedFilename.length() );
	int nreads = sscanf(ExperimentInfo.c_str(),"exp%2d.run%4d.spill%4d.fiber%1hd",&ExpNumber,&RunNumber,&SpillNumber,&FiberChannel);
	if (nreads != 4) { 
		cout << "Only read " << nreads << " parameter(s) from filename, but expected 5... are you using the most up to date software or did you change the filenames?" << endl;
		cout << "Trying to read alternate file name format..." << endl; 
		ExperimentInfo = ReducedFilename.substr(0,22);
		nreads = sscanf(ExperimentInfo.c_str(),"exp%2d.run%4d.spill%4d.fiber%1hd",&ExpNumber,&RunNumber,&SpillNumber,&FiberChannel);
		TimeString = ReducedFilename.substr(24,23+19);
		strcpy(time_string,TimeString.c_str());
	}
	struct tm file_time;
	char *result = strptime(time_string, "%Y-%m-%d+%H:%M:%S",&file_time);
	time_t epoch_time = mktime(&file_time);
	if (!result) {
		cout << "failed to interpret time string: " << time_string << endl;
	} //else {
		//cout << "determined time as: " <<  epoch_time << endl;
	//}
	StartTime = (int) epoch_time;	

	if (using_manual_scrod_id) {
		SCROD_ID = manual_scrod_id;
		cout << "Overriding autodetect of SCROD ID.  Using ID: " << manual_scrod_id << endl;
	}

	//Parse the configuration file
	ifstream config_in(configuration_file);
	if (!config_in) {
		cout << "Could not open configuration file: " << configuration_file << endl;
		cout << "ASIC numbers will not be recorded correctly!" << endl;
	} else {
		bool found_right_SCROD = false;
		while (config_in) {
			if (config_in.peek() == '#' || config_in.peek() == '\n') {
				config_in.ignore(1024,'\n');
			} else {
				unsigned short int this_scrod;
				config_in >> this_scrod;
				if (this_scrod != SCROD_ID) {
					config_in.ignore(1024,'\n');
				} else {
					for (int col = 0; col < 4; ++col) {
						for (int row = 0; row < 4; ++row) {
							config_in >> ASIC_ID[col][row];
						}
					}
					found_right_SCROD = true;
					break;
				}
			}
		}
		if (!found_right_SCROD || !config_in) {
			cout << "Could not find SCROD_ID in the configuration file: " << configuration_file << endl;
			cout << "ASIC numbers may not be recorded correctly!" << endl;
		}
	}

	ConfigTree->Fill();

	cout << "Reading data from file: " << ReducedFilename << endl;
	cout << "\texperiment    : " << ExpNumber << endl;
	cout << "\trun number    : " << RunNumber << endl;
	cout << "\tspill number  : " << SpillNumber << endl;
	cout << "\tfiber channel : " << FiberChannel << endl;
	cout << "\tSCROD serial# : " << SCROD_ID << endl;
	cout << "\tDaughter cards: ";
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			cout << ASIC_ID[col][row] << " ";
		}
	}
	cout << endl;
}

void EventData::AutoSave() {
	EventTree->AutoSave("SaveSelf");
	ConfigTree->AutoSave("SaveSelf");	
}

void EventData::CloseROOTFile() {
	this->AutoSave();
	gDirectory->Write();

	//I can't quite figure out what to do here to not cause a SEGV...
	//We can just leave it at this if we don't plan to try to open new 
	//files after we close the first.

//	EventTree->Write("",TObject::kOverwrite);
//	ConfigTree->Write("",TObject::kOverwrite);
//	file_handle->Close();  //For some reason this often causes a SEGV?
//	EventTree = NULL;
//	ConfigTree = NULL;
//	file_handle = NULL;
};

int EventData::ReadEvent(ifstream &fin) {
	PacketData test_packet;
	packet_read_status this_status;
	unsigned int packet_error_flags;
	unsigned short int packet_number = -1;

	//Reset error counters for all types
	for (int i = 0; i < N_EVENT_ERROR_TYPES; ++i) {
		N_errors[i] = 0;
	}

	//Clear ADC values
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			for (int k = 0; k < 8; ++k) {
				for (int l = 0; l < 4; ++l) {
					for (int m = 0; m < 64; ++m) {
						ASIC_ADC[i][j][k][l][m] = 9999;
					}
				}
			}
		}
	}

	do {
		this_status = test_packet.ReadPacketFromFile(fin);
		packet_error_flags = test_packet.CheckPacket();
		this->IncrementErrorCounts(this_status);
		if (this_status == MISPLACED_PACKET || packet_error_flags != GOOD_PACKET) {
			//Error condition
//			cout << "WARNING: Packet read status was: " << hex << this_status << endl;
//			cout << "WARNING: Bad packet found, error flags: " << hex << packet_error_flags << dec << endl;
			if (this_status == MISPLACED_PACKET) N_errors[7]++;
			return 0;
		} else if (this_status == END_OF_FILE) {
			N_errors[8]++;
			break;
		} else {
			packet_number = test_packet.GetPacketNumber();
			if (test_packet.packet_type == PACKET_TYPE_HEADER) {
				//Check the packet 
				if (packet_number != 0) {
					cout << "WARNING: Header packet @ " << packet_number;
					cout << " instead of 0." << endl;
				}
				//Grab the event number
				EventNumber = test_packet.event_number;
			} else if (test_packet.packet_type == PACKET_TYPE_WAVEFORM) {
				if (packet_number < 1 || packet_number > 128) {
					cout << "WARNING: Waveform packet @ " << packet_number;
					cout << " instead of 1-128." << endl;
				}
				for (int i = 0; i < 4; ++i) {	
					unsigned short int row = test_packet.GetASICRow(i);
					unsigned short int col = test_packet.GetASICColumn(i);
					unsigned short int ch = test_packet.GetASICChannel(i);
					int window_number_sequentially = ((test_packet.GetPacketNumber()-1)/8)%4;
					ASIC_OriginWindow[col][row][ch][window_number_sequentially] = test_packet.GetOriginWindow(i);
					for (int j = 0; j < 64; ++j) { 
						ASIC_ADC[col][row][ch][window_number_sequentially][j] = test_packet.GetWaveformPoint(i,j);
					}
					
				}
			} else if (test_packet.packet_type == PACKET_TYPE_TRIGGER) {
				if (packet_number != 129) {
					cout << "WARNING: Trigger packet @ " << packet_number;
					cout << " instead of 129." << endl;
				}
				//First read the trigger stream
				for (int i = 0; i < 4; ++i) {
					for (int j = 0; j < 4; ++j) {
						for (int k = 0; k < 8; ++k) {
							test_packet.GetTriggerStream(i,j,k,ASIC_TriggerStream[i][j][k]);
						}
					}
				}
				//Next read the scalers
				for (int i = 0; i < 4; ++i) {
					for (int j = 0; j < 4; ++j) {
						for (int k = 0; k < 8; ++k) {
							ASIC_Scaler[i][j][k] = test_packet.GetTriggerScaler(i,j,k);
						}
					}
				}
			} else if (test_packet.packet_type == PACKET_TYPE_HOUSEKEEPING) {
				if (packet_number != 130) {
					cout << "WARNING: Housekeeping packet @ " << packet_number;
					cout << " instead of 130." << endl;
				}
				Temperature = test_packet.GetTemperature();
				for (int i = 0; i < 4; ++i) {
					for (int j = 0; j < 4; ++j) {
						ASIC_TRGbias[i][j] = test_packet.GetTRGbias(i,j);
						for (int k = 0; k < 8; ++k) {
							ASIC_TRGthresh[i][j][k] = test_packet.GetTRGthresh(i,j,k);
						}
						ASIC_Wbias[i][j] = test_packet.GetWbias(i,j);
						ASIC_VadjP[i][j] = test_packet.GetVadjP(i,j);
						ASIC_VadjN[i][j] = test_packet.GetVadjN(i,j);
						ASIC_Vbias[i][j] = test_packet.GetVbias(i,j);
						ASIC_SBbias[i][j] = test_packet.GetSBbias(i,j);
						ASIC_Isel[i][j] = test_packet.GetIsel(i,j);
						ASIC_Vdly[i][j] = test_packet.GetVdly(i,j);
						ASIC_CMPbias[i][j] = test_packet.GetCMPbias(i,j);
						ASIC_PUbias[i][j] = test_packet.GetPUbias(i,j);
						ASIC_TRGthreshref[i][j] = test_packet.GetTRGthreshref(i,j);
					}
				}
			} else if (test_packet.packet_type == PACKET_TYPE_FOOTER) {
				if (packet_number != 131) {
					cout << "WARNING: Footer packet @ " << packet_number;
					cout << " instead of 131." << endl;
				}
				//Grab the feedback counter values:
				for (int i = 0; i < 4; ++i) {
					for (int j = 0; j < 4; ++j) {
						ASIC_WilkCounter[i][j] = test_packet.GetWilkCounter(i,j);
						ASIC_SampRateCounter[i][j] = test_packet.GetSampRateCounter(i,j);
					}
				}
			}
		}
	} while (test_packet.packet_type != PACKET_TYPE_FOOTER && this_status != END_OF_FILE);

/*  //Diagnostic for checking for ADC values that didn't get set during the read
	//Check ADC values
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			for (int k = 0; k < 8; ++k) {
				for (int l = 0; l < 4; ++l) {
					for (int m = 0; m < 64; ++m) {

						if (ASIC_ADC[i][j][k][l][m] == 9999) {
							cout << "Unset ADC value in " << i << " " << j << " " << k << " " << l << endl;
						}
					}
				}
			}
		}
	}
*/

	if (this_status == SUCCESS) {
		if (!ID_is_known) {
			sprintf(SCROD_Revision_cstr,"%X",(test_packet.scrod_id >> 16 ) & 0xFFFF);
			SCROD_ID = test_packet.scrod_id & 0xFFFF;
			char temp[16];
			sprintf(temp,"%04X",SCROD_ID);
			sscanf(temp,"%hd",&SCROD_ID);
			ID_is_known = true;
		}
		EventTree->Fill();
	}
	if (this_status != SUCCESS) {
		return 0;
	} else {
		return 1;
	}

};

void EventData::IncrementErrorCounts(packet_read_status flags) {
	if (flags == GOOD_PACKET)  return;
	if (flags == BAD_HEADER)   N_errors[0]++;
	if (flags == BAD_SIZE)     N_errors[1]++;
	if (flags == BAD_DATE)     N_errors[2]++;
	if (flags == BAD_TYPE)     N_errors[3]++;
	if (flags == BAD_SCROD_ID) N_errors[4]++;
	if (flags == BAD_CHECKSUM) N_errors[5]++;
	if (flags == BAD_FOOTER)   N_errors[6]++;
}

