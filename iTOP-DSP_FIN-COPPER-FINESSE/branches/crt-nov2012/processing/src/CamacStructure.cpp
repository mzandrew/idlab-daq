#include "CamacStructure.h"
#include <iostream>
#include <iomanip>
#include <vector>

using namespace std;

CamacData::CamacData() {
	file_handle = NULL;
	ConfigTree = NULL;
	camac_data = NULL;
	camac_tree = NULL;
	camac_crate = NULL;
	N_crates = 0;
	this->SetupCrates();
}

CamacData::~CamacData() {
//I know we really should delete these things but it's causing
//trouble right now... I'm unclear on the right order, and 
//what ROOT will delete on its own.
/*
	if (file_handle) delete file_handle;
	if (ConfigTree) delete ConfigTree;
	for (int i = 0; i < N_crates; ++i) {
		if (camac_tree[i]) delete camac_tree;
		if (camac_crate[i]) delete camac_crate;
		for (int j = 0; j < N_SLOTS; ++j) {
			if (camac_data[i][j]) {
				delete[] camac_data[i][j];
			}
		}
		if (camac_data[i]) {
			delete[] camac_data[i];
		}
	}
	delete[] camac_tree;
	delete[] camac_crate;
	delete[] camac_data;
*/
}

void CamacData::SetupCrates() {
	N_crates = 1;
	camac_tree = new TTree*[N_crates];
	camac_crate = new CC_USB*[N_crates];
	camac_data = new unsigned int**[N_crates];
#ifdef CAMAC_SLAC_SCANNING
	//Create crates but don't try to open connections with them
	camac_crate[0] = new CC_USB("CC0163",false);
        camac_crate[0]->AddModule(new generic_CAMAC_module(camac_crate[0]->GetHandle(),21, 8,true)); //Lecroy 2228A, slot 21, 8 channels (11-bit), clearing
#endif
#ifdef CAMAC_SLAC_CRT
	//Create crates but don't try to open connections with them
	camac_crate[0] = new CC_USB("CC0132",false);
	camac_crate[1] = new CC_USB("CC0131",false);
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


	for (int i = 0; i < N_crates; ++i) {
		camac_data[i] = new unsigned int*[N_SLOTS];
		for (int j = 1; j <= N_SLOTS; ++j) {  //Slots range from 1-26!
			if (camac_crate[i]->GetModule(j)) {
				camac_data[i][j-1] = new unsigned int[camac_crate[i]->GetModule(j)->GetNChannels()]();
//				cout << "Initialized crate " << i << " slot " << j << " with " << camac_crate[i]->GetModule(j)->GetNChannels() << " channels at address " << camac_data[i][j-1] << endl;
			} else {
				camac_data[i][j-1] = NULL;
			}
		}
	}

/*
	for (int i = 0; i < N_crates; ++i) {
		for (int j = 0; j < N_SLOTS; ++j) {
			if (camac_data[i][j]) {
				for (int k = 0; k < camac_crate[i]->GetModule(j+1)->GetNChannels(); ++k) {
					cout << i << "\t" << j << "\t" << k << "\t" << &camac_data[i][j][k] << "\t" << camac_data[i][j][k] << endl;
				}
			}
		}
	}
*/

}

