#include "EventStructure.h"
#include "TFile.h"
#include "TTree.h"

#include <fstream>
#include <iostream>

using namespace std;

void ConvertDST1ToDST2(TFile *DST1, ifstream &fped, char *PedestalFilename, TFile *outDST2);

int main(int argc, char *argv[]) {
	if (argc != 4) {
		cout << "Syntax: ConvertDST1ToDST2 [input DST1 data (ROOT)] [pedestal file (ASCII)] [output DST2 file (ROOT)]" << endl;
		return 1;
	}

	string str_input_filename  = argv[1];
	string str_ped_filename    = argv[2];
	string str_output_filename = argv[3];

	TFile *inDST1 = new TFile(str_input_filename.c_str(),"READ");
	if (inDST1->IsZombie()) {
		cout << "Couldn't open input file: " << str_input_filename << endl;
		return 1;
	}
	
	ifstream fped(str_ped_filename.c_str());
	if (!fped) {
		cout << "Couldn't open pedestal file: " << str_ped_filename << endl;
		return 1;
	}
	char pedestal_filename[1024];
//	char *pedestal_filename = (char *) str_ped_filename.c_str();
	sprintf(pedestal_filename,"%s",str_ped_filename.c_str());

	TFile *outDST2 = new TFile(str_output_filename.c_str(),"RECREATE");
	if (outDST2->IsZombie()) {
		cout << "Couldn't open DST2 output file: " << str_output_filename << endl;
		return 1;
	}

	cout << "About to convert..." << endl;
	cout.flush();
	ConvertDST1ToDST2(inDST1, fped, pedestal_filename, outDST2);

	inDST1->Close();
	outDST2->Close();
	fped.close();
	return 0;
}

