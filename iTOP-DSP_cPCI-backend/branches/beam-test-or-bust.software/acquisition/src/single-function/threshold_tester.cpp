// 2011-?? mza

#include <stdio.h>
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");
	setup_pci(card_id);
	should_soft_trigger = true;
	readout_all_pending_data();
	setup_filenames_for_fiber();
//	setup_to_catch_ctrl_c(close_all_files);
//	open_logfile();
//	open_files_for_all_enabled_fiber_channels();

	send_command_packet_to_all_enabled_channels(0xeeeee01a, 0x0000077b); // set trigger thresholds for all channels

//	close_all_fiber_files();
	close_pci();

	return 0;
}

