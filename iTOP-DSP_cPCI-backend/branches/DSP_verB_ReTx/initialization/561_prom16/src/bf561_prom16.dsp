/**********************************************************************************/
/* 							                         **/
/* Teton-Lite                                                                    **/
/*                                                                               **/
/* Copyright Analog Devices, Inc.  2002, 2003, 2004		                         **/
/*                                                                               **/
/* 2nd stage boot kernel for ADSP-BF561                                          **/
/* Boot Loads a specified executable from 16 bit external Flash memory           **/
/*                                                                               **/
/* ADSP-BF561 is a Dual core Blackfin designed for digital imaging applications. **/
/*                                                                               **/
/* Internal to each core is:                                                     **/
/* 32K bytes/core of L1 data memory configurable as cache or SRAM                **/
/* 32K bytes/core of L1 data memory configurable as SRAM                         **/
/* 16K bytes/core of L1 program memory configurable as cache or SRAM             **/
/* 16K bytes/core of L1 program memory configurable as SRAM                      **/
/* 4k scratch SRAM                                                               **/
/*                                                                               **/
/* There's also 1MBits (128K bytes) of COMMON (to both cores) deterministic,     **/
/* low-latency, on-chip L2 SRAM                                                  **/
/**********************************************************************************/
/*  The file: 'cmds.c' contains a calling function that issues the following 
  commands to this second stage loader:

  0 = load program
  1 = boot done, jump to FFA00000

  possible error responses to loader command function (more can be created)

  0x05 = invalid command.
 
**********************************************************************************/

#include "defBF561.h"

// some macros 

#define OFFSET_( x ) ((x) & 0x0000FFFF)  
#define UPPER_( x ) (((x) >> 16) & 0x0000FFFF)  
#define LOWER_( x ) ((x) & 0x0000FFFF)  

//------- Register Definitions -----------

// core A Interrupt Wakeup-Enable register 1 (peripherals 32-64)
#define SICA_IWR1     0xFFC00120

// core A System Reset Configuration register  
#define SICA_SYSCR      0xFFC00104 

// SDRAM Memory Bank Control register 
#define EBIU_SDBCTL             0xFFC00A14 
                   
#define EVT3                   0xFFE0200C  // Event Vector 3 ESR Address
#define EVT7                   0xFFE0201C  // Event Vector 7 ESR Address
#define EVT9                   0xFFE02024  // Event Vector 9 ESR Address
#define EVT15                  0xFFE0203C  // Event Vector 15 ESR Address
#define IMASK                  0xFFE02104  // Interrupt Mask Register
#define EVT_IVG3_P             0x00000003  // IVG9 interrupt bit position
#define EVT_IVG9_P             0x00000009  // IVG9 interrupt bit position
#define EVT_IVG15_P            0x0000000f  // IVG15 interrupt bit position
#define EVT_IVG3               MK_BMSK_(EVT_IVG3_P  ) // IVG9 interrupt mask
#define EVT_IVG9               MK_BMSK_(EVT_IVG9_P  ) // IVG9 interrupt mask
#define EVT_IVG15              MK_BMSK_(EVT_IVG15_P ) // IVG15 interrupt mask

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

// Wakeup Enable MDMA 2 destination = peripheral 24 on IWR1
#define WAKEUP_PERIPHERAL_55        0x00800000  // mask for bit 23 (55 out of 32-64)

// Enable Asynchronous Memory Bank 0 only
#define AMBEN_B0        0x0002        

// Enable 16-bit packing for Asynchronous Memory Bank 0
#define B0PEN                0x00000010        

// Bank 0 Read Access Time = 15 cycles
#define B0RAT_15        0x00000F00        

// Bank 0 Hold Time from Read or Write deasserted to AOE deasserted = 3 cycles
#define B0HT_3                0x000000C0        

// Bank 0 RDY Active high, 0=active low, 1=active high
#define B0RDYPOL        0x00000002        

// Bank 0 Write Access Time = 15 cycles
#define B0WAT_15        0x0000F000        

// used to set up pointer registers and offset from them
#define SYSMMR_BASE 0xFFC00000
#define COREMMR_BASE 0xFFE00000

#define ASYNC_MEM_START         0x20000000 // Asynchronous Memory Start Address

