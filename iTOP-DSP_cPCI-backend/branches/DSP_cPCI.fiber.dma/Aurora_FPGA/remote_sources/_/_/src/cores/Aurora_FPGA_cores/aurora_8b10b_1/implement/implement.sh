#!/bin/bash
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

if [ ! -d ${XILINX} ]
then
   echo " XILINX environment variable has not been set.  This variable"
   echo " points to your Xilinx ISE tools, and is required to run Aurora"
   echo " scripts.  Consult the user guide to find out how to edit and run"
   exit 
fi

#Set XST as default synthesizer
use_xst=1

##---------------------Change CWD to results-------------------------------------

#Clean results directory
#Create results directory       
#Change current directory to results
echo "WARNING: Removing existing results directory" 
rm -rf results
mkdir results
cp xst.prj      ./results
cp xst.scr      ./results
cp s6_icon.ngc  ./results
cp s6_vio.ngc   ./results
##-----------------------------Run Synthesis-------------------------------------

if [ $use_xst = 1 ]
then
echo "### Running Xst - "
xst -ifn xst.scr
fi

cp aurora_8b10b_1_example_design.ngc ./results

#  Copy the UCF file to results dir
echo 'Copying constraints file from example design directory to the results directory.'
cp ../example_design/aurora_8b10b_1_example_design.ucf ./results
cd ./results

##-------------------------------Run ngdbuild---------------------------------------

echo 'Running ngdbuild'
ngdbuild aurora_8b10b_1_example_design
    
##-------------------------------Run map-------------------------------------------

echo 'Running map'
map -detail aurora_8b10b_1_example_design -o mapped.ncd
    
##-------------------------------Run par-------------------------------------------

echo 'Running par'
par mapped.ncd routed.ncd mapped.pcf
    
##---------------------------Report par results-------------------------------------    

echo 'Running design through bitgen'
bitgen routed.ncd routed.bit mapped.pcf 

##-------------------------------Trace Report---------------------------------------

echo 'Running trce'
trce -e 10 routed -o routed mapped.pcf
   
##-------------------------------Run netgen------------------------------------------

echo 'Running netgen to create gate level VHDL model'
netgen -ofmt vhdl routed.ncd routed.vhd

#Change directory to implement
cd ..

echo "INFO:Implementation is complete for aurora_8b10b_1_example_design"
echo "INFO:Refer to results directory for implementation results" 
