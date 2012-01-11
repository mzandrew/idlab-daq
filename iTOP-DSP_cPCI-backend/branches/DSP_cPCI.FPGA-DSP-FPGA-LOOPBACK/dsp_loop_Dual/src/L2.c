/*****************************************************************************
 * Shared Memory L2
 * sml2.c
 *****************************************************************************/

/* Code and data can be mapped into internal L2 memory by placing them into the
   sml2 sub-project. 

   To share data between the two cores, do the following:
   * Define the shared-data items to be shared in a source module that contains
     only shared items.
   * Make the source module part of the sml2 sub-project.
   * Within the source module, define the file attribute 'sharing' with the
     value 'MustShare'.
   * Declare the data items to be volatile.

   The following is example code demonstrating the method of sharing data. */

#include "system.h"

#pragma file_attr("sharing=MustShare")
#pragma section("l2_sram") 
volatile unsigned int buffer32[SIZE_QEV/2];

#pragma file_attr("sharing=MustShare")
#pragma section("l2_sram") 
volatile unsigned short *buffer16 = (unsigned short*)buffer32;

#pragma file_attr("sharing=MustShare")
#pragma section("l2_sram") 
volatile short term;

#pragma file_attr("sharing=MustShare")
#pragma section("l2_sram") 
volatile bool buffer_full = false;
