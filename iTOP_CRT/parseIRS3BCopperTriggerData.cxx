#include "packet_interface.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <TFile.h>
#include "TTree.h"
#include "TSystem.h"
#include "TROOT.h"
#include "TApplication.h"
using namespace std;

//define global constants
#define MAX_SEGMENTS_PER_EVENT 512
#define POINTS_PER_WAVEFORM    64
#define MEMORY_DEPTH           64
#define NCOLS                  4
#define NROWS                  4
#define NCHS                   8
#define NWORDS_EVENT_HEADER    11
#define NWORDS_WAVE_PACKET     42

void initializeRootTree();
void processBuffer(unsigned int *buffer_uint, int sizeInUint32);
void parseDataPacket(unsigned int *buffer_uint, int bufPos, int sizeInUint32);

//Set tree variables as global for quick implementation
TTree *tree;
UInt_t scrodId;
UInt_t winId;
int samples[POINTS_PER_WAVEFORM];

void parseIRS3BCopperTriggerData(){
	//define input file and parsing
	ifstream infile;
	string inputFileName = "pedestalScan_20130321_0300_DACsVbiasOff.dat";

	std::cout << " inputFileName " << inputFileName << std::endl;
	infile.open(inputFileName.c_str(), std::ifstream::in | std::ifstream::binary);
	if (infile.fail()) {
		std::cout << "Error opening input file, exiting" << std::endl;
		exit(-1);
	}

    	// get length of file:
    	infile.seekg (0, infile.end);
    	int size_in_bytes = infile.tellg();
    	infile.seekg (0, infile.beg);

    	char * buffer = new char [size_in_bytes];
	unsigned int *buffer_uint = (unsigned int *) buffer;
    	std::cout << "Reading " << size_in_bytes << " bytes... ";

    	// read data as a block:
    	infile.read (buffer,size_in_bytes);
    	if (infile)
      		std::cout << "all characters read successfully.";
    	else
      		std::cout << "error: only " << infile.gcount() << " could be read";
    	infile.close();

	//initialize tree to store trigger bit data
	initializeRootTree();

	//process file buffer
	processBuffer(buffer_uint,size_in_bytes/4);

	//define output file name, write out tree data
	std::string outputFileName = "output_parseIRS3BCopperTriggerData.root";
	std::cout << " outputFileName " << outputFileName << std::endl;
	TFile g( outputFileName.c_str() , "RECREATE");
	tree->Write();
	g.Close();
	return;
}

//initialize tree to store trigger bit data
void initializeRootTree(){
	tree = new TTree("T","IRS3B Waveform");
	tree->Branch("scrodId", &scrodId, "scrodId/i");		
	tree->Branch("winId", &winId, "winId/i");		
	tree->Branch("samples", &samples, "samples[64]/i");
	return;
}

//function loops through file buffers, extracts trigger bits from data packet and organizes by event
void processBuffer(unsigned int *buffer_uint, int sizeInUint32){

    	// loop through entire file
	for(int pos = 0 ; pos < sizeInUint32 ; pos++ ){
		parseDataPacket(buffer_uint,pos,sizeInUint32);
	}
		
    	delete[] buffer_uint;
	return;
}	

//function parses data packet and returns trigger bit, lots of hardcoded parameters here that will be removed in final implmentation
void parseDataPacket(unsigned int *buffer_uint, int bufPos, int sizeInUint32){
	//Detect header word
	if( buffer_uint[bufPos] != PACKET_HEADER )
		return;

	//Detect waveform word
	if( buffer_uint[bufPos+2] != PACKET_TYPE_WAVEFORM )
		return;

	unsigned int numSamples = buffer_uint[bufPos+8];
	//TEMPORARY DO NOT LEAVE - require 64 samples specifically in data packet, should be more flexible
	if(numSamples != 64 )
		return;

	//get packet header info
	scrodId = buffer_uint[bufPos+6];	
	winId = buffer_uint[bufPos+7];	

	//get samples from packet
	for(int i = 0 ; i < numSamples/2 ; i++){
		int word0 = buffer_uint[bufPos+9+i] & 0xFFF;
		int word1 = (buffer_uint[bufPos+9+i] >> 16) & 0xFFF;
		if( i*2 < 64 )
			samples[i*2] = buffer_uint[bufPos+9+i] & 0xFFF;
		if( i*2+1 < 64 )
			samples[i*2+1] = buffer_uint[bufPos+9+i] & 0xFFF;
	}

	//fill root tree, note tree variables set in parseDataPacket funciton
	tree->Fill();

	return;
}

//get specific bit from char
bool extractBit(char byte, int pos) {
	if( ((byte >> pos) & 0x01) == 1 )
		return true;
	else
		return false;
}
