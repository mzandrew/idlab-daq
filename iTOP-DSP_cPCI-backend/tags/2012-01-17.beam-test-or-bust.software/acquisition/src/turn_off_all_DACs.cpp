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
	should_soft_trigger = true;
	readout_all_pending_data();

	set_some_DACs_to(0, 0xe);
	//set_all_DACs_to(0);
	//set_all_DACs_to_built_in_nominal_values();

	close_pci();
	return 0;
}

