
#include "DST23.h"
#include <iostream>

using namespace std;


DST23::DST23(){
  nevents = 0;
  exist_module = 0;
  flag_nevents = 0;
}


DST23::~DST23(){}


int DST23::SetInputFiles(string strdst2, string strcalib, string strcamac){

  string strdst2m0 = strdst2 + "m0.dst2";
  string strdst2m1 = strdst2 + "m1.dst2";
  string strdst2m2 = strdst2 + "m2.dst2";

  string strcalibm0 = strcalib + "m0.calib";
  string strcalibm1 = strcalib + "m1.calib";
  string strcalibm2 = strcalib + "m2.calib";

  string strcamac_ = strcamac + ".camac";

  char *cfdst2m0 = new char[strdst2m0.length() + 1];
  char *cfdst2m1 = new char[strdst2m1.length() + 1];
  char *cfdst2m2 = new char[strdst2m2.length() + 1];

  char *cfcalibm0 = new char[strcalibm0.length() + 1];
  char *cfcalibm1 = new char[strcalibm1.length() + 1];
  char *cfcalibm2 = new char[strcalibm2.length() + 1];

  char *cfcamac = new char[strcamac_.length() + 1];

  strcpy(cfdst2m0, strdst2m0.c_str());
  strcpy(cfdst2m1, strdst2m1.c_str());
  strcpy(cfdst2m2, strdst2m2.c_str());

  strcpy(cfcalibm0, strcalibm0.c_str());
  strcpy(cfcalibm1, strcalibm1.c_str());
  strcpy(cfcalibm2, strcalibm2.c_str());

  strcpy(cfcamac, strcamac_.c_str());

  // comment
  cout << endl
       << "Inputs: " << cfdst2m0 << ", " << cfdst2m1 << ", " << cfdst2m2 << "," << endl
       << "        " << cfcalibm0 << ", " << cfcalibm1 << ", " << cfcalibm2 << "," << endl
       << "        " << cfcamac << endl << endl;

  // open files
  fdst2m0 = new TFile(cfdst2m0, "READ");
  fdst2m1 = new TFile(cfdst2m1, "READ");
  fdst2m2 = new TFile(cfdst2m2, "READ");
  fcalibm0 = new TFile(cfcalibm0, "READ");
  fcalibm1 = new TFile(cfcalibm1, "READ");
  fcalibm2 = new TFile(cfcalibm2, "READ");
  fcamac = new TFile(cfcamac, "READ");

  // check existance of files
  if ( fdst2m0->IsOpen() && fcalibm0->IsOpen() ) exist_module += 1;
  if ( fdst2m1->IsOpen() && fcalibm1->IsOpen() ) exist_module += 2;
  if ( fdst2m2->IsOpen() && fcalibm2->IsOpen() ) exist_module += 4;

  if ( exist_module == 0 ) {
    cout << endl << "[ERROR] No pair of data and calib files exist. Exiting..." << endl
	 << endl;
    return 0;
  }
  cout << "ID of module existence: " << exist_module  << "." << endl;

  if ( ! fcamac->IsOpen() ){
    cout << endl << "[ERROR] No camac files exist. Exiting..." << endl
	 << endl;
    return 0;
  }

  string strcalib_ = strcalib + "m*.calib";
  CalibFilename = new char[strcalib_.length() + 1];
  strcpy(CalibFilename, strcalib_.c_str());

  cout << "Files successfully opened." << endl;
  cout << "Start transformation from DST2 to DST3." << endl << endl;
  return 1;
}


int DST23::SetOutputFiles(string strdst3, int id_division, int ndivision){

  // part id
  stringstream ssdivision; ssdivision << id_division; string sdivision = ssdivision.str();
  if(sdivision.length() == 1) sdivision = "0" + sdivision;

  // output
  string strdst3_;
  if(ndivision == 1) strdst3_ = strdst3 + ".dst3";
  else strdst3_ = strdst3 + "p" + sdivision + ".dst3";

  char *cfdst3 = new char[strdst3_.length() + 1];
  strcpy(cfdst3, strdst3_.c_str());
  cout << endl << "Output: " << cfdst3 << endl << endl;

  fdst3 = new TFile(cfdst3, "NEW");

  if( !fdst3->IsOpen() ) {
    cout << "[ERROR] Please check existence of inputs and non-existence of output." << endl << endl;
    return 0;
  }

  fdst3->Close();
  return 1;
}


