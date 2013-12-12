#!/bin/csh -f

##=============================================================================
##
## File Name:  config.csh         
##   Version:  1.0
##      Date:  05/13/2003
##   Company:  Xilinx, Inc.
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
##=============================================================================

#################################################################################
## This is a shell script to setup environment on Solaris for the Aurora 804 core
##
## Following these steps to setup the environment:
## (1) Install software tools (Xilinx ISE, EDK, ModelSim, SmartModel, etc.)
## (2) Modify all the lines containing "<...>" in this script
## (3) Run this script.
##
## A summary of environment variables follows.
## 
## Variable that need to be modified by user:
## setenv DUT_PATH         <Path_to_Aurora_Reference_Design>
## setenv XILINX           <Path_to_Xilinx_ISE_software>
## setenv LMC_HOME         <Path_to_SmartModels_installation>
## setenv MODEL_TECH       <Path_to_ModelSim_installation>
## setenv MTI_LIBS         <Path_to_ModelSim_Sim_Library>
##
## Variables derived from above items:
## setenv LMC_FOUNDRY_HOME $LMC_HOME
## setenv LMC_PATH         $LMC_HOME/foundry
## setenv LMC_CONFIG       $LMC_HOME/data/solaris.lmc
## setenv MODEL_TECH_LIBSM $MODEL_TECH/sunos5/libsm.sl
## setenv MODELSIM         $DUT_PATH/simulation/modelsim_unix.ini
## setenv LD_LIBRARY_PATH  $XILINX/bin/sol:$XILINX_EDK/bin/sol:$LMC_HOME/lib/sun4Solaris.lib:${LD_LIBRARY_PATH}
## setenv PATH             $XILINX/bin/sol:$MODEL_TECH/sunos5:$LMC_HOME/bin:$XILINX_EDK/bin/sol:$XILINX_EDK/gnu/microblaze/sol/bin:$XILINX_EDK/gnu/powerpc-eabi/sol/bin:${PATH}
##
## Optional variables:
## setenv LM_LICENSE_FILE  ${LM_LICENSE_FILE}:<Port@LicenseServer>
#################################################################################

set xilinx_ver =    "G.28"
set mti_ver =           "5.7a"


#################################################################################
## Step 1: Set a variable to point to the root of your Aurora design tree
##
## For example:
## setenv DUT_PATH /home/user/work/Aurora/801_v_2_0
#################################################################################

setenv DUT_PATH /home/nigelg/Projects/Aurora/Aurora/804_v_2_0

#################################################################################
## Step 2: Setup Xilinx ISE Tool Environment
##
## For example:
## setenv XILINX    /tool/xilinx
## setenv LD_LIBRARY_PATH $XILINX/bin/sol:${LD_LIBRARY_PATH}
## setenv PATH $XILINX/bin/sol:${PATH}
#################################################################################

if $?XILINX then
    echo  "Xilinx ISE software environment ready."
else
    echo  "Setup Xilinx ISE software environment ..."
    
#   setenv XILINX    <Path_to_Xilinx_ISE_software>

    setenv XILINX    /build/sjxfndry/${xilinx_ver}/rtf
    setenv XILENV    /build/sjxfndry/${xilinx_ver}/env
    setenv MYXILINX /proj/holistic/xfndry/rtf_${xilinx_ver}

    
    setenv PATH $XILINX/bin/sol:${PATH}

    if ($?LD_LIBRARY_PATH) then
        setenv LD_LIBRARY_PATH $XILINX/bin/sol:${LD_LIBRARY_PATH}
    else
        setenv LD_LIBRARY_PATH $XILINX/bin/sol
    endif

endif

#################################################################################
## Step 3: Synthesis Tool Environment Setup
##
## setenv SYNPLICITY <Path point to Synplicity installation>
#################################################################################

if $?SYNPLICITY then
  echo  "Synthesis tool environment ready."
else
  echo  "Setup Synthesis tool environment ..."
  setenv SYNPLICITY /tools/synplicity/synplify_721
  setenv PATH ${PATH}:${SYNPLICITY}/bin
endif