TFile* CamacData::OpenROOTFile(const char *root_filename) {
	TFile *file_handle = new TFile(root_filename,"RECREATE");
	//A simple one-entry-per-file tree for variables that are static
	ConfigTree = new TTree("ConfigTree","Configuration Data");
	ConfigTree->Branch("RawFilename"   , RawFilename_cstr     ,"RawFilename/C");
	ConfigTree->Branch("ExpNumber"     , &ExpNumber           ,"ExpNumber/i");
	ConfigTree->Branch("RunNumber"     , &RunNumber           ,"RunNumber/i");
	ConfigTree->Branch("SpillNumber"   , &SpillNumber         ,"SpillNumber/i");
	ConfigTree->Branch("StartTime"     , &StartTime           ,"StartTime/I");

	//Set a few configuration variables to default values
	RawFilename = "Uninitialized";
	ExpNumber = 0;
	RunNumber = 0;
	SpillNumber = 0;
	StartTime = 0;

	//A seperate tree for variables that get updated once per event
	for (int i = 0; i < N_crates; ++i) {
		char tree_name[1024];
		sprintf(tree_name,"camac_tree%d",i);
		camac_tree[i] = new TTree(tree_name,camac_crate[i]->GetSerialNumber().c_str());
		//Scan over all slots (CAMAC slots start numbering from 1!)
		for (int j = 1; j <= N_SLOTS; ++j) {
			if (camac_crate[i]->GetModule(j)) {
				char branch_name[1024];
				sprintf(branch_name,"slot%d",j);
				char branch_data[1024];
				sprintf(branch_data,"slot%d[%d]/i",j,camac_crate[i]->GetModule(j)->GetNChannels());
				camac_tree[i]->Branch(branch_name,camac_data[i][j-1],branch_data);
//				cout << "slot " << j << " starts at " << camac_data[i][j-1] << endl;
			}
		}
	}

	return file_handle;

};

