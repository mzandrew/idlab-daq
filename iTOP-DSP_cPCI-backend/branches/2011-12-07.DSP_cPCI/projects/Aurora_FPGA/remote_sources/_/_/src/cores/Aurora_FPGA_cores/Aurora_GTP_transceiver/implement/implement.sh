#!/bin/bash
################################################################################
##   ____  ____
##  /   /\/   /
## /___/  \  /    Vendor: Xilinx
## \   \   \/     Version : 1.9
##  \   \         Application : Spartan-6 FPGA GTP Transceiver Wizard
##  /   /         Filename : implement_sh.ejava 
## /___/   /\     Timestamp :
## \   \  /  \
##  \___\/\___\
##
##
## implement.sh script 
## Generated by Xilinx Spartan-6 FPGA GTP Transceiver Wizard
##


#-----------------------------------------------------------------------------
# Script to synthesize and implement the RTL provided for the wizard
#-----------------------------------------------------------------------------

##---------------------Change CWD to results-------------------------------------

#Clean results directory
#Create results directory
#Change current directory to results
echo "WARNING: Removing existing results directory"
rm -rf results
mkdir results
cp xst.prj      ./results
cp xst.scr      ./results
cp *.ngc        ./results

##-----------------------------Run Synthesis-------------------------------------

echo "### Running Xst - "
xst -ifn xst.scr

cp Aurora_GTP_transceiver_top.ngc ./results
cd ./results

##-------------------------------Run ngdbuild---------------------------------------

echo 'Running ngdbuild'
ngdbuild -uc ../../example_design/Aurora_GTP_transceiver_top.ucf -p xc6slx45t-fgg484-3 Aurora_GTP_transceiver_top.ngc Aurora_GTP_transceiver_top.ngd

#end run ngdbuild section

##-------------------------------Run map-------------------------------------------

echo 'Running map'
map -register_duplication on -global_opt speed -logic_opt on -retiming on -timing -ol high -p xc6slx45t-fgg484-3 -o mapped.ncd Aurora_GTP_transceiver_top.ngd

##-------------------------------Run par-------------------------------------------

echo 'Running par'
par -ol high mapped.ncd routed.ncd 

##---------------------------Report par results-------------------------------------

echo 'Running design through bitgen'
bitgen -w routed.ncd

##-------------------------------Trace Report---------------------------------------

echo 'Running trce'
trce -e 10 routed.ncd mapped.pcf -o routed

##-------------------------------Run netgen------------------------------------------

echo 'Running netgen to create gate level VHDL model'
netgen -ofmt vhdl -sim -dir . -tm Aurora_GTP_transceiver_top -w routed.ncd routed.vhd

#Change directory to implement

cd ..

