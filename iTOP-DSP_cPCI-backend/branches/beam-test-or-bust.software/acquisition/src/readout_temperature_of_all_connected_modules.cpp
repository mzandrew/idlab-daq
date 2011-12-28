// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include <stdio.h>
#include "parse_config_file.h"
#include "acquisition.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);
	readout_all_pending_data();
	setup_filenames_for_fiber();
	//open_logfile();
	open_files_for_all_enabled_fiber_channels();

	readout_N_events(1);

	close_all_fiber_files();
	close_pci();
	return 0;
}

