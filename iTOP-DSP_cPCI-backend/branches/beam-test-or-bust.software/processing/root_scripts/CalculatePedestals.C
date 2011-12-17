void CalculatePedestals(char *file) {
	TFile *f1 = new TFile(file);
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
				for (int win = 0; win < 64; ++win) {
					for (int sample = 0; sample < 64; ++sample) {
						int n_this_window = n_entries_in_window[ch][win][sample];
						if (n_this_window != 0) {
							average[ch][win][sample] /= (float) n_this_window;
						}
						cout << col << "\t" << row << "\t" << ch << "\t" << win << "\t" << sample << "\t" << average[ch][win][sample] << endl;
					}
				}
			}
		}
	}

}
