// 2011-?? mza

#include "pci.h"
#include "fiber_readout.h"
#include "command_packet_builder.h"

unsigned long int header = 0x00be11e2;
unsigned long int protocol_freeze_date = 0x20111016;
unsigned long int packet_type[NUMBER_OF_PACKET_TYPES] = { 0x00c0ffee, 0x0000eada, 0x000f00da, 0x000ab0de, 0xce11b10c };
unsigned long int footer = 0x62504944;
unsigned long int packet[NUMBER_OF_WORDS_IN_A_PACKET];
unsigned long int number_of_errors_for_this_quarter_event[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int event_number = 0;
unsigned long long int time_for_single_event_readout;
unsigned long int word_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_WORDS];
         char     byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];
unsigned long int number_of_bytes_read_so_far[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int total_number_of_errors;
string event_fiber_packet_string, info_string[NUMBER_OF_SCRODS_TO_READOUT], error_string[NUMBER_OF_SCRODS_TO_READOUT];
unsigned short int channel_bitmask = 0;
int fd[NUMBER_OF_SCRODS_TO_READOUT]; // file descriptors for output datafiles
unsigned long int total_number_of_readout_events = 0;
string filename[NUMBER_OF_SCRODS_TO_READOUT];
bool files_are_open = false;
bool should_soft_trigger = false;

unsigned long int histogram_of_incomplete_events_560 = 0;
unsigned long int histogram_of_incomplete_events_other = 0;
unsigned char unsigned_char_byte_buffer[NUMBER_OF_SCRODS_TO_READOUT][QUARTER_EVENT_BUFFER_SIZE_IN_BYTES];
unsigned long int event_number_from_most_recent_packet[NUMBER_OF_SCRODS_TO_READOUT];

void readout_all_pending_data(void) {
	char buffer2[NUMBER_OF_BYTES_TO_READ_AT_ONE_TIME];
	signed long int return_value;
	signed long int total_bytes_read_so_far;
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		total_bytes_read_so_far = 0;
		pci.selectChannel(i);
		for (unsigned short int j=0; j<2; j++) {
			return_value = pci.readData(buffer2, NUMBER_OF_BYTES_TO_READ_AT_ONE_TIME);
			if (return_value > 0) {
				total_bytes_read_so_far += return_value;
			}
		}
		if (total_bytes_read_so_far > 0) {
			printf("\nchannel %d had %ld bytes to read", i, total_bytes_read_so_far);
		}
	}
	printf("\n\n");
}

