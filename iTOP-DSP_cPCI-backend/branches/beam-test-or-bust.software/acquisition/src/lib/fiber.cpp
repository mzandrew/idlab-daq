// 2011-?? mza

using namespace std;
#include <iostream>
#include <fstream>
#include <sys/stat.h>

#include "acquisition.h"

#if NUMBER_OF_SCRODS_TO_READOUT==4
	int fd[NUMBER_OF_SCRODS_TO_READOUT] = {-7, -7, -7, -7}; // file descriptors for output datafiles; -7 is so it will not try to close files that seem open initially
#else
	#if NUMBER_OF_SCRODS_TO_READOUT==8
		int fd[NUMBER_OF_SCRODS_TO_READOUT] = {-7, -7, -7, -7, -7, -7, -7, -7}; // file descriptors for output datafiles; -7 is so it will not try to close files that seem open initially
	#else
		#error "can't handle that number of DSP_cPCI boards"
	#endif
#endif

unsigned long int number_of_errors_for_this_quarter_event[NUMBER_OF_SCRODS_TO_READOUT];
//unsigned long long int time_for_single_event_readout;
unsigned long int number_of_bytes_read_so_far[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int total_number_of_errors;
string event_fiber_packet_string, info_string[NUMBER_OF_SCRODS_TO_READOUT], error_string[NUMBER_OF_SCRODS_TO_READOUT];
unsigned long int number_of_readout_events_for_this_spill = 0;
unsigned long int total_number_of_readout_events = 0;
string fiber_filename[NUMBER_OF_SCRODS_TO_READOUT];
//string old_fiber_filename[NUMBER_OF_SCRODS_TO_READOUT];
bool files_are_open = false;
bool should_soft_trigger = false;

unsigned long int histogram_of_incomplete_events_560 = 0;
unsigned long int histogram_of_incomplete_events_other = 0;

unsigned int read_quarter_events_from_all_enabled_channels(unsigned char channel_bitmask, bool should_not_return_until_at_least_some_data_comes_through);

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
			fprintf(debug, "\nchannel %d had %ld bytes to read", i, total_bytes_read_so_far);
		}
	}
	send_front_end_trigger_veto_clear();
	fprintf(debug, "\n\n");
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
	}
	maybe_should_skip_writing_this_event_to_disk = 0;
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
//				if (number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0 && number_of_bytes_actually_read > 0) {
//					start_timer();
//				}
				number_of_bytes_read_from_any_channels_for_all_loop_iterations += number_of_bytes_actually_read;
//				if (should_not_return_until_at_least_some_data_comes_through && number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0) {
//				} else {
//					printf("\nch%d: %d / %d (%d)", i, number_of_bytes_read_so_far[i], desired_number_of_bytes_to_read[i], desired_number_of_bytes_to_read_right_now[i]);
//					return -1;
//				}
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
//					printf(".");
				}
			}
		}
		//printf(".");
		if (number_of_bytes_read_from_any_channels_for_all_loop_iterations == 0) {
			if (should_not_return_until_at_least_some_data_comes_through) {
			} else {
//				printf("o");
				return -1;
			}
		} else if (number_of_bytes_read_from_any_channels_for_this_loop_iteration == 0) {
			dry_loop_iterations++;
			if (dry_loop_iterations > maximum_number_of_allowed_dry_loop_iterations) {
//				printf(" ... aborting this event");
				for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
					unsigned long int a = desired_number_of_bytes_to_read[i] - number_of_bytes_read_so_far[i];
					if (a == 560) {
						histogram_of_incomplete_events_560++;
//						if (should_not_return_until_at_least_some_data_comes_through) {
//							return -1;
//						}
					} else if (a == desired_number_of_bytes_to_read[i]) {
					} else if (a > 0) {
						histogram_of_incomplete_events_other++;
					}
				}
//				printf("O");
				break;
			} else {
//				printf("didn't get any data from any channels; ready to quit\n");
			}
		}
	}
	//fprintf(info, "exp%02d.run%04d.spill%04d ", experiment_number, run_number, spill_number);
	fprintf(info, "e%0*d.r%0*d.s%0*d ", NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER, experiment_number, NUMBER_OF_SPACES_TO_RESERVE_FOR_RUN_NUMBER, run_number, NUMBER_OF_SPACES_TO_RESERVE_FOR_SPILL_NUMBER, spill_number);
