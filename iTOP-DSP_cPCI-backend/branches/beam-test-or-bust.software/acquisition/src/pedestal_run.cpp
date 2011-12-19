// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include <stdio.h>
#include "parse_config_file.h"
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");
	setup_pci(card_id);
	should_soft_trigger = true;
	readout_all_pending_data();
	setup_log_filenames_for_fiber();
	open_files_for_all_enabled_fiber_channels();

	set_event_number(0);
	clear_scaler_counters();
	set_number_of_windows_to_look_back(4);
//	set_all_DACs_to_built_in_nominal_values();
//	usleep(150000);
//	setup_feedback_enables_and_goals(1);
//	usleep(150000);

	unsigned short int beginning_window = 0;  //This number should be at least 3 less than ending window and even
	unsigned short int ending_window = 63;    //This number should be at least 3 more than beginning window and odd
	for (int i=beginning_window; i<=ending_window; i+=4) {
		unsigned short int a = i;
		unsigned short int b = i+3;
		set_start_and_end_windows(a, b);
		fprintf(stdout, "obtaining pedestals for windows [%03d,%03d]...\n", a, b);
		usleep(50000); // wait for start and end window command to be sent and interpreted
		readout_N_events(100);
	}

	close_all_fiber_files();
	close_pci();

	return 0;
}

