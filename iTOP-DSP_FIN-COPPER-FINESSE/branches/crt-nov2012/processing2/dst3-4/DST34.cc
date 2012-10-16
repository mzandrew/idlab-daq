#include "DST34.h"
#include <iostream>
#include <cmath>

using namespace std;


DST34::DST34(){

  nevents = 0;
  ncounters = 13;
  for(int i = 0; i < 24; i++) PMT_ID[i] = i + 1;
  for(int i = 0; i < 16; i++) Channel_ID[i] = i + 1;
  ReadChannelQuality();

}


DST34::~DST34(){}


int DST34::SetFiles(string strdst3, string strdst4){

  // check for obtaining exp number in FillRunTree function
  /*if( strdst3.length() < 8 ) {
    cout << "[ERROR] Name for the DST3 input should end with e..r...." << endl;
    return 0;
  } else if( strdst3.substr(strdst3.length() - 8, 1) != "e" )
    {
    cout << "[ERROR] Name for the DST3 input should end with e..r...." << endl;
    return 0;
    }*/

  // input
  string strdst3_ = strdst3 + ".dst3";
  char *cfdst3 = new char[strdst3_.length() + 1];
  strcpy(cfdst3, strdst3_.c_str());
  
  // output
  string strdst4_ = strdst4 + ".dst4";
  char *cfdst4 = new char[strdst4_.length() + 1];
  strcpy(cfdst4, strdst4_.c_str());

  // comment
  cout << endl << "Input:  " << cfdst3 << endl
       << "Output: " << cfdst4 << endl << endl;

  // open files
  fdst3 = new TFile(cfdst3, "READ");
  fdst4 = new TFile(cfdst4, "NEW");

  // check existance of files
  if (! fdst3->IsOpen() || ! fdst4->IsOpen()) {
    cout << endl << "[ERROR] Could not open one or more files. Exiting..." << endl
	 << "[ERROR] Please check existence of input and non-existence of output."
	 << endl;
    return 0;
  }

  fdst4->Close();

  cout << "Files successfully opened." << endl;
  cout << "Start transformation from DST3 to DST4." << endl << endl;
  return 1;
}


void DST34::SetThreshold(float thr){
  threshold = thr;
  cout << "Threshold = " << threshold << ". " << endl << endl;
  return;
}


void DST34::SetDebug(int deb){
  debug_flag = deb;
  cout << "Debug flag = " << debug_flag << ". " << endl << endl;

  return;
}


void DST34::SetTrees(){
  SetTreeDST3();
  SetTreeDST4();
  return;
}


void DST34::SetTreeDST3() {

  CFGTree = (TTree*) fdst3->Get("CFGTree");
  CFGTree -> SetBranchAddress("ExpNumber", &ExpNumber);
  CFGTree -> SetBranchAddress("RunNumber", &RunNumber);
  CFGTree -> SetBranchAddress("NEvents", &NEvents);
  //CFGTree -> SetBranchAddress("PMT_ID", PMT_ID);
  //CFGTree -> SetBranchAddress("Channel_ID", Channel_ID);
  CFGTree -> SetBranchAddress("ASIC_ID", ASIC_ID);
  CFGTree -> SetBranchAddress("PedestalFilename", PedestalFilename);
  CFGTree -> SetBranchAddress("CalibFilename", CalibFilename);
  CFGTree -> SetBranchAddress("NCounters", &NCounters);
  CFGTree -> SetBranchAddress("NTrackers", &NTrackers);

  EVTTree = (TTree*) fdst3->Get("EVTTree");
  EVTTree -> SetBranchAddress("EventNumber", &EventNumber);
  EVTTree -> SetBranchAddress("OriginWindow", &OriginWindow);
  EVTTree -> SetBranchAddress("ADC_Calib", ADC_Calib);
  EVTTree -> SetBranchAddress("TDC_Calib", TDC_Calib);
  /*
  EVTTree -> SetBranchAddress("Trigger1", TRIGGER1);
  EVTTree -> SetBranchAddress("Trigger2", TRIGGER2);
  EVTTree -> SetBranchAddress("Timing1", TIMING1);
  EVTTree -> SetBranchAddress("Timing2", TIMING2);
  EVTTree -> SetBranchAddress("Timing3", TIMING3);
  EVTTree -> SetBranchAddress("FTSW", &FTSW);
  EVTTree -> SetBranchAddress("Veto1", &VETO1);
  EVTTree -> SetBranchAddress("Veto2", &VETO2);
  EVTTree -> SetBranchAddress("QCP", &QCP);
  */

  CNTTree = (TTree*) fdst3->Get("CounterTree");
  CNTTree -> SetBranchAddress("CounterID", &CounterID);
  CNTTree -> SetBranchAddress("CounterTDC", &CounterTDC);
  CNTTree -> SetBranchAddress("CounterADC", &CounterADC);

  // Use number of events of module 0.
  nevents = EVTTree->GetEntries();
  cout << "Total number of events = " << nevents << endl << endl;

  return;
}