unsigned int read_quarter_events_from_all_enabled_channels(unsigned char channel_bitmask, bool should_not_return_until_at_least_some_data_comes_through) {
	unsigned long int desired_number_of_bytes_to_read_right_now[NUMBER_OF_SCRODS_TO_READOUT];
	unsigned long int desired_number_of_bytes_to_read[NUMBER_OF_SCRODS_TO_READOUT];
	unsigned short int word_position_of_first_header[NUMBER_OF_SCRODS_TO_READOUT];
	bool header_has_been_seen[NUMBER_OF_SCRODS_TO_READOUT];
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		              number_of_bytes_read_so_far[i] = 0;
		          desired_number_of_bytes_to_read[i] = channel_bitmask & (1<<i) ? QUARTER_EVENT_SIZE_IN_BYTES : 0;
		desired_number_of_bytes_to_read_right_now[i] = channel_bitmask & (1<<i) ? PREFERRED_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES : 0;
		header_has_been_seen[i] = false;
		word_position_of_first_header[i] = 33333;
	}
	unsigned long int number_of_bytes_actually_read;
	unsigned long int word_position_of_first_found_header;
	unsigned long int number_of_extra_words_we_need_to_read;
	unsigned long int number_of_extra_bytes_we_need_to_read;
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		clear_buffer(i);
	}
	unsigned long int number_of_bytes_read_from_any_channels_for_all_loop_iterations = 0;
	unsigned long int number_of_bytes_read_from_any_channels_for_this_loop_iteration;
	unsigned short int dry_loop_iterations = 0;
	unsigned short int maximum_number_of_allowed_dry_loop_iterations = 100;
	bool should_synchronize_stream_with_header_and_request_more_data_to_compensate = true;
	bool should_ensure_last_word_acquired_is_a_footer = true;
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		info_string[i] = "";
		error_string[i] = "";
		total_number_of_errors += number_of_errors_for_this_quarter_event[i];
		number_of_errors_for_this_quarter_event[i] = 0;
				//pci.selectChannel(i);
				//char temp[4];
				//number_of_bytes_actually_read = pci.readData(temp, 4);
	}
	while (
		// bug/future:  this is effectively hardcoding NUMBER_OF_SCRODS_TO_READOUT to 4 here:
		number_of_bytes_read_so_far[0] < desired_number_of_bytes_to_read[0] ||
		number_of_bytes_read_so_far[1] < desired_number_of_bytes_to_read[1] ||
		number_of_bytes_read_so_far[2] < desired_number_of_bytes_to_read[2] ||
		number_of_bytes_read_so_far[3] < desired_number_of_bytes_to_read[3]
	) {
		number_of_bytes_read_from_any_channels_for_this_loop_iteration = 0;
		usleep(NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_PARTIAL_QUARTER_EVENTS);
		for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
			if (number_of_bytes_read_so_far[i] < desired_number_of_bytes_to_read[i]) {
				pci.selectChannel(i);
				unsigned long int number_of_bytes_remaining_to_read = desired_number_of_bytes_to_read[i] - number_of_bytes_read_so_far[i];
				if (number_of_bytes_read_so_far[i] + desired_number_of_bytes_to_read_right_now[i] > desired_number_of_bytes_to_read[i]) {
					desired_number_of_bytes_to_read_right_now[i] = number_of_bytes_remaining_to_read;
				}
				if (desired_number_of_bytes_to_read_right_now[i] > MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES) {
					desired_number_of_bytes_to_read_right_now[i] = MAXIMUM_SIZE_TO_TRY_TO_READ_AT_ONE_TIME_IN_BYTES;
				}
				desired_number_of_bytes_to_read_right_now[i] = (desired_number_of_bytes_to_read_right_now[i] >> 2) << 2; // make sure it's aligned to a 4-byte boundary
				number_of_bytes_actually_read = pci.readData(byte_buffer[i] + number_of_bytes_read_so_far[i], desired_number_of_bytes_to_read_right_now[i]);
				number_of_bytes_read_so_far[i] += number_of_bytes_actually_read;
				number_of_bytes_read_from_any_channels_for_this_loop_iteration += number_of_bytes_actually_read;
				if (number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0 && number_of_bytes_actually_read > 0) {
					start_timer();
				}
				number_of_bytes_read_from_any_channels_for_all_loop_iterations += number_of_bytes_actually_read;
				if (should_not_return_until_at_least_some_data_comes_through && number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0) {
				} else {
//					printf("\nch%d: %d / %d (%d)", i, number_of_bytes_read_so_far[i], desired_number_of_bytes_to_read[i], desired_number_of_bytes_to_read_right_now[i]);
				}
				copy_byte_buffer_to_word_buffer(i);
				if (should_synchronize_stream_with_header_and_request_more_data_to_compensate && !header_has_been_seen[i]) {
					word_position_of_first_found_header = find_word_position_of_first_header_in_buffer(i, number_of_bytes_read_so_far[i]/NUMBER_OF_BYTES_IN_A_WORD); // bug/future:  unsure why the -1 has to be here;
					if (word_position_of_first_found_header < number_of_bytes_read_so_far[i]/NUMBER_OF_BYTES_IN_A_WORD) {
						header_has_been_seen[i] = true;
						word_position_of_first_header[i] = word_position_of_first_found_header;
						number_of_extra_words_we_need_to_read = word_position_of_first_found_header;
						number_of_extra_bytes_we_need_to_read = number_of_extra_words_we_need_to_read * NUMBER_OF_BYTES_IN_A_WORD;
						desired_number_of_bytes_to_read[i] += number_of_extra_bytes_we_need_to_read;
//						printf(" ... header found at word %d", i, word_position_of_first_header[i]);
						//analyze_packet(word_buffer[i] + word_position_of_first_header[i]);
//						copy_packet(word_buffer[i] + word_position_of_first_header[i] + 1);
//						analyze_packet();
					}
				}
				if (number_of_bytes_actually_read) {
					printf(".");
				}
			}
		}
		if (should_not_return_until_at_least_some_data_comes_through && number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0) {
		} else if (number_of_bytes_read_from_any_channels_for_this_loop_iteration == 0) {
			dry_loop_iterations++;
			if (dry_loop_iterations > maximum_number_of_allowed_dry_loop_iterations) {
//				printf(" ... aborting this event");
				for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
					unsigned long int a = desired_number_of_bytes_to_read[i] - number_of_bytes_read_so_far[i];
					if (a == 560) {
						histogram_of_incomplete_events_560++;
					} else if (a == desired_number_of_bytes_to_read[i]) {
					} else if (a > 0) {
						histogram_of_incomplete_events_other++;
					}
				}
				printf("O");
				break;
			} else {
//				printf("didn't get any data from any channels; ready to quit\n");
			}
		}
	}
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		if (desired_number_of_bytes_to_read[i]) {
			printf("\n");
		}
		if (number_of_bytes_read_so_far[i] > 0 && number_of_bytes_read_so_far[i] == desired_number_of_bytes_to_read[i])
 {
//			for (unsigned long int j=0; j<((number_of_bytes_read_so_far[i])>>2); j++) {
			for (unsigned long int j=0; j<NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT; j++) {
				copy_packet(word_buffer[i] + word_position_of_first_header[i] + j * NUMBER_OF_WORDS_IN_A_PACKET);
				char temp[256];
				sprintf(temp, "\nevent[%ld] fiber_ch[%d] packet[%3ld]: ", event_number, i, j);
				event_fiber_packet_string = temp;
				analyze_packet(j, i);
			}
			if (number_of_errors_for_this_quarter_event[i]) {
				printf(" %ld errors in that quarter event; ", number_of_errors_for_this_quarter_event[i]);
			}
			printf(" Q ");
		}
	}
	printf(" E ");
}

