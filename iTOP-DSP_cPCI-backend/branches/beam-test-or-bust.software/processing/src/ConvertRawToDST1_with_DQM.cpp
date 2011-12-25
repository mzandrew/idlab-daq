#include "EventStructure.h"
#include "ConvertRawToDST1_with_DQM.h"
#include "Utility.h"

#include "TROOT.h"
#include "TSystem.h"
#include "TFile.h"
#include "TApplication.h"
#include "TLine.h"

#include <sstream>
#include <iomanip>
#include <ios>
#include <fstream>
#include <iostream>
#include <string>
#include <time.h>

using namespace std;

int main(int argc, char* argv[]) {
	if (argc != 5 && argc != 6) {
		cout << "Syntax: ConvertRawToDST1_with_DQM [experiment number] [run number] [fiber #] [configuration file] [(optional) SCROD ID]" << endl;
		return 1;
	}
	unsigned int experiment_to_process = 0;
	sscanf(argv[1],"%d",&experiment_to_process);
	unsigned int run_to_process = 0;
	sscanf(argv[2],"%d",&run_to_process);
	unsigned int fiber_to_process = 0;
	sscanf(argv[3],"%d",&fiber_to_process);
	string str_config_file;
	str_config_file = argv[4];

	cout << "Beginning processing of data from experiment " << experiment_to_process << " ... " << endl;

	bool using_manual_scrod_id = false;
	unsigned short int manual_scrod_id = 0;
	if (argc == 6) {
		sscanf(argv[5],"%hi",&manual_scrod_id);
		using_manual_scrod_id = true;
		this_scrod_id = manual_scrod_id;
	}

	TApplication theApp("App",&argc,argv);

	if (gROOT->IsBatch()) {
		fprintf(stderr, "%s: cannot run in batch mode\n", argv[0]);
		return 1;
	}
	
	int status = prerun_checks(experiment_to_process, run_to_process, fiber_to_process, str_config_file,using_manual_scrod_id,manual_scrod_id);
	cout << "Finished processing with status = " << status << endl;
	cout << "Display is no longer updating." << endl;
	theApp.Run();

	return 0;
}

int prerun_checks(unsigned int experiment_to_process, unsigned int run_to_process, unsigned int fiber, string str_config_file, bool using_manual_scrod_id, unsigned short int manual_scrod_id) {
	//Open the log file so we know what files to read
	ifstream logfile_in;
	OpenLogFile(logfile_in, experiment_to_process);
	if (!logfile_in) {
		cout << "ERROR: could not open experiment " << experiment_to_process << " logfile for reading." << endl;
		return 1;
	}
	
	//Find the next input raw file
	unsigned int last_spill = 0;
	ifstream fin;
	string next_filename = NextRawFile(logfile_in, experiment_to_process, run_to_process, last_spill);
	ostringstream temp1;
	temp1 << ".fiber" << fiber;
	next_filename += temp1.str();
	fin.open( (char *) next_filename.c_str() );
	//Try to open the input file and check validity
	if (!fin) {
		cout << "ERROR: could not open " << next_filename << " for reading." << endl;
		return 1;
	}

	//Try to open the output file and check validity
	ostringstream temp;
	temp << DST_PATH << "/exp" << setw(2) << setfill('0') << experiment_to_process << "/e" << setw(2) << setfill('0') << experiment_to_process << "run" << setw(4) << setfill('0') << run_to_process << "m" << fiber << ".dst1";
	string str_output_file = temp.str();
	EventData *test_event = new EventData();
	E_event = test_event;
	TFile *ROOT_file = test_event->OpenROOTFile(str_output_file.c_str() );
	if (ROOT_file->IsZombie()) {
		cout << "ERROR: could not open " << str_output_file.c_str() << " for writing." << endl;
		return 1;
	}

	//Files are open... start reading and processing
	SetStyle();
	int nevents = 0;
	bool continue_running = true;
	time_t time_of_last_successful_read = time(NULL);
	bool configuration_written = false;
	bool visualization_initialized = false;
	while(continue_running) {
		streampos starting_file_pointer = fin.tellg();
		int this_status = test_event->ReadEvent(fin);
		if (this_status == 1) {
			if (!configuration_written) {
				test_event->WriteConfigTree(next_filename.c_str(),str_config_file.c_str(),using_manual_scrod_id,manual_scrod_id);
				configuration_written = true;
				if (!using_manual_scrod_id) {
					this_scrod_id = test_event->SCROD_ID;
				}	
				if (!visualization_initialized) {
					CreateVisualizationObjects(experiment_to_process,run_to_process,fiber); 
					visualization_initialized = true;
				}
			}
			time_of_last_successful_read = time(NULL);
			nevents++;
			//Update all current graphs and other diagnostics
			UpdateTemperature();
			UpdateWilkinsonAndVdly();
			UpdateSamplingRateAndVadj();
			UpdateScalers();
			if (nevents % EVENTS_BETWEEN_UPDATE == 0) {
				RefreshDisplays();
			}
		} else {
			fin.clear();
			fin.seekg(starting_file_pointer);
			sleep(1);
		}
		//Checks to see if we've timed out on this file
		time_t time_now = time(NULL);
		if (time_now - time_of_last_successful_read > NUMBER_OF_SECONDS_BEFORE_CLOSING_FILE) {
			//If we've timed out, close the file
			fin.close();
			fin.clear();
			//And try to open a new file
			next_filename = NextRawFile(logfile_in, experiment_to_process, run_to_process, last_spill);
			next_filename += temp1.str();
			fin.open(next_filename.c_str());
			if (!fin) {
				cout << "Couldn't open next spill file: " << next_filename.c_str() << endl;
				continue_running = false;
			} else {
				continue_running = true;
				configuration_written = false;
			}
		}
		gSystem->ProcessEvents();	
	}
#if WRITE_GRAPHS_TO_FILE
	//Append graphs to the saved files
	AppendGraphsToROOTFile(ROOT_file);
#endif
	//Now close out the ROOT file
	test_event->CloseROOTFile();
	cout << "Wrote out " << nevents << " to " << str_output_file.c_str() << endl;

	//Clean up a bit
	delete test_event;

	return 0;
}

