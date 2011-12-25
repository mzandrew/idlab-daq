// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include "read_CAMAC.h" // this is for all non-3377 CAMAC stuff
#include <stdio.h>
#include <iostream>
#include "parse_config_file.h"
#include "acquisition.h"
#include "status_file.h"
//#include "camac.h" // this is the 3377-specific readout

int main(void) {
	// setup:
	parse_config_file(".config");
	open_status_file_for_reading_and_writing();
	read_status_file();
	create_directory_if_necessary(location_of_raw_datafiles);
	generate_new_base_filename();
	setup_pci(card_id);
	readout_all_pending_data();
	setup_filenames_for_fiber();
	if (init_camac("CAMAC_config.txt")) {
		cerr << "ERROR:  could not connect to CAMAC crate" << endl;
//		exit(7);
	}
//	if (CAMAC_initialized) {
//		CAMAC_initialize_3377s();
		open_CAMAC_file();
//	}
	open_files_for_all_enabled_fiber_channels();
	unsigned short int beginning_window = 0;
	unsigned short int ending_window = 63;
	set_start_and_end_windows(beginning_window, ending_window);
	usleep(50000);

	// testing:
	should_soft_trigger = true;

	// actual running:
	while (1) {
		wait_for_start_of_spill();
		while (spill_is_active()) {
			readout_an_event(true);
			read_data_from_CAMAC_and_write_to_CAMAC_file();
//			CAMAC_read_3377s();
			printf("\n");
		}
//		increment_spill_number();
//		write_status_file();
//		generate_new_base_filename();
//		split_fiber_file_to_prepare_for_next_spill();
//		split_CAMAC_file_to_prepare_for_next_spill();
//		usleep(250000);
//		sync();
	}

	// cleanup:
	close_all_fiber_files();
	close_pci();
	return 0;
}

//	reset_trigger_flip_flop();
//	send_front_end_trigger_veto_clear();
//	wait_for_start_of_spill();
//	while (spill_is_active()) {

//	send_soft_trigger_request_command_packet();
//	global_reset();
//	clear_scaler_counters();
//	set_all_DACs_to_built_in_nominal_values();

//	set_start_and_end_windows(unsigned long int start_window, unsigned long int end_window);
//	set_number_of_windows_to_look_back(unsigned long int look_back);
//	open_files_for_output_and_read_N_events(unsigned long int N);
//	setup_feedback_enables_and_goals(unsigned short int enable);

