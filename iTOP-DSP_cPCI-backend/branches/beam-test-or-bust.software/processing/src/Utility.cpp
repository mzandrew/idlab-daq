#include "Utility.h"
#include <iostream>
#include <ios>
#include <iomanip>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

void OpenLogFile(ifstream &logfile, unsigned int exp) {
	ostringstream temp;
	temp << RAWDATA_PATH << "/exp" << setw(2) << setfill('0') << exp << "/" << setw(4) << LOGFILE_NAME;
//	cout << "Opening logfile at: " << temp.str() << endl;
	string filename_str = temp.str();
	char temp_buffer[1024];
	sprintf(temp_buffer,"%s",filename_str.c_str());
	logfile.open( (const char *) temp_buffer , ifstream::in);
	if (!logfile) {
		cout << "ERROR: Unable to open logfile: " << temp.str() << endl;
	}
	return;
}

string NextRawFile(ifstream &logfile, unsigned int exp, unsigned int run, unsigned int &last_spill, bool &finished_spill_exists) {
	ostringstream temp;
	temp << "exp" << setw(2) << setfill('0') << exp << ".run" << setw(4) << setfill('0') << run << ".spill";
	string partial_string = temp.str();
//	cout << "Searching for " << partial_string << endl;

	char line_buffer[4096];
	
	bool found_next = false;
	string file_string = "";
	while(!found_next) {
		if (!logfile) {
//			cout << "Giving up on this logfile for now." << endl;
			break;
		}
		logfile.getline(line_buffer,4096,'\n');
		string line_str = line_buffer;
		//Skip empty lines
		if (line_str.length() == 0) {
			continue;
		}
		//Look for a space in the current line.  The filename should
		//happen before the space and the number of events after.
		string single_space = " ";
		size_t position_of_space = line_str.find(single_space);
		string filename_part;
		string number_of_events_and_run_type_part;
		string number_of_events_part;
		string run_type_part;
		if (position_of_space == string::npos) {
			continue;
		} else {
			filename_part = line_str.substr(0,position_of_space);
			number_of_events_and_run_type_part = line_str.substr(position_of_space+1,line_str.length()-1);
//			cout << "full string: " << line_str << ";" << endl;
//			cout << "filename   : " << filename_part << ";" << endl;
//			cout << "other junk : " << number_of_events_and_run_type_part << ";" << endl;
			position_of_space = number_of_events_and_run_type_part.find(single_space);
			if (position_of_space == string::npos) {
				number_of_events_part = number_of_events_and_run_type_part;
				run_type_part = "unknown";
			} else {
				number_of_events_part = number_of_events_and_run_type_part.substr(0,position_of_space);
				run_type_part = number_of_events_and_run_type_part.substr(position_of_space+1,number_of_events_and_run_type_part.length()-1);
			}
//			cout << "num events : " << number_of_events_part << ";" << endl;
//			cout << "run type   : " << run_type_part << ";" << endl;

			size_t position_of_filename_without_path = filename_part.find(partial_string);
			if (position_of_filename_without_path == string::npos) {
				continue;
			}
			string exp_run_spill_info = filename_part.substr(filename_part.length()-LENGTH_OF_FILENAMES_WITHOUT_EXTENSION);
			char exp_run_spill_buffer[1024];
			sprintf(exp_run_spill_buffer,"%s",exp_run_spill_info.c_str());
			unsigned int this_exp, this_run, this_spill;
			sscanf(exp_run_spill_buffer,"exp%2d.run%4d.spill%4d",&this_exp,&this_run,&this_spill);
//			cout << "Parsing filepart: " << exp_run_spill_buffer << endl;
			if (this_exp == exp && this_run == run && this_spill == last_spill + 1) {
				int events_this_spill = -99;
				int nmatch = sscanf(number_of_events_part.c_str(),"%d",&events_this_spill);
				if (nmatch != 1) {
					cout << "Exp " << exp << " run " << run << " still ongoing... not parsing it yet." << endl;
					cout << "filename_part: " << filename_part << ";" << endl;
					cout << "number_part  : " << number_of_events_part << ";" << endl;
					finished_spill_exists = false;
					found_next = true;
				} else {
					cout << "Exp " << this_exp << " run " << this_run << " spill " << this_spill << " has " << events_this_spill << " events." << endl;
					finished_spill_exists = true;
					last_spill++;
					file_string = filename_part;
					found_next = true;
				}
			}
		}
	}
	return file_string;

}

bool NextRunStarted(std::ifstream &logfile, unsigned int exp, unsigned int this_run) {
	ostringstream temp;
	temp << "exp" << setw(2) << setfill('0') << exp << ".run" << setw(4) << setfill('0') << this_run+1 << ".spill";
	string partial_string = temp.str();

	while (logfile) {
		char line_buffer[4096];
		logfile.getline(line_buffer,4096,'\n');
		string line_str = line_buffer;
		size_t position_of_match = line_str.find(partial_string);
		if (position_of_match != string::npos ) {
			return true;
		}
	}

	return false;

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

