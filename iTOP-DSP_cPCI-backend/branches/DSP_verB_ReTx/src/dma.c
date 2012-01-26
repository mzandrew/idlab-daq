#include <cdefBF561.h>
#include <ccblkfn.h>
#include <sys/exception.h>
#include "../system.h"
#include "../sml2/l2.h"
#include "../sml3/sml3.h"
#include "dma.h"
#include "debug.h"



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

void initiate_dma_transfer_from_l3_buffer_to_l1_buffer(void) {
	wait_until_mdma1_stream0_is_paused_or_stopped();
	START_SECTION__dma_transfers;
	// at 600MHz/120MHz, this takes 70us
	*pMDMA1_S0_CONFIG = mdma1_S0_config_base_value | (0x1<<0); // DMAEN=1 source channel first
	*pMDMA1_D0_CONFIG = mdma1_D0_config_base_value | (0x1<<0); // DMAEN=1
	ssync();
}

void wait_until_mdma1_stream0_is_paused_or_stopped(void) {
	unsigned short int d = 1, s = 1;
//	*pFIO0_FLAG_S = 1<<1;
	while (s || d) {
		d = (*pMDMA1_D0_IRQ_STATUS) & DMA_RUN;
		s = (*pMDMA1_S0_IRQ_STATUS) & DMA_RUN;
	}
//	*pFIO0_FLAG_C = 1<<1;
	END_SECTION__dma_transfers;
}

void setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer(unsigned char which_waveform, unsigned long int i) {
	wait_until_mdma1_stream0_is_paused_or_stopped();
	*pMDMA1_S0_X_COUNT = N>>1; // assuming 16 bit values
	*pMDMA1_D0_X_COUNT = N>>1; // assuming 16 bit values
	*pMDMA1_S0_X_MODIFY = 4; // in bytes
	*pMDMA1_D0_X_MODIFY = 4; // in bytes
	*pMDMA1_S0_START_ADDR = buffer0[i];
	if (which_waveform=='a') {
		*pMDMA1_D0_START_ADDR = waveform_a;
	} else {
		*pMDMA1_D0_START_ADDR = waveform_b;
	}
	// see hardware reference page 9-13
	//                           FLOW[2:0]   NDSIZE[3:0]  DI_EN      DI_SEL     RESTART    DMA2D      WDSIZE[1:0] WNR        DMAEN
	mdma1_S0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x0<<1) | (0x0<<0);
	mdma1_D0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x1<<1) | (0x0<<0);
	ssync();
}

void setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer(unsigned char which_waveform, unsigned short int which_channel, unsigned short int offset) {
	wait_until_mdma1_stream0_is_paused_or_stopped();
	*pMDMA1_S0_X_COUNT = N>>1; // assuming 16 bit values
	*pMDMA1_D0_X_COUNT = N>>1; // assuming 16 bit values
	*pMDMA1_S0_X_MODIFY = 4; // in bytes
	*pMDMA1_D0_X_MODIFY = 4; // in bytes
	// bug/future:  worry about the pulse coming too near the end of the 32768...
//	*pMDMA1_S0_START_ADDR = (void *) BLAB3_pedestal[which_channel][offset];
	*pMDMA1_S0_START_ADDR = ASIC_pedestal[which_channel] + 2 * offset; // assuming 16 bit values
	if (which_waveform=='a') {
		*pMDMA1_D0_START_ADDR = pedestal_a;
	} else {
		*pMDMA1_D0_START_ADDR = pedestal_b;
	}
	// see hardware reference page 9-13
	//                           FLOW[2:0]   NDSIZE[3:0]  DI_EN      DI_SEL     RESTART    DMA2D      WDSIZE[1:0] WNR        DMAEN
	mdma1_S0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x0<<1) | (0x0<<0);
	mdma1_D0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x1<<1) | (0x0<<0);
	ssync();
}

void setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer(unsigned char which_waveform, unsigned short int which_channel) {
	wait_until_mdma1_stream0_is_paused_or_stopped();
	*pMDMA1_S0_X_COUNT = N>>1; // assuming 16 bit values
	*pMDMA1_D0_X_COUNT = N>>1; // assuming 16 bit values
	*pMDMA1_S0_X_MODIFY = 4; // in bytes
	*pMDMA1_D0_X_MODIFY = 4; // in bytes
	*pMDMA1_S0_START_ADDR = ASIC_delta_t[which_channel];
	if (which_waveform=='a') {
		*pMDMA1_D0_START_ADDR = delta_t_a;
	} else {
		*pMDMA1_D0_START_ADDR = delta_t_b;
	}
	// see hardware reference page 9-13
	//                           FLOW[2:0]   NDSIZE[3:0]  DI_EN      DI_SEL     RESTART    DMA2D      WDSIZE[1:0] WNR        DMAEN
	mdma1_S0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x0<<1) | (0x0<<0);
	mdma1_D0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x1<<1) | (0x0<<0);
	ssync();
}

/***********************************************************************************************************
  Use DMA 1  channel 0 
************************************************************************************************************/


void setup_ppi_transfers_from_fpga_via_ppi0(void) {
//	*pPPI0_CONTROL = 0x380c;
	// see hardware reference page 11-4
	//                        POLS      | POLC      | DLEN[2:0] | SKIP_EO   | SKIP_EN  | DMA32    | PACK_EN  | FLD_SEL  | PORT_CFG[1:0] | XFR_TYPE[1:0] | PORT_DIR | PORT_EN
	ppi0_control_base_value = (0x1<<15) | (0x0<<14) | (0x7<<11) | (0x0<<10) | (0x0<<9) | (0x1<<8) | (0x1<<7) | (0x0<<6) | (0x0<<4)      | (0x3<<2)      | (0x0<<1) | (0x0<<0);
	*pPPI0_CONTROL = ppi0_control_base_value;
	*pPPI0_DELAY = 0; // the goggles do nothing
	*pPPI0_COUNT = N - 1;
	ssync();
}

void enable_ppi_transfers_from_fpga_via_ppi0(void) {
	*pPPI0_CONTROL = ppi0_control_base_value | (0x1<<0);
	ssync();
}

void init_dma(void) {
	unsigned long int i;
	for (i=0; i<number_of_blocks-1; i++) {
		dma_descriptor[i].lower_half_of_address_of_next_descriptor = ( (unsigned long int)&dma_descriptor[i+1]) & 0xffff;
		dma_descriptor[i].upper_half_of_address_of_next_descriptor = (((unsigned long int)&dma_descriptor[i+1]) & 0xffff0000)>>16;
		dma_descriptor[i].lower_half_of_address_of_destination = ( (unsigned long int)&buffer0[i][N-2]) & 0xffff;
		dma_descriptor[i].upper_half_of_address_of_destination = (((unsigned long int)&buffer0[i][N-2]) & 0xffff0000)>>16;
	}
	i = number_of_blocks - 1;
	dma_descriptor[i].lower_half_of_address_of_next_descriptor = ( (unsigned long int)&dma_descriptor[0]) & 0xffff;
	dma_descriptor[i].upper_half_of_address_of_next_descriptor = (((unsigned long int)&dma_descriptor[0]) & 0xffff0000)>>16;
	dma_descriptor[i].lower_half_of_address_of_destination = ( (unsigned long int)&buffer0[i][N-2]) & 0xffff;
	dma_descriptor[i].upper_half_of_address_of_destination = (((unsigned long int)&buffer0[i][N-2]) & 0xffff0000)>>16;
}

