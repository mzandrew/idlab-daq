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

	unsigned short int beginning_window = 0;
	unsigned short int ending_window = 63;
	while (1) {
		usleep(4000000);
		for (int i=0; i<40; i++) {
			readout_N_events(1);
			usleep(15000);
		}
		// wait for spill completed signal
		increment_spill_number_and_change_log_filenames_for_fiber();
	}

	close_all_fiber_files();
	close_pci();

	return 0;
}