void DST23::SetInputTrees(){
  SetTreeDST2();
  SetTreeCalib();
  SetTreeCAMAC();
  return;
}


void DST23::SetOutputTrees(){
  SetTreeDST3();
  return;
}


void DST23::SetTreeDST2() {

  // Use config tree of module 0.
  ConfigTree = (TTree*) fdst2m0->Get("ConfigTree");
  ConfigTree -> SetBranchAddress("ExpNumber", &ExpNumber);
  ConfigTree -> SetBranchAddress("RunNumber", &RunNumber);
  ConfigTree -> SetBranchAddress("ASIC_ID", ASIC_ID);
  ConfigTree -> SetBranchAddress("PedestalFilename", &PedestalFilename);

  // Event tree of module 0.
  if(exist_module == 1 || exist_module == 3 || exist_module == 5 || exist_module == 7){
    EventTreeM0 = (TTree*) fdst2m0->Get("EventTree");
    EventTreeM0 -> SetBranchAddress("ASIC_ADC", ASIC_ADC_M0);
    EventTreeM0 -> SetBranchAddress("ASIC_OriginWindow", ASIC_OriginWindow_M0);
    EventTreeM0 -> SetBranchAddress("EventNumber", &EventNumberM0);
  }

  // Event tree of module 1.
  if(exist_module == 2 || exist_module == 3 || exist_module == 6 || exist_module == 7){
    EventTreeM1 = (TTree*) fdst2m1->Get("EventTree");
    EventTreeM1 -> SetBranchAddress("ASIC_ADC", ASIC_ADC_M1);
    EventTreeM1 -> SetBranchAddress("ASIC_OriginWindow", ASIC_OriginWindow_M1);
    EventTreeM1 -> SetBranchAddress("EventNumber", &EventNumberM1);
  }

  // Event tree of module 2.
  if(exist_module == 4 || exist_module == 5 || exist_module == 6 || exist_module == 7){
    EventTreeM2 = (TTree*) fdst2m2->Get("EventTree");
    EventTreeM2 -> SetBranchAddress("ASIC_ADC", ASIC_ADC_M2);
    EventTreeM2 -> SetBranchAddress("ASIC_OriginWindow", ASIC_OriginWindow_M2);
    EventTreeM2 -> SetBranchAddress("EventNumber", &EventNumberM2);
  }

  // Show number of events.
  if(exist_module == 1 || exist_module == 3 || exist_module == 5 || exist_module == 7){
    cout << "Total number of events (M0) = " << EventTreeM0->GetEntries() << endl;
    nevents = EventTreeM0->GetEntries();
  }
  if(exist_module == 2 || exist_module == 3 || exist_module == 6 || exist_module == 7){
    cout << "Total number of events (M1) = " << EventTreeM0->GetEntries() << endl;
    if (nevents > EventTreeM1->GetEntries()) nevents = EventTreeM1->GetEntries();
  }
  if(exist_module == 4 || exist_module == 5 || exist_module == 6 || exist_module == 7){
    cout << "Total number of events (M2) = " << EventTreeM0->GetEntries() << endl;
    if (nevents > EventTreeM2->GetEntries()) nevents = EventTreeM2->GetEntries();
  }

  if(EventTreeM0->GetEntries() != EventTreeM1->GetEntries() ||
     EventTreeM1->GetEntries() != EventTreeM2->GetEntries() ) flag_nevents = 1;
  
  return;
}


