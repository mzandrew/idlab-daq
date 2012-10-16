#include "acquisition.h"

void setup_default_DAC_settings(void) {
	for (int i=0; i<NUMBER_OF_ROWS_IN_BOARD_STACK; i++) {
		for (int j=0; j<NUMBER_OF_COLUMNS_IN_BOARD_STACK; j++) {
			DAC_settings.trigger_test_channel_threshold[i][j]   = 0x000;
			DAC_settings.trigger_comparator_bias[i][j]          = 0x3e8;
			DAC_settings.trigger_threshold_01[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_23[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_45[i][j]             = 0x76c;
			DAC_settings.trigger_threshold_67[i][j]             = 0x76c;
			DAC_settings.comparator_output_width[i][j]          = 0x578;
			DAC_settings.sampling_rate_adjustment_PFET[i][j]    = 0xc9e;
			DAC_settings.sampling_rate_adjustment_NFET[i][j]    = 0x428;
			DAC_settings.buffer_amplifier_bias[i][j]            = 0x44c;
			DAC_settings.Wilkinson_ramp_buffer_bias[i][j]       = 0x640;
			DAC_settings.Wilkinson_ramp_current_bias[i][j]      = 0x7d0;
			DAC_settings.Wilkinson_comparator_bias[i][j]        = 0x384;
			DAC_settings.Wilkinson_comparator_pullup_bias[i][j] = 0xce4;
			DAC_settings.Wilkinson_clock_rate[i][j]             = 0xaf0;
//			DAC_settings.spare[i][j]                            = ;
		}
	}
}

void send_DAC_setting_command(void) {
	generate_skeleton_command_packet();
	unsigned short int j, k, m, n;
 	unsigned long int *uint32_packet = (unsigned long int *) command_packet;
	uint32_packet[4] = 0x0bac2dac;
//	uint32_packet[4] = 0x4bac2dac;
//	uint32_packet[5] = 0x03ff03ff;
	uint32_packet[5] = 0;
	for (int i=6; i<=125; i++) {
//		uint32_packet[i] = 0x03ff03ff;
//		uint32_packet[i] = 0x01ff01ff;
		uint32_packet[i] = 0x00000000;
		j = (i-6);   // j = 0, 1, 2, 3, 4, 5, 6, 7
		k =     j/2; // k = 0, 0, 1, 1, 2, 2, 3, 3
		m = 4*(j&1); // m = 0, 4, 0, 4, 0, 4, 0, 4
		n =     m+2; // n = 2, 6, 2, 6, 2, 6, 2, 6
//		o =     m+1; // o = 1, 5, 1, 5, 1, 5, 1, 5
//		p =     n+1; // p = 3, 7, 3, 7, 3, 7, 3, 7
		m /= 2;      // m = 0, 2, 0, 2, 0, 2, 0, 2
		n /= 2;      // n = 1, 3, 1, 3, 1, 3, 1, 3
//		p /= 2;      // p = 0, 2, 0, 2, 0, 2, 0, 2
//		o /= 2;      // o = 1, 3, 1, 3, 1, 3, 1, 3
		       if (i<= 13) { // trigger biases
		} else if (i<= 45) { // trigger thresholds
		} else if (i<= 53) { // trigger widths
		} else if (i<= 61) { // sampling rates +
		} else if (i<= 69) { // sampling rates -
		} else if (i<= 77) { // analog transfer buffer biases
			j = i-70; k = j/2; m = 2*(j&1); n = m+1;
//			uint32_packet[i] = (DAC_settings.buffer_amplifier_bias[k][n] << 16)
//			                  + DAC_settings.buffer_amplifier_bias[k][m];
		} else if (i<= 85) { // Wilkinson ramp buffer biases
		} else if (i<= 93) { // Wilkinson ramp current biases
		} else if (i<=101) { // Wilkinson clock rates
		} else if (i<=109) { // Wilkinson comparator biases
		} else if (i<=117) { // Wilkinson comparator pull-up biases
		} else if (i<=125) { // test trigger channel thresholds
			j = i-118; k = j/2; m = 2*(j&1); n = m+1;
			uint32_packet[i] = (DAC_settings.trigger_test_channel_threshold[k][n] << 16)
			                  + DAC_settings.trigger_test_channel_threshold[k][m];
		}
		// the rest don't matter
	}
	calculate_checksum_and_insert_into_packet(uint32_packet);
	for (unsigned short int j=0; j<NUMBER_OF_SCRODS_TO_READOUT; j++) {
		pci.selectChannel(j);
		pci.sendData(command_packet, 560);
	}
}

void set_some_DACs_to(unsigned short int value, unsigned short int channel_bitmask) {
	send_command_packet_to_some_enabled_channels(0x4bac2dac, value, channel_bitmask); // set all DACs to given argument
}

void set_all_DACs_to(unsigned short int value) {
	send_command_packet_to_all_enabled_channels(0x4bac2dac, value); // set all DACs to given argument
}

void set_all_DACs_to_built_in_nominal_values(void) {
	send_command_packet_to_all_enabled_channels(0x1bac2dac, 0x00000000); // set DACs to default built-in values
}

void enable_sampling_rate_feedback(void) {
	fprintf(debug, "enabling sampling rate feedback\n");
	feedback_enables_and_goals[3] = 0xffff;
	command_arguments_type command_arguments;
	for (int i=0; i<6; i++) {
		command_arguments.uint32[i] = feedback_enables_and_goals[i];
	}
	send_complex_command_packet_to_all_enabled_channels(0xfeedbacc, command_arguments);
}

void disable_sampling_rate_feedback(void) {
	fprintf(debug, "disabling sampling rate feedback\n");
	feedback_enables_and_goals[3] = 0;
	command_arguments_type command_arguments;
	for (int i=0; i<6; i++) {
		command_arguments.uint32[i] = feedback_enables_and_goals[i];
	}
	send_complex_command_packet_to_all_enabled_channels(0xfeedbacc, command_arguments);
}

void setup_feedback_enables_and_goals(unsigned short int enable) {
// [3] = enable/disable sampling rate feedback (one bit per ASIC)
// [4] = wilkinson feedback (one bit per ASIC)
// [5] = trigger width feedback (one bit per ASIC)
	fprintf(debug, "setting up feedback loops\n");
	if (enable == 0) {
		for (int i=3; i<6; i++) {
			feedback_enables_and_goals[i] = 0x0000;
		}
	} else {
		for (int i=3; i<6; i++) {
			feedback_enables_and_goals[i] = 0xffff;
		}
	}
	command_arguments_type command_arguments;
	for (int i=0; i<6; i++) {
		command_arguments.uint32[i] = feedback_enables_and_goals[i];
	}
	send_complex_command_packet_to_all_enabled_channels(0xfeedbacc, command_arguments);
}

void send_soft_trigger_request_command_packet(void) {
//	printf("sending soft trigger command\n");
	send_command_packet_to_all_enabled_channels(0x19321965, 0x00000000); // force trigger
}

void send_front_end_trigger_veto_clear(void) {
	send_command_packet_to_all_enabled_channels(0x0000C1EA, 0x00000000); // clear the trigger veto
}

void set_event_number(unsigned long int event_number) {
	fprintf(debug, "setting event number to %ld\n", event_number);
	send_command_packet_to_all_enabled_channels(0xe0000000, event_number); // set event number
//	usleep(50000);
}

void set_start_and_end_windows(unsigned long int start_window, unsigned long int end_window) {
	if (start_window%2!=0) {
		fprintf(error, "ERROR:  start_window must be even (trying to set it to %ld)\n", start_window);
		exit(7);
	}
	if (end_window%2==0) {
		fprintf(error, "ERROR:  end_window must be odd (trying to set it to %ld)\n", end_window);
		exit(8);
	}
	if (start_window>end_window) {
		fprintf(error, "ERROR:  start_window (%ld) must be less than end_window (%ld)\n", start_window, end_window);
		exit(9);
	}
	fprintf(debug, "setting start_window to %ld\n", start_window);
	send_command_packet_to_all_enabled_channels(0x000001ff, start_window); // set start window
	usleep(10000);
	fprintf(debug, "setting end_window to %ld\n", end_window);
	send_command_packet_to_all_enabled_channels(0x000101ff, end_window); // set end window
}

void set_number_of_windows_to_look_back(unsigned long int look_back) {
	fprintf(debug, "setting number of look back windows to %ld\n", look_back);
	send_command_packet_to_all_enabled_channels(0x0100cbac, look_back);
}

void global_reset(void) {
	fprintf(debug, "sending global reset\n");
	send_command_packet_to_all_enabled_channels(0x33333333, 0x00000000); // global reset
	usleep(500000); // wait for FPGA to reset everything and bring fiber link up again
}

void clear_scaler_counters(void) {
//	printf("clearing scaler counters\n");
	send_command_packet_to_all_enabled_channels(0x01001500, 0x00000000); // clear scaler counters
}

