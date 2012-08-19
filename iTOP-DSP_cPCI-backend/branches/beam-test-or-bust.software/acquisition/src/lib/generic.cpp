#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/statvfs.h>
#include "generic.h"
#include "DebugInfoWarningError.h"

string current_date_string;

void set_current_date_string(void) {
	char temp[256];
	time_t rawtime;
	struct tm *timeinfo;
	time(&rawtime);
	timeinfo = localtime(&rawtime);
	strftime(temp, 255, "%Y-%m-%d+%H:%M:%S", timeinfo);
	current_date_string = temp;
//	cout << current_date_string << endl;
}

bool file_exists (string filename) {
	// borrowed from http://stackoverflow.com/questions/230062/whats-the-best-way-to-check-if-a-file-exists-in-c-cross-platform
	struct stat buffer; 
	return (stat (filename.c_str(), &buffer) == 0);
}

void create_directory_if_necessary(string dirname) {
	if (!file_exists(dirname)) {
		//cout << "dir \"" << dirname << "\" does not exist" << endl;
		mkdir(dirname.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
		if (!file_exists(dirname)) {
			//cout << "ERROR:  could not create directory \"" << dirname << "\"" << endl;
			fprintf(error, "ERROR:  could not create directory \"%s\"\n", dirname.c_str());
			exit(10);
		}
	}
}

unsigned long long int disk_space_free(string path) {
	unsigned long long int dsf = 0; // default to saying the disk is full
	struct statvfs sfs;
	if (statvfs(path.c_str(), &sfs) != -1) {
		dsf = (unsigned long long) sfs.f_bsize * sfs.f_bfree;
	}
	fprintf(debug, "%llu bytes free\n", dsf);
	if (dsf < MINIMUM_DISK_SPACE_FREE_BEFORE_QUITTING) {
		fprintf(error, "FATAL ERROR:  %s bytes free on disk\n", insert_interstitial_commas(dsf).c_str());
		//fprintf(error, "ERROR:  %llu bytes free on disk\n", dsf);
		graceful_exit();
	} else if (dsf < MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_AN_ERROR) {
		fprintf(error, "ERROR:  %s bytes free on disk\n", insert_interstitial_commas(dsf).c_str());
		//fprintf(error, "ERROR:  %llu bytes free on disk\n", dsf);
	} else if (dsf < MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_A_WARNING) {
		fprintf(warning, "WARNING:  %s bytes free on disk\n", insert_interstitial_commas(dsf).c_str());
		//fprintf(warning, "WARNING:  %llu bytes free on disk\n", dsf);
	}
	return dsf;
}

string insert_interstitial_commas(unsigned long long int number) {
	char temp1[21], temp2[26];
	sprintf(temp1, "%llu", number);
//	fprintf(debug, "%20s: ", temp1);
	int i_max=strlen(temp1), j_max=i_max+floor((i_max-1)/3);
	int i=i_max-1, j=j_max;
	temp2[j--] = 0;
//	fprintf(debug, "[%d/%d] ", i_max, j_max);
	for (; i>=0; i--) {
//		fprintf(debug, "[%d]=%c ", i, temp1[i]);
		temp2[j] = temp1[i];
		if (!((j_max-j+1)%4)) { temp2[--j] = ','; }
		j--;
	}
//	fprintf(debug, "= [%s] \n", temp2);
	string result = temp2;
	return result;
}
// tested with:
//	unsigned short old_verbosity = change_verbosity(4);
//	insert_interstitial_commas(1);
//	insert_interstitial_commas(12);
//	insert_interstitial_commas(123);
//	insert_interstitial_commas(1234);
//	insert_interstitial_commas(12345);
//	insert_interstitial_commas(123456);
//	insert_interstitial_commas(1234567);
//	insert_interstitial_commas(12345678);
//	insert_interstitial_commas(123456789);
//	insert_interstitial_commas(1234567891);
//	insert_interstitial_commas(12345678912ll);
//	insert_interstitial_commas(123456789123ll);
//	insert_interstitial_commas(1234567891234ll);
//	insert_interstitial_commas(12345678912345ll);
//	insert_interstitial_commas(123456789123456ll);
//	insert_interstitial_commas(1234567891234567ll);
//	insert_interstitial_commas(12345678912345678ll);
//	insert_interstitial_commas(123456789123456789ll);
//	insert_interstitial_commas(1234567891234567891ll);
//	insert_interstitial_commas(12345678912345678912ll);
//	change_verbosity(old_verbosity);
//	exit(0);

