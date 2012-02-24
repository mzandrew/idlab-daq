# The package naming convention is <core_name>_xmdf
package provide aurora_try_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::aurora_try_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::aurora_try_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name aurora_try
}
# ::aurora_try_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::aurora_try_xmdf::xmdfApplyParams { instance } {

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
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/aurora_try_example_design.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
utilities_xmdf::xmdfSetData $instance FileSet $fcount toplevel true
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/simulation/demo_tb.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdlsim
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/simulation/functional/simulate_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/simulation/functional/wave_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/simulation/functional/simulate_isim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/simulation/functional/simulate_isim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/simulation/functional/wave_isim.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/aurora_try.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_axi_to_ll.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_ll_to_axi.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type xco
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type veo
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vho
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_aurora_lane_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_aurora_lane_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_aurora_lane_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_aurora_pkg.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/aurora_try_example_design.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ucf
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_channel_err_detect.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_channel_init_sm.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_chbond_count_dec_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_chbond_count_dec_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/clock_module/aurora_try_clock_module.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_err_detect_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_err_detect_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_err_detect_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/traffic_gen_check/aurora_try_frame_check.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/traffic_gen_check/aurora_try_frame_gen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_global_logic.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_idle_and_ver_gen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_lane_init_sm_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_lane_init_sm_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_lane_init_sm_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/aurora_try_reset_logic.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/gt/aurora_try_transceiver_wrapper.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/gt/aurora_try_tile.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_rx_stream.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/example_design/cc_manager/aurora_try_standard_cc_module.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_sym_dec_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_sym_gen_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/src/aurora_try_tx_stream.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/implement/s6_icon.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/implement/s6_vio.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/implement/implement.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/implement/implement.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/implement/xst.prj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora_try/implement/xst.scr
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
}
# ::gen_comp_name_xmdf::xmdfApplyParams
