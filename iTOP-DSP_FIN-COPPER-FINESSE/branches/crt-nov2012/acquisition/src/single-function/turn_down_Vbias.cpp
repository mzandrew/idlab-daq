// 2011 mza

using namespace std;

#include <string>
#include <stdio.h>
#include "acquisition.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);

	readout_all_pending_data();
//	send_command_packet_to_some_enabled_channels(0x5555b1a5, 0, 0x2);
	send_command_packet_to_all_enabled_channels(0x5555b1a5, 0);

	close_pci();
	return 0;
}