#define COREA_L1_SCRATCH_END    0xFFB00FFC // Core A End of Scratch RAM

/****************** L2 Memory *********************************************/

#define Common_L2_SRAM          0xFEB00000        // 128 K Common L2 SRAM

/****************** L1 Memory *********************************************/

// Core A Internal Memory

#define CoreA_DataBA            0xFF800000        // Core A Data Bank A 32k
#define CoreA_DataBB            0xFF900000        // Core A Data Bank B 32k
#define CoreA_Code_SRAM         0xFFA00000        // Core A Code SRAM 16k
#define CoreA_Code_C_SRAM       0xFFA10000        // Core A Code Cache or SRAM 16k

// Core B Internal Memory

#define CoreB_DataBA            0xFF400000        // Core B Data Bank A 32k
#define CoreB_DataBB            0xFF500000        // Core B Data Bank B 32k
#define CoreB_Code_SRAM         0xFF600000        // Core B Code SRAM 16k
#define CoreB_Code_C_SRAM       0xFF610000        // Core B Code Cache or SRAM 16k

#define CoreA_Scratch_SRAM        0xFFB00000        // Code A Scratch SRAM - 4k
#define CoreB_Scratch_SRAM        0xFF700000        // Code B Scratch SRAM - 4k



#define StackTop COREA_L1_SCRATCH_END

// General Purpose storage address at end of L2 common, k
// must leave two extra locations so we don't overwrite boot ROM vars with the SBL code

#define GPStorage               0xFEB1FFF4

// Space to temporarily store global header after it's read
#define HeaderBuffer        GPStorage -12

.extern _loader_commands;

// The 2nd stage boot loader must start in Core A L1
// A jump to the program is placed at FFA00000, so we may execute in L2.

.section JMP_LDR;

	P0.L = START_OF_LOADER;
	P0.H = START_OF_LOADER;
	JUMP (P0);

//////////////////////////////////////////////////////////////////////////////////////
.section SEG_LDR;
// This label is used if the SS loader is to erase itself when complete	
START_ERASE:
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
        [P1+OFFSET_(MDMA2_S0_START_ADDR)] = R0;        

// Source Count
        W[P1+OFFSET_(MDMA2_S0_X_COUNT)] = R2;        
      
// Destination Base Address
        [P1+OFFSET_(MDMA2_D0_START_ADDR)] = R1;        

// Destination Count
        W[P1+OFFSET_(MDMA2_D0_X_COUNT)] = R2;        

// Source DMAConfig
        W[P1+OFFSET_(MDMA2_S0_CONFIG)] = R3;
       
// Destination DMAConfig
        W[P1+OFFSET_(MDMA2_D0_CONFIG)] = R4;        

// Wait for DMA to Complete
        IDLE;                                        

        R0 = 0x1;
// Write 1 to clear DMA interrupt
        W[P1+OFFSET_(MDMA2_D0_IRQ_STATUS)] = R0; 

        RTS;


/* --------------------------------------------------------------------------*/

START_OF_LOADER:
SETUP_SDRAM:
/*****************Setup SDRAM Registers********************************/
/*	mza's notes on analog devices' blackfin assembly language:
	r0 = w [ p3 ] (z); - load half-word, zero extended
	r2.h = w [p1]; - load half-word into high part of register
	w[p4] = r2.h; - load the high part of r2 into the the half-word at [p4]
	w means word
	b meand byte
	(z) means zero-extend
*/
//	JUMP CLEAR_L_REG;
/*
	P0.H = UPPER_(EBIU_SDSTAT);
	P0.L = LOWER_(EBIU_SDSTAT);
	R0 = W[P0](Z);
	CC = BITTST(R0,3);
	IF !CC JUMP CLEAR_L_REG;
*/
//SDRAM Refresh Rate Control Register
	P0.H = UPPER_(EBIU_SDRRC);
	P0.L = LOWER_(EBIU_SDRRC);
//	R0 = 0x039A(Z);					
//		r0 = 0x012c(z);
//	W[P0] = R0;							
//		r0.l = 928; // 120MHz
//		r0.l = 0x012c; // 300 is a guess for 60MHz...
//		r0 = 928(z); // 120MHz
		r0 = 300(z); // 300 is a guess for 60MHz...
		w[p0] = r0;
	SSYNC;	

