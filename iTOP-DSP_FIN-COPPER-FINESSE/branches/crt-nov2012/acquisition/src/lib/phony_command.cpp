#include <cstdio>

#include "crtdaq-globals.h"

void set_start_and_end_windows(unsigned short beg, unsigned short end) {
    fprintf(_g_error, "`%s' phony call; windows not set\n",
	  __func__);
  fflush(_g_error);
}
