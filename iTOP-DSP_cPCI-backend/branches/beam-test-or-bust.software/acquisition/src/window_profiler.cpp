// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"
#include <stdio.h>
#include "parse_config_file.h"
#include "acquisition.h"

int main(void) {
	unsigned long int total_number_of_quarter_events_to_read_per_fiber_channel = 0;

	parse_config_file(".config");
	setup_pci(card_id);
	should_soft_trigger = true;
	readout_all_pending_data();
	setup_filenames_for_fiber();
	open_files_for_all_enabled_fiber_channels();

//	set_start_and_end_windows(  0, 511); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows(256, 511); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows(  0, 255); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows(100, 200); usleep(10000); readout_N_events(1);
//	set_start_and_end_windows( 10,  20); usleep(10000); readout_N_events(1);

//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(  0,   3); usleep(10000); readout_N_events(2);

//	set_start_and_end_windows(508, 511); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(510,   1); usleep(10000); readout_N_events(2);
//	set_start_and_end_windows(511,   2); usleep(10000); readout_N_events(2);

//	set_start_and_end_windows(510,   1); usleep(10000); readout_N_events(2); // this has start_window > end_window
//	set_start_and_end_windows(  1,   7); usleep(10000); readout_N_events(2); // this has start_window set to an odd number
//	set_start_and_end_windows(  0,   8); usleep(10000); readout_N_events(2); // this has end_window set to an even number

	//set_start_and_end_windows( 16,  31); usleep(10000); readout_N_events(1);

	should_soft_trigger = true;
	send_front_end_trigger_veto_clear();
	usleep(10000);
	for (int i = 0; i < 32; i += 4) {	
		set_start_and_end_windows( i,  i+3); usleep(10000); readout_N_events(100);
	}

	close_all_fiber_files();
	close_pci();

	return 0;
}

