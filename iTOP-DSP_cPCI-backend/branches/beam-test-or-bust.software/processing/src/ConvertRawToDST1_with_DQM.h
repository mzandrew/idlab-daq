#ifndef PRERUNANALYZER__H
#define PRERUNANALYZER__H

#include "EventStructure.h"

#include "TCanvas.h"
#include "TTree.h"
#include "TGraph.h"
#include "TMultiGraph.h"
#include "TProfile.h"
#include "TStyle.h"

#include <string.h>

#define NUMBER_OF_SECONDS_BEFORE_CLOSING_FILE (5)
#define EVENTS_BETWEEN_UPDATE (10)

#define TEMPERATURE_SCALE_FACTOR (0.0625)
#define DAC_SCALE_FACTOR (6.105e-4)  // 2.5 V / 4095 counts (in V)
#define WILK_SCALE_FACTOR (0.32768) // (2^12 * 80) / 1e6 (in MHz)

TGraph *G_Temperature;
TGraph *G_Vdly[4][4];
TGraph *G_WilkCounter[4][4];
TMultiGraph *G_WilkCounters = NULL;
TGraph *G_VadjN[4][4];
TGraph *G_VadjP[4][4];
TProfile *P_Scalers;
TProfile *P_ScalersVersusThreshold[4][4];
TH1F *H_SampRateCounter[4][4];

EventData *E_event;

TFile *F_file;
TTree *T_event;
TTree *T_config;
//Tree branches
unsigned short int B_Temperature;

TCanvas *C_Temperature_and_Feedback;
TCanvas *C_Scalers;
TCanvas *C_ScalersVersusThreshold;

int prerun_checks(std::string, std::string);
void UpdateTemperature(); 
void UpdateWilkinsonAndVdly(); 
void UpdateSamplingRateAndVadj();
void RefreshDisplays();
void CreateVisualizationObjects();
void SetStyle();
void AppendGraphsToROOTFile(TFile *);


#endif
