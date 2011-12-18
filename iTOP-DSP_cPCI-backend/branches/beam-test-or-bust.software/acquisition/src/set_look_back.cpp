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

	set_number_of_windows_to_look_back(26);

	close_all_fiber_files();
	close_pci();

	return 0;
}

