// 2011 mza

using namespace std;

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include "read_CAMAC.h"
#include <string>
#include <stdio.h>
#include <getopt.h>
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
	setup_log_filenames_for_fiber();
	open_logfiles_for_all_enabled_channels();

	send_front_end_trigger_veto_clear();
	reset_trigger_flip_flop();

	for (int i=0; i<total_number_of_quarter_events_to_read_per_fiber_channel; i++) {
		readout_N_events(1);
		usleep(1000000);
		read_data_from_CAMAC_and_write_to_CAMAC_file();
//		increment_spill_number_and_change_log_filenames_for_fiber();
	}

	close_all_logfiles();
//	set_all_DACs_to(0);
	close_pci();

	return 0;
}