//	printf("e%02d.r%04d.s%04d ", experiment_number, run_number, spill_number);
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		if (channel_bitmask & (1<<i)) {
//			if (desired_number_of_bytes_to_read[i]) {
//				printf("\n");
//			}
			if (number_of_bytes_read_so_far[i] > 0 && number_of_bytes_read_so_far[i] == desired_number_of_bytes_to_read[i]) {
//				for (unsigned long int j=0; j<((number_of_bytes_read_so_far[i])>>2); j++) {
				for (unsigned long int j=0; j<NUMBER_OF_PACKETS_IN_A_QUARTER_EVENT; j++) {
					copy_packet(word_buffer[i] + word_position_of_first_header[i] + j * NUMBER_OF_WORDS_IN_A_PACKET);
					char temp[256];
					sprintf(temp, "\nevent[%ld] fiber_ch[%d] packet[%3ld]: ", event_number, i, j);
					event_fiber_packet_string = temp;
					analyze_packet(j, i);
				}
				if (number_of_errors_for_this_quarter_event[i]) {
					fprintf(error, " %ld errors in that quarter event\n", number_of_errors_for_this_quarter_event[i]);
					maybe_should_skip_writing_this_event_to_disk++;
				}
//				printf(" Q ");
			} else {
				//fprintf(info, "          "); // corresponds to printf(" f%d[%06ld]"... in analyze_packet()
				fprintf(info, "%sf%d[%*s]%s ", red, i, NUMBER_OF_SPACES_TO_RESERVE_FOR_EVENT_NUMBER_CONSOLE_OUTPUT, "", white); // corresponds to printf(" f%d[%0*ld]"... in analyze_packet()
				maybe_should_skip_writing_this_event_to_disk++;
			}
		}
	}
//	printf(" E ");
//	printf("\n");
	return 0;
}

//inline unsigned int read_quarter_event_from_channel(unsigned short int channel) {
//}

int readout_an_event(bool should_not_return_until_at_least_some_data_comes_through) {
	if (should_soft_trigger) {
		send_soft_trigger_request_command_packet();
	}
	long int return_value = read_quarter_events_from_all_enabled_channels(channel_bitmask, should_not_return_until_at_least_some_data_comes_through); // should_wait = true for cosmic or first data from a spill/fill structure, rest should be should_wait = false
//	long int return_value = read_quarter_events_from_all_enabled_channels(channel_bitmask, false); // should_wait = true for cosmic or first data from a spill/fill structure, rest should be should_wait = false
//	long int return_value = read_quarter_events_from_all_enabled_channels(channel_bitmask, true); // should_wait = true for cosmic or first data from a spill/fill structure, rest should be should_wait = false
	if (return_value == 0) {
		event_number++;
		total_number_of_readout_events++;
		number_of_readout_events_for_this_spill++;
		check_and_synchronize_event_numbers();
		for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
			if (channel_bitmask & (1<<i)) {
				temperature_float[i] = temperature(i);
			}
		}
	} else {
		return return_value;
	}
//  WHOOPS (this doesn't belong here):
//	send_front_end_trigger_veto_clear();
//	if (!should_soft_trigger) {
//		reset_trigger_flip_flop();
//	}
//	time_for_single_event_readout = (long long) stop_timer();
//		printf("\napproximate time for last readout = %d us", time_for_single_event_readout);
	//write_quarter_events_to_disk();
//	long int return_value;
	for (unsigned short int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		if (
			((i==3) && (channel_bitmask & 0x8)) ||
			((i==2) && (channel_bitmask & 0x4)) ||
			((i==1) && (channel_bitmask & 0x2)) ||
			((i==0) && (channel_bitmask & 0x1))
			) {
			if (number_of_bytes_read_so_far[i] && files_are_open) {
				#ifdef DO_NOT_WRITE_BAD_DATA_TO_DISK
				if (!maybe_should_skip_writing_this_event_to_disk) {
				#endif
					return_value = write(fd[i], byte_buffer[i], number_of_bytes_read_so_far[i]);
					//return_value = write(fd[i], byte_buffer[i], QUARTER_EVENT_SIZE_IN_BYTES);
					if (return_value == -1) {
						fprintf(error, "\nerror %ld writing to disk", return_value);
					} else if (return_value > 0) {
	//						printf("\nwrote %d bytes to file", return_value);
					}
				#ifdef DO_NOT_WRITE_BAD_DATA_TO_DISK
				} else {
					fprintf(error, " event not written to disk\n");
				}
				#endif
			}
		}
	}
//	printf("\n");
	return 0;
}

void readout_N_events(unsigned long int N) {
//	while (1) {
	for (unsigned long int i=0; i<N; i++) {
		event_number++;
		if (should_soft_trigger) {
			send_soft_trigger_request_command_packet();
		}
		read_quarter_events_from_all_enabled_channels(channel_bitmask, true); // should_wait = true for cosmic or first data from a spill/fill structure, rest should be should_wait = false
		send_front_end_trigger_veto_clear();
		reset_trigger_flip_flop();
//		time_for_single_event_readout = (long long) stop_timer();
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
					#ifdef DO_NOT_WRITE_BAD_DATA_TO_DISK
					if (!maybe_should_skip_writing_this_event_to_disk) {
					#endif
						return_value = write(fd[i], byte_buffer[i], number_of_bytes_read_so_far[i]);
						//return_value = write(fd[i], byte_buffer[i], QUARTER_EVENT_SIZE_IN_BYTES);
						if (return_value == -1) {
							fprintf(error, "\nerror %ld writing to disk", return_value);
						} else if (return_value > 0) {
//							printf("\nwrote %d bytes to file", return_value);
						}
					#ifdef DO_NOT_WRITE_BAD_DATA_TO_DISK
					} else {
						fprintf(error, " event not written to disk\n");
					}
					#endif
				}
			}
		}
		usleep(NUMBER_OF_MICROSECONDS_TO_WAIT_INBETWEEN_EVENTS);
	}
