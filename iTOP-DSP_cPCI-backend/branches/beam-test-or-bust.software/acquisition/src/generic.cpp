// 2011 mza

using namespace std;

#include <string>
#include <stdio.h>
#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include "read_CAMAC.h"
#include "parse_config_file.h"
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");

	init_camac("CAMAC_config.txt");
	open_CAMAC_file();

	setup_pci(card_id);
	//should_soft_trigger = false;
	should_soft_trigger = true;
	readout_all_pending_data();
	set_event_number(0);
//	set_all_DACs_to_built_in_nominal_values();
	setup_filenames_for_fiber();
	setup_to_catch_ctrl_c(close_all_files);
	open_logfile();
	open_files_for_all_enabled_fiber_channels();

	send_front_end_trigger_veto_clear();
	reset_trigger_flip_flop();

	for (int i=0; i<total_number_of_quarter_events_to_read_per_fiber_channel; i++) {
		readout_N_events(1);
		usleep(1000000);
		read_data_from_CAMAC_and_write_to_CAMAC_file();
//		increment_spill_number_and_change_filenames_for_fiber();
	}

	// cleanup:
	close_all_files();
//	set_all_DACs_to(0);
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