void DST23::SetTreeCalib(){

  // Event tree of module 0.
  if(exist_module == 1 || exist_module == 3 || exist_module == 5 || exist_module == 7){
    ChargeCalibTreeM0 = (TTree*) fcalibm0->Get("ChargeCalib");
    ChargeCalibTreeM0 -> SetBranchAddress("q_factor", q_factor_m0);

    TimeCalibTreeM0 = (TTree*) fcalibm0->Get("TimeCalib");
    TimeCalibTreeM0 -> SetBranchAddress("time_odd", time_odd_m0);
    TimeCalibTreeM0 -> SetBranchAddress("time_even", time_even_m0);

    ChargeCalibTreeM0->GetEntry(0);
    TimeCalibTreeM0->GetEntry(0);
  }

  // Event tree of module 1.
  if(exist_module == 2 || exist_module == 3 || exist_module == 6 || exist_module == 7){
    ChargeCalibTreeM1 = (TTree*) fcalibm1->Get("ChargeCalib");
    ChargeCalibTreeM1 -> SetBranchAddress("q_factor", q_factor_m1);

    TimeCalibTreeM1 = (TTree*) fcalibm1->Get("TimeCalib");
    TimeCalibTreeM1 -> SetBranchAddress("time_odd", time_odd_m1);
    TimeCalibTreeM1 -> SetBranchAddress("time_even", time_even_m1);
    
    ChargeCalibTreeM1->GetEntry(0);
    TimeCalibTreeM1->GetEntry(0);
  }

  // Event tree of module 2.
  if(exist_module == 4 || exist_module == 5 || exist_module == 6 || exist_module == 7){
    ChargeCalibTreeM2 = (TTree*) fcalibm2->Get("ChargeCalib");
    ChargeCalibTreeM2 -> SetBranchAddress("q_factor", q_factor_m2);
    
    TimeCalibTreeM2 = (TTree*) fcalibm2->Get("TimeCalib");
    TimeCalibTreeM2 -> SetBranchAddress("time_odd", time_odd_m2);
    TimeCalibTreeM2 -> SetBranchAddress("time_even", time_even_m2);

    ChargeCalibTreeM2->GetEntry(0);
    TimeCalibTreeM2->GetEntry(0);
  }

  return;
}


void DST23::SetTreeCAMAC(){

  CAMACTree = (TTree*) fcamac->Get("camdata");
  CAMACTree -> SetBranchAddress("event", &CAMEventNumber);
  CAMACTree -> SetBranchAddress("tg1", &TRIGGERL1[1]);
  CAMACTree -> SetBranchAddress("qtg1", &TRIGGERL1[0]);
  CAMACTree -> SetBranchAddress("tg2", &TRIGGERL2[1]);
  CAMACTree -> SetBranchAddress("qtg2", &TRIGGERL2[0]);
  CAMACTree -> SetBranchAddress("tc1", &TRIGGERS1[1]);
  CAMACTree -> SetBranchAddress("qtc1", &TRIGGERS1[0]);
  CAMACTree -> SetBranchAddress("tc2", &TRIGGERS2[1]);
  CAMACTree -> SetBranchAddress("qtc2", &TRIGGERS2[0]);
  CAMACTree -> SetBranchAddress("tm1", &TIMING1[1]);
  CAMACTree -> SetBranchAddress("qtm1", &TIMING1[0]);
  CAMACTree -> SetBranchAddress("tm2", &TIMING2[1]);
  CAMACTree -> SetBranchAddress("qtm2", &TIMING2[0]);
  CAMACTree -> SetBranchAddress("tm3_1", &TIMING3[0][1]);
  CAMACTree -> SetBranchAddress("tm3_2", &TIMING3[1][1]);
  CAMACTree -> SetBranchAddress("tm3_3", &TIMING3[2][1]);
  CAMACTree -> SetBranchAddress("tm3_4", &TIMING3[3][1]);
  CAMACTree -> SetBranchAddress("qtm3_1", &TIMING3[0][0]);
  CAMACTree -> SetBranchAddress("qtm3_2", &TIMING3[1][0]);
  CAMACTree -> SetBranchAddress("qtm3_3", &TIMING3[2][0]);
  CAMACTree -> SetBranchAddress("qtm3_4", &TIMING3[3][0]);
  CAMACTree -> SetBranchAddress("ftsw", &FTSW);
  CAMACTree -> SetBranchAddress("v1", &VETO1[1]);
  CAMACTree -> SetBranchAddress("qv1", &VETO1[0]);
  CAMACTree -> SetBranchAddress("v2", &VETO2[1]);
  CAMACTree -> SetBranchAddress("qv2", &VETO2[0]);
  CAMACTree -> SetBranchAddress("qcp", &QCP);

  cout << "Total number of events (CAMAC) = " << CAMACTree->GetEntries() << endl;

  return;
}


