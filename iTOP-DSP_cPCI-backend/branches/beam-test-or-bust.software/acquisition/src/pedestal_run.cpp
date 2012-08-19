// 2011-?? mza

#include <stdio.h>
#include <iostream>
#include "pci.h"
#include "fiber.h"
#include "command_packet_builder.h"
#include "config_file.h"
#include "acquisition.h"
#include "status_file.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 100;

	// setup:
	parse_config_file(".config");
	open_status_file_for_reading_and_writing();
	read_status_file();
	run_number++;
	spill_number = 1;
	write_status_file();
	create_directory_if_necessary(location_of_raw_datafiles);
	generate_new_base_filename();
	setup_pci(card_id);
	wait_for_all_links_to_come_up(channel_bitmask);
	readout_all_pending_data();
	setup_filenames_for_fiber();
//	if (init_CAMAC_controller()) {
//		cerr << "ERROR:  could not connect to CAMAC crate" << endl;
//		exit(7);
//	}
//	if (CAMAC_initialized) {
//		CAMAC_initialize_3377s();
//		open_CAMAC_file();
//	}
	setup_run_type("pedestal");
	setup_to_catch_ctrl_c();
	open_logfile();
	open_files_for_all_enabled_fiber_channels();

	// testing:
	should_soft_trigger = true;

	set_event_number(event_number);
	clear_scaler_counters();
	set_number_of_windows_to_look_back(4);
//	set_all_DACs_to_built_in_nominal_values();
//	usleep(150000);
//	setup_feedback_enables_and_goals(1);
//	usleep(150000);

	unsigned short int beginning_window = 0;  //This number should be at least 3 less than ending window and even
	unsigned short int ending_window = 63;    //This number should be at least 3 more than beginning window and odd
	for (int i=beginning_window; i<=ending_window; i+=4) {
		unsigned short int a = i;
		unsigned short int b = i+3;
		set_start_and_end_windows(a, b);
		fprintf(debug, "obtaining pedestals for windows [%03d,%03d]...\n", a, b);
		usleep(50000); // wait for start and end window command to be sent and interpreted
		for (int j=0; j<total_number_of_quarter_events_to_read_per_fiber_channel; j++) {
//			wait_for_spill_to_finish(); // commented out for the fDIRC
			readout_an_event(true);
			for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
				if (channel_bitmask & (1<<i)) {
					show_temperature_for_channel(i);
				}
			}
			fprintf(info, "\n");
			send_front_end_trigger_veto_clear(); // for the fDIRC
		}
		//readout_N_events(total_number_of_quarter_events_to_read_per_fiber_channel);
		fprintf(info, "\n");
		disk_space_free(location_of_raw_datafiles);
	}

	// cleanup:
	update_logfile_with_the_number_of_readout_events_for_this_spill();
	close_all_files();
	return 0;
}