//SDRAM Memory Bank Control Register
	P0.H = UPPER_(EBIU_SDBCTL);
	P0.L = LOWER_(EBIU_SDBCTL);
//	R0 = 0x00015(Z);
		r0.l = 0x3535;
		r0.h = 0x3535;
	[P0] = R0;
	SSYNC;		

//SDRAM Memory Global Control Register
	P0.H = UPPER_(EBIU_SDGCTL);
	P0.L = LOWER_(EBIU_SDGCTL);
//	R0.L = 0x998B;
//	R0.H = 0x0091;
		r0.h = 0x0291; // run sdram's power-up sequence
		r0.l = 0x998d; // enable sdram controller
	[P0] = R0;
	SSYNC;
/*
	R0 = [P0];
	BITCLR (R0, 1); // SCTLE
	[P0] = R0; // turn off SDRAM controller
	SSYNC;

	R0.L = 0x998c;
	R0.H = 0x0211;
	[P0] = R0;
	SSYNC;

	BITSET (R0, 1); // SCTLE
	[P0] = R0; // turn on SDRAM controller
	SSYNC;

	BITSET (R0, 23); // PSSE
	[P0] = R0; // initiate SDRAM powerup sequence
	SSYNC;
*/
	NOP;
	P0.L = 0x0;
	P0.H = 0x0;
	R0 = [P0]; // this is the required dummy read from sdram after giving it the power-up sequence
	
CLEAR_L_REG:
     L0 = 0x0;                                                        
     L1 = 0x0;
     L2 = 0x0;
     L3 = 0x0;
 
// Set up supervisor stack in L1 Scratch Memory
     SP.H = UPPER_(StackTop);
     SP.L = LOWER_(StackTop);                

// P0 Points to the beginning of CORE MMR Space
     P0.H = UPPER_(COREMMR_BASE);        
     P0.L = LOWER_(COREMMR_BASE);  
     
// Set up DMA error & exception handler       
     P2.L = DMA_ERROR_OR_EXCEPT;
     P2.H = DMA_ERROR_OR_EXCEPT;

// Place the address of dma error & exception handler in IVG3 of EVT
     [P0+OFFSET_(EVT3)] = P2;	      
     
// Place the address of dma error & exception handler in IVG7 of EVT
     [P0+OFFSET_(EVT7)] = P2;	         
    
/* ------------------------------------------------------------------------ */
// jump to command protocol
JUMP _loader_commands;

.global _SECOND_STAGE_LOADER;
// called from the command protocol with command in R0
_SECOND_STAGE_LOADER:
     [--sp] = RETS;      
	
// P4 will point to the address ZERO 
// which contains a zero, for zero fill DMA
        P4.L = ZERO;                
        P4.H = ZERO;                
                
// P1 Points to the beginning of SYSTEM MMR Space
        P1.H = UPPER_(SYSMMR_BASE);        
        P1.L = LOWER_(SYSMMR_BASE);
       
// Enable Wake-Up function for MDMA2 destination
        R3.H = UPPER_(WAKEUP_PERIPHERAL_55);
        R3.L = LOWER_(WAKEUP_PERIPHERAL_55);
        [P1+OFFSET_(SICA_IWR1)] = R3;

//----------------------------------------------------------
// Set DMA for 16-bit flash read with modify = 2 bytes
//----------------------------------------------------------

// Source Modify = 2
        R6 = 0x2 (Z);  
        W[P1+OFFSET_(MDMA2_S0_X_MODIFY)] = R6;        

// Destination Modify = 2 for 16 bit transfers
         W[P1+OFFSET_(MDMA2_D0_X_MODIFY)] = R6;        

// set the DMA config words for 16 bit DMA transfers

// Source DMAConfig Value (16-bit words)
        R3.L = 0x5;
        R3.H = 0;

// Destination DMAConfig Value (16-bit words)
        R4.L = 0x87;        
        R4.H = 0;

// Read the DXE count for each DXE we want to skip
// beginning with DXE #0, which was the 2nd stage loader

// P0 Points to the beginning of CORE MMR Space
     P0.H = UPPER_(COREMMR_BASE);        
     P0.L = LOWER_(COREMMR_BASE);

