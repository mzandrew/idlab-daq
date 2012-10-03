                Core name: Xilinx LogiCORE Aurora 8B10B
                Version: 6.2
                Release Date: March 01, 2011


================================================================================

This document contains the following sections:

1. Introduction
2. New Features
3. Supported Devices
4. Resolved Issues
5. Known Issues
6. Technical Support
7. Other Information
8. Core Release History
9. Legal Disclaimer

================================================================================


1. INTRODUCTION

For installation instructions for this release, please go to:

   http://www.xilinx.com/ipcenter/coregen/ip_update_install_instructions.htm

For system requirements:

   http://www.xilinx.com/ipcenter/coregen/ip_update_system_requirements.htm

This file contains release notes for the Xilinx LogiCORE IP Aurora 8B10B v6.2
solution. For the latest core updates, see the product page at:

   http://www.xilinx.com/aurora

2. NEW FEATURES

- ISE 13.1 software support
- ISIM simulator support
- PlanAhead support
- projNav flow support

3. SUPPORTED DEVICES

Virtex-6 XC CXT/LXT/SXT/HXT
Virtex-6 XQ LXT/SXT
Virtex-6 -1L XC LXT/SXT

Spartan-6 XC LXT
Spartan-6 XA
Spartan-6 XQ LXT

4. RESOLVED ISSUES

- Change the limit to acheive lower VCO frequency for Virtex-6 GTX designs
  CR number 584627

- All UFC signals enabled by default for RX simplex and TX simplex in IP symbol
  CR number 584592

- Aurora - S6 - GTP Implementation incorrect for channel bonding
  CR number 582596

- Aurora v5.2 and 6.1 - Clock correction disabled in the example design after all lanes are up
  CR number 581815

- Aurora 8b/10b v5.2 - simplex sideband signal extend process has redundancy
  CR number 577182

- Defeature  DIVCLK_DIVIDE = 3 or 4 for Virtex-6 MMCM when MMCM CLKIN_FREQ > 315Mhz
  CR number 575944

- Timing constraint does not meet for TS_GTXQ3_LEFT_I
  CR number 572684

- Extend the line rate support from 3.125 Gbps to 3.2 Gbps in Spartan-6 for -3 and -4 speedgrade
  CR number 572326

- Reverse the VIO port mapping in VHDL design
  CR number 568806

- Add ERR_COUNT constraints in UCF files
  CR number 532277

For a list of all known issues with the Aurora 8B10B core, please refer to
the AR listing of the core found at

http://www.xilinx.com/support/documentation/user_guides/xtp025.pdf


5. KNOWN ISSUES

GT wrapper compatibility module name:

  Change the copied wizard generated wrapper module name to all uppercase 
  before using it with Aurora core. This is applicable only for Verilog 
  based designs only. For more detailed information, refer UG766 Appendix C. 

The most recent information, including known issues, workarounds, and
resolutions for this version is provided in the IP Release Notes Guide
located at

   www.xilinx.com/support/documentation/user_guides/xtp025.pdf


6. TECHNICAL SUPPORT

To obtain technical support, create a WebCase at www.xilinx.com/support.
Questions are routed to a team with expertise using this product.

Xilinx provides technical support for use of this product when used
according to the guidelines described in the core documentation, and
cannot guarantee timing, functionality, or support of this product for
designs that do not follow specified guidelines.


7. OTHER INFORMATION

7.1 Quick start recommendations
---------------------------
After generating an Aurora module, you may want to do one of the
following:

(a) Build an Aurora module to try the flow and see it working in
    simulation

(b) Integrate the Aurora module with your own design

(c) Remember to set pin constraints in <component_name>_aurora_example.ucf
    file before using the aurora_example design

The User Guide explains the Aurora module in detail to help you connect it 
to your design and use it in your system.
  
7.2 Troubleshooting Guide
---------------------
This section presents some common problems you may encounter with
the Aurora 8B/10B design.

(a) Lanes and Channel do not come up in simulation

- The quickest way to debug these problems is to view the signals from
  one of the GT instances that are not working.

- Make sure that the GT reference clock and user clocks are all toggling.
  Note that only one of the reference clocks should be toggling, 
  the rest will be tied low.

- Check to see that TXOUTCLK from GT wrapper is toggling.
  If they are not toggling, you may have to wait longer for the PMA to
  finish locking. You should typically wait about 6-9 us for lane up 
  and channel up. Need to wait longer for simplex designs. 

- Make sure that TXN and TXP are toggling. If they are not, make sure
  you've waited long enough (see the previous bullet) and make sure 
  you are not driving the TX signal with another signal.

