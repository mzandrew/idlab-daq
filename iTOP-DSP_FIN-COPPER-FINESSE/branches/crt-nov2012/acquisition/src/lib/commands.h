#ifndef COMMANDS_H_
#define COMMANDS_H_

#include <sys/types.h>

#define NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET (14)

#include "cmdpacket.h"

void send_soft_trigger_request_command_packet(void);
void send_front_end_trigger_veto_clear(void);
void check_and_synchronize_event_numbers(void);
void set_event_number(u_int32_t event_number);
void set_start_and_end_windows(u_int32_t start_window, u_int32_t end_window);
void set_number_of_windows_to_look_back(u_int32_t look_back);
void global_reset(void);
void clear_scaler_counters(void);
void set_some_DACs_to(unsigned short int value, unsigned short int channel_bitmask);
void set_all_DACs_to(unsigned short int value);
void set_all_DACs_to_built_in_nominal_values(void);
void enable_sampling_rate_feedback(void);
void disable_sampling_rate_feedback(void);
void setup_feedback_enables_and_goals(unsigned short int enable);
float temperature(unsigned short int fiber_channel);
void show_temperature_for_channel(unsigned short int channel_number);

#endif //COMMANDS_H_

