#include <iostream>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <string.h>

#include <copper.h>
#include <cprfin.h>
#include <cprdsp-fin.h>

#include "crtdaq-globals.h"

void cprdaq_reset_fifo_and_finesse()
{
    int val;
    val = 0x1F;
    ioctl(_g_cprdev, CPRIOSET_FF_RST, &val, sizeof(val));
    val = 0;
    ioctl(_g_cprdev, CPRIOSET_FF_RST, &val, sizeof(val));
}

int cprdaq_fin_init() {
  

int cprdaq_init() {

  cprdaq_fin_init();

  _g_cprdev = open(_g_cprdevpath, O_RDONLY);
  
  if (_g_cprdev == -1) {
    fprintf(_g_error, "cprdaq_init(): unable to open `%s'\n", 
	    _g_cprdevpath);
    abort();
  }
  
  int ret = ioctl(_g_cprdev, CPRIO_INIT_RUN, 0);
  if (ret == -1) {
    fprintf(_g_error, "cprdaq_init(): "
	    "unable to initialize copper device\n");
    abort();
  } 
  
  for (int i=0; i<100; i++) {
    unsigned int val;
    cprdaq_reset_fifo_and_finesse();
    ret = ioctl(_g_cprdev, CPRIOGET_FF_STA, &val, sizeof(val));
    if ((val & 0xFF) == 0x23)
      break;
  }

  return ret; 
}

void cprdaq_term() {
  if (_g_cprdev) {
    ioctl(_g_cprdev, CPRIO_END_RUN, 0);
    close(_g_cprdev);
  }
}

int cprdaq_available_fins() {
  int avail_mask = 0;

  for (int i=0; i < MAXNFIN; i++) {
    if (_g_findev[i] > 0) {
	avail_mask |= (0x1 << i);
	continue;
    }
    
    int fd = open(_g_findevpath[i], O_RDONLY);
    if (fd < 0)
      continue;

    avail_mask |= (0x1 << i);
    close(fd);      
  }

  return avail_mask;
}


int cprdaq_enable_fins(string fins_requested) {
  _g_fin_bitmask = 0;  
  
  for (int i=0; i < MAXNFIN; i++) {
    _g_fins_enabled[i] = false;

    char slot_num = '0' + i;
    char slot_alpha = 'a' + i;
    
    if ((fins_requested.find(slot_num) == string::npos) &&
	(fins_requested.find(slot_alpha) == string::npos))
      continue;
    
    _g_findev[i] = open(_g_findevpath[i], O_RDONLY);

    if (_g_findev[i] < 0) {
      fprintf(_g_error, "Unable to open requested FIN `%c': `%s'\n",
	      slot_alpha, strerror(-_g_findev[i]));
      abort();
    }
    
    _g_fin_bitmask |= 0x1<<i;      
    _g_fins_enabled[true];
    
  }

  bool cprdev_was_closed = false;
  if (!_g_cprdev) {
    cprdaq_init();
    cprdev_was_closed = true;
  }

  int ioctl_ret = ioctl(_g_cprdev, CPRIOSET_FINESSE_STA, &_g_fin_bitmask);
  if (ioctl_ret < 0) {
    fprintf(_g_error, "ioctl to copper driver to enable requested fins failed"
	    " with status `%s'\n", strerror(-ioctl_ret));
    abort();
  }

  int check = 0;
  ioctl_ret = 0;
  ioctl_ret = ioctl(_g_cprdev, CPRIOGET_FINESSE_STA, &check);
  
  if (ioctl_ret < 0) {
    fprintf(_g_error, "ioctl to copper driver to check successful fin enable"
	    " failed with status `%s'\n", strerror(-ioctl_ret));
    abort();
  }
  
  if (check != _g_fin_bitmask) {
    fprintf(_g_error, "Attempt to enable requested fins in copper driver"
	    " failed (requested: %x, received: %x)\n", _g_fin_bitmask, check);
    abort();
  }    

  if (cprdev_was_closed)
    cprdaq_term();

  return 0;
}

int cprdaq_enable_fins(int enable_request) {
  fprintf(_g_error, "Call to unimplemented function `%s'\n",
	  __func__);

  abort();  
}

int cprdaq_link_status() {
  


void cprdaq_close_data_file() {
  fprintf(_g_error, "Call to unimplemented function `%s'\n",
	  __func__);

  abort();  

}

int cprdaq_open_data_file() {
  fprintf(_g_error, "Call to unimplemented function `%s'\n",
	  __func__);

  abort();  

  return 1;
}
