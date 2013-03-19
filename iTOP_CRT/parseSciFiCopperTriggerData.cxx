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
const int numMB = 3;
const int numAsic = 10;
const int numChan = 15;
const int numSF = 2;
const int numXY = 2;
const int numFibre = 75;

//SciFi motherboard SCROD IDs -- temporary MAPPING HERE
const unsigned int MB0NUMCONST = 0x0e;
const unsigned int MB1NUMCONST = 0x44;
const unsigned int MB2NUMCONST = 0x43;

void processBuffer(char * buffer, int length, TTree *tree, bool scifiTriggers[numSF][numXY][numFibre]);
void parseDataPacket(char * buffer, int pos, int length, int &event,int &mbNum, bool trigBits[numMB][numAsic][numChan]);
bool extractBit(char byte, int pos);
void channelMappingSciFiEvent(bool trigBits[numMB][numAsic][numChan],bool scifiTriggers[numSF][numXY][numFibre]);

void parseSciFiCopperTriggerData(){
	//define input file and parsing
	ifstream infile;
	string inputFileName = "topcrt-dma-e000001r000000-f000.dat.inprog";

	std::cout << " inputFileName " << inputFileName << std::endl;
	infile.open(inputFileName.c_str(), std::ifstream::in | std::ifstream::binary);
	if (infile.fail()) {
		std::cout << "Error opening input file, exiting" << std::endl;
		exit(-1);
	}

    	// get length of file:
    	infile.seekg (0, infile.end);
    	int length = infile.tellg();
    	infile.seekg (0, infile.beg);

    	char * buffer = new char [length];

    	std::cout << "Reading " << length << " characters... ";
    	// read data as a block:
    	infile.read (buffer,length);
    	if (infile)
      		std::cout << "all characters read successfully.";
    	else
      		std::cout << "error: only " << infile.gcount() << " could be read";
    	infile.close();

	//define tree to store trigger bit data
	TTree *tree = new TTree("T","SciFi Trigger Bit Tree");
	bool scifiTriggers[numSF][numXY][numFibre];
	tree->Branch("scifiTriggers", &scifiTriggers, "scifiTriggers[2][2][75]/O");

	//process file buffer
	processBuffer(buffer,length, tree, scifiTriggers);

	//define output file name
	std::string outputFileName = "output_parseSciFiCopperTriggerData.root";
	std::cout << " outputFileName " << outputFileName << std::endl;

	TFile g( outputFileName.c_str() , "RECREATE");
	tree->Write();
	g.Close();
	return;
}

//function loops through file buffers, extracts trigger bits from data packet and organizes by event
void processBuffer(char * buffer, int length, TTree *tree, bool scifiTriggers[numSF][numXY][numFibre]){

	//define trigger bit fields
	bool trigBits[numMB][numAsic][numChan];
	memset(trigBits,0,sizeof(trigBits[0][0][0])*numMB*numAsic*numChan );
	memset(scifiTriggers,0,sizeof(scifiTriggers[0][0][0])*numSF*numXY*numFibre );

	//check for packets from all three motherboards
	bool mb0Packet = 0;
	bool mb1Packet = 0;
	bool mb2Packet = 0;

    	// loop through entire file
	for(int pos = 0 ; pos < length/4 ; pos++ ){
		unsigned char* w = new unsigned char[4];
		//read in 4 bytes at a time, must be uint32 method
		for(int j = 0 ; j < 4 ; j++ )
			w[3-j] = buffer[4*pos+j];

		//try to find start of data packet, 0xbelle2 32-bit token word
		if( !(w[0] == 0x00 && w[1] == 0xbe && w[2] == 0x11 && w[3] == 0xe2 ) )
			continue;

		int event = -1;
		int mbNum = -1;
		parseDataPacket(buffer,pos,length,event,mbNum,trigBits);

		if( mbNum == 0)
			mb0Packet = 1;
		if( mbNum == 1)
			mb1Packet = 1;
		if( mbNum == 2)
			mb2Packet = 1;

		//map trigger bits to fibre planes
		channelMappingSciFiEvent(trigBits,scifiTriggers);

		//don't have event packet headers currently, so have to infer when full event readout by presence of all SCROD data packets
		if(mb0Packet && mb1Packet && mb2Packet){
			tree->Fill();
			mb0Packet = 0;
			mb1Packet = 0;
			mb2Packet = 0;
			memset(trigBits,0,sizeof(trigBits[0][0][0])*numMB*numAsic*numChan );
			memset(scifiTriggers,0,sizeof(scifiTriggers[0][0][0])*numSF*numXY*numFibre );
		}
	}

    	delete[] buffer;
	return;
}	

