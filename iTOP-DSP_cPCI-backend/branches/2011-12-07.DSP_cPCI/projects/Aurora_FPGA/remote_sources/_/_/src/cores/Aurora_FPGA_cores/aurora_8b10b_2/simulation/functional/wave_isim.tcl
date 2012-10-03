####################################################################################
## (c) Copyright 2010 - 2011 Xilinx, Inc. All rights reserved.
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
####################################################################################
##
## WAVE_ISIM.TCL
##
##
## Description: This file is a wave file used for simulations with EXAMPLE_TB and 
##              the frame generator and checker.
##
####################################################################################

onerror { show time;dump;resume }
wcfg new


divider add "aurora_8b10b_2 Core 1"
divider add "Core 1 Streaming TX Interface"
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/S_AXI_TX_TDATA
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/S_AXI_TX_TVALID
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/S_AXI_TX_TREADY
divider add "Core 1 Streaming RX Interface"
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/M_AXI_RX_TDATA
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/M_AXI_RX_TVALID
divider add "Core 1 Error Detection Interface"
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/HARD_ERR
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/SOFT_ERR
divider add "Core 1 Status Interface"
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/CHANNEL_UP
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/LANE_UP
divider add "Core 1 Clock Compensation Interface"
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/WARN_CC
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/DO_CC
divider add "Core 1 System Interface"
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_1_i/clock_module_i/PLL_NOT_LOCKED
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/RESET
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/POWER_DOWN
wave add /EXAMPLE_TB/example_design_1_i/aurora_module_i/GTPCLKOUT
divider add "Frame Checker Error Count for Core 1"
wave add /EXAMPLE_TB/example_design_1_i/ERR_COUNT



divider add "aurora_8b10b_2 Core 2"
divider add "Core 2 Streaming TX Interface"
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/S_AXI_TX_TDATA
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/S_AXI_TX_TVALID
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/S_AXI_TX_TREADY
divider add "Core 2 Streaming RX Interface"
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/M_AXI_RX_TDATA
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/M_AXI_RX_TVALID
divider add "Core 2 Error Detection Interface"
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/HARD_ERR
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/SOFT_ERR
divider add "Core 2 Status Interface"
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/CHANNEL_UP
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/LANE_UP
divider add "Core 2 Clock Compensation Interface"
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/WARN_CC
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/DO_CC
divider add "Core 2 System Interface"
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/USER_CLK
wave add /EXAMPLE_TB/example_design_2_i/clock_module_i/PLL_NOT_LOCKED
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/RESET
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/POWER_DOWN
wave add /EXAMPLE_TB/example_design_2_i/aurora_module_i/GTPCLKOUT
divider add "Frame Checker Error Count for Core 2"
wave add /EXAMPLE_TB/example_design_2_i/ERR_COUNT


# Save waveform with component name
wcfg save aurora_8b10b_2.wcfg

run all
quit
