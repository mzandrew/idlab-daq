void DrawWaveform(char *file, int event, int col, int row, bool common_mode_subtract = false) {
	TFile *f1 = new TFile(file);
	TTree *EventTree = (TTree *) f1->Get("EventTree");
	float ASIC_ADC[4][4][8][4][64];
	unsigned short int ASIC_OriginWindow[4][4][8][4];
	bool ASIC_TriggerStream[4][4][8][16];
	EventTree->SetBranchAddress("ASIC_ADC",ASIC_ADC);
	EventTree->SetBranchAddress("ASIC_OriginWindow",ASIC_OriginWindow);
	EventTree->SetBranchAddress("ASIC_TriggerStream",ASIC_TriggerStream);

	TCanvas *C = new TCanvas("Waveforms","Waveforms",1024,768);
	C->Divide(4,2);
	TGraph *graph[8];
	while(1) {
		EventTree->GetEvent(event);
		for (int i = 0; i < 8; ++i) {
			graph[i] = NULL;
		}
		for (int ch = 0; ch < 8; ++ch) {
			if (graph[ch]) {
				delete graph[ch];
			}
			graph[ch] = new TGraph();
			for (int i = 0; i < 4; ++i) {
				int this_origin_window = ASIC_OriginWindow[col][row][ch][i];
				for (int j = 0; j < 64; ++j) {
					float value = ASIC_ADC[col][row][ch][i][j];
					if (common_mode_subtract) {
						value -= ASIC_ADC[col][row][(ch+1)%8][i][j];
					}
					graph[ch]->SetPoint(i*64+j,(float) i*64+j,value);
				}
			}
			C->cd(ch+1);
			graph[ch]->Draw("APL");

			double low = graph[ch]->GetYaxis()->GetXmin();
			double high = graph[ch]->GetYaxis()->GetXmax();
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
			cout << "Window begin at: " << ASIC_OriginWindow[col][row][ch][0] << endl;
			cout << "Hit status (from trigger stream): " << any_hit << endl;
		}
		C->Modified();
		C->Update();
		getchar();
		event++;
	}
}
