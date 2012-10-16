#ifndef CAMACSTRUCTURE__H
#define CAMACSTRUCTURE__H

#define WORDS_IN_CAMAC 118
#define EVENT_HEADER                      (0x12345678)
//Bit masks for the CC USB integer mode readout
#define MASK_HEADER_WORD_NUMBER_OF_EVENTS (0x000003FF)
#define MASK_HEADER_WATCHDOG_BUFFER_BIT   (0x00008000)
#define MASK_HEADER_SCALER_BUFFER_BIT     (0x00004000)
#define MASK_Q_RESPONSE                   (0x02000000)
#define MASK_X_RESPONSE                   (0x01000000)
#define MASK_DATA                         (0x00FFFFFF)
#define SLOT_END_MARKER                   (0xDDDD)
#define CRATE_END_MARKER                  (0xFFFF)

#include "TFile.h"
#include "TTree.h"
#include "CAMAC.h"
#include <fstream>

class CamacData {
public:
	CamacData();
	~CamacData();
	void SetupCrates(); //Modules are set up here using the CC_USB class.
	                    //This could/should(?) be changed to read a config file.
	TFile* OpenROOTFile(const char *root_filename);
	void WriteConfigTree(const char * input_filename);
	void AutoSave();
	void CloseROOTFile();
	int ReadEvent(ifstream &fin);

//I changed this to public because I hate having to write accessors.
//Also, I don't expect anyone else to try to integrate this into a larger project, so eff it. -KN
public:
	TFile *file_handle;
	TTree *ConfigTree;
	TTree **camac_tree;
	CC_USB **camac_crate;
	unsigned int ***camac_data;

	int N_crates;
	std::string RawFilename;                         
	//Variables for the simple static tree
	char RawFilename_cstr[1024];                     //
	unsigned int ExpNumber;                          //
	unsigned int RunNumber;                          //
	unsigned int SpillNumber;                        //
	int StartTime;                                   //
};
#else
#endif
