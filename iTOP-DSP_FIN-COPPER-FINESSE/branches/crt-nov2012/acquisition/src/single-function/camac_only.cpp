// 2011-?? Andrew Wong
// 2011-?? mza

#include <stdio.h>
#include <iostream>
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 100;

	parse_config_file(".config");
	open_status_file_for_reading_and_writing();
	read_status_file();
	spill_number = 1;
	create_directory_if_necessary(location_of_raw_datafiles);
	generate_new_base_filename();
	if (init_CAMAC_controller()) {
		cerr << "ERROR:  could not connect to CAMAC crate" << endl;
		exit(7);
	} else {
		CAMAC_initialized = true;
	}
	if (CAMAC_initialized) {
		open_CAMAC_file();
		if (using_CAMAC3377) {
			CAMAC_initialize_3377s();
			open_CAMAC3377_file();
		}
	}

//	printf("waiting for spill...\n");
//	wait_for_start_of_spill();

	printf("starting CAMAC-only readout...\n");
	for (int i=0; i<total_number_of_quarter_events_to_read_per_fiber_channel; i++) {
		printf("camac-only event #%03d \n", i);
		read_data_from_CAMAC_and_write_to_CAMAC_file();
		if (using_CAMAC3377) {
			CAMAC_read_3377s();
		}
	}

	return 0;
}

