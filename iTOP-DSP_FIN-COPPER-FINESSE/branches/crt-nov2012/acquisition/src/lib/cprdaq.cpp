#include <iostream>
#include <fstream>
#include <fcntl.h>
#include <poll.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>

#include <copper.h>
#include <cprfin.h>
#include <cprdsp-fin.h>

#include "crtdaq-globals.h"
#include "logfile.h" // for graceful_exit

static struct pollfd *g_pollfd = NULL;

void 
cprdaq_reset_fifo_and_finesse() 
{
  int val;
  val = 0x1F;
  ioctl(_g_cprdev, CPRIOSET_FF_RST, &val, sizeof(val));
  val = 0;
  ioctl(_g_cprdev, CPRIOSET_FF_RST, &val, sizeof(val));

  ioctl(_g_cprdev, CPRIO_RESET_FINESSE, NULL);

  for (int i=0; i < MAXNFIN; i++) {
    if (_g_fins_enabled[i] <= 0) 
      continue;

    _g_findev[i] = open(_g_findevpath[i], O_RDONLY);

    if (_g_findev[i] <= 0) {
      fprintf(_g_error, "Error in `%s': unable to open fin device `%s'\n",
	      __func__, _g_findevpath[i]);
      abort();
    }

    ioctl(_g_findev[i], CPRDSP_FIN_IOC_CMD_RESET, 0);

    close(_g_findev[i]);
  }    
}


unsigned short 
cprdaq_available_fins() 
{
  unsigned short avail_mask = 0;

  for (int i=0; i < MAXNFIN; i++) {
    int fd = open(_g_findevpath[i], O_RDONLY);
    if (fd < 0)
      continue;

    avail_mask |= (0x1 << i);
    close(fd);      
  }

  return avail_mask;
}