//inline unsigned int read_quarter_event_from_channel(unsigned short int channel) {
//}

void reset_trigger_flip_flop(void) {
//	pci.selectChannel(i);
//	pci.sendData(, 560);
//	printf("\nsending signal to clear trigger flip flop");
	pci.sendVetoClear();
}

inline void clear_buffer(unsigned short int channel_number) {
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_WORDS; i++) {
		word_buffer[channel_number][i] = 0;
	}
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_BYTES; i++) {
		byte_buffer[channel_number][i] = 0;
	}
}

// this is the stupid-monkey way of doing this:
inline void copy_byte_buffer_to_word_buffer(unsigned short int channel) {
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_BYTES; i++) {
		unsigned_char_byte_buffer[channel][i] = byte_buffer[channel][i];
	}
	for (unsigned long int i=0; i<QUARTER_EVENT_BUFFER_SIZE_IN_WORDS; i++) {
		unsigned long int j = i * NUMBER_OF_BYTES_IN_A_WORD;
		//if ((word_buffer[channel][i] & 0x00ff0000) >> 16 == 0xbe) {
		word_buffer[channel][i] =
			((unsigned_char_byte_buffer[channel][j+3]) << 24) |
			((unsigned_char_byte_buffer[channel][j+2]) << 16) |
			((unsigned_char_byte_buffer[channel][j+1]) <<  8) |
			((unsigned_char_byte_buffer[channel][j+0]) <<  0);
	}
}

inline unsigned long int find_word_position_of_first_header_in_buffer(unsigned short int channel, unsigned long last_word_position_to_look_in_buffer) {
	unsigned long int index = 22222;
	if (last_word_position_to_look_in_buffer >= QUARTER_EVENT_BUFFER_SIZE_IN_WORDS) {
		last_word_position_to_look_in_buffer = QUARTER_EVENT_BUFFER_SIZE_IN_WORDS - 1;
	}
	for (unsigned long int i=0; i<=last_word_position_to_look_in_buffer; i++) {
		if (word_buffer[channel][i] == header) {
			index = i;
			if (index > 0) {
				char temp[256];
				sprintf(temp, " skipped ahead %ld words to find header;", index);
				error_string[channel] += temp;
			}
			return index;
		}
	}
	return index;
}

// this is the stupid-monkey way of doing this:
void copy_packet(unsigned long int *source) {
	for (unsigned long int i=0; i<NUMBER_OF_WORDS_IN_A_PACKET; i++) {
		packet[i] = source[i];
	}
}

