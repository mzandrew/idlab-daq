FPGA2DSP2FPGA Loopback Project 1-11-2012
by: Chester Lim

This project demonstrates the capability of sending data via PPI via FPGA to DSP and back.

The project uses PPI0 to send data from FPGA to DSP and PPI1 to receive data from DSP to FPGA. 
The DSP_CLK is running at 40MHz while the PPI_CLK is running at 20MHz.

One  quarter event is sent (132 x 140 32bit words). Real data is being used and defined in the
data16_pkg.vhd. Check sums are calculated and verified for the entire quarter event.