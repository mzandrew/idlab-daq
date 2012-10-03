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
// File       : pci_lc.v
/***********************************************************************
  File:   pci_lc.v
  Rev:    4.13

  This is a lower-level Verilog module which serves as a wrapper for the
  PCI interface.  This module makes use of Unified Library Primitives.
  Do not modify this file.
***********************************************************************/
`timescale 1ps/1ps

// Declare the module

module PCI_LC  (
                AD_IO,
                CBE_IO,
                PAR_IO,
                FRAME_IO,
                TRDY_IO,
                IRDY_IO,
                STOP_IO,
                DEVSEL_IO,
                IDSEL_I,
                PERR_IO,
                SERR_IO,
                INT_O,
                PME_O,
                REQ_O,
                GNT_I,
                RST_I,
                CLK_I,

                FRAMEQ_N,
                TRDYQ_N,
                IRDYQ_N,
                STOPQ_N,
                DEVSELQ_N,
                ADDR,
                ADIO_IN,
                ADIO_OUT,
                CFG_VLD,
                CFG_HIT,
                C_TERM,
                C_READY,
                ADDR_VLD,
                BASE_HIT,
                S_TERM,
                S_READY,
                S_ABORT,
                S_WRDN,
                S_SRC_EN,
                S_DATA_VLD,
                S_CBE,
                PCI_CMD,
                REQUEST,
                REQUESTHOLD,
                COMPLETE,
                M_WRDN,
                M_READY,
                M_SRC_EN,
                M_DATA_VLD,
                M_CBE,
                TIME_OUT,
                CFG_SELF,
                M_DATA,
                DR_BUS,
                I_IDLE,
                M_ADDR_N,
                IDLE,
                B_BUSY,
                S_DATA,
                BACKOFF,
                INT_N,
                PME_N,
                PERRQ_N,
                SERRQ_N,
                KEEPOUT,
                CSR,
                PCIW_EN,
                BW_DETECT_DIS,
                BW_MANUAL_32B,
                PCIX_EN,
                RTR,
                CFG,
                RST,
                CLK
                );


  // Declare the port directions

  inout  [31:0] AD_IO;
  inout   [3:0] CBE_IO;
  inout         PAR_IO;
  inout         FRAME_IO;
  inout         TRDY_IO;
  inout         IRDY_IO;
  inout         STOP_IO;
  inout         DEVSEL_IO;
  input         IDSEL_I;
  inout         PERR_IO;
  inout         SERR_IO;
  output        INT_O;
  output        PME_O;
  output        REQ_O;
  input         GNT_I;
  input         RST_I;
  input         CLK_I;

  output        FRAMEQ_N;
  output        TRDYQ_N;
  output        IRDYQ_N;
  output        STOPQ_N;
  output        DEVSELQ_N;
  output [31:0] ADDR;
  input  [31:0] ADIO_IN;
  output [31:0] ADIO_OUT;
  output        CFG_VLD;
  output        CFG_HIT;
  input         C_TERM;
  input         C_READY;
  output        ADDR_VLD;
  output  [7:0] BASE_HIT;
  input         S_TERM;
  input         S_READY;
  input         S_ABORT;
  output        S_WRDN;
  output        S_SRC_EN;
  output        S_DATA_VLD;
  output  [3:0] S_CBE;
  output [15:0] PCI_CMD;
  input         REQUEST;
  input         REQUESTHOLD;
  input         COMPLETE;
  input         M_WRDN;
  input         M_READY;
  output        M_SRC_EN;
  output        M_DATA_VLD;
  input   [3:0] M_CBE;
  output        TIME_OUT;
  input         CFG_SELF;
  output        M_DATA;
  output        DR_BUS;
  output        I_IDLE;
  output        M_ADDR_N;
  output        IDLE;
  output        B_BUSY;
  output        S_DATA;
  output        BACKOFF;
  input         INT_N;
  input         PME_N;
  output        PERRQ_N;
  output        SERRQ_N;
  input         KEEPOUT;
  output [39:0] CSR;
  output        PCIW_EN;
  input         BW_DETECT_DIS;
  input         BW_MANUAL_32B;
  output        PCIX_EN;
  output        RTR;
  output[511:0] CFG;
  inout         RST;
  inout         CLK;


  // I/O instances for clock, reset, power, and ground

  wire          RST_INV;
  wire          CLK_NUB;
  wire          NC_OPEN;


  IBUFG      XPCI_CLK1 (.O(CLK_NUB),.I(CLK_I));
  BUFG       XPCI_CLK2 (.O(CLK),.I(CLK_NUB));

  IBUF       XPCI_RST1 (.O(RST_INV),.I(RST_I));
  INV        XPCI_RST2 (.O(RST),.I(RST_INV));

  assign NC_OPEN = 1'b0;

  // I/O instances for address and data

  wire   [31:0] ADO;
  wire   [31:0] ADI;
  wire   [31:0] ADD;
  wire   [31:0] ADT;

  IOBUF      XPCI_AD31 (.O(ADI[31]),.IO(AD_IO[31]),.I(ADO[31]),.T(ADT[31]));
  IOBUF      XPCI_AD30 (.O(ADI[30]),.IO(AD_IO[30]),.I(ADO[30]),.T(ADT[30]));
  IOBUF      XPCI_AD29 (.O(ADI[29]),.IO(AD_IO[29]),.I(ADO[29]),.T(ADT[29]));
  IOBUF      XPCI_AD28 (.O(ADI[28]),.IO(AD_IO[28]),.I(ADO[28]),.T(ADT[28]));
  IOBUF      XPCI_AD27 (.O(ADI[27]),.IO(AD_IO[27]),.I(ADO[27]),.T(ADT[27]));
  IOBUF      XPCI_AD26 (.O(ADI[26]),.IO(AD_IO[26]),.I(ADO[26]),.T(ADT[26]));
  IOBUF      XPCI_AD25 (.O(ADI[25]),.IO(AD_IO[25]),.I(ADO[25]),.T(ADT[25]));
  IOBUF      XPCI_AD24 (.O(ADI[24]),.IO(AD_IO[24]),.I(ADO[24]),.T(ADT[24]));

  IOBUF      XPCI_AD23 (.O(ADI[23]),.IO(AD_IO[23]),.I(ADO[23]),.T(ADT[23]));
  IOBUF      XPCI_AD22 (.O(ADI[22]),.IO(AD_IO[22]),.I(ADO[22]),.T(ADT[22]));
  IOBUF      XPCI_AD21 (.O(ADI[21]),.IO(AD_IO[21]),.I(ADO[21]),.T(ADT[21]));
  IOBUF      XPCI_AD20 (.O(ADI[20]),.IO(AD_IO[20]),.I(ADO[20]),.T(ADT[20]));
  IOBUF      XPCI_AD19 (.O(ADI[19]),.IO(AD_IO[19]),.I(ADO[19]),.T(ADT[19]));
  IOBUF      XPCI_AD18 (.O(ADI[18]),.IO(AD_IO[18]),.I(ADO[18]),.T(ADT[18]));
  IOBUF      XPCI_AD17 (.O(ADI[17]),.IO(AD_IO[17]),.I(ADO[17]),.T(ADT[17]));
  IOBUF      XPCI_AD16 (.O(ADI[16]),.IO(AD_IO[16]),.I(ADO[16]),.T(ADT[16]));

  IOBUF      XPCI_AD15 (.O(ADI[15]),.IO(AD_IO[15]),.I(ADO[15]),.T(ADT[15]));
  IOBUF      XPCI_AD14 (.O(ADI[14]),.IO(AD_IO[14]),.I(ADO[14]),.T(ADT[14]));
  IOBUF      XPCI_AD13 (.O(ADI[13]),.IO(AD_IO[13]),.I(ADO[13]),.T(ADT[13]));
  IOBUF      XPCI_AD12 (.O(ADI[12]),.IO(AD_IO[12]),.I(ADO[12]),.T(ADT[12]));
  IOBUF      XPCI_AD11 (.O(ADI[11]),.IO(AD_IO[11]),.I(ADO[11]),.T(ADT[11]));
  IOBUF      XPCI_AD10 (.O(ADI[10]),.IO(AD_IO[10]),.I(ADO[10]),.T(ADT[10]));
  IOBUF      XPCI_AD9  (.O(ADI[ 9]),.IO(AD_IO[ 9]),.I(ADO[ 9]),.T(ADT[ 9]));
  IOBUF      XPCI_AD8  (.O(ADI[ 8]),.IO(AD_IO[ 8]),.I(ADO[ 8]),.T(ADT[ 8]));

  IOBUF      XPCI_AD7  (.O(ADI[ 7]),.IO(AD_IO[ 7]),.I(ADO[ 7]),.T(ADT[ 7]));
  IOBUF      XPCI_AD6  (.O(ADI[ 6]),.IO(AD_IO[ 6]),.I(ADO[ 6]),.T(ADT[ 6]));
  IOBUF      XPCI_AD5  (.O(ADI[ 5]),.IO(AD_IO[ 5]),.I(ADO[ 5]),.T(ADT[ 5]));
  IOBUF      XPCI_AD4  (.O(ADI[ 4]),.IO(AD_IO[ 4]),.I(ADO[ 4]),.T(ADT[ 4]));
  IOBUF      XPCI_AD3  (.O(ADI[ 3]),.IO(AD_IO[ 3]),.I(ADO[ 3]),.T(ADT[ 3]));
  IOBUF      XPCI_AD2  (.O(ADI[ 2]),.IO(AD_IO[ 2]),.I(ADO[ 2]),.T(ADT[ 2]));
  IOBUF      XPCI_AD1  (.O(ADI[ 1]),.IO(AD_IO[ 1]),.I(ADO[ 1]),.T(ADT[ 1]));
  IOBUF      XPCI_AD0  (.O(ADI[ 0]),.IO(AD_IO[ 0]),.I(ADO[ 0]),.T(ADT[ 0]));


  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD31 (.DATAOUT(ADD[31]),.IDATAIN(ADI[31]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD30 (.DATAOUT(ADD[30]),.IDATAIN(ADI[30]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD29 (.DATAOUT(ADD[29]),.IDATAIN(ADI[29]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD28 (.DATAOUT(ADD[28]),.IDATAIN(ADI[28]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD27 (.DATAOUT(ADD[27]),.IDATAIN(ADI[27]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD26 (.DATAOUT(ADD[26]),.IDATAIN(ADI[26]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD25 (.DATAOUT(ADD[25]),.IDATAIN(ADI[25]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD24 (.DATAOUT(ADD[24]),.IDATAIN(ADI[24]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());

  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD23 (.DATAOUT(ADD[23]),.IDATAIN(ADI[23]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD22 (.DATAOUT(ADD[22]),.IDATAIN(ADI[22]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD21 (.DATAOUT(ADD[21]),.IDATAIN(ADI[21]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD20 (.DATAOUT(ADD[20]),.IDATAIN(ADI[20]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD19 (.DATAOUT(ADD[19]),.IDATAIN(ADI[19]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD18 (.DATAOUT(ADD[18]),.IDATAIN(ADI[18]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD17 (.DATAOUT(ADD[17]),.IDATAIN(ADI[17]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD16 (.DATAOUT(ADD[16]),.IDATAIN(ADI[16]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());

  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD15 (.DATAOUT(ADD[15]),.IDATAIN(ADI[15]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD14 (.DATAOUT(ADD[14]),.IDATAIN(ADI[14]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD13 (.DATAOUT(ADD[13]),.IDATAIN(ADI[13]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD12 (.DATAOUT(ADD[12]),.IDATAIN(ADI[12]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD11 (.DATAOUT(ADD[11]),.IDATAIN(ADI[11]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD10 (.DATAOUT(ADD[10]),.IDATAIN(ADI[10]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD9  (.DATAOUT(ADD[ 9]),.IDATAIN(ADI[ 9]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1), .ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD8  (.DATAOUT(ADD[ 8]),.IDATAIN(ADI[ 8]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1), .ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());

  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD7  (.DATAOUT(ADD[ 7]),.IDATAIN(ADI[ 7]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD6  (.DATAOUT(ADD[ 6]),.IDATAIN(ADI[ 6]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD5  (.DATAOUT(ADD[ 5]),.IDATAIN(ADI[ 5]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD4  (.DATAOUT(ADD[ 4]),.IDATAIN(ADI[ 4]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD3  (.DATAOUT(ADD[ 3]),.IDATAIN(ADI[ 3]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD2  (.DATAOUT(ADD[ 2]),.IDATAIN(ADI[ 2]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD1  (.DATAOUT(ADD[ 1]),.IDATAIN(ADI[ 1]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_ADD0  (.DATAOUT(ADD[ 0]),.IDATAIN(ADI[ 0]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());


  // I/O instances for command and byte enable

  wire    [3:0] CBO;
  wire    [3:0] CBI;
  wire    [3:0] CBD;
  wire    [3:0] CBT;

  IOBUF      XPCI_CB3 (.O(CBI[ 3]),.IO(CBE_IO[ 3]),.I(CBO[ 3]),.T(CBT[ 3]));
  IOBUF      XPCI_CB2 (.O(CBI[ 2]),.IO(CBE_IO[ 2]),.I(CBO[ 2]),.T(CBT[ 2]));
  IOBUF      XPCI_CB1 (.O(CBI[ 1]),.IO(CBE_IO[ 1]),.I(CBO[ 1]),.T(CBT[ 1]));
  IOBUF      XPCI_CB0 (.O(CBI[ 0]),.IO(CBE_IO[ 0]),.I(CBO[ 0]),.T(CBT[ 0]));

  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_CBD3 (.DATAOUT(CBD[3]),.IDATAIN(CBI[3]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_CBD2 (.DATAOUT(CBD[2]),.IDATAIN(CBI[2]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_CBD1 (.DATAOUT(CBD[1]),.IDATAIN(CBI[1]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_CBD0 (.DATAOUT(CBD[0]),.IDATAIN(CBI[0]),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());


  // I/O instances for parity

  wire          PARO;
  wire          PARI;
  wire          PARD;


  IOBUF      XPCI_PAR   (.O(PARI),  .IO(PAR_IO),  .I(PARO),  .T(PART  ));

  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_PARD (.DATAOUT(PARD),.IDATAIN(PARI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0),.IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());


  // I/O instances for control

  wire          FRAMEO;
  wire          FRAMEI;
  wire          FRAMED;
  wire          FRAMET;

  wire          TRDYO;
  wire          TRDYI;
  wire          TRDYD;
  wire          TRDYT;

  wire          IRDYO;
  wire          IRDYI;
  wire          IRDYD;
  wire          IRDYT;

  wire          STOPO;
  wire          STOPI;
  wire          STOPD;
  wire          STOPT;

  wire          DEVSELO;
  wire          DEVSELI;
  wire          DEVSELD;
  wire          DEVSELT;

  wire          PERRO;
  wire          PERRI;
  wire          PERRD;
  wire          PERRT;

  wire          SERRO;
  wire          SERRI;
  wire          SERRD;
  wire          SERRT;

  wire          INTO;
  wire          INTT;

  wire          PMEO;
  wire          PMET;

  wire          REQO;
  wire          REQT;

  wire          GNTI;
  wire          GNTD;

  wire          IDSELI;
  wire          IDSELD;

  IOBUF      XPCI_FRAME (.O(FRAMEI), .IO(FRAME_IO), .I(FRAMEO), .T(FRAMET) );
  IOBUF      XPCI_TRDY  (.O(TRDYI),  .IO(TRDY_IO),  .I(TRDYO),  .T(TRDYT)  );
  IOBUF      XPCI_IRDY  (.O(IRDYI),  .IO(IRDY_IO),  .I(IRDYO),  .T(IRDYT)  );
  IOBUF      XPCI_STOP  (.O(STOPI),  .IO(STOP_IO),  .I(STOPO),  .T(STOPT)  );
  IOBUF      XPCI_DEVSEL(.O(DEVSELI),.IO(DEVSEL_IO),.I(DEVSELO),.T(DEVSELT));
  IOBUF      XPCI_PERR  (.O(PERRI),  .IO(PERR_IO),  .I(PERRO),  .T(PERRT)  );
  IOBUF      XPCI_SERR  (.O(SERRI),  .IO(SERR_IO),  .I(SERRO),  .T(SERRT)  );

  OBUFT      XPCI_INT   (.O(INT_O),.T(INTT),.I(INTO));
  OBUFT      XPCI_PME   (.O(PME_O),.T(PMET),.I(PMEO));
  OBUFT      XPCI_REQ   (.O(REQ_O),.T(REQT),.I(REQO));

  IBUF       XPCI_GNT   (.O(GNTI),.I(GNT_I));
  IBUF       XPCI_IDSEL (.O(IDSELI),.I(IDSEL_I));

  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_FRAMED (.DATAOUT(FRAMED),.IDATAIN(FRAMEI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1), .ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_TRDYD (.DATAOUT(TRDYD),.IDATAIN(TRDYI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0),.IOCLK1(1'b1), .ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_IRDYD (.DATAOUT(IRDYD),.IDATAIN(IRDYI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0),.IOCLK1(1'b1), .ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_STOPD (.DATAOUT(STOPD),.IDATAIN(STOPI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0),.IOCLK1(1'b1), .ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_DEVSELD (.DATAOUT(DEVSELD),.IDATAIN(DEVSELI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_PERRD (.DATAOUT(PERRD),.IDATAIN(PERRI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_SERRD (.DATAOUT(SERRD),.IDATAIN(SERRI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());

  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_IDSELD (.DATAOUT(IDSELD),.IDATAIN(IDSELI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0), .IOCLK1(1'b1),.ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());
  IODELAY2 #(.DELAY_SRC ("IDATAIN")) XPCI_GNTD (.DATAOUT(GNTD),.IDATAIN(GNTI),.CAL(1'b0),.CE(1'b0),.CLK(),.INC(1'b0),.RST(1'b0),.T(1'b1),.IOCLK0(1'b0),.IOCLK1(1'b1), .ODATAIN(1'b0),.BUSY(),.DATAOUT2(),.DOUT(),.TOUT());


  // Instantiate PCI interface

  // The pre- and post-IDELAY signals for each PCI input can be connected
  // one of two ways. Using AD as an example:
  //
  //   1) .ADI(ADD),    This places the IDELAY buffer in both the internal
  //      .ADD(ADD),    (combinational logic) path and the IFD path.
  //
  //   2) .ADI(ADI),    This places the IDELAY buffer only in the IFD path.
  //      .ADD(ADD),    Provides independent control of IFD hold time and
  //                    combinational set-up time, but the extra hold-time
  //                    routing on the combinational path may starve more
  //                    critical signals of routing resources.

  pci32_sp_v4_13 XPCI_CORE (
                .ado(ADO),
                .adi(ADD),
                .add(ADD),
                .adt(ADT),
                .cbo(CBO),
                .cbi(CBI),
                .cbd(CBD),
                .cbt(CBT),
                .paro(PARO),
                .pari(PARI),
                .pard(PARD),
                .part(PART),
                .frameo(FRAMEO),
                .framei(FRAMEI),
                .framed(FRAMED),
                .framet(FRAMET),
                .trdyo(TRDYO),
                .trdyi(TRDYI),
                .trdyd(TRDYD),
                .trdyt(TRDYT),
                .irdyo(IRDYO),
                .irdyi(IRDYI),
                .irdyd(IRDYD),
                .irdyt(IRDYT),
                .stopo(STOPO),
                .stopi(STOPI),
                .stopd(STOPD),
                .stopt(STOPT),
                .devselo(DEVSELO),
                .devseli(DEVSELI),
                .devseld(DEVSELD),
                .devselt(DEVSELT),
                .perro(PERRO),
                .perri(PERRD),
                .perrd(PERRD),
                .perrt(PERRT),
                .serro(SERRO),
                .serri(SERRD),
                .serrd(SERRD),
                .serrt(SERRT),
                .into(INTO),
                .intt(INTT),
                .pmeo(PMEO),
                .pmet(PMET),
                .reqo(REQO),
                .reqt(REQT),
                .gnti(GNTI),
                .gntd(GNTD),
                .idseli(IDSELD),
                .idseld(IDSELD),
                .frameq_n(FRAMEQ_N),
                .trdyq_n(TRDYQ_N),
                .irdyq_n(IRDYQ_N),
                .stopq_n(STOPQ_N),
                .devselq_n(DEVSELQ_N),
                .addr(ADDR),
                .adio_in(ADIO_IN),
                .adio_out(ADIO_OUT),
                .cfg_vld(CFG_VLD),
                .cfg_hit(CFG_HIT),
                .c_term(C_TERM),
                .c_ready(C_READY),
                .addr_vld(ADDR_VLD),
                .base_hit(BASE_HIT),
                .s_term(S_TERM),
                .s_ready(S_READY),
                .s_abort(S_ABORT),
                .s_wrdn(S_WRDN),
                .s_src_en(S_SRC_EN),
                .s_data_vld(S_DATA_VLD),
                .s_cbe(S_CBE),
                .pci_cmd(PCI_CMD),
                .request(REQUEST),
                .requesthold(REQUESTHOLD),
                .complete(COMPLETE),
                .m_wrdn(M_WRDN),
                .m_ready(M_READY),
                .m_src_en(M_SRC_EN),
                .m_data_vld(M_DATA_VLD),
                .m_cbe(M_CBE),
                .time_out(TIME_OUT),
                .cfg_self(CFG_SELF),
                .m_data(M_DATA),
                .dr_bus(DR_BUS),
                .i_idle(I_IDLE),
                .m_addr_n(M_ADDR_N),
                .idle(IDLE),
                .b_busy(B_BUSY),
                .s_data(S_DATA),
                .backoff(BACKOFF),
                .int_n(INT_N),
                .pme_n(PME_N),
                .perrq_n(PERRQ_N),
                .serrq_n(SERRQ_N),
                .keepout(KEEPOUT),
                .csr(CSR),
                .pciw_en(PCIW_EN),
                .bw_detect_dis(BW_DETECT_DIS),
                .bw_manual_32b(BW_MANUAL_32B),
                .pcix_en(PCIX_EN),
                .bm_detect_dis(1'b1),
                .bm_manual_pci(1'b1),
                .rtr(RTR),
                .rst(RST),
                .cfg(CFG),
                .clk(CLK)
      );
endmodule
