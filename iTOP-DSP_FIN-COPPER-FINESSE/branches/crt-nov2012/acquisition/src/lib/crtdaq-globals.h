#ifndef CRTDAQ_GLOBALS_H_
#define CRTDAQ_GLOBALS_H_

#include <string>
#include <sys/types.h>

using namespace std;

#define NSP_EXPNO (2)
#define MAXNFIN   (4)
#define MAXNFIBER (16)

#define NUMBER_OF_BYTES_IN_A_WORD (4)
#define NUMBER_OF_WORDS_IN_A_PACKET (140)
#define SINGLE_PACKET_BUFFER_SIZE_IN_BYTES \
  (NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD)

#define PACKET_HEADER_INDEX (0)
#define PACKET_SIZE_INDEX (1)
#define PACKET_PROTOCOL_FREEZE_DATE_INDEX (2)
#define PACKET_TYPE_INDEX (3)
#define EVENT_NUMBER_INDEX (4)
#define PACKET_NUMBER_INDEX (5)
#define PACKET_CHECKSUM_INDEX (NUMBER_OF_WORDS_IN_A_PACKET-2)
#define PACKET_FOOTER_INDEX (NUMBER_OF_WORDS_IN_A_PACKET-1)

#define NUMBER_OF_ROWS_IN_BOARD_STACK   (4)
#define NUMBER_OF_COLUMNS_IN_BOARD_STACK   (4)
#define NUMBER_OF_PACKET_TYPES (5)
#define NUMBER_OF_ARGUMENTS_IN_COMPLEX_COMMAND_PACKET (14)


//extern struct DAC_settings_type _g_DAC_settings;
//extern char             *_g_command_packet;
/* extern unsigned long     _g_packet_header; */
/* extern unsigned long     _g_protocol_freeze_date; */
/* extern unsigned long     _g_packet_type[NUMBER_OF_PACKET_TYPES]; */
/* extern unsigned long     _g_packet_footer; */

extern struct timeval _g_tstart, _g_tend, _g_watchdog;

// Set in config_file.cpp
extern string         _g_fins_requested;
extern string         _g_fibers_requested;
extern bool           _g_fins_enabled[MAXNFIN];
extern int            _g_findev[MAXNFIN];
extern const char*    _g_findevpath[MAXNFIN];
extern unsigned int   _g_fin_bitmask;
extern unsigned int   _g_fiber_bitmask;
extern int            _g_nfins_enabled;

extern string         _g_loopbacks_requested;
extern unsigned int   _g_loopback_mask;

extern string         _g_location_of_raw_datafiles;
extern string         _g_location_of_status_and_log_files;
extern string         _g_base_filename;
extern string         _g_data_filename;
extern int            _g_data_fd;
extern string         _g_camac_filename;
extern string         _g_run_type;
extern unsigned short _g_verbosity;
extern short          _g_temperature_redline;

extern float *_g_temperature_float;
extern bool   _g_should_soft_trigger;
extern unsigned int  _g_feedback_enables_and_goals[6];

extern char _g_red[13];
extern char _g_yellow[13];
extern char _g_white[13];

extern unsigned int _g_threshold_scan_low_limit;
extern unsigned int _g_threshold_scan_high_limit;
extern unsigned int _g_threshold_scan_step_size;
extern string         _g_current_date_string;

extern int _g_run_number;
extern int _g_spill_number;
extern int _g_experiment_number;
extern int _g_event_number;

extern int _g_number_of_readout_events_for_this_spill;
extern int _g_total_number_of_readout_events;
extern int _g_number_of_seconds_this_spill_has_been_active;
extern int _g_number_of_seconds_since_last_event;

extern const u_int32_t _g_packet_header;
extern const u_int32_t _g_protocol_freeze_date;
extern const u_int32_t _g_packet_type[NUMBER_OF_PACKET_TYPES];
extern const u_int32_t _g_packet_footer;
extern u_int32_t _g_packet[NUMBER_OF_WORDS_IN_A_PACKET];

extern bool _g_logfile_open;
extern string _g_logfile_filename;
extern ofstream _g_logfile;

// Filled in DebugInfoWarningError.cpp
extern FILE *_g_debug;
extern FILE *_g_debug2;
extern FILE *_g_info;
extern FILE *_g_warning;
extern FILE *_g_error;

extern int         _g_copper_subsys;
extern int         _g_copper_crate;
extern int         _g_copper_slot;
extern const char* _g_cprdevpath;
extern int         _g_cprdev;      // Assigned in cprdsp-fin-daq.cpp
extern int         _g_cprpoll_timeout_ms;

extern void (*_g_call_this_on_ctrl_c)(void);

void crtdaq_default_ctrl_c_handler();
void crtdaq_dump_globals();


#endif //CRTDAQ_GLOBALS_H_
