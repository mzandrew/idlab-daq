// 2011-?? Andrew Wong
// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include "read_CAMAC.h"
#include <stdio.h>
#include "parse_config_file.h"
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 100;

	parse_config_file(".config");
	init_camac("CAMAC_config.txt");
	CAMAC_initialize_3377s();
	open_CAMAC_file();
	open_CAMAC3377_file();

	printf("starting CAMAC-only readout...\n");
	for (int i=0; i<total_number_of_quarter_events_to_read_per_fiber_channel; i++) {
		read_data_from_CAMAC_and_write_to_CAMAC_file();
		CAMAC_read_3377s();
//		printf("read event #%i\n",i);
	}

	return 0;
}

