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
// File       : test_tb.v
/***********************************************************************

  File:   test_tb.v
  Rev:    4.13

  This is the top level testbench.

***********************************************************************/
`timescale 1ps/1ps

module TEST_TB;


  // PCI Bus Signals

  wire   [63:0] AD;
  wire    [7:0] CBE;
  wire          PAR;
  wire          PAR64;
  tri1          FRAME_N;
  tri1          REQ64_N;
  tri1          TRDY_N;
  tri1          IRDY_N;
  tri1          STOP_N;
  tri1          DEVSEL_N;
  tri1          ACK64_N;
  wire          IDSEL;
  tri1          INTA_N;
  tri1          PMEA_N;
  tri1          PERR_N;
  tri1          SERR_N;
  tri1          REQ_N;
  tri1          GNT_N;
  wire          RST_N;
  wire          CLK;
  wire          FPGA_RTR;
  wire          FPGA_RST;

  // Instantiate master stimulus device

  STIMULUS STM  (
                .AD( AD ),
                .CBE( CBE ),
                .PAR( PAR ),
                .PAR64( PAR64 ),
                .FRAME_N( FRAME_N ),
                .REQ64_N( REQ64_N ),
                .TRDY_N( TRDY_N ),
                .IRDY_N( IRDY_N ),
                .STOP_N( STOP_N ),
                .DEVSEL_N( DEVSEL_N ),
                .ACK64_N( ACK64_N ),
                .IDSEL( IDSEL ),
                .INTA_N( INTA_N ),
                .PMEA_N( PMEA_N ),
                .PERR_N( PERR_N ),
                .SERR_N( SERR_N ),
                .REQ_N( REQ_N ),
                .GNT_N( GNT_N ),
                .RST_N( RST_N ),
                .CLK( CLK ),
                .FPGA_RTR( FPGA_RTR ),
                .FPGA_RST( FPGA_RST )
                );


  // Instantiate FPGA PCI design

  pci32_sp_v4_13_top UUT  (
                .AD( AD[31:0] ),
                .CBE( CBE[3:0] ),
                .PAR( PAR ),
                .FRAME_N( FRAME_N ),
                .TRDY_N( TRDY_N ),
                .IRDY_N( IRDY_N ),
                .STOP_N( STOP_N ),
                .DEVSEL_N( DEVSEL_N ),
                .IDSEL( IDSEL ),
                .INTA_N( INTA_N ),
                .PMEA_N( PMEA_N ),
                .PERR_N( PERR_N ),
                .SERR_N( SERR_N ),
                .REQ_N( REQ_N ),
                .GNT_N( GNT_N ),
                .RST_N( RST_N ),
                .PCLK( CLK ),
                .FPGA_RTR( FPGA_RTR ),
                .FPGA_RST( FPGA_RST )
                );

  // Instantiate a 32-bit Target
  dumb_target32 TRG32 (
                .AD( AD[31:0] ),
                .CBE( CBE[3:0] ),
                .PAR( PAR ),
                .FRAME_N( FRAME_N ),
                .TRDY_N( TRDY_N ),
                .IRDY_N( IRDY_N ),
                .STOP_N( STOP_N ),
                .DEVSEL_N( DEVSEL_N ),
                .RST_N( RST_N ),
                .CLK( CLK )
                );
   
 // Instantiate a 64-bit Target
 dumb_target64 TRG64 (
                .AD( AD ),
                .CBE( CBE ),
                .PAR( PAR ),
                .PAR64( PAR64 ),
                .FRAME_N( FRAME_N ),
                .REQ64_N( REQ64_N ),
                .TRDY_N( TRDY_N ),
                .IRDY_N( IRDY_N ),
                .STOP_N( STOP_N ),
                .DEVSEL_N( DEVSEL_N ),
                .ACK64_N( ACK64_N ),
                .RST_N( RST_N ),
                .CLK( CLK )
                );
                             
  // Instantiate bus recorder

  BUSREC REC    (
                .AD( AD ),
                .CBE( CBE ),
                .PAR( PAR ),
                .PAR64( PAR64 ),
                .FRAME_N( FRAME_N ),
                .REQ64_N( REQ64_N ),
                .TRDY_N( TRDY_N ),
                .IRDY_N( IRDY_N ),
                .STOP_N( STOP_N ),
                .DEVSEL_N( DEVSEL_N ),
                .ACK64_N( ACK64_N ),
                .IDSEL( IDSEL ),
                .INTA_N( INTA_N ),
                .PMEA_N( PMEA_N ),
                .PERR_N( PERR_N ),
                .SERR_N( SERR_N ),
                .REQ_N( REQ_N ),
                .GNT_N( GNT_N ),
                .RST_N( RST_N ),
                .CLK( CLK )
                );


  // Extension pull-ups

  pullup (PAR64);

  pullup (CBE[7]);
  pullup (CBE[6]);
  pullup (CBE[5]);
  pullup (CBE[4]);

  pullup (AD[63]);
  pullup (AD[62]);
  pullup (AD[61]);
  pullup (AD[60]);
  pullup (AD[59]);
  pullup (AD[58]);
  pullup (AD[57]);
  pullup (AD[56]);
  pullup (AD[55]);
  pullup (AD[54]);
  pullup (AD[53]);
  pullup (AD[52]);
  pullup (AD[51]);
  pullup (AD[50]);
  pullup (AD[49]);
  pullup (AD[48]);
  pullup (AD[47]);
  pullup (AD[46]);
  pullup (AD[45]);
  pullup (AD[44]);
  pullup (AD[43]);
  pullup (AD[42]);
  pullup (AD[41]);
  pullup (AD[40]);
  pullup (AD[39]);
  pullup (AD[38]);
  pullup (AD[37]);
  pullup (AD[36]);
  pullup (AD[35]);
  pullup (AD[34]);
  pullup (AD[33]);
  pullup (AD[32]);


endmodule
