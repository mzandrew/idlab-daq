#include "Utility.h"
#include <iostream>
#include <ios>
#include <iomanip>
#include <sstream>
#include <stdio.h>

using namespace std;

void OpenLogFile(ifstream &logfile, unsigned int exp) {
	ostringstream temp;
	temp << RAWDATA_PATH << "/exp" << setw(2) << setfill('0') << exp << "/" << setw(4) << LOGFILE_NAME;
	cout << "Opening logfile at: " << temp.str() << endl;
	string filename_str = temp.str();
	char temp_buffer[1024];
	sprintf(temp_buffer,"%s",filename_str.c_str());
	logfile.open( (const char *) temp_buffer , ifstream::in);
	if (!logfile) {
		cout << "Unable to open logfile!" << endl;
	}
	return;
}

string NextRawFile(ifstream &logfile, unsigned int exp, unsigned int run, unsigned int &last_spill) {
	ostringstream temp;
	temp << "exp" << setw(2) << setfill('0') << exp << ".run" << setw(4) << setfill('0') << run << ".spill";
	string partial_string = temp.str();
	cout << "Searching for " << partial_string << endl;

	char line_buffer[4096];
	
	bool found_next = false;
	string file_string = "";
	while(!found_next) {
		if (!logfile) {
			cout << "Giving up on this logfile." << endl;
			break;
		}
		logfile.getline(line_buffer,4096,'\n');
		string line_str = line_buffer;
		if (line_str.length() == 0) {
			continue;
		}

		size_t position_of_match = line_str.find(partial_string);
		string exp_run_spill_info;
//		cout << "Checking line: " << line_str << endl;
		if (position_of_match == string::npos ) {
			continue;
		} else {
			exp_run_spill_info = line_str.substr(position_of_match,50);
//			cout << "Found a match" << endl;
		}
		char parse_buffer[1024];
		if (position_of_match != string::npos ) {
			sprintf(parse_buffer,"%s",exp_run_spill_info.c_str());
		}
		unsigned int this_exp, this_run, this_spill;
		sscanf(parse_buffer,"exp%2d.run%4d.spill%4d",&this_exp,&this_run,&this_spill);
//		cout << this_exp << "\t" << this_run << "\t" << this_spill << endl;
		if (this_exp == exp && this_run == run && this_spill == last_spill + 1) {
			file_string = line_str.substr(0,position_of_match+43);
			found_next = true;
		}
	}

	if (found_next == false) {
		cout << "Coudln't find another file in this run!" << endl;
		file_string = "";
	} else {
		cout << "Trying to open file for spill with base name: " << file_string << endl;
		last_spill++;
	}

	return file_string;

}

string GetFilenameForNextSpill(string original_name) {
	string spill_string = "spill";
	size_t position_of_match = original_name.find(spill_string);
	string spill_part = original_name.substr(position_of_match, 9);

	string spill_number = spill_part.substr(5,4);
	unsigned int this_spill_number = 0;
	sscanf( spill_number.c_str(), "%04d", &this_spill_number);
	unsigned int next_spill_number = this_spill_number + 1;
	ostringstream temp;
	temp << spill_string << setw(4) << setfill('0') << next_spill_number;
	string next_spill_part = temp.str();

	string first_part = original_name.substr(0,(int) position_of_match);
	string last_part = original_name.substr(position_of_match+9,original_name.length());
	string output_filename = first_part + next_spill_part + last_part;
	return output_filename;
}

