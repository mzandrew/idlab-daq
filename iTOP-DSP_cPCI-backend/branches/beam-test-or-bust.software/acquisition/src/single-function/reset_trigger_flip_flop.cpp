// 2011-?? mza

#include <stdio.h>
#include "pci.h"
#include "fiber.h"
#include "command_packet_builder.h"
#include "config_file.h"
#include "acquisition.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);

	pci.sendVetoClear();

	close_pci();
	return 0;
}

