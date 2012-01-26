/********************************************************************************/
/*                                                                             	*/
/* Boot ROM for the Blackfin products and silicon revisions                    	*/
/*     ADSP-BF561-0.5                                                          	*/
/*                                                                             	*/
/*     for documentation see application note                                  	*/
/*                                                                             	*/
/*        ADSP-BF561 Blackfin® Booting Process (EE-314)            							*/
/*                                               	                         			*/
/* (c) Analog Devices Inc. (2006) 																							*/
/*                                                                             	*/
/* Boot Modes:																																	*/
/* 00 - Test Mode 																															*/
/* 01 - boot from 8 or 16 bit flash (use width in global header)								*/
/* 10 - boot in SPI slave mode 																									*/
/* 11 - boot from 16 or 24 bit SPI memory devices																*/
/********************************************************************************/



#define FIO0_DIR        0xFFC00730 			// Flag Direction register
#define FIO0_FLAG_C 		0xFFC00704 		// Flag Clear register
#define FIO0_FLAG_S     0xFFC00708 			// Flag Set register
#define FIO0_FLAG_T     0xFFC0070C 			// Flag Toggle register (mask used to  




// These register definitions have been hard-coded to avoid losing track of
// which #include file is used.
#define CHIPID          0xFFC00014 // Testmode Chip ID register

// SICA Interrupt Mask register 0
#define SICA_IMASK0             0xFFC0010C      

// core A Interrupt Wakeup-Enable register 0 (peripherals 0-31)
#define SICA_IWR0     0xFFC0011C

// core A Interrupt Wakeup-Enable register 1 (peripherals 32-64)
#define SICA_IWR1     0xFFC00120

// System Reset Configuration register  
#define SICA_SYSCR      0xFFC00104 

// SDRAM Memory Bank Control register 
#define EBIU_SDBCTL             0xFFC00A14 


#define EVT3                   0xFFE0200C  // Event Vector 3 ESR Address
#define EVT7                   0xFFE0201C  // Event Vector 7 ESR Address
#define EVT9                   0xFFE02024  // Event Vector 9 ESR Address
#define EVT15                  0xFFE0203C  // Event Vector 15 ESR Address

#define IMASK                  0xFFE02104  // Interrupt Mask Register

#define EVT_IVG3               (1<<3) // IVG9 interrupt mask
#define EVT_IVG7               (1<<7) // IVG9 interrupt mask
#define EVT_IVG9               (1<<9) // IVG9 interrupt mask
#define EVT_IVG15              (1<<15) // IVG15 interrupt mask


// Memory DMA registers
#define MDMA2_S0_CONFIG         0xFFC00F48 //MemDMA2 Stream 0 Source Configuration register
#define MDMA2_D0_CONFIG         0xFFC00F08 //MemDMA2 Stream 0 Destination Configuration register
#define MDMA2_S0_X_MODIFY       0xFFC00F54 //MemDMA2 Stream 0 Source Inner-Loop Address-Increment register
#define MDMA2_D0_X_MODIFY       0xFFC00F14 //MemDMA2 Stream 0 Destination Inner-Loop Address-Increment register
#define MDMA2_D0_X_COUNT        0xFFC00F10 //MemDMA2 Stream 0 Destination Inner-Loop Count register 
#define MDMA2_S0_X_COUNT        0xFFC00F50 //MemDMA2 Stream 0 Source Inner-Loop Count register 
#define MDMA2_S0_CURR_ADDR      0xFFC00F64 //MemDMA2 Stream 0 Source Current Address
#define MDMA2_S0_START_ADDR     0xFFC00F44 //MemDMA2 Stream 0 Source Start Address
#define MDMA2_D0_START_ADDR     0xFFC00F04 //MemDMA2 Stream 0 Destination Start Address
#define MDMA2_D0_IRQ_STATUS     0xFFC00F28 //MemDMA2 Stream 0 Destination Interrupt/Status Register      
#define MDMA2_S0_IRQ_STATUS		0xFFC00F68 //MemDMA2 Stream 0 Source Interrupt/Status Register

// SPI registers
#define SPI_BAUD        0xFFC00514 // SPI Baud Rate register
#define SPI_FLG         0xFFC00504 // SPI Flag register
#define SPI_TDBR        0xFFC0050C // SPI Transmit Data Buffer register
#define SPI_CTL         0xFFC00500 // SPI Control register
#define SPI_RDBR        0xFFC00510 // SPI Receive Data Buffer register
#define SPI_STAT        0xFFC00508 // SPI Status register

// SPI DMA registers
#define DMA2_4_X_MODIFY        0xFFC00D14 // DMA2 Channel 4 Inner Loop Addr Increment   
#define DMA2_4_START_ADDR      0xFFC00D04 // DMA2 Channel 4 Start Address               
#define DMA2_4_X_COUNT         0xFFC00D10 // DMA2 Channel 4 Inner Loop Count            
#define DMA2_4_CONFIG          0xFFC00D08 // DMA2 Channel 4 Configuration register      
#define DMA2_4_IRQ_STATUS      0xFFC00D28 // DMA2 Channel 4 Interrupt/Status Register   

// MISR registers
#define MISRCTL         0xFFC01400 // MISR control register
#define RMISR2          0xFFC0140C // MISR sysL2[31:0] read bus

// Wakeup Enable  - DMA2_4 - SPI = peripheral 27 on IWR0
#define WAKEUP_PERIPHERAL_27	0x08000000  // mask for bit 27
//
// Wakeup Enable MDMA 2 destination = peripheral 24 on IWR1
#define WAKEUP_PERIPHERAL_55	0x00800000  // mask for bit 23 (55 out of 32-64)

// Some definitions from tahoe def file

// Enable Asynchronous Memory Bank 0 only
#define AMBEN_B0	0x00000002	

// Enable 16-bit packing for Asynchronous Memory Bank 0
#define B0PEN		0x00000010	

// Bank 0 Read Access Time = 15 cycles
#define B0RAT_15	0x00000F00	

// Bank 0 Hold Time from Read or Write deasserted to AOE deasserted = 3 cycles
#define B0HT_3		0x000000C0	

// Bank 0 RDY Active high, 0=active low, 1=active high
#define B0RDYPOL	0x00000002	

// Bank 0 Write Access Time = 15 cycles
#define B0WAT_15	0x0000F000	


// used to set up pointer registers and offset from them
#define SYSMMR_BASE 0xFFC00000
#define COREMMR_BASE 0xFFE00000

#define ASYNC_MEM_START         0x20000000 // Asynchronous Memory Start Address

#define COREA_L1_SCRATCH_END    0xFFB00FFC // Core A End of Scratch RAM

// The global header will indicate SPI baud rate, flash width

// address of global header in external flash memory

#define GlobalHeaderAddress	ASYNC_MEM_START


/****************** L1 Memory *********************************************/


#define Common_L2_SRAM	0xFEB00000	// 128 K Common L2 SRAM


// Core A Internal Memory

#define CoreA_DataBA		0xFF800000	// Core A Data Bank A 32k
#define CoreA_DataBB		0xFF900000	// Core A Data Bank B 32k
#define CoreA_Code_SRAM		0xFFA00000	// Core A Code SRAM 16k
#define CoreA_Code_C_SRAM	0xFFA10000	// Core A Code Cache or SRAM 16k


// Core B Internal Memory

#define CoreB_DataBA		0xFF400000	// Core B Data Bank A 32k
#define CoreB_DataBB		0xFF500000	// Core B Data Bank B 32k
#define CoreB_Code_SRAM		0xFF600000	// Core B Code SRAM 16k
#define CoreB_Code_C_SRAM	0xFF610000	// Core B Code Cache or SRAM 16k


#define CoreA_Scratch_SRAM	0xFFB00000	// Code A Scratch SRAM - 4k
#define CoreB_Scratch_SRAM	0xFF700000	// Code B Scratch SRAM - 4k

// allowing 40 bytes for stack

#define StackTop COREA_L1_SCRATCH_END

// end of L2 in teton-lite
#define FixedData		0xFEB1FFFC	


// General Purpose storage address at end of L2 common
#define GPStorage		FixedData -4

// Space to permanently store global header after it's read
#define GlobalHeaderDest	GPStorage -4

// Space to temporarily store global header after it's read
#define HeaderBuffer	GlobalHeaderDest -12



