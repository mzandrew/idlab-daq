// 2011 mza

using namespace std;

#include <string>
#include <stdio.h>
#include <fstream>
#include <iostream>
#include "acquisition.h"
#include "fiber.h"
#include "packet_builder.h"
#include "commands.h"
#include "CAMAC.h"
#include "config_file.h"
#include "status_file.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);

	wait_for_all_links_to_come_up(channel_bitmask);
	global_reset();
	float wait_duration = 10;
	fprintf(info, "waiting %.2f seconds for eeprom to be read...\n", wait_duration);
	usleep(wait_duration * 1000000.0);
	//fprintf(info, "press a key after all fiber links are up (steady green)\n");
	//getchar();
	wait_for_all_links_to_come_up(channel_bitmask);
	readout_all_pending_data();
	fprintf(info, "sending configuration commands to FEE modules...\n");
	send_front_end_trigger_veto_clear();
	reset_trigger_flip_flop();
	set_all_DACs_to_built_in_nominal_values();
	setup_feedback_enables_and_goals(1);
	usleep(50000);
	disable_sampling_rate_feedback();

	wait_duration = 2;
	open_status_file_for_reading_and_writing();
	read_status_file();
	run_number++;
	spill_number = 1;
	write_status_file();
	create_directory_if_necessary(location_of_raw_datafiles);
	generate_new_base_filename();
	readout_all_pending_data();
	setup_filenames_for_fiber();
//	CAMAC_initialized = false;
	// the following is commented out for the fDIRC:
//	if (init_CAMAC_controller()) {
//		cerr << "ERROR:  could not connect to CAMAC crate" << endl;
//		exit(7);
//	} else {
//		CAMAC_initialized = true;
//	}
//	if (CAMAC_initialized) {
//		open_CAMAC_file();
//		if (using_CAMAC3377) {
//			CAMAC_initialize_3377s();
//			open_CAMAC3377_file();
//		}
//	}
	setup_run_type("prerun");
	setup_to_catch_ctrl_c(close_all_files); // special case for prerun, which writes " 0 prerun" to the logfile when it starts acquiring data, unlike the other programs
	open_logfile();
	open_files_for_all_enabled_fiber_channels();
	unsigned short int beginning_window = 0;
	unsigned short int ending_window = 63;
	set_start_and_end_windows(beginning_window, ending_window);
	usleep(50000);

	should_soft_trigger = true;

	unsigned int threshold = threshold_scan_low_limit;
	send_command_packet_to_all_enabled_channels(0xeeeee01a,threshold);
	usleep(500000);
	clear_scaler_counters();
	usleep(500000);
	set_event_number(event_number);

	bool first_time = true;
	// actual running:
	while (1) {
//		wait_for_start_of_spill();
//		while (spill_is_active()) {
//			if (!spill_is_active()) { // for the fDIRC
			if (1) {
				if (first_time) {
					update_logfile_with_the_number_of_readout_events_for_this_spill();
				}
				readout_an_event(true);
				send_command_packet_to_all_enabled_channels(0xeeeee01a,threshold);
				threshold = (threshold + threshold_scan_step_size);
				if (threshold > threshold_scan_high_limit) {
					threshold = threshold_scan_low_limit;
				}
				// the following is commented out for the fDIRC:
//				if (CAMAC_initialized) {
//					read_data_from_CAMAC_and_write_to_CAMAC_file();
//					if (using_CAMAC3377) {
//						CAMAC_read_3377s();
//					}
//				}
				send_front_end_trigger_veto_clear();
				for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
					if (channel_bitmask & (1<<i)) {
						show_temperature_for_channel(i);
					}
				}
				fprintf(info, "\n");
				clear_scaler_counters();
			} else {
				clear_scaler_counters();
			}
		usleep(wait_duration * 1000000.0);
		//unsigned short old_verbosity = change_verbosity(4);
		disk_space_free(location_of_raw_datafiles);
		//unsigned long long int dsf = disk_space_free(location_of_raw_datafiles);
		//fprintf(debug, "%s bytes free\n", insert_interstitial_commas(dsf).c_str());
		//fprintf(debug, "%llu bytes free\n", dsf);
		//change_verbosity(old_verbosity);
		if (first_time) {
			first_time = false;
		}
	}

	// cleanup:
	close_all_files();
	return 0;
}

//	wait_for_start_of_spill();
//	while (spill_is_active()) {
//	send_soft_trigger_request_command_packet();

//	set_start_and_end_windows(unsigned long int start_window, unsigned long int end_window);
//	set_number_of_windows_to_look_back(unsigned long int look_back);
//	open_files_for_output_and_read_N_events(unsigned long int N);
//	setup_feedback_enables_and_goals(unsigned short int enable);

