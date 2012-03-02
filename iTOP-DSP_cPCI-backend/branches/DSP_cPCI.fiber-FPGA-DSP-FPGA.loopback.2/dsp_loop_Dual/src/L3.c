/*****************************************************************************
 * Shared Memory L3
 * L3.c
 * Chester Lim
 *****************************************************************************/

/* Code and data can be mapped into internal L3 memory by placing them into the
   sml3 sub-project. 

   To share data between the two cores, do the following:
   * Define the shared-data items to be shared in a source module that contains
     only shared items.
   * Make the source module part of the sml3 sub-project.
   * Within the source module, define the file attribute 'sharing' with the
     value 'MustShare'.
   * Declare the data items to be volatile.

   The following is example code demonstrating the method of sharing data. */

#include "system.h"

#pragma file_attr("sharing=MustShare")
#pragma section("sdram_bank0") 
volatile unsigned int buffer32[num_buf][TWICE_NUM_WORD_PACKET/2];

/*
#pragma file_attr("sharing=MustShare")
#pragma section("sdram_bank0") 
volatile unsigned int buffer0[140];

#pragma file_attr("sharing=MustShare")
#pragma section("sdram_bank0") 
volatile unsigned int buffer1[140];

#pragma file_attr("sharing=MustShare")
#pragma section("sdram_bank0") 
volatile unsigned int buffer2[140];
*/