//Other functions to do updates and handle graphs/canvases/etc.
void CreateVisualizationObjects(unsigned int exp, unsigned int run, unsigned int fiber) {
	G_Temperature = new TGraph();
	G_Temperature->GetXaxis()->SetTitle("Event number");
	G_Temperature->GetYaxis()->SetTitle("Temperature (#circC)");
#if WRITE_GRAPHS_TO_FILE
	G_Temperature->SetName("G_Temperature");
#endif
	P_Scalers = new TProfile("P_Scalers","Scalers by channel",128,-0.5,127.5);
	P_Scalers->GetXaxis()->SetTitle("(COL*16+ROW*4+CH)");
	P_Scalers->GetYaxis()->SetTitle("Scaler (counts)");
	P_ScalersVersusThreshold = new TProfile2D("P_ScalersVersusThreshold","Scalers vs. threshold",128,-0.5,127.5,200,0.8,1.6);
	P_ScalersVersusThreshold->GetYaxis()->SetTitle("Threshold (V)");
	P_ScalersVersusThreshold->GetXaxis()->SetTitle("Channel (COL*16+ROW*4+CH)");
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			char name_string[1024], title_string[1024];
			sprintf(name_string,"G_Vdly_C%i_R%i",col,row);
			G_Vdly[col][row] = new TGraph();
#if WRITE_GRAPHS_TO_FILE
			G_Vdly[col][row]->SetName(name_string);
#endif
			sprintf(name_string,"G_WilkCounter_C%i_R%i",col,row);
			G_WilkCounter[col][row] = new TGraph();
#if WRITE_GRAPHS_TO_FILE
			G_WilkCounter[col][row]->SetName(name_string);
#endif
			sprintf(name_string,"G_VadjN_C%i_R%i",col,row);
			G_VadjN[col][row] = new TGraph();
#if WRITE_GRAPHS_TO_FILE
			G_VadjN[col][row]->SetName(name_string);
#endif
			sprintf(name_string,"G_VadjP_C%i_R%i",col,row);
			G_VadjP[col][row] = new TGraph();
#if WRITE_GRAPHS_TO_FILE
			G_VadjP[col][row]->SetName(name_string);
#endif
		}
	}

	char canvas_name[1024];
	sprintf(canvas_name,"Exp %02i Run %04i - Fiber %02i (SCROD %02i) - Temperature/Feedback",exp, run, fiber,this_scrod_id);
		
	Float_t small = 1e-5;
	C_Temperature_and_Feedback = new TCanvas("C_Temperature_and_Feedback",canvas_name,640,1024);
	C_Temperature_and_Feedback->Divide(1,4,small,small);
	C_Temperature_and_Feedback->cd(4)->Divide(1,2,small,small);
	C_Temperature_and_Feedback->cd(1)->SetBottomMargin(small);
	C_Temperature_and_Feedback->cd(2)->SetTopMargin(small);
	C_Temperature_and_Feedback->cd(2)->SetBottomMargin(small);
	C_Temperature_and_Feedback->cd(3)->SetTopMargin(small);
	C_Temperature_and_Feedback->cd(3)->SetBottomMargin(small);
	C_Temperature_and_Feedback->cd(4)->SetTopMargin(small);
	C_Temperature_and_Feedback->cd(4)->cd(1)->SetTopMargin(small);
	C_Temperature_and_Feedback->cd(4)->cd(1)->SetBottomMargin(small);
	C_Temperature_and_Feedback->cd(4)->cd(2)->SetTopMargin(small);

	TempLimitLine = new TLine(0,0,0,0);
	TempLimitLine->SetLineStyle(kDashed);
	TempLimitLine->SetLineWidth(3);
	TempLimitLine->SetLineColor(kRed);

	WilkRateLine = new TLine(0,0,0,0);
	WilkRateLine->SetLineStyle(kDashed);
	WilkRateLine->SetLineWidth(3);
	WilkRateLine->SetLineColor(kRed);

