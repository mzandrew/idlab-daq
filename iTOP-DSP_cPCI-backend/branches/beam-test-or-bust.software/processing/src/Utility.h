//Utility functions for parsing filenames, etc.
#ifndef UTILITY__H
#define UTILITY__H

#include <string>
#include <fstream>
#include <iostream>

//#define RAWDATA_PATH "/data/mza/rawdata"
//#define RAWDATA_PATH "/data/beamtest/rawdata"
#define RAWDATA_PATH "/data/kurtisn/rawdata"
#define LOGFILE_NAME "logfile"
#define DST_PATH "/data/kurtisn/dst1"

//Function to open the logfile for a given experiment
void OpenLogFile(std::ifstream &logfile, unsigned int exp);

//Function to find the next filename for the run of interest
std::string NextRawFile(std::ifstream &logfile, unsigned int exp, unsigned int this_run, unsigned int &last_spill);

//Generic program that searches for "spillXXXX" in the filename
//and increments the number by one.  Mainly used to keep processing
//more files without running a command for each one.
std::string GetFilenameForNextSpill(std::string original_name);

#endif
