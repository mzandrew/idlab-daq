`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:44 06/06/2011 
// Design Name: 
// Module Name:    Aurora_FPGA_iobuf 
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
module Aurora_FPGA_iobuf(
		input clk_in,
		
		input BUS_ACK,
		output ack_in,
		
		input BUS_REQ_W_1,
		output req_w_in_1,
		
		input BUS_REQ_W_2,
		output req_w_in_2,
		
		input BUS_REQ_R_1,
		output req_r_in_1,
		
		input BUS_REQ_R_2,
		output req_r_in_2,
		
		inout [31:0] BUS_AD,
		input ad_enable_in,
		output [31:0] adi_in,
		input [31:0] ado_in,
				
		input we_in,
		output BUS_WE,
		
		input stb_in,
		output BUS_STB,
		
		input m_rdy_in,
		output BUS_M_RDY,
		
		input BUS_S_RDY,
		output s_rdy_in,		
		
		input BUS_ABORT,
		output abort_in
		
		
    );
wire ack_in_latch;
wire bus_req_w_1_latch;
wire bus_req_w_2_latch;
wire req_r_in_1_latch;
wire req_r_in_2_latch;
wire we_in_latch;
wire stb_in_latch;
wire [31:0] adi_in_latch;
wire [31:0] ad_enable_in_latch;
wire [31:0] ado_in_latch;
wire clk;
wire m_rdy_in_latch;
wire s_rdy_in_latch;
wire abort_in_latch;

assign clk=~clk_in;

IBUF ack_buf(.I(BUS_ACK),.O(ack_in_latch));
(* IOB = "TRUE" *) FD #(.INIT(0)) ACK_FF(.D(ack_in_latch),.C(clk),.Q(ack_in));

IBUF req_w_1_buf(.I(BUS_REQ_W_1),.O(bus_req_w_1_latch));
(* IOB = "TRUE" *) FD #(.INIT(0)) BRW_FF_1(.D(bus_req_w_1_latch),.C(clk),.Q(req_w_in_1));

IBUF req_w_2_buf(.I(BUS_REQ_W_2),.O(bus_req_w_2_latch));
(* IOB = "TRUE" *) FD #(.INIT(0)) BRW_FF_2(.D(bus_req_w_2_latch),.C(clk),.Q(req_w_in_2));

IBUF req_r_buf_1(.I(BUS_REQ_R_1),.O(req_r_in_1_latch));
(* IOB = "TRUE" *) FD #(.INIT(0)) BRR1_FF(.D(req_r_in_1_latch),.C(clk),.Q(req_r_in_1));

IBUF req_r_buf_2(.I(BUS_REQ_R_2),.O(req_r_in_2_latch));
(* IOB = "TRUE" *) FD #(.INIT(0)) BRR2_FF(.D(req_r_in_2_latch),.C(clk),.Q(req_r_in_2));


(* IOB = "TRUE" *) FD #(.INIT(0)) WE_FF(.D(we_in),.C(clk_in),.Q(we_in_latch));
OBUF we_buf(.I(we_in_latch),.O(BUS_WE));


(* IOB = "TRUE" *) FD #(.INIT(0)) STB_FF(.D(stb_in),.C(clk_in),.Q(stb_in_latch));
OBUF stb_buf(.I(stb_in_latch),.O(BUS_STB));


(* IOB = "TRUE" *) FD #(.INIT(0)) M_RDY_FF(.D(m_rdy_in),.C(clk_in),.Q(m_rdy_in_latch));
OBUF m_rdy_buf(.I(m_rdy_in_latch),.O(BUS_M_RDY));


IBUF s_rdy_buf(.I(BUS_S_RDY),.O(s_rdy_in_latch));
(* IOB = "TRUE" *) FD #(.INIT(0)) S_RDY_FF(.D(s_rdy_in_latch),.C(clk),.Q(s_rdy_in));

IBUF abort_buf(.I(BUS_ABORT),.O(abort_in_latch));
(* IOB = "TRUE" *) FD #(.INIT(0)) ABORT_LATCH(.D(abort_in_latch),.C(clk),.Q(abort_in));


	generate 
		genvar bus_ad_index;
		for(bus_ad_index=0;bus_ad_index<32;bus_ad_index=bus_ad_index+1) begin: BUS_AD_BUF_LOOP
			IBUF BUS_AD_IN_BUF(.I(BUS_AD[bus_ad_index]),.O(adi_in_latch[bus_ad_index]));
			(* IOB = "TRUE" *) FD #(.INIT(0)) BUS_AD_IN_LATCH_FF(.D(adi_in_latch[bus_ad_index]),.C(clk),.Q(adi_in[bus_ad_index]));
			
			
			(* IOB = "TRUE" *) (* equivalent_register_removal = "no" *)FD #(.INIT(0)) BUS_AD_EN_FF(.D(~ad_enable_in),.C(clk_in),.Q(ad_enable_in_latch[bus_ad_index]));
			(* IOB = "TRUE" *) FD #(.INIT(0)) BUS_AD_OUT_LATCH_FF(.D(ado_in[bus_ad_index]),.C(clk_in),.Q(ado_in_latch[bus_ad_index]));
			OBUFT BUS_AD_OUT_BUF(.T(ad_enable_in_latch[bus_ad_index]),.I(ado_in_latch[bus_ad_index]),.O(BUS_AD[bus_ad_index]));			
		end
	endgenerate

endmodule
