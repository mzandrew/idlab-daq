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
#include "DebugInfoWarningError.h"
#include "packet_interface.h"

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
  cout << "usage: single-packet-new <slot>"
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
          cout << "See `single-packet-new -h' for more." << endl;
        }
        else if (isprint(optopt)) {
          cout << "Unknown option -" << optopt << endl;
          cout << "See `single-packet-new -h' for more." << endl;
        }
        else {
          cout << "Unrecognized option character " << optopt << endl;
          cout << "See `single-packet-new -h' for more." << endl;
        }
        return 1;
      default:
        abort();
      }
  }

  _g_fins_requested = "a";
  _g_loopback_mask = 0x0;

  cprdaq_init();

  unsigned int command_id = 77;
  const unsigned int board_id = 0x00000000;

  unsigned short command_reg = 1;
  const int NCMD = 10;
  unsigned short command_data[NCMD] = {0x0100,  // 1) start
				       0x0094,  // 2) set up send
				       0x0294,  //    send adx + write
				       0x0000,  // 3) setup send
				       0x0200,  //    send reg addx
				       0x0100,  // 4) repeat start
				       0x0095,  // 5) setup send
				       0x0295,  //    send adx + read
				       0x0400,  // 6) read w/ no ack
				       0x1000}; // 7) stop
  
  packet p;
  p.CreateCommandPacket();
  int size_in_words = 0;
  unsigned int* packet_data;

  for (int i=0; i < size_in_words; i++) {
    cout << "================================================" << endl;
    p.ClearPacket();
    p.CreateCommandPacket(command_id, board_id);
    
    command_id++;
    
    p.AddWriteToPacket(command_reg, command_data[i]);
    p.AddReadToPacket(command_reg);
    
    p.PrintPacket();

    packet_data = p.AssemblePacket(size_in_words);

    cprdaq_send_data(packet_data, size_in_words, 0xF);

    delete[] packet_data;
    cout << "-------------------------------------------------" << endl;
  }
			  
  unsigned short read_reg = 256;

  p.ClearPacket();
  p.CreateCommandPacket(command_id, board_id);
  command_id++;
  p.AddReadToPacket(read_reg);
  p.PrintPacket();

  packet_data = p.AssemblePacket(size_in_words);

  cprdaq_send_data(packet_data, size_in_words, 0xF);

  cprdaq_term();

    
  return EXIT_SUCCESS;
}