.global _bootkernel;


/**************************************************************************/


.section program;

_bootkernel:

     L0 = 0x0;							
     L1 = 0x0;
     L2 = 0x0;
     L3 = 0x0;
     
// Set up supervisor stack in L1 Scratch Memory
     SP.H = HI(StackTop);
     SP.L = LO(StackTop);		

// P0 Points to the beginning of CORE MMR Space
     P0.H = HI(COREMMR_BASE);	
     P0.L = LO(COREMMR_BASE);
     
     
// Set up DMA error & exception handler    
// 07/24/03 - changed exception handler to jump to GP DMA error and 
     
     P2.L = LO(DMA_ERROR_OR_EXCEPT);
     P2.H = HI(DMA_ERROR_OR_EXCEPT);

// Place the address of dma error & exception handler in IVG3 of EVT
     [P0+LO(EVT3)] = P2;	      
     
// Place the address of dma error & exception handler in IVG7 of EVT
     [P0+LO(EVT7)] = P2;	     
     
/***************** Code to Stay in Supervisor Mode **********************/

     P2.L = LO(START);
     P2.H = HI(START);

////////////////////  With This  //////////////////////
// Place the address of start code in IVG15 of EVT
     [P0+LO(EVT15)] = P2;	

// Set(enable) IVG15 and DMA error and EXCEPTION in Interrupt Mask Register
     R1 = (LO(EVT_IVG15) | LO(EVT_IVG7) | LO(EVT_IVG3))(Z);
     [P0+LO(IMASK)] = R1;	

// Invoke IVG15 interrupt
     RAISE  15;

//////////////////////////////////////////////////////////////////////
		
     P2.L = LO(WAIT_HERE);
     P2.H = HI(WAIT_HERE);

// Set Reset Return Address 
     RETI = P2;		

// Return from Reset Interrupt
     RTI;			

// Wait here till IVG15 interrupt is processed
WAIT_HERE:			
     JUMP WAIT_HERE;

/*************************************************************************/

.align 4;
START:
// RETI must be pushed to enable interrupts.  
	[--SP] = RETI;		

// Boot code in supervisor mode starts here.		

// P4 will point to the address ZERO 
// which contains a zero, for zero fill DMA
	CSYNC;        // added dec 06 02 to avoid the exception @@@@
	P4.L = LO(ZERO);		
	P4.H = HI(ZERO);		
		
// P1 Points to the beginning of SYSTEM MMR Space
	P1.H = HI(SYSMMR_BASE);	
	P1.L = LO(SYSMMR_BASE);

	
// Enable Wake-Up function for SPI DMA 
	R3.H = HI(WAKEUP_PERIPHERAL_27);
	R3.L = LO(WAKEUP_PERIPHERAL_27);
	[P1+LO(SICA_IWR0)] = R3;	

// Enable Wake-Up function for MDMA2 destination	
	R3.H = HI(WAKEUP_PERIPHERAL_55);
	R3.L = LO(WAKEUP_PERIPHERAL_55);	
	[P1+LO(SICA_IWR1)] = R3;
		
// enable DMA2 and IMDMA 
	R3.L = 0x0C;
	R3.H = 0x0;
	[P1+LO(SICA_IMASK0)] = R3;	
	

//  see if we got here through a user implemented software reset. 

	R7 = W[P1+LO(SICA_SYSCR)] (Z);
	cc = BITTST(R7,4);
//adding the CLEAR_MEMO function LM
	IF !CC JUMP CALL_MEMO_CLEAR; // continue boot?  
	nop; nop;
	nop; nop;
	JUMP.L JUMP_USER_PROGRAM;

// If Software Reset and Bypass Normal Boot Sequence, Jump to L1 Code SRAM

CALL_MEMO_CLEAR: 
// Made this a call, we also call it when DMA error or exception.
	CALL MEMO_CLEAR; // removed for debugger testing, 

READ_BMODE:
	R0 = 0x04;  

// Source Modify = 1
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R0;	

// destination Modify = 1
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R0;

// re-configure DMA
// R4 = destination
	R4 = 0x8B;      
// R3 = source 
// 8-bit transf/ wake int enable/ mem rd
	R3 = 0x09;    

 
// From now on, P3 Points to the Header Buffer in core A scratch

	P3.L = LO(HeaderBuffer);	
	P3.H = HI(HeaderBuffer);
	R7 = W[P1+LO(SICA_SYSCR)] (Z);	

	
		
// --------------------------------------------------------------------
// Read BMODE
//
// -------------------------------------------------------------------- 
	
// Test the BMODE pins
// mask out all except the BMODE pins
	R1 = 0x000E;
	R0 = R7 & R1;
     
	R1 = 0x2;
	cc = R0 == R1;		
// BMODE = 001, Boot from Flash
	IF cc JUMP FLASH_BOOT;		

	R1 = 0x4;
	cc = R0 == R1;
// BMODE = 010, Boot in SPI slave mode
    IF !CC JUMP SKIP_SLAVE_BOOT;
	  jump SPI_SLAVE_BOOT;
SKIP_SLAVE_BOOT:
	R1 = 0x6;
	cc = R0 == R1;
// BMODE = 011, Boot from 16-bit SPI0 Serial ROM
	IF cc JUMP SPI0_BOOT;		

// Should never get here.
	IDLE;				

/****************** Flash BOOT *****************************************/
// External Async Memory Bank 0 defaults to enabled; 16 bit packing
// Don't need to do any initialization
//	R7 = W[P1+LO(EBIU_AMGCTL)];
//	R6.L = AMBEN_B0;
//	R7 = R7 | R6;
//	W[P1+LO(EBIU_AMGCTL)] = R7;	
// Asynchronous Memory Bank Control Register
//	R7 = [P1+LO(EBIU_AMBCTL0)];
// Enable 3 Hold Cycles (Max), 15 Wait States (Max), 
//	R6.H = 0;
//	R6.L = (B0RDYPOL | B0HT_3 | B0RAT_15 | B0WAT_15) & 0xFFFF;
//	R7 = R7 | R6;
// 	[P1+LO(EBIU_AMBCTL0)] = R7;	
// 15 Cycles for Read Access Time (Max), ADRDY polarity = 1 for Bank 0


//////////////////////  Set up DMA  //////////////////////

// We need to read in the global header, determine the width of the flash device.
// P2 points to address of global header in external memory
.ALIGN 2;

FLASH_BOOT:
	P2.L = LO(GlobalHeaderAddress);
	P2.H = HI(GlobalHeaderAddress);

// Get just the least significant byte of the global header.
// The global header will determine the width of flash
// See if the width bit is set

	R7 = B[P2] (Z);    //  @@@@
	CC = BITTST(R7, 0);
	IF !CC JUMP READ_GLOBAL_HEADER_8_BIT;
//----------------------------------------------------------
// 16-bit flash - read 2 16 bit words
//----------------------------------------------------------

	R2 = 0x02 (z);

// Source Modify = 2
	R6 = 0x2 (Z);   // was 1 @@@@@
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R6;	

// Destination Modify = 2 for 16 bit transfers
	R6 = 0x2 (Z);
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R6;	

// set the DMA config words for 16 bit DMA transfers

// Source DMAConfig Value (16-bit words)
	R3.L = 0x5;
	R3.H = 0;

// Destination DMAConfig Value (16-bit words)
	R4.L = 0x87;	
	R4.H = 0;

	JUMP READ_GLOBAL_HEADER_AGAIN;
//----------------------------------------------------------
// 8-bit flash - read 2 16 bit words
//----------------------------------------------------------
READ_GLOBAL_HEADER_8_BIT:

// Set DMA for byte transfer 

// Source Modify = 2
	R6 = 0x2 (Z);
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R6;	

// Destination Modify = 1 for 8 bit transfers
	R6 = 0x1 (Z);
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R6;	


// Source DMAConfig Value (8-bit words)
	R3.L = 0x1;	
	R3.H = 0;

// Destination DMAConfig Value (8-bit words)
	R4.L = 0x83;	
	R4.H = 0;

// count 4 bytes transfer 
	R2 = 4;


READ_GLOBAL_HEADER_AGAIN:

// R0 points to address of global header in external memory
	R0.L = LO(GlobalHeaderAddress);
	R0.H = HI(GlobalHeaderAddress);