// see if it's the load program command (0)          
     R2.L = 0;
     R2.H = 0;     
     CC = R0 == R2;
     IF CC JUMP LOAD_PROGRAM;

// see if it's the jump to user program command (1)          
     R2.L = 1;
     CC = R0 == R2;
     IF !CC JUMP COMMAND_ERROR;

     P0.L = JUMP_USER_PROGRAM;     
     P0.H = JUMP_USER_PROGRAM;     

     JUMP (P0);
          
COMMAND_ERROR:
	R0.L = 0x05;
	R0.H = 0x00;
	RTS;     
     
LOAD_PROGRAM:
// R1 = WHICH program to load; put it in R5
	R5 = R1;

// The following must be repeated for each DXE we want to skip over, 
// to get to the DXE we want to boot load.  R5 will contain the DXE#.
	
// skip the global header 
// now we are pointing to the ten byte block header for the DXE count.
	R0.L = 0x0004;
	R0.H = 0x2000;

SKIP_DXE:
// skip the DXE count 10 byte header
	R0 += 10;
	
// R1 is destination address
	R1.L = LOWER_(GPStorage);
	R1.H = UPPER_(GPStorage);
	
// count value for reading 4 byte DXE byte count
	R2 = 0x2 (Z);
	CALL MEM_DMA; 

// Update the Source Address
	R0 = [P1+OFFSET_(MDMA2_S0_CURR_ADDR)];	

// Get the value just read from the external device = DXE count
	P3 = R1;
	nop;nop;nop;nop;
	R1 = [P3];

	
// Add the DXE count to the current source pointer	
	R0 = R0 + R1;

	R5 += -1;
	CC = R5 == 0;
	IF !CC JUMP SKIP_DXE;

// The above would be repeated to read DXE 2, 3, 4, etc.

//-----------------------------------------------------------------------
// Reading the block header
//-----------------------------------------------------------------------

.ALIGN 2;
FGRAB_HEADER:
// From now on, P3 Points to the Header Buffer in core A scratch
        P3.L = LOWER_(HeaderBuffer);        
        P3.H = UPPER_(HeaderBuffer);

// DMA Destination Address
        R1 = P3;  // P3 contains the destination pointer        

// Count Value for Header: 10 bytes, 5 words
        R2 = 0x5 (Z);        

// Source Modify = 2 = 16 bit transfer from Flash
        R6 = 0x2 (Z);   // 
        W[P1+OFFSET_(MDMA2_S0_X_MODIFY)] = R6;        

// Destination Modify = 2 for 16 bit transfers
        W[P1+OFFSET_(MDMA2_D0_X_MODIFY)] = R6;
        CALL MEM_DMA;

// Get Source Base Address
        R0 = [P1+OFFSET_(MDMA2_S0_CURR_ADDR)];        

// and save for zero fill
        R7 = R0;                

// Get Destination Base Address
        R1 = [P3];                

// Get Count
        R2 = [P3+0x4];                

// Get Flag
        R5 = W[P3+0x8] (Z);        
   
FCHECK_ZERO_FILL_BIT:

// Bit zero of the flag word indicates zero fill block
        cc = BITTST(R5,0);                
        IF !CC JUMP FDO_DMA;        

// Source Base Address = ZERO Location
        R0 = P4;                
        R6 = 0x0;

// Source Modify = 0 for Zero Fill
        W[P1+OFFSET_(MDMA2_S0_X_MODIFY)] = R6;        

FDO_DMA:
// divide count by 2 for 16 bit transfer
        R2 >>= 1;

        CALL MEM_DMA;
// Bit zero of the flag word indicates zero fill block
        cc = BITTST(R5,0);                
        IF !CC JUMP GET_DMA_CURR_PTR;

// Restore Source Modify to 2 (it was just changed to 0 for zero fill) 
        R6 = 0x2 (Z);
        W[P1+OFFSET_(MDMA2_S0_X_MODIFY)] = R6;        

// Restore R0 to Flash Memory Address (was pointing to "ZERO")
        JUMP GET_NEXT_FLASH_PTR;

GET_DMA_CURR_PTR:

// read CURR pointer if last block was not a zero fill
// otherwise CURR pointer will point just beyond the zero!

        R7 = [P1+OFFSET_(MDMA2_S0_CURR_ADDR)];