- Check the PLL_NOT_LOCKED signal and the RESET signals on your
  design. If these are being held active, your Aurora module 
  will not be able to initialize.

- Be sure you do not have the POWER_DOWN signal asserted

- Make sure the TXN and TXP signals from each GT are connected to the
  appropriate RXN and RXP signals from the corresponding GT on 
  the other side of the channel

- If you are simulating Verilog, you will need to instantiate the
  "glbl" module and use it to drive the power_up reset at the 
  beginning of the simulation to simulate the reset that occurs
  after configuration. You should hold this reset for a few cycles.
  The code below can be used an example:

  //Simulate the global reset that occurs after configuration at
  //the beginning
  //of the simulation.
  assign glbl.GSR = gsr_r;
  assign glbl.GTS = gts_r;

  initial
    begin
      gts_r = 1'b0;
      gsr_r = 1'b1;
      #(16*CLOCKPERIOD_1);
      gsr_r = 1'b0;
    end

- If you are using a multilane channel, make sure all the GT on
  each side of the channel are connected in the correct order

(b) Channel comes up in simulation but S_AXI_TX_TVALID is never asserted
    (never goes high)

- If your module includes flow control but you are not using it, make
  sure the request signals are not currently driven low. 
  S_AXI_NFC_REQ and S_AXI_UFC_TX_REQ are active high: if they are high,
  S_AXI_TX_TVALID will stay low because the channel will be allocated
  for flow control

- Make sure WARN_CC and DO_CC are not being driven high continuously. 
  Whenever DO_CC is high on a positive clock edge, the channel is used 
  to send clock correction characters, so S_AXI_TX_TVALID is deasserted

- If you have NFC enabled, make sure the design on the other side of
  the channel did not send an NFC XOFF message. This will cut off 
  the channel for normal data until the other side sends
  an NFC XON message to turn the flow on again. See UG766.pdf for more
  details


(c) Bytes and words are being lost as they travel through the Aurora
    channel

- If you are using the AXI4-Stream interface, make sure you are writing
  data correctly. The most common mistake is to assume words are written
  without looking at TVALID. Also remember that the TKEEP signal 
  must be used to indicate which bytes are valid when TLAST is asserted. 
  TKEEP will be ignored when TLAST is not asserted (active-high).

- Make sure you are reading correctly from the RX interface. Data and
  framing signals are only valid when TVALID is asserted.


(d) Problems while compiling the design

- Make sure you include all the files from the src directory when
  compiling

- If you are using VHDL, make sure to include the aurora_pkg.vhd file 
  in your synthesis
 
7.3 Links to useful resources
-------------------------
You may find the following resources useful:

Virtex-6 GTX Transceiver User Guide: UG366.pdf
http://www.xilinx.com/support/documentation/user_guides/ug366.pdf 

Spartan-6 GTP Transceiver User Guide: UG386.pdf
http://www.xilinx.com/support/documentation/user_guides/ug386.pdf 

Aurora 8B/10B Protocol Specification: SP002.pdf
http://www.xilinx.com/support/documentation/ip_documentation/aurora_8b10b_protocol_spec_sp002.pdf

Multi-Gigabit Signaling Resources:
http://www.xilinx.com/products/design_resources/highspeed_design

Xilinx on Board:
http://www.xilinx.com/products/devkits/boardsearch.htm
(Search for Development boards)

Xilinx Support:                    
http://www.support.xilinx.com


8. CORE RELEASE HISTORY

Date        By            Version      Description
================================================================================
03/01/2011  Xilinx, Inc.  6.2          ISE 13.1 support
                                       PlanAhead support
                                       ISIM Support
                                       projNav flow support   
09/21/2010  Xilinx, Inc.  6.1          AXI4-Stream support
                                       ISE 12.3 support
================================================================================


9. Legal Disclaimer

(c) Copyright 2010 - 2011 Xilinx, Inc. All rights reserved.

This file contains confidential and proprietary information
of Xilinx, Inc. and is protected under U.S. and
international copyright and other intellectual property
laws.

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

CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-
safe, or for use in any application requiring fail-safe
performance, such as life-support or safety devices or
systems, Class III medical devices, nuclear facilities,
applications related to the deployment of airbags, or any
other applications that could lead to death, personal
injury, or severe property or environmental damage
(individually and collectively, "Critical
Applications"). Customer assumes the sole risk and
liability of any use of Xilinx products in Critical
Applications, subject only to applicable laws and
regulations governing limitations on product liability.

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
PART OF THIS FILE AT ALL TIMES.