//	sprintf(canvas_name,"Event Rate","Event Rate - SCROD %02i",this_scrod_id);
//	C_EventRate = new TCanvas("C_EventRate",canvas_name);
//	C_EventRate->Divide(1,2);

	sprintf(canvas_name,"Exp %02i Run %04i - Fiber %02i (SCROD %02i) - Scalers",exp, run, fiber,this_scrod_id);
	C_Scalers = new TCanvas("C_Scalers",canvas_name,480,640);
	C_Scalers->Divide(1,2);
//	C_ScalersVersusThreshold = new TCanvas();
//	C_ScalersVersusThreshold->Divide(4,4);

}

void UpdateTemperature() {
	int points = G_Temperature->GetN();
	float this_temp = TEMPERATURE_SCALE_FACTOR * (float) E_event->Temperature;
	G_Temperature->SetPoint(points,E_event->EventNumber,this_temp);
	G_Temperature->SetMinimum(TEMPERATURE_DISPLAY_MIN);
	G_Temperature->SetMaximum(TEMPERATURE_DISPLAY_MAX);
}

void UpdateWilkinsonAndVdly() {
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			//First update Vdly
			int points = G_Vdly[col][row]->GetN();
			float voltage = DAC_SCALE_FACTOR * (float) E_event->ASIC_Vdly[col][row];
			G_Vdly[col][row]->SetPoint(points, E_event->EventNumber, voltage);
			//Then update the Wilkinson counter
			points = G_WilkCounter[col][row]->GetN();
			float wilk_rate = WILK_SCALE_FACTOR * (float) E_event->ASIC_WilkCounter[col][row];
			G_WilkCounter[col][row]->SetPoint(points, E_event->EventNumber, wilk_rate);
		}
	}
}

void UpdateSamplingRateAndVadj() {
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			//First update VadjN
			int points = G_VadjN[col][row]->GetN();
			float voltage = DAC_SCALE_FACTOR * (float) E_event->ASIC_VadjN[col][row];
			G_VadjN[col][row]->SetPoint(points, E_event->EventNumber, voltage);
			//Then update VadjP
			points = G_VadjP[col][row]->GetN();
			voltage = DAC_SCALE_FACTOR * (float) E_event->ASIC_VadjP[col][row];
			G_VadjP[col][row]->SetPoint(points, E_event->EventNumber, voltage);
		}
	}
}

