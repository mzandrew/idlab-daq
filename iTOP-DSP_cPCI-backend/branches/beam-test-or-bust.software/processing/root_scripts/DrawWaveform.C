void DrawWaveform(char *file, int event, int col, int row, int ch, char *ped_file = NULL) {
	TFile *f1 = new TFile(file);
	TTree *EventTree = (TTree *) f1->Get("EventTree");
	unsigned short int ASIC_ADC[4][4][8][4][64];
	unsigned short int ASIC_OriginWindow[4][4][8][4];
	bool ASIC_TriggerStream[4][4][8][16];
	EventTree->SetBranchAddress("ASIC_ADC",ASIC_ADC);
	EventTree->SetBranchAddress("ASIC_OriginWindow",ASIC_OriginWindow);
	EventTree->SetBranchAddress("ASIC_TriggerStream",ASIC_TriggerStream);

	float pedestal[512][64] = {{0}};
	int this_col, this_row, this_ch, this_win, this_sample;
	float this_ped;
	if (ped_file != NULL) {
		ifstream fin(ped_file);
		while (fin >> this_col >> this_row >> this_ch >> this_win >> this_sample >> this_ped) {
			if (this_col == col && this_row == row && this_ch == ch) {
				pedestal[this_win][this_sample] = this_ped;
			}
		}
		fin.close();
	}

	TCanvas *C = new TCanvas();
	while(1) {
		EventTree->GetEvent(event);
		TGraph *graph = new TGraph();
		for (int i = 0; i < 2; ++i) {
			int this_origin_window = ASIC_OriginWindow[col][row][ch][i];
			for (int j = 0; j < 64; ++j) {
				float ADC = (float) ASIC_ADC[col][row][ch][i][j];
				ADC -= pedestal[this_origin_window][j];
				graph->SetPoint(i*64+j,i*64+j,ADC);
			}
		}
		C->cd();
		graph->Draw("APL");

	double low = graph->GetYaxis()->GetXmin();
	double high = graph->GetYaxis()->GetXmax();
	for (int i = 0; i < 4*2; ++i) {
		int offset = 2;
//		cout << "Checking window " << offset + i << " : " << ASIC_TriggerStream[col][row][ch][offset+i] << endl;
		if (ASIC_TriggerStream[col][row][ch][offset+i]) {
			int window = 8 - i - 1;
			TBox *highlight = new TBox(window*32,low,(window+1)*32,high);
			highlight->SetFillColor(kRed);
			highlight->SetLineColor(kRed);
			highlight->SetLineWidth(2);
			highlight->SetFillStyle(0);
			highlight->Draw();
		}
	}
	bool any_hit = false;
	for (int i = 0; i < 16; ++i) {
		if (ASIC_TriggerStream[col][row][ch][offset+i]) {
			any_hit = true;
			break;
		}
	}
	cout << "Hit status (from trigger stream): " << any_hit << endl;
		C->Modified();
		C->Update();
		getchar();
		event++;

	}
}