//	printf("\n");
}

int open_files_for_output_and_read_N_events(unsigned long int N) {
	open_logfile();
	open_files_for_all_enabled_fiber_channels();
	
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
	fprintf(info, "\n");
	fprintf(info, "\ntotal number of readout events = %ld", total_number_of_readout_events);
	fprintf(info, "\n        total number of errors = %ld", total_number_of_errors);
	//printf("\nnumber of times exactly one packet was missing = %d", histogram_of_incomplete_events_560);
	//printf("\nnumber of times some other number of words was missing = %d", histogram_of_incomplete_events_other);
	fprintf(info, "\n");
	
	close_all_fiber_files();
}

void setup_filenames_for_fiber(void) {
//	printf("fiber_filename[%d] = \"%s\"\n", i, fiber_filename[i].c_str());
//	sprintf(fiber_filename[i], "%s%d.rawdata", logprefix, i);
	char temp[25];
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		fiber_filename[i] = base_filename;
		sprintf(temp, ".fiber%d", i);
		fiber_filename[i] += temp;
	}
}

void close_fiber_files_to_prepare_for_next_spill(void) {
//	printf("\n");
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		if (channel_bitmask & (1<<i)) {
				close(fd[i]);
		}
	}
}

void open_fiber_files_to_prepare_for_next_spill(void) {
	number_of_readout_events_for_this_spill = 0;
	setup_filenames_for_fiber();
	open_files_for_all_enabled_fiber_channels();
}

void open_files_for_all_enabled_fiber_channels(void) {
	//cout << "opening fiber files" << endl;
	fprintf(debug, "opening fiber files\n");
	// open and create the files
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
		if (channel_bitmask & (1<<i)) {
//			printf("%d %d\n", stdout_ch, i);
//			if (stdout_ch == i) continue;
//			if (fd[i] >= 0) {
				//fprintf(stdout, "closing file \"%s\"\n", old_fiber_filename[i].c_str());
//				fprintf(stdout, "\"%s\" closed\n", old_fiber_filename[i].c_str());
//				close(fd[i]);
//			}
			//fprintf(stdout, "attempting to open file \"%s\"...\n", fiber_filename[i].c_str());
			fprintf(info, "%s\n", fiber_filename[i].c_str());
			fd[i] = open(fiber_filename[i].c_str(), O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
			if (fd[i] < 0) {
				fprintf(error, "ERROR: failed to create file \"%s\"\n", fiber_filename[i].c_str());
				exit(6);
//			} else {
//				old_fiber_filename[i] = fiber_filename[i];
			}
		}
	}
	update_logfile_with_base_filename();
	files_are_open = true;
}

void close_all_fiber_files(void) {
	//cout << "closing fiber files" << endl;
	fprintf(debug, "closing fiber files\n");
	for(int i=0; i<NUMBER_OF_SCRODS_TO_READOUT; i++) {
//		if (channel_bitmask & (1<<i)) {
//			fprintf(error, "ch%d: %lld bytes - read: %lld us, logging %lld us, total %lld us\n", i, total[i], readtime[i], writetime[i], readtime[i] + writetime[i]);
//			close(fd[i]);
//		} else 
		if (fd[i] > 0) {
//			printf("closing file \"%s\" for card #%d channel #%d\n", fiber_filename[i].c_str(), card_id, i);
//			printf("%s closed\n", fiber_filename[i].c_str());
			close(fd[i]);
		}
	}
	files_are_open = false;
}

void reset_trigger_flip_flop(void) {
//	pci.selectChannel(i);
//	pci.sendData(, 560);
//	printf("\nsending signal to clear trigger flip flop");
	pci.sendVetoClear();
}

void wait_for_spill_to_finish(void) {
	while (spill_is_active()) {
		cout << "waiting for spill to finish..." << endl;
		usleep(1000);
	}
}

void wait_for_start_of_spill(void) {
	while (!spill_is_active()) {
		cout << "waiting for spill..." << endl;
		usleep(1000);
	}
}

bool spill_is_active(void) {
	unsigned long int signals = pci.readSignals();
	bool signal_2 = signals & (1<<0);
	bool signal_1 = signals & (1<<1);
	//cout << "signal_1: " << signal_1 << endl;
	return signal_1;
}