void analyze_packet(unsigned long int packet_number, unsigned short int channel) {
	unsigned long int checksum = 0;
	unsigned long int packet_number_from_packet;
	if (packet[PACKET_HEADER_INDEX] != header) {
		error_string[channel] += " bad header;";
//		printf(" bad header"); // this should never be called, since matching against a header is how it got here
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet[PACKET_SIZE_INDEX] != NUMBER_OF_WORDS_IN_A_PACKET) {
		error_string[channel] += " bad packet size;";
//		printf(" bad packet size");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet[PACKET_PROTOCOL_FREEZE_DATE_INDEX] != protocol_freeze_date) {
		error_string[channel] += " bad protocol freeze date;";
//		printf(" bad protocol freeze date");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	unsigned short int packet_type_is_okay = 0;
	for (int i=0; i<NUMBER_OF_PACKET_TYPES; i++) {
		if (packet[PACKET_TYPE_INDEX] == packet_type[i]) {
			packet_type_is_okay++;
		}
	}
	if (!packet_type_is_okay) {
		error_string[channel] += " bad packet type;";
//		printf(" bad packet type");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	packet_number_from_packet = (packet[PACKET_NUMBER_INDEX] & 0x00ff0000) >> 16;
	if (packet_number_from_packet != packet_number) {
		error_string[channel] += " packet_number didn't match;";
		number_of_errors_for_this_quarter_event[channel]++;
	}
	if (packet_number==0) {
		//info_string[channel] += packet[EVENT_NUMBER_INDEX];
		char temp[256];
		sprintf(temp, "event_number[%09ld]: ", packet[EVENT_NUMBER_INDEX]);
		info_string[channel] += temp;
	} else {
		if (event_number_from_most_recent_packet[channel] != packet[EVENT_NUMBER_INDEX]) {
			error_string[channel] += " event_number changed in the middle of an event (";
			error_string[channel] += event_number_from_most_recent_packet[channel];
			error_string[channel] += " vs ";
			error_string[channel] += packet[EVENT_NUMBER_INDEX];
			error_string[channel] += ");";
			number_of_errors_for_this_quarter_event[channel]++;
		}
	}
	event_number_from_most_recent_packet[channel] = packet[EVENT_NUMBER_INDEX];
	for (unsigned long int i=0; i<NUMBER_OF_WORDS_IN_A_PACKET; i++) {
		if (i != PACKET_CHECKSUM_INDEX) {
			checksum += packet[i];
		}
	}
	checksum &= 0xffffffff;
	if (0) {
	if (checksum != packet[PACKET_CHECKSUM_INDEX]) {
		char temp[256];
//		error_string[channel] += " checksums do not match;";
//		error_string[channel] += " checksum is ";
		sprintf(temp, "0x%08lx", packet[PACKET_CHECKSUM_INDEX]);
		error_string[channel] += temp;
		error_string[channel] += " - ";
//		error_string[channel] += " but should be ";
		sprintf(temp, "0x%08lx", checksum);
		error_string[channel] += temp;
		error_string[channel] += " = ";
//		error_string[channel] += " the difference is ";
		sprintf(temp, "0x%08lx", packet[PACKET_CHECKSUM_INDEX]-checksum);
		error_string[channel] += temp;
		error_string[channel] += ";";
//		printf(" checksums do not match");
		number_of_errors_for_this_quarter_event[channel]++;
	}
	}
	if (packet[PACKET_FOOTER_INDEX] != footer) {
		error_string[channel] += " bad footer;";
//		printf(" bad footer");
		number_of_errors_for_this_quarter_event[channel]++;
	}
//	if (error_string[channel].length() && packet_number == 0) {
	if (error_string[channel].length()) {
		printf("%s%s", event_fiber_packet_string.c_str(), error_string[channel].c_str());
		error_string[channel] = "";
	}
	if (info_string[channel].length()) {
		printf("%s", info_string[channel].c_str());
		info_string[channel] = "";
	}
	printf("P");
}

struct timeval start, end, watchdog;

void start_timer() {
	gettimeofday(&start, NULL);	
}

int stop_timer(struct timeval* begin) {
	if (begin == NULL)
		begin = &start;
	int sec, usec;
	gettimeofday(&end, NULL);
	sec = end.tv_sec - begin->tv_sec;
	usec = end.tv_usec - begin->tv_usec;
	return sec*1000000+usec;
}

void setup_feedback_enables_and_goals(unsigned short int enable) {
	printf("setting up feedback loops\n");
	command_arguments_type command_arguments;
	command_arguments.uint32[0] = 0;
	command_arguments.uint32[1] = 1950;
	command_arguments.uint32[2] = 0;
	if (enable == 0) {
		command_arguments.uint32[3] = 0x0000; // disable sampling rate feedback on all channels
		command_arguments.uint32[4] = 0x0000; // disable wilkinson feedback on all channels
		command_arguments.uint32[5] = 0x0000; // disable trigger width feedback on all channels
	} else {
//	command_arguments.uint32[4] = 0xa5a5;
//	command_arguments.uint32[4] = 0x5a5a;
//		command_arguments.uint32[3] = 0x0000; // disable sampling rate feedback on all channels
		command_arguments.uint32[3] = 0xffff; // enable sampling rate feedback on all channels
//		command_arguments.uint32[4] = 0xffff; // enable wilkinson feedback on all channels
		command_arguments.uint32[4] = 0x0000; // disable wilkinson feedback on all channels
		command_arguments.uint32[5] = 0x0000; // disable trigger width feedback on all channels
//		command_arguments.uint32[5] = 0xffff; // enable trigger width feedback on all channels
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
	printf("setting event number to %ld\n", event_number);
	send_command_packet_to_all_enabled_channels(0xe0000000, event_number); // set event number
}

void set_start_and_end_windows(unsigned long int start_window, unsigned long int end_window) {
	if (start_window%2!=0) {
		fprintf(stderr, "ERROR:  start_window must be even (trying to set it to %ld)\n", start_window);
		exit(7);
	}
	if (end_window%2==0) {
		fprintf(stderr, "ERROR:  end_window must be odd (trying to set it to %ld)\n", end_window);
		exit(8);
	}
	if (start_window>end_window) {
		fprintf(stderr, "ERROR:  start_window (%ld) must be less than end_window (%ld)\n", start_window, end_window);
		exit(9);
	}
	printf("setting start_window to %ld\n", start_window);
	send_command_packet_to_all_enabled_channels(0x000001ff, start_window); // set start window
	usleep(10000);
	printf("setting end_window to %ld\n", end_window);
	send_command_packet_to_all_enabled_channels(0x000101ff, end_window); // set end window
}

void set_number_of_windows_to_look_back(unsigned long int look_back) {
	printf("setting number of look back windows to %ld\n", look_back);
	send_command_packet_to_all_enabled_channels(0x0100cbac, look_back);
}

void global_reset(void) {
	printf("sending global reset\n");
	send_command_packet_to_all_enabled_channels(0x33333333, 0x00000000); // global reset
	usleep(500000); // wait for FPGA to reset everything and bring fiber link up again
}

void clear_scaler_counters(void) {
	printf("clearing scaler counters\n");
	send_command_packet_to_all_enabled_channels(0x01001500, 0x00000000); // clear scaler counters
}

void readout_N_events(unsigned long int N) {
//	while (1) {
	for (unsigned long int i=0; i<N; i++) {
		event_number++;
		if (should_soft_trigger) {
			usleep(1000000);
			send_soft_trigger_request_command_packet();
		}
		read_quarter_events_from_all_enabled_channels(channel_bitmask, true); // should_wait = true for cosmic or first data from a spill/fill structure, rest should be should_wait = false
		send_front_end_trigger_veto_clear();
		reset_trigger_flip_flop();
		time_for_single_event_readout = (long long) stop_timer();
//		printf("\napproximate time for last readout = %d us", time_for_single_event_readout);
		total_number_of_readout_events++;
		//write_quarter_events_to_disk();
		long int return_value;
		for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
			if (
				((i==3) && (channel_bitmask & 0x8)) ||
				((i==2) && (channel_bitmask & 0x4)) ||
				((i==1) && (channel_bitmask & 0x2)) ||
				((i==0) && (channel_bitmask & 0x1))
				) {
				if (number_of_bytes_read_so_far[i] && files_are_open) {
					return_value = write(fd[i], byte_buffer[i], number_of_bytes_read_so_far[i]);
					//return_value = write(fd[i], byte_buffer[i], QUARTER_EVENT_SIZE_IN_BYTES);
					if (return_value == -1) {
						fprintf(stderr, "\nerror %ld writing to disk", return_value);
					} else if (return_value > 0) {
//						printf("\nwrote %d bytes to file", return_value);
					}
				}
			}
		}
		usleep(NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS);
	}
	printf("\n");
}

int open_files_for_output_and_read_N_events(unsigned long int N) {
	open_logfiles_for_all_enabled_channels();

//	if (stdout_ch != -1)
//		fd[stdout_ch] = STDOUT_FILENO;

//	long long readtime[4] = {0,0,0,0}, writetime[4] = {0,0,0,0};  // time to read/write, rolling

	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		number_of_errors_for_this_quarter_event[i] = 0;
	}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//	send_command_packet_to_all_enabled_channels(0xeeeee01a, 0x00000000); // set trigger thresholds for all channels
//	send_command_packet_to_all_enabled_channels(0xeeeee01a, 0x0000077b); // set trigger thresholds for all channels
//	send_command_packet_to_all_enabled_channels(0x5555b1a5, 0x00000000); // set Vbias values for all channels
//	send_command_packet_to_all_enabled_channels(0x5555b1a5, 0x0000044c); // set Vbias values for all channels
//	setup_default_DAC_settings(); // just initialize the array locally
//	send_DAC_setting_command();
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000001ff); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000003ff); // set all DACs to given argument
//	send_command_packet_to_all_enabled_channels(0x4bac2dac, 0x000005ff); // set all DACs to given argument