// R1 points to address of global header in L1 memory
	R1.L = LO(GlobalHeaderDest);
	R1.H = HI(GlobalHeaderDest);

// R0 = source address
// R1 = destination address
// R2 = count 
// R3 = source config
// R4 = dest config

// -----------------
// read the destination start address from header (4 bytes)
// -----------------
	CALL MEM_DMA;  // DMA in the GLOBAL HEADER

//--------------------------------------------------------------------------
// update R0 to point to the next location in external memory
// R0 is update to skip the dxe count not used in this loader
//--------------------------------------------------------------------------
 	R0 = [P1+LO(MDMA2_S0_CURR_ADDR)];


//////////////////////////////////////////////////////////////////////////
// Take out skipping DXE count @@@@@ Bobbie 3/10/03
//        R0 += 4;   // skip dxe count (+4 for 16 access/+8 for 8 bit access)
// Changed @@@@@@@ Bobbie 3/6/03
// DXE count now has a 10 byte block header.  (See new code for IGNORE bit)
// skip dxe count (+14 for 16 access/+28 for 8 bit access)
//        R0 += 14;   
//        P2.L = LO(GlobalHeaderAddress);
//	P2.H = HI(GlobalHeaderAddress);
//----------------------------------------
// Get just the least significant byte of the global header (again).
// to determine the width of flash
// See if the width bit is set
//----------------------------------------
//	R7 = B[P2] (Z);    //  @@@@
//	CC = BITTST(R7, 0);
//	IF CC JUMP FGRAB_HEADER;
// skip dxe count (it's 8-bit flash skip other 14 location of dxe count)
//        R0 += 14;   
//////////////////////////////////////////////////////////////////////////


// check for valid boot stream
// We have read in the global header.
// Check to see that there is a valid boot stream.

// P2 gets address of global header
	P2.L = LO(GlobalHeaderDest);
	P2.H = HI(GlobalHeaderDest);

// get the fourth byte in the boot stream: bits 24-31 of global header
	R7 = B[P2+3] (Z);
        R7 >>= 4;
        R6 = 0x0F;
        R7 = R6 & R7;
        R6 = 0x0A;
        CC = R6 == R7;
        IF CC JUMP FGRAB_HEADER;
        nop;nop;nop;nop;
        JUMP.L BOOT_STREAM_ERROR;

//-----------------------------------------------------------------------
// Reading the block header
//
//-----------------------------------------------------------------------
.ALIGN 2;
FGRAB_HEADER:

// DMA Destination Address
	R1 = P3;  // P3 contains the destination pointer	

SETUP_FOR_8_BIT:
// Count Value for Header 0x0a accesses to memory
	R2 = 0xA (Z);	
// Source Modify = 2 = 16 bit transfer from Flash
	R6 = 0x2 (Z);
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R6;	
// Destination Modify = 1 for 8 bit transfers
	R6 = 0x1 (Z);
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R6;
// determine the size of the transfer 8-bit -or- 16 bit flash
//
	P2.L = LO(GlobalHeaderDest);
	P2.H = HI(GlobalHeaderDest);
	R7 = W[P2] (Z);
	CC = BITTST(R7, 0);
	IF !CC JUMP DMA_HEADER;

// divide count by 2 for 16 bit transfer
	R2 >>= 1;
//  Source Modify = 2 = 16 bit transfer from Flash
        R6 = 0x2 (Z);   // 
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R6;	

// Destination Modify = 2 for 16 bit transfers
	R6 = 0x2 (Z);
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R6;
	
DMA_HEADER:
	CALL MEM_DMA; // @@@@#13

// Get Source Base Address
	R0 = [P1+LO(MDMA2_S0_CURR_ADDR)];	

// and save for zero fill
 	R7 = R0;		

// Get Destination Base Address
	R1 = [P3];		

// Get Count
	R2 = [P3+0x4];		

// Get Flag
	R5 = W[P3+0x8] (Z);	
   

////////////////////// Bobbie 03/03/03 @@@@@@@ ////////////////////////
// Insert new code for "Ignore Bit" and "Init Bit"
//
// This code has been added for compatibility with Edinburgh.  It may or may
// not be used in the future.  It's functionality may or may not be simulated
// before tape-out, but we will ensure that adding it doesn't break anything.

// The "Ignore Bit" in the Flag word tells the boot loader to ignore this block.  

// This bit was added to enable new fields to be added to the boot stream, such as the DXE count,
// without confusing the "old silicon".  "New Silicon" will ignore the block, because it's not really
// a data block to be loaded.  But it has the same structure as a data block, so "old silicon" will load it, 
// which is okay, because the following block will have the same destination address, and will overwrite what 
// was just loaded.

// Note that Teton Lite NO LONGER skips DXE counts, instead detects them as "ignore blocks".  
// @@@@@ Bobbie 3/10/03


FCHECK_IGNORE_BIT:
	CC = BITTST(R5,4);
	IF !CC JUMP FCHECK_INIT_BIT;

// Update Source Base Address - On Teton-Lite, this depends on flash WIDTH 8-bit -or- 16 bit.
// P2 already points to the saved global header
.MESSAGE/SUPPRESS 5517 FOR 1 LINES; //<-- suppress warning about 0428
	R7 = W[P2] (Z);

// Check the width bit of the global header
	CC = BITTST(R7, 0);

// Changed: was cutting count in half, if 16-bit
// Now doubles the count if 8 bit.  @@@@@ Bobbie 3/10/03

// If it's set, it's 16 bit flash.  Leave count as is.
	IF CC JUMP FCHECK_HALVE_COUNT;

// multiply count by 2, for 8 bit flash
	R2 <<= 1;
	JUMP FCHECK_UPDATE_POINTER;

FCHECK_HALVE_COUNT:
// divide count by 2, for 16 bit flash
//	R2 >>= 1;
        
FCHECK_UPDATE_POINTER:

// Add count to current pointer
	R0 = R0 + R2;	

// Jump to get next header, ignore this one  
	JUMP FGRAB_HEADER;			

// Now check to see whether this is a "Init Block".
// the "Init Block", if present, is the first block of the boot stream.  It is loaded and then executed.  
// Then the Boot ROM continues boot loading.  The Init Block occupies a DXE by itself.

// This enables the hardware initialization parameters in the Boot ROM to be changed, or handles any
// unforeseen need to do anything, before boot loading. 

// If Teton-Lite utilizes this feature, then the first DXE will be the Init Block, and the second 
// DXE will be the 2nd stage loader

FCHECK_INIT_BIT:
     CC = BITTST(R5,3);
     IF !CC JUMP FCHECK_ZERO_FILL_BIT;
     P0 = R1;


// P2 already points to the saved global header.  Get the value in R6
	[--sp] = R6;
.MESSAGE/SUPPRESS 5517 FOR 1 LINES; //<-- suppress warning about 0428
	R6 = W[P2] (Z);
	CC = BITTST(R6, 0);
	R6 = [sp++];

// If the bit is NOT set it's 8 bit 
	IF !CC JUMP DMA_INIT_BLOCK;

// divide count by 2 for 16 bit transfer
	R2 >>= 1;

DMA_INIT_BLOCK:
// DMA Init Code into internal memory
     CALL MEM_DMA;

// Get New Source Base Address
     R0 = [P1+LO(MDMA2_S0_CURR_ADDR)];

// Call the Init Code.  It will save and restore registers and return to this point.
     CALL(P0);	

// Jump to get next header
     JUMP FGRAB_HEADER;				

FCHECK_ZERO_FILL_BIT:

////////////////////// End of new code //////////////
 
// Bit zero of the flag word indicates zero fill block
	cc = BITTST(R5,0);		
	IF !CC JUMP FDO_DMA;	

// Source Base Address = ZERO Location
	R0 = P4;		
	R6 = 0x0;

// Source Modify = 0 for Zero Fill
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R6;	


FDO_DMA:
// If it's a 16 bit flash, the DMA is already configured to do 
// a 16 bit transfer.  Might as well stay that way.
// Adjust count if it's a 16 bit transfer.

// See if the width bit is set
//	P2.L = LO(GlobalHeaderDest);
//	P2.H = HI(GlobalHeaderDest);
	R6 = W[P2] (Z);
	CC = BITTST(R6, 0);
	IF !CC JUMP DMA_BLOCK;

// divide count by 2 for 16 bit transfer
	R2 >>= 1;

