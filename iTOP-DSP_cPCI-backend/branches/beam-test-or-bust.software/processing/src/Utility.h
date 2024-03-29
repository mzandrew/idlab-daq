//Utility functions for parsing filenames, etc.
#ifndef UTILITY__H
#define UTILITY__H

#include <string>
#include <fstream>
#include <iostream>

//#define RAWDATA_PATH "/data/kurtisn/rawdata"
//#define DST_PATH "/data/kurtisn/dst1"
#define RAWDATA_PATH "/data/beamtest/rawdata"
#define DST_PATH "/data/beamtest/dst1"
#define LOGFILE_NAME "logfile"

#define LENGTH_OF_FILENAMES_WITHOUT_EXTENSION (43)
#define NUMBER_OF_SECONDS_BEFORE_CLOSING_FILE (2)
#define NUMBER_OF_SECONDS_BEFORE_GIVING_UP_ON_RUN (120)
#define EVENTS_BETWEEN_UPDATE (10)
#define SECONDS_TO_WAIT_BEFORE_TRYING_TO_REOPEN_LOGFILE (1)

//Function to open the logfile for a given experiment
void OpenLogFile(std::ifstream &logfile, unsigned int exp);

//Function to find the next filename for the run of interest
std::string NextRawFile(std::ifstream &logfile, unsigned int exp, unsigned int this_run, unsigned int &last_spill, bool &last_spill_finished);

//Function to check if next run or experiment is available
bool NextRunStarted(std::ifstream &logfile, unsigned int exp, unsigned int this_run);

//Generic program that searches for "spillXXXX" in the filename
//and increments the number by one.  Mainly used to keep processing
//more files without running a command for each one.
std::string GetFilenameForNextSpill(std::string original_name);

#endif
