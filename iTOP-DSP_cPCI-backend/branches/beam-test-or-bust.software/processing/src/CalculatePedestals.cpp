#include "EventStructure.h"
#include "TFile.h"
#include "TTree.h"
#include <iostream>
#include <string.h>

using namespace std;

int main(int argc, char *argv[]) {
	if (argc < 3 || argc > 5) {
		cout << "Syntax: CalculatePedestals [input pedestal data (ROOT)] [output pedestal file (ASCII)] [lowest window (default 0)] [highest window (default 63)]" << endl;
		return 1;
	}
	int lowest_window = 0;
	int highest_window = 63;
	string str_input_filename, str_output_filename;
	str_input_filename = argv[1];
	str_output_filename = argv[2];
	if (argc >= 4) {
		sscanf(argv[3],"%i",&lowest_window);
		if (lowest_window < 0 || lowest_window > 511) {
			cout << "Invalid selection for lowest allowed window.  Must be in the range 0-511." << endl;
			return 1;
		}
	}
	if (argc >= 5) {
		sscanf(argv[4],"%i",&highest_window);
		if (highest_window < 0 || highest_window > 511) {
			cout << "Invalid selection for highest allowed window.  Must be in the range 0-511." << endl;
			return 1;
		}
	}
	if (highest_window < lowest_window) {
		cout << "Invalid window range.  Highest window must be greater than lowest window." << endl;
		return 1;
	}

	TFile *f1 = new TFile(str_input_filename.c_str());
	if (f1->IsZombie()) {
		cout << "Couldn't open input file: " << str_input_filename.c_str() << endl;
		return 1;
	}
	ofstream fout(str_output_filename.c_str());
	if (!fout) {
		cout << "Couldn't open output file: " << str_output_filename.c_str() << endl;
		return 1;
	}

	TTree *ConfigTree = (TTree *) f1->Get("ConfigTree");
	unsigned short int ASIC_ID[4][4];
	ConfigTree->SetBranchAddress("ASIC_ID",ASIC_ID);
	ConfigTree->GetEntry(0);
	TTree *EventTree = (TTree *) f1->Get("EventTree");
	unsigned short int ASIC_ADC[4][4][8][4][64];
	unsigned short int ASIC_OriginWindow[4][4][8][4];
	EventTree->SetBranchAddress("ASIC_ADC",ASIC_ADC);
	EventTree->SetBranchAddress("ASIC_OriginWindow",ASIC_OriginWindow);
	int nentries = EventTree->GetEntries();

	for (int col = 0; col < 4; ++col) {
		for (int row = 0; row < 4; ++row) {
			int n_entries_in_window[8][512][64] = {{{0}}};
			float average[8][512][64] = {{{0}}};
			//Accumulate pedestal data with a loop over all entries
			for (int j = 0; j < nentries; ++j) {
				EventTree->GetEntry(j);
				for (int ch = 0; ch < 8; ++ch) {
					for (int win = 0; win < 4; ++win) {
						int this_window = ASIC_OriginWindow[col][row][ch][win];
						for (int sample = 0; sample < 64; ++sample) {
							average[ch][this_window][sample] += ASIC_ADC[col][row][ch][win][sample];
							n_entries_in_window[ch][this_window][sample]++;
						}
					}
				}
			}
			//Calculate pedestal data
			for (int ch = 0; ch < 8; ++ch) {
				for (int win = lowest_window; win <= highest_window; ++win) {
					for (int sample = 0; sample < 64; ++sample) {
						int n_this_window = n_entries_in_window[ch][win][sample];
						if (n_this_window != 0) {
							average[ch][win][sample] /= (float) n_this_window;
						}
//Old style where column and row are written explicitly
//						fout << col << "\t" << row << "\t" << ch << "\t" << win << "\t" << sample << "\t" << average[ch][win][sample] << endl;
//New style where we reference based on ASIC_ID
						fout << ASIC_ID[col][row] << "\t" << ch << "\t" << win << "\t" << sample << "\t" << average[ch][win][sample] << endl;
					}
				}
			}
		}
	}

	f1->Close();
	fout.close();


}
