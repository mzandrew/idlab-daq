/*
 * Version 1.100: Introduced the version system;
 * Version 1.101: Added channel enable/disabled ioctl. Fixed bugs with dma io returns
 * Verison 1.102: Added channel status ioctl. Check all user buffers in chardev. Inlined utill functions. O2 optimization.
 * Verison 1.103: Changed channel status to the whole register. Added monitor header ttl support.
 * Verison 1.104: Added support for legacy systems, such as RHEL 5.
 * Verison 1.105: Added support for reading the monitor register.
 */
/**
 * \file altix_userland.h
 * This file is shared between the kernel and userland to define access to the kernel resources.
 */
#ifndef ALTIX_USERLAND_HEADER
#define ALTIX_USERLAND_HEADER

#define INT_2_STR_HELPER(x) #x
#define INT_2_STR(x) INT_2_STR_HELPER(x)

#define ALTIX_DRIVER_VERSION 105
#define ALTIX_DRIVER_VERSION_STRING "1." INT_2_STR(ALTIX_DRIVER_VERSION)

#ifdef __KERNEL__
#include <linux/types.h>
#else
#include <stdint.h>
#endif

///IOCTL deffinitions
#define ALTIX_IOCTL_NUM 0x881
#define ALTIX_IOCTL_INFO 0x882
#define ALTIX_IOCTL_LOCK 0x883
#define ALTIX_IOCTL_RELEASE 0x884
#define ALTIX_IOCTL_STAT 0x885
#define ALTIX_IOCTL_DMA 0x887
#define ALTIX_IOCTL_CHAN 0x888
#define ALTIX_IOCTL_VERSION 0x889
#define ALTIX_IOCTL_CHAN_ENABLE 0x88A
#define ALTIX_IOCTL_CHAN_STATUS 0x88B
#define ALTIX_IOCTL_FANCY	0x88C
///Fancy command a ttl pulse on Monitor header 0.
#define ALTIX_IOCTL_FANCY_CMD_MON_0 0

///Fancy command a ttl pulse on Monitor header 1.
#define ALTIX_IOCTL_FANCY_CMD_MON_1 1

#define ALTIX_IOCTL_FANCY_CMD_PULSE_READ 2


/**
 * Card information data structure. Used in the IOCTL call ALTIX_IOCTL_INFO.
 */
typedef struct
{
	uint id; 		/**< Card ID. This is read from the PCI bar.*/
	int pid; 		/**< PID of a process using this card. 0 if free. */
	int memlen; 	/**< Memory window for this card. This value is set via the pci_lib.*/
	int channel;	/**< Selected channel 0 through 4.*/
} altix_pci_card_info;


//Performance monitoring

/**
 * Driver performance structure. Used in  IOCTL call ALTIX_IOCTL_INFO.
 */
typedef struct
{
	int id;						/**< Card ID. */
	unsigned int num_reads;		/**< Number of reads which occurred on this card. */
	unsigned int num_writes; 	/**< Number of writes which occurred on this card. */
	uint64_t  bytes_written;	/**< Number of bytes written to the card.*/
	uint64_t bytes_read;		/**< Number of bytes read from the card.*/
} altix_pci_card_stat;

#endif
