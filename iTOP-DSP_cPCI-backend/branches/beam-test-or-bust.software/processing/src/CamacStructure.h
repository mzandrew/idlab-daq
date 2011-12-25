#ifndef CAMACSTRUCTURE__H
#define CAMACSTRUCTURE__H

#define WORDS_IN_CAMAC 118
#define EVENT_HEADER             (0x12345678)

#include "TFile.h"
#include "TTree.h"

#include <fstream>

class CamacData {
public:
	CamacData();
	~CamacData();
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
	TTree *camdata;  //Name chosen to match Nagoya code

	std::string RawFilename;                         
	//Variables for the simple static tree
	char RawFilename_cstr[1024];                     //
	unsigned int ExpNumber;                          //
	unsigned int RunNumber;                          //
	unsigned int SpillNumber;                        //
	int StartTime;                                   //
	//Variables for the event tree                   
	unsigned int camac_data[WORDS_IN_CAMAC];
};
#else
#endif
