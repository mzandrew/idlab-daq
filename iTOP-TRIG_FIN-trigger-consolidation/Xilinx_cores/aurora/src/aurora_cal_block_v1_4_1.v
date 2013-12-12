//----------------------------------------------------------------------------
//$Date: 2009/09/08 16:23:48 $
//$RCSfile: cal_block_v1_2.ejava,v $
//$Revision: 1.3 $
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
// MGT Calibration Block v1.4.1
//----------------------------------------------------------------------------
// $Revision: 1.3 $
// $Date: 2009/09/08 16:23:48 $
//----------------------------------------------------------------------------
//
// (c) Copyright 2004 ? 2009 Xilinx, Inc. All rights reserved.
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
// (individually and collectively, "Critical Applications"). 
// Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//----------------------------------------------------------------------------
// Filename:          aurora_cal_block_v1_4_1.v
// Description:       DRP Calibration Block v1.4.1
//
// Verilog-standard:  Verilog 2001
//----------------------------------------------------------------------------
// History:
//  CJB/ML    01/17/2006      - Initial Code
//
//----------------------------------------------------------------------------
`timescale 1 ns/1 ps

module aurora_cal_block_v1_4_1 #(
  parameter         C_MGT_ID          = 0,       // 0 = MGTA | 1 = MGTB
  parameter         C_TXPOST_TAP_PD   = "TRUE",  // Default POST TAP PD 
  parameter         C_RXDIGRX         = "FALSE"  // Default RXDIGRX
)

(
  // User DRP Interface (destination/slave interface)
  output  reg [16-1:0]            USER_DO,
  input       [16-1:0]            USER_DI,
  input       [8-1:0]             USER_DADDR,
  input                           USER_DEN,
  input                           USER_DWE,
  output  reg                     USER_DRDY,

  // MGT DRP Interface (source/master interface)
  output      [16-1:0]            GT_DO,
  input       [16-1:0]            GT_DI,
  output  reg [8-1:0]             GT_DADDR,
  output  reg                     GT_DEN,
  output                          GT_DWE,
  input                           GT_DRDY,

  // DRP Clock and Reset
  input                           DCLK,
  input                           RESET,

  // Calibration Block Active and Disable Signals (legacy)
  output  reg                     ACTIVE,

  // User side MGT Pass through Signals
  input       [1:0]               USER_LOOPBACK,
  input                           USER_TXENC8B10BUSE,
  input       [7:0]               USER_TXBYPASS8B10B,

  // GT side MGT Pass through Signals
  output  reg [1:0]               GT_LOOPBACK,
  output                          GT_TXENC8B10BUSE,
  output      [7:0]               GT_TXBYPASS8B10B,

  // Signal Detect Ports
  input                           TX_SIGNAL_DETECT,
  input                           RX_SIGNAL_DETECT

);

// synthesis attribute use_sync_reset of cal_block_v1_4_1 is yes
// synthesis attribute use_sync_set of cal_block_v1_4_1 is yes
// synthesis attribute use_clock_enable of cal_block_v1_4_1 is yes
// synthesis attribute use_dsp48 of cal_block_v1_4_1 is no

parameter C_DRP_DWIDTH = 16;
parameter C_DRP_AWIDTH = 8;

// ---------------------------------------------------------------------------
// Wire and Register Declaration
// ---------------------------------------------------------------------------
reg   [1:0]             reset_r;

reg  [C_DRP_DWIDTH-1:0] user_di_r = {C_DRP_DWIDTH{1'b0}};
reg  [C_DRP_AWIDTH-3:0] user_daddr_r;
reg                     user_den_r;
reg                     user_req;
reg                     user_dwe_r;

reg                     gt_drdy_r = 1'b0;
reg [C_DRP_DWIDTH-1:0]  gt_do_r = {C_DRP_DWIDTH{1'b0}};
reg                     rxdigrx_cache;
reg                     txpost_tap_pd_cache;

wire [C_DRP_AWIDTH-1:0] c_rx_digrx_addr;
wire [C_DRP_AWIDTH-1:0] c_tx_pt_addr;
wire                    c_txpost_tap_pd_bin;
wire                    c_rxdigrx_bin;

wire                    user_sel;
wire                    sd_sel;
reg                     sd_req = 1'b0;
reg                     sd_read = 1'b0;
reg                     sd_write = 1'b0;
reg                     sd_drp_done = 1'b0;
reg  [C_DRP_DWIDTH-1:0] sd_wr_wreg = {C_DRP_DWIDTH{1'b0}};
reg  [C_DRP_AWIDTH-3:0] sd_addr_r;

wire                    drp_rd;
wire                    drp_wr;

reg   [3:0]             cb_state;
reg   [3:0]             cb_next_state;

reg   [4:0]             drp_state;
reg   [4:0]             drp_next_state;

reg   [13:0]            sd_state;
reg   [13:0]            sd_next_state;

reg   [40*7:0]          cb_fsm_name;
reg   [40*7:0]          drp_fsm_name;
reg   [40*7:0]          sd_fsm_name;


//----------------------------------------------------------------------------
// Arbitration FSM
//----------------------------------------------------------------------------
parameter C_RESET           = 4'b0001;
parameter C_IDLE            = 4'b0010;
parameter C_SD_DRP_OP       = 4'b0100;
parameter C_USER_DRP_OP     = 4'b1000;


//----------------------------------------------------------------------------
// DRP FSM
//----------------------------------------------------------------------------
parameter C_DRP_IDLE        = 5'b00001;
parameter C_DRP_READ        = 5'b00010;
parameter C_DRP_WRITE       = 5'b00100;
parameter C_DRP_WAIT        = 5'b01000;
parameter C_DRP_COMPLETE    = 5'b10000;


//----------------------------------------------------------------------------
// Signal Detect Indicator FSM
//----------------------------------------------------------------------------
parameter C_SD_IDLE               = 14'b00000000000001;
parameter C_SD_RD_PT_ON           = 14'b00000000000010;
parameter C_SD_MD_PT_ON           = 14'b00000000000100;
parameter C_SD_WR_PT_ON           = 14'b00000000001000;
parameter C_SD_RD_RXDIGRX_ON      = 14'b00000000010000;
parameter C_SD_MD_RXDIGRX_ON      = 14'b00000000100000;
parameter C_SD_WR_RXDIGRX_ON      = 14'b00000001000000;
parameter C_SD_WAIT               = 14'b00000010000000;
parameter C_SD_RD_RXDIGRX_RESTORE = 14'b00000100000000;
parameter C_SD_MD_RXDIGRX_RESTORE = 14'b00001000000000;
parameter C_SD_WR_RXDIGRX_RESTORE = 14'b00010000000000;
parameter C_SD_RD_PT_OFF          = 14'b00100000000000;
parameter C_SD_MD_PT_OFF          = 14'b01000000000000;
parameter C_SD_WR_PT_OFF          = 14'b10000000000000;


//----------------------------------------------------------------------------
// Make Addresses for MGTA or MGTB at compile time
//----------------------------------------------------------------------------
parameter C_MGTA_RX_DIGRX_ADDR    = 8'h7D;
parameter C_MGTA_TX_PT_ADDR       = 8'h4C;

parameter C_MGTB_RX_DIGRX_ADDR    = 8'h59;
parameter C_MGTB_TX_PT_ADDR       = 8'h4E;

generate
  if (C_MGT_ID) begin : use_mgt_b
    assign c_rx_digrx_addr    = C_MGTB_RX_DIGRX_ADDR;
    assign c_tx_pt_addr       = C_MGTB_TX_PT_ADDR;
  end
  else begin : use_mgt_a
    assign c_rx_digrx_addr    = C_MGTA_RX_DIGRX_ADDR;
    assign c_tx_pt_addr       = C_MGTA_TX_PT_ADDR;
  end
endgenerate


//----------------------------------------------------------------------------
// Convert C_TXPOST_TAP_PD from ASCII text "TRUE"/"FALSE" to binary value
//----------------------------------------------------------------------------
generate
  case (C_TXPOST_TAP_PD)
    "TRUE": begin : txpost_tap_pd_true
      assign c_txpost_tap_pd_bin = 1'b1;
    end

    "FALSE": begin : txpost_tap_pd_false
      assign c_txpost_tap_pd_bin = 1'b0;
    end

    default: begin : txpost_tap_pd_default
      assign c_txpost_tap_pd_bin = 1'b1;
    end
  endcase
endgenerate


//----------------------------------------------------------------------------
// Convert C_RXDIGRX from ASCII text "TRUE"/"FALSE" to binary value
//----------------------------------------------------------------------------
generate
  case (C_RXDIGRX)
    "TRUE": begin : rxdigrx_true
      assign c_rxdigrx_bin = 1'b1;
    end

    "FALSE": begin : rxdigrx_false
      assign c_rxdigrx_bin = 1'b0;
    end

    default: begin : rxdigrx_default
      assign c_rxdigrx_bin = 1'b1;
    end
  endcase
endgenerate


//----------------------------------------------------------------------------
// Sync Reset
//----------------------------------------------------------------------------
always @(posedge DCLK or posedge RESET)
  if (RESET)
    reset_r <=2'b11;
  else
    reset_r <= {1'b0, reset_r[1]};


//----------------------------------------------------------------------------
// User DRP Transaction Capture Input Registers
//----------------------------------------------------------------------------
// User Data Input
always @ (posedge DCLK)
  if (USER_DEN)
    user_di_r <= USER_DI;

// User DRP Address
always @ (posedge DCLK)
  if (USER_DEN)
    user_daddr_r <= USER_DADDR[C_DRP_AWIDTH-3:0];

// User Data Write Enable
always @ (posedge DCLK)
  if (reset_r[0])
    user_dwe_r <= 1'b0;
  else if (USER_DEN)
    user_dwe_r <= USER_DWE;

// Register the user_den_r when the user is granted access from the
// Arbitration FSM
always @ (posedge DCLK)
  if (reset_r[0] | (cb_state==C_USER_DRP_OP) | (USER_DADDR[7]|~USER_DADDR[6]))
    user_den_r <= 1'b0;
  else if (~user_den_r)
    user_den_r <= USER_DEN;

// Generate the user request (user_req) signal when the user is not accessing
// the same DRP addresses as the Calibration Block or when the Calibration
// Block is in idle, reset, done, or wait states.
always @ (posedge DCLK)
  if (reset_r[0] | (cb_state==C_USER_DRP_OP))
    user_req <= 1'b0;
  else if ( 
            ~(user_daddr_r[5:0]==c_rx_digrx_addr[5:0]) &
            ~(user_daddr_r[5:0]==c_tx_pt_addr[5:0]))
    user_req <= user_den_r;
  else if (sd_state==C_SD_IDLE || sd_state==C_SD_WAIT)
    user_req <= user_den_r;

// User Data Output
always @ (posedge DCLK)
  if ( (cb_state == C_USER_DRP_OP) & GT_DRDY)
    USER_DO <= GT_DI;

// User Data Ready
always @ (posedge DCLK)
  if (reset_r[0] | USER_DRDY)
    USER_DRDY <= 1'b0;
  else if ( (cb_state==C_USER_DRP_OP) )
    USER_DRDY <= GT_DRDY;

// Active signal to indicate a Calibration Block operation
always @(posedge DCLK)
  if (cb_state==C_RESET)
    ACTIVE <= 1'b0;
  else
    ACTIVE <= ~(cb_state==C_IDLE) & ~(cb_state==C_USER_DRP_OP);

// Storing the value of RXDIGRX.  The value is written from the
// default parameter upon reset or when the user writes to DRP register in
// those bits location.
always @(posedge DCLK)
  if (reset_r[0])
    rxdigrx_cache <= c_rxdigrx_bin;
  else if ( (drp_state == C_DRP_WRITE) &
            (cb_state == C_USER_DRP_OP) &
            (user_daddr_r[5:0] == c_rx_digrx_addr[5:0])
          )
    rxdigrx_cache <= user_di_r[1];

// Storing the value of TXPOST_TAP_PD.  The value is written from the
// default parameter upon reset or when the user writes to DRP register in
// those bits location.
always @(posedge DCLK)
  if (reset_r[0])
    txpost_tap_pd_cache <= c_txpost_tap_pd_bin;
  else if ( (drp_state == C_DRP_WRITE) &
            (cb_state == C_USER_DRP_OP) &
            (user_daddr_r[5:0] == c_tx_pt_addr[5:0])
          )
    txpost_tap_pd_cache <= user_di_r[12];


//----------------------------------------------------------------------------
// GT DRP Interface
//----------------------------------------------------------------------------
// GT Data Output: the data output is generated either from a Signal Detect
// FSM operation, an Auto-Cal FSM operation, or a user access.
always @(posedge DCLK)
  casez( {sd_sel,user_sel} )
    2'b1?: gt_do_r <= sd_wr_wreg;
    2'b01: gt_do_r <= user_di_r;
  endcase

assign GT_DO = gt_do_r;

// GT DRP Address: the DRP address is generated either from a Signal Detect
// FSM operation, or a user access.  DRP address ranges from 0x40 to 0x7F.
always @(posedge DCLK)
begin
  casez( {sd_sel, user_sel})
    2'b1?: GT_DADDR[5:0] <= sd_addr_r[5:0];
    2'b01: GT_DADDR[5:0] <= user_daddr_r[5:0];
  endcase
  GT_DADDR[7:6] <= 2'b01;
end

// GT Data Enable: the data enable is generated whenever there is a DRP
// Read or a DRP Write
always @(posedge DCLK)
  if (reset_r[0])
    GT_DEN <= 1'b0;
  else
    GT_DEN <= (drp_state==C_DRP_IDLE) & (drp_wr | drp_rd);

// GT Data Write Enable
assign GT_DWE = (drp_state==C_DRP_WRITE);

// GT Data Ready
always @(posedge DCLK)
  gt_drdy_r <= GT_DRDY;


//----------------------------------------------------------------------------
// Calibration Block Internal Logic:  The different select signals are
// generated for a user DRP operations as well as internal Calibration Block
// accesses.
//----------------------------------------------------------------------------
assign sd_sel = (cb_state == C_SD_DRP_OP);
assign user_sel = (cb_state == C_USER_DRP_OP);


//----------------------------------------------------------------------------
// Calibration Block (CB) FSM
//----------------------------------------------------------------------------
always @(posedge DCLK)
begin
  if (reset_r[0])
    cb_state <= C_RESET;
  else
    cb_state <= cb_next_state;
end

always @*
begin
  case (cb_state)
    C_RESET: begin
      cb_next_state <= C_IDLE;
      cb_fsm_name = "C_RESET";
    end

    C_IDLE: begin
      if (sd_req)         cb_next_state <= C_SD_DRP_OP;
      else if (user_req)  cb_next_state <= C_USER_DRP_OP;
      else                cb_next_state <= C_IDLE;
      cb_fsm_name = "C_IDLE";
    end

    C_SD_DRP_OP: begin
      cb_next_state <= gt_drdy_r ? C_IDLE : C_SD_DRP_OP;
      cb_fsm_name = "C_SD_DRP_OP";
    end

    C_USER_DRP_OP: begin
      cb_next_state <= gt_drdy_r ? C_IDLE : C_USER_DRP_OP;
      cb_fsm_name = "C_USER_DRP_OP";
    end

    default: begin
      cb_next_state <= C_IDLE;
      cb_fsm_name = "default";
    end

  endcase
end

//----------------------------------------------------------------------------
// Signal Detect Block Internal Logic
//----------------------------------------------------------------------------
// Signal Detect Request for DRP operation
always @(posedge DCLK)
begin
  if ((sd_state == C_SD_IDLE) | sd_drp_done)
    sd_req <= 1'b0;
  else
    sd_req <= sd_read | sd_write;
end

// Indicates Signal Detect DRP Read
always @(posedge DCLK)
begin
  if ((sd_state == C_SD_IDLE) | sd_drp_done)
    sd_read <= 1'b0;
  else
    sd_read <=  (sd_state == C_SD_RD_PT_ON) |
                (sd_state == C_SD_RD_RXDIGRX_ON) |
                (sd_state == C_SD_RD_RXDIGRX_RESTORE) |
                (sd_state == C_SD_RD_PT_OFF);
end

// Indicates Signal Detect DRP Write
always @(posedge DCLK)
begin
  if ((sd_state == C_SD_IDLE) | sd_drp_done)
    sd_write <= 1'b0;
  else
    sd_write <= (sd_state == C_SD_WR_PT_ON) |
                (sd_state == C_SD_WR_RXDIGRX_ON) |
                (sd_state == C_SD_WR_RXDIGRX_RESTORE) |
                (sd_state == C_SD_WR_PT_OFF);
end

// Signal Detect DRP Write Working Register
always @(posedge DCLK)
begin
  if ((cb_state == C_SD_DRP_OP) & sd_read & GT_DRDY)
    sd_wr_wreg <= GT_DI;
  else begin
    case (sd_state)
      C_SD_MD_PT_ON:
        sd_wr_wreg <= {sd_wr_wreg[15:13], 1'b0, sd_wr_wreg[11:0]};
      C_SD_MD_RXDIGRX_ON:
        sd_wr_wreg <= {sd_wr_wreg[15:2], 1'b1, sd_wr_wreg[0]};
      C_SD_MD_RXDIGRX_RESTORE:
        sd_wr_wreg <= {sd_wr_wreg[15:2], rxdigrx_cache, sd_wr_wreg[0]};
      C_SD_MD_PT_OFF:
        sd_wr_wreg <= {sd_wr_wreg[15:13], txpost_tap_pd_cache,
                       sd_wr_wreg[11:0]};
    endcase
  end
end

// Generate DRP Addresses for Signal Detect
always @*
begin
  case (sd_state)
    C_SD_RD_PT_ON:            sd_addr_r[5:0] <= c_tx_pt_addr[5:0];
    C_SD_WR_PT_ON:            sd_addr_r[5:0] <= c_tx_pt_addr[5:0];
    C_SD_RD_PT_OFF:           sd_addr_r[5:0] <= c_tx_pt_addr[5:0];
    C_SD_WR_PT_OFF:           sd_addr_r[5:0] <= c_tx_pt_addr[5:0];
    C_SD_RD_RXDIGRX_ON:       sd_addr_r[5:0] <= c_rx_digrx_addr[5:0];
    C_SD_WR_RXDIGRX_ON:       sd_addr_r[5:0] <= c_rx_digrx_addr[5:0];
    C_SD_RD_RXDIGRX_RESTORE:  sd_addr_r[5:0] <= c_rx_digrx_addr[5:0];
    C_SD_WR_RXDIGRX_RESTORE:  sd_addr_r[5:0] <= c_rx_digrx_addr[5:0];
    default:                  sd_addr_r[5:0] <= c_tx_pt_addr[5:0];
  endcase
end

// Assert when Signal Detect DRP Operation is Complete
always @(posedge DCLK)
  sd_drp_done <= GT_DRDY & (cb_state==C_SD_DRP_OP);

// GT_LOOPBACK, GT_TXENC8B10BUSE and GT_TXBYPASS8B10
//  Switch the GT11 to serial loopback mode and enable 8B10B when the Signal
//  Detect is Low.
always @(posedge DCLK)
begin
  if (reset_r[0])
    GT_LOOPBACK <= 2'b00;

  else if (~RX_SIGNAL_DETECT)
    GT_LOOPBACK <= 2'b11;

  else
    GT_LOOPBACK <= USER_LOOPBACK;
end

assign GT_TXBYPASS8B10B = TX_SIGNAL_DETECT ? USER_TXBYPASS8B10B : 8'h00;

assign GT_TXENC8B10BUSE = TX_SIGNAL_DETECT ? USER_TXENC8B10BUSE : 1'b1;

//----------------------------------------------------------------------------
// Signal Detect Block FSM:  The SD FSM is triggered when RX_SIGNAL_DETECT
// goes Low
//----------------------------------------------------------------------------
always @(posedge DCLK)
begin
  if (reset_r[0])
    sd_state <= C_SD_IDLE;
  else
    sd_state <= sd_next_state;
end

always @*
begin
  case (sd_state)
    C_SD_IDLE: begin
      if (~RX_SIGNAL_DETECT)
        sd_next_state <= C_SD_RD_PT_ON;
      else
        sd_next_state <= C_SD_IDLE;
      sd_fsm_name = "C_SD_IDLE";
    end

    C_SD_RD_PT_ON: begin
      sd_next_state <= sd_drp_done ? C_SD_MD_PT_ON :
                                     C_SD_RD_PT_ON;
      sd_fsm_name = "C_SD_RD_PT_ON";
    end

    C_SD_MD_PT_ON: begin
      sd_next_state <= C_SD_WR_PT_ON;
      sd_fsm_name = "C_SD_MD_PT_ON";
    end

    C_SD_WR_PT_ON: begin
      sd_next_state <= sd_drp_done ? C_SD_RD_RXDIGRX_ON : C_SD_WR_PT_ON;
      sd_fsm_name = "C_SD_WR_PT_ON";
    end

    C_SD_RD_RXDIGRX_ON: begin
      sd_next_state <= sd_drp_done ? C_SD_MD_RXDIGRX_ON : C_SD_RD_RXDIGRX_ON;
      sd_fsm_name = "C_SD_RD_RXDIGRX_ON";
    end

    C_SD_MD_RXDIGRX_ON: begin
      sd_next_state <= C_SD_WR_RXDIGRX_ON;
      sd_fsm_name = "C_SD_MD_RXDIGRX_ON";
    end

    C_SD_WR_RXDIGRX_ON: begin
      sd_next_state <= sd_drp_done ? C_SD_WAIT: C_SD_WR_RXDIGRX_ON;
      sd_fsm_name = "C_SD_WR_RXDIGRX_ON";
    end

    C_SD_WAIT: begin
      sd_next_state <= RX_SIGNAL_DETECT ? C_SD_RD_RXDIGRX_RESTORE : C_SD_WAIT;
      sd_fsm_name = "C_SD_WAIT";
    end

    C_SD_RD_RXDIGRX_RESTORE: begin
      sd_next_state <= sd_drp_done ?
                        C_SD_MD_RXDIGRX_RESTORE : C_SD_RD_RXDIGRX_RESTORE;
      sd_fsm_name = "C_SD_RD_RXDIGRX_RESTORE";
    end

    C_SD_MD_RXDIGRX_RESTORE: begin
      sd_next_state <= C_SD_WR_RXDIGRX_RESTORE;
      sd_fsm_name = "C_SD_MD_RXDIGRX_RESTORE";
    end

    C_SD_WR_RXDIGRX_RESTORE: begin
      sd_next_state <= sd_drp_done ? C_SD_RD_PT_OFF : C_SD_WR_RXDIGRX_RESTORE;
      sd_fsm_name = "C_SD_WR_RXDIGRX_RESTORE";
    end

    C_SD_RD_PT_OFF: begin
      sd_next_state <= sd_drp_done ? C_SD_MD_PT_OFF : C_SD_RD_PT_OFF;
      sd_fsm_name = "C_SD_RD_PT_OFF";
    end

    C_SD_MD_PT_OFF: begin
      sd_next_state <= C_SD_WR_PT_OFF;
      sd_fsm_name = "C_SD_MD_PT_OFF";
    end

    C_SD_WR_PT_OFF: begin
      sd_next_state <= sd_drp_done ? C_SD_IDLE: C_SD_WR_PT_OFF;
      sd_fsm_name = "C_SD_WR_PT_OFF";
    end

    default: begin
      sd_next_state <= C_SD_IDLE;
      sd_fsm_name = "default";
    end

  endcase
end


//----------------------------------------------------------------------------
// DRP Read/Write FSM
//----------------------------------------------------------------------------
// Generate a read signal for the DRP
assign drp_rd = ((cb_state == C_SD_DRP_OP) & sd_read) |
                ((cb_state == C_USER_DRP_OP) & ~user_dwe_r); 

// Generate a write signal for the DRP
assign drp_wr = ((cb_state == C_SD_DRP_OP) & sd_write) |
                ((cb_state == C_USER_DRP_OP) & user_dwe_r);

     
always @(posedge DCLK)
begin
  if (reset_r[0])
    drp_state <= C_DRP_IDLE;
  else
    drp_state <= drp_next_state;
end

always @*
begin
  case (drp_state)
    C_DRP_IDLE: begin
      drp_next_state <= drp_wr ? C_DRP_WRITE : (drp_rd?C_DRP_READ:C_DRP_IDLE);
      drp_fsm_name = "C_DRP_IDLE";
    end

    C_DRP_READ: begin
      drp_next_state <= C_DRP_WAIT;
      drp_fsm_name = "C_DRP_READ";
    end

    C_DRP_WRITE: begin
      drp_next_state <= C_DRP_WAIT;
      drp_fsm_name = "C_DRP_WRITE";
    end

    C_DRP_WAIT: begin
      drp_next_state <= gt_drdy_r ? C_DRP_COMPLETE : C_DRP_WAIT;
      drp_fsm_name = "C_DRP_WAIT";
    end

    C_DRP_COMPLETE: begin
      drp_next_state <= C_DRP_IDLE;
      drp_fsm_name = "C_DRP_COMPLETE";
    end

    default: begin
      drp_next_state <= C_DRP_IDLE;
      drp_fsm_name = "default";
    end

  endcase
end

endmodule


