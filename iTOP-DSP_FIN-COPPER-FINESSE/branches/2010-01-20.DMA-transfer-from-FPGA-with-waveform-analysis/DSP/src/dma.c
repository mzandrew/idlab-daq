#include <cdefBF561.h>
#include <ccblkfn.h>
#include "../system.h"
#include "../sml2/l2.h"
#include "../sml3/sml3.h"
#include "dma.h"
#include "debug.h"

unsigned short int mdma1_D0_config_base_value;
unsigned short int mdma1_S0_config_base_value;

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

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unsigned short int dma1_0_config_base_value;
unsigned short int ppi0_control_base_value;

unsigned short int dma_configuration_register(u16 flow, u16 ndsize, u16 di_en, u16 di_sel, u16 restart, u16 dma2d, u16 wdsize, u16 wnr, u16 dmaen);

void setup_ppi_transfers_from_fpga_via_ppi0(void) {
//	*pPPI0_CONTROL = 0x380c;
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
	*pSICA_IMASK0 &= ~(1<<11); // dma1_0 ppi0
//	*pSICA_IMASK0 &= ~(1<<12); // dma1_1 ppi1
	*pIMASK &= ~(1<<8); // this enables the interrupt for core a becuase this code is being run from core a
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