//	global_reset();
//	clear_scaler_counters();
//	set_event_number(0x00000008);
//	set_start_and_end_windows(0x00000000, 0x00000003);
//	set_start_and_end_windows(0x00000110, 0x00000113);

//	usleep(10000);
//	readout_all_pending_data();
//	usleep(10000);
//	if (should_soft_trigger) {
//		send_soft_trigger_request_command_packet();
//		usleep(10000);
//	}

	readout_N_events(N);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	printf("\n");
	printf("\ntotal number of readout events = %ld", total_number_of_readout_events);
	printf("\n        total number of errors = %ld", total_number_of_errors);
	//printf("\nnumber of times exactly one packet was missing = %d", histogram_of_incomplete_events_560);
	//printf("\nnumber of times some other number of words was missing = %d", histogram_of_incomplete_events_other);
	printf("\n");

	close_all_logfiles();
}

void set_all_DACs_to(unsigned short int value) {
	send_command_packet_to_all_enabled_channels(0x4bac2dac, value); // set all DACs to given argument
}

void set_all_DACs_to_built_in_nominal_values(void) {
	send_command_packet_to_all_enabled_channels(0x1bac2dac, 0x00000000); // set DACs to default built-in values
}

void setup_default_log_filenames(void) {
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		char temp[15];
		filename[i] = "logdir/";
		filename[i] += "card";
		sprintf(temp, "%d", card_id);
		filename[i] += temp;
		filename[i] += ".channel";
		sprintf(temp, "%d", i);
		filename[i] += temp;
		filename[i] += ".rawdata";
//		printf("filename[%d] = \"%s\"\n", i, filename[i].c_str());
//		sprintf(filename[i], "%s%d.rawdata", logprefix, i);
	}
}