unsigned short int dma_configuration_register(u16 flow, u16 ndsize, u16 di_en,
	u16 di_sel, u16 restart, u16 dma2d, u16 wdsize, u16 wnr, u16 dmaen) {
	// see hardware reference page 9-13
	//     FLOW[2:0]  | NDSIZE[3:0] | DI_EN      | DI_SEL      |  RESTART     | DMA2D      | WDSIZE[1:0]  | WNR      | DMAEN
	return (flow<<12) | (ndsize<<8) | (di_en<<7) | (di_sel<<6) | (restart<<5) | (dma2d<<4) | (wdsize<<2)  | (wnr<<1) | (dmaen<<0);
}

void setup_dma_transfers_from_fpga_via_ppi0(void) {
	init_dma();
//	*pDMA1_0_CURR_DESC_PTR = &dma_descriptor[0]; // write the whole 32 bits at first (then just the lower 16 bits later)
	*pDMA1_0_NEXT_DESC_PTR = &dma_descriptor[0]; // write the whole 32 bits at first (then just the lower 16 bits later)
	*pDMA1_0_X_COUNT = N>>1;
	*pDMA1_0_X_MODIFY = -4; // always in bytes
//	*pDMA1_0_START_ADDR = l3_d;
//	*pDMA1_0_START_ADDR = &l3_e[0][0];
	dma1_0_config_base_value = dma_configuration_register(7, 4, 0, 0, 1, 0, 2, 1, 0);
//	dma1_0_config_base_value = dma_configuration_register(6, 3, 0, 0, 1, 0, 2, 1, 0);
//	dma1_0_config_base_value = dma_configuration_register(1, 0, 0, 0, 1, 0, 1, 1, 0);
//	dma1_0_config_base_value = dma_configuration_register(4, 3, 0, 0, 1, 0, 1, 1, 0);
	*pDMA1_0_CONFIG = dma1_0_config_base_value;
	ssync();
}

void setup_interrupts_for_dma_transfers_from_fpga_via_ppi0(void) {
//	register_handler(ik_ivg8, finished_getting_waveform_from_fpga_interrupt_service_routine);
	*pSICA_IAR1 = 0x21000;
	*pEVT8 = finished_getting_waveform_from_fpga_interrupt_service_routine;
//	*pEVT8 = finished_another_waveform_transfer_from_fpga;
	*pSICA_IMASK0 |= (1<<11); // dma1_0 ppi0
//	*pSICA_IMASK0 |= (1<<12); // dma1_1 ppi1


	*pIMASK |= (1<<8); // this enables the interrupt for core a becuase this code is being run from core a
	 dma1_0_config_base_value |= (1<<7); // di_en
	*pDMA1_0_CONFIG = dma1_0_config_base_value;

	ssync();
}

void disable_interrupts_for_dma_transfers_from_fpga_via_ppi0(void) {
	*pSICA_IMASK0 &= ~(3<<11); // disable dma1_0 PPI0 and dma1_1 PPI1  page4-37
//	*pSICA_IMASK0 &= ~(1<<12); // dma1_1 ppi1
	*pIMASK &= ~(3<<8); //disable IV8 and IV9
	dma1_0_config_base_value &= ~(1<<7); // di_en
	ssync();
}

void enable_dma_transfers_from_fpga_via_ppi0(void) {
	*pDMA1_0_CONFIG = dma1_0_config_base_value | (0x1<<0);
	ssync();
}

void acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga(void) {
	*pDMA1_0_IRQ_STATUS |= DMA_DONE; // write one to clear
}

/*******************************************************************************
*   Function:  void setup_ppi_transfers_via_ppi1_to_fpga(void)  
*	 input:   none
*	 output:  none
*	 Date:    04/22/2011
*    Author:  Lili Zhang
*    Description: Set up PPI1.  PPI1 is used to transmit data back to FPGA
*********************************************************************************/