void ConvertDST1ToDST2(TFile *DST1, ifstream &fped, char *PedestalFilename, TFile *outDST2) {
	cout << "Converting..." << endl;
	cout.flush();
	//Set up branch addresses for DST1 file
	//First for the configuration tree
	TTree *ConfigTree = (TTree *) DST1->Get("ConfigTree");
	char RawFilename[1024], SCROD_Revision[4];
	unsigned short int FiberChannel, SCROD_ID, ASIC_ID[4][4];
	unsigned int ExpNumber, RunNumber, SpillNumber;
	int StartTime;
	ConfigTree->SetBranchAddress("RawFilename"   , RawFilename);
	ConfigTree->SetBranchAddress("FiberChannel"  , &FiberChannel);
	ConfigTree->SetBranchAddress("SCROD_Revision", SCROD_Revision);
	ConfigTree->SetBranchAddress("SCROD_ID"      , &SCROD_ID);
	ConfigTree->SetBranchAddress("ASIC_ID"       , ASIC_ID);
	ConfigTree->SetBranchAddress("ExpNumber"     , &ExpNumber);
	ConfigTree->SetBranchAddress("RunNumber"     , &RunNumber);
	ConfigTree->SetBranchAddress("SpillNumber"   , &SpillNumber);
	ConfigTree->SetBranchAddress("StartTime"     , &StartTime);
	ConfigTree->GetEntry(0);


	//We should know the ASICs that we need now, open the pedestal file and read it
	//float pedestals[4][4][8][512][64] = {{{{{0}}}}};
	float *****pedestals;
	pedestals = new float****[4];
	for (int col = 0; col < 4; ++col) {
		pedestals[col] = new float***[4];
		for (int row = 0; row < 4; ++row) {
			pedestals[col][row] = new float**[8];
			for (int ch = 0; ch < 8; ++ch) {
				pedestals[col][row][ch] = new float*[512];
				for (int win = 0; win < 512; ++win) {
					pedestals[col][row][ch][win] = new float[64];
					for (int sample = 0; sample < 64; ++sample) {
						pedestals[col][row][ch][win][sample] = 0;
					}
				}
			}
		}
	}

	//parantheses just to keep dummy variables for reading out of main scope
	{
		unsigned short int this_ASIC;
		int ch, window, sample;
		float value;
		while ( fped >> this_ASIC >> ch >> window >> sample >> value) {
			for (int i = 0; i < 4; ++i) {
				for (int j = 0; j < 4; ++j) {
					if (this_ASIC == ASIC_ID[i][j]) {
						pedestals[i][j][ch][window][sample] = value;
					}
				}
			}
		}
	}

	//Now setup the event tree
	TTree *EventTree = (TTree *) DST1->Get("EventTree");
	unsigned int EventNumber;
	unsigned short int Temperature,ASIC_TRGbias[4][4], ASIC_TRGthresh[4][4][8], ASIC_Wbias[4][4], ASIC_VadjP[4][4], ASIC_VadjN[4][4], ASIC_Vbias[4][4], ASIC_SBbias[4][4], ASIC_Isel[4][4], ASIC_CMPbias[4][4], ASIC_PUbias[4][4], ASIC_Vdly[4][4], ASIC_TRGthreshref[4][4], ASIC_WilkCounter[4][4], ASIC_TrigWidthCounter[4][4], ASIC_ADC[4][4][8][4][64], ASIC_OriginWindow[4][4][8][4], ASIC_Scaler[4][4][8];
	short int ASIC_SampRateCounter[4][4];
	bool ASIC_TriggerStream[4][4][8][16];
	EventTree->SetBranchAddress("EventNumber"          ,&EventNumber);
	EventTree->SetBranchAddress("Temperature"          ,&Temperature);
	EventTree->SetBranchAddress("ASIC_TRGbias"         ,ASIC_TRGbias);
	EventTree->SetBranchAddress("ASIC_TRGthresh"       ,ASIC_TRGthresh);
	EventTree->SetBranchAddress("ASIC_Wbias"           ,ASIC_Wbias);
	EventTree->SetBranchAddress("ASIC_VadjP"           ,ASIC_VadjP);
	EventTree->SetBranchAddress("ASIC_VadjN"           ,ASIC_VadjN);
	EventTree->SetBranchAddress("ASIC_Vbias"           ,ASIC_Vbias);
	EventTree->SetBranchAddress("ASIC_SBbias"          ,ASIC_SBbias);
	EventTree->SetBranchAddress("ASIC_Isel"            ,ASIC_Isel);
	EventTree->SetBranchAddress("ASIC_CMPbias"         ,ASIC_CMPbias);
	EventTree->SetBranchAddress("ASIC_PUbias"          ,ASIC_PUbias);
	EventTree->SetBranchAddress("ASIC_Vdly"            ,ASIC_Vdly);
	EventTree->SetBranchAddress("ASIC_TRGthreshref"    ,ASIC_TRGthreshref);
	EventTree->SetBranchAddress("ASIC_WilkCounter"     ,ASIC_WilkCounter);
	EventTree->SetBranchAddress("ASIC_SampRateCounter" ,ASIC_SampRateCounter);
	EventTree->SetBranchAddress("ASIC_TrigWidthCounter",ASIC_TrigWidthCounter);
	EventTree->SetBranchAddress("ASIC_ADC"             ,ASIC_ADC);
	EventTree->SetBranchAddress("ASIC_OriginWindow"    ,ASIC_OriginWindow);
	EventTree->SetBranchAddress("ASIC_TriggerStream"   ,ASIC_TriggerStream);
	EventTree->SetBranchAddress("ASIC_Scaler"          ,ASIC_Scaler);

	//Create the branches in the new tree:
	outDST2->cd();
	TTree *outConfigTree = new TTree("ConfigTree","Configuration Data");
	float float_ASIC_ADC[4][4][8][4][64];
	//First create the configuration tree branches
	outConfigTree->Branch("RawFilename"     , RawFilename     ,"RawFilename/C");
	outConfigTree->Branch("PedestalFilename", PedestalFilename,"PedestalFilename/C");
	outConfigTree->Branch("FiberChannel"    , &FiberChannel   ,"FiberChannel/s");
	outConfigTree->Branch("SCROD_Revision"  , SCROD_Revision  ,"SCROD_Revision/C");
	outConfigTree->Branch("SCROD_ID"        , &SCROD_ID       ,"SCROD_ID/s");
	outConfigTree->Branch("ASIC_ID"         , ASIC_ID         ,"ASIC_ID[4][4]/s");
	outConfigTree->Branch("ExpNumber"       , &ExpNumber      ,"ExpNumber/i");
	outConfigTree->Branch("RunNumber"       , &RunNumber      ,"RunNumber/i");
	outConfigTree->Branch("SpillNumber"     , &SpillNumber    ,"SpillNumber/i");
	outConfigTree->Branch("StartTime"       , &StartTime      ,"StartTime/I");

	TTree *outEventTree = new TTree("EventTree","Event Data");
	outEventTree->Branch("EventNumber"          ,&EventNumber,"EventNumber/i");
	outEventTree->Branch("Temperature"          ,&Temperature,"Temperature/s");
	outEventTree->Branch("ASIC_TRGbias"         ,ASIC_TRGbias,"ASIC_TRGbias[4][4]/s");
	outEventTree->Branch("ASIC_TRGthresh"       ,ASIC_TRGthresh,"ASIC_TRGthresh[4][4][8]/s");
	outEventTree->Branch("ASIC_Wbias"           ,ASIC_Wbias,"ASIC_Wbias[4][4]/s");
	outEventTree->Branch("ASIC_VadjP"           ,ASIC_VadjP,"ASIC_VadjP[4][4]/s");
	outEventTree->Branch("ASIC_VadjN"           ,ASIC_VadjN,"ASIC_VadjN[4][4]/s");
	outEventTree->Branch("ASIC_Vbias"           ,ASIC_Vbias,"ASIC_Vbias[4][4]/s");
	outEventTree->Branch("ASIC_SBbias"          ,ASIC_SBbias,"ASIC_SBbias[4][4]/s");
	outEventTree->Branch("ASIC_Isel"            ,ASIC_Isel,"ASIC_Isel[4][4]/s");
	outEventTree->Branch("ASIC_CMPbias"         ,ASIC_CMPbias,"ASIC_CMPbias[4][4]/s");
	outEventTree->Branch("ASIC_PUbias"          ,ASIC_PUbias,"ASIC_PUbias[4][4]/s");
	outEventTree->Branch("ASIC_Vdly"            ,ASIC_Vdly,"ASIC_Vdly[4][4]/s");
	outEventTree->Branch("ASIC_TRGthreshref"    ,ASIC_TRGthreshref,"ASIC_TRGthreshref[4][4]/s");
	outEventTree->Branch("ASIC_WilkCounter"     ,ASIC_WilkCounter,"ASIC_WilkCounter[4][4]/s");
	outEventTree->Branch("ASIC_SampRateCounter" ,ASIC_SampRateCounter,"ASIC_SampRateCounter[4][4]/S");
	outEventTree->Branch("ASIC_TrigWidthCounter",ASIC_TrigWidthCounter,"ASIC_TrigWidthCounter[4][4]/s");
	outEventTree->Branch("ASIC_ADC"             ,float_ASIC_ADC,"ASIC_ADC[4][4][8][4][64]/F");
	outEventTree->Branch("ASIC_OriginWindow"    ,ASIC_OriginWindow,"ASIC_OriginWindow[4][4][8][4]/s");
	outEventTree->Branch("ASIC_TriggerStream"   ,ASIC_TriggerStream,"ASIC_TriggerStream[4][4][8][16]/O");
	outEventTree->Branch("ASIC_Scaler"          ,ASIC_Scaler,"ASIC_Scaler[4][4][8]/s");	

	//Fill trees now
	ConfigTree->GetEntry(0);
	outDST2->cd();
	outConfigTree->Fill();
	int nentries = EventTree->GetEntries();
	for (int i = 0; i < nentries; ++i) {
		EventTree->GetEntry(i);
		//Apply pedestals
		for (int col = 0; col < 4; ++col) {
			for (int row = 0; row < 4; ++row) {
				for (int ch = 0; ch < 8; ++ch) {
					for (int win = 0; win < 4; ++win) {
						int window = ASIC_OriginWindow[col][row][ch][win];
						for (int sample = 0; sample < 64; ++sample) {
							float_ASIC_ADC[col][row][ch][win][sample] = (float) (ASIC_ADC[col][row][ch][win][sample]) - pedestals[col][row][ch][window][sample];
						}
					}
				}
			}
		}
		//
		outDST2->cd();
		outEventTree->Fill();
	}

	outConfigTree->AutoSave();
	outEventTree->AutoSave();


	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			for (int ch = 0; ch < 8; ++ch) {
				for (int win = 0; win < 4; ++win) {
					delete [] pedestals[col][row][ch][win];
				}
				delete [] pedestals[col][row][ch];
			}
			delete [] pedestals[col][row];
		}
		delete [] pedestals[col];
	}
	delete [] pedestals;

}
