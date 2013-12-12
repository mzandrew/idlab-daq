#################################################################################
##
## Project:  Aurora Module Generator version 3.1
##
##    Date:  $Date: 2009/09/08 16:23:47 $
##     Tag:  $Name: i+O-61x+189894 $
##    File:  $RCSfile: aurora_ftype.ejava,v $
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
#################################################################################
# The package naming convention is <core_name>_xmdf
package provide aurora_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::aurora_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::aurora_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name aurora
}
# ::aurora_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::aurora_xmdf::xmdfApplyParams { instance } {

set fcount 0
# Array containing libraries that are assumed to exist
# Examples include unisim and xilinxcorelib
# Optional
# In this example, we assume that the unisim library will
# be magically
# available to the simulation and synthesis tool
utilities_xmdf::xmdfSetData $instance FileSet $fcount type logical_library
utilities_xmdf::xmdfSetData $instance FileSet $fcount logical_library unisim
incr fcount





utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_flist.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount








utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_aurora_lane_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount






















utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/testbench/aurora_sample_tb.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount




utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/examples/aurora_aurora_sample.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/ucf/aurora_aurora_sample.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount











































utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/ucf/aurora.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ucf
incr fcount



utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_cal_block_v1_4_1.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_channel_error_detect.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_channel_init_sm.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount





utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_chbond_count_dec_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount















utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/scripts/config.csh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount








utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_error_detect_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount





utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/examples/aurora_frame_check.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/examples/aurora_frame_gen.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_global_logic.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_idle_and_ver_gen.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount











utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_lane_init_sm_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount










utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/scripts/make_aurora.pl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount








utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_mgt_wrapper.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount














utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/virtex-4fx_aurora_8b10b_readme.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/virtex-4fx_aurora_8b10b_ds128.pdf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/virtex-4fx_aurora_8b10b_gsg173.pdf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/virtex-4fx_aurora_8b10b_ug061.pdf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/scripts/v4_ila.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/scripts/v4_icon.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/scripts/aurorasimulate_isim.pl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
 




















































utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_rx_stream.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/scripts/example_test.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount




utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/cc_manager/aurora_standard_cc_module.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount





























utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
utilities_xmdf::xmdfSetData $instance FileSet $fcount toplevel true
incr fcount





utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_sym_dec_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount




utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_sym_gen_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount




utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/testbench/test_control.dat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/testbench/test_vectors2.vec
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/testbench/test_vectors.vec
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
































utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/testbench/abfm_tx_nfc_frames.dat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_tx_stream.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/testbench/abfm_tx_ufc_frames.dat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/testbench/abfm_tx_pdu_frames.dat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount




















utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/src/aurora_unused_mgt.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount




utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora/scripts/example_wave.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams
