#include "CamacStructure.h"
#include "Utility.h"

#include "TROOT.h"
#include "TSystem.h"
#include "TFile.h"
#include "TStyle.h"
#include "TApplication.h"

#include <sstream>
#include <iomanip>
#include <ios>
#include <fstream>
#include <iostream>
#include <string>
#include <time.h>

using namespace std;

CamacData *E_event;
TFile *F_file;
TTree *T_event;
TTree *T_config;
TCanvas *C_Camac;
int camac_conversion(unsigned int experiment_to_process, unsigned int run_to_process);
void CreateVisualizationObjects(unsigned int exp, unsigned int run);
void RefreshDisplays();
void SetStyle();

int main(int argc, char* argv[]) {
	if (argc != 3) {
		cout << "Syntax: ConvertCamacToROOT [experiment number] [run number]" << endl;
		return 1;
	}
	unsigned int experiment_to_process = 0;
	sscanf(argv[1],"%d",&experiment_to_process);
	unsigned int run_to_process = 0;
	sscanf(argv[2],"%d",&run_to_process);

	cout << "Beginning processing of CAMAC data from experiment " << experiment_to_process << " ... " << endl;

//	TApplication theApp("App",&argc,argv);
//
//	if (gROOT->IsBatch()) {
//		fprintf(stderr, "%s: cannot run in batch mode\n", argv[0]);
//		return 1;
//	}
//	
	int status = camac_conversion(experiment_to_process, run_to_process);
	cout << "Finished processing with status = " << status << endl;
//	cout << "Display is no longer updating." << endl;
//	theApp.Run();

	return 0;
}

int camac_conversion(unsigned int experiment_to_process, unsigned int run_to_process) {
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
	bool finished_spill_exists = false;
	string next_filename = NextRawFile(logfile_in, experiment_to_process, run_to_process, last_spill, finished_spill_exists);
	if (!finished_spill_exists) {
		cout << "ERROR: no spills appear to be ready yet... try again soon." << endl;
		return 1;
	}
	ostringstream temp1;
	temp1 << ".camac";
	next_filename += temp1.str();
	fin.open( (char *) next_filename.c_str() );
	//Try to open the input file and check validity
	if (!fin) {
		cout << "ERROR: could not open " << next_filename << " for reading." << endl;
		return 1;
	}

	//Try to open the output file and check validity
	ostringstream temp;
	temp << DST_PATH << "/exp" << setw(2) << setfill('0') << experiment_to_process << "/e" << setw(2) << setfill('0') << experiment_to_process << "run" << setw(4) << setfill('0') << run_to_process << ".camac";
	string str_output_file = temp.str();
	CamacData *test_event = new CamacData();
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
				test_event->WriteConfigTree(next_filename.c_str());
				configuration_written = true;
				if (!visualization_initialized) {
					CreateVisualizationObjects(experiment_to_process,run_to_process); 
					visualization_initialized = true;
				}
			}
			time_of_last_successful_read = time(NULL);
			nevents++;
			//Update all current graphs and other diagnostics
			/*   */
			///////
			if (nevents % EVENTS_BETWEEN_UPDATE == 0) {
				RefreshDisplays();
			}
		} else {
			fin.clear();
			fin.seekg(starting_file_pointer);
			sleep(1);
		}
		//Checks to see if we've timed out on this file
		//Checks to see if we've timed out on this file
		time_t time_now = time(NULL);
		if (time_now - time_of_last_successful_read > NUMBER_OF_SECONDS_BEFORE_GIVING_UP_ON_RUN) {
			cout << "It appears run " << run_to_process << " has ended... closing out." <<endl;
			continue_running = false;
		} else if (time_now - time_of_last_successful_read > NUMBER_OF_SECONDS_BEFORE_CLOSING_FILE) {
			//If we've timed out, write the scalers and close the file
			fin.close();
			fin.clear();

			bool try_to_open_new_file = true;
			while (try_to_open_new_file) {
				//And try to open a new file
				logfile_in.close();
				logfile_in.clear();
				OpenLogFile(logfile_in, experiment_to_process);
				finished_spill_exists = false;
				next_filename = NextRawFile(logfile_in, experiment_to_process, run_to_process, last_spill, finished_spill_exists);
				if (finished_spill_exists) {
					next_filename += temp1.str();
					cout << "Found a new completed spill at: " << next_filename << endl;
					time_of_last_successful_read = time(NULL);
					fin.open(next_filename.c_str());
					if (fin) {
						cout << next_filename << " opened and ready for reading." << endl;
						configuration_written = false;
						continue_running = true;
						try_to_open_new_file = false;
					} else {
						cout << next_filename << " had error status on opening." << endl;
						cout << "Closing it and trying again." << endl;
						fin.close();
						continue_running = true;
						try_to_open_new_file = true;
					} 
				} else {
					cout << "Waiting 20 seconds..." << endl;
//					cout << "Last good spill was: " << last_spill << endl;
					for (int wait = 0; wait < 20; ++wait) {
						RefreshDisplays();
						sleep(1);
						gSystem->ProcessEvents();	
					}
					continue_running = true;
					try_to_open_new_file = true;
				}
			}
			gSystem->ProcessEvents();	
		}
		gSystem->ProcessEvents();	
	}
	//Now close out the ROOT file
	test_event->CloseROOTFile();
	cout << "Wrote out " << nevents << " events to " << str_output_file.c_str() << endl;

	//Clean up a bit
	delete test_event;

	return 0;
}

//Other functions to do updates and handle graphs/canvases/etc.
void CreateVisualizationObjects(unsigned int exp, unsigned int run) {

}

void RefreshDisplays() {

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

