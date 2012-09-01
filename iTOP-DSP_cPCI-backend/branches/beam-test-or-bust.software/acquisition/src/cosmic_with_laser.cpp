// 2011-?? mza

#include <stdio.h>
#include <iostream>
#include "acquisition.h"

int main(void) {
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
	if (init_CAMAC_controller()) {
		cerr << "ERROR:  could not connect to CAMAC crate" << endl;
		exit(7);
	} else {
		cout << "CAMAC initialized." << endl;
		CAMAC_initialized = true;
	}
	if (CAMAC_initialized) {
		cout << "opening CAMAC files..." << endl;
		open_CAMAC_file();
		if (using_CAMAC3377) {
			CAMAC_initialize_3377s();
			open_CAMAC3377_file();
		}
	}
	setup_run_type("cosmic_with_laser");
	setup_to_catch_ctrl_c();
	open_logfile();
	open_files_for_all_enabled_fiber_channels();
	unsigned short int beginning_window = 0;
	unsigned short int ending_window = 63;
	set_start_and_end_windows(beginning_window, ending_window);
	usleep(50000);
//	set_number_of_windows_to_look_back(6);
	set_number_of_windows_to_look_back(18); //Last known working with laser triggering itself
	usleep(50000);
	set_event_number(event_number);
	send_front_end_trigger_veto_clear();
	reset_trigger_flip_flop();
	clear_scaler_counters();

	// Cosmic running should not require a software trigger
	should_soft_trigger = false;

#define MAXIMUM_NUMBER_OF_EVENTS_PER_SPILL (5000)
#define MAXIMUM_NUMBER_OF_SECONDS_PER_SPILL (43200)
#define MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR (60)

	// actual running:
//	unsigned int threshold = threshold_scan_low_limit;
	send_command_packet_to_all_enabled_channels(0xeeeee01a, 1850); // change threshold for all channels
//	bool spill_was_just_active = false;
	bool first_time = true;
	int number_of_seconds_this_spill_has_been_active = 0;
	int number_of_seconds_since_last_event = 0;
	start_timer();
	while (1) {
		setup_to_catch_ctrl_c(update_logfile_with_the_number_of_readout_events_for_this_spill_and_close_all_files);
		if (!first_time) {
			increment_spill_number();
			write_status_file();
			generate_new_base_filename();
			open_fiber_files_to_prepare_for_next_spill();
			if (CAMAC_initialized) {
				open_CAMAC_file_to_prepare_for_next_spill();
				if (using_CAMAC3377) {
					open_CAMAC3377_file_to_prepare_for_next_spill();
				}
			}
//			cout << "restarting timer" << endl;
			start_timer();
			number_of_seconds_this_spill_has_been_active = 0;
		}

		while (number_of_readout_events_for_this_spill < MAXIMUM_NUMBER_OF_EVENTS_PER_SPILL &&
		       number_of_seconds_this_spill_has_been_active < MAXIMUM_NUMBER_OF_SECONDS_PER_SPILL) {
//			wait_for_spill_to_finish(); // commented out for the fDIRC
			if (!readout_an_event(true)) { // Kurtis changed this to rig for cosmic running
				if (CAMAC_initialized) {
					read_data_from_CAMAC_and_write_to_CAMAC_file();
					if (using_CAMAC3377) {
						CAMAC_read_3377s();
					}
				}
				write_status_file();
//				cout << endl << flush;
//				printf("\n");
				gettimeofday(&watchdog, NULL);
				send_front_end_trigger_veto_clear();
				for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
					if (channel_bitmask & (1<<i)) {
						show_temperature_for_channel(i);
					}
				}
				reset_trigger_flip_flop();
				clear_scaler_counters();
				fprintf(info, "\n");
				//cout << endl;
			}
//			printf("\n");
			number_of_seconds_this_spill_has_been_active = stop_timer_in_seconds();
//			cout << "time for this spill so far: " << number_of_seconds_this_spill_has_been_active << " s" << endl;
//			cout << "     events for this spill: " << number_of_readout_events_for_this_spill << endl;
//			usleep(100000);

			// force a reset of the front-end trigger veto if we haven't seen an event in a while
			number_of_seconds_since_last_event = watchdog_timer_in_seconds();
			if (number_of_seconds_since_last_event > MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR) {
				cout << "No events seen in " << MAXIMUM_NUMBER_OF_SECONDS_BEFORE_FORCING_CLEAR << " seconds... clearing." << endl;
				send_front_end_trigger_veto_clear();
				reset_trigger_flip_flop();
				gettimeofday(&watchdog, NULL);
			}
		}

		update_logfile_with_the_number_of_readout_events_for_this_spill();
		close_fiber_files_to_prepare_for_next_spill();
		if (CAMAC_initialized) {
			close_CAMAC_file_to_prepare_for_next_spill();
			if (using_CAMAC3377) {
				close_CAMAC3377_file_to_prepare_for_next_spill();
			}
		}
		cout << "number of events for experiment " << experiment_number << " / run " << run_number << " / spill " << spill_number << ": " << number_of_readout_events_for_this_spill << " (" << total_number_of_readout_events << " for this run)" << endl;
		for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
			if (channel_bitmask & (1<<i)) {
				cout << "mod" << i << "=" << temperature(i) << "C  ";
			}
		}
		cout << endl;
		if (first_time) {
			first_time = false;
		}

		setup_to_catch_ctrl_c(close_all_files);
		cout << "press ctrl-c now to end laser run" << endl;
		usleep(3000000);

		disk_space_free(location_of_raw_datafiles);
	}

	// cleanup:
	close_all_files();
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

