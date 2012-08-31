// 2011-?? mza

#include <stdio.h>
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");
	setup_pci(card_id);
	unsigned long int signals = pci.readSignals();
	close_pci();

	return 0;
}

