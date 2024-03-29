extern unsigned short int mdma1_D0_config_base_value;
extern unsigned short int mdma1_S0_config_base_value;
void wait_until_mdma1_stream0_is_paused_or_stopped(void);
void setup_single_dma_transfer_from_l2_buffer_to_l3_buffer(void);
void initiate_dma_transfer_from_l2_buffer_to_l3_buffer(void);
void setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer(unsigned char which_waveform, unsigned long int i);
void setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer(unsigned char which_waveform, unsigned short int which_channel, unsigned short int offset);
void setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer(unsigned char which_waveform, unsigned short int which_channel);
void initiate_dma_transfer_from_l3_buffer_to_l1_buffer(void);

void setup_ppi_transfers_from_fpga_via_ppi0(void);
void enable_ppi_transfers_from_fpga_via_ppi0(void);
void setup_dma_transfers_from_fpga_via_ppi0(void);
void enable_dma_transfers_from_fpga_via_ppi0(void);

void check_status_of_dma_transfer(void);

void acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga(void);
void setup_interrupts_for_dma_transfers_from_fpga_via_ppi0(void);
void disable_interrupts_for_dma_transfers_from_fpga_via_ppi0(void);
