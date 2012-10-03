##############################################################################
## (c) Copyright 2008 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
## 
## 
##############################################################################
##
## SIMULATE_MTI.DO
##
##
## Description: A .do file to run a simulation using the aurora_8b10b_2_example_design module, 
##              an example design which instantiates aurora_8b10b_2.
##
##              The file modelsim.ini should be set correctly to map the logical
##              library names (such as  unisim, unisims_ver, simprim, simrprims_ver 
##              etc.) to the corresponding physical directories where the precompiled 
##              Xilinx libraries are located. 
##              
##############################################################################
# Get environment variables needed for finding ISE source code
set XILINX   $env(XILINX)

# Create and map a work directory 
vlib work
vmap work work
# Compile the Aurora package in the work directory
vcom -93 -work work ../../src/aurora_8b10b_2_aurora_pkg.vhd;
# Compile testbench source
vcom -93 -work work ../../simulation/demo_tb.vhd;
# Compile the HDL for the Device Under Test
# AXI Shim modules
vcom -93 -work work ../../src/aurora_8b10b_2_axi_to_ll.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_ll_to_axi.vhd;
# Aurora Lane Modules  
vcom -93 -work work ../../src/aurora_8b10b_2_chbond_count_dec_4byte.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_err_detect_4byte.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_lane_init_sm_4byte.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_sym_dec_4byte.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_sym_gen_4byte.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_aurora_lane_4byte.vhd;
# Global Logic Modules
vcom -93 -work work ../../src/aurora_8b10b_2_channel_err_detect.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_channel_init_sm.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_idle_and_ver_gen.vhd;
vcom -93 -work work ../../src/aurora_8b10b_2_global_logic.vhd; 
# TX Streaming User Interface modules
vcom -93 -work work ../../src/aurora_8b10b_2_tx_stream.vhd;
# RX Streaming User Interface modules
vcom -93 -work work ../../src/aurora_8b10b_2_rx_stream.vhd;
# Top Level Modules and wrappers
vcom -93 -work work ../../example_design/clock_module/aurora_8b10b_2_clock_module.vhd;
vcom -93 -work work ../../example_design/cc_manager/aurora_8b10b_2_standard_cc_module.vhd;
vcom -93 -work work ../../example_design/gt/aurora_8b10b_2_transceiver_wrapper.vhd;
vcom -93 -work work ../../example_design/gt/aurora_8b10b_2_tile.vhd;
vcom -93 -work work ../../example_design/aurora_8b10b_2.vhd;
vcom -93 -work work ../../example_design/traffic_gen_check/aurora_8b10b_2_frame_check.vhd;
vcom -93 -work work ../../example_design/traffic_gen_check/aurora_8b10b_2_frame_gen.vhd;    
vcom -93 -work work ../../example_design/aurora_8b10b_2_reset_logic.vhd;
vcom -93 -work work ../../example_design/aurora_8b10b_2_example_design.vhd;
# Begin the test
vsim -L secureip -L unisim -t ps work.EXAMPLE_TB -voptargs="+acc" -GUSE_CHIPSCOPE=0
view wave
do wave_mti.do
run -a
