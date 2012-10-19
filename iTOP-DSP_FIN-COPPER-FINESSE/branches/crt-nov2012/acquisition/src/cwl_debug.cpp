#include <cctype>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <string>
#include <unistd.h>

#include "crtdaq-globals.h"
#include "cprdaq.h"
#include "generic.h"
#include "config_file.h"
#include "status_file.h"

using namespace std;

void usage() {
  cout << "usage: cwl_debug"
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
          cout << "See `cwl_debug -h' for more." << endl;
        }
        else if (isprint(optopt)) {
          cout << "Unknown option -" << optopt << endl;
          cout << "See `cwl_debug -h' for more." << endl;
        }
        else {
          cout << "Unrecognized option character " << optopt << endl;
          cout << "See `cwl_debug -h' for more." << endl;
        }
        return 1;
      default:
        abort();
      }
  }

  if (optind == argc) {
    cout << "Please supply at least one input file." << endl;
    cout << "See `cwl_debug -h' for more." << endl;
    return -2;
  }

  parse_config_file(argv[optind]);

  open_status_file_for_reading_and_writing();
  read_status_file();
  
  _g_run_number++;
  _g_spill_number = 1;
  write_status_file();
  
  create_directory_if_necessary(_g_location_of_raw_datafiles);
  generate_new_base_filename();

  cprdaq_init();

  wait_for_all_links_to_come_up(_g_fin_bitmask);
  
  crtdaq_dump_globals();
  return EXIT_SUCCESS;

}
