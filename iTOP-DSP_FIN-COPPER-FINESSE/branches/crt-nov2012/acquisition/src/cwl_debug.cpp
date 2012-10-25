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

// #define MAXIMUM_NUMBER_OF_EVENTS_PER_SPILL (5000)
// #define MAXIMUM_NUMBER_OF_SECONDS_PER_SPILL (43200)
// #define MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR (60)

#define MAXIMUM_NUMBER_OF_EVENTS_PER_SPILL (100)
#define MAXIMUM_NUMBER_OF_SECONDS_PER_SPILL (43200)
#define MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR (60)


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

  cprdaq_init();

  open_status_file_for_reading_and_writing();
  read_status_file();

  _g_run_number++;
  _g_spill_number = 1;
  write_status_file();

  create_directory_if_necessary(_g_location_of_raw_datafiles);
  generate_new_base_filename();

  crtdaq_dump_globals();

  wait_for_all_links_to_come_up(_g_fin_bitmask);

  readout_all_pending_data();

  setup_filenames_for_data();

#ifndef NO_CAMAC
  if (init_CAMAC_controller()) {
    cerr << "ERROR:  could not connect to CAMAC crate" << endl;
    exit(7);
  } else {
    cout << "CAMAC initialized." << endl;
    CAMAC_initialized = true;
  }
  if (CAMAC_initialized) {
    cout << "opening CAMAC files..." << endl;
    open_CAMAC_file();
    if (using_CAMAC3377) {
      CAMAC_initialize_3377s();
      open_CAMAC3377_file();
    }
  }
#endif //NO_CAMAC

  setup_run_type("cosmic_with_laser");
  setup_to_catch_ctrl_c();
  open_logfile();
  open_data_file();

  unsigned short winbeg = 0;
  unsigned short winend = 63;

  set_start_and_end_windows(winbeg, winend);
  usleep(50000);

  set_number_of_windows_to_look_back(18);
  usleep(50000);

  set_event_number(_g_event_number);
  send_front_end_trigger_veto_clear();
  reset_trigger_flip_flop();
  clear_scaler_counters();

  send_command_packet_to_all_enabled_channels(0xeeeee01a, 1850);
  bool first_time = true;
  int nsec_spill_active = 0;
  int nsec_ago_last_event = 0;

  start_timer();

  while(1) {
    setup_to_catch_ctrl_c
      (update_logfile_with_the_number_of_readout_events_for_this_spill_and_close_all_files);

    if (!first_time) {
      increment_spill_number();
      write_status_file();
      generate_new_base_filename();
      open_data_file_to_prepare_for_next_spill();

#ifndef NO_CAMAC
      if (CAMAC_initialized) {
        open_CAMAC_file_to_prepare_for_next_spill();
        if (using_CAMAC3377)
          open_CAMAC3377_file_to_prepare_for_next_spill();
      }
#endif //NO_CAMAC
      start_timer();
      _g_number_of_seconds_this_spill_has_been_active = 0;
    }

    while((_g_number_of_readout_events_for_this_spill <
           MAXIMUM_NUMBER_OF_EVENTS_PER_SPILL) &&
          (_g_number_of_seconds_this_spill_has_been_active <
           MAXIMUM_NUMBER_OF_SECONDS_PER_SPILL))
      {
        if (!readout_an_event(true)) {
#ifndef NO_CAMAC
          if (CAMAC_initialized) {
            read_data_from_CAMAC_and_write_to_CAMAC_file();
            if (using_CAMAC3377) {
              CAMAC_read_3377s();
            }
          }
#endif //NO_CAMAC

          write_status_file();
          gettimeofday(&_g_watchdog, NULL);
          send_front_end_trigger_veto_clear();
        }

	fprintf(_g_info, "event # %d recorded", _g_event_number);
        show_temps();
        reset_trigger_flip_flop();
        clear_scaler_counters();
        fprintf(_g_info, "\n");

        _g_number_of_seconds_this_spill_has_been_active = 
	  stop_timer_in_seconds();
        _g_number_of_seconds_since_last_event = watchdog_timer_in_seconds();

        if (_g_number_of_seconds_since_last_event >
            MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR) {
          fprintf(_g_info, "No events seen in %d seconds; clearing...\n",
                  MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR);
          send_front_end_trigger_veto_clear();
          reset_trigger_flip_flop();
          gettimeofday(&_g_watchdog, NULL);
        }
      } // end spill

    update_logfile_with_the_number_of_readout_events_for_this_spill();
    close_data_file_to_prepare_for_next_spill();

#ifndef NO_CAMAC
    if (CAMAC_initialized) {
      close_CAMAC_file_to_prepare_for_next_spill();
      if (using_CAMAC3377)
        close_CAMAC3377_file_to_prepare_for_next_spill();
    }
#endif // NO_CAMAC

    fprintf(_g_info, "# events for e%dr%ds%d: %d (%d run total)\n",
            _g_experiment_number, _g_run_number, _g_spill_number,
            _g_number_of_readout_events_for_this_spill,
            _g_total_number_of_readout_events);


    show_temps();

    if (first_time)
      first_time = false;

    setup_to_catch_ctrl_c(close_all_files);
    fprintf(_g_warning, "press ctrl-c now to end cosmic run...\n");
    sleep(3);

    disk_space_free(_g_location_of_raw_datafiles);
  }

  close_all_files();

  //  diwe_flush_all_streams();
  return EXIT_SUCCESS;

}
