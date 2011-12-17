/*! \mainpage Libaltix library documentation
 *
 * \section lic_sec License
 *
 * Copyright(c) 2005-2011 Sergey Negrashov, University of Hawaii, Instrument Development Lab.
 * sin8@hawaii.edu
 * This code distribution is licensed under the terms of of the
 * GNU General Public License Version 2 (the ``GPL'').
 *
 * Software distributed under the License is distributed
 * on an ``AS IS'' basis, WITHOUT WARRANTY OF ANY KIND, either
 * express or implied. See the GPL for the specific language
 * governing rights and limitations.
 *
 * You should have received a copy of the GPL along with this
 * program. If not, go to http://www.gnu.org/licenses/gpl.html
 *  or write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 * \section intro_sec Introduction
 *
 * This is the documentation for the libaltix library. This library provides an intuitive interface for interfacing with
 * altix driver and DSP CPCI data acquisition card. It wraps all the IOCTL calls for you into a series of C functions.
 * Most of these functions require a file descriptor as an argument, therefore the user must use the open system call on the
 * altix driver handle before calling most functions.
 *
 * \section install_sec Requirements
 *
 * In order to build this software altix driver source tree is required. Furthermore it is advised to compile the driver and
 * libaltix using the same C compiler(gcc of the same version)
 *
 * Prerequisites:
 *  \li Compact PCI crate with an i686 or a X86_64 CPU. (Note: i586/i386 systems such as Pentium Pro are not supported)
 *      \li Linux kernel of version 2.6.26 or above.
 *      \li Linux kernel source tree, or Linux kernel headers of same version as the running kernel.
 *  \li gcc compiler of version 4.3 or above. (Note: because this driver uses the kernel build system, other compilers such as Borland C compiler or Intel C compiler are not supported.
 * 	\li altix driver source tree of the same version
 *
 * Additional Requirements: Because driver documentation is built from the source code, several tools are required to rebuild this document from the source tree.
 *      \li doxygen
 *  \li Latex distribution such as TeXLive.
 *  \li Graphviz software for generating dependency graphs.
 *
 * Tested systems:
 *
 *  \li Debian Lenny. Linux Kernel 2.6.26
 *      \li Debian Squeeze. Linux Kernel 2.6.32, Kernel 2.6.38.
 *      \li Ubuntu 10.04
 *  	\li Ubuntu 10.10
 *
 * In order to build the shared library type
 *
 * \a make
 *
 * This will produce libaltix.so, and altix_userland.h will be copied form the driver source tree. It is also possible to compile the debug version of the library in order to do so use:
 *
 * \a make lib_debug
 *
 * This will enable the debuging switch in gcc, and furthermore library will print debuggin messages to the standard out as the user program executes.
 *
 * \section use_sec Usage
 * In order to use this library you must add it to the LD_LIBRARY_PATH for the system, or the compiler must be notified of the placement of the library via -rpath command. For C code use:
 *
 * \a gcc -rpath <path to library> other options
 *
 * For C++ code use:
 *
 * \a g++ -Wl,-rpath,<path to library> other options
 *
 * Further more in order to use this library in C++ programs user must wrap the include statement with extern "C" tags as shown below:
 * \code
 * extern "C"
 * {
 * 		#include "libaltix.h"
 * }
 * \endcode
 */
#ifndef  LIB_ALTIX_HEADER
#define LIB_ALTIX_HEADER
#include <stdint.h>
#include "altix_userland.h"


#define ALTIX_OK 0					/**< Success */
#define ALTIX_NOT_INITIALIZED -1 	/**< altix_initialize was not run or failed */
#define ALTIX_CARD_BUSY -2			/**< Thread does not maintain the lock on the card */
#define ALTIX_CARD_NOT_VALID -3		/**< Card ID does not exist, or an error occured */

/**
 * Initialization routine. Run this function before any other library function.
 * \param char* dev
 * Path to the device driver. Usually /dev/altixpci0
 * \return
 * Number of cards plugged managed by the driver, or an error code on failure.
 */
int altix_initialize(char* dev);

/**
 * Returns an array of altix_pci_card_info objects, the buffer for these objects is managed by the library and should not be freed by the user.
 * This also causes a small memory leak because the memory never gets freed.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int *result
 * result of the operation
 * \return
 * Const array of altix_pci_card_info*. Don't free it!
 */
