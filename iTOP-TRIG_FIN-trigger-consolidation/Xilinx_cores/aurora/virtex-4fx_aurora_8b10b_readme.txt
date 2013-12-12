
				Core name    : Xilinx Aurora 8B10B for Virtex-4 FX FPGA
				Version      : 3.1
				Release Date : April 24, 2009

================================================================================

This document contains the following sections: 

1. Introduction
2. New Features
3. Resolved Issues
4. Known Issues 
5. Technical Support
6. Other Information 
7. Core Release History
8. Legal Disclaimer
 
================================================================================

1. INTRODUCTION

For the most recent updates to the IP installation instructions for this core,
please go to:

   http://www.xilinx.com/ipcenter/coregen/ip_update_install_instructions.htm

 
For system requirements:

   http://www.xilinx.com/ipcenter/coregen/ip_update_system_requirements.htm 


This file contains release notes for the Xilinx LogiCORE Aurora 8B10B for Virtex-4 FX FPGA v3.1 solution. For the latest core updates, see the product page at:

   http://www.xilinx.com/aurora  
 

2. NEW FEATURE 
 
   - ISE 11.1 software support 


3. RESOLVED ISSUES 

     For a list of all known issues with the Aurora cores, please refer to AR listing of the core,be found at 
     http://www.xilinx.com/support/documentation/user_guides/xtp025.pdf
     
     -  Increase of simulation time 
          - Version fixed :v3.1
          - CR number 479527. The simulation time is increased.

     -  Timing violation at 6.25 Gbps for 2byte configuration
          - Version fixed :v3.1
          - CR number 479528. The maximum line rate for 2byte interface is restricted to 5 Gbps since the maximum fabric frequency supported in Virtex-4 FX devices is 250 MHz.
  
    
4. KNOWN ISSUES
    
     The following are known issues for v3.1 of this core at time of release:

     -  Design does not work at certain line rates. RXNOTINTABLE and RXRUNDISPERR observed at these line rates. 
          - This is a problem in GT11 swift model and simulator resolution.
          - Please refer to AR 22845.  
          - The work around for the problem is to select the reference clock frequency which results in integer VCO time period value in pico seconds.
      
     -  Timing failure is observed at line rate above 4 Gbps when transceivers are selected across columns
           - The issue is due to cross column selection of transceivers. It is recommended to select transceivers in a single column.
 
     -  Simplex timer option is tested only for line rate of 3.125 Gbps 
           - The Simplex timer value is set only for line rate of 3.125 Gbps. To use simplex timer for other line rates the customer should modify timer value accordingly.
 

5. TECHNICAL SUPPORT

   To obtain technical support, create a WebCase at www.xilinx.com/support.
   Questions are routed to a team with expertise using this product.  
     
   Xilinx provides technical support for use of this product when used
   according to the guidelines described in the core documentation, and
   cannot guarantee timing, functionality, or support of this product for
   designs that do not follow specified guidelines.


6. Other Information 
  
   - Virtex-II Pro support has been removed from v3.1 of this core
   - ISim simulator support has been removed from v3.1 of this core


7. CORE RELEASE HISTORY

Date            By            Version      Description
========================================================================================
04/24/2009    Xilinx, Inc       3.1        LogiCORE Aurora 8B10B for Virtex-4 FX FPGA v3.1 release.
09/19/2008    Xilinx, Inc       3.0        LogiCORE Aurora v3.0 release. Added Simplex With timer option in GUI
03/24/2008    Xilinx, Inc       2.9        ISIM support support
10/10/2007    Xilinx, Inc       2.8        LogiCORE Aurora v2.8 release. Added "Using ChipScope Pro Cores with the 
					   Aurora Core and Using the Timer-Based Simplex Mode"
08/22/2007    Xilinx, Inc       2.7.1      LogiCORE Aurora v2.7.1 release.
05/17/2007    Xilinx, Inc       2.7        LogiCORE Aurora v2.7 release. Updated "Generating the Core". 
					   Added "Using ChipScope Pro Cores with the Aurora Core".
03/01/2007    Xilinx, Inc       2.6        LogiCORE Aurora v2.6 release.
11/30/2006    Xilinx, Inc       2.5.1      LogiCORE Aurora v2.5.1 release. Updated Chapter 2,Installing and Licensing the Core.
09/12/2006    Xilinx, Inc       2.5        LogiCORE Aurora v2.5 release.
01/10/2006    Xilinx, Inc       2.4        LogiCORE Aurora v2.4 release.
04/28/2005    Xilinx, Inc       1.1        Initial Xilinx release.

=========================================================================================


8. Legal Disclaimer

(c) Copyright 2004 - 2009 Xilinx, Inc. All rights reserved. 

This file contains confidential and proprietary information
of Xilinx, Inc. and is protected under U.S. and
international copyright and other intellectual property
laws.
--
DISCLAIMER
This disclaimer is not a license and does not grant any
rights to the materials distributed herewith. Except as
otherwise provided in a valid license issued to you by
Xilinx, and to the maximum extent permitted by applicable
law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
(2) Xilinx shall not be liable (whether in contract or tort,
including negligence, or under any other theory of
liability) for any loss or damage of any kind or nature
related to, arising under or in connection with these
materials, including for any direct, or any indirect,
special, incidental, or consequential loss or damage
(including loss of data, profits, goodwill, or any type of
loss or damage suffered as a result of any action brought
by a third party) even if such damage or loss was
reasonably foreseeable or Xilinx had been advised of the
possibility of the same.
--
CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-
safe, or for use in any application requiring fail-safe
performance, such as life-support or safety devices or
systems, Class III medical devices, nuclear facilities,
applications related to the deployment of airbags, or any
other applications that could lead to death, personal
injury, or severe property or environmental damage
individually and collectively, "Critical
Applications"). Customer assumes the sole risk and
liability of any use of Xilinx products in Critical
Applications, subject only to applicable laws and
regulations governing limitations on product liability.
--
THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
PART OF THIS FILE AT ALL TIMES.


