unsigned short int l3_d_buffer_is_non_zero(void);
//	setup_programmable_flags_for_ppi1();
//	setup_SDRAM_using_system_services();
//	fill_l2_buffer_a(0x10101010);
//	toggle_led_pf0();
//	setup_single_dma_transfer_from_l2_buffer_to_l3_buffer();
//		if (counter==0) {
//			*pFIO0_FLAG_D = 0x01;
//			enable_waveform_transfers_from_fpga();
//			delay_ms(1); // yields about 73 dma transfers (1024 words each)
//			delay_ms(0.055); // yields about 5 dma transfers (1024 words each)
//			disable_waveform_transfers_from_fpga();
//			if (waveform_transfers_from_fpga_are_allowed) {
//				number_of_unprocessed_waveforms += 5; // this is a fudge until interrupts work
//			}
//			*pFIO0_FLAG_D = 0x00;
//		}
//		delay_ms(1);
//		*pFIO0_FLAG_D |= 0x01;
//		*pFIO0_FLAG_D &= ~0x01;
//		delay_ms(1);
/*
		if (counter<number_of_blocks) {
//			*pFIO0_FLAG_D = 0x01;
		} else if (counter==number_of_blocks) {
//			*pFIO0_FLAG_D = 0x00;
		} else if (counter==number_of_blocks+8) {
//			check_buffers();
		} else if (counter==number_of_blocks+16) {
//			check_l1_buffer();
//			*pFIO0_FLAG_D = 0x00;
//			clear_buffers();
//			*pFIO0_FLAG_D = 0x01;
		}
		counter++;
		if (counter>number_of_blocks+24) {
			counter = 0;	
		}
*/


void check_l1_buffer(void) {
	unsigned short int checksum = 0, i;
	delay_ms(10);
	for (i=0; i<N; i++) {
		checksum += waveform[i];
		if (waveform[i]==0x635) {
			*pFIO0_FLAG_D |= 0x40;
		} else {
			*pFIO0_FLAG_D &= ~0x40;
		}
		if (waveform[i]==0x555) {
			*pFIO0_FLAG_D &= ~0x20;
		} else {
			*pFIO0_FLAG_D |= 0x20;
		}
	}
	delay_ms(10);
}

void clear_l3_d_buffer(void) {
	unsigned short int i;
	*pFIO0_FLAG_D |= 0x02;
	for (i=0; i<N; i++) {
		l3_d[i] = 0x635;
	}
	*pFIO0_FLAG_D &= ~0x02;
}

void initiate_dma_transfer_from_l2_buffer_to_l3_buffer(void) {
	wait_until_mdma1_stream0_is_paused_or_stopped();
	// at 600MHz/120MHz, this takes 70us
	*pMDMA1_S0_CONFIG = mdma1_S0_config_base_value | (0x1<<0); // DMAEN=1 source channel first
	*pMDMA1_D0_CONFIG = mdma1_D0_config_base_value | (0x1<<0); // DMAEN=1
	ssync();
}

void setup_single_dma_transfer_from_l2_buffer_to_l3_buffer(void) {
	wait_until_mdma1_stream0_is_paused_or_stopped();
	*pMDMA1_S0_X_COUNT = l2_buffer_length;
	*pMDMA1_D0_X_COUNT = l2_buffer_length;
	*pMDMA1_S0_X_MODIFY = 4; // in bytes
	*pMDMA1_D0_X_MODIFY = 4; // in bytes
	*pMDMA1_S0_START_ADDR = l2_a;
	*pMDMA1_D0_START_ADDR = l3_a;
	// see hardware reference page 9-13
	//                           FLOW[2:0]   NDSIZE[3:0]  DI_EN      DI_SEL     RESTART    DMA2D      WDSIZE[1:0] WNR        DMAEN
	mdma1_S0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x0<<1) | (0x0<<0);
	mdma1_D0_config_base_value = (0x0<<12) | (0x0<<8)   | (0x0<<7) | (0x0<<6) | (0x0<<5) | (0x0<<4) | (0x2<<2)  | (0x1<<1) | (0x0<<0);
	ssync();
}



void check_status_of_dma_transfer(void) {
	if ((*pDMA1_0_IRQ_STATUS) & 0x08) {
//		*pFIO0_FLAG_D |= 0x10;
	} else {
//		*pFIO0_FLAG_D &= ~0x10;
	}
	if ((*pDMA1_0_IRQ_STATUS) & 0x02) {
//		*pFIO0_FLAG_D |= 0x20;
	} else {
//		*pFIO0_FLAG_D &= ~0x20;
	}
	if ((*pDMA1_0_IRQ_STATUS) & 0x01) {
//		*pFIO0_FLAG_D |= 0x40;
	} else {
//		*pFIO0_FLAG_D &= ~0x40;
	}
}

//	*pDMA1_0_CURR_DESC_PTR = &from_fpga_dma_descriptor_table[0];
//	from_fpga_dma_descriptor_table[0] 

/*
	const unsigned long int m = 15967214/2;
	unsigned long int i, n;
    //Insert a nop at the beginning of the programm because VDSP is placing here a breakpoint
	*pFIO0_DIR |= 0x0001;
	*pFIO0_FLAG_D |= 0x0001;
    while(1) {
	    asm("nop;");
//        idle();
//		for (i=0; i<524288; i++) {
//			c[i] *= c[i] + 7;
//			c[i] = 524288 - i - 1;
//			c[i] = 0xbbbb;
		for (n=0; n<(2*m); n++) {
			i = n % 524288;
			l3_c[i] = 0xb1b1;
		}
		*pFIO0_FLAG_D |= 0x0001;
		for (n=0; n<(2*m); n++) {
			i = n % 524288;
			l3_c[i] = 0xb2b2;
		}
		*pFIO0_FLAG_D &= ~0x0001;
//		}
//		for (i=; i<524288; i++) {
//		}
    };
//    while(1); // we will never come here  
*/