void DST23::SetTreeDST3() {

  CFGTree = new TTree("CFGTree", "Config Data");
  CFGTree -> Branch("ExpNumber", &ExpNumber, "ExpNumber/i");
  CFGTree -> Branch("RunNumber", &RunNumber, "RunNumber/i");
  CFGTree -> Branch("NEvents", &nevents, "NEvents/i");
  CFGTree -> Branch("PMT_ID", PMT_ID, "PMT_ID[24]/s");
  CFGTree -> Branch("Channel_ID", Channel_ID, "Channel_ID[16]/s");
  CFGTree -> Branch("ASIC_ID", ASIC_ID, "ASIC_ID[4][4]/s");
  CFGTree -> Branch("PedestalFilename", PedestalFilename, "PedestalFilename/C");
  CFGTree -> Branch("CalibFilename", CalibFilename, "CalibFilename/C");
  CFGTree -> Branch("NCounters", &NCounters, "NCounters/i");
  CFGTree -> Branch("NTrackers", &NTrackers, "NTrackers/i");

  EVTTree = new TTree("EVTTree", "Evt Data");
  EVTTree -> Branch("ADC_Calib", ADC_Calib, "ADC_Calib[24][16][256]/F");
  EVTTree -> Branch("TDC_Calib", TDC_Calib, "TDC_Calib[24][16][256]/F");
  EVTTree -> Branch("EventNumber", &EventNumber, "EventNumber/i");
  EVTTree -> Branch("OriginWindow", &OriginWindow, "OriginWindow/i");

  /*
  EVTTree -> Branch("TriggerL1", TRIGGERL1, "TRIGGERL1[2]/i");
  EVTTree -> Branch("TriggerL2", TRIGGERL2, "TRIGGERL2[2]/i");
  EVTTree -> Branch("TriggerS1", TRIGGERS1, "TRIGGERS1[2]/i");
  EVTTree -> Branch("TriggerS2", TRIGGERS2, "TRIGGERS2[2]/i");
  EVTTree -> Branch("Timing1", TIMING1, "TIMING1[2]/i");
  EVTTree -> Branch("Timing2", TIMING2, "TIMING2[2]/i");
  EVTTree -> Branch("Timing3", TIMING3, "TIMING3[4][2]/i");
  EVTTree -> Branch("FTSW", &FTSW, "FTSW/i");
  EVTTree -> Branch("Veto1", &VETO1, "VETO1[2]/i");
  EVTTree -> Branch("Veto2", &VETO2, "VETO2[2]/i");
  EVTTree -> Branch("QCP", &QCP, "QCP/i");
  */

  CounterTree = new TTree("CounterTree", "Counter");
  CounterTree -> Branch("CounterID", &CounterID, "CounterID/i");
  CounterTree -> Branch("CounterADC", &CounterADC, "CounterADC/i");
  CounterTree -> Branch("CounterTDC", &CounterTDC, "CounterTDC/i");
  CounterTree -> Branch("EventNumber", &EventNumber, "EventNumber/i");

  /*
  // Assign EventNumber.
  if(exist_module == 1 || exist_module == 3 || exist_module == 5 || exist_module == 7){ // module 0 exists.
    EVTTree -> Branch("EventNumber", &EventNumberM0, "EventNumberM0/i");
    CounterTree -> Branch("EventNumber", &EventNumberM0, "EventNumberM0/i");
  } else if ( exist_module != 4 ) { // module 1 exists.
    EVTTree -> Branch("EventNumber", &EventNumberM1, "EventNumberM1/i");
    CounterTree -> Branch("EventNumber", &EventNumberM1, "EventNumberM1/i");
  } else { // only module 2 exist.
    EVTTree -> Branch("EventNumber", &EventNumberM2, "EventNumberM2/i");
    CounterTree -> Branch("EventNumber", &EventNumberM2, "EventNumberM2/i");
  }
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


void DST23::FillCFGTree(int id_division){

  if(id_division == 0){
    ConfigTree->GetEntry(0);
    
    for(int i = 0; i < 24; i++) PMT_ID[i] = i + 1;
    for(int i = 0; i < 16; i++) Channel_ID[i] = i + 1;

    NCounters = 13;
    NTrackers = 0;
    
    CFGTree->Fill();
  }

  return;
}


int DST23::TransformEVTTree(int evt){

  // Get entry.

  if(exist_module == 1 || exist_module == 3 || exist_module == 5 || exist_module == 7){
    EventTreeM0->GetEntry(evt);
    OriginWindow = ASIC_OriginWindow_M0[0][0][0][0];
    ChargeCalibTreeM0->GetEntry(0);
    TimeCalibTreeM0->GetEntry(0);
  }
  if(exist_module == 2 || exist_module == 3 || exist_module == 6 || exist_module == 7){
    EventTreeM1->GetEntry(evt);
    OriginWindow = ASIC_OriginWindow_M1[0][0][0][0];
    ChargeCalibTreeM1->GetEntry(0);
    TimeCalibTreeM1->GetEntry(0);
  }
  if(exist_module == 4 || exist_module == 5 || exist_module == 6 || exist_module == 7){
    EventTreeM2->GetEntry(evt);
    OriginWindow = ASIC_OriginWindow_M2[0][0][0][0];
    ChargeCalibTreeM2->GetEntry(0);
    TimeCalibTreeM2->GetEntry(0);
  }

  CAMACTree->GetEntry(evt);

  // Event ID matching: COMMENT OUT SINCE THIS IS JUST A CHECK OF CALIB.
  /*
  if(EventNumberM0 != EventNumberM1 || EventNumberM0 != EventNumberM2 || EventNumberM0 != CAMEventNumber){
      cout << "[ERROR] Event numbers do not match at event = " << evt+1 << "."
	   << endl << "Save up to this event." << endl;
      return 0;
  }
  //cout << EventNumberM0 << " " << EventNumberM1 << " " << EventNumberM2 << " " << CAMEventNumber << endl;
  */

  /*
  int i = 1;
  while (EventNumberM0 != evt+1 || EventNumberM1 != evt+1 || EventNumberM2 != evt+1 || CAMEventNumber != evt+1 ){
    if (EventNumberM0 < evt+1) EventTreeM0 -> GetEntry(evt + i);
    if (EventNumberM1 < evt+1) EventTreeM1 -> GetEntry(evt + i);
    if (EventNumberM2 < evt+1) EventTreeM2 -> GetEntry(evt + i);
    if (CAMEventNumber < evt+1) CAMACTree -> GetEntry(evt + i);
    if(i > 100) {
      cout << "[ERROR] Event numbers do not match at event = " << evt+1 << "."
	   << "Save up to this event." << endl;
      return 0;
    }
    i++;
  }
  */

  EventNumber = evt;

  // Loop.

  for(int mod = 0; mod < 3; mod++){
    if(mod == 0 && (exist_module != 1 && exist_module != 3 && exist_module != 5 && exist_module != 7)) continue;
    if(mod == 1 && (exist_module != 2 && exist_module != 3 && exist_module != 6 && exist_module != 7)) continue;
    if(mod == 2 && (exist_module != 4 && exist_module != 5 && exist_module != 5 && exist_module != 7)) continue;
    for(int col = 0; col < 4; col++){
      for (int row = 0; row < 4; row++){
	int IPMT = GetIPMT(mod, col, row);
	//cout << mod << " " << col << " " << row << " " << IPMT << endl;
	for (int ch = 0; ch < 8; ch++){
	  int ICH  = GetIChannel(row, ch);
	  for (int win = 0; win < 4; win++){
	    int WIN = (Int_t)ASIC_OriginWindow_M0[col][row][ch][win];
	    for (int sample = 0; sample < 64; sample++){
	      if(mod == 0) {
		ADC_Calib[IPMT][ICH][win*64+sample] =
		  ASIC_ADC_M0[col][row][ch][win][sample];
		/*ASIC_ADC_M0[col][row][ch][win][sample]
		 * q_factor_m0[col][row][ch][WIN][sample];*/
		TDC_Calib[IPMT][ICH][win*64+sample] = win*64+sample;
		if(sample%2 == 0) TDC_Calib[IPMT][ICH][win*64+sample] += 2;
		TDC_Calib[IPMT][ICH][win*64+sample] *= 0.370370;
		/*if( WIN % 2 == 0)
		  TDC_Calib[IPMT][ICH][win*64+sample] = time_even_m0[col][row][ch][sample] * pow(10, 9);
		else
		  TDC_Calib[IPMT][ICH][win*64+sample] = time_odd_m0[col][row][ch][sample] * pow(10, 9);
		if(win > 0) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M0[col][row][ch][0]%2)?
			      (time_odd_m0[col][row][ch][63] * pow(10, 9) + 0.3704):(time_even_m0[col][row][ch][63] * pow(10, 9) + 0.3704);
		if(win > 1) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M0[col][row][ch][0]%2)?
			      (time_even_m0[col][row][ch][63] * pow(10, 9) + 0.3704):(time_odd_m0[col][row][ch][63] * pow(10, 9) + 0.3704);
		if(win > 2) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M0[col][row][ch][0]%2)?
			      (time_odd_m0[col][row][ch][63] * pow(10, 9) + 0.3704):(time_even_m0[col][row][ch][63] * pow(10, 9) + 0.3704);*/
		//cout << ADC_Calib[IPMT][ICH][win*64+sample] << " " << TDC_Calib[IPMT][ICH][win*64+sample] << endl;
	      } else if(mod == 1) {
		ADC_Calib[IPMT][ICH][win*64+sample] =
		  ASIC_ADC_M1[col][row][ch][win][sample];
		/*ASIC_ADC_M1[col][row][ch][win][sample]
		 * q_factor_m1[col][row][ch][WIN][sample];*/
		TDC_Calib[IPMT][ICH][win*64+sample] = win*64+sample;
		if(sample%2 == 0) TDC_Calib[IPMT][ICH][win*64+sample] += 2;
		TDC_Calib[IPMT][ICH][win*64+sample] *= 0.370370;
		/*if( WIN % 2 == 0)
		  TDC_Calib[IPMT][ICH][win*64+sample] = time_even_m1[col][row][ch][sample];
		else
		  TDC_Calib[IPMT][ICH][win*64+sample] = time_odd_m1[col][row][ch][sample];
		if(win > 0) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M1[col][row][ch][0]%2)?
			      (time_odd_m1[col][row][ch][63] * pow(10, 9) + 0.3704):(time_even_m1[col][row][ch][63] * pow(10, 9) + 0.3704);
		if(win > 1) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M1[col][row][ch][0]%2)?
			      (time_even_m1[col][row][ch][63] * pow(10, 9) + 0.3704):(time_odd_m1[col][row][ch][63] * pow(10, 9) + 0.3704);
		if(win > 2) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M1[col][row][ch][0]%2)?
			      (time_odd_m1[col][row][ch][63] * pow(10, 9) + 0.3704):(time_even_m1[col][row][ch][63] * pow(10, 9) + 0.3704);*/
		//cout << ADC_Calib[IPMT][ICH][win*64+sample] << " " << TDC_Calib[IPMT][ICH][win*64+sample] << endl;
	      } else if(mod == 2) {
		ADC_Calib[IPMT][ICH][win*64+sample] =
		  ASIC_ADC_M2[col][row][ch][win][sample];
		/*ASIC_ADC_M2[col][row][ch][win][sample]
		 * q_factor_m2[col][row][ch][WIN][sample];*/
		TDC_Calib[IPMT][ICH][win*64+sample] = win*64+sample;
		if(sample%2 == 0) TDC_Calib[IPMT][ICH][win*64+sample] += 2;
		TDC_Calib[IPMT][ICH][win*64+sample] *= 0.370370;
		/*if( WIN % 2 == 0)
		  TDC_Calib[IPMT][ICH][win*64+sample] = time_even_m2[col][row][ch][sample];
		else
		  TDC_Calib[IPMT][ICH][win*64+sample] = time_odd_m2[col][row][ch][sample];
		if(win > 0) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M2[col][row][ch][0]%2)?
			      (time_odd_m2[col][row][ch][63] * pow(10, 9) + 0.3704):(time_even_m2[col][row][ch][63] * pow(10, 9) + 0.3704);
		if(win > 1) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M2[col][row][ch][0]%2)?
			      (time_even_m2[col][row][ch][63] * pow(10, 9) + 0.3704):(time_odd_m2[col][row][ch][63] * pow(10, 9) + 0.3704);
		if(win > 2) TDC_Calib[IPMT][ICH][win*64+sample] +=
			      (ASIC_OriginWindow_M2[col][row][ch][0]%2)?
			      (time_odd_m2[col][row][ch][63] * pow(10, 9) + 0.3704):(time_even_m2[col][row][ch][63] * pow(10, 9) + 0.3704);*/
		//cout << ADC_Calib[IPMT][ICH][win*64+sample] << " " << TDC_Calib[IPMT][ICH][win*64+sample] << endl;
	      }
	    }
	  }
	}
      }
    }
  }

  EVTTree->Fill();


  CounterID = 0;  CounterADC = TRIGGERL1[0]; CounterTDC = TRIGGERL1[1]; CounterTree->Fill();
  CounterID = 1;  CounterADC = TRIGGERL2[0]; CounterTDC = TRIGGERL2[1]; CounterTree->Fill();
  CounterID = 2;  CounterADC = TRIGGERS1[0]; CounterTDC = TRIGGERS1[1]; CounterTree->Fill();
  CounterID = 3;  CounterADC = TRIGGERS2[0]; CounterTDC = TRIGGERS2[1]; CounterTree->Fill();
  CounterID = 10; CounterADC = TIMING1[0];   CounterTDC = TIMING1[1];   CounterTree->Fill();
  CounterID = 11; CounterADC = TIMING2[0];   CounterTDC = TIMING2[1];   CounterTree->Fill();
  CounterID = 12; CounterADC = TIMING3[0][0];   CounterTDC = TIMING3[0][1];   CounterTree->Fill();
  CounterID = 13; CounterADC = TIMING3[1][0];   CounterTDC = TIMING3[1][1];   CounterTree->Fill();
  CounterID = 14; CounterADC = TIMING3[2][0];   CounterTDC = TIMING3[2][1];   CounterTree->Fill();
  CounterID = 15; CounterADC = TIMING3[3][0];   CounterTDC = TIMING3[3][1];   CounterTree->Fill();
  CounterID = 20; CounterADC = VETO1[0];     CounterTDC = VETO1[1];     CounterTree->Fill();
  CounterID = 21; CounterADC = VETO2[0];     CounterTDC = VETO2[1];     CounterTree->Fill();
  CounterID = 40; CounterADC = 0;         CounterTDC = FTSW;         CounterTree->Fill();

  return 1;
}


