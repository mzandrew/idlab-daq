#include <sstream>
#include <fcntl.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

#include "crtdaq-globals.h"
#include "cprdaq.h"

void wait_for_all_links_to_come_up(const string& fibers_reqd) {

  unsigned short link_status = cprdaq_link_status();  

  if (fibers_reqd.find("auto") != string::npos) {
    fprintf(_g_error, "Auto-detection of fibers not supported\n");
    abort();
  }

  fprintf(_g_warning, "Waiting for requested links to come up...");

  short bitmask = _g_fiber_bitmask;
  if ((link_status & bitmask) != _g_fiber_bitmask) {
    fflush(_g_warning);
    while ((link_status & bitmask) != _g_fiber_bitmask) {
      link_status = cprdaq_link_status();
      usleep(50000);
      fprintf(_g_warning, ".");
      fflush(_g_warning);
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

void close_data_file() {
  close(_g_data_fd);
}

void open_data_file() {
  if (_g_data_fd > 0)
    close_data_file();

  _g_data_fd = open(_g_data_filename.c_str(), O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);

  if (_g_data_fd < 0) {
    fprintf(_g_error, "ERROR: failed to create file \"%s\"\n", _g_data_filename.c_str());
    exit(6);
  }
  else {
    fprintf(_g_info, "Data will be written out to `%s'\n", _g_data_filename.c_str());
  }
}

void reset_trigger_flip_flop(void) {
  cprdaq_send_veto_clear();
}

void start_timer(void) {
  gettimeofday(&_g_tstart, NULL);
  gettimeofday(&_g_watchdog, NULL);
}

int stop_timer_in_seconds() {
  gettimeofday(&_g_tend, NULL);
  return _g_tend.tv_sec - _g_tstart.tv_sec;
}

int watchdog_timer_in_seconds() {
  gettimeofday(&_g_tend, NULL);
  return _g_tend.tv_sec - _g_watchdog.tv_sec;
}

void increment_spill_number() {
  _g_spill_number++;
}

void open_data_file_to_prepare_for_next_spill() {
  _g_number_of_readout_events_for_this_spill = 0;
  setup_filenames_for_data();
  open_data_file();
}

void close_data_file_to_prepare_for_next_spill() {
  close_data_file();
}

void show_temps() {
  if (_g_temperature_float == NULL) {
    fprintf(_g_warning, "%s: No temperature data available\n", __func__);
    return;
  }

  // short t = (short) _g_temperature_float[channel_number];
  // //cout << t << "C ";
  // if (t >= _g_temperature_redline) {
  //   fprintf(_g_info, "%s%2dC%s ", _g_red, t, _g_white);
  // } else {
  //   fprintf(_g_info, "%2dC ", t);
  // }
}

bool readout_an_event(bool block) {
  unsigned long buf[1024*1024];
  
  int nbytes_read = cprdaq_read_event(buf, sizeof(buf), block);
  int nbytes_written = write(_g_data_fd, buf, nbytes_read);
      
  if (nbytes_read > 0) {
    if (nbytes_written == nbytes_read) {
      _g_event_number++;
      _g_total_number_of_readout_events++;
      _g_number_of_readout_events_for_this_spill++;
      return true;
    }
    else 
      fprintf(_g_error, "%s: Read %d bytes from FIFO, but wrote %d\n",
	      __func__, nbytes_read, nbytes_written);
  }

  return false;
}


