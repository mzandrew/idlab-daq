#include <fcntl.h>
#include <sys/ioctl.h>

#include "crtdaq-globals.h"
#include "cprdsp-fin-daq.h"

int cprdsp_fin_daq_init() {
  _g_cprfd = open(_g_cprdevpath.c_str(), O_RDONLY);
  
  if (_g_cprfd == -1) {
    fprintf(_g_error, "cprdsp_fin_daq_init(): unable to open `%s'\n", 
	    _g_cprdevpath.c_str());
    abort();
  }
  
  int ret = ioctl(_g_cprfd, CPRIO_INIT_RUN, 0);
  if (ret == -1) {
    fprintf(_g_error, "cprdsp_fin_daq_init(): "
	    "unable to initialize copper device\n");
    abort();

  } 

  return ret; 
}

int cprdsp_fin_daq_enabled_fins() {
  int ret;
  ioctl(_g_cprfd, CPRIOGET_FINESSE_STA, &ret);

  return ret;
}