int DST23::GetIPMT(int mod, int col, int row){

  // output beam test ID - 1 (+ 1 applied later)
  return row/2 * 12 - col + mod * 4 + 3;
}


int DST23::GetIChannel(int row, int channel){

  // output beam test ID - 1 (+ 1 applied later)
  if      (row%2 == 0 && channel == 7) return 0;
  else if (row%2 == 0 && channel == 5) return 1;
  else if (row%2 == 0 && channel == 3) return 2;
  else if (row%2 == 0 && channel == 1) return 3;
  else if (row%2 == 0 && channel == 6) return 4;
  else if (row%2 == 0 && channel == 4) return 5;
  else if (row%2 == 0 && channel == 2) return 6;
  else if (row%2 == 0 && channel == 0) return 7;
  else if (row%2 == 1 && channel == 7) return 8;
  else if (row%2 == 1 && channel == 5) return 9;
  else if (row%2 == 1 && channel == 3) return 10;
  else if (row%2 == 1 && channel == 1) return 11;
  else if (row%2 == 1 && channel == 6) return 12;
  else if (row%2 == 1 && channel == 4) return 13;
  else if (row%2 == 1 && channel == 2) return 14;
  else if (row%2 == 1 && channel == 0) return 15;

}


void DST23::WriteDST3(string strdst3, int id_division, int ndivision){

  // part id
  stringstream ssdivision; ssdivision << id_division; string sdivision = ssdivision.str();
  if(sdivision.length() == 1) sdivision = "0" + sdivision;

  // output
  string strdst3_;
  if(ndivision == 1) strdst3_ = strdst3 + ".dst3";
  else strdst3_ = strdst3 + "p" + sdivision + ".dst3";

  char *cfdst3 = new char[strdst3_.length() + 1];
  strcpy(cfdst3, strdst3_.c_str());
  cout << endl << "Output: " << cfdst3 << endl << endl;

  fdst3 = new TFile(cfdst3, "RECREATE");

  cout << "Saving output " << cfdst3 << "..." << endl;
  CFGTree->Write();
  EVTTree->Write();
  CounterTree->Write();
  fdst3->Close();

  return;
}
