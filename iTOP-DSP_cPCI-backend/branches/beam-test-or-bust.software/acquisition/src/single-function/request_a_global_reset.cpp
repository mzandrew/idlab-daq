// 2011 mza

using namespace std;

#include <string>
#include <stdio.h>
#include "pci.h"
#include "fiber.h"
#include "command_packet_builder.h"
#include "CAMAC.h"
#include "config_file.h"
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");

	setup_pci(card_id);
	readout_all_pending_data();
	global_reset();
	close_pci();

	return 0;
}

