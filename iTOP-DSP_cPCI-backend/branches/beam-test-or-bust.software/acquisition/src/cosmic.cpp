// 2011 mza

using namespace std;

#include <string>
#include <stdio.h>
#include <iostream>
#include "pci.h"
#include "fiber.h"
#include "command_packet_builder.h"
#include "CAMAC.h"
#include "config_file.h"
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");

	init_CAMAC_controller();
//	open_CAMAC_file(); // fDIRC version comments this out

	setup_pci(card_id);
	wait_for_all_links_to_come_up(channel_bitmask);
	//should_soft_trigger = false;
//	should_soft_trigger = true; // fDIRC version comments this out
	readout_all_pending_data();
	set_event_number(0);
//	set_all_DACs_to_built_in_nominal_values();
	create_directory_if_necessary(location_of_raw_datafiles);
	generate_new_base_filename();
	setup_filenames_for_fiber();
	setup_to_catch_ctrl_c();
	open_logfile();
	open_files_for_all_enabled_fiber_channels();

	//set_number_of_windows_to_look_back(32); // fDIRC version has this not commented out

	send_front_end_trigger_veto_clear();
	reset_trigger_flip_flop();

	for (int i=0; i<total_number_of_quarter_events_to_read_per_fiber_channel; i++) {
		readout_N_events(1);
		usleep(1000000);
		if (CAMAC_initialized) {
			read_data_from_CAMAC_and_write_to_CAMAC_file();
		}
//		increment_spill_number_and_change_filenames_for_fiber();
		disk_space_free(location_of_raw_datafiles);
	}

	// cleanup:
	close_all_files();
//	set_all_DACs_to(0);

	return 0;
}

