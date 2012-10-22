#include <sstream>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>

#include "crtdaq-globals.h"
#include "cprdaq.h"

void wait_for_all_links_to_come_up(unsigned short bitmask) {
  unsigned short link_status = cprdaq_link_status();

  fprintf(_g_warning, "Waiting for requested links to come up...");

  if ((link_status & bitmask) != bitmask) {
    fflush(_g_warning);
    while ((link_status & bitmask) != bitmask) {
      link_status = cprdaq_link_status();
      usleep(50000);
      fprintf(_g_warning, ".");
    }
  }

  fprintf(_g_warning, "OK\n");
}

void readout_all_pending_data() {
  fprintf(_g_error, "`%s' returning after phony buffer flush\n",
	  __func__);
  fflush(_g_error);

  return;

  int bufsize = 1024*1024;
  u_int32_t buf[bufsize]; 
  int nbytes_read = 0;

  do 
    nbytes_read = read(_g_cprdev, (char*) buf, sizeof(buf));  
  while(nbytes_read > 0);  
}

void setup_filenames_for_data() {
  stringstream ss; 
  ss << _g_base_filename << ".cprff";
  _g_data_filename = ss.str();  
}

void setup_run_type(const string& run_type) {
  _g_run_type = run_type;
}

void open_data_file() {
  _g_data_fd = open(_g_data_filename.c_str(), O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);

  if (_g_data_fd < 0) {
    fprintf(_g_error, "ERROR: failed to create file \"%s\"\n", _g_data_filename.c_str());
    exit(6);
  } 
  else {
    fprintf(_g_info, "Data will be written out to `%s'\n", _g_data_filename.c_str());
  }
  
}
