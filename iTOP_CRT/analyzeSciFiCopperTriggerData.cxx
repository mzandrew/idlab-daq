#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <math.h>
#include <TH1F.h> 
#include <TH2F.h> 
#include <TF1.h>
#include <TFile.h>
#include <TMath.h> 
#include <TProfile.h>
#include <TGraph.h>
#include <TMultiGraph.h>
#include <TGraphErrors.h>
#include <TGraphAsymmErrors.h>
#include <THStack.h>
#include "TLorentzVector.h"
#include "TVector3.h"
#include "TTree.h"
#include "TChain.h"
#include "TClonesArray.h"
#include "TCanvas.h"
#include "THStack.h"
#include "TLegend.h"
#include "TStyle.h"
#include "TColor.h"
#include "TSystem.h"
#include "TROOT.h"
#include "TApplication.h"
#include "TEllipse.h"
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

void initializeHistograms();
void printTriggerBits(bool scifiTriggers[numSF][numXY][numFibre]);
void processTree(TTree *tree);
void drawSciFiEvent(bool scifiTriggers[numSF][numXY][numFibre]);

//canvas
TCanvas *c0;

//histograms
//histograms go here

void analyzeSciFiCopperTriggerData(){
	//define input file
	TFile *g;
	g = new TFile("output_parseSciFiCopperTriggerData.root","READ"); //test mode
	if (g->IsZombie()) {
		std::cout << "Error opening input file" << std::endl;
		exit(-1);
	}

	//define canvas
	c0 = new TCanvas("c0","",0,0,800,800);

	//load tree and assign variables
        TTree *tree = (TTree*)g->Get("T");

	//initialize histograms used in analysis
	initializeHistograms();

	//process tree
	processTree(tree);

	//define output file name
	std::string outputFileName = "output_analyzeSciFiCopperTriggerData.root";
	std::cout << " outputFileName " << outputFileName << std::endl;

	TFile f( outputFileName.c_str() , "RECREATE");
	//write output here
	f.Close();
	return;
}

void initializeHistograms(){
	//initialize histograms here
}

void processTree(TTree *tree){
	//define trigger bit array
	bool scifiTriggers[numSF][numXY][numFibre];
	memset(scifiTriggers,0,sizeof(scifiTriggers[0][0][0])*numSF*numXY*numFibre );

	//define tree variables
	TBranch *branch = tree->GetBranch("scifiTriggers");
  	branch->SetAddress(scifiTriggers);

	//loop through tree, plot each waveform in graph
	for (int i = 0; i < tree->GetEntries(); i++){
		//std::cout << "event " << i << std::endl;
		tree->GetEvent(i);
		
		//print trigger bits to terminal
		printTriggerBits(scifiTriggers);
		//draw event
		drawSciFiEvent(scifiTriggers);
	}

	return;
}