void CamacData::WriteConfigTree(const char *input_filename) {
	string RawFilename_string = input_filename;
	int str_length = RawFilename_string.length();
	string ReducedFilename = RawFilename_string.substr(str_length-49,str_length);
	sprintf(RawFilename_cstr,"%s",ReducedFilename.c_str());
	
	string TimeString = ReducedFilename.substr(0,19);
	char time_string[36];
	strcpy(time_string,TimeString.c_str());

	string ExperimentInfo = ReducedFilename.substr(20, ReducedFilename.length() );
	int nreads = sscanf(ExperimentInfo.c_str(),"exp%2d.run%4d.spill%4d.camac",&ExpNumber,&RunNumber,&SpillNumber);
	if (nreads != 3) { 
		cout << "Trying to read alternate file name format..." << endl; 
		ExperimentInfo = ReducedFilename.substr(0,23);
		nreads = sscanf(ExperimentInfo.c_str(),"exp%2d.run%4d.spill%4d.camac",&ExpNumber,&RunNumber,&SpillNumber);
		cout << "tried to parse experiment info from: " << ExperimentInfo << endl;
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

	ConfigTree->Fill();

	cout << "Reading CAMAC data from file: " << ReducedFilename << endl;
	cout << "\texperiment    : " << ExpNumber << endl;
	cout << "\trun number    : " << RunNumber << endl;
	cout << "\tspill number  : " << SpillNumber << endl;
}

void CamacData::AutoSave() {
	for (int i = 0; i < N_crates; ++i) {
		camac_tree[i]->AutoSave("SaveSelf");
	}
	ConfigTree->AutoSave("SaveSelf");	
}

void CamacData::CloseROOTFile() {
//	this->AutoSave();
	gDirectory->Write();

	//I can't quite figure out what to do here to not cause a SEGV...
	//We can just leave it at this if we don't plan to try to open new 
	//files after we close the first.

//	camdata->Write("",TObject::kOverwrite);
//	ConfigTree->Write("",TObject::kOverwrite);
//	file_handle->Close();  //For some reason this often causes a SEGV?
//	camdata = NULL;
//	ConfigTree = NULL;
//	file_handle = NULL;
};

int CamacData::ReadEvent(ifstream &fin) {
	unsigned int long_word = 0;
	unsigned short int short_word = 0;
	unsigned short int words_this_event = 0;
	for (int i = 0; i < N_crates; ++i) {
		fin.read( (char *) &long_word, sizeof(unsigned int));
		fin.read( (char *) &short_word, sizeof (unsigned short int) );
//		cout << "crate: " << hex << long_word << dec << endl;
//		cout << "number of events: " << (short_word & MASK_HEADER_WORD_NUMBER_OF_EVENTS) << endl;
//		cout << "watchdog buffer?: " << bool(short_word & MASK_HEADER_WATCHDOG_BUFFER_BIT) << endl;
//		cout << "scaler buffer?  : " << bool(short_word & MASK_HEADER_SCALER_BUFFER_BIT) << endl;
		//TODO: should do something with all this header information...
		//One option would be to use the length (read in the following line) to read the entire
		//event into memory, then continue as usual.
		fin.read( (char *) &words_this_event, sizeof (unsigned short int) );
		for (int j = 1; j <= N_SLOTS; ++j) { //CAMAC slots start from 1... I'm getting tired of this.  =P
			if (camac_crate[i]->GetModule(j)) {
				for (int k = 0; k < camac_crate[i]->GetModule(j)->GetNChannels(); ++k) {
					camac_data[i][j-1][k] = 0;
				}
				unsigned short int slot_id;
				fin.read( (char *) &slot_id, sizeof(unsigned short int) );
				if (slot_id != (unsigned short int) j) {
					cout << "Error: expected slot (" << hex << j << ")";
					cout << " doesn't match data (" << slot_id << dec << ")!";
					cout << " Bad data, partial event, or maybe just the end of the file." << endl;
					while (fin) {
						unsigned short int temp_word;
						fin.read((char *) &temp_word, sizeof(unsigned short int));
					}
					return 0;
				}
				vector<unsigned short int> slot_data;
				bool keep_reading_this_slot = true;
				while (keep_reading_this_slot) {
					fin.read( (char *) &short_word, sizeof(unsigned short int));
					if (short_word == SLOT_END_MARKER) {
						//Grab the current pointer position
						int position = fin.tellg();
						//Check the next word
						unsigned short int next_word;
						fin.read( (char *) &next_word, sizeof(unsigned short int) );
						//Check what the next occupied module is
						CAMAC_module *next_module = camac_crate[i]->GetNextOccupiedModule(j);
						if (!next_module && next_word == CRATE_END_MARKER) {
							keep_reading_this_slot = false;
						} else if (next_word == (unsigned short int) next_module->GetSlot()) {
							keep_reading_this_slot = false;
						}
						//Return the pointer to the previous position
						fin.seekg(position);
					} else {
						slot_data.push_back(short_word);
					}
				}
				for (int k = 0; k < slot_data.size(); k += 2) {
					unsigned int full_word = 0;
					full_word = (slot_data[k+1] << 16) | (slot_data[k]);
					unsigned int Q = (full_word & MASK_Q_RESPONSE) >> 24;
					unsigned int X = (full_word & MASK_X_RESPONSE) >> 25;
					unsigned int data_24bit = full_word & MASK_DATA;
					unsigned int channel = k/2;
					//Interpret the data
					if (camac_crate[i]->GetModule(j)->SimpleDataFormat()) {
						camac_data[i][j-1][channel] = data_24bit;
					} else {
						camac_crate[i]->GetModule(j)->ReadDataWord(data_24bit,channel);
						//The 2277 ReadDataWord function returns a 0 data value if the hit phase is wrong
						//In these cases we ignore the hit
						if (data_24bit != 0) {
							camac_data[i][j-1][channel] = data_24bit;
						}
					}
				}
			}
		}
		unsigned short int footer[2];
		fin.read( (char *) footer, sizeof(unsigned short int)*2);
		if (!fin) {
			cout << "Filehandle had bad status!\n";
			return 0;
		}
		if (footer[0] != CRATE_END_MARKER || footer[1] != CRATE_END_MARKER) {
			cout << "Error: Expected footers but saw: " << endl; 
			cout << "\t0x" << hex << setw(4) << setfill('0') << footer[0];
			cout << "\t0x" << hex << setw(4) << setfill('0') << footer[1];
			cout << "Your data is probably being read incorrectly!" << endl;
		}
	}

	for (int i = 0; i < N_crates; ++i) {
		camac_tree[i]->Fill();
	}
	return 1;

};