void UpdateScalers() {
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			for (int ch = 0; ch < 8; ++ch) {
				short unsigned int raw_threshold = E_event->ASIC_TRGthresh[col][row][ch];
				float this_threshold = DAC_SCALE_FACTOR * (float) E_event->ASIC_TRGthresh[col][row][ch];
				float flattened_channel = (float) (col*32 + row*8 + ch);
				float scaler_value = E_event->ASIC_Scaler[col][row][ch];
//				cout << flattened_channel << "\t" << raw_threshold << "\t" << this_threshold << "\t" << scaler_value << endl;
				P_Scalers->Fill(flattened_channel,scaler_value);
				P_ScalersVersusThreshold->Fill(flattened_channel,this_threshold,scaler_value);
			}
		}
	}	
}

void RefreshDisplays() {
	//Update temperature
	C_Temperature_and_Feedback->cd(1);
	G_Temperature->GetXaxis()->SetTitle("Event number");
	G_Temperature->GetYaxis()->SetTitle("Temperature (#circC)");
	G_Temperature->Draw("AL");
	TempLimitLine->SetX1(G_Temperature->GetXaxis()->GetXmin());
	TempLimitLine->SetX2(G_Temperature->GetXaxis()->GetXmax());
	TempLimitLine->SetY1(TEMPERATURE_LIMIT);
	TempLimitLine->SetY2(TEMPERATURE_LIMIT);
	TempLimitLine->Draw();
	//Update Vdly and Wilkinson feedback counters
	C_Temperature_and_Feedback->cd(2);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			G_WilkCounter[col][row]->SetMarkerColor(row + 1);
			G_WilkCounter[col][row]->SetLineColor(row + 1);
			G_WilkCounter[col][row]->SetMarkerStyle(6);
			G_WilkCounter[col][row]->SetMinimum(WILK_DISPLAY_MIN);
			G_WilkCounter[col][row]->SetMaximum(WILK_DISPLAY_MAX);
			G_WilkCounter[col][row]->GetXaxis()->SetTitle("Event number");
			G_WilkCounter[col][row]->GetYaxis()->SetTitle("Wilkinson count rate (MHz)");
			char draw_flags[100];
			if (col == 0 && row == 0) {
				sprintf(draw_flags,"AL");
			} else {
				sprintf(draw_flags,"L");
			}
			G_WilkCounter[col][row]->Draw(draw_flags);
		}
	}
	WilkRateLine->SetX1(G_WilkCounter[0][0]->GetXaxis()->GetXmin());
	WilkRateLine->SetX2(G_WilkCounter[0][0]->GetXaxis()->GetXmax());
	WilkRateLine->SetY1(NOMINAL_WILK_RATE);
	WilkRateLine->SetY2(NOMINAL_WILK_RATE);
	WilkRateLine->Draw();
	C_Temperature_and_Feedback->cd(3);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			G_Vdly[col][row]->SetMarkerColor(row + 1);
			G_Vdly[col][row]->SetLineColor(row + 1);
			G_Vdly[col][row]->SetMarkerStyle(6);
			G_Vdly[col][row]->SetMinimum(WILK_VOLTAGE_DISPLAY_MIN);
			G_Vdly[col][row]->SetMaximum(WILK_VOLTAGE_DISPLAY_MAX);
			G_Vdly[col][row]->GetXaxis()->SetTitle("Event number");
			G_Vdly[col][row]->GetYaxis()->SetTitle("Wilkinson control voltage (V)");
			char draw_flags[100];
			if (col == 0 && row == 0) {
				sprintf(draw_flags,"AL");
			} else {
				sprintf(draw_flags,"L");
			}
			G_Vdly[col][row]->Draw(draw_flags);
		}
	}
	C_Temperature_and_Feedback->cd(4)->cd(1);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			G_VadjP[col][row]->SetMarkerColor(row + 1);
			G_VadjP[col][row]->SetLineColor(row + 1);
			G_VadjP[col][row]->SetMarkerStyle(6);
			G_VadjP[col][row]->SetMinimum(VADJP_DISPLAY_MIN);
			G_VadjP[col][row]->SetMaximum(VADJP_DISPLAY_MAX);
			G_VadjP[col][row]->GetXaxis()->SetTitle("Event number");
			G_VadjP[col][row]->GetYaxis()->SetTitle("VadjP (V)");
			G_VadjP[col][row]->GetYaxis()->SetTitleSize(0.16);
			G_VadjP[col][row]->GetYaxis()->SetLabelSize(0.14);
			char draw_flags[100];
			if (col == 0 && row == 0) {
				sprintf(draw_flags,"AL");
			} else {
				sprintf(draw_flags,"L");
			}
			G_VadjP[col][row]->Draw(draw_flags);
		}
	}
	C_Temperature_and_Feedback->cd(4)->cd(2);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			G_VadjN[col][row]->SetMarkerColor(row + 1);
			G_VadjN[col][row]->SetLineColor(row + 1);
			G_VadjN[col][row]->SetMarkerStyle(6);
			G_VadjN[col][row]->SetMinimum(VADJN_DISPLAY_MIN);
			G_VadjN[col][row]->SetMaximum(VADJN_DISPLAY_MAX);
			G_VadjN[col][row]->GetXaxis()->SetTitle("Event number");
			G_VadjN[col][row]->GetYaxis()->SetTitle("VadjN (V)");
			G_VadjN[col][row]->GetYaxis()->SetTitleSize(0.16);
			G_VadjN[col][row]->GetYaxis()->SetLabelSize(0.14);
			G_VadjN[col][row]->GetXaxis()->SetTitleSize(0.16);
			G_VadjN[col][row]->GetXaxis()->SetLabelSize(0.14);
			char draw_flags[100];
			if (col == 0 && row == 0) {
				sprintf(draw_flags,"AL");
			} else {
				sprintf(draw_flags,"L");
			}
			G_VadjN[col][row]->Draw(draw_flags);
		}
	}

	//Update canvas and redraw
	C_Temperature_and_Feedback->Modified();
	C_Temperature_and_Feedback->Update();


	//Update scaler info
	C_Scalers->cd(1);
	P_Scalers->Draw();
	C_Scalers->cd(2);
	P_ScalersVersusThreshold->Draw("cont1");
	C_Scalers->Modified();
	C_Scalers->Update();
