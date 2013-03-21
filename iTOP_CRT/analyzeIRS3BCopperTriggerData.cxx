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
#include <math.h>
#include <TH1F.h> 
#include <TH2F.h> 
#include <TF1.h>
#include <TMath.h> 
#include "TCanvas.h"
#include <TMultiGraph.h>
#include <TGraphErrors.h>
#include <TGraphAsymmErrors.h>
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

void initializeHistograms();
void processTree();
void plotSamples();

//canvas
TCanvas *c0;

//Set tree variables as global for quick implementation
TTree *tree;
UInt_t scrodId;
UInt_t winId;
int asicCol;
int asicRow;
int asicCh;
int window;
int samples[POINTS_PER_WAVEFORM];

//histograms
//histograms go here

void analyzeIRS3BCopperTriggerData(){
	//define input file
	TFile *g;
	g = new TFile("output_parseIRS3BCopperTriggerData.root","READ"); //test mode
	if (g->IsZombie()) {
		std::cout << "Error opening input file" << std::endl;
		exit(-1);
	}

	//define canvas
	c0 = new TCanvas("c0","",0,0,800,800);

	//load tree and assign variables
        tree = (TTree*)g->Get("T");

	//initialize histograms used in analysis
	initializeHistograms();

	//process tree
	processTree();

	//define output file name
	std::string outputFileName = "output_analyzeIRS3BCopperTriggerData.root";
	std::cout << " outputFileName " << outputFileName << std::endl;

	TFile f( outputFileName.c_str() , "RECREATE");
	//write output here
	f.Close();
	return;
}

void initializeHistograms(){
	//initialize histograms here
}

void processTree(){
	//define tree variables
	TBranch *branch_scrodId = tree->GetBranch("scrodId");
	branch_scrodId->SetAddress(&scrodId);
	TBranch *branch_windId = tree->GetBranch("winId");
	branch_windId->SetAddress(&winId);
	TBranch *branch_asicCol = tree->GetBranch("asicCol");
	branch_asicCol->SetAddress(&asicCol);
	TBranch *branch_asicRow = tree->GetBranch("asicRow");
	branch_asicRow->SetAddress(&asicRow);
	TBranch *branch_asicCh = tree->GetBranch("asicCh");
	branch_asicCh->SetAddress(&asicCh);
	TBranch *branch_window = tree->GetBranch("window");
	branch_window->SetAddress(&window);
	TBranch *branch_samples = tree->GetBranch("samples");
	branch_samples->SetAddress(samples);

	//loop through tree, plot each waveform in graph
	for (int i = 0; i < tree->GetEntries(); i++){
		//std::cout << "event " << i << std::endl;
		tree->GetEvent(i);
		//draw event
		plotSamples();
	}

	return;
}

void plotSamples(){
	c0->Clear();

  	double num[POINTS_PER_WAVEFORM];
  	double numErr[POINTS_PER_WAVEFORM];
  	double val[POINTS_PER_WAVEFORM]; 
  	double valErr[POINTS_PER_WAVEFORM];
  	memset(num,0,sizeof(num[0])*POINTS_PER_WAVEFORM );
  	memset(numErr,0,sizeof(numErr[0])*POINTS_PER_WAVEFORM  );
  	memset(val,0,sizeof(val[0])*POINTS_PER_WAVEFORM  );
  	memset(valErr,0,sizeof(valErr[0])*POINTS_PER_WAVEFORM  );

	for(int i = 0 ; i < POINTS_PER_WAVEFORM ; i++){
		num[i] = i;
		val[i] = samples[i];
	}

 	TGraphErrors *gr = new TGraphErrors(POINTS_PER_WAVEFORM,num,val,numErr,valErr); 
 	gr->SetName("Efficiency");
 	gr->SetMarkerColor(4);
 	gr->SetMarkerStyle(21);
 	gr->SetMarkerSize(1);
 
 	TMultiGraph *mg = new TMultiGraph();
 	mg->Add(gr);
 	mg->Draw("ALP");
	mg->SetTitle("Digitized Samples");
	mg->GetXaxis()->SetTitle("Sample Number");
	mg->GetXaxis()->CenterTitle();
	mg->GetYaxis()->SetTitle("Value (ADC)");
	mg->GetYaxis()->SetRangeUser(0,4100);
	mg->GetYaxis()->CenterTitle();

	gPad->Modified();
	c0->Update();

	std::cout << std::hex << " winId " << winId << std::endl;
	std::cout << std::hex << " asicCol " << asicCol << std::endl;
	std::cout << std::hex << " asicRow " << asicRow << std::endl;
	std::cout << std::hex << " asicCh " << asicCh << std::endl;
	std::cout << std::hex << " window " << window << std::endl;

	std::cout << "Enter character to continue" << std::endl;
	char ct;
	std::cin >> ct;

	gr->Delete();
	mg->Delete();

	return;
}
