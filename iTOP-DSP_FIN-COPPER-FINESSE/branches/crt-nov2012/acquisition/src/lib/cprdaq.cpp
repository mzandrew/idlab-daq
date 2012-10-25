#include <iostream>
#include <fstream>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <string.h>

#include <copper.h>
#include <cprfin.h>
#include <cprdsp-fin.h>

#include "crtdaq-globals.h"

void cprdaq_reset_fifo_and_finesse() {
  int val;
  val = 0x1F;
  ioctl(_g_cprdev, CPRIOSET_FF_RST, &val, sizeof(val));
  val = 0;
  ioctl(_g_cprdev, CPRIOSET_FF_RST, &val, sizeof(val));

  ioctl(_g_cprdev, CPRIO_RESET_FINESSE, NULL);
}


int cprdaq_enable_fins(string fins_requested) {
  _g_fin_bitmask = 0;  
  _g_nfins_enabled = 0;

  if (fins_requested.find("auto") != string::npos) {
    _g_fin_bitmask = cprdaq_available_fins();
    for (int i=0; i < MAXNFIN; i++) {
      if (_g_fin_bitmask >> i & 0x1) {
	_g_fins_enabled[i] = true;
	_g_nfins_enabled++;
      }
      else
	_g_fins_enabled[i] = false;
    }
    
    return _g_nfins_enabled;
  }
	    

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
    _g_fins_enabled[i] = true;
    _g_nfins_enabled++;
    
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
  
}


int cprdaq_init() {
  _g_cprdev = open(_g_cprdevpath, O_RDONLY);

  if (_g_cprdev == -1) {
    fprintf(_g_error, "cprdaq_init(): unable to open `%s'\n", 
	    _g_cprdevpath);
    abort();
  }

  cprdaq_enable_fins(_g_fins_requested);
  
  // None of the four ioctl's below use a return value to 
  // communicate error states
  ioctl(_g_cprdev, CPRIO_SET_SUBSYS, &_g_copper_subsys);
  ioctl(_g_cprdev, CPRIO_SET_CRATE, &_g_copper_crate);
  ioctl(_g_cprdev, CPRIO_SET_SLOT, &_g_copper_slot);  
  ioctl(_g_cprdev, CPRIO_INIT_RUN, 0); 

  int ret = 0;
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

unsigned short cprdaq_available_fins() {
  unsigned short avail_mask = 0;

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




unsigned short cprdaq_link_status() {
  fprintf(_g_warning, "`%s' just requires one active fiber on each FIN\n",
	  __func__);
  fflush(_g_warning);

  return _g_fin_bitmask;


  const unsigned int link_status_addr = 0x79 << 2; 
  unsigned short mask;
  for (int i=0; i < MAXNFIN; i++) {
    if (!_g_fins_enabled[i])
      continue;
    
    unsigned short link_status = 0x0;
    ioctl(_g_findev[i], CPRDSP_FIN_IOC_SET, &link_status_addr);
    ioctl(_g_findev[i], CPRDSP_FIN_IOC_R, &link_status_addr);
  
    if (link_status != 0x0)
      mask |= 0x1 >> i;

  }

  return mask;
}
  

int cprdaq_send_data(const char* buf, int len, unsigned short mask) {
  fprintf(_g_error, "Call to unimplemented function `%s'\n",
	  __func__);

  _g_logfile << "Call to unimplemented function `" << __func__ << "'" << endl;

  return 1;
}

int cprdaq_send_veto_clear() {
  fprintf(_g_error, "Call to unimplemented function `%s'\n",
	  __func__);

  _g_logfile << "Call to unimplemented function `" << __func__ << "'" << endl;

  return 1;
}  

int cprdaq_read_event(unsigned long *buf, int bufsize) {
  fprintf(_g_warning, "In `%s': no way to do a non-blocking read\n",
	  __func__);

  int nbytes_read = read(_g_cprdev, buf, sizeof(buf));
  
  return nbytes_read;
}  
