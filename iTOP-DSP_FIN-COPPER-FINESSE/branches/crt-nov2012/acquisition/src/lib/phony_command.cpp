#include <cstdio>

#include "crtdaq-globals.h"

void set_start_and_end_windows(unsigned long int start_window, unsigned long int end_window) {
  if (start_window%2!=0) {
    fprintf(_g_error, "ERROR:  start_window must be even (trying to set it to %ld)\n", start_window);
    exit(7);
  }
  if (end_window%2==0) {
    fprintf(_g_error, "ERROR:  end_window must be odd (trying to set it to %ld)\n", end_window);
    exit(8);
  }
  if (start_window>end_window) {
    fprintf(_g_error, "ERROR:  start_window (%ld) must be less than end_window (%ld)\n", start_window, end_window);
    exit(9);
  }

  fprintf(_g_debug, "setting start_window to %ld\n", start_window);
  send_command_packet_to_all_enabled_channels(0x000001ff, start_window); // set start window
  usleep(10000);
  fprintf(_g_debug, "setting end_window to %ld\n", end_window);
  send_command_packet_to_all_enabled_channels(0x000101ff, end_window); // set end window
}