GET_NEXT_FLASH_PTR:
// if last block was zero fill, R7 still has the saved flash pointer
// if last block was NOT zero fill, R7 has DMA CURR pointer
// put in in R0 for next call to MEM_DMA
        R0 = R7;                 

F_CHECK_FOR_LAST_SECTION:
// Last Section?
        CC = BITTST(R5,15);          

// If not, Jump to grab header
        IF !CC JUMP FGRAB_HEADER; 
        nop;nop;nop;  // fix for anomaly 05-00-428
        RETS = [sp++];
// return a success flag back to the command protocol        
        R0 = 0x0;
        RTS;

////////////////////////////////////////////////////////////////
DMA_ERROR_OR_EXCEPT:
//--------------

// Clear flash DMA_ERR condition
	R0 = 0x3;
	W[P1+OFFSET_(MDMA2_D0_IRQ_STATUS)] = R0; 
	W[P1+OFFSET_(MDMA2_S0_IRQ_STATUS)] = R0;
	
// Disable MEM DMA to completely clear the error, so we can continue to 
// use MEMDMA again, if we want.
	R0 = 0x0;
	W[P1+OFFSET_(MDMA2_S0_CONFIG)] = R0;
	W[P1+OFFSET_(MDMA2_D0_CONFIG)] = R0;	

	IDLE;
	
////  ZERO will point to a zero (accessed as both byte and word)  ////////

.align 4;

.BYTE ZERO[4] = 0x0, 0x0, 0x0, 0x0;

.align 4;
     
//=========================================================
JUMP_USER_PROGRAM:

// 9/1/05 - BK 
// Re-enable all wake-ups 
// IWR's have been used during boot

// IWR's reset value = ffffffff
        R0 = 0xffffffff;
        P0.L = LOWER_(SICA_IWR0); 
        P0.H = UPPER_(SICA_IWR0);
        [P0] = R0;
        P0.L = LOWER_(SICA_IWR1); 
        P0.H = UPPER_(SICA_IWR1);
        [P0] = R0;


// zero out the last locations of L2
	P0.L = 0xFFE8;
	P0.H = 0xFEB1;
    R0 = 0x0;
    [P0++] = R0;	// ffe8
    [P0++] = R0;	// ffeC
    [P0++] = R0;	// fff0
    [P0++] = R0;	// fff4
    [P0++] = R0;	// fff8
	[P0++] = R0;	// fffC

	P2.L = LOWER_(CoreA_Code_SRAM);  // point the user_code address
	P2.H = UPPER_(CoreA_Code_SRAM);

// Erase the 2nd stage loader from beginning to almost the end
// End address in R3	
	R2.L = end_ldr;
	R2.H = end_ldr;
	R1.L = START_ERASE;
	R1.H = START_ERASE;        

// Get count in R2 for DMA transfer
	R2 = R2 - R1;

// divide count by 2
	R2 >>= 1;

// Source Base Address = ZERO Location
	R0 = P4;		

// Source Modify = 0 for Zero Fill 
	R6 = 0x0;
	W[P1+OFFSET_(MDMA2_S0_X_MODIFY)] = R6;	

// Source Base Address                
	[P1+OFFSET_(MDMA2_S0_START_ADDR)] = R0;        

// Source Count
	W[P1+OFFSET_(MDMA2_S0_X_COUNT)] = R2;        

// Destination Base Address
	[P1+OFFSET_(MDMA2_D0_START_ADDR)] = R1;        

// Destination Count
	W[P1+OFFSET_(MDMA2_D0_X_COUNT)] = R2;        

// Source DMAConfig
	W[P1+OFFSET_(MDMA2_S0_CONFIG)] = R3;
                        
// Destination DMAConfig
	W[P1+OFFSET_(MDMA2_D0_CONFIG)] = R4;        

end_ldr:

// Wait for DMA to Complete
	IDLE;                                        
	R0 = 0x1;
// Write 1 to clear DMA interrupt
	W[P1+OFFSET_(MDMA2_D0_IRQ_STATUS)] = R0; 
	
	JUMP(P2);      // jump to user code

_SECOND_STAGE_LOADER.end:   