//function parses data packet and returns trigger bit, lots of hardcoded parameters here
void parseDataPacket(char * buffer, int bufPos, int length, int &event,int &mbNum, bool trigBits[numMB][numAsic][numChan]){
	//check if next line exceeds packet length
	if( bufPos + 8 >= length )
		return;

	//test that packet has right number of words - line 1 byte 0
	if( buffer[4*bufPos+4] != 0x13 )
		return;

	//get motherboard number - line 3 byte 0
	//determine which SciFo motherboard
	if((unsigned int)buffer[4*bufPos+12] == MB0NUMCONST )
		mbNum = 0;
	if((unsigned int)buffer[4*bufPos+12] == MB1NUMCONST )
		mbNum = 1;
	if((unsigned int)buffer[4*bufPos+12] == MB2NUMCONST )
		mbNum = 2;
	if( mbNum < 0 || mbNum > 2 )
		return;

	//get event number etc here 

	//get bits from word for ASIC 3,4,7,8 (lines 13,14,17,18, byte 0)
	for( int i = 0 ; i < numAsic ; i++ ){
		char asicBits = buffer[4*bufPos+4*(10+i)]; //get line corresponding to each ASIC
		for( int j = 0 ; j < numChan ; j++ )
			trigBits[mbNum][i][j] = extractBit(asicBits,j/4);
	}

	return;
}

//get specific bit from char
bool extractBit(char byte, int pos) {
	if( ((byte >> pos) & 0x01) == 1 )
		return true;
	else
		return false;
}

//map between ASIC channel and fibre number
void channelMappingSciFiEvent(bool trigBits[numMB][numAsic][numChan], bool scifiTriggers[numSF][numXY][numFibre]){
	//mapping between ASICs and SciFi modules/preamp carriers defined here - should be moved somewhere more accessible
	//scifi 2 - U2 = ch 15-29 = xplane = MB0 - ASIC3
	//scifi 2 - U3 = ch 30-44 = xplane = MB0 - ASIC4
	//scifi 2 - U4 = ch 45-59 = xplane = MB0 - ASIC7
	//scifi 2 - U7 = ch 15-29 = yplane = MB0 - ASIC8

	//scifi 2 - U8 = ch 30-44 = yplane = MB1 - ASIC3
	//scifi 2 - U9 = ch 45-59 = yplane = MB1 - ASIC4
	//scifi 1 - U2 = ch 15-29 = xplane = MB1 - ASIC7
	//scifi 1 - U3 = ch 30-44 = xplane = MB1 - ASIC8

	//scifi 1 - U4 = ch 45-59 = xplane = MB2 - ASIC3
	//scifi 1 - U7 = ch 15-29 = yplane = MB2 - ASIC4
	//scifi 1 - U8 = ch 30-44 = yplane = MB2 - ASIC7
	//scifi 1 - U9 = ch 45-59 = yplane = MB2 - ASIC8

	//assign ASIC trigger bits to fibre plan channels (ASIC-MPPC mapping)
	//also encode in fibre plane channel arrays whether hits are ambigous or not
	for(int i = 0 ; i < numChan ; i++){
		if( trigBits[0][3][i] )
			scifiTriggers[1][0][15+i] = 1;
		if( trigBits[0][4][i] )
			scifiTriggers[1][0][30+i] = 1;
		if( trigBits[0][7][i] )
			scifiTriggers[1][0][45+i] = 1;
		if( trigBits[0][8][i] )
			scifiTriggers[1][1][15+i] = 1;

		if( trigBits[1][3][i] )
			scifiTriggers[1][1][30+i] = 1;
		if( trigBits[1][4][i] )
			scifiTriggers[1][1][45+i] = 1;
		if( trigBits[1][7][i] )
			scifiTriggers[0][0][15+i] = 1;
		if( trigBits[1][8][i] )
			scifiTriggers[0][0][30+i] = 1;

		if( trigBits[2][3][i] )
			scifiTriggers[0][0][45+i] = 1;
		if( trigBits[2][4][i] )
			scifiTriggers[0][1][15+i] = 1;
		if( trigBits[2][7][i] )
			scifiTriggers[0][1][30+i] = 1;
		if( trigBits[2][8][i] )
			scifiTriggers[0][1][45+i] = 1;
	}

	return;
}
