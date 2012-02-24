   
################################################################################
##   ____  ____ 
##  /   /\/   / 
## /___/  \  /    Vendor: Xilinx 
## \   \   \/     Version : 1.9
##  \   \         Application : Spartan-6 GTP Wizard 
##  /   /         Filename : simulate_mti.do
## /___/   /\     
## \   \  /  \ 
##  \___\/\___\ 
##
##
## Script SIMULATE_MTI.DO
## Generated by Xilinx Spartan-6 GTP Wizard


##***************************** Beginning of Script ***************************
        
## If MTI_LIBS is defined, map unisim and simprim directories using MTI_LIBS
## This mode of mapping the unisims libraries is provided for backward 
## compatibility with previous wizard releases. If you don't set MTI_LIBS
## the unisim libraries will be loaded from the paths set up by compxlib in
## your modelsim.ini file

set XILINX   $env(XILINX)
if [info exists env(MTI_LIBS)] {    
    set MTI_LIBS $env(MTI_LIBS)
    vlib UNISIM
    vlib SECUREIP
    vmap UNISIM $MTI_LIBS/unisim
    vmap SECUREIP $MTI_LIBS/secureip
   
}

## Create and map work directory
vlib work
vmap work work


##MGT Wrapper
vcom -93 -work work  ../../../aurora_gtp_transceiver_tile.vhd;
vcom -93 -work work  ../../../aurora_gtp_transceiver.vhd;


vcom -93 -work work  ../../example_design/mgt_usrclk_source_pll.vhd;


##Example Design modules
vcom -93 -work work  ../../example_design/frame_gen.vhd;
vcom -93 -work work  ../../example_design/frame_check.vhd;
vcom -93 -work work  ../../example_design/aurora_gtp_transceiver_top.vhd;
vcom -93 -work work  ../demo_tb.vhd;

##Other modules
vcom -93 -work work ../sim_reset_mgt_model.vhd;

##Load Design
vsim -t 1ps work.DEMO_TB -voptargs="+acc"

##Load signals in wave window
view wave
do wave_mti.do

##Run simulation
run 50 us

