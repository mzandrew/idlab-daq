//-----------------------------------------------------------------------------
//
// This file contains confidential and proprietary information 
// of Xilinx, Inc. and is protected under U.S. and             
// international copyright and other intellectual property     
// laws.                                                       
//                                                             
// DISCLAIMER                                                  
// This disclaimer is not a license and does not grant any     
// rights to the materials distributed herewith. Except as     
// otherwise provided in a valid license issued to you by      
// Xilinx, and to the maximum extent permitted by applicable   
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND     
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES 
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING   
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-      
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and    
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of          
// liability) for any loss or damage of any kind or nature     
// related to, arising under or in connection with these       
// materials, including for any direct, or any indirect,       
// special, incidental, or consequential loss or damage        
// (including loss of data, profits, goodwill, or any type of  
// loss or damage suffered as a result of any action brought   
// by a third party) even if such damage or loss was           
// reasonably foreseeable or Xilinx had been advised of the    
// possibility of the same.                                    
//                                                             
// CRITICAL APPLICATIONS                                       
// Xilinx products are not designed or intended to be fail-    
// safe, or for use in any application requiring fail-safe     
// performance, such as life-support or safety devices or      
// systems, Class III medical devices, nuclear facilities,     
// applications related to the deployment of airbags, or any   
// other applications that could lead to death, personal       
// injury, or severe property or environmental damage          
// (individually and collectively, "Critical                   
// Applications"). Customer assumes the sole risk and          
// liability of any use of Xilinx products in Critical         
// Applications, subject only to applicable laws and           
// regulations governing limitations on product liability.     
//                                                                                
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS    
// PART OF THIS FILE AT ALL TIMES.                             
//-----------------------------------------------------------------------------
// Project    : LogiCORE IP Initiator/Target for PCI
// File       : busrec.v
/***********************************************************************

  File:   busrec.v
  Rev:    4.13

  This module saves the state of the bus signals into a file at
  every positive edge of the clock.  After simulation, the output
  file can be compared to a known good file to verify the sameness
  of two designs.


***********************************************************************/
`timescale 1ps/1ps

// Declare the module

module BUSREC   (
                AD,
                CBE,
                PAR,
                PAR64,
                FRAME_N,
                REQ64_N,
                TRDY_N,
                IRDY_N,
                STOP_N,
                DEVSEL_N,
                ACK64_N,
                PERR_N,
                SERR_N,
                INTA_N,
                PMEA_N,
                IDSEL,
                REQ_N,
                GNT_N,
                RST_N,
                CLK
                );


  // Declare the port directions

  input  [63:0] AD;
  input   [7:0] CBE;
  input         PAR;
  input         PAR64;
  input         FRAME_N;
  input         REQ64_N;
  input         TRDY_N;
  input         IRDY_N;
  input         STOP_N;
  input         DEVSEL_N;
  input         ACK64_N;
  input         PERR_N;
  input         SERR_N;
  input         INTA_N;
  input         PMEA_N;
  input         IDSEL;
  input         REQ_N;
  input         GNT_N;
  input         RST_N;
  input         CLK;


  //******************************************************************//
  // This section contains the file output statements.                //
  //******************************************************************//


  integer       file_ptr;

  initial
  begin
    $timeformat(-9, 0, " NS", 0);
    file_ptr = $fopen("waves.tbl");
  end

  always @(posedge CLK)
    $fdisplay(file_ptr,
              "%b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %t",
              AD, CBE, PAR, PAR64, FRAME_N, REQ64_N, TRDY_N, IRDY_N,
              STOP_N, DEVSEL_N, ACK64_N, PERR_N, SERR_N, INTA_N,
              PMEA_N, IDSEL, REQ_N, GNT_N, $realtime
    );


  //******************************************************************//
  //                                                                  //
  //******************************************************************//


endmodule
