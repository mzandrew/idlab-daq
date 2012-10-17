// 2012-08-16 mza

#include <fcntl.h>
#include <stdio.h>

#include "crtdaq-globals.h"
#include "DebugInfoWarningError.h"

FILE *debug   = 0;
FILE *debug2  = 0;
FILE *info    = 0;
FILE *warning = 0;
FILE *error   = 0;

void setup_DebugInfoWarningError(void) {
	static bool has_been_run_through;
//	if (has_been_run_through) {
//		return;
//	}
	static int stdout_fd, stderr_fd, devnull_fd;
	if (!has_been_run_through) {
		stderr_fd  = open("/dev/stderr", O_WRONLY);
		stdout_fd  = open("/dev/stdout", O_WRONLY);
		devnull_fd = open("/dev/null",   O_WRONLY);
	}
	
	if (_g_verbosity >= 1) {
		error = fdopen(stderr_fd, "w");
	} else {
		error = fdopen(devnull_fd, "w");
	}

	if (_g_verbosity >= 2) {
		warning = fdopen(stderr_fd, "w");
	} else {
		warning = fdopen(devnull_fd, "w");
	}

	if (_g_verbosity >= 3) {
		info = fdopen(stdout_fd, "w");
	} else {
		info = fdopen(devnull_fd, "w");
	}

	if (_g_verbosity >= 4) {
		debug = fdopen(stdout_fd, "w");
	} else {
		debug = fdopen(devnull_fd, "w");
	}


	if (_g_verbosity >= 5) {
		debug2 = fdopen(stdout_fd, "w");
	} else {
		debug2 = fdopen(devnull_fd, "w");
	}

//	fprintf(debug,   "this is the debug message\n");
//	fprintf(debug2,  "this is the debug2 message\n");
//	fprintf(info,    "this is the info message\n");
//	fprintf(warning, "this is the warning message\n");
//	fprintf(error,   "this is the error message\n");

	has_been_run_through = true;
}

unsigned short int change_verbosity(unsigned short new_verbosity = verbosity) {
	unsigned short int old_verbosity = _g_verbosity;
	_g_verbosity = new_verbosity;
	setup_DebugInfoWarningError();
	return old_verbosity;
}

//fprintf(debug, "\nchannel %d had %ld bytes to read", i, total_bytes_read_so_far);
//debug("\nchannel %d had %ld bytes to read", i, total_bytes_read_so_far);
//#include <cstdarg.h>
//void debug(...) {
//	va_list arguments;
//	
//}