void DST34::SetTreeDST4() {

  RunTree = new TTree("RunTree", "Run");
  RunTree -> Branch("ExpNumber", &ExpNumber, "ExpNumber/i");
  RunTree -> Branch("RunNumber", &RunNumber, "RunNumber/i");
  RunTree -> Branch("NEvents", &NEvents, "NEvents/i");
  RunTree -> Branch("PedestalFilename", PedestalFilename, "PedestalFilename/C");
  RunTree -> Branch("CalibFilename", CalibFilename, "CalibFilename/C");
  RunTree -> Branch("DataType", &DataType, "DataType/i");
  RunTree -> Branch("BeamAngle", &BeamAngle, "BeamAngle[2]/F"); // not yet implemented.
  RunTree -> Branch("NCounters", &NCounters, "NCounters/i");
  RunTree -> Branch("NTrackers", &NTrackers, "NTrackers/i");
  RunTree -> Branch("Threshold", &threshold, "threshold/F");
  //RunTree -> Branch("PMT_ID", PMT_ID, "PMT_ID[24]/s");
  //RunTree -> Branch("Channel_ID", Channel_ID, "Channel_ID[16]/s");
  RunTree -> Branch("ASIC_ID", ASIC_ID, "ASIC_ID[4][4]/s");

  EventTree = new TTree("EventTree", "Event");
  EventTree -> Branch("EventNumber", &EventNumber, "EventNumber/i");
  EventTree -> Branch("NPhotons", &nhit, "nhit/i");

  PhotonTree = new TTree("PhotonTree", "Photon");

  PhotonTree -> Branch("EventNumber", &EventNumber, "EventNumber/i");
  PhotonTree -> Branch("PMT_ID", &pmtid, "pmtid/s");
  PhotonTree -> Branch("Channel_ID", &chid, "chid/s");
  PhotonTree -> Branch("General_ID", &gid, "gid/s");
  PhotonTree -> Branch("Window_ID", &windowid, "windowid/s");
  PhotonTree -> Branch("Sample_ID", &sampleid, "sampleid/s");

  PhotonTree -> Branch("CQGary", &CQGary, "CQGary/s");
  PhotonTree -> Branch("CQHirose", &CQHirose, "CQHirose/s");

  PhotonTree -> Branch("Time", &time, "time/F");
  PhotonTree -> Branch("TimePeak", &timepeak, "timepeak/F");
  PhotonTree -> Branch("TimeWM", &timewm, "timewm/F");

  PhotonTree -> Branch("Charge6", &charge6, "charge6/F");
  PhotonTree -> Branch("Charge8", &charge8, "charge8/F");
  PhotonTree -> Branch("Charge20", &charge20, "charge20/F");
  PhotonTree -> Branch("AbsCharge6", &abscharge6, "abscharge6/F");
  PhotonTree -> Branch("AbsCharge8", &abscharge8, "abscharge8/F");
  PhotonTree -> Branch("AbsCharge20", &abscharge20, "abscharge20/F");
  PhotonTree -> Branch("NOverTh5", &noverth5, "noverth5/s");
  PhotonTree -> Branch("NOverTh10", &noverth10, "noverth10/s");
  PhotonTree -> Branch("NOverTh15", &noverth15, "noverth15/s");
  PhotonTree -> Branch("SumWindow", &sumwindow, "sumwindow/F");
  PhotonTree -> Branch("SumAbsWindow", &sumabswindow, "sumabswindow/F");

  PhotonTree -> Branch("FTSW", &FTSW, "FTSW/F");
  PhotonTree -> Branch("TriggerL1", &TriggerL1, "TriggerL1/F");
  PhotonTree -> Branch("TriggerL2", &TriggerL2, "TriggerL2/F");
  PhotonTree -> Branch("TriggerS1", &TriggerS1, "TriggerS1/F");
  PhotonTree -> Branch("TriggerS2", &TriggerS2, "TriggerS2/F");
  PhotonTree -> Branch("QTriggerL1", &QTriggerL1, "QTriggerL1/s");
  PhotonTree -> Branch("QTriggerL2", &QTriggerL2, "QTriggerL2/s");
  PhotonTree -> Branch("QTriggerS1", &QTriggerS1, "QTriggerS1/s");
  PhotonTree -> Branch("QTriggerS2", &QTriggerS2, "QTriggerS2/s");
  PhotonTree -> Branch("Timing1", &Timing1, "Timing1/F");
  PhotonTree -> Branch("Timing2", &Timing2, "Timing2/F");
  PhotonTree -> Branch("Timing3", Timing3, "Timing3[4]/F");
  PhotonTree -> Branch("QTiming1", &QTiming1, "QTiming1/s");
  PhotonTree -> Branch("QTiming2", &QTiming2, "QTiming2/s");
  PhotonTree -> Branch("QTiming3", QTiming3, "QTiming3[4]/s");
  PhotonTree -> Branch("Veto1", &Veto1, "Veto1/F");
  PhotonTree -> Branch("Veto2", &Veto2, "Veto2/F");
  PhotonTree -> Branch("QVeto1", &QVeto1, "QVeto1/s");
  PhotonTree -> Branch("QVeto2", &QVeto2, "QVeto2/s");

  /*
  CounterTree = new TTree("CounterTree", "Counter");
  CounterTree -> Branch("EventNumber", &EventNumber, "EventNumber/i");
  CounterTree -> Branch("CounterID", &CounterID, "CounterID/i");
  CounterTree -> Branch("CounterTDC", &CounterTDC, "CounterTDC/i");
  CounterTree -> Branch("CounterADC", &CounterADC, "CounterADC/i");
  */

  // Memo
  // - C : a character string terminated by the 0 character
  // - B : an 8 bit signed integer (Char_t)
  // - b : an 8 bit unsigned integer (UChar_t)
  // - S : a 16 bit signed integer (Short_t)
  // - s : a 16 bit unsigned integer (UShort_t)
  // - I : a 32 bit signed integer (Int_t)
  // - i : a 32 bit unsigned integer (UInt_t)
  // - F : a 32 bit floating point (Float_t)
  // - D : a 64 bit floating point (Double_t)
  // - L : a 64 bit signed integer (Long64_t)
  // - l : a 64 bit unsigned integer (ULong64_t)
  // - O : [the letter 'o', not a zero] a boolean (Bool_t)
  
  return;
}


