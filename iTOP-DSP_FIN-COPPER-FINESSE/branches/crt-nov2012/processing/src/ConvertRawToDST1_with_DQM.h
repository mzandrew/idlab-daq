#ifndef PRERUNANALYZER__H
#define PRERUNANALYZER__H

#include "EventStructure.h"

#include "TCanvas.h"
#include "TTree.h"
#include "TGraph.h"
#include "TLine.h"
#include "TMultiGraph.h"
#include "TH2F.h"
#include "TProfile.h"
#include "TProfile2D.h"
#include "TStyle.h"

#include <string>

#define WRITE_GRAPHS_TO_FILE 0

#define TEMPERATURE_SCALE_FACTOR (0.0625)
#define DAC_SCALE_FACTOR (6.105e-4)  // 2.5 V / 4095 counts (in V)
#define WILK_SCALE_FACTOR (0.32768) // (2^12 * 80) / 1e6 (in MHz)

#define TEMPERATURE_LIMIT (90.0)
#define TEMPERATURE_DISPLAY_MIN (30.0)
#define TEMPERATURE_DISPLAY_MAX (95.0)
#define NOMINAL_WILK_RATE (638.976) //2^12 * 80 * 1950 [1950 is target count]
#define WILK_DISPLAY_MIN (550.0)
#define WILK_DISPLAY_MAX (750.0)
#define WILK_VOLTAGE_DISPLAY_MIN (1.0)
#define WILK_VOLTAGE_DISPLAY_MAX (2.0)

#define VADJN_DISPLAY_MIN 0.60
#define VADJN_DISPLAY_MAX 0.67
#define VADJP_DISPLAY_MIN 1.96
#define VADJP_DISPLAY_MAX 2.02

TGraph *G_Temperature;
TGraph *G_Vdly[4][4];
TGraph *G_WilkCounter[4][4];
TMultiGraph *G_WilkCounters = NULL;
TGraph *G_VadjN[4][4];
TGraph *G_VadjP[4][4];
TProfile *P_Scalers;
TProfile2D *P_ScalersVersusThreshold;
TH2F *H_TriggerStreamVersusChannel;
TH1F *H_SampRateCounter[4][4];

EventData *E_event;

TFile *F_file;
TTree *T_event;
TTree *T_config;
//Tree branches
unsigned short int B_Temperature;

TCanvas *C_Temperature_and_Feedback;
TCanvas *C_EventRate;
TCanvas *C_Scalers;
TCanvas *C_ScalersVersusThreshold;
TLine *TempLimitLine;
TLine *WilkRateLine;

int prerun_checks(unsigned int, unsigned int, unsigned int, std::string, bool using_manual_scrod_id = false, unsigned short int manual_scrod_id = 0);
int this_scrod_id = 0;
void UpdateTemperature(); 
void UpdateWilkinsonAndVdly(); 
void UpdateSamplingRateAndVadj();
void UpdateScalers();
void UpdateTriggerStream();
void RefreshDisplays();
void CreateVisualizationObjects(unsigned int exp, unsigned int run, unsigned int fiber);
void SetStyle();
void AppendGraphsToROOTFile(TFile *);


#endif
