// 2011-?? mza

#include <stdio.h>
#include "pci.h"
#include "fiber.h"
#include "command_packet_builder.h"
#include "config_file.h"
#include "acquisition.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);
	readout_all_pending_data();
	setup_filenames_for_fiber();
	//setup_to_catch_ctrl_c();
	//open_logfile();
	open_files_for_all_enabled_fiber_channels();

	readout_N_events(1);

	close_all_files();
	return 0;
}

