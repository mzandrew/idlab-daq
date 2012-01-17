#ifndef EVENTSTRUCTURE__H
#define EVENTSTRUCTURE__H

#include "TFile.h"
#include "TTree.h"
#include "TGraph.h"
#include "TCanvas.h"
#include <fstream>
#include <sstream>
#include <string>
#include "math.h"

using namespace std;

class DST23 {

 public:
  DST23();
  ~DST23();
  int SetInputFiles(string strdst2, string strcalib, string strcamac);
  int SetOutputFiles(string strdst3, int id_division, int ndivision);
  void SetInputTrees();
  void SetOutputTrees();
  void FillCFGTree(int id_division);
  int TransformEVTTree(int evt);
  void WriteDST3(string strdst3, int id_division, int ndivision);

  // Total number of events
  int nevents;

  // Filename for calibration
  char *CalibFilename; // DST3.

  // Existing module ID;
  // 1: module 0
  // 2: module 1
  // 4: module 2
  // 3: modules 0 + 1
  // 5: modules 0 + 2
  // 6: modules 1 + 2
  // 7: modules 0 + 1 + 2
  int exist_module;

 private:

  // Functions
  void SetTreeDST2();
  void SetTreeCalib();
  void SetTreeCAMAC();
  void SetTreeDST3();
  char* SetOutputFilename(string strdst3, int id_division);
  int GetIPMT(int mod, int col, int row); // beam test ID -1
  int GetIChannel(int row, int channel); // beam test ID - 1

  // Files
  string strdst2;
  string strcalib;
  string strcamac;
  string strdst3;
  TFile *fdst2m0;
  TFile *fdst2m1;
  TFile *fdst2m2;
  TFile *fcalibm0;
  TFile *fcalibm1;
  TFile *fcalibm2;
  TFile *fcamac;
  TFile *fdst3;

  // Trees for DST2
  TTree *ConfigTree;
  TTree *EventTreeM0;
  TTree *EventTreeM1;
  TTree *EventTreeM2;

  // Trees for Calibration
  TTree *ChargeCalibTreeM0;
  TTree *ChargeCalibTreeM1;
  TTree *ChargeCalibTreeM2;
  TTree *TimeCalibTreeM0;
  TTree *TimeCalibTreeM1;
  TTree *TimeCalibTreeM2;

  // Tree of CAMAC
  TTree *CAMACTree;

  // Trees for DST3
  TTree *CFGTree;
  TTree *EVTTree;
  TTree *CounterTree;

  // Variables for the simple static tree
  unsigned int ExpNumber; // DST2 and DST3.
  unsigned int RunNumber; // DST2 and DST3.
  unsigned int NEvents; // DST3.
  unsigned short int PMT_ID[24]; // DST3.
  unsigned short int Channel_ID[16]; // DST3.
  unsigned short int ASIC_ID[4][4]; // DST2 and DST3.
  char *PedestalFilename; // DST2 and DST3.
  unsigned int NCounters; // DST3.
  unsigned int NTrackers; // DST3.

  // Variables for the event tree
  unsigned int EventNumberM0; // DST2.
  unsigned int EventNumberM1; // DST2.
  unsigned int EventNumberM2; // DST2.
  bool flag_nevents; // 1 if nevents are same for all modules.
  unsigned int EventNumber; // DST3.
  float ASIC_ADC_M0[4][4][8][4][64]; // DST2.
  float ASIC_ADC_M1[4][4][8][4][64]; // DST2.
  float ASIC_ADC_M2[4][4][8][4][64]; // DST2.
  unsigned short int ASIC_OriginWindow_M0[4][4][8][4]; // DST2.
  unsigned short int ASIC_OriginWindow_M1[4][4][8][4]; // DST2.
  unsigned short int ASIC_OriginWindow_M2[4][4][8][4]; // DST2.
  float ADC_Calib[24][16][256]; // DST3.
  float TDC_Calib[24][16][256]; // DST3.
  unsigned int OriginWindow;

  // Variables for calibration
  float q_factor_m0[4][4][8][64][64];
  float q_factor_m1[4][4][8][64][64];
  float q_factor_m2[4][4][8][64][64];
  float time_odd_m0[4][4][8][64];
  float time_even_m0[4][4][8][64];
  float time_odd_m1[4][4][8][64];
  float time_even_m1[4][4][8][64];
  float time_odd_m2[4][4][8][64];
  float time_even_m2[4][4][8][64];

  // Variables for camac tree
  unsigned int CAMEventNumber;
  unsigned int TRIGGERL1[2]; // 0: charge, 1: time
  unsigned int TRIGGERL2[2]; // 0: charge, 1: time
  unsigned int TRIGGERS1[2]; // 0: charge, 1: time
  unsigned int TRIGGERS2[2]; // 0: charge, 1: time
  unsigned int TIMING1[2]; // 0: charge, 1: time
  unsigned int TIMING2[2]; // 0: charge, 1: time
  unsigned int TIMING3[4][2]; // former: channel ID, latter: charge/time ID
  unsigned int FTSW;
  unsigned int VETO1[2]; // 0: Charge, 1: Time
  unsigned int VETO2[2]; // 0: Charge, 1: Time
  unsigned int QCP;
  unsigned int CounterID;
  unsigned int CounterADC;
  unsigned int CounterTDC;

};

#else
#endif