void setup_ppi_transfers_via_ppi1_to_fpga(void) {

	// see hardware reference page 11-4
	//                        POLS      | POLC      | DLEN[2:0] | SKIP_EO   | SKIP_EN  | DMA32    | PACK_EN  | FLD_SEL  | PORT_CFG[1:0] | XFR_TYPE[1:0] | PORT_DIR | PORT_EN
	ppi1_control_base_value = (0x1<<15) | (0x0<<14) | (0x7<<11) | (0x0<<10) | (0x0<<9) | (0x1<<8) | (0x1<<7) | (0x0<<6) | (0x0<<4)      | (0x3<<2)      | (0x1<<1) | (0x0<<0);
	*pPPI1_CONTROL = ppi1_control_base_value;
	*pPPI1_DELAY = 1; // delay one cycle after assertion PPI1_FS1
	*pPPI1_COUNT = NN - 1; //transmit the modified waveform back additional to other data 
	ssync();
}

/*******************************************************************************
*   Function: void enable_ppi_transfers_via_ppi1_to_fpga(void)  
*	 input:   none
*	 output:  none
*	 Date:    04/22/2011
*    Author:  Lili Zhang
*    Description: Enable PPI I
*********************************************************************************/
void enable_ppi_transfers_via_ppi1_to_fpga(void) {
	*pPPI1_CONTROL = ppi1_control_base_value | (0x1<<0);  //enable PPI
	ssync();

}

/*******************************************************************************
*   Function:  void disable_ppi_transfers_via_ppi1_to_fpga(void)
*	 input:    none
*	 output:   none 
*	 Date:     04/22/2011
*    Author:   Lili Zhang
*    Description: Disable PPI 1 
*********************************************************************************/
void disable_ppi_transfers_via_ppi1_to_fpga(void) {
	*pPPI1_CONTROL = ppi1_control_base_value | (0x0<<0);  //disable PPI
	ssync();
}

/********************  TIMER4 set up  **************************************************/
/**  to genetate a clock to PPI1      **************************************************/

/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void setup_timer4(void) {
	
	*pTIMER4_CONFIG =  0x020D; 
	ssync();    
	*pTIMER4_PERIOD =  4 ;   // f is 25MHz   
	*pTIMER4_WIDTH = 2;
	ssync();
}

/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void enable_timer4(void){

	 *pTMRS8_ENABLE = 0x10;    //enable timer4, bit 4
	 //*pTMRS8_ENABLE = 0x08;      //enable timer3, bit 3
	 ssync();		
}

/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void disable_timer4(void) {
	*pTMRS8_DISABLE &= ~(0x10);	   //disable timer4, bit 4
	//*pTMRS8_DISABLE &= ~(0x08);    //disable timer3, bit 3
	ssync();
	return;
}



/********************  TIMER10 set up  **************************************************/
/**  to create FS1 signal for FPGA     **************************************************/
/*******************************************************************************
*   Function:  void setup_timer10(void)  
*	 input:    none
*	 output:   none
*	 Date:     04/23/2011
*    Author:   Lili Zhang
*    Description: Set up timer10.  This timer is used to create FS1 signal to FPGA
*********************************************************************************/
void setup_timer10(void) {
	
	*pTIMER10_CONFIG =  0x02A9;  //see HW reference Page
	ssync();    
	//*pTIMER10_PERIOD =  200 ;   //Frequency is MHz 
	//*pTIMER10_PERIOD =  100 ;   //f is 0.75MHz 
	//*pTIMER10_PERIOD =  90 ; 
	*pTIMER10_PERIOD =  55 ;        
	 //*pTIMER10_PERIOD =  50 ;    //f is 1.5MHz    
  
  	*pTIMER10_WIDTH = 2;
	ssync();
	return;
}

/*******************************************************************************
*   Function:  void enable_timer10(void)  
*	 input:    none
*	 output:   none
*	 Date:     04/23/2011
*    Author: Lili Zhang
*    Description: Enable timer10
*********************************************************************************/
void enable_timer10(void){

	 *pTMRS4_ENABLE = 0x04;    //enable timer10  - bit 2
	 ssync();		
}

/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void disable_timer10(void) {
	*pTMRS4_DISABLE &= ~(0x04);
	ssync();
}