DMA_BLOCK:
	CALL MEM_DMA;  // @@@@#14
// Bit zero of the flag word indicates zero fill block
	cc = BITTST(R5,0);		
	IF !CC JUMP GET_DMA_CURR_PTR;

// Restore Source Modify to 2 (it was just changed to 0 for zero fill) 
	R6 = 0x2 (Z);
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R6;	

// Restore R0 to Flash Memory Address (was pointing to "ZERO")
	JUMP GET_NEXT_FLASH_PTR;

GET_DMA_CURR_PTR:

// read CURR pointer if last block was not a zero fill
// otherwise CURR pointer will point just beyond the zero!

	R7 = [P1+LO(MDMA2_S0_CURR_ADDR)];

GET_NEXT_FLASH_PTR:
// if last block was zero fill, R7 still has the saved flash pointer
// if last block was NOT zero fill, R7 has DMA CURR pointer
// put in in R0 for next call to MEM_DMA

	R0 = R7; 		

F_CHECK_FOR_LAST_SECTION:

// Last Section?
	cc = BITTST(R5,15);	  

// If not, Jump to grab header
	IF !cc JUMP FGRAB_HEADER; 

	JUMP BOOT_END;


/////////////  A general purpose routine for Memory DMA transfers  /////////
/////////////  Uses memory DMA Controller 1  ///////////////////////////////

// Formerly "FDMA" from boot_edin.dsp boot ROM code for edinburgh.

MEM_DMA:

// R0 = source address
// R1 = destination address
// R2 = count
// R3 = source config
// R4 = dest config
// modify registers have already been set up

// changes R0, but after the call to this routine, R0 is usually
// set to the value DMA CURRENT register


// Source Base Address		
	[P1+LO(MDMA2_S0_START_ADDR)] = R0;	

// Source Count
	W[P1+LO(MDMA2_S0_X_COUNT)] = R2;	
	
// the following line of code should be removed - Bobbie 2/18/03 @@@@@@
// Source DMAConfig
//	W[P1+LO(MDMA2_S0_CONFIG)] = R3;	

// Destination Base Address
	[P1+LO(MDMA2_D0_START_ADDR)] = R1;	

// Destination Count
	W[P1+LO(MDMA2_D0_X_COUNT)] = R2;	

// Source DMAConfig
	W[P1+LO(MDMA2_S0_CONFIG)] = R3;
	
// Destination DMAConfig
	W[P1+LO(MDMA2_D0_CONFIG)] = R4;	

// Wait for DMA to Complete
	IDLE;					

// Write 1 to clear DMA interrupt
	R0 = 0x1;
	W[P1+LO(MDMA2_D0_IRQ_STATUS)] = R0; 
	RTS;

//********************************************************************/
//*************** SPI0 BOOT ******************************************/
//********************************************************************/
.ALIGN 2;
SPI0_BOOT:					
	R4.L = 0x0083;	//DMA config  LM
	R4.H = 0x5002;	// spi config LM
	R0.L = 0x0001;  // for dma x modify LM
	W[P1+LO(DMA2_4_X_MODIFY)] = R0; // set modify to 0x1 LM
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R0; // set modify to 0x1 LM	
	R0.L = 0x0000;  // 0 modity for zero fill mdma S0
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R0; // set modify to 0x0 LM	
	CALL SETUP_SPI_INTERFACE;
	CALL PARSE_GLOBAL_HEADER;
	R3 += 4;  //increase address past global header
///////////////////////////////////////////////////////////////////////////////////////////////
// At this point, we know what part (8-, 16-, or 24-bit) we have connected to the SPI port
// Time to read/parse headers and boot stuff in
///////////////////////////////////////////////////////////////////////////////////////////////

GRAB_HEADER:
	CALL SPI_SETUP;						//Before setting up SPI DMA, we need to address the SPI memory
	CALL DMA_HEADER_SPI;
//removed for the BF561 it is only used for BF533/32/31 to determine the start of instruction memory
//	CALL FIRST_BLOCK;	
	P0 = R1;							//P0 = Destination Address
	CALL DISABLE_SPI;					//Disable SPI Interface	
	R3 += 0xA;							//Increment external address by header

CHECK_IGNORE_BIT:
	CC = BITTST(R5,4);
	IF !CC JUMP CHECK_INIT_BIT;
	R3 = R3 + R2;						//Update Source Base Address
	CC = BITTST(R5,3);					//Check if the INIT bit is set within FLAG
	IF !CC JUMP CHECK_LAST_SECTION;		//Ignore this block and check if this is the last block
	CALL(P0);							//If Init Bit is set, Call Init Code
	JUMP CHECK_LAST_SECTION;			//Check if this is the last block
	
CHECK_INIT_BIT:
	CC = BITTST(R5,3);
	IF !CC JUMP CHECK_ZERO_FILL_BIT;
	CALL SPI_SETUP;						//Before setting up SPI DMA, we need to address the SPI memory	
	CALL SPI_DMA;						//DMA Init Code into internal memory
	CALL DISABLE_SPI;					//Disable SPI Interface	
	R3 = R3 + R2;						//Update Source Base address
	CALL(P0);							//Call Init Code
	JUMP GRAB_HEADER;					//Grab the next header (Init Block cannot be the last block within the loader stream)
											//This is for 3.1 and 3.5 support which set the last block bit for Init Blocks

CHECK_ZERO_FILL_BIT:
	CC = BITTST(R5,0);		
	IF !CC JUMP DO_DMA;					//Zero Fill?
	R0.H = ZERO;
	R0.L = ZERO;
	[--SP] = R3;						//Save R3 because FDMA routine uses R3
	R3 = 0x1;							//R3 = Source DMA Config Value
	CALL MEM_DMA;
	R3 = [SP++];						//Restore R3
	JUMP CHECK_LAST_SECTION;			//Check if this is the last block

DO_DMA:
	CALL SPI_SETUP;						//Before setting up SPI DMA, we need to address the SPI memory	
	CALL SPI_DMA;
	CALL DISABLE_SPI;					//Disable SPI Interface	
	R3 = R3 + R2;						//increment external address by count value	

CHECK_LAST_SECTION:
	CC = BITTST(R5,15);					//Last Section?
	IF CC JUMP BOOT_END;
	JUMP GRAB_HEADER;					//If yes,JUMP to GRAB_HEADER

////////////////////////////////////////////
//PARSE_GLOBAL_HEADER : looks for baud rate
// LM
///////////////////////////////////////////
PARSE_GLOBAL_HEADER:
	[--SP] = RETS;	
	CALL SPI_SETUP;		//Before setting up SPI DMA, we need to address the SPI memory
	CALL DMA_HEADER_SPI;
	P0 = R1;		//P0 = Destination Address
	CALL DISABLE_SPI;
	[--SP] = P2;
	[--SP] = P5;
//check for valid boot stream
	R1 = B[P3+3] (Z);  // grab bits 31:24
        R1 >>= 4;
        R2 = 0x0F;
        R1 = R2 & R1;
        R2 = 0x0A;
        CC = R2 == R1;
        IF CC JUMP NO_SPI_BOOT_STREAM_ERROR;
        JUMP.L SPI_BOOT_STREAM_ERROR;
NO_SPI_BOOT_STREAM_ERROR:       
        nop;
	nop;
	nop; 

	//now let's look for the baud rate

	R1 = B[P3+1](z);  //grab bits 15:8 of header
	R2 = 0x03;
	R1 = R1 & R2;
	P5 = R1;
	P2.L = BAUD_TABLE;
	P2.H = BAUD_TABLE;
	P2 = P2 + P5;
// baud rate factor in R1 
	R1 = B[P2](Z);
// Set baud rate
	W[P1+LO(SPI_BAUD)] = R1; 
	P5 = [SP++];
	P2 = [SP++];
	RETS = [SP++];
	RTS;


///////////////////////////////////////////////////////////////////////////////////////////////
// The following sets up the SPI Interface:  Baud rate and sets PF2 (SPISS) as an output
///////////////////////////////////////////////////////////////////////////////////////////////
SETUP_SPI_INTERFACE:
	[--SP] = RETS;						//Save return address onto stack
	
     R1 = 0x85;

	W[P1+LO(SPI_BAUD)] = R1;		//set baud rate register

	R0 = 0x4;
	W[P1+LO(FIO0_DIR)] = R0;		//set PF2 as an output, this is our CS line


