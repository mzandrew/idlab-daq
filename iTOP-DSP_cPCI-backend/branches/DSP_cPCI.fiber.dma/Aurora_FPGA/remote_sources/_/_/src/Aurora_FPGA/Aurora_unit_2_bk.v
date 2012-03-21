`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:48 06/30/2011 
// Design Name: 
// Module Name:    Aurora_unit_1_bk 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------------------
//NOTE THAT AFTER RESET, THE CHANNEL MAY STILL CONTAIN SOME GARBAGE
//------------------------------------------------------------------

module Aurora_unit_2(
		//init clk, used in power up initialization
		input init_clk,
		input init_clk_not_lock,
		
		//user reset, used by the users to reset channel and clr fifos
		input user_reset, //reset channel and fifos
		input rx_fifo_rst, //resets rx fifo
		
		//other user interface signals
		  output reg HARD_ERR,
		  output reg SOFT_ERR,
		  output reg CHANNEL_UP,
		  output reg LANE_UP,
		  input GTPD0_P,
		  input GTPD0_N,
		  
		  input rxp,
		  input rxn,
		  output txp,
		  output txn,
		  //rd FIFO interface
		  input [31:0] fifo_dat_i,
		  input fifo_empty_i,
		  output fifo_rd_o,	
		  //wr fifo interface
		  output [31:0] fifo_wr_dat_o,
		  output fifo_wr_o,
		  input  fifo_full_i,
		  output user_clk,
		  output transceiver_dis_out,
		  
		  output reg rst_fifo
		  
//		  inout [35:0] CONTROL
    );

reg [7:0] init_cnt;
wire GTP_RESET;
wire RESET;

//********************************Wire Declarations**********************************
    // Stream TX Interface
    wire    [0:31]     tx_d_i;
    wire               tx_src_rdy_n_i;
    wire               tx_dst_rdy_n_i;
    // Stream RX Interface
    wire    [0:31]     rx_d_i;
    wire               rx_src_rdy_n_i;
    // V5 Reference Clock Interface
    wire               GTPD0_left_i;

    // Error Detection Interface
    wire               hard_err_i;
    wire               soft_err_i;
    // Status
    wire               channel_up_i;
    wire               lane_up_i;
    // Clock Compensation Control Interface
    wire               warn_cc_i;
    wire               do_cc_i;
    // System Interface
    wire               pll_not_locked_i;
    wire               user_clk_i;
    wire               sync_clk_i;
    wire               power_down_i;
    wire    [2:0]      loopback_i;
    (* ASYNC_REG = "TRUE" *)
    wire               tx_lock_i;

    wire               gtpclkout_i;
    wire               buf_gtpclkout_i;

    wire               gt_reset_i; 
    wire               system_reset_i;

    wire        lane_up_reduce_i;
    wire        rst_cc_module_i;

    // TX AXI PDU I/F wires
    wire    [0:31]     tx_data_i;
    wire               tx_tvalid_i;
    wire               tx_tready_i;

    // RX AXI PDU I/F wires
    wire    [0:31]     rx_data_i;
    wire               rx_tvalid_i;
	 
	 wire [159:0] debug_bus;
    reg [159:0] debug_bus_p1;
    reg [159:0] debug_bus_p2;
	 
	 wire transceiver_dis;
	 wire gtp_rst;
	 wire aurora_rst;

  assign user_clk = user_clk_i;
  
  assign lane_up_reduce_i  = &lane_up_i;
  assign rst_cc_module_i   = !lane_up_reduce_i;
//-------------------------------------------------------
//power up reset generation by init_clk and init_clk_lock
//-------------------------------------------------------
initial begin
	init_cnt<=8'b0;
end

always@(posedge init_clk or posedge init_clk_not_lock) begin
	if(init_clk_not_lock==1'b1)
		init_cnt<=8'b0;
	else if(init_cnt[7]==1'b0)
		init_cnt<=init_cnt+1'b1;
	else
		init_cnt<=init_cnt;
end

assign GTP_RESET=(~init_cnt[6]) & (~init_cnt[7]);
assign RESET=(~init_cnt[7]) | user_reset;

always@(posedge user_clk_i) begin
	rst_fifo<=pll_not_locked_i;
end

transceiver_reset u_transceiver_reset (
    .reset(GTP_RESET|RESET), 
    .clk(init_clk), 
    .transceiver_dis(transceiver_dis), 
    .gtp_rst(gtp_rst), 
    .aurora_rst(aurora_rst)
    );

assign transceiver_dis_out=transceiver_dis;	 

//--------------------------------------------------------
//***********************Clock Buffers********************
//--------------------------------------------------------
 	IBUFDS IBUFDS
 	(
 	 .I(GTPD0_P),
 	 .IB(GTPD0_N),
 	 .O(GTPD0_left_i)
 	);


    BUFIO2 #
    (
        .DIVIDE                         (1),
        .DIVIDE_BYPASS                  ("TRUE")
    )
    gtpclkout0_0_pll0_bufio2_i
    (
        .I                              (gtpclkout_i),
        .DIVCLK                         (buf_gtpclkout_i),
        .IOCLK                          (),
        .SERDESSTROBE                   ()
    );

    // Instantiate a clock module for clock division.
    aurora_8b10b_2_CLOCK_MODULE clock_module_i
    (
        .GT_CLK(buf_gtpclkout_i),
        .GT_CLK_LOCKED(tx_lock_i),
        .USER_CLK(user_clk_i),
        .SYNC_CLK(sync_clk_i),
        .PLL_NOT_LOCKED(pll_not_locked_i)
    );

//---------------------------------------------------------------
//****************************Register User I/O******************
//---------------------------------------------------------------

 always @(posedge user_clk_i or posedge pll_not_locked_i)
    begin
		  if(pll_not_locked_i) begin
				HARD_ERR      <=  1'b1;
				SOFT_ERR      <=  1'b1;
				LANE_UP       <=  1'b0;
				CHANNEL_UP    <=  1'b0;
		  end else begin
				HARD_ERR      <=  hard_err_i;
				SOFT_ERR      <=  soft_err_i;
				LANE_UP       <=  lane_up_i;
				CHANNEL_UP    <=  channel_up_i;
		  end        
 end

//--------------------------------------------------------------
//****************************Tie off unused signals************
//--------------------------------------------------------------

    assign  power_down_i        =   1'b0;
    assign  loopback_i          =   3'b000;
	 
//-------------------------------------------------------------
//******************** Aurora Reset Debouncer logic ************
//-------------------------------------------------------------	 

    aurora_8b10b_2_RESET_LOGIC reset_logic_i
    (
        .RESET(~aurora_rst),
        .USER_CLK(user_clk_i),
        .INIT_CLK(init_clk),
        .GT_RESET_IN(gtp_rst),
        .TX_LOCK_IN(tx_lock_i),
        .PLL_NOT_LOCKED(pll_not_locked_i),
        .SYSTEM_RESET(system_reset_i),
        .GT_RESET_OUT(gt_reset_i)
    );

//--------------------------------------------------------------
//****************** Aurora Clock Compensation Logic ***********
//--------------------------------------------------------------

	   aurora_8b10b_2_STANDARD_CC_MODULE standard_cc_module_i
		(
        .RESET(rst_cc_module_i),
        // Clock Compensation Control Interface
        .WARN_CC(warn_cc_i),
        .DO_CC(do_cc_i),
        // System Interface
        .PLL_NOT_LOCKED(pll_not_locked_i),
        .USER_CLK(user_clk_i)
		);

//--------------------------------------------------------------
//****************** Aurora Module *****************************
//--------------------------------------------------------------

    aurora_8b10b_2 #
    (
        .SIM_GTPRESET_SPEEDUP(1'b0)
    )
    aurora_module_i
    (
        // AXI TX Interface
        .S_AXI_TX_TDATA(tx_data_i),
        .S_AXI_TX_TVALID(tx_tvalid_i),
        .S_AXI_TX_TREADY(tx_tready_i),

        // AXI RX Interface
        .M_AXI_RX_TDATA(rx_data_i),
        .M_AXI_RX_TVALID(rx_tvalid_i),
        // V5 Serial I/O
        .RXP(rxp),
        .RXN(rxn),
        .TXP(txp),
        .TXN(txn),
        // V5 Reference Clock Interface
        .GTPD0(GTPD0_left_i),
        // Error Detection Interface
        .HARD_ERR(hard_err_i),
        .SOFT_ERR(soft_err_i),
        // Status
        .CHANNEL_UP(channel_up_i),
        .LANE_UP(lane_up_i),
        // Clock Compensation Control Interface
        .WARN_CC(warn_cc_i),
        .DO_CC(do_cc_i),
        // System Interface
        .USER_CLK(user_clk_i),
        .SYNC_CLK(sync_clk_i),
        .RESET(system_reset_i),
        .POWER_DOWN(power_down_i),
        .LOOPBACK(loopback_i),
        .GT_RESET(gt_reset_i),
        .TX_LOCK(tx_lock_i),
        .GTPCLKOUT(gtpclkout_i)
		  );
//----------------------------------------------------------------
//******************* Aurora Data Ctrl ***************************
//----------------------------------------------------------------

 Aurora_FPGA_ctrl u_Aurora_ctrl(
			   .user_clk(user_clk_i),
			   .pll_not_locked(pll_not_locked_i),
			   .rst(aurora_rst),
				.rx_fifo_rst(rx_fifo_rst),
				.channel_rdy(channel_up_i),

			   .fifo_dat_i(fifo_dat_i),
			   .fifo_empty_i(fifo_empty_i),
			   .fifo_rd_o(fifo_rd_o),

			   .fifo_wr_dat_o(fifo_wr_dat_o),
			   .fifo_wr_o(fifo_wr_o),
			   .fifo_full_i(fifo_full_i),

			   .tx_data(tx_data_i),
			   .tx_data_src_rdy(tx_tvalid_i),
			   .tx_data_dst_rdy(tx_tready_i),

			   .rx_data(rx_data_i),
			   .rx_data_src_rdy(rx_tvalid_i)
			  );

//---------------------------------------------------------------
//********************* DEBUG SIGNALS ***************************
//---------------------------------------------------------------

   assign debug_bus[0]=GTP_RESET;
	assign debug_bus[1]=RESET;
	assign debug_bus[33:2]=fifo_dat_i;
	assign debug_bus[34]=fifo_empty_i;
	assign debug_bus[35]=fifo_rd_o;
	assign debug_bus[67:36]=fifo_wr_dat_o;
	assign debug_bus[77:68]=10'b0;
	assign debug_bus[78]=fifo_wr_o;
	assign debug_bus[79]=fifo_full_i;
	assign debug_bus[111:80]=tx_data_i;
	assign debug_bus[112]=tx_tvalid_i;
	assign debug_bus[113]=tx_tready_i;
	assign debug_bus[145:114]=rx_data_i;
	assign debug_bus[146]=rx_tvalid_i;
	assign debug_bus[147]=system_reset_i;
	
	reg init_clk_cnt_toggle;
	always@(posedge init_clk)
			init_clk_cnt_toggle<=~init_clk_cnt_toggle;
	assign debug_bus[148]=init_clk_cnt_toggle;
	
	assign debug_bus[149]=gt_reset_i;
	assign debug_bus[150]=tx_lock_i;
	assign debug_bus[151]=pll_not_locked_i;
	assign debug_bus[152]=1'b0;
	assign debug_bus[153]=1'b0;
	assign debug_bus[154]=channel_up_i;
	assign debug_bus[155]=lane_up_i;
	
	assign debug_bus[159:156]=4'b0;
	
	
	always@(posedge user_clk_i) begin
		debug_bus_p1<=debug_bus;
		debug_bus_p2<=debug_bus_p1;
	end
	
	
//	Aurora_ctrl_ila u_Aurora_ctrl_ila (
//    .CONTROL(CONTROL), // INOUT BUS [35:0]
//    .CLK(user_clk_i), // IN
//    .TRIG0(debug_bus_p2[155:0]) // IN BUS [155:0]
//	);
	

endmodule