/************* DMA 1 channel 1 set up****************************************************/
//This part is handled manually since transmit is used STOP mode (FLOW = 0) 
/*******************************************************************************
*   Function:  void init_dma_channel1(void)  
*	 input:    none
*	 output:   none
*	 Date:     04/22/2011
*    Author: Lili Zhang
*    Description: Use circular buffer. Buffer 1 is located in Bank 1
*********************************************************************************/
void init_dma_channel1(void){
		
		unsigned short int i;

		for (i=0; i<number_of_blocks; i++){
		//last node points back to the first node
		if(i == number_of_blocks-1){
			dma_descriptor_Tx[i].ptrNext = &dma_descriptor_Tx[0];
		}
		else	
		   dma_descriptor_Tx[i].ptrNext = &dma_descriptor_Tx[i+1];
		   
		dma_descriptor_Tx[i].startAddress = &buffer1[i][0];  
	}
				
}

/*******************************************************************************
*   Function:  void setup_dma_transfers_from_ppi1_to_fpga(unsigned short buf1_num)  
*	 input:    circular buffer number
*	 output:   none
*	 Date:     04/22/2011
*    Author:   Lili Zhang
*    Description: Set up DMA1 channel 1. 
*********************************************************************************/
void setup_dma_transfers_from_ppi1_to_fpga(unsigned short buf1_num) {
	init_dma_channel1();
	//*pDMA1_1_CURR_DESC_PTR = &dma_descriptor_Tx[0];
	*pDMA1_1_X_COUNT = NN>>1;  //128 cell of 16 bits
	*pDMA1_1_X_MODIFY = 4; // always in bytes 
	*pDMA1_1_START_ADDR = buffer1[buf1_num];
	//*pDMA1_1_START_ADDR = dma_descriptor_Tx[0].startAddress;
	
	// use FLOW  = 0x0  Stop mode     				     FLOW[2:0] | NDSIZE[3:0] | DI_EN  | DI_SEL  |  RESTART   | DMA2D   | WDSIZE[1:0]  | WNR   | DMAEN
  	dma1_1_config_base_value = dma_configuration_register(0,    			0,         0,     0,          1,         0,           1,          0,     0);
	*pDMA1_1_CONFIG = dma1_1_config_base_value;
	ssync();
}

/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void notUsed_setup_dma_transfers_from_ppi1_to_fpga(void) {
	init_dma_channel1();
	*pDMA1_1_NEXT_DESC_PTR = &dma_descriptor_Tx[0]; // write the whole 32 bits at first (then just the lower 16 bits later)
	*pDMA1_1_X_COUNT = NN>>1;
	*pDMA1_1_X_MODIFY = -4; // always in bytes  
//	*pDMA1_1_START_ADDR = l3_d;
//	*pDMA1_1_START_ADDR = &l3_e[0][0];
	//     											     FLOW[2:0] | NDSIZE[3:0] | DI_EN  | DI_SEL  |  RESTART   | DMA2D   | WDSIZE[1:0]  | WNR   | DMAEN
    dma1_1_config_base_value = dma_configuration_register(7,    			4,         0,     0,          1,         0,           2,          0,     0);
  
	*pDMA1_1_CONFIG = dma1_1_config_base_value;
	ssync();
}

/*******************************************************************************
*   Function: void setup_interrupts_for_dma_transfers_from_ppi1_to_fpag(void)   
*	 input:   none
*	 output:  none
*	 Date:    04/22/2011
*    Author: Lili Zhang
*    Description:  Set up interrupt 9 and interrupt service routine.
*********************************************************************************/
void setup_interrupts_for_dma_transfers_from_ppi1_to_fpag(void) {
//	register_handler(ik_ivg9, transmitted_waveform_to_FPGA_through_DMA_PPI1_ISR);
//	*pSICA_IAR1 = Peripheral_IVG(12,9);   // assigna IVG9 to DMA1  channel 1  -- turn on this,interupt ivg8 is not working
//  bit 15:12  DMA1 channel 0 /interrupt IVG8,  bit 19:10  DMA1 channel1/IVG9  HW reference manual Page 4-37-38
	*pSICA_IAR1 = 0x21000;
	*pSICA_IAR2 = 0x88888888;   //Map all rest of interrupt to IVG15
	*pSICA_IAR3 = 0x88888888;
	*pSICA_IAR4 = 0x88888888; 
	*pSICA_IAR5 = 0x88888888;
	*pSICA_IAR6 = 0x88888888;
	*pSICA_IAR7 = 0x88888888; 	  
	*pEVT9 = transmitted_waveform_to_FPGA_through_DMA_PPI1_ISR;
	ssync();
	
}

