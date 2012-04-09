
#ifndef EVENTSTRUCTURE__H
#define EVENTSTRUCTURE__H

#include "TROOT.h"
#include "TStyle.h"
#include "TFile.h"
#include "TChain.h"
#include "TTree.h"
#include "TGraph.h"
#include "TH1F.h"
#include "TLatex.h"
#include "TCanvas.h"
#include <fstream>
#include <sstream>
#include <string>
#include <map>

using namespace std;

class DST34 {

 public:
  DST34();
  ~DST34();
  int SetFiles(string strdst3, string strdst4);
  void SetThreshold(float thr);
  void SetDebug(int debug_flag);
  void SetTrees();
  void FillRunTree(string strfile);
  void FillPhotonTree(int evt);
  void FillCounterTree();
  void WriteDST4(string strfile);

  // Total number of events
  int nevents;

  // Threshold of photon search, DST4.
  float threshold;

  // Debug flag
  int debug_flag;

 private:

  // Functions
  void SetTreeDST3();
  void SetTreeDST4();
  void ReadChannelQuality();

  // Files
  string strdst3;
  string strdst4;
  TFile *fdst3;
  TFile *fdst4;

  // Trees for DST3
  TTree *CFGTree;
  TTree *EVTTree;
  TTree *CNTTree;

  // Trees for DST4
  TTree *RunTree;
  TTree *EventTree;
  TTree *PhotonTree;
  TTree *CounterTree;

  // Variables for CFGTree and RunTree
  unsigned int ExpNumber; // DST3 and DST4.
  unsigned int RunNumber; // DST3 and DST4.
  unsigned int NEvents; // DST3 and DST4.
  unsigned short int PMT_ID[24]; // DST3 and DST4.
  unsigned short int Channel_ID[16]; // DST3 and DST4.
  unsigned short int ASIC_ID[4][4]; // DST3 and DST4.
  unsigned int DataType; // DST4.
  float BeamAngle[2]; // DST4.
  char *PedestalFilename; // DST3 and DST4.
  char *CalibFilename; // DST3 and DST4.
  unsigned int NCounters, NTrackers;

  // Variables for EVTTree and EventTree
  unsigned int EventNumber; // DST3 and DST4.
  unsigned int OriginWindow; // DST3 and DST4.
  float ADC_Calib[24][16][256]; // DST3 and DST4.
  float TDC_Calib[24][16][256]; // DST3 and DST4.
  int nhit;

  // Variables for PhotonTree
  unsigned short int pmtid, chid, gid; // DST4.
  unsigned short int windowid, sampleid; // DST4.
  float time, timewm, timepeak; // DST4.
  float charge6, charge8, charge20; // DST4.
  float abscharge6, abscharge8, abscharge20; // DST4.
  unsigned short int noverth5, noverth10, noverth15; // DST4.
  float sumwindow; // DST4.
  float sumabswindow; // DST4.

  // Variables related to CFGTree
  int ncounters;
  unsigned int CounterID;
  unsigned int CounterADC;
  unsigned int CounterTDC;
  float FTSW;
  float TriggerL1;  unsigned short int QTriggerL1;
  float TriggerL2;  unsigned short int QTriggerL2;
  float TriggerS1;  unsigned short int QTriggerS1;
  float TriggerS2;  unsigned short int QTriggerS2;
  float Timing1;  unsigned short int QTiming1;
  float Timing2;  unsigned short int QTiming2;
  float Timing3[4];  unsigned short int QTiming3[4];
  float Veto1;  unsigned short int QVeto1;
  float Veto2;  unsigned short int QVeto2;

  // Channel quality
  unsigned short int ChannelQualityGary[24][16];
  unsigned short int CQGary;
  //  0: good channel
  //  1: bad channel
  unsigned short int ChannelQualityHirose[24][16];
  unsigned short int CQHirose;
  //  0: good channel.
  //  2: may be used.
  //  4: special treatment to be used. (16 x i bad channels.)
  //  6: bad to be used.
  //  8: should not be used.
  // 10: not implemented.

  // For debug mode
  TCanvas* Canvas;
  TH1F* waku;

};

#else
#endif
