// 2011-?? mza

#include <stdio.h>
#include "acquisition.h"

int main(void) {
	parse_config_file(".config");
	setup_pci(card_id);

	pci.sendVetoClear();

	close_pci();
	return 0;
}