void DST34::ReadChannelQuality(){

  //TFile* fcq = new TFile("channel_list.txt", "READ");
  ifstream fcq("channel_list.txt");

  for(int i = 0; i < 24; i++){
    for(int j = 0; j < 16; j++){
      fcq >> ChannelQualityGary[i][j];
   }
  }
  for(int i = 0; i < 24; i++){
    for(int j = 0; j < 16; j++){
      fcq >> ChannelQualityHirose[i][j];
   }
  }

  /*
  // For debugging. Just to show channel qualities.
  for(int i = 0; i < 24; i++){
    for(int j = 0; j < 16; j++){
      cout << ChannelQualityGary[i][j] << " ";
   }
    cout << endl;
  }
  for(int i = 0; i < 24; i++){
    for(int j = 0; j < 16; j++){
      cout << ChannelQualityHirose[i][j] << " ";
   }
    cout << endl;
  }
  */

}

void DST34::FillRunTree(string strdst3){

  CFGTree->GetEntry(0);

  /*
  string strexp;
  if( strdst3.substr(strdst3.length() - 7, 1) == "0") strexp = strdst3.substr(strdst3.length() - 6, 1);
  else strexp = strdst3.substr(strdst3.length() - 7, 2);
  //cout << "Experiment number is " << strexp << "." << endl << endl;
  istringstream strsexp(strexp);
  strsexp >> ExpNumber;
  */

  DataType = 1;
  BeamAngle[0] = 0; // temporary
  BeamAngle[1] = 0; // temporary

  RunTree->Fill();

  return;
}