int 
cprdaq_enable_fins(string fins_requested) 
{
  _g_fin_bitmask = 0;  
  _g_nfins_enabled = 0;

  if (fins_requested.find("auto") != string::npos) {
    fprintf(_g_error, "%s: finesse enable option `auto' not yet supported\n",
	    fins_requested.c_str());
      abort();
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
    
    close(_g_findev[i]);

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


int cprdaq_enable_loopback(const unsigned int mask) {
  fprintf(_g_warning, "%s: loopback only supported on channel 0\n",
  	  __func__);

  if (mask == 0x0)
    return 0;

  for (int i=0; i < MAXNFIN; i++) {
    if (_g_fins_enabled[i] <= 0)
      continue;

    if (!((mask >> i*4) & 0xF))
      continue;

    _g_findev[i] = open(_g_findevpath[i], O_RDONLY);

    if (_g_findev[i] < 0) {
      fprintf(_g_error, "Unable to open requested FIN `%c': `%s'\n",
	      'a' + i, strerror(-_g_findev[i]));
      abort();
    }
    
    ioctl(_g_findev[i], CPRDSP_FIN_IOC_LOOPBK_ON, CPRDSP_FIN_FIBERALL);    

    close(_g_findev[i]);
  }

  return mask;
}
			

int cprdaq_disable_loopback(const unsigned int mask) {
  fprintf(_g_warning, "%s: loopback mode not implemented yet\n",
	  __func__);  

  for (int i=0; i < MAXNFIN; i++) {
    if (_g_fins_enabled[i] <= 0)
      continue;

    if (!((mask >> i*4) & 0xF))
      continue;

    _g_findev[i] = open(_g_findevpath[i], O_RDONLY);

    if (_g_findev[i] < 0) {
      fprintf(_g_error, "Unable to open requested FIN `%c': `%s'\n",
	      'a' + i, strerror(-_g_findev[i]));
      abort();
    }
    
    ioctl(_g_findev[i], CPRDSP_FIN_IOC_LOOPBK_OFF, 0);    
    
    close(_g_findev[i]);
  }

  return mask;
  
}

int 
cprdaq_init() 
{
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

  cout << "Here foo: " << __FILE__ << ": " << __LINE__ << endl;

  cprdaq_enable_loopback(_g_loopback_mask);
  cout << "Here foo: " << __FILE__ << ": " << __LINE__ << endl;

  int ret = 0;
  for (int i=0; i<100; i++) {
    u_int32_t val;
    cprdaq_reset_fifo_and_finesse();
    ret = ioctl(_g_cprdev, CPRIOGET_FF_STA, &val, sizeof(val));
    if ((val & 0xFF) == 0x23)
      break;
    usleep(50000);
  }


  if (g_pollfd != NULL) 
    delete[] g_pollfd;
  
  g_pollfd = new pollfd[1];
  g_pollfd[0].fd = _g_cprdev;
  g_pollfd[0].events = POLLIN;
        
  return ret; 
}

void 
cprdaq_term() 
{
  if (_g_cprdev) {
    ioctl(_g_cprdev, CPRIO_END_RUN, 0);
    close(_g_cprdev);
  }
  
  if (g_pollfd != NULL) {
    delete[] g_pollfd;
    g_pollfd = NULL;
  }
}


unsigned short 
cprdaq_link_status() 
{
  unsigned short mask = 0;
  for (int i=0; i < MAXNFIN; i++) {
    if (!_g_fins_enabled[i])
      continue;
    
    _g_findev[i] = open(_g_findevpath[i], O_RDONLY);

    if (_g_findev[i] < 0) {
      fprintf(_g_error, "Unable to open requested FIN `%c': `%s'\n",
	      'a' + i, strerror(-_g_findev[i]));
      abort();
    }

    unsigned link_status = 0x0;
    ioctl(_g_findev[i], CPRDSP_FIN_IOC_LINKSTAT, &link_status);
  
    close(_g_findev[i]);

    mask |= link_status << i*4; 
  }

  return mask;
}
  

int 
cprdaq_send_data(u_int32_t *buf, int len, unsigned short mask)
{
  if (len > 255) {
    fprintf(_g_error, "Attempt to send data with len %d; "
	    "max length is 255\n", len);
    graceful_exit();
  }
    
  fprintf(_g_warning, "%s: bitmask argument is currently ignored\n",
	  __func__);

  for (int j=0; j < MAXNFIN; j++) {
    if (_g_fins_enabled[j] <= 0) 
      continue;

    _g_findev[j] = open(_g_findevpath[j], O_RDONLY);

    if (_g_findev[j] < 0) {
      fprintf(_g_error, "Unable to open requested FIN `%c': `%s'\n",
	      'a' + j, strerror(-_g_findev[j]));
      abort();
    }

    ioctl(_g_findev[j], CPRDSP_FIN_IOC_CMD_CLEAR, 0);

    for (int i=0; i < len; i++)
      ioctl(_g_findev[j], CPRDSP_FIN_IOC_CMD_LOAD, buf[i]);
      
    ioctl(_g_findev[j], CPRDSP_FIN_IOC_CMD_SEND);           

    close(_g_findev[j]);
  }

  return len;
}
  

int cprdaq_send_veto_clear() {
  fprintf(_g_error, "Call to unimplemented function `%s'\n",
	  __func__);

  _g_logfile << "Call to unimplemented function `" << __func__ << "'" << endl;

  return 1;
}  


int cprdaq_read_event(u_int32_t *buf, int bufsize, bool block) 
{
  int nbytes_read = 0;

  if (g_pollfd == NULL) {
    fprintf(_g_error, "Call to `%s' with NULL g_pollfd ptr\n",
	    __func__);
    
    abort();
  } 

  if (!block) {    
    if (poll(g_pollfd, 1, _g_cprpoll_timeout_ms) > 0)    
      nbytes_read = read(_g_cprdev, buf, bufsize);
    else
      return 0;
  } 
  else 
    nbytes_read = read(_g_cprdev, buf, bufsize);    
    
  return nbytes_read;
}  

