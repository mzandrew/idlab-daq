#include "EventStructure.h"
#include "ConvertRawToDST1_with_DQM.h"

#include "TROOT.h"
#include "TSystem.h"
#include "TFile.h"
#include "TApplication.h"

#include <fstream>
#include <iostream>
#include <string.h>
#include <time.h>

using namespace std;

int main(int argc, char* argv[]) {
	if (argc != 4 && argc != 5) {
		cout << "Syntax: ConvertRawToDST1_with_DQM [input file name (raw data)] [output file name (ROOT)] [configuration file] [(optional) SCROD ID]" << endl;
		return 1;
	}
	string str_input_file, str_output_file, str_config_file;
	str_input_file = argv[1];
	str_output_file = argv[2];	
	str_config_file = argv[3];

	bool using_manual_scrod_id = false;
	unsigned short int manual_scrod_id = 0;
	if (argc == 5) {
		sscanf(argv[4],"%hi",&manual_scrod_id);
		using_manual_scrod_id = true;
	}

	TApplication theApp("App",&argc,argv);

	if (gROOT->IsBatch()) {
		fprintf(stderr, "%s: cannot run in batch mode\n", argv[0]);
		return 1;
	}
	
	int status = prerun_checks(str_input_file,str_output_file,str_config_file,using_manual_scrod_id,manual_scrod_id);
	cout << "Finished processing with status = " << status << endl;
	cout << "Display is no longer updating." << endl;
	theApp.Run();

	return 0;
}

int prerun_checks(string str_input_file, string str_output_file, string str_config_file, bool using_manual_scrod_id, unsigned short int manual_scrod_id) {
	//Try to open the input file and check validity
	ifstream fin(str_input_file.c_str());
	if (!fin) {
		cout << "ERROR: could not open " << str_input_file.c_str() << " for reading." << endl;
		return 1;
	}
	//Try to open the output file and check validity
	EventData *test_event = new EventData();
	E_event = test_event;
	TFile *ROOT_file = test_event->OpenROOTFile(str_output_file.c_str() );
	if (ROOT_file->IsZombie()) {
		cout << "ERROR: could not open " << str_output_file.c_str() << " for writing." << endl;
		return 1;
	}

	//Files are open... start reading and processing
	SetStyle();
	CreateVisualizationObjects(); 
	int nevents = 0;
	bool continue_running = true;
	time_t time_of_last_successful_read = time(NULL);
	bool configuration_written = false;
	while(continue_running) {
		streampos starting_file_pointer = fin.tellg();
		int this_status = test_event->ReadEvent(fin);
		if (this_status == 1) {
			if (!configuration_written) {
				test_event->WriteConfigTree(str_input_file.c_str(),str_config_file.c_str(),using_manual_scrod_id,manual_scrod_id);
				configuration_written = true;
			}
			time_of_last_successful_read = time(NULL);
			nevents++;
			//Update all current graphs and other diagnostics
			UpdateTemperature();
			UpdateWilkinsonAndVdly();
			UpdateSamplingRateAndVadj();
			if (nevents % EVENTS_BETWEEN_UPDATE == 0) {
				RefreshDisplays();
			}
		} else {
			fin.clear();
			fin.seekg(starting_file_pointer);
			sleep(1);
		}
		time_t time_now = time(NULL);
		if (time_now - time_of_last_successful_read > NUMBER_OF_SECONDS_BEFORE_CLOSING_FILE) {
			continue_running = false;
		}
		gSystem->ProcessEvents();	
	}
	//Append graphs to the saved files
	AppendGraphsToROOTFile(ROOT_file);
	//Now close out the ROOT file
	test_event->CloseROOTFile();
	cout << "Wrote out " << nevents << " events from " << str_output_file.c_str() << " to " << str_output_file.c_str() << endl;

	//Clean up a bit
	delete test_event;
	fin.close();

	return 0;
}

//Other functions to do updates and handle graphs/canvases/etc.
void CreateVisualizationObjects() {
	G_Temperature = new TGraph();
	G_Temperature->GetXaxis()->SetTitle("Event number");
	G_Temperature->GetYaxis()->SetTitle("Temperature (#circC)");
	G_Temperature->SetName("G_Temperature");
	P_Scalers = new TProfile("P_Scalers","Scalers by channel",128,-0.5,127.5);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			char name_string[1024], title_string[1024];
			sprintf(name_string,"G_Vdly_C%i_R%i",col,row);
			G_Vdly[col][row] = new TGraph();
			G_Vdly[col][row]->SetName(name_string);
			sprintf(name_string,"G_WilkCounter_C%i_R%i",col,row);
			G_WilkCounter[col][row] = new TGraph();
			G_WilkCounter[col][row]->SetName(name_string);
			sprintf(name_string,"G_VadjN_C%i_R%i",col,row);
			G_VadjN[col][row] = new TGraph();
			G_VadjN[col][row]->SetName(name_string);
			sprintf(name_string,"G_VadjP_C%i_R%i",col,row);
			G_VadjP[col][row] = new TGraph();
			G_VadjP[col][row]->SetName(name_string);
			sprintf(name_string,"P_ScalersVersusThreshold_C%i_R%i",col,row);
			sprintf(title_string,"Scalers vs. threshold (COL %i) (ROW) %i",col,row);
			P_ScalersVersusThreshold[col][row] = new TProfile(name_string,title_string,4095,0,2.5);
		}
	}
		
	Float_t small = 1e-5;
	C_Temperature_and_Feedback = new TCanvas("C_Temperature_and_Feedback","Temperature/Feedback - Module XX",640,1024);
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

//	C_Scalers = new TCanvas();
//	C_ScalersVersusThreshold = new TCanvas();
//	C_ScalersVersusThreshold->Divide(4,4);

}

void UpdateTemperature() {
	int points = G_Temperature->GetN();
	float this_temp = TEMPERATURE_SCALE_FACTOR * (float) E_event->Temperature;
	G_Temperature->SetPoint(points,E_event->EventNumber,this_temp);
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


void RefreshDisplays() {
	//Update temperature
	C_Temperature_and_Feedback->cd(1);
	G_Temperature->GetXaxis()->SetTitle("Event number");
	G_Temperature->GetYaxis()->SetTitle("Temperature (#circC)");
	G_Temperature->Draw("AL");
	//Update Vdly and Wilkinson feedback counters
	C_Temperature_and_Feedback->cd(2);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			G_WilkCounter[col][row]->SetMarkerColor(row + 1);
			G_WilkCounter[col][row]->SetLineColor(row + 1);
			G_WilkCounter[col][row]->SetMarkerStyle(6);
			G_WilkCounter[col][row]->SetMinimum(550.0);
			G_WilkCounter[col][row]->SetMaximum(750.0);
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
	C_Temperature_and_Feedback->cd(3);
	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			G_Vdly[col][row]->SetMarkerColor(row + 1);
			G_Vdly[col][row]->SetLineColor(row + 1);
			G_Vdly[col][row]->SetMarkerStyle(6);
			G_Vdly[col][row]->SetMinimum(1.0);
			G_Vdly[col][row]->SetMaximum(1.5);
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
			G_VadjP[col][row]->SetMinimum(1.96);
			G_VadjP[col][row]->SetMaximum(1.99);
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
			G_VadjN[col][row]->SetMinimum(0.64);
			G_VadjN[col][row]->SetMaximum(0.67);
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


//	C_Scalers->Modified();
//	C_Scalers->Update();
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