/*******************************************************************************
*   Function: void enable_interrupts_for_dma_transfers_from_ppi1_to_fpga(void)  
*	 input:   none
*	 output:  none
*	 Date:    04/22/2011
*    Author: Lili Zhang
*    Description: Enable interrupt 9
*********************************************************************************/
void enable_interrupts_for_dma_transfers_from_ppi1_to_fpga(void) {
	
	*pSICA_IMASK0 |= (1<<12); // dma1_1 ppi1 - enable interrupt channel 12
	*pIMASK  |=(1<<9); // this enables the interrupt IVG9 p4-39 for core a becuase this code is being run from core a
	
	 ssync();
}

/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void disable_interrupts_for_dma_transfers_from_ppi1_to_fpga(void) {
	*pSICA_IMASK0 &= ~(1<<12); // dma1_1 ppi1
	*pIMASK &= ~(1<<9); // this disables the interrupt IVG9 p4-39 for core a
	dma1_1_config_base_value &= ~(1<<7); // di_en  -- Do not allow completion of work unit to generate a data interrupt 
	ssync();
}

/*******************************************************************************
*   Function: void enable_dma_transfers_from_ppi1_to_fpga(void)   
*	 input:   none
*	 output:  none
*	 Date:    04/22/2011
*    Author:  Lili Zhang
*    Description: enable DMA1 channel 1
*********************************************************************************/
void enable_dma_transfers_from_ppi1_to_fpga(void) {
	
	//Chck to see DMA1_1_CONFIG has been set

	*pDMA1_1_CONFIG = dma1_1_config_base_value | (0x1<<0) |(0x1<<7);  //enable DMA1 channel 1 and DI_EN data interrupt
	*pIMASK  |=(1<<9);
	ssync();
}


/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void disable_dma_transfers_from_ppi1_to_fpga(void) {
		if(*pDMA1_1_CONFIG & 0x1)
	{
			*pDMA1_1_CONFIG = dma1_1_config_base_value | (0x0<<0);  //disable DMA1 channel 1
			ssync();
	}

	else{
			printf("DMA1_1_CONFIG is set, Try to set again!\n");
		return;
	}
}

/*******************************************************************************
*   Function  
*	 input: 
*	 output: 
*	 Date:   2011
*    Author: Lili Zhang
*    Description: 
*********************************************************************************/
void wait_until_dma1_1_paused_or_stopped(void) {
	unsigned short int run=1;

	while (run) {
		run = (*pDMA1_1_IRQ_STATUS) & DMA_RUN;
	}
	return;
}

/*******************************************************************************
*   Function:  void acknowledge_interrupt_for_completion_of_waveform_transfer_from_ppi1_to_fpga(void) 
*	 input:    none
*	 output:   none
*	 Date:     04/22/2011
*    Author: Lili Zhang
*    Description: Write one to clear. Interrupt is being asserted.
*********************************************************************************/
void acknowledge_interrupt_for_completion_of_waveform_transfer_from_ppi1_to_fpga(void) {
	
//	wait_until_dma1_1_paused_or_stopped();   //double check, don't need it late
	*pDMA1_1_IRQ_STATUS |= DMA_DONE; // write one to clear -- DMA channels's interrupt is being asserted
}


