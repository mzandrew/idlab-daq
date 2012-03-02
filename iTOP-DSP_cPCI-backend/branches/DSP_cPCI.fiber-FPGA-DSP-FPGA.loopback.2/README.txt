FPGA2DSP2FPGA Loopback Aurora Dual Core Circular Buffer Project 3-2-2012
by: Chester Lim

This project uses a 40 MHz DSP clock with 20 MHz PPI clock. PPI0 & CoreB are used for RX while PPI1 & CoreA are used for TX.

In the FPGA, data from fiber is stored into a 32k FIFO. A programmable full flag is set to 140 x 32bits (1 Packet). When DSP is ready to receive data, the FPGA will send 1 packet over PPI0, this continues until the DSP requests a pause in data.

In the DSP, data from the FPGA is stored in a circular buffer. The circular buffer is constructed using 'num_buf' number of 140 x 32bits buffers connected in a ring. An interrupt is generated each time a buffer is filled or emptied. The circular buffer is considered full when the write pointer (rx_count) is 2 buffers preceeding the read pointer (tx_count). The buffer is empty when tx_count == rx_count.

The DSP performs a simple check sum calculation as a step in for processing waveforms. Once check sum has been calculated, the data is sent back to FPGA through PPI1. Data from the DSP is then stored into a small 512 FIFO in the FPGA and read out. This works because the PPI clock is 4 times slower than the processing clock in the FPGA.