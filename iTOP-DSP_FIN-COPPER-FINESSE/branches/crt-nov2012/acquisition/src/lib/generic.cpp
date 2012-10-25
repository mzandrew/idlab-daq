#include <algorithm>
#include <functional>
#include <cctype>
#include <locale>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/statvfs.h>
#include <signal.h>

#include "crtdaq-globals.h"
#include "cprdaq.h"
#include "generic.h"
#include "DebugInfoWarningError.h"
#include "logfile.h"
#include "run_control.h"

void graceful_exit(void) {
  update_logfile_with_the_number_of_readout_events_for_this_spill();
  close_all_files();
  exit(13);
}

void set_current_date_string(void) {
  char temp[256];
  time_t rawtime;
  struct tm *timeinfo;
  time(&rawtime);
  timeinfo = localtime(&rawtime);
  strftime(temp, 255, "%Y-%m-%d+%H:%M:%S", timeinfo);
  _g_current_date_string = temp;
}

bool file_exists (string filename) {
  struct stat buffer;
  return (stat (filename.c_str(), &buffer) == 0);
}

void create_directory_if_necessary(string dirname) {
  if (!file_exists(dirname)) {
    mkdir(dirname.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    if (!file_exists(dirname)) {
      fprintf(_g_error, "ERROR:  could not create directory \"%s\"\n",
              dirname.c_str());
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
  fprintf(_g_debug, "%llu bytes free\n", dsf);
  if (dsf < MINIMUM_DISK_SPACE_FREE_BEFORE_QUITTING) {
    fprintf(_g_error, "FATAL ERROR:  %s bytes free on disk\n",
            insert_interstitial_commas(dsf).c_str());
    graceful_exit();
  } else if (dsf < MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_AN_ERROR) {
    fprintf(_g_error, "ERROR:  %s bytes free on disk\n",
            insert_interstitial_commas(dsf).c_str());
  } else if (dsf < MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_A_WARNING) {
    fprintf(_g_warning, "WARNING:  %s bytes free on disk\n",
            insert_interstitial_commas(dsf).c_str());
  }
  return dsf;
}

void generate_new_base_filename(void) {
  set_current_date_string();
  char temp[25];
  _g_base_filename = _g_location_of_raw_datafiles;
  //create_directory_if_necessary(base_filename.c_str());
  _g_base_filename += "/";
  _g_base_filename += experiment_number_string();
  create_directory_if_necessary(_g_base_filename.c_str());
  _g_base_filename += "/";
  sprintf(temp, "e%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER, _g_experiment_number);
  _g_base_filename += temp;
  sprintf(temp, "r%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_RUN_NUMBER, _g_run_number);
  _g_base_filename += temp;
  sprintf(temp, "s%0*d", NUMBER_OF_SPACES_TO_RESERVE_FOR_SPILL_NUMBER, _g_spill_number);
  _g_base_filename += temp;
}


// Next three are taken from question 216823 on StackExchange
// trim from start
string &myltrim(string &s) {
  s.erase(s.begin(), find_if(s.begin(), s.end(), not1(ptr_fun<int, int>(isspace))));
  return s;
}

// trim from end
string &myrtrim(string &s) {
  s.erase(find_if(s.rbegin(), s.rend(), not1(ptr_fun<int, int>(isspace))).base(), s.end());
  return s;
}

// trim from both ends
string &mytrim(string &s) {
  return myltrim(myrtrim(s));
}


string insert_interstitial_commas(unsigned long long int number) {
  char temp1[21], temp2[26];
  sprintf(temp1, "%llu", number);
  int i_max = strlen(temp1);
  int j_max = i_max + (int)floor((float)(i_max-1)/3);
  int i = i_max-1;
  int j = j_max;

  temp2[j--] = 0;

  for (; i>=0; i--) {
    temp2[j] = temp1[i];
    if (!((j_max-j+1)%4)) { temp2[--j] = ','; }
    j--;
  }

  string result = temp2;
  return result;
}

void caught_ctrl_c(int sig) {
  //cout << endl << "caught ctrl-c" << endl;
  fprintf(_g_error, "caught ctrl-c\n");
  _g_call_this_on_ctrl_c();
  (void) signal(SIGINT, SIG_DFL);
  exit(0);
}

void setup_for_console_output(void) {
  sprintf(_g_red,    "%c[%d;%d;%dm", 0x1b, 0, 30 + 1, 40);
  sprintf(_g_yellow, "%c[%d;%d;%dm", 0x1b, 0, 30 + 3, 40);
  sprintf(_g_white,  "%c[%d;%d;%dm", 0x1b, 0, 30 + 7, 40);
}

void setup_to_catch_ctrl_c(void (*callback)(void)) {
  setup_for_console_output();
  //call_this_on_ctrl_c = (void *) close_all_files;
  _g_call_this_on_ctrl_c = callback;
  (void) signal(SIGINT, caught_ctrl_c);
}

void close_all_files() {
  fprintf(_g_debug, "closing all files\n");

  close_logfile();

#ifndef NO_CAMAC
  if (CAMAC_initialized) {
    close_CAMAC_controller();
    close_CAMAC_file();
    if (using_CAMAC3377) {
      close_CAMAC3377_file();
    }
  }
#endif //NO_CAMAC
  close_data_file();
  cprdaq_term();
}


  // tested with:
  //      unsigned short old_verbosity = change_verbosity(4);
  //      insert_interstitial_commas(1);
  //      insert_interstitial_commas(12);
  //      insert_interstitial_commas(123);
  //      insert_interstitial_commas(1234);
  //      insert_interstitial_commas(12345);
  //      insert_interstitial_commas(123456);
  //      insert_interstitial_commas(1234567);
  //      insert_interstitial_commas(12345678);
  //      insert_interstitial_commas(123456789);
  //      insert_interstitial_commas(1234567891);
  //      insert_interstitial_commas(12345678912ll);
  //      insert_interstitial_commas(123456789123ll);
  //      insert_interstitial_commas(1234567891234ll);
  //      insert_interstitial_commas(12345678912345ll);
  //      insert_interstitial_commas(123456789123456ll);
  //      insert_interstitial_commas(1234567891234567ll);
  //      insert_interstitial_commas(12345678912345678ll);
  //      insert_interstitial_commas(123456789123456789ll);
  //      insert_interstitial_commas(1234567891234567891ll);
  //      insert_interstitial_commas(12345678912345678912ll);
  //      change_verbosity(old_verbosity);
  //      exit(0);

