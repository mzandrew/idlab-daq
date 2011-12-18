#include "acquisition.h"

using namespace std;

#include <iostream>

bool channel_enabled[4];
string location_of_raw_datafiles = "../logdir";
unsigned short int channel_bitmask = 0xf;
unsigned short int experiment_number = 7;
unsigned short int run_number = 8;
unsigned short int spill_number = 9;

string current_date_string;

void set_current_date_string(void) {
	char temp[256];
	time_t rawtime;
	struct tm *timeinfo;
	time(&rawtime);
	timeinfo = localtime(&rawtime);
	strftime(temp, 255, "%Y-%m-%d+%H:%M:%S", timeinfo);
	current_date_string = temp;
	cout << current_date_string << endl;
}

