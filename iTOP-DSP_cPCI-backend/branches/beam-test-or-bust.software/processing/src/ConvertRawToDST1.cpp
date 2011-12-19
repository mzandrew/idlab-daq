#include "EventStructure.h"
#include <iostream>
#include <string.h>

using namespace std;

int main(int argc, char *argv[]) {
	if (argc != 4 && argc != 5) {
		cout << "Syntax: RawToDST1 [raw input file] [dst1 output file] [configuration file] [(optional) SCROD ID]" << endl;
		return 1;
	}
	string str_input_filename, str_output_filename, str_config_filename;
	str_input_filename = argv[1];
	str_output_filename = argv[2];
	str_config_filename = argv[3];

	bool using_manual_scrod_id = false;
	unsigned short int manual_scrod_id = 0;
	if (argc == 5) {
		sscanf(argv[4],"%hi",&manual_scrod_id);
		using_manual_scrod_id = true;
	}
	
	ifstream fin(str_input_filename.c_str());
	if (!fin) {
		cout << "Could not open input file: " << str_input_filename.c_str() << endl;
		return 1;
	}
	
	EventData test_event;
	TFile *output_file = test_event.OpenROOTFile(str_output_filename.c_str());
	if (output_file->IsZombie()) {
		cout << "Could not open output file: " << str_output_filename.c_str() << endl;
		return 1;
	}
	

	packet_read_status this_status;
	unsigned int packet_error_flags;
	int nevents = 0;
	int status = 0;
	bool configuration_written = false;
	do {
		status = test_event.ReadEvent(fin);
		nevents += status;
		if (status == 1 && !configuration_written) {
			test_event.WriteConfigTree(str_input_filename.c_str(),str_config_filename.c_str(), using_manual_scrod_id, manual_scrod_id);
			configuration_written = true;
		}
		if (status == 1 && nevents % 100 == 0) {
			cout << "Processed event " << nevents << endl;
		}
		
	} while (status != 0);
	cout << "Read " << nevents << " events." << endl;
	test_event.CloseROOTFile();
	fin.close();
	return 0;
}
