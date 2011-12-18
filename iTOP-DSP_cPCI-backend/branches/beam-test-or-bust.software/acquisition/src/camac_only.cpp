// 2011-?? Andrew Wong
// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include "read_CAMAC.h"
#include <stdio.h>
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 100;

	init_camac("CAMAC_config.txt");
	open_CAMAC_file();

	printf("Starting...\n");
	for (int i=0; i<total_number_of_quarter_events_to_read_per_fiber_channel; i++) {
		read_data_from_CAMAC_and_write_to_CAMAC_file();
		printf("Read event %i\n",i);
	}

	return 0;
}

