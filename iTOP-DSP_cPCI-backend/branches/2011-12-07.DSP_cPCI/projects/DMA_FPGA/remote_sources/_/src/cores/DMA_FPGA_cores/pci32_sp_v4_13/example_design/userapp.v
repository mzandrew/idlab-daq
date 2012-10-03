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
// File       : userapp.v
/***********************************************************************

  File:   userapp.v
  Rev:    4.13

  This is an example template for the user backend application.


***********************************************************************/
`timescale 1ps/1ps

//***********************************************************************
//
// This simple example userapp instantiates a 32-bit x 16 distributed RAM
// behind each user-selected memory BAR, and a 32-bit register behind
// each user-selected IO bar.  The stimulus module in the demo testbench
// initializes the BARs and reads and writes these spaces.
//
//***********************************************************************

module USERAPP  (
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
                CLK,
                FPGA_RTR,
                FPGA_RST
                );


  // Declare the port directions

  input         FRAMEQ_N;
  input         TRDYQ_N;
  input         IRDYQ_N;
  input         STOPQ_N;
  input         DEVSELQ_N;
  input  [31:0] ADDR;
  output [31:0] ADIO_IN;
  input  [31:0] ADIO_OUT;
  input         CFG_VLD;
  input         CFG_HIT;
  output        C_TERM;
  output        C_READY;
  input         ADDR_VLD;
  input   [7:0] BASE_HIT;
  output        S_TERM;
  output        S_READY;
  output        S_ABORT;
  input         S_WRDN;
  input         S_SRC_EN;
  input         S_DATA_VLD;
  input   [3:0] S_CBE;
  input  [15:0] PCI_CMD;
  output        REQUEST;
  output        REQUESTHOLD;
  output        COMPLETE;
  output        M_WRDN;
  output        M_READY;
  input         M_SRC_EN;
  input         M_DATA_VLD;
  output  [3:0] M_CBE;
  input         TIME_OUT;
  output        CFG_SELF;
  input         M_DATA;
  input         DR_BUS;
  input         I_IDLE;
  input         M_ADDR_N;
  input         IDLE;
  input         B_BUSY;
  input         S_DATA;
  input         BACKOFF;
  output        INT_N;
  output        PME_N;
  input         PERRQ_N;
  input         SERRQ_N;
  output        KEEPOUT;
  input  [39:0] CSR;
  input         PCIW_EN;
  output        BW_DETECT_DIS;
  output        BW_MANUAL_32B;
  input         PCIX_EN;
  input         RTR;
  input [511:0] CFG;
  input         RST;
  input         CLK;
  output        FPGA_RTR;
  output        FPGA_RST;

  parameter TDLY = 1;
  
  //******************************************************************//
  // Latch the reconfiguration output signal                          //
  //******************************************************************//

  reg           reconfig_reg;

  always @(posedge CLK or posedge RST)
  begin : rtr_ofd
    if (RST) reconfig_reg <= 1'b0;
    else reconfig_reg <= RTR;
  end

  assign FPGA_RTR = reconfig_reg;
  assign FPGA_RST = RST;


  //******************************************************************//
  // Interpret the PCI core backend signalling                        //
  //******************************************************************//

  reg    cfg_rd, cfg_wr;
  wire   cfg_rd_cs, cfg_wr_cs;

  reg         bar0_rd, bar0_wr;
  wire        bar0_rd_cs, bar0_wr_cs;
  wire [31:0] bar0_dout;
  reg         bar1_rd, bar1_wr;
  wire        bar1_rd_cs, bar1_wr_cs;
  wire [31:0] bar1_dout;
  reg         bar2_rd, bar2_wr;
  wire        bar2_rd_cs, bar2_wr_cs;
  wire [31:0] bar2_dout;

  always @(posedge CLK or posedge RST)
  begin : identify
    if (RST)
    begin
      cfg_rd  <= 1'b0;
      cfg_wr  <= 1'b0;
      bar0_rd <= 1'b0;
      bar0_wr <= 1'b0;
      bar1_rd <= 1'b0;
      bar1_wr <= 1'b0;
      bar2_rd <= 1'b0;
      bar2_wr <= 1'b0;
    end
    else
    begin
      if (CFG_HIT) begin
        cfg_rd <= !S_WRDN;
        cfg_wr <= S_WRDN;
      end else if (!S_DATA) begin
        cfg_rd <= 1'b0;
        cfg_wr <= 1'b0;
      end

      if (BASE_HIT[0]) begin
        bar0_rd <= !S_WRDN;
        bar0_wr <= S_WRDN;
      end else if (!S_DATA) begin
        bar0_rd <= 1'b0;
        bar0_wr <= 1'b0;
      end

      if (BASE_HIT[1]) begin
        bar1_rd <= !S_WRDN;
        bar1_wr <= S_WRDN;
      end else if (!S_DATA) begin
        bar1_rd <= 1'b0;
        bar1_wr <= 1'b0;
      end

      if (BASE_HIT[2]) begin
        bar2_rd <= !S_WRDN;
        bar2_wr <= S_WRDN;
      end else if (!S_DATA) begin
        bar2_rd <= 1'b0;
        bar2_wr <= 1'b0;
      end
    end
  end

  assign cfg_rd_cs  = cfg_rd;
  assign cfg_wr_cs  = cfg_wr;
  assign bar0_rd_cs = bar0_rd;
  assign bar0_wr_cs = bar0_wr;
  assign bar1_rd_cs = bar1_rd;
  assign bar1_wr_cs = bar1_wr;
  assign bar2_rd_cs = bar2_rd;
  assign bar2_wr_cs = bar2_wr;


  //******************************************************************//
  // Instantiate a register for each IO bar                           //
  //******************************************************************//





  //******************************************************************//
  // Keep an address counter for transactions to the memories below   //
  //******************************************************************//
  reg     [3:0] s_addr_reg;

  always @(posedge CLK or posedge RST)
  begin : addr_counter
    // Reset the counter, load the counter on the address cycle,
    // and count during the data cycles
    if (RST)             s_addr_reg <= 4'b0;
    else if (ADDR_VLD)   s_addr_reg <= ADIO_OUT[5:2];
    else if (S_DATA_VLD) s_addr_reg <= s_addr_reg + 1;
  end


  //******************************************************************//
  // Instantiate a small, byte-writable 16-element distributed RAM    //
  // for each memory bar (use the address counter above)              //
  // Upper 8 BAR0 Registers are used for initiator logic              //
  // Offset 0x8 - Master Status and Control Register                  //
  //   Master Start (0)                                               //
  //   Write Enable (1)                                               //
  //   Master Error (2)                                               //
  // Offset 0x9 - Address Register                                    //
  // Offset 0x10 - Transfer Length                                    //
  // Offset 0x11 - Data Pattern                                       //
  // Offset 0x12 - 0x15 - Reserved                                    //
  //******************************************************************//

  reg    [7:0] bar0_mem_b0 [15:0];
  reg    [7:0] bar0_mem_b1 [15:0];
  reg    [7:0] bar0_mem_b2 [15:0];
  reg    [7:0] bar0_mem_b3 [15:0];
  reg    reg_master_error;
  wire   assert_complete;
  
  always @(posedge CLK)
  begin : write_bar0_mem
    if (S_DATA_VLD & bar0_wr_cs & !S_CBE[0])
      bar0_mem_b0[s_addr_reg] <= ADIO_OUT[ 7: 0];
    else if (bar0_mem_b0[8][4] || bar0_mem_b0[8][5]) 
     bar0_mem_b0[8][5:4] <= 2'b00;
    else if (assert_complete)
     bar0_mem_b0[8][3] <= reg_master_error;
     
    if (S_DATA_VLD & bar0_wr_cs & !S_CBE[1])
      bar0_mem_b1[s_addr_reg] <= ADIO_OUT[15: 8];
    if (S_DATA_VLD & bar0_wr_cs & !S_CBE[2])
      bar0_mem_b2[s_addr_reg] <= ADIO_OUT[23:16];
    if (S_DATA_VLD & bar0_wr_cs & !S_CBE[3])
      bar0_mem_b3[s_addr_reg] <= ADIO_OUT[31:24];
  end
  assign bar0_dout = {bar0_mem_b3[s_addr_reg],
                      bar0_mem_b2[s_addr_reg],
                      bar0_mem_b1[s_addr_reg],
                      bar0_mem_b0[s_addr_reg]};
  reg    [7:0] bar1_mem_b0 [15:0];
  reg    [7:0] bar1_mem_b1 [15:0];
  reg    [7:0] bar1_mem_b2 [15:0];
  reg    [7:0] bar1_mem_b3 [15:0];
  always @(posedge CLK)
  begin : write_bar1_mem
    if (S_DATA_VLD & bar1_wr_cs & !S_CBE[0])
      bar1_mem_b0[s_addr_reg] <= ADIO_OUT[ 7: 0];
    if (S_DATA_VLD & bar1_wr_cs & !S_CBE[1])
      bar1_mem_b1[s_addr_reg] <= ADIO_OUT[15: 8];
    if (S_DATA_VLD & bar1_wr_cs & !S_CBE[2])
      bar1_mem_b2[s_addr_reg] <= ADIO_OUT[23:16];
    if (S_DATA_VLD & bar1_wr_cs & !S_CBE[3])
      bar1_mem_b3[s_addr_reg] <= ADIO_OUT[31:24];
  end
  assign bar1_dout = {bar1_mem_b3[s_addr_reg],
                      bar1_mem_b2[s_addr_reg],
                      bar1_mem_b1[s_addr_reg],
                      bar1_mem_b0[s_addr_reg]};

  reg    [7:0] bar2_mem_b0 [15:0];
  reg    [7:0] bar2_mem_b1 [15:0];
  reg    [7:0] bar2_mem_b2 [15:0];
  reg    [7:0] bar2_mem_b3 [15:0];
  always @(posedge CLK)
  begin : write_bar2_mem
    if (S_DATA_VLD & bar2_wr_cs & !S_CBE[0])
      bar2_mem_b0[s_addr_reg] <= ADIO_OUT[ 7: 0];
    if (S_DATA_VLD & bar2_wr_cs & !S_CBE[1])
      bar2_mem_b1[s_addr_reg] <= ADIO_OUT[15: 8];
    if (S_DATA_VLD & bar2_wr_cs & !S_CBE[2])
      bar2_mem_b2[s_addr_reg] <= ADIO_OUT[23:16];
    if (S_DATA_VLD & bar2_wr_cs & !S_CBE[3])
      bar2_mem_b3[s_addr_reg] <= ADIO_OUT[31:24];
  end
  assign bar2_dout = {bar2_mem_b3[s_addr_reg],
                      bar2_mem_b2[s_addr_reg],
                      bar2_mem_b1[s_addr_reg],
                      bar2_mem_b0[s_addr_reg]};



  //******************************************************************//
  // Implement data multiplexer                                       //
  //******************************************************************//
  reg    [31:0] adio_mux;
  wire   [3:0]  sel_enc;
  reg    [2:0]  sel_dout;
  wire   [2:0]  def_case;
 
   wire   [31:0] master_dout;
  reg           master_en;
  assign        sel_enc[0] = bar0_rd_cs;
  assign        sel_enc[1] = bar1_rd_cs;
  assign        sel_enc[2] = bar2_rd_cs;
  assign        sel_enc[3] = master_en;
  
  always @*
  begin

    case (sel_enc)
      4'b0001       : adio_mux = bar0_dout;
      4'b0010       : adio_mux = bar1_dout;
      4'b0100       : adio_mux = bar2_dout;
      4'b1000   : adio_mux = master_dout;
    default     : adio_mux = 32'h0;
    endcase

  end

  assign ADIO_IN = adio_mux;

//******************************************************************//
// Master Application Logic                                         //
//******************************************************************//

  //******************************************************************//
  // This section contains the initiator logic.                       //
  //******************************************************************//

  parameter     IDLE_S = 0;
  parameter     WRITE32_S = 1;
  parameter     READ32_S = 2;
  reg     [3:0] xfer_len;
  reg     [2:0] ping_state;
  reg     [2:0] nxt_ping_state;
  reg           xfer_load_delay;
  reg           mdata_delay;
  reg           feedback;
  wire          mdata_fell;
  wire          xfer_load;
  wire          start32;


  wire          dir;
  wire          cnt3, cnt2, cnt1;
  wire          fin3, fin2, fin1;
  wire          hold_complete;
  wire          ping_done_o;

  // Bus addresses are obtained from the MEM32 register.
  // Direction is from IO32[31] and burst length is IO32[3:0].
  // A general purpose register file is used for the source
  // or destination depending on the data transfer direction.

 
  always @(ping_state or start32 or mdata_fell or dir)
  begin : ping_fsm
    case (ping_state)

      // IDLE_S is the idle state.  If the state machine is
      // signaled to start, proceed to the next state.
      IDLE_S    : begin
                    master_en = 1'b0;
                    if (start32 & dir) nxt_ping_state = WRITE32_S;
                    else if (start32 & !dir) nxt_ping_state = READ32_S;
                    else nxt_ping_state = IDLE_S;
                  end

      // WRITE32_S stays put until it sees a deassertion of
      // the M_DATA signal indicating that a transfer is over.
      // More elaborate FSMs may check error conditions at
      // the time mdata_fell is asserted.
      WRITE32_S : begin
                    master_en = 1'b1;
                    if (mdata_fell) nxt_ping_state = IDLE_S;
                    else nxt_ping_state = WRITE32_S;
                  end

      // READ32_S stays put until it sees a deassertion of
      // the M_DATA signal indicating that a transfer is over.
      // More elaborate FSMs may check error conditions at
      // the time mdata_fell is asserted.
      READ32_S  : begin
                    master_en = 1'b1;
                    if (mdata_fell) nxt_ping_state = IDLE_S;
                    else nxt_ping_state = READ32_S;
                  end

      // Include a default state just in case we have any accidents
      // with the state machine.
      default   : nxt_ping_state = IDLE_S;
    endcase
  end

  always @(posedge CLK or posedge RST)
  begin : ping_fsm_seq
    if (RST) ping_state <= IDLE_S;
    else ping_state <= nxt_ping_state;
  end

  // Need a delayed version of M_DATA and also
  // a delayed version of the transfer length
  // counter load signal.

  always @(posedge CLK or posedge RST)
  begin : misc_signals
    if (RST)
    begin
      mdata_delay <= 1'b0;
      xfer_load_delay <= 1'b0;
    end
    else
    begin
      mdata_delay <= M_DATA;
      xfer_load_delay <= xfer_load;
    end
  end

  // This is the "set/reset" implementation for
  // the COMPLETE logic.  

  always @(posedge CLK or posedge RST)
  begin : hold_it
    if (RST) feedback <= 1'b0;
    else if (mdata_fell) feedback <= 1'b0;
    else if (assert_complete) feedback <= 1'b1;
  end

  // This is the transfer length counter.
  // Transfer lengths may be anywhere from
  // one to sixteen data phases.

  always @(posedge CLK or posedge RST)
  begin : transfer_counter
    if (RST) xfer_len <= 4'h0;
    else if (xfer_load) xfer_len <= {bar0_mem_b3[10],
                                     bar0_mem_b2[10],
                                     bar0_mem_b1[10],
                                     bar0_mem_b0[10]};
    else if (M_DATA_VLD) xfer_len <= xfer_len - 4'h1;
  end

  // Decoded some things for the complete logic.

  assign #TDLY cnt3 = (xfer_len == 4'h3);
  assign #TDLY cnt2 = (xfer_len == 4'h2);
  assign #TDLY cnt1 = (xfer_len == 4'h1);
  assign #TDLY fin3 = cnt3 & M_DATA_VLD;
  assign #TDLY fin2 = cnt2 & mdata_delay;
  assign #TDLY fin1 = cnt1 & xfer_load_delay;

  // Generate some internal signals.
    
  assign #TDLY start32 = bar0_mem_b0[8][4];
  assign #TDLY dir = bar0_mem_b0[8][6];
  assign #TDLY mdata_fell = !M_DATA & mdata_delay;
 
  assign #TDLY xfer_load = start32 & (ping_state == IDLE_S);
  assign #TDLY assert_complete = fin1 | fin2 | fin3;
  assign #TDLY hold_complete = feedback;

  // Drive outputs to the PCI interface.
    
  assign #TDLY REQUEST = (ping_state == IDLE_S) & start32;
  assign #TDLY COMPLETE = assert_complete | hold_complete;
  assign #TDLY M_WRDN = dir;   
        
  assign master_dout = M_ADDR_N ? {bar0_mem_b3[11],  
                                   bar0_mem_b2[11],
                                   bar0_mem_b1[11],
                                   bar0_mem_b0[11]} : 
                                  {bar0_mem_b3[9],
                                   bar0_mem_b2[9],
                                   bar0_mem_b1[9],
                                   bar0_mem_b0[9]};         
 
              
   
  assign #TDLY M_CBE = M_ADDR_N ? 4'h0 : {3'b11, dir};
  

  // Verify Initiator Read data matches expected pattern
  wire          oe_init_reg;
  wire          xlr, xlw;
 
  assign #TDLY xlr = (ping_state == READ32_S);
  assign #TDLY xlw = (ping_state == WRITE32_S);

  
 always @(posedge CLK or posedge RST)
 begin: check_for_error
   if (RST) reg_master_error <= 1'b0;
   else if (xlr && M_DATA_VLD && 
           (ADIO_OUT[31:24] != bar0_mem_b3[11] ||
            ADIO_OUT[23:16] != bar0_mem_b2[11] ||
            ADIO_OUT[15:8]  != bar0_mem_b1[11] ||
            ADIO_OUT[7:0]   != bar0_mem_b0[11]))
    begin
      reg_master_error <= 1'b1;
    end
  end
   

  assign #TDLY oe_init_reg = M_DATA & xlw;

  //******************************************************************//
  // Instantiate registers to drive unused core inputs                //
  //******************************************************************//
  assign C_TERM      = 1'b1;
  assign C_READY     = 1'b1;
  assign KEEPOUT     = 1'b0;
  assign CFG_SELF    = 1'b0;
  assign REQUESTHOLD = 1'b0;

  reg    S_TERM_reg;
  reg    S_READY_reg;
  reg    M_READY_reg;
  reg    INT_N_reg;
  reg    PME_N_reg;
  reg    REQUEST_reg;
  reg    S_ABORT_reg;
  reg [3:0] M_CBE_reg;
  reg    COMPLETE_reg;
  reg    M_WRDN_reg;


  always @(posedge CLK or posedge RST)
  begin
    if (RST)
    begin
      INT_N_reg     <= 1'b0;
      PME_N_reg     <= 1'b0;
      S_TERM_reg    <= 1'b1;
      S_READY_reg   <= 1'b0;
      M_READY_reg   <= 1'b0;
      S_ABORT_reg   <= 1'b1;
      M_CBE_reg     <= 4'hf;
      REQUEST_reg   <= 1'b1;
      COMPLETE_reg  <= 1'b1;
      M_WRDN_reg    <= 1'b1;
    end
    else
    begin
      INT_N_reg     <= 1'b1;
      PME_N_reg     <= 1'b1;
      S_TERM_reg    <= 1'b0;
      S_READY_reg   <= 1'b1;
      M_READY_reg   <= 1'b1;
      S_ABORT_reg   <= 1'b0;
      M_CBE_reg     <= 4'h0;
      REQUEST_reg   <= 1'b0;
      COMPLETE_reg  <= 1'b0;
      M_WRDN_reg    <= 1'b0;
    end
  end

  assign INT_N   = INT_N_reg;
  assign PME_N   = PME_N_reg;
  assign S_TERM  = S_TERM_reg;
  assign S_READY = S_READY_reg;
  assign S_ABORT = S_ABORT_reg;
  assign M_READY = M_READY_reg;

  assign BW_DETECT_DIS = 1'b0;
  assign BW_MANUAL_32B = 1'b0;

endmodule
