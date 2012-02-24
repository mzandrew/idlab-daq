##############################################################################
## (c) Copyright 2004 Xilinx, Inc. All rights reserved.
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
set projDir [file dirname [info script]]
set projName planAhead_aurora_8b10b_2
set topName aurora_8b10b_2_example_design
set device xc6slx45t-3fgg484

if {[file exists $projDir/$projName]} {
# if the project directory exists, delete it and create a new clean one
file delete -force $projDir/$projName
}

create_project $projName $projDir/$projName -part $device

set_property design_mode RTL [get_filesets sources_1]

## Source files

#Aurora Package
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_aurora_pkg.vhd
 
# AXI shim modules
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_axi_to_ll.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_ll_to_axi.vhd
#Aurora Lane Modules
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_err_detect_4byte.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_lane_init_sm_4byte.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_sym_dec_4byte.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_sym_gen_4byte.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_aurora_lane_4byte.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_chbond_count_dec_4byte.vhd
#Global Logic Modules
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_channel_err_detect.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_channel_init_sm.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_idle_and_ver_gen.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_global_logic.vhd
#TX_Stream Module
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_tx_stream.vhd
#RX_Stream Module
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/aurora_8b10b_2_rx_stream.vhd
#Clock Module
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/clock_module/aurora_8b10b_2_clock_module.vhd
#GTP Wrapper
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/gt/aurora_8b10b_2_transceiver_wrapper.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/gt/aurora_8b10b_2_tile.vhd
#Top Level Files
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/aurora_8b10b_2.vhd
#end AURORA_MODULE list
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/traffic_gen_check/aurora_8b10b_2_frame_gen.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/traffic_gen_check/aurora_8b10b_2_frame_check.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/cc_manager/aurora_8b10b_2_standard_cc_module.vhd
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/aurora_8b10b_2_reset_logic.vhd 
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/aurora_8b10b_2_example_design.vhd 

#UCF file
import_files -fileset [get_filesets constrs_1] -force -norecurse $projDir/../example_design/aurora_8b10b_2_example_design.ucf

set_property top $topName [get_property srcset [current_run]]

##-----------------------------Run Synthesis-------------------------------------
launch_runs -runs synth_1
wait_on_run synth_1

##-----------------------------Run Implementation followed by Bitgen-------------------------------------
set_property add_step Bitgen [get_runs impl_1]
launch_runs -runs impl_1
wait_on_run impl_1

puts "INFO:Implementation is complete for aurora_8b10b_2_example_design"
puts "INFO:Refer planAhead_aurora_8b10b_2 directory for implementation results" 