void open_logfiles_for_all_enabled_channels(void) {
	/*
	// check if proposed output files exist.  Note that we don't open any yet, because
	// if they are opened, the files get created.  If any of the files exist, we do not
	// want to create any of the other files.
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		char filename[105] = "";
		sprintf(filename, "%s%d.rawdata", logprefix, i);
//		sprintf(filename, "%s", logprefix);
//		if (stdout_ch == i) continue;
		if (channel_bitmask & (1<<i)) {
			struct stat st;
			if(stat(filename ,&st) == 0) {
				//fprintf(stderr, "ERROR: %s already exists, bailing\n", filename);
				fprintf(stdout, "WARNING: %s already exists; overwriting\n", filename);
				//return 0;
			}
		}
	}
	*/
//	if (filename[i].c_str() == "") {
//		setup_log_filenames();
//	}
	// open and create the log files
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
//		char filename[105] = "";
//		sprintf(filename, "%s%d.rawdata", logprefix, i);
		if (channel_bitmask & (1<<i)) {
//			printf("%d %d\n", stdout_ch, i);
//			if (stdout_ch == i) continue;
			fprintf(stdout, "attempting to open file \"%s\"...\n", filename[i].c_str());
			fd[i] = open(filename[i].c_str(), O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
			if (fd[i] < 0) fprintf(stderr, "WARNING: failed to create file \"%s\"\n", filename[i].c_str());
		}
	}
	files_are_open = true;
}

void close_all_logfiles(void) {
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
//		if (channel_bitmask & (1<<i)) {
//			fprintf(stderr, "ch%d: %lld bytes - read: %lld us, logging %lld us, total %lld us\n", i, total[i], readtime[i], writetime[i], readtime[i] + writetime[i]);
//			close(fd[i]);
//		} else 
		if (fd[i] > 0) {
			printf("closing file \"%s\" for card #%d channel #%d\n", filename[i].c_str(), card_id, i);
			close(fd[i]);
		}
	}
	files_are_open = false;
}

