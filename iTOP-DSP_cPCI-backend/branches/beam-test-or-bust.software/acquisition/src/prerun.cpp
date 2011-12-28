// 2011 mza

using namespace std;

#include <string>
#include <stdio.h>
#include <iostream>
#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include "read_CAMAC.h"
#include "parse_config_file.h"
#include "acquisition.h"
#include "status_file.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);

	global_reset();
	usleep(350000);
	cout << "press a key after all fiber links are up (steady green)" << endl;
	getchar();
	readout_all_pending_data();
	send_front_end_trigger_veto_clear();
	reset_trigger_flip_flop();
	set_all_DACs_to_built_in_nominal_values();
	setup_feedback_enables_and_goals(1);

	open_status_file_for_reading_and_writing();
	read_status_file();
	run_number++;
	spill_number = 1;
	write_status_file();
	create_directory_if_necessary(location_of_raw_datafiles);
	generate_new_base_filename();
	readout_all_pending_data();
	setup_filenames_for_fiber();
	if (init_camac("CAMAC_config.txt")) {
		cerr << "ERROR:  could not connect to CAMAC crate" << endl;
		exit(7);
	} else {
		CAMAC_initialized = true;
	}
	if (CAMAC_initialized) {
		open_CAMAC_file();
		CAMAC_initialize_3377s();
		open_CAMAC3377_file();
	}
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

	// actual running:
	while (1) {
//		wait_for_start_of_spill();
//		while (spill_is_active()) {
			if (!spill_is_active()) {
				readout_an_event(true);
				send_command_packet_to_all_enabled_channels(0xeeeee01a,threshold);
				threshold = (threshold + threshold_scan_step_size);
				if (threshold > threshold_scan_high_limit) {
					threshold = threshold_scan_low_limit;
				}
				if (CAMAC_initialized) {
					read_data_from_CAMAC_and_write_to_CAMAC_file();
					CAMAC_read_3377s();
				}
				for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
					if (channel_bitmask & (1<<i)) {
						unsigned short int t = temperature_float[i];
						cout << t << "C ";
					}
				}
				cout << endl;
				printf("\n");
				clear_scaler_counters();
			} else {
				clear_scaler_counters();
			}
		usleep(1000000);
	}

	close_all_fiber_files();
	close_pci();
	return 0;
}

//	wait_for_start_of_spill();
//	while (spill_is_active()) {
//	send_soft_trigger_request_command_packet();

//	set_start_and_end_windows(unsigned long int start_window, unsigned long int end_window);
//	set_number_of_windows_to_look_back(unsigned long int look_back);
//	open_files_for_output_and_read_N_events(unsigned long int N);
//	setup_feedback_enables_and_goals(unsigned short int enable);

