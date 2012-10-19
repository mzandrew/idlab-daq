#include <services/services.h>
#include "initialize_sdram_with_system_services.h"

/****************************************************************************
 Global Variables
*****************************************************************************/
// set the sdram to 64 MB
static ADI_EBIU_SDRAM_BANK_VALUE bank_size = {0, ADI_EBIU_SDRAM_BANK_64MB};
//set the sdram to 10 bit Column Address Width
static ADI_EBIU_SDRAM_BANK_VALUE bank_caw  = {0, (ADI_EBIU_SDRAM_BANK_SIZE)ADI_EBIU_SDRAM_BANK_COL_11BIT}; // 11 bit column addess width
//set the twr to 1 sclk + 7.5 nsecs
static ADI_EBIU_TIMING_VALUE MyTWR = { 		1, 										// 1 cycle
										{7500, ADI_EBIU_TIMING_UNIT_PICOSEC} };	    // 7.5 nanoseconds;
//set the refresh rate to 64ms at 8192 rows
static ADI_EBIU_TIMING_VALUE Refresh = { 											// SDRAM Refresh rate: 
										 8192, 									// 8192 cycles
										{ 64, ADI_EBIU_TIMING_UNIT_MILLISEC	}}; 	// 64 milliseconds;
//set TRAS to 44ns									
static ADI_EBIU_TIME MyTRAS = {44, ADI_EBIU_TIMING_UNIT_NANOSEC};
//set TRP to 20ns
static ADI_EBIU_TIME MyTRP  = {20, ADI_EBIU_TIMING_UNIT_NANOSEC};
//set TRCD to 20ns
static ADI_EBIU_TIME MyTRCD = {20, ADI_EBIU_TIMING_UNIT_NANOSEC};
//set CAS Latency to 3 if we have cycles
//static u32 MyCAS = 133;
//Disable Extended Mode Register
static ADI_EBIU_SDRAM_EMREN MyEMREN = ADI_EBIU_SDRAM_EMREN_DISABLE;
//Refresh all banks
static ADI_EBIU_PASR  MyPASR = ADI_EBIU_PASR_ALL;
//Temperature Compensation at 45°C
static ADI_EBIU_SDRAM_TCSR  MyTCSR = ADI_EBIU_SDRAM_TCSR_45DEG;
//we don't have any registered buffer
static ADI_EBIU_SDRAM_EBUFE MyEBUFE = ADI_EBIU_SDRAM_EBUFE_DISABLE;
//no fast-back-to-back read/write
static ADI_EBIU_SDRAM_FBBRW MyFBBRW = ADI_EBIU_SDRAM_FBBRW_DISABLE;
//Do not diable the control during bus grant
static ADI_EBIU_SDRAM_CDDBG MyCDDBG = ADI_EBIU_SDRAM_CDDBG_DISABLE;
//We don't need any delay at Power uUp
static ADI_EBIU_SDRAM_PUPSD MyPUPSD = ADI_EBIU_SDRAM_PUPSD_NODELAY;
//Do first refresh and 
static ADI_EBIU_SDRAM_PSM MyPSM = ADI_EBIU_SDRAM_PSM_REFRESH_FIRST;

void setup_SDRAM_using_system_services(void) {
	ADI_EBIU_RESULT Result;
	//Setup all values

	ADI_EBIU_COMMAND_PAIR Sdram_Values[] = {	
		{ ADI_EBIU_CMD_SET_SDRAM_BANK_SIZE,		(void*)&bank_size     		},
		{ ADI_EBIU_CMD_SET_SDRAM_BANK_COL_WIDTH,(void*)&bank_caw    		}, 
		{ ADI_EBIU_CMD_SET_SDRAM_CL_THRESHOLD,	(void*)100      		    },
		{ ADI_EBIU_CMD_SET_SDRAM_TRASMIN,		(void*)&MyTRAS               },
		{ ADI_EBIU_CMD_SET_SDRAM_TRPMIN,		(void*)&MyTRP             	},
		{ ADI_EBIU_CMD_SET_SDRAM_TRCDMIN,		(void*)&MyTRCD			   	},
		{ ADI_EBIU_CMD_SET_SDRAM_TWRMIN,		(void*)&MyTWR             },
		{ ADI_EBIU_CMD_SET_SDRAM_REFRESH,		(void*)&Refresh      		},
		{ ADI_EBIU_CMD_SET_SDRAM_FBBRW, 		(void*)&MyFBBRW				},
		{ ADI_EBIU_CMD_SET_SDRAM_EMREN,			(void*)&MyEMREN				},
		{ ADI_EBIU_CMD_SET_SDRAM_PASR,			(void*)&MyPASR				},
		{ ADI_EBIU_CMD_SET_SDRAM_TCSR,			(void*)&MyTCSR				},
		{ ADI_EBIU_CMD_SET_SDRAM_EBUFE,			(void*)&MyEBUFE				},
		{ ADI_EBIU_CMD_SET_SDRAM_CDDBG,			(void*)&MyCDDBG				},
        { ADI_EBIU_CMD_SET_SDRAM_PUPSD,			(void*)&MyPUPSD				},
        { ADI_EBIU_CMD_SET_SDRAM_PSM,			(void*)&MyPSM					},
		{ ADI_EBIU_CMD_END, 0}

	};

	// Pass the above table to the Intialization routine

	Result = adi_ebiu_Init( Sdram_Values, false);
} 
