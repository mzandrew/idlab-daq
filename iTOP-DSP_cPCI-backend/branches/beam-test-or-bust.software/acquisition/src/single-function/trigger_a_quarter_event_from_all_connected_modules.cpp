// 2011-?? mza

#include <stdio.h>
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");
	setup_pci(card_id);
	usleep(10000);
	send_soft_trigger_request_command_packet();
	usleep(10000);
	close_pci();

	return 0;
}

