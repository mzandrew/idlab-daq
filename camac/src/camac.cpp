// started 2024-12-13 by mza and Keisuke-san
// based on GPL2 code Copyright (C) 2005-2014 WIENER, Plein & Baus, Corp
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License as
// published by the Free Software Foundation, version 2.
// last updated 2024-12-13 by mza and Keisuke-san

// notes on camac:
// CamN is the slot number on the camac crate
// CamA is the address of the register you're reading or writing (which frequently corresponds to the channel number for simeple modules)
// CamF is the function you are requesting (read, write, set, etc)
// CamD is the data returned from simple camac modules
// CamQ is whether the data returned is new/stale
// CamX is ???

#include <libxxusb.h>
#include <stdio.h>
//#include <time.h>
#include <string>
using namespace std;

usb_dev_handle *udev; // Device Handle

int setup_camac_crate_controller(void) {
	xxusb_device_type devices[100];
	struct usb_device *dev;
	xxusb_devices_find(devices); //Find XX_USB devices and open the first one found
	dev = devices[0].usbdev;
	udev = xxusb_device_open(dev);
	if(!udev) {
		printf ("\n\nFailedto Open CC_USB \n\n");
		return 0;
	}
	return 1;
}

void make_lights_dance(void) {
	long CamD; int CamQ, CamX;
	printf("\n\n\nTesting data lines....");
	CAMAC_Z(udev); // initialize
	CAMAC_I(udev, true); // inhibit
	CAMAC_write(udev, 1, 0, 16, 0xaaaaaa, &CamQ, &CamX);
	CAMAC_read(udev, 1, 0, 0, &CamD, &CamQ, &CamX);
	CAMAC_C(udev); // clear
	CAMAC_I(udev, false);
	CAMAC_Z(udev);
	for (int i=0; (i <= 100000); i++) {
		CAMAC_write(udev, 1, 0, 16, i, &CamQ, &CamX);
	}
	printf(" Done.\n\n");
}

//void set_camac_parameter(N,A,F) {
//}

int get_value_from_camac_module(int slot, int channel, int number_of_retries_remaining=5) {
	if (number_of_retries_remaining<1) {
		return 0;
	}
	int CamN, CamA, CamF;
	CamN = slot;
	CamA = channel;
	CamF = 0;
	long CamD; int CamQ, CamX;
	int return_value;
	if (CamF < 8) {
		return_value = CAMAC_read(udev, CamN, CamA, CamF, &CamD, &CamQ, &CamX);
		if (return_value < 0) {
			//printf("Read Operation Failed\n");
			return_value = get_value_from_camac_module(slot, channel, number_of_retries_remaining-1);
		} else {
			printf("\nX = %i, Q = %i, D = %lx", CamX, CamQ, CamD);
		}
	}
	return CamD;
}

int get_new_value_from_camac_module(int slot, int channel, int number_of_retries_remaining=5) {
	if (number_of_retries_remaining<1) {
		return 0;
	}
	static int last_CamD = 0;
	int CamN, CamA, CamF;
	CamN = slot;
	CamA = channel;
	CamF = 0;
	long CamD; int CamQ, CamX;
	int return_value;
	if (CamF < 8) {
		return_value = CAMAC_read(udev, CamN, CamA, CamF, &CamD, &CamQ, &CamX);
		if (return_value < 0) {
			//printf("Read Operation Failed\n");
			return_value = get_new_value_from_camac_module(slot, channel, number_of_retries_remaining-1);
		} else {
			//if (CamQ==0) {
			if (last_CamD==CamD) {
				//printf("\nX = %i, Q = %i, D = %lx", CamX, CamQ, CamD);
				return_value = get_new_value_from_camac_module(slot, channel, number_of_retries_remaining-1);
			} else {
				printf("\nX = %i, Q = %i, D = %lx", CamX, CamQ, CamD);
				last_CamD = CamD;
			}
		}
	}
	return CamD;
}

// untested!
int set_something_on_camac_module(int slot, int channel, int number_of_retries_remaining=5) {
	if (number_of_retries_remaining<1) {
		return 0;
	}
	int CamN, CamA, CamF;
	CamN = slot;
	CamA = channel;
	CamF = 9; // clear scaler
	// sometimes 15 or 10 or 9 or 12
	long CamD; int CamQ, CamX;
	int return_value;
	if ((CamF > 7) && (CamF < 16)) {
		return_value = CAMAC_read(udev, CamN, CamA, CamF, &CamD, &CamQ, &CamX);
		if (return_value < 0) {
			printf("Write Operation Failed\n");
			return_value = get_new_value_from_camac_module(slot, channel, number_of_retries_remaining-1);
		} else {
			printf("\nX = %i, Q = %i", CamX, CamQ);
		}
	}
	return return_value;
}

// untested!
int write_value_to_camac_module(int slot, int channel, long value, int number_of_retries_remaining=5) {
	if (number_of_retries_remaining<1) {
		return 0;
	}
	int CamN, CamA, CamF;
	CamN = slot;
	CamA = channel;
	CamF = 16;
	long CamD; int CamQ, CamX;
	CamD = value;
	int return_value;
	if ((CamF > 15) && (CamF < 24)) {	
		return_value = CAMAC_write(udev, CamN, CamA, CamF, CamD, &CamQ, &CamX);
		// no way to detect error!
	}
	return return_value;
}

int get_value_from_lecroy2228A_TDC(int channel) {
	int slot = 7;
	return get_value_from_camac_module(slot, channel);
}

int get_value_from_lecroy2249_QDC(int channel) {
	int slot = 20;
	return get_value_from_camac_module(slot, channel);
}

int take_N_events_and_write_them_to_file(int slot, int channel, int N, string filename) {
	int return_value[N];
	for (int i=0; i<N; i++) {
		return_value[i] = get_value_from_camac_module(slot, channel);
		//return_value[i] = get_new_value_from_camac_module(slot, channel);
	}
	char str[256];
	FILE *f;
	f = fopen(filename.c_str(), "w");
	printf("\n\nthe array of values is:\n");
	for (int i=0; i<N; i++) {
		if (i==0) {
			sprintf(str, "%x", return_value[i]); // change to %d here if you want decimal
		} else {
			sprintf(str, ",%x", return_value[i]); // change to %d here if you want decimal
		}
		printf("%s", str);
		fprintf(f, "%s", str);
	}
	fprintf(f, "\n");
	fclose(f);
	return 0;
}

int main (int argc,  char *argv[]) {
	if (!setup_camac_crate_controller()) {
		return 1;
	}
	//make_lights_dance();
	int slot = 20; // scaler
	int channel = 3;
	//write_value_to_camac_module(slot, channel, value);
	//set_something_on_camac_module(slot, channel);
//	int value;
//	value = get_value_from_lecroy2228A_TDC(channel);
//	printf("\n%d", value);
	take_N_events_and_write_them_to_file(slot, channel, 1000, "datafile");
	xxusb_device_close(udev); // Close the Device
	printf("\n");
	return 0;
}

