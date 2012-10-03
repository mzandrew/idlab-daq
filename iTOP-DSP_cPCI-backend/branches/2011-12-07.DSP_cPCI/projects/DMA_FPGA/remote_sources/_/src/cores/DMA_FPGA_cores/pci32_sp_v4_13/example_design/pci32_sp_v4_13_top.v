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
// File       : pci32_sp_v4_13_top.v
/***********************************************************************

  File:   pci32_sp_v4_13_top.v
  Rev:    4.13

  This is the top-level template file for Verilog designs.
  The user should place his backend application design in the
  userapp module.

***********************************************************************/
`timescale 1ps/1ps

// Declare the module

module pci32_sp_v4_13_top (
                AD,
                CBE,
                PAR,
                FRAME_N,
                TRDY_N,
                IRDY_N,
                STOP_N,
                DEVSEL_N,
                IDSEL,
                PERR_N,
                SERR_N,
                INTA_N,
                PMEA_N,
                REQ_N,
                GNT_N,
                RST_N,
                PCLK,
                FPGA_RTR,
                FPGA_RST
                );


  // Declare the port directions

  inout  [31:0] AD;
  inout   [3:0] CBE;
  inout         PAR;
  inout         FRAME_N;
  inout         TRDY_N;
  inout         IRDY_N;
  inout         STOP_N;
  inout         DEVSEL_N;
  input         IDSEL;
  inout         PERR_N;
  inout         SERR_N;
  output        INTA_N;
  output        PMEA_N;
  output        REQ_N;
  input         GNT_N;
  input         RST_N;
  input         PCLK;
  output        FPGA_RTR;
  output        FPGA_RST;


  // Internal wiring to connect instances

  wire          FRAMEQ_N;
  wire          TRDYQ_N;
  wire          IRDYQ_N;
  wire          STOPQ_N;
  wire          DEVSELQ_N;
  wire   [31:0] ADDR;
  wire   [31:0] ADIO_IN;
  wire   [31:0] ADIO_OUT;
  wire          CFG_VLD;
  wire          CFG_HIT;
  wire          C_TERM;
  wire          C_READY;
  wire          ADDR_VLD;
  wire    [7:0] BASE_HIT;
  wire          S_TERM;
  wire          S_READY;
  wire          S_ABORT;
  wire          S_WRDN;
  wire          S_SRC_EN;
  wire          S_DATA_VLD;
  wire    [3:0] S_CBE;
  wire   [15:0] PCI_CMD;
  wire          REQUEST;
  wire          REQUESTHOLD;
  wire          COMPLETE;
  wire          M_WRDN;
  wire          M_READY;
  wire          M_SRC_EN;
  wire          M_DATA_VLD;
  wire    [3:0] M_CBE;
  wire          TIME_OUT;
  wire          CFG_SELF;
  wire          M_DATA;
  wire          DR_BUS;
  wire          I_IDLE;
  wire          M_ADDR_N;
  wire          IDLE;
  wire          B_BUSY;
  wire          S_DATA;
  wire          BACKOFF;
  wire          INT_N;
  wire          PME_N;
  wire          PERRQ_N;
  wire          SERRQ_N;
  wire          KEEPOUT;
  wire   [39:0] CSR;
  wire          PCIW_EN;
  wire          BW_DETECT_DIS;
  wire          BW_MANUAL_32B;
  wire          PCIX_EN;
  wire          RTR;
  wire  [511:0] CFG_BUS;
  wire          RST;
  wire          CLK;


  // Instantiation of the differential input
  // buffer for the reference clock signal

  // Instantiation of the PCI interface

  PCI_LC XPCI_WRAP (
                .AD_IO(AD),
                .CBE_IO(CBE),
                .PAR_IO(PAR),
                .FRAME_IO(FRAME_N),
                .TRDY_IO(TRDY_N),
                .IRDY_IO(IRDY_N),
                .STOP_IO(STOP_N),
                .DEVSEL_IO(DEVSEL_N),
                .IDSEL_I(IDSEL),
                .PERR_IO(PERR_N),
                .SERR_IO(SERR_N),
                .INT_O(INTA_N),
                .PME_O(PMEA_N),
                .REQ_O(REQ_N),
                .GNT_I(GNT_N),
                .RST_I(RST_N),
                .CLK_I(PCLK),

                .FRAMEQ_N(FRAMEQ_N),
                .TRDYQ_N(TRDYQ_N),
                .IRDYQ_N(IRDYQ_N),
                .STOPQ_N(STOPQ_N),
                .DEVSELQ_N(DEVSELQ_N),
                .ADDR(ADDR),
                .ADIO_IN(ADIO_IN),
                .ADIO_OUT(ADIO_OUT),
                .CFG_VLD(CFG_VLD),
                .CFG_HIT(CFG_HIT),
                .C_TERM(C_TERM),
                .C_READY(C_READY),
                .ADDR_VLD(ADDR_VLD),
                .BASE_HIT(BASE_HIT),
                .S_TERM(S_TERM),
                .S_READY(S_READY),
                .S_ABORT(S_ABORT),
                .S_WRDN(S_WRDN),
                .S_SRC_EN(S_SRC_EN),
                .S_DATA_VLD(S_DATA_VLD),
                .S_CBE(S_CBE),
                .PCI_CMD(PCI_CMD),
                .REQUEST(REQUEST),
                .REQUESTHOLD(REQUESTHOLD),
                .COMPLETE(COMPLETE),
                .M_WRDN(M_WRDN),
                .M_READY(M_READY),
                .M_SRC_EN(M_SRC_EN),
                .M_DATA_VLD(M_DATA_VLD),
                .M_CBE(M_CBE),
                .TIME_OUT(TIME_OUT),
                .CFG_SELF(CFG_SELF),
                .M_DATA(M_DATA),
                .DR_BUS(DR_BUS),
                .I_IDLE(I_IDLE),
                .M_ADDR_N(M_ADDR_N),
                .IDLE(IDLE),
                .B_BUSY(B_BUSY),
                .S_DATA(S_DATA),
                .BACKOFF(BACKOFF),
                .INT_N(INT_N),
                .PME_N(PME_N),
                .PERRQ_N(PERRQ_N),
                .SERRQ_N(SERRQ_N),
                .KEEPOUT(KEEPOUT),
                .CSR(CSR),
                .PCIW_EN(PCIW_EN),
                .BW_DETECT_DIS(BW_DETECT_DIS),
                .BW_MANUAL_32B(BW_MANUAL_32B),
                .PCIX_EN(PCIX_EN),
                .RTR(RTR),
                .CFG(CFG_BUS),
                .RST(RST),
                .CLK(CLK)
  );


  // Instantiation of the user application

  USERAPP XPCI_USER (
                .FRAMEQ_N(FRAMEQ_N),
                .TRDYQ_N(TRDYQ_N),
                .IRDYQ_N(IRDYQ_N),
                .STOPQ_N(STOPQ_N),
                .DEVSELQ_N(DEVSELQ_N),
                .ADDR(ADDR),
                .ADIO_IN(ADIO_IN),
                .ADIO_OUT(ADIO_OUT),
                .CFG_VLD(CFG_VLD),
                .CFG_HIT(CFG_HIT),
                .C_TERM(C_TERM),
                .C_READY(C_READY),
                .ADDR_VLD(ADDR_VLD),
                .BASE_HIT(BASE_HIT),
                .S_TERM(S_TERM),
                .S_READY(S_READY),
                .S_ABORT(S_ABORT),
                .S_WRDN(S_WRDN),
                .S_SRC_EN(S_SRC_EN),
                .S_DATA_VLD(S_DATA_VLD),
                .S_CBE(S_CBE),
                .PCI_CMD(PCI_CMD),
                .REQUEST(REQUEST),
                .REQUESTHOLD(REQUESTHOLD),
                .COMPLETE(COMPLETE),
                .M_WRDN(M_WRDN),
                .M_READY(M_READY),
                .M_SRC_EN(M_SRC_EN),
                .M_DATA_VLD(M_DATA_VLD),
                .M_CBE(M_CBE),
                .TIME_OUT(TIME_OUT),
                .CFG_SELF(CFG_SELF),
                .M_DATA(M_DATA),
                .DR_BUS(DR_BUS),
                .I_IDLE(I_IDLE),
                .M_ADDR_N(M_ADDR_N),
                .IDLE(IDLE),
                .B_BUSY(B_BUSY),
                .S_DATA(S_DATA),
                .BACKOFF(BACKOFF),
                .INT_N(INT_N),
                .PME_N(PME_N),
                .PERRQ_N(PERRQ_N),
                .SERRQ_N(SERRQ_N),
                .KEEPOUT(KEEPOUT),
                .CSR(CSR),
                .PCIW_EN(PCIW_EN),
                .BW_DETECT_DIS(BW_DETECT_DIS),
                .BW_MANUAL_32B(BW_MANUAL_32B),
                .PCIX_EN(PCIX_EN),
                .RTR(RTR),
                .CFG(CFG_BUS),
                .RST(RST),
                .CLK(CLK),
                .FPGA_RTR(FPGA_RTR),
                .FPGA_RST(FPGA_RST)
  );

endmodule