///////////////////////////////////////////////////////////////////////////////////////////////
// 8-, 16-, or 24-bit SPI Memory?
// The following routine checks whether there is a 8-/16-/24-bit or an ATMEL SPI Memory connected
// and sets R6 = 0x3 for 8-bit SPI Memory
//			R6 = 0x2 for 16-bit SPI Memory
//			R6 = 0x1 for 24-bit SPI Memory
//			R6 = 0x0 for ATMEL SPI Memory
///////////////////////////////////////////////////////////////////////////////////////////////
PART_SELECT:
	R3 = 0x0;								//Initial address of external memory
	R1 = 0xFF;								//Test value for receive byte
	R6 = 0x3;								//set R6 = 0x3 for 8-bit part
	
	R0 = 0x5001;
	W[P1+LO(SPI_CTL)] = R0;			//enable SPI, nondma tx mode, 8bit
	
	R0 = 0x4;
	W[P1+LO(FIO0_FLAG_C)] = R0;			//assert CS low
	
	R0 += -1;								//send out control word (R0 = 0x03)
	CALL SINGLE_BYTE_TRANSFER;
	
	R0 = R3;								//send out address byte
	CALL SINGLE_BYTE_TRANSFER;

	R0 = R3;								//send out dummy byte (or address byte if 16-/24-bit SPI Memory)
	CALL SINGLE_BYTE_TRANSFER;
    
// Removed 8 bit check, not supported on the BF561


SIXTEEN_BIT_CHECK:
	R0 = R3;								//send out dummy byte (or address byte if 24-bit SPI Memory)
	CALL SINGLE_BYTE_TRANSFER;

	CC = R0 == R1;
	R6 += -1;								//set R6 = 0x2 for 16-bit part
	IF !CC JUMP PART_SELECT_DONE;			//if the byte we receive is NOT equal to 0xFF, it's a 16-bit SPI part

TWENTYFOUR_BIT_CHECK:
	R0 = R3;								//send out dummy byte
	CALL SINGLE_BYTE_TRANSFER;	

	CC = R0 == R1;
	R6 += -1;													//set R6 = 0x1 for 24-bit part
	IF !CC JUMP PART_SELECT_DONE;			//if the byte we receive is NOT equal to 0xFF, it's a 24-bit SPI part

ATMEL_PART:	R6 += -1;								//If all of the tests above fail, we are going to assume we have an ATMEL SPI Memory connected
	CALL READ_STATUS_REGISTER;

PART_SELECT_DONE:
	CALL DISABLE_SPI;
	
	RETS = [SP++];							//Restore return address from stack
	RTS;


///////////////////////////////////////////////////////////////////////////////////////////////
// The following DMAs the 10-byte header into location 0xFF807FE0 and returns the following:
// R1 = Destination Base Address (4 bytes)
// R2 = Count (4 bytes)
// R5 = Flag (2 bytes)
///////////////////////////////////////////////////////////////////////////////////////////////
DMA_HEADER_SPI:
	[--SP] = RETS;

	R1 = P3;							//DMA Destination = 0xFF807FF4
	R2 = 0xA;							//DMA Count = 10

	CALL SPI_DMA;

	R1 = [P3];							//Get Destination Base Address 
	R2 = [P3+0x4];						//Get Count
	R0 = W[P3+0x8](Z);					//Get Flag
	R5.L = 0x1002;						// Deposit 2 bits starting at bit position = 16
	R5 = DEPOSIT(R0, R5);				//After this instruction R5.L = R0.L and bit0 of R5.H will be retreived

	RETS = [SP++];
	RTS;


///////////////////////////////////////////////////////////////////////////////////////////////
// The following sets up SPI DMA
///////////////////////////////////////////////////////////////////////////////////////////////
SPI_DMA:
	[P1+LO(DMA2_4_START_ADDR)] = R1;	//Set Destination Base Address
	W[P1+LO(DMA2_4_X_COUNT)] = R2;	//Set Destination Count

	CC = R2 == 0x0;
	IF CC JUMP DMA_COMPLETE_SPI;			//If the COUNT = 0, skip the DMA

	W[P1+LO(DMA2_4_CONFIG)] = R4;	//Set Destination DMAConfig = DMA Enable, Memory Write, 1-D DMA, Flow - Stop, IOC 

	R0 = R4 >> 16;
	W[P1+LO(SPI_CTL)] = R0;		//enable SPI, dma rx mode, 8bit data

	IDLE;								//Wait for DMA to Complete

	R0 = 0x1;
	W[P1+LO(DMA2_4_IRQ_STATUS)] = R0;//Write 1 to clear DMA interrupt
	
	CC = BITTST(R7,0);					//R7 = 0x0 for SPI Master Mode Boot; R7 = 0x1 for SPI Slave Mode Boot
	IF CC JUMP DMA_COMPLETE_SPI;
	
	W[P1+LO(DMA2_4_CONFIG)] = R7;	//Disable DMA only for SPI Master Mode Boot (R7 should already contain a 0x0 if we have come to this point)

DMA_COMPLETE_SPI:
	RTS;


///////////////////////////////////////////////////////////////////////////////////////////////
// Routine that addresses the SPI Memory
///////////////////////////////////////////////////////////////////////////////////////////////
SPI_SETUP:
	[--SP] = RETS;						//Save return address onto the stack
	
	I0 = R3;							//save logical address in I0
	
	R0 = 0x5001;
	W[P1+LO(SPI_CTL)] = R0;		//enable SPI, nondma tx mode, 8bit
	
	R0 = 0x4;
	W[P1+LO(FIO0_FLAG_C)] = R0;		//assert CS (PF2) low
	
	CC = R6 < 1;
	IF !CC JUMP ADDRESS_8_16_24;
	
ATMEL:
	CALL ADDRESS_DECODE;				//convert logical address into a page number and byte number
	R0 = 0xE8;							//control word for ATMEL SPI Memory
	CALL SINGLE_BYTE_TRANSFER;			//send out control word

	JUMP ADDRESS_24;	
	
ADDRESS_8_16_24:
	R0 = 0x3;							//control word for 8-/16-/24-bit SPI Memory
	CALL SINGLE_BYTE_TRANSFER;			//send out control word
	
	CC = R6 < 2;
	IF !CC JUMP ADDRESS_16;
	
ADDRESS_24:
	R0 = R3 >> 16;						//send out address byte
	CALL SINGLE_BYTE_TRANSFER;	
	
ADDRESS_16:
	CC = R6 < 3;
	IF !CC JUMP ADDRESS_8;

	R0 = R3 >> 8;						//send out address byte
	CALL SINGLE_BYTE_TRANSFER;		

ADDRESS_8:
	R0 = R3;							//send out address byte
	CALL SINGLE_BYTE_TRANSFER;

	CC = R6 < 1;
	IF !CC JUMP DONE_ADDRESSING;
		
	P2 = 0x4;							//send out 4 don't care bytes for ATMEL SPI Memory
	LSETUP(ATMEL_Begin, ATMEL_End) LC0=P2;
	ATMEL_Begin:	R0 = R3;			//send out byte
					CALL SINGLE_BYTE_TRANSFER;
	ATMEL_End:		NOP;
	
	R3 = I0;							//restore logical address from I0	

DONE_ADDRESSING:
	R0 = 0x5000;
	W[P1+LO(SPI_CTL)] = R0;		//set TIMOD = 00 for SPI port
		
	RETS = [SP++];						//Restore return address from the stack
	RTS;



///////////////////////////////////////////////////////////////////////////////////////////////
// SPI Byte Transfer Routine
// The following sends out a byte stored in R0, check's the Status Register for single-word 
// transfer complete, and finally reads a byte from the SPI memory and stores it in R0.
///////////////////////////////////////////////////////////////////////////////////////////////
SINGLE_BYTE_TRANSFER:
	W[P1+LO(SPI_TDBR)] = R0;		//send out byte
	
RD_ST:		
	R0 = W[P1+LO(SPI_STAT)] (Z);
	CC = BITTST(R0,5);					//test bit 5 (RXS) of SPIST0 register to see if the RX Data Buffer is full, if 0 do test again
	IF !CC JUMP RD_ST;
