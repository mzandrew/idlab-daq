#include "CamacStructure.h"
#include <iostream>

using namespace std;

CamacData::CamacData() {
	file_handle = NULL;
	ConfigTree = NULL;
	camdata = NULL;
}

CamacData::~CamacData() {
	if (file_handle) delete file_handle;
	if (ConfigTree) delete ConfigTree;
	if (camdata) delete camdata;
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
	camdata = new TTree("camdata","Event Data");
	camdata->Branch("event",&camac_data[1],"event/i");  

	camdata->Branch("tg1",&camac_data[2],"tg1/i");  
	camdata->Branch("tg2",&camac_data[3],"tg2/i");  
	camdata->Branch("tc1",&camac_data[4],"tc1/i");  
	camdata->Branch("tc2",&camac_data[5],"tc2/i");  
	camdata->Branch("tm1",&camac_data[6],"tm1/i");  
	camdata->Branch("tm2",&camac_data[7],"tm2/i");  
	camdata->Branch("tdc06",&camac_data[8],"tdc06/i");  
	camdata->Branch("tdc07",&camac_data[9],"tdc07/i");  

	camdata->Branch("tm3_1",&camac_data[10],"tm3_1/i");  
	camdata->Branch("tm3_2",&camac_data[11],"tm3_2/i");  
	camdata->Branch("tm3_3",&camac_data[12],"tm3_3/i");  
	camdata->Branch("tm3_4",&camac_data[13],"tm3_4/i");  
	camdata->Branch("tdc14",&camac_data[14],"tdc14/i");  
	camdata->Branch("v1",&camac_data[15],"v1/i");  
	camdata->Branch("v2",&camac_data[16],"v2/i");  
	camdata->Branch("tdc17",&camac_data[17],"tdc17/i");  

	camdata->Branch("ftsw",&camac_data[18],"ftsw/i");  
	camdata->Branch("tdc19",&camac_data[19],"tdc19/i");  
	camdata->Branch("tdc20",&camac_data[20],"tdc20/i");  
	camdata->Branch("tdc21",&camac_data[21],"tdc21/i");  
	camdata->Branch("tdc22",&camac_data[22],"tdc22/i");  
	camdata->Branch("tdc23",&camac_data[23],"tdc23/i");  
	camdata->Branch("tdc24",&camac_data[24],"tdc24/i");  
	camdata->Branch("tdc25",&camac_data[25],"tdc25/i");  
	
	camdata->Branch("qtg1",&camac_data[26],"qtg1/i");  
	camdata->Branch("qtg2",&camac_data[27],"qtg2/i");  
	camdata->Branch("qtc1",&camac_data[28],"qtc1/i");  
	camdata->Branch("qtc2",&camac_data[29],"qtc2/i");  
	camdata->Branch("qtm1",&camac_data[30],"qtm1/i");  
	camdata->Branch("adc005",&camac_data[31],"adc005/i");  
	camdata->Branch("qtm2",&camac_data[32],"qtm2/i");  
	camdata->Branch("qcp",&camac_data[33],"qcp/i");  
	camdata->Branch("qv1",&camac_data[34],"qv1/i");  
	camdata->Branch("qv2",&camac_data[35],"qv2/i");  
	camdata->Branch("adc010",&camac_data[36],"adc010/i");  
	camdata->Branch("adc011",&camac_data[37],"adc011/i");  
 
	camdata->Branch("qtm3_1",&camac_data[38],"qtm3_1/i");  
	camdata->Branch("qtm3_2",&camac_data[39],"qtm3_2/i");  
	camdata->Branch("qtm3_3",&camac_data[40],"qtm3_3/i");  
	camdata->Branch("qtm3_4",&camac_data[41],"qtm3_4/i");  
	camdata->Branch("adc104",&camac_data[42],"adc104/i");  
	camdata->Branch("adc105",&camac_data[43],"adc105/i");  
	camdata->Branch("adc106",&camac_data[44],"adc106/i");  
	camdata->Branch("adc107",&camac_data[45],"adc107/i");  
	camdata->Branch("adc108",&camac_data[46],"adc108/i");  
	camdata->Branch("adc109",&camac_data[47],"adc109/i");  
	camdata->Branch("adc110",&camac_data[48],"adc110/i");  
	camdata->Branch("adc111",&camac_data[49],"adc111/i");  
	
	camdata->Branch("stg1",&camac_data[50],"stg1/i");
	camdata->Branch("stg2",&camac_data[51],"stg2/i");
	camdata->Branch("stc1",&camac_data[52],"stc1/i");
	camdata->Branch("stc2",&camac_data[53],"stc2/i");
	camdata->Branch("stm1",&camac_data[54],"stm1/i");
	camdata->Branch("stm2",&camac_data[55],"stm2/i");
	camdata->Branch("coin1",&camac_data[56],"coin1/i");
	camdata->Branch("scl07",&camac_data[57],"scl07/i");
	camdata->Branch("coin3",&camac_data[58],"coin3/i");
	camdata->Branch("scl09",&camac_data[59],"scl09/i");
	camdata->Branch("scl10",&camac_data[60],"scl10/i");
	camdata->Branch("att1",&camac_data[61],"att1/i");


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
		ExperimentInfo = ReducedFilename.substr(0,21);
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
	camdata->AutoSave("SaveSelf");
	ConfigTree->AutoSave("SaveSelf");	
}

void CamacData::CloseROOTFile() {
	this->AutoSave();
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
	for (int i=0; i<WORDS_IN_CAMAC; i++) {
		fin.read( ( char * ) &camac_data[i], sizeof( unsigned int ) );
		if (!fin) {
			return 0;
		}
	} 
	camdata->Fill();
	return 1;
};