//	C_ScalersVersusThreshold->Modified();
//	C_ScalersVersusThreshold->Update();
}

void SetStyle() {
	// use plain black on white colors
	gStyle->SetFrameBorderMode(0);
	gStyle->SetCanvasBorderMode(0);
	gStyle->SetPadBorderMode(0);
	gStyle->SetPadColor(0);
	gStyle->SetCanvasColor(0);
	gStyle->SetStatColor(0);
	gStyle->SetFillColor(0);	
	// set the paper & margin sizes
	gStyle->SetPaperSize(20,26);
	gStyle->SetPadTopMargin(0.05);
	gStyle->SetPadRightMargin(0.05);
	gStyle->SetPadBottomMargin(0.16);
	//gStyle->SetPadLeftMargin(0.12);
	gStyle->SetPadLeftMargin(0.2);
	// use large Times-Roman fonts
	gStyle->SetTextFont(132);
	gStyle->SetTextSize(0.08);
	gStyle->SetLabelFont(132,"x");
	gStyle->SetLabelFont(132,"y");
	gStyle->SetLabelFont(132,"z");
//	gStyle->SetLabelSize(0.05,"x");
//	gStyle->SetTitleSize(0.06,"x");
	gStyle->SetLabelSize(0.07,"x");
	gStyle->SetTitleSize(0.08,"x");
//	gStyle->SetLabelSize(0.05,"y");
//	gStyle->SetTitleSize(0.06,"y");
	gStyle->SetLabelSize(0.07,"y");
	gStyle->SetTitleSize(0.08,"y");
	gStyle->SetLabelSize(0.05,"z");
	gStyle->SetTitleSize(0.06,"z");
	// use bold lines and markers
	gStyle->SetMarkerStyle(20);
	gStyle->SetHistLineWidth(1.85);
	gStyle->SetLineStyleString(2,"[12 12]"); // postscript dashes
	gStyle->SetFrameLineWidth(2);
	// get rid of X error bars and y error bar caps
	gStyle->SetErrorX(0.001);
	// do not display any of the standard histogram decorations
	gStyle->SetOptTitle(0);
	gStyle->SetOptStat(0);
}

void AppendGraphsToROOTFile(TFile *ROOT_file) {
	ROOT_file->Append(G_Temperature);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			ROOT_file->Append(G_Vdly[col][row]);
		}
	}
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			ROOT_file->Append(G_VadjP[col][row]);
		}
	}
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			ROOT_file->Append(G_VadjN[col][row]);
		}
	}
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			ROOT_file->Append(G_WilkCounter[col][row]);
		}
	}
}
