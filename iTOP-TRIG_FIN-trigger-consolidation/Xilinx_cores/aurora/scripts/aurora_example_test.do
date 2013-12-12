##############################################################################
##
## Project:  Aurora Module Generator version 3.1
##
##    Date:  $Date: 2009/09/08 16:23:48 $
##     Tag:  $Name: i+O-61x+189894 $
##    File:  $RCSfile: example_test_do.ejava,v $
##     Rev:  $Revision: 1.3 $
##
## Company:  Xilinx
##
## (c) Copyright 2004 ? 2009 Xilinx, Inc. All rights reserved.
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
## (individually and collectively, "Critical Applications"). 
## Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.

##
##############################################################################
##
## SAMPLE_TEST.DO
##
##
## Description: A .do file to run a simulation using the aurora_aurora_example module, 
##              an example design which instantiates aurora.
##              The file modelsim.ini should be set correctly to map the logical
##              library names (such as  unisim, unisims_ver, simprim, simrprims_ver
##              etc.) to the corresponding physical directories where the precompiled
##              Xilinx libraries are located.
##
##              For more details on setting up Swift models, see (Xilinx Answer 14019).
##
##
##

        

# Get environment variables needed for finding precompiled libraries and ISE source code
set XILINX   $env(XILINX)

# Delete the pre-existing work directory
# vdel -all -lib work



# Create and map a work directory 
vlib work
vmap work work


# Compile the glbl module, used to simulate global powerup features of the FPGA
vlog -work work $XILINX/verilog/src/glbl.v;




# Compile the HDL for the Device Under Test
    # Aurora Lane Modules
    vlog -work work ../src/aurora_chbond_count_dec_4byte.v;
    vlog -work work ../src/aurora_error_detect_4byte.v;
    vlog -work work ../src/aurora_lane_init_sm_4byte.v;
    vlog -work work ../src/aurora_sym_dec_4byte.v;
    vlog -work work ../src/aurora_sym_gen_4byte.v;
    vlog -work work ../src/aurora_aurora_lane_4byte.v;


    # Global Logic Modules
    vlog -work work ../src/aurora_channel_error_detect.v;
    vlog -work work ../src/aurora_channel_init_sm.v;
    vlog -work work ../src/aurora_idle_and_ver_gen.v;
    vlog -work work ../src/aurora_global_logic.v; 


    # TX Streaming User Interface modules
    vlog -work work ../src/aurora_tx_stream.v;




    #RX Streaming User Interface modules
    vlog -work work ../src/aurora_rx_stream.v;






    #Top Level Modules and wrappers
    vlog -work work ../cc_manager/aurora_standard_cc_module.v;
    vlog -work work ../src/aurora_mgt_wrapper.v;
    vlog -work work ../src/aurora_unused_mgt.v;
    vlog -work work ../src/aurora_cal_block_v1_4_1.v;
    vlog -work work ../src/aurora.v;
    vlog -work work ../examples/aurora_frame_check.v;
    vlog -work work ../examples/aurora_frame_gen.v;    
    vlog -work work ../examples/aurora_aurora_example.v;


    # Testbench
    vlog -work work ../testbench/aurora_example_tb.v;
    
    
# Begin the test

##vsim -L secureIP -L unisim work.aurora_SAMPLE_TB work.glbl
vsim -L secureIP -L unisims_ver -t 1ps -novopt work.aurora_SAMPLE_TB work.glbl
view wave
do example_wave.do
run -all