void DST34::FillPhotonTree(int evt){
  EVTTree->GetEntry(evt);

  nhit = 0;

  if(evt == 0 && debug_flag == 1){
    gROOT->SetStyle("Plain");
    gStyle->SetOptStat(0);
    // canvas
    Canvas = new TCanvas("Canvas", "Canvas", 10, 10, 800, 400);
    Canvas -> SetLeftMargin(0.13); Canvas -> SetRightMargin(0.13);
    // waku
    waku = new TH1F("waku", "waku", 256, 0, 100);
    waku->SetTitle("Waveform for hit channel"); waku->GetXaxis()->SetTitle("Time [nsec]");
    waku->SetMaximum(500); waku->SetMinimum(-500);
  }

  for(int i = 0; i < 24; i++){
    for(int j = 0; j < 16; j++){
      
      pmtid = PMT_ID[i];
      chid = Channel_ID[j];
      gid = ((PMT_ID[i]-1)/12)*(192-48) + (PMT_ID[i]-1)*4
	+ (Channel_ID[j]-1)%4 + ((Channel_ID[j]-1)/4)*48;
      //cout << pmtid << " " << chid << " " << gid << endl;

      for(int k = 0; k < 256; k++){
	if( ADC_Calib[i][j][k] <= threshold ){

	  CQGary = ChannelQualityGary[i][j];
	  CQHirose = ChannelQualityHirose[i][j];

	  time = TDC_Calib[i][j][k];
	  int peak = k; int second = k; int third = k;
	  for(int a = 0; a < 20; a++){
	    if(k-5+a > -1 && k-5+a < 256) {
	      if(ADC_Calib[i][j][peak] > ADC_Calib[i][j][k-5+a]) {third = second; second = peak; peak = k-5+a;}
	    }
	  }
	  timepeak = TDC_Calib[i][j][peak];
	  if(peak == third)
	    timewm = timepeak;
	  else if(second == third)
	    timewm = (TDC_Calib[i][j][peak] * ADC_Calib[i][j][peak]
		      + TDC_Calib[i][j][second] * ADC_Calib[i][j][second])
	      / (ADC_Calib[i][j][peak] + ADC_Calib[i][j][second]);
	  else
	    timewm = (TDC_Calib[i][j][peak] * ADC_Calib[i][j][peak]
		      + TDC_Calib[i][j][second] * ADC_Calib[i][j][second]
		      + TDC_Calib[i][j][third] * ADC_Calib[i][j][third])
	      / (ADC_Calib[i][j][peak] + ADC_Calib[i][j][second] + ADC_Calib[i][j][second]);

	  windowid = OriginWindow + k / 64;
	  sampleid = k % 64;

	  CNTTree->GetEntry( evt * ncounters +  0 ); { TriggerL1  = (float) CounterTDC * 0.025; QTriggerL1  = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  1 ); { TriggerL2  = (float) CounterTDC * 0.025; QTriggerL2  = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  2 ); { TriggerS1  = (float) CounterTDC * 0.025; QTriggerS1  = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  3 ); { TriggerS2  = (float) CounterTDC * 0.025; QTriggerS2  = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  4 ); { Timing1    = (float) CounterTDC * 0.025; QTiming1    = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  5 ); { Timing2    = (float) CounterTDC * 0.025; QTiming2    = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  6 ); { Timing3[0] = (float) CounterTDC * 0.025; QTiming3[0] = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  7 ); { Timing3[1] = (float) CounterTDC * 0.025; QTiming3[1] = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  8 ); { Timing3[2] = (float) CounterTDC * 0.025; QTiming3[2] = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters +  9 ); { Timing3[3] = (float) CounterTDC * 0.025; QTiming3[3] = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters + 10 ); { Veto1      = (float) CounterTDC * 0.025; QVeto1      = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters + 11 ); { Veto2      = (float) CounterTDC * 0.025; QVeto2      = CounterADC; }
	  CNTTree->GetEntry( evt * ncounters + 12 ); { FTSW       = (float) CounterTDC * 0.025; }

	  charge6 = ADC_Calib[i][j][k] + ADC_Calib[i][j][k+1] + ADC_Calib[i][j][k+2]
	    + ADC_Calib[i][j][k+3] + ADC_Calib[i][j][k+4] + ADC_Calib[i][j][k+5];
	  charge8 = ADC_Calib[i][j][k] + ADC_Calib[i][j][k+1] + ADC_Calib[i][j][k+2]
	    + ADC_Calib[i][j][k+3] + ADC_Calib[i][j][k+4] + ADC_Calib[i][j][k+5]
	    + ADC_Calib[i][j][k+6] + ADC_Calib[i][j][k+7];
	  charge20 = ADC_Calib[i][j][k] + ADC_Calib[i][j][k+1] + ADC_Calib[i][j][k+2]
	    + ADC_Calib[i][j][k+3] + ADC_Calib[i][j][k+4] + ADC_Calib[i][j][k+5]
	    + ADC_Calib[i][j][k+6] + ADC_Calib[i][j][k+7] + ADC_Calib[i][j][k+8]
	    + ADC_Calib[i][j][k+9] + ADC_Calib[i][j][k+10] + ADC_Calib[i][j][k+11]
	    + ADC_Calib[i][j][k+12] + ADC_Calib[i][j][k+13] + ADC_Calib[i][j][k+14]
	    + ADC_Calib[i][j][k+15] + ADC_Calib[i][j][k+16] + ADC_Calib[i][j][k+17]
	    + ADC_Calib[i][j][k+18] + ADC_Calib[i][j][k+19];

	  abscharge6 = fabs(ADC_Calib[i][j][k]) + fabs(ADC_Calib[i][j][k+1]) + fabs(ADC_Calib[i][j][k+2])
	    + fabs(ADC_Calib[i][j][k+3]) + fabs(ADC_Calib[i][j][k+4]) + fabs(ADC_Calib[i][j][k+5]);
	  abscharge8 = fabs(ADC_Calib[i][j][k]) + fabs(ADC_Calib[i][j][k+1]) + fabs(ADC_Calib[i][j][k+2])
	    + fabs(ADC_Calib[i][j][k+3]) + fabs(ADC_Calib[i][j][k+4]) + fabs(ADC_Calib[i][j][k+5])
	    + fabs(ADC_Calib[i][j][k+6]) + fabs(ADC_Calib[i][j][k+7]);
	  abscharge20 = fabs(ADC_Calib[i][j][k]) + fabs(ADC_Calib[i][j][k+1]) + fabs(ADC_Calib[i][j][k+2])
	    + fabs(ADC_Calib[i][j][k+3]) + fabs(ADC_Calib[i][j][k+4]) + fabs(ADC_Calib[i][j][k+5])
	    + fabs(ADC_Calib[i][j][k+6]) + fabs(ADC_Calib[i][j][k+7]) + fabs(ADC_Calib[i][j][k+8])
	    + fabs(ADC_Calib[i][j][k+9]) + fabs(ADC_Calib[i][j][k+10]) + fabs(ADC_Calib[i][j][k+11])
	    + fabs(ADC_Calib[i][j][k+12]) + fabs(ADC_Calib[i][j][k+13]) + fabs(ADC_Calib[i][j][k+14])
	    + fabs(ADC_Calib[i][j][k+15]) + fabs(ADC_Calib[i][j][k+16]) + fabs(ADC_Calib[i][j][k+17])
	    + fabs(ADC_Calib[i][j][k+18]) + fabs(ADC_Calib[i][j][k+19]);

	  noverth5 = 0; noverth10 = 0; noverth15 = 0;
	  for(int s = 0; s < 15; s++){
	    if( ADC_Calib[i][j][k+s] <= threshold ){
	      if( s < 5 )  noverth5++;
	      if( s < 10 ) noverth10++;
	      if( s < 15 ) noverth15++;
	    }
	  }

	  sumwindow = 0; sumabswindow = 0;
	  for(int w = 0; w < 64; w++){
	    sumwindow += ADC_Calib[i][j][(k/64) * 64 + w];
	    sumabswindow += fabs(ADC_Calib[i][j][(k/64) * 64 + w]);
	  }

	  PhotonTree->Fill();

	  if(charge8 < -100 && sumabswindow < 2000 && CQGary == 0 && CQHirose < 6 && gid != 128 && abs(k-64)>5 && abs(k-128)>5 && abs(k-192)>5 && abs(k-256)>5) nhit += 1;

	  /*
	  // for debug
	  if(charge8 < -100 && sumabswindow < 2000 && CQGary == 0 && CQHirose < 6 && gid != 128 && abs(k-64)>5 && abs(k-128)>5 && abs(k-192)>5 && abs(k-256)>5){
	  cout << ADC_Calib[i][j][peak] << " " << ADC_Calib[i][j][second] << " " << ADC_Calib[i][j][third] << endl;
	  cout << TDC_Calib[i][j][peak] << " " << TDC_Calib[i][j][second] << " " << TDC_Calib[i][j][third] << endl;
	  cout << time << " " << timepeak << " " << timewm << endl;
	  }*/

	  if(debug_flag == 1 && CQGary == 0 && CQHirose < 6 && gid != 128
	     && charge8 < -100 && sumabswindow < 2000
	     && abs(k-64)>5 && abs(k-128)>5 && abs(k-192)>5 && abs(k-256)>5){ // maybe good cut
	    //&& ( charge8 < -150 || charge8 > 0 || abscharge8 > 500) ){ // maybe bad cut
	    //if(debug_flag == 1 && i == 3 && j == 0 && evt % 1 == 0){ // maybe good channel
	  //if(debug_flag == 1 && i == 0 && j == 0 && evt % 1 == 0){ // maybe bad channel
	    // variables
	    float x[256], y[256];
	    // insert
	    for(int sample = 0; sample < 256; sample++){
	      x[sample] = TDC_Calib[i][j][sample]; y[sample] = ADC_Calib[i][j][sample];
	    }

	    /*multimap<double, double> m;
	    for (vector<Particle>::iterator i = b_all.begin();
		 i != b_all.end(); i++) {
	      double chi2 = dynamic_cast<UserInfo&>(i->userInfo()).chisq();
	      m.insert(pair<double, vector<Particle>::iterator>(chi2, i));
	      }*/

	    // graph
	    TGraph *graph = new TGraph(256, x, y);
	    graph -> SetLineWidth(2); graph -> SetLineColor(4);
	    // latex
	    string Sevent = "Event: "; string SPMT = ", PMT: "; string SCH = ", Channel: ";
	    stringstream ssevent; ssevent << evt + 1; string sevent = ssevent.str();
	    stringstream ssPMT; ssPMT << i + 1; string sPMT = ssPMT.str();
	    stringstream ssCH; ssCH << j + 1; string sCH = ssCH.str();
	    string sinfo = Sevent + sevent + SPMT + sPMT + SCH + sCH;
	    char *cinfo = new char[sinfo.length() + 1]; strcpy(cinfo, sinfo.c_str());
	    TLatex *tinfo = new TLatex(x[120], 250, cinfo);
	    // draw
	    waku -> Draw(); graph -> Draw("plsame"); tinfo -> Draw("same");
	    //print
	    Canvas -> Print("allch_sigcut.gif+100");
	    Canvas -> Modified(); Canvas -> Update();
	  }

	  break;
	}
      }

    }
  }

  EventTree->Fill();
  
  return;
}


void DST34::FillCounterTree(){
  CounterTree = CNTTree->CopyTree("");
  return;
}


void DST34::WriteDST4(string strdst4){

  fdst3->Close();

  cout << "Saving output..." << endl;

  string strdst4_ = strdst4 + ".dst4";
  char *cfdst4 = new char[strdst4_.length() + 1];
  strcpy(cfdst4, strdst4_.c_str());

  fdst4 = new TFile(cfdst4, "RECREATE");
  RunTree->Write();
  EventTree->Write();
  PhotonTree->Write();
  CounterTree->Write();
  fdst4->Close();

  return;
}
