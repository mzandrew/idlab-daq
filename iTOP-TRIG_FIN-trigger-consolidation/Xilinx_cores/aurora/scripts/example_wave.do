####################################################################################
##
## Project:  Aurora Module Generator version 3.1
##
##    Date:  $Date: 2009/09/08 16:23:51 $
##     Tag:  $Name: i+O-61x+189894 $
##    File:  $RCSfile: wave_do_v4.ejava,v $
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
####################################################################################
##
## SAMPLE_WAVE.DO
##
##
## Description: This file is a wave file used for simulations with aurora_SAMPLE_TB and 
##              the frame generator and checker.
##


onerror {resume}
quietly WaveActivateNextPane {} 0
    


add wave -noupdate -divider {aurora Core 1}
add wave -noupdate -divider {Core 1 Streaming TX Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/TX_D
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/TX_SRC_RDY_N
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/TX_DST_RDY_N
add wave -noupdate -divider {Core 1 Streaming RX Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/RX_D
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/RX_SRC_RDY_N
add wave -noupdate -divider {Core 1 Error Detection Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/HARD_ERROR
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/SOFT_ERROR
add wave -noupdate -divider {Core 1 Status Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/CHANNEL_UP
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/LANE_UP
add wave -noupdate -divider {Core 1 Clock Compensation Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/WARN_CC
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/DO_CC
add wave -noupdate -divider {Core 1 System Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/DCM_NOT_LOCKED
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/RESET
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/POWER_DOWN
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_1_i/aurora_aurora_module_i/TX_OUT_CLK
add wave -noupdate -divider {Frame Checker Error Count for Core 1 }
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_1_i/ERROR_COUNT



add wave -noupdate -divider {aurora Core 2}
add wave -noupdate -divider {Core 2 Streaming TX Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/TX_D
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/TX_SRC_RDY_N
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/TX_DST_RDY_N
add wave -noupdate -divider {Core 2 Streaming RX Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/RX_D
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/RX_SRC_RDY_N
add wave -noupdate -divider {Core 2 Error Detection Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/HARD_ERROR
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/SOFT_ERROR
add wave -noupdate -divider {Core 2 Status Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/CHANNEL_UP
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/LANE_UP
add wave -noupdate -divider {Core 2 Clock Compensation Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/WARN_CC
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/DO_CC
add wave -noupdate -divider {Core 2 System Interface}
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/USER_CLK
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/DCM_NOT_LOCKED
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/RESET
add wave -noupdate -format Logic /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/POWER_DOWN
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_2_i/aurora_aurora_module_i/TX_OUT_CLK
add wave -noupdate -divider {Frame Checker Error Count for Core 2 }
add wave -noupdate -format Literal /aurora_SAMPLE_TB/aurora_aurora_example_2_i/ERROR_COUNT




TreeUpdate [SetDefaultTree]
WaveRestoreCursors {11841771 ps}
WaveRestoreZoom {0 ps} {26705705 ps}
configure wave -namecolwidth 273
configure wave -valuecolwidth 37
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2