.MESSAGE/SUPPRESS 5517 FOR 1 LINES; //<-- suppress warning about 0428
	R0 = W[P1+LO(SPI_RDBR)] (Z);	//do read
	
	RTS;

	

///////////////////////////////////////////////////////////////////////////////////////////////
// SPI Disable
// The following routine disables the SPI port and holds it disabled for 500ns
///////////////////////////////////////////////////////////////////////////////////////////////
DISABLE_SPI:
	R0 = 0x0000;
	W[P1+LO(SPI_CTL)] = R0;		//disable SPI
//	R0 = W[P1+LO(SPI_RDBR)] (Z);	//do dummy read to clear RXS

	R0 += 0x4;
	W[P1+LO(FIO0_FLAG_S)] = R0;		//de-assert CS
	
	P2 = 0x01A4;
	LSETUP(DELAY_LOOP, DELAY_LOOP) LC0=P2;
	DELAY_LOOP: NOP;					//We need a 500ns delay for /CS Disable Time (Calculated for 600MHz SCLK)

	RTS;
	
/*******************************************************************************/
/*                                                                             */
/*  ADDRESS_DECODE Subroutine for SPI Master Boot Mode                         */
/*                                                                             */
/*  It converts a logical address to a page number and a byte number for the   */
/*  ATMEL SPI DataFlash.                                                       */
/*  AT45DB041 has 11 page bits and 9 byte bits (264 bytes/page), R5.H = 0x0    */
/*  AT45DB081 has 12 page bits and 9 byte bits (264 bytes/page), R5.H = 0x0    */
/*  AT45DB161 has 12 page bits and 10 byte bits (528 bytes/page),R5.H = 0x1    */
/*  AT45DB642 has 12 page bits and 11 byte bits (1056 bytes/page),R5.H = 0x2                                                                           */
/*******************************************************************************/


ADDRESS_DECODE:

R0 = 0x0;							//R0 holds the page number -- jm Feb21_2006
ATMEL_161:								
	R7 = 0x210;								//528 bytes per page for AT45DB161
	CC = BITTST(R5, 16);					// bit 16 set ==> 528 bytes/page
	IF CC JUMP COMPARE;  	

	CC = BITTST(R5, 17);					// bit 17 set ==> 1056 bytes/page 
	IF CC JUMP ATMEL_642; 
	
ATMEL_041_081: 
	R7 = 0x108;								//264 bytes per page for AT45DB041 and AT45DB081							
	JUMP COMPARE; 

ATMEL_642:
	R7 = 0x420;							// jm  1056 bytes per page
	
COMPARE: //	R0 = 0x0;//commented out Feb21-2006 							//R0 holds the page number
	CC = R3 <= R7;						//Is the logical address less than bytes/page?
	IF CC JUMP LESS_THAN_PAGE;
	
ADD_PAGE_SUBTRACT:
	R0 += 1;							//if not, add 1 to page number
	R3 = R3 - R7;						//and subtract bytes/page from logical address
	JUMP COMPARE;						//compare again

LESS_THAN_PAGE:	
	CC = R3 == R7;						//if so, check if we have exactly 1 page
	IF !CC JUMP FINISHED_DECODING;
	R3 = 0x0;							//if exact page, byte number = 0
	R0 += 1;							//and add 1 to page number

FINISHED_DECODING:
R0 = R0 << 11;  // left shift page number by 11 for the 1056 bytes/page devices
cc = bittst(r5,17);
if cc jump AddressDone;

R0 = R0 >> 1; // down shift to 10 bits (# page bits) for the 528 bytes/page devices
cc = bittst(r5,16); 
if cc jump AddressDone;

R0 = R0 >> 1; // down shift to 9 bits (# page bits)

AddressDone:
	R3 = R0 | R3;						//OR page number and byte number
	
	R7 = 0x0;							//restore R7 to 0x0 for SPI Slave use
	RTS;

ADDRESS_DECODE_END:	

/********************************************************************************/
/*                                                                             	*/
/*  READ_STATUS_REGISTER Subroutine for SPI Master Boot Mode                   	*/
/*                                                                             	*/
/*  It reads the status register of an Atmel DataFlash device to determine     	*/
/*  which device is connected.                                                 	*/
/*                                                                             	*/
/*  AT45DB041 has bits 5:2 set to 0111 (set R5.H = 0x0)                        	*/
/*  AT45DB081 has bits 5:2 set to 1001 (set R5.H = 0x0)                        	*/
/*  AT45DB161 has bits 5:2 set to 1011 (set R5.H = 0x1)                        	*/
/*  AT45DB642 has bits 5:2 set to 1111 (set R5.H = 0x2)							*/
/*  AT45DB1282 has bits 5:2 set to 0100 (set R5.H = 0x2)						*/
/********************************************************************************/

READ_STATUS_REGISTER:
	[--SP] = RETS;					// Save return address onto stack

	CALL DISABLE_SPI;				// disable SPI for new transfer
	
	R0 = 0x5001; //SPE | MSTR | (TIMOD & 1);	
	W[P1+LO(SPI_CTL)] = R0;			// enable SPI, non-DMA TX Mode, 8 bits
	
	R0 = 0x4;						
	W[P1+LO(FIO0_FLAG_C)] = R0;		//assert CS low
	
	R0 = 0xD7;						// send out control word to 
	
	CALL SINGLE_BYTE_TRANSFER;		// read status register
	CALL SINGLE_BYTE_TRANSFER;		// result in R0
	

/*********************** JM ***************************/
R5.H = 0x2; 	// for 1056 bytes/page group
R0 = R0 >> 2; 	// Right align Density status info 
R1 = 0xF;		// AT45DB642
R0 = R0 & R1; 	// (JM feb 11) lower nibble mask 
P2 = 0x1; 		// 1 devices in the 1056 bytes/page group
call PAGE_SIZE;

R1 = 0x4;  		// For the new upcoming device AT45DB1282D 
		   		// it has the same paging scheme as the DB642 above
P2 = 0x3; // hopefully, the yet un-announced parts with density 
					// codes 0x6 and 0x8 will have the same paging scheme
					// as the AT45DB1282D
call PAGE_SIZE;

R5.H = 0x1;
R1 = 0xB;
P2 = 0x2; 		// 2 devices in the 528 bytes/page group
call PAGE_SIZE;

R5.H = 0x0; 
R1 = 0x3;
P2 = 0x4; 		// four devices in the 264 bytes/page group
call PAGE_SIZE;
/****************************************************/
	
READ_STATUS_REGISTER_EXIT:
	RETS = [SP++];
	RTS;	
/*********************** JM *************************/
PAGE_SIZE:
	LSETUP(Page_S, Page_End) LC0 = P2;

	Page_S: 	CC = R0 == R1;
				IF CC JUMP READ_STATUS_REGISTER_EXIT;
	Page_End: 	R1 += 0x2; // increment R1 by 2

	RTS;

PAGE_SIZE_END:
/*****************************************************/	
	

	
READ_STATUS_REGISTER_END:
///////////////////////////////////////////////////////////////////////////////


	
///////////////////////////////////////////////////////////////////////////////////////////////
// The following sets up SPI DMA
///////////////////////////////////////////////////////////////////////////////////////////////
SSB_SPI_DMA:
// Set Destination Base Address
	[P1+LO(DMA2_4_START_ADDR)] = R1;	
	
// Set Destination Count
	W[P1+LO(DMA2_4_X_COUNT)] = R2;	

// Set Destination DMAConfig
	W[P1+LO(DMA2_4_CONFIG)] = R4;

	R0 = R4 >> 16;
//enable SPI, dma rx mode, 8bit data
	W[P1+LO(SPI_CTL)] = R0;		

// Wait for DMA to Complete
	IDLE;								

// Write 1 to clear DMA interrupt
	R0 = 0x1;
	W[P1+LO(DMA2_4_IRQ_STATUS)] = R0;	
	
// R7 = 0x0 for SPI Master Mode Boot; R7 = 0x1 for SPI Slave Mode Boot
	CC = BITTST(R7,0);					
	IF CC JUMP DMA_COMPLETE;
	
	BITCLR(R0,0);

// Disable DMA only for SPI Master Mode Boot
	W[P1+LO(DMA2_4_CONFIG)] = R0;	
	
DMA_COMPLETE:
	RTS;
