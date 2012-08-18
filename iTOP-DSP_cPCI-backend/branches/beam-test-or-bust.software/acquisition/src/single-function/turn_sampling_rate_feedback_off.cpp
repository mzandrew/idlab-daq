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

//	enable_sampling_rate_feedback();
	disable_sampling_rate_feedback();
	
	close_pci();
	return 0;
}