#################################################################################
## Step 4: Setup SmartModels Environment 
##
## Note: SmartModels are included in the Xilinx ISE software under
## $XILINX/smartmodel.
##
## For example:
## setenv LMC_HOME $XILINX/smartmodel/sol/installed_sol
## setenv LMC_FOUNDRY_HOME $LMC_HOME
## setenv LMC_PATH $LMC_HOME/foundry
## setenv LMC_CONFIG $LMC_HOME/data/solaris.lmc
## setenv LD_LIBRARY_PATH $LMC_HOME/lib/sun4Solaris.lib:${LD_LIBRARY_PATH}
## setenv PATH $LMC_HOME/bin:${PATH}
#################################################################################

if $?LMC_HOME then
    echo  "SmartModels environment ready."
else
    echo  "Setup SmartModels environment ..."

#   setenv LMC_HOME <Path_to_SmartModels_installation>
        setenv LMC_HOME /proj/aurora/Xilinx/installed_sol_G.28  
    setenv LMC_FOUNDRY_HOME $LMC_HOME
    setenv LMC_PATH $LMC_HOME/foundry
    setenv LMC_CONFIG $LMC_HOME/data/solaris.lmc
        setenv LD_LIBRARY_PATH $LMC_HOME/lib/sun4Solaris.lib:${LD_LIBRARY_PATH}
    setenv PATH $LMC_HOME/bin:${PATH}
endif

#################################################################################
## Step 5: Setup ModelSim Environment
##
## For example:
## setenv MODEL_TECH /tool/mentor/modeltech5.6e/
## setenv MODEL_TECH_LIBSM $MODEL_TECH/sunos5/libsm.sl
## setenv PATH $MODEL_TECH/sunos5:${PATH}
## setenv MODELSIM $DUT_PATH/simulation/modelsim_solaris.ini
##
## Note:       Environment variable MODELSIM points to the ModelSim
##             initialization file provided in the BERT Reference Design at 
##             $DUT_PATH/simulation/modelsim_solaris.ini
##             This file contains proper setup for SmartModels simulation
##             Refer to Xilinx Answer Record #15501 and #14019 for further
##             information regarding SmartModel/Swift Interface and
##             installation of SmartModels. 
##
#################################################################################
if $?MODEL_TECH then
    echo  "ModelSim environment ready."
else
    echo  "Setup ModelSim environment ..."

#   setenv MODEL_TECH <Path_to_ModelSim_installation>
    setenv MODEL_TECH /tools/mentor/modeltech${mti_ver}
    setenv MODEL_TECH_LIBSM $MODEL_TECH/sunos5/libsm.sl
    setenv PATH $MODEL_TECH/sunos5:${PATH}
endif

setenv MODELSIM ${DUT_PATH}/test/func_sim/modelsim_unix.ini

#################################################################################
## Step 6: Setup User's Local Simulation Library Environment 
##
## MTI_LIBS    points to the directory that is used to store
##             Verilog/VHDL based ModelSim libraries for 
##             Virtex/Virtex-II Pro families, including unisim,
##             simprim and SmartModel libraries.
##
## For example:
## setenv MTI_LIBS /home/user/work/mti_libs
## 
#################################################################################
echo  "Setup local simulation library environment..."

#setenv MTI_LIBS <Path_to_ModelSim_Sim_Library>
setenv MTI_LIBS /proj/aurora/Xilinx/mti_libs_G.28



#################################################################################
## Step 7: LocalLink BFM Environment Setup
##
#################################################################################
if $?LL_BFM then
    echo  "LocalLink BFM environment ready."
else
   
   echo  "Setup LocalLink BFM environment..."
   setenv LL_BFM  /home/nigelg/BFM/LL_BFM
   setenv PATH  ${PATH}:${LL_BFM}/src
endif


#################################################################################
## Step 8: If necessary, setup licenses for EDA tools. 
##
## For example:
##
## if $?LM_LICENSE_FILE then
##    setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:<Port@LicenseServer>
## else
##    setenv LM_LICENSE_FILE <Port@LicenseServer>
## endif
##
#################################################################################
echo  "Setup EDA tools licenses ..."

#synplify
setenv LM_LICENSE_FILE 1709@xmask

#modelsim
setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:1717@xmask

#foundation
setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:/devl/flex/license.dat

#xhdl
setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:7300@xmask

echo  "DONE."
echo  ""

