// 2011-?? mza

#include <stdio.h>
#include "acquisition.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);
	readout_all_pending_data();

//	enable_sampling_rate_feedback();
//	disable_sampling_rate_feedback();
	setup_feedback_enables_and_goals(0);
	
	close_pci();
	return 0;
}

