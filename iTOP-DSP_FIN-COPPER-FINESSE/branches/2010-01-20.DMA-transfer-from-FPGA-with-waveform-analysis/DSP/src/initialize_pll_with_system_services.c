//#include <cdefBf561.h>
//#include <ccblkfn.h>
#include <services/services.h>
#include "initialize_pll_with_system_services.h"

void SetPower_core_a(void) {
    //This routine is changing the power and clock setting of the processor
	ADI_PWR_RESULT 	Result;
	ADI_PWR_COMMAND_PAIR Power_Settings[] = {	
		{ ADI_PWR_CMD_SET_PROC_VARIANT, (void*)ADI_PWR_PROC_BF561SBB600 },		// Processor type
		{ ADI_PWR_CMD_SET_PACKAGE,      (void*)ADI_PWR_PACKAGE_MBGA       },   	// Package
		{ ADI_PWR_CMD_SET_VDDEXT,       (void*)ADI_PWR_VDDEXT_330         },	// External voltage supply
		{ ADI_PWR_CMD_SET_CLKIN,        (void*)33333333                   },    // 30Mhz 
		{ ADI_PWR_CMD_SET_AUTO_SYNC_ENABLED, NULL                         },
		{ ADI_PWR_CMD_END,			    (void*)0						  }		// No more commands
	};
	// Pass the above table to the Intialization routine
	Result = adi_pwr_Init( Power_Settings );
    //Let's set the DSP to max!! 
	adi_pwr_SetMaxFreqForVolt( ADI_PWR_VLEV_130 ); // 600MHz / 120MHz
//	adi_pwr_SetMaxFreqForVolt( ADI_PWR_VLEV_115 );
}

void SetPower_core_b(void) {
    //This routine is changing the power and clock setting of the processor
	ADI_PWR_RESULT 	Result;
	ADI_PWR_COMMAND_PAIR Power_Settings[] = {	
		{ ADI_PWR_CMD_SET_PROC_VARIANT, (void*)ADI_PWR_PROC_BF561SBB600 },		// Processor type
		{ ADI_PWR_CMD_SET_PACKAGE,      (void*)ADI_PWR_PACKAGE_MBGA       },   	// Package
		{ ADI_PWR_CMD_SET_VDDEXT,       (void*)ADI_PWR_VDDEXT_330         },	// External voltage supply
		{ ADI_PWR_CMD_SET_CLKIN,        (void*)33333333                   },    // 30Mhz 
		{ ADI_PWR_CMD_SET_AUTO_SYNC_ENABLED, NULL                         },
		{ ADI_PWR_CMD_END,			    (void*)0						  }		// No more commands
	};
	// Pass the above table to the Intialization routine
	Result = adi_pwr_Init( Power_Settings );
    //Let's set the DSP to max!! 
//	adi_pwr_SetMaxFreqForVolt( ADI_PWR_VLEV_130 ); // 600MHz / 120MHz
//	adi_pwr_SetMaxFreqForVolt( ADI_PWR_VLEV_115 );
	idle();
}
