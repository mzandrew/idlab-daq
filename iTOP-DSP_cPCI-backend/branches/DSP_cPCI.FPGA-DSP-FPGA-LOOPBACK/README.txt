FPGA2DSP2FPGA Loopback Project 1-9-2012
by: Chester Lim

This project demonstrates the capability of sending data via PPI via FPGA to DSP and back.

The project uses PPI0 to send data from FPGA to DSP and PPI1 to receive data from DSP to FPGA. 
The DSP_CLK is running at 40MHz while the PPI_CLK is running at 20MHz.

One packet from a quarter event is sent (140 32bit words). Real data is being used and defined in the
data16_pkg.vhd. Check sums are calculated and verified with the 138th word in the packet. Note that the
project calculates the check sum with the 138th word included thus the check sum calculated in both the
DSP and FPGA should be twice the number in the 138th word in the packet.