#include <cctype>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <string>
#include <sys/time.h>
#include <unistd.h>

#include "crtdaq-globals.h"
#include "cprdaq.h"
#include "generic.h"
#include "config_file.h"
#include "logfile.h"
#include "run_control.h"
#include "status_file.h"
#include "commands.h"
#include "DebugInfoWarningError.h"

#ifndef NO_CAMAC
#include "CAMAC.h"
#endif //NO_CAMAC

#define MAXIMUM_NUMBER_OF_EVENTS_PER_SPILL (5000)
#define MAXIMUM_NUMBER_OF_SECONDS_PER_SPILL (43200)
#define MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR (60)

// #define MAXIMUM_NUMBER_OF_EVENTS_PER_SPILL (100)
// #define MAXIMUM_NUMBER_OF_SECONDS_PER_SPILL (43200)
// #define MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR (60)


using namespace std;

void usage() {
  cout << "usage: single_packet <slot>"
       << " [opts] " << endl;
  cout << left << setw(20) << "\t-b" << setw(50)
       << "Run in batch mode (no counter)" << endl;
  cout << left << setw(20) << "\t-o output.root" << setw(50)
       << "Write output to output.root" << endl;
}

int main(int argc, char* argv[]) {
  long max_events;
  string output_file;
  bool batch_mode = false;
  int c;

  while ((c = getopt(argc, argv, "n:o:bh")) != -1) {
    switch(c)
      {
      case 'n':
        max_events = atoi(optarg);
        break;
      case 'o':
        output_file = optarg;
        break;
      case 'b':
        batch_mode = true;
        break;
      case 'h':
        usage();
        return -2;
      case '?':
        if ((optopt == 'n') || (optopt = 'o')) {
          cout << "Option -" << optopt << " requires an argument." << endl;
          cout << "See `single_packet -h' for more." << endl;
        }
        else if (isprint(optopt)) {
          cout << "Unknown option -" << optopt << endl;
          cout << "See `single_packet -h' for more." << endl;
        }
        else {
          cout << "Unrecognized option character " << optopt << endl;
          cout << "See `single_packet -h' for more." << endl;
        }
        return 1;
      default:
        abort();
      }
  }

  if (optind == argc) {
    cout << "Please supply a configuration file." << endl;
    cout << "See `single_packet -h' for more." << endl;
    return -2;
  }


  parse_config_file(argv[optind]);

  cprdaq_init();

  open_status_file_for_reading_and_writing();
  read_status_file();

  _g_run_number++;
  _g_spill_number = 1;
  write_status_file();

  create_directory_if_necessary(_g_location_of_raw_datafiles);
  generate_new_base_filename();

  crtdaq_dump_globals();

  wait_for_all_links_to_come_up(_g_fibers_requested);

  setup_filenames_for_data();
  setup_run_type("cosmic_with_laser");
  setup_to_catch_ctrl_c();
  open_logfile();
  open_data_file();

  //  send_soft_trigger_request_command_packet();
  
  send_front_end_trigger_veto_clear();
  
  for (int i=0; i < NUMBER_OF_WORDS_IN_A_PACKET; i++) {
    cout << hex << _g_packet[i] << endl;
  }

  close_all_files();

  //  diwe_flush_all_streams();
  return EXIT_SUCCESS;

}