void printTriggerBits(bool scifiTriggers[numSF][numXY][numFibre]){
	for(int m = 0 ; m < numSF ; m++){
		for(int i = 0 ; i < numXY ; i++ ){
			for(int j = 0 ; j < numFibre ; j++ )
				std::cout << " " << scifiTriggers[m][i][j];
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}
	return;
}

//draw the trigger hits in an event display
void drawSciFiEvent(bool scifiTriggers[numSF][numXY][numFibre]){
	c0->Clear();

	//TBox(lower x,lower y,upper x,upper y); //co-ordinates are fractions of canvas area
	double xmin = 0.05;
	double xmax = 0.95;

	//note: in test SciFi module #2 is on top, xplane is above y-plane
	double height = 0.16;

	double sciFi_2_xbox_ymin = 1.0-0.16;
	double sciFi_2_xbox_ymax = 1.0;
	TBox *sciFi_2_xbox = new TBox(xmin,sciFi_2_xbox_ymin,xmax,sciFi_2_xbox_ymax);
   	sciFi_2_xbox->SetFillColor(19);
   	sciFi_2_xbox->Draw();

	double sciFi_2_ybox_ymin = 0.8-0.16;
	double sciFi_2_ybox_ymax = 0.8;
	TBox *sciFi_2_ybox = new TBox(xmin,sciFi_2_ybox_ymin,xmax,sciFi_2_ybox_ymax);
   	sciFi_2_ybox->SetFillColor(19);
   	sciFi_2_ybox->Draw();

	double sciFi_1_xbox_ymin = 0.4-0.16;
	double sciFi_1_xbox_ymax = 0.4;
	TBox *sciFi_1_xbox = new TBox(xmin,sciFi_1_xbox_ymin,xmax,sciFi_1_xbox_ymax);
   	sciFi_1_xbox->SetFillColor(19);
   	sciFi_1_xbox->Draw();

	double sciFi_1_ybox_ymin = 0.2-0.16;
	double sciFi_1_ybox_ymax = 0.2;
	TBox *sciFi_1_ybox = new TBox(xmin,sciFi_1_ybox_ymin,xmax,sciFi_1_ybox_ymax);
   	sciFi_1_ybox->SetFillColor(19);
   	sciFi_1_ybox->Draw();
	
	//draw staggered rows of 75 circles to represent fibres
	//SciFi #2 x plane
	TEllipse *sciFi_2_xplane[75];
	for( int i = 0 ; i < 75 ; i++ ){
		double xstep = (xmax-xmin)/76.;
		double xpos = xmax - xstep*i - xstep;
		double ypos = -1;
		double width = 0.008;
		if( i % 2 == 1 )
			ypos = sciFi_2_xbox_ymin+height/4.;
		else
			ypos = sciFi_2_xbox_ymax-height/4.;

 		sciFi_2_xplane[i] = new TEllipse(xpos,ypos,width,width);
		sciFi_2_xplane[i]->SetFillColor(0);
		if( scifiTriggers[1][0][i] == 1 )
			sciFi_2_xplane[i]->SetFillColor(2);
		sciFi_2_xplane[i]->Draw();
	}

	//SciFi #2 y plane
	TEllipse *sciFi_2_yplane[75];
	for( int i = 0 ; i < 75 ; i++ ){
		double xstep = (xmax-xmin)/76.;
		double xpos = xmax - xstep*i - xstep;
		double ypos = -1;
		double width = 0.008;
		if( i % 2 == 1 )
			ypos = sciFi_2_ybox_ymin+height/4.;
		else
			ypos = sciFi_2_ybox_ymax-height/4.;

 		sciFi_2_yplane[i] = new TEllipse(xpos,ypos,width,width);
		sciFi_2_yplane[i]->SetFillColor(0);
		if( scifiTriggers[1][1][i] == 1 )
			sciFi_2_yplane[i]->SetFillColor(2);
		sciFi_2_yplane[i]->Draw();
	}

	//SciFi #1 x plane
	TEllipse *sciFi_1_xplane[75];
	for( int i = 0 ; i < 75 ; i++ ){
		double xstep = (xmax-xmin)/76.;
		double xpos = xmax - xstep*i - xstep;
		double ypos = -1;
		double width = 0.008;
		if( i % 2 == 1 )
			ypos = sciFi_1_xbox_ymin+height/4.;
		else
			ypos = sciFi_1_xbox_ymax-height/4.;

 		sciFi_1_xplane[i] = new TEllipse(xpos,ypos,width,width);
		sciFi_1_xplane[i]->SetFillColor(0);
		if( scifiTriggers[0][0][i] == 1 )
			sciFi_1_xplane[i]->SetFillColor(2);
		sciFi_1_xplane[i]->Draw();
	}

	//SciFi #1 y plane
	TEllipse *sciFi_1_yplane[75];
	for( int i = 0 ; i < 75 ; i++ ){
		double xstep = (xmax-xmin)/76.;
		double xpos = xmax - xstep*i - xstep;
		double ypos = -1;
		double width = 0.008;
		if( i % 2 == 1 )
			ypos = sciFi_1_ybox_ymin+height/4.;
		else
			ypos = sciFi_1_ybox_ymax-height/4.;

 		sciFi_1_yplane[i] = new TEllipse(xpos,ypos,width,width);
		if( scifiTriggers[0][1][i] == 1 )
			sciFi_1_yplane[i]->SetFillColor(2);
		sciFi_1_yplane[i]->Draw();
	}

	gPad->Modified();
	c0->Update();

	char ct;
	std::cin >> ct;

	//delete everything
	sciFi_1_xbox->Delete();
	sciFi_1_ybox->Delete();
	sciFi_2_xbox->Delete();
	sciFi_2_ybox->Delete();
	for( int i = 0 ; i < 75 ; i++ ){
		sciFi_1_xplane[i]->Delete();
		sciFi_1_yplane[i]->Delete();
		sciFi_2_xplane[i]->Delete();
		sciFi_2_yplane[i]->Delete();
	}
	return;
}