altix_pci_card_info* altix_get_cards(int fd, int *result);

/**
 * Attempts to lock the card with a given ID for use by the opened file descriptor.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int id
 * ID of the card you would like to lock.
 * \return
 * Error code.
 */
int altix_lock_card(int fd, int id);

/**
 * Attempts to release the card with a given ID for use by the opened file descriptor.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int id
 * ID of the card you would like to lock.
 * \return
 * Error code.
 */
int altix_release_card(int fd, int id);

/**
 * Returns an array of altix_pci_card_stat* objects, the buffer for these objects is managed by the library and should not be freed by the user.
 * This also causes a small memory leak because the memory never gets freed.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int *result
 * result of the operation
 * \return
 * Const array of altix_pci_card_stat*. Don't free it!
 */
const altix_pci_card_stat* altix_get_stats(int fd, int *result);

/**
 * Attempts to enable DMA on the card with a given by the opened file descriptor. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \return
 * Error code.
 */
int altix_toggle_dma(int fd);

/**
 * Attempts to switch channels on the card with a given by the opened file descriptor. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int channel
 * Channel you would like to switch to. Must be between 0 and 3.
 * \return
 * Error code.
 */
int altix_switch_channel(int fd, int channel);

/**
 * Reads 140*130*4 bytes from the selected card and channel. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param void* buff
 * Buffer you want to read the data into. If this value is NULL a buffer will be malloced for you.
 * \return
 * Pointer to the newly allocated, or passed buffer is success, or NULL if failure.
 */
void* altix_read_event(int fd, void* buff);

/**
 * Writes 140*4 bytes to the selected card and channel. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param void* buff
 * Buffer with data to be written.
 * \return
 * Error code.
 */
int altix_send_command(int fd, void* buff);

/**
 * Polls a selected channel on a card referenced by the opened file descriptor for reading. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \return
 * 1 if there is data available, 0 is there is no data available.
 */
int altix_poll_read(int fd);


/**
 * Polls a selected channel on a card referenced by the opened file descriptor for writing. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \return
 * 1 output FIFO is not full, 0 output FIFO is full.
 */
int altix_poll_write(int fd);

/**
 * Enable selected channel on a card referenced by the opened file descriptor for writing. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int on
 * Enable flag, 0 for disable, 1 for enable
 * \return
 * Error code
 */
int altix_enable_chan(int fd, int on);

/**
 * Get channel Aurora link status mask. Lower 4 bits represent the status. User must maintain a lock on the card.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int * stat
 * Status mask for the card. Bit 0: channel 0 status, Bit 1: channel 1 status ... etc
 */
int altix_chan_status(int fd, int* stat);

/**
 * Get status of the last transfer.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int * stat
 * Status of the last transfer. [0:3] PCI bus error for  channels, [4] dma error, [5] DMA finished, [6] Address error, [7] Watchdog overflowed, [8:11] Aurora ststus, [16:19] aurora error. 
 */
int altix_last_transfer_status(int fd, int *stat);

/**
 * Get status of the last transfer.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int fpga
 * Use monitor header to send a pulse from. Allowed values are 0 for fpga 0, anything else for fpga 1;
 */
int altix_send_pulse(int fd, int fpga);

/**
 * Read the pulse register.
 * \param int fd
 * Opened file descriptor for the driver.
 * \param int ret
 * Return value.
 * Read the pulse register.
 */
int altix_read_pulse(int fd, int* ret);

/**
 * Get event size in bytes. this value is fixed. Will return 140*130*3. Placed here for your convenience. User must maintain a lock on the card.
 * \return
 * Event size in bytes.
 */
int altix_event_size(void);

/**
 * Get packet size in bytes. this value is fixed. Will return 140*3. Placed here for your convenience. User must maintain a lock on the card.
 * \return
 * Packet size in bytes.
 */
int altix_packet_size(void);

/**
 * Get the altix driver version.
 * This value get compared to the library version on initialization. If they don't match some functions may fail! Always rebuild the library when the kernel version changes
 * \param int fd
 * Opened file descriptor for the driver.
 * \return
 * Driver version.
 */
int altix_get_kernel_version(int fd);
#endif