/////////////////////////// jm ///////////////////////////////////////////
SSB_DMA_first_HEADER:
///////////////////////////////////////////////////////////////////////////////////////////////
// The following DMAs the 14-byte header into location 0xFF807FE0 and returns the following:
// R1 = Destination Base Address (4 bytes)
// R2 = Count (4 bytes)
// R5 = Flag (2 bytes)
///////////////////////////////////////////////////////////////////////////////////////////////
	[--SP] = RETS;

	R1 = P3;				//DMA Destination = HeaderAddress
	R2 = 0xE;				//DMA Count = 14 jm: to account for the Global header

	CALL SSB_SPI_DMA;
    
	P3 += 4; // increment by 4 to skip the Global header
	
	R1 = [P3];				//Get Destination Base Address 
	R2 = [P3+0x4];				//Get Count
	R0 = W[P3+0x8](Z);			//Get Flag
	//R5.L = 0x1001;				//Deposit 1 bit at bit position = 16
	R5.L = 0x1002;			// jm Deposit 2 bits starting at bit position = 16
	R5 = DEPOSIT(R0, R5);			//After this instruction R5.L = R0.L and bit0 of R5.H will be retreived

	RETS = [SP++];
	RTS;
/////////////////////////////////////////////////////////////////////////////

SSB_DMA_HEADER:
///////////////////////////////////////////////////////////////////////////////////////////////
// The following DMAs the 10-byte header into location 0xFF807FE0 and returns the following:
// R1 = Destination Base Address (4 bytes)
// R2 = Count (4 bytes)
// R5 = Flag (2 bytes)
///////////////////////////////////////////////////////////////////////////////////////////////
	[--SP] = RETS;

	R1 = P3;				//DMA Destination = HeaderAddress
	R2 = 0xA;				//DMA Count = 10

	CALL SSB_SPI_DMA;

	R1 = [P3];				//Get Destination Base Address 
	R2 = [P3+0x4];				//Get Count
	R0 = W[P3+0x8](Z);			//Get Flag
	R5.L = 0x1002;				//Deposit 1 bit at bit position = 16
	R5 = DEPOSIT(R0, R5);			//After this instruction R5.L = R0.L and bit0 of R5.H will be retreived
	RETS = [SP++];
	RTS;
/////////////////////////////////////////////////////////////////////////////
/************************SPI SLAVE BOOT***********************************************************************************************/
SPI_SLAVE_BOOT:
	R4 = 0x83;   
// R7 Indicates to SSB_SPI_DMA routine whether to disable DMA after DMA is complete 
	R7 = 0x1;			
// R7 used to Set SPI DMA Modify to 1
// Added 2/16/04 to fix SPI slave bug.
	W[P1+LO(DMA2_4_X_MODIFY)] = R7;	
	R4.H = 0x4402;			//SPI Control Register Value:
						//SPI enable, Slave Mode, CPOL = 0, CPHA = 1, DMA receive mode (TIMOD = 10)
						
	CALL SSB_DMA_first_HEADER;//JM 05/08/06
	jump SSB_GRAB_HEADER_CONTINUE;//JM 05/08/06
						
SSB_GRAB_HEADER:
	CALL SSB_DMA_HEADER;
	
SSB_GRAB_HEADER_CONTINUE: //JM 05/08/06
	P0 = R1;			//P0 = Destination Address
	
SSB_CHECK_IGNORE_BIT:
	CC = BITTST(R5,4);
	IF !CC JUMP SSB_CHECK_ZERO_FILL_BIT;
	CALL SET_FLAG;	 			//Set appropriate flag for host feedback
	R0 = 0x0;
	W[P1+LO(DMA2_4_X_MODIFY)] = R0;	//Set SPI DMA Modify to 0
	R1.H = 0xFF80;
	R1.L = 0x7FFE;			//Set the SPI DMA Start Address to 0xFF807FFE (2nd to last location of L1 Data Bank A)
	JUMP SSB_DO_DMA; 		//Boot in Ignored Block and check if last section (only first location will be written to)

SSB_CHECK_ZERO_FILL_BIT:
	CC = BITTST(R5,0);		
	IF !CC JUMP SSB_DO_DMA;		   	//Zero Fill?
	CALL TOGGLE_FLAG;		   	//Set PF high to signal host not to send anymore bytes
	R0 = 0x00;
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R0;	
	R0 = 0x01;
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R0;
	R0.H = ZERO;
	R0.L = ZERO;
	CALL MEM_DMA;
	R0 = 0x04;
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R0;	
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R0;
	CALL TOGGLE_FLAG;		   	//Set PF low to signal to host to continue sending bytes
	JUMP SSB_CHECK_LAST_SECTION;

SSB_DO_DMA:
	CALL SSB_SPI_DMA;
	W[P1+LO(DMA2_4_X_MODIFY)] = R0;	//Reset SPI DMA Modify back to 1 (R0 should already contain a 0x1)

SSB_CHECK_INIT_BIT:
	CC = BITTST(R5,3);
	IF !CC JUMP SSB_CHECK_LAST_SECTION;
	CALL TOGGLE_FLAG;		   	//Set PF high to signal host not to send anymore bytes
	CALL(P0);			   	//Call Init Code
	CALL TOGGLE_FLAG;		   	//Set PF low to signal to host to continue sending bytes

SSB_CHECK_LAST_SECTION:
	CC = BITTST(R5,15);		   	//Last Section?
	IF CC JUMP BOOT_END;
	JUMP SSB_GRAB_HEADER;		   	//JUMP to GRAB_HEADER if not done

SET_FLAG:
	R0 = 0x01E0;
	R0 = R0 & R5;
	R0 = R0 >> 5;			   	//Bits 8:5 of the FLAG header is the PF number
	R3.L = 0x1;
	R6.L = LSHIFT R3.L BY R0.L;
	R0 = W[P1+LO(FIO0_DIR)](Z);
	R0 = R0 | R6;
	W[P1+LO(FIO0_DIR)] = R0;		//R6 holds the Flag #
	W[P1+LO(FIO0_FLAG_C)] = R6;		//Set the PF low initially
	RTS;
	
TOGGLE_FLAG:
	W[P1+LO(FIO0_FLAG_T)] = R6;
	RTS;


//----------------------------------------
// Load Global Header Value
//----------------------------------------
BOOT_END:

// 3/21/05 - BK 
// Reset registers that may have been used during boot

// IWR's reset value = ffffffff

        R3 = 0xffffffff;
        P2.L = LO(SICA_IWR0); 
        P2.H = HI(SICA_IWR0);
        [P2] = R3;
        P2.L = LO(SICA_IWR1); 
        P2.H = HI(SICA_IWR1);
        [P2] = R3;

// DMA Config reset value = 00000000
        R3 = 0;
        P2.L = LO(DMA2_4_CONFIG);        
        P2.H = HI(DMA2_4_CONFIG);        
        W[P2] = R3;

// SPI_CTL reset value = 0x0400
        R3 = 0x0400;
        P2.L = LO(SPI_CTL);        
        P2.H = HI(SPI_CTL);        
        W[P2] = R3;

// Get the global header
        P3.L = LO(GlobalHeaderDest);
        P3.H = HI(GlobalHeaderDest);
        R3 = [P3];

//=========================================================
// JUMP_USER_PROGRAM 
//=========================================================
JUMP_USER_PROGRAM:
        P2.L = LO(CoreA_Code_SRAM);  // point the user_code address
        P2.H = HI(CoreA_Code_SRAM);

	JUMP(P2);      // jump to user code
	nop;
      
////////////////////////////////////////////////////////////////
// 07/17/03 - Added for Rev 0.2 silicon.     
DMA_ERROR_OR_EXCEPT:
//--------------

// Clear flash DMA_ERR condition
	R0 = 0x3;
	W[P1+LO(MDMA2_D0_IRQ_STATUS)] = R0; 
	W[P1+LO(MDMA2_S0_IRQ_STATUS)] = R0;
	
// Clear SPI DMA_ERR condition
	W[P1+LO(DMA2_4_IRQ_STATUS)] = R0;	
	
// Disable MEM DMA to completely clear the error, so we can continue to 
// use MEMDMA to clear memory.
	R0 = 0x0;
	W[P1+LO(MDMA2_S0_CONFIG)] = R0;
	W[P1+LO(MDMA2_D0_CONFIG)] = R0;	


	JUMP BOOT_STREAM_ERROR;


