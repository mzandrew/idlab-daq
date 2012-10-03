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
// File       : stimulus.v
/***********************************************************************

  File:   stimulus.v
  Rev:    4.13

  This is a functional simulation model for a stimulus generator.
  This is not synthesizable.  This file is only for simulation.

***********************************************************************/
`timescale 1ns/1ps

module STIMULUS (
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
                IDSEL,
                INTA_N,
                PMEA_N,
                PERR_N,
                SERR_N,
                REQ_N,
                GNT_N,
                RST_N,
                CLK,
                FPGA_RTR,
                FPGA_RST
                );


  inout  [63:0] AD;
  inout   [7:0] CBE;
  inout         PAR;
  inout         PAR64;
  inout         FRAME_N;
  inout         REQ64_N;
  inout         TRDY_N;
  inout         IRDY_N;
  inout         STOP_N;
  inout         DEVSEL_N;
  inout         ACK64_N;
  output        IDSEL;
  input         INTA_N;
  input         PMEA_N;
  input         PERR_N;
  input         SERR_N;
  input         REQ_N;
  inout         GNT_N;
  output        RST_N;
  output        CLK;
  input         FPGA_RTR;
  input         FPGA_RST;


  // Define Parameters
  //---------------------------------
  parameter TCKO         = 2;

  parameter CLK_33_MHZ   = 0;
  parameter CLK_66_MHZ   = 1;
  parameter CLK_133_MHZ  = 2;

  parameter BUS_32_BIT   = 0;
  parameter BUS_64_BIT   = 1;

  parameter BUSMODE_PCI  = 0;
  parameter BUSMODE_PCIX = 1;


  // Define Internal Registers
  //---------------------------------
  reg           pciclk;
  reg           clk_en;
  reg     [1:0] clk_sp;
  reg  [8*12:1] tb_state;
  reg  [8*12:1] tb_state_detail;
  reg     [3:0] status_code;
  reg    [63:0] reg_ad;
  reg           adh_oe;
  reg           adl_oe;
  reg     [7:0] reg_cbe;
  reg           cbeh_oe;
  reg           cbel_oe;
  reg           reg_par;
  reg           par_oe;
  reg           reg_par64;
  reg           par64_oe;
  reg           reg_frame_n;
  reg           frame_oe;
  reg           reg_req64_n;
  reg           req64_oe;
  reg           reg_trdy_n;
  reg           trdy_oe;
  reg           reg_irdy_n;
  reg           irdy_oe;
  reg           reg_stop_n;
  reg           stop_oe;
  reg           reg_devsel_n;
  reg           devsel_oe;
  reg           reg_ack64_n;
  reg           ack64_oe;
  reg           reg_idsel;
  reg           reg_rst_n;
  reg           reg_gnt_n;
  reg           reg_gnt_oe;
  reg           reg_req_n;


  // Signals for BAR assignment tasks
  //-----------------------------------
  reg    [63:0] data_in;
  reg    [63:0] mem_bar_addr_cnt;
  reg    [31:0] io_bar_addr_cnt;
  reg    [63:0] bar_addr [5:0];
  reg     [1:0] bar_type [5:0];

  reg           no_transactions;

  // Define tri-state port hookups
  //---------------------------------

  assign #TCKO AD[63:32] = adh_oe ? reg_ad[63:32] : 32'bz;
  assign #TCKO AD[31: 0] = adl_oe ? reg_ad[31: 0] : 32'bz;
  assign #TCKO CBE[7:4] = cbeh_oe ? reg_cbe[7:4] : 4'bz;
  assign #TCKO CBE[3:0] = cbel_oe ? reg_cbe[3:0] : 4'bz;
  assign #TCKO PAR = par_oe ? reg_par : 1'bz;
  assign #TCKO PAR64 = par64_oe ? reg_par64 : 1'bz;

  assign #TCKO FRAME_N = frame_oe ? reg_frame_n : 1'bz;
  assign #TCKO REQ64_N = req64_oe ? reg_req64_n : 1'bz;
  assign #TCKO TRDY_N = trdy_oe ? reg_trdy_n : 1'bz;
  assign #TCKO IRDY_N = irdy_oe ? reg_irdy_n : 1'bz;
  assign #TCKO STOP_N = stop_oe ? reg_stop_n : 1'bz;
  assign #TCKO DEVSEL_N = devsel_oe ? reg_devsel_n : 1'bz;
  assign #TCKO ACK64_N = ack64_oe ? reg_ack64_n : 1'bz;
  assign #TCKO IDSEL = reg_idsel;
  assign #TCKO GNT_N = reg_gnt_n;
  assign RST_N = reg_rst_n;


  // Include the stimulus tasks
  //-----------------------------
  `include "stim_tasks.v"


  // Clock generation
  //-----------------------------
  always
  begin
    pciclk <= 0;
    #2;
    if (clk_sp == 0) #13;     //  33 MHz
    if (clk_sp == 1) #5.5;    //  66 MHz
    if (clk_sp == 2) #1.75;   // 133 MHz
    pciclk <= clk_en;
    #2;
    if (clk_sp == 0) #13;     //  33 MHz
    if (clk_sp == 1) #5.5;    //  66 MHz
    if (clk_sp == 2) #1.75;   // 133 MHz
  end

  assign CLK = pciclk;


  // PCI Grant Generation
  //-----------------------------
  always @(posedge pciclk)
  begin
   if (reg_req_n == 1'b0) 
     begin
       reg_gnt_oe <= 1'b1;
     end else 
     begin
       reg_gnt_oe <= 1'b0;
     end
    reg_gnt_n <= reg_gnt_oe ? 1'b0 : 1'b1;
    reg_req_n <= REQ_N;
  end


  // PCI Parity Generation
  //-----------------------------
  always @(posedge pciclk)
  begin
    // Always computed, selectively enabled
    reg_par <= (^ {AD[31:0], CBE[3:0]} );
    reg_par64 <= (^ {AD[63:32], CBE[7:4]} );
  end

  wire driveh;
  wire drivel;

  assign #TCKO driveh = adh_oe;
  assign #TCKO drivel = adl_oe;

  always @(posedge pciclk)
  begin
    par_oe <= drivel;
    par64_oe <= driveh;
  end


  //===================================================
  // Begin the actual simulation sequence
  //===================================================

  initial
  begin

    no_transactions = 1;

    // Test the following bus configuration:
    //  32-bit, 33 MHz, PCI mode
    //----------------------------------------
    RESET_BUS_AS (CLK_33_MHZ, BUS_32_BIT, BUSMODE_PCI);

    // Test if configuration is supported
    if (FPGA_RTR == 0) begin

      no_transactions = 0;

      // read device and vendor id
      READ_DWORD_PCI(0, 10, 0, 0);

      // Program the PCI device BARs
      PROGRAM_BARS_PCI;
      INTERCYCLE_GAP(50);

      // Access the PCI device
      ACCESS_EACH_BAR_PCI;
      
      // Start Initiator Sequence
      START_INITIATOR(1'b1,1'b0, 32'h40000000);
      INTERCYCLE_GAP(150);
      
    end else begin
      $display("Core asserted FPGA_RTR:  Bus configuration not supported!\n");
    end

    // Test the following bus configuration:
    //  64-bit, 33 MHz, PCI mode
    //----------------------------------------
    RESET_BUS_AS (CLK_33_MHZ, BUS_64_BIT, BUSMODE_PCI);

    // Test if configuration is supported
    if (FPGA_RTR == 0) begin

      no_transactions = 0;

      // read device and vendor id
      READ_DWORD_PCI(0, 10, 0, 0);

      // Program the PCI device BARs
      PROGRAM_BARS_PCI;
      INTERCYCLE_GAP(50);

      // Access the PCI device
      ACCESS_EACH_BAR_PCI;

      // Start Initiator Sequence
        
       START_INITIATOR(1'b1,1'b0, 32'h50000000);
        
      INTERCYCLE_GAP(150);
    end else begin
      $display("Core asserted FPGA_RTR:  Bus configuration not supported!\n");
    end


    if (no_transactions) begin
      $display("ERROR:  None of the busmodes were supported by this PCI implementation.");
    end

    tb_state <= "SIM COMPLETE";
    $display(" ");
    INTERCYCLE_GAP(100);
    $display(" ");
    $display("Simulation complete...");
    $display(" ");

    // Finish up
    clk_en <= 0;
    $stop;
  end


endmodule