/*************************************************************************/
//
// Config registers set for no descriptors, and interrupt on completion of write.
// R3 and R4 are reserved for the source and destination config register values.
// The config registers are written with the ls bit = 1, to initiate a transfer, 
// and the DMA stops automatically when the transfer is complete.
// The transfers are 32 bit when clearing and verifying memory; 
// 8 bit or 16 bit when transferring block headers and blocks.

// First clear out 128K L2 SRAM - FEB00000 - FEB1FFFF

////////////////////////////////////////////////////////////////////////////////////////////////
//  07/22/03 - made this a routine, to be called from "DMA_ERROR_OR_EXCEPT".
	
MEMO_CLEAR: 

// save RETS because this calls MEM_DMA 
	[--sp] = RETS;
	
// 1 dimensional 32 bit transfers

// Source DMAConfig Value 
	R3.L = 0x0029; 	
	R3.H = 0;

// Destination DMAConfig Value 
	R4.L = 0x00AB; 	
	R4.H = 0x0; 	

// Source Base Address = ZERO Location (contains 4 bytes of zero)
	R0 = P4;	
//	
// ------- modify registers are set before the call to MEM_DMA
//	

// Destination inner loop Modify = 4 for Zero Fill
	R2.h = 0x0000;
	R2.l = 0x0004;	
	W[P1+LO(MDMA2_D0_X_MODIFY)] = R2;	
	
// Source inner loop Modify = 0 for Zero Fill
	R2.h = 0x0000;
	R2.l = 0x0000;
	W[P1+LO(MDMA2_S0_X_MODIFY)] = R2;	

// inner loop counter
	r2.h = 0x0000; // init the loop counter
	R2.l = 0x8000; // set for test = 0x0010 real value value == 0x8000			

// destination address will be in P5 for call to VERIFY_MEMORY
  	P5.L = LO(Common_L2_SRAM);		
	P5.H = HI(Common_L2_SRAM);
		
// in R1 for the DMA transfer
	R1 = P5;
	
//-------------------------------------------------------------------------
// R0 = source address
// R1 = destination address
// R2 = inner loop count
// R3 = source config
// R4 = dest config
// R5 = outer loop count


	CALL MEM_DMA; // @@@@#1

// Verify 128 L2 SRAM

// count in P3 = 128k/4 (using 32 bit transfer)
	P3.H = 0x0000;  //set for test = 0x0010 real value value == 0x8000
	P3.L = 0x8000; // 

/*************************************************************************/
/////////////// Clear Core A Data Bank A /////////////////////////

  	P5.L = LO(CoreA_DataBA);
	P5.H = HI(CoreA_DataBA);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// set loop counter in R2 to 32K = 8k of 32 bit words

	R2 = 0x2000;   
second_call_dma:	
	CALL MEM_DMA;  

// Verify CoreA_DataBA
// P5 has address
        P3 = R2;
/*************************************************************************/
//////////////// Clear Core A Data Bank B /////////////////////////

  	P5.L = LO(CoreA_DataBB);
	P5.H = HI(CoreA_DataBB);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// loop counter in R2 is still 32k = 8k using 32 bit transfer
third_call_dma:
	CALL MEM_DMA;  //@@@@#3

/*************************************************************************/
/////////////// Clear Core B Data Bank A /////////////////////////

  	P5.L = LO(CoreB_DataBA);
	P5.H = HI(CoreB_DataBA);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// loop counter in R2 is still 32k = 8k using 32 bit transfer

	CALL MEM_DMA; // @@@@#4


/*************************************************************************/
//////////////// Clear Core B Data Bank B /////////////////////////

  	P5.L = LO(CoreB_DataBB);
	P5.H = HI(CoreB_DataBB);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// loop counter in R2 is still 32k = 8K using 32 bit transfer

	CALL MEM_DMA; // @@@@#5

/*************************************************************************/
///////////////// Clear Core A Code SRAM //////////////////////////////

  P5.L = LO(CoreA_Code_SRAM);
	P5.H = HI(CoreA_Code_SRAM);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// set loop counter in R2 to 16k = 4k with 32 bit transfer
	R2 = 0x1000 (Z); // set for test to 0x0020 real value == 0x1000
	CALL MEM_DMA; // @@@@#6

// load P3 with count = 16k / 4
	P3 = R2;

/*************************************************************************/
/////////////// Clear Core A Code Cache SRAM  ///////////////////////////

  P5.L = LO(CoreA_Code_C_SRAM);
	P5.H = HI(CoreA_Code_C_SRAM);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// loop counter in R2 is still 16k = 4k using 32 bit transfer

	CALL MEM_DMA;  // @@@@#7



/*************************************************************************/
///////////////// Clear Core B Code SRAM //////////////////////////////


  P5.L = LO(CoreB_Code_SRAM);
	P5.H = HI(CoreB_Code_SRAM);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// loop counter in R2 is 16k = 4k using 32 bit transfer

	CALL MEM_DMA; // @@@@#8

/*************************************************************************/
/////////////// Clear Core B Code Cache SRAM /////////////////////////


  P5.L = LO(CoreB_Code_C_SRAM);
	P5.H = HI(CoreB_Code_C_SRAM);
		
	R1 = P5;

// source = address of zero
	R0 = P4;

// loop counter in R2 is still 16k = 4k using 32 bit transfer

	CALL MEM_DMA; // @@@@#9

/*************************************************************************/
/////////////// Cannot Clear Core B Scratch !!!! //////////////////////////
/*************************************************************************/
/////////////// Clear Core A Scratch //////////////////////////////


  P5.L = LO(CoreA_Scratch_SRAM);
	P5.H = HI(CoreA_Scratch_SRAM);
		
	R1 = P5;

// source = address of zero
	R0 = 0;

// set loop counter in R2, leaving top 4 words of stack area.
// Right now, only one thing should actually be on the stack.
// But just in case something changes...

	R2 = 0x03FC (Z); // set for test 0x0020 real value == 0x03FC

CLEAR_SCRATCH_LOOP:
	R2 += -1;
	[P5++] = R0;
	CC = R2 == 0;
	IF !CC JUMP CLEAR_SCRATCH_LOOP;
       
// return from MEMO_CLEAR
.MESSAGE/SUPPRESS 5517 FOR 1 LINES; //<-- suppress warning about 0428
	RETS = [sp++];	
	RTS;
	

	
//////////////////////////////////////////////////////////////////////////////////////////
SPI_BOOT_STREAM_ERROR:
        R7 = [sp++]; // restoring the value of R7 (not used anymore but contains BMODE)
        nop; nop;nop;nop;
        
// We jump here if "valid stream signature" (0xA) not found, if exception, or DMA error.    
BOOT_STREAM_ERROR:        

//----------------
// Just IDLE 
//----------------
        IDLE;

  
////////////////// Below are some hard-coded data ////////////////////////
//
// These can't be located in L1 because they're data.
// So, for testing with the debugger, they must be placed in L2!!!!!
// For the actual ROM, move them to the end of the boot ROM.
//
//////////////////////////////////////////////////////////////////////////

////  ZERO will point to a zero (accessed as both byte and word)  ////////

.align 4;

.BYTE ZERO[4] = 0x0, 0x0, 0x0, 0x0;


//////  the baud rate lookup table ///////////////////////////////////////
// This table was used for the 2199x motor control boot ROMs, and 
// works with Gene Sullivan's SPI. Must verify that these are the 
// values we want.
//  Dec     Hex    Header sel.
//  133 == 0x0085  0
//  111 == 0x006f  1
//  95  == 0x005f  2
//  70  == 0x0046  3
//  66  == 0x0042  4
//  50  == 0x0032  5
//  40  == 0x0028  6
//  33  == 0x0021  7
.BYTE BAUD_TABLE[8] = 133, 111, 95, 70, 66,  50, 40, 33;

/*   SPI Baud Rate Examples
133MHz / (2*133) = 500 KHz
133MHz / (2*111) = 599 KHz
133MHz / (2*95)  = 700 KHz
133MHz / (2*70)  = 950 KHz
133MHz / (2*66)  = 1.0076 MHz
133MHz / (2*50)  = 1.33 MHz
133MHz / (2*40)  = 1.6625 MHz
133MHz / (2*33)  = 2.015 MHz
*********************************/





_bootkernel.end:


