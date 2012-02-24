`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:56 06/20/2011 
// Design Name: 
// Module Name:    bus_master_pipeline 
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
module bus_master_pipeline(
		input reset,
		input clk,
		//slave signals
		input ack,
		output reg ack_pipe,
		
		input req_w_1,
		output reg req_w_1_pipe,
		
		input req_w_2,
		output reg req_w_2_pipe,
		
		input req_r_1,
		output reg req_r_1_pipe,
		
		input req_r_2,
		output reg req_r_2_pipe,
		
		input [31:0] ad_in,
		output reg [31:0] ad_in_pipe,
		
		input s_rdy,
		output reg s_rdy_pipe,
		
		input abort,
		output reg abort_pipe,
		
		//master signals
		input [31:0] ad_o,
		output reg [31:0] ad_o_pipe,
		
		input ad_o_enable,
		output reg ad_o_enable_pipe,
		
		input stb,
		output reg stb_pipe,
		
		input we,
		output reg we_pipe,
		
		input m_rdy,
		output reg m_rdy_pipe
    );

always@(posedge clk) begin
	if(reset) begin
		ack_pipe<=1'b0;
		req_w_1_pipe<=1'b0;
		req_w_2_pipe<=1'b0;
		req_r_1_pipe<=1'b0;
		req_r_2_pipe<=1'b0;
		ad_in_pipe<=32'b0;
		s_rdy_pipe<=1'b0;
		abort_pipe<=1'b0;
	end else begin
		ack_pipe<=ack;
		req_w_1_pipe<=req_w_1;
		req_w_2_pipe<=req_w_2;
		req_r_1_pipe<=req_r_1;
		req_r_2_pipe<=req_r_2;
		ad_in_pipe<=ad_in;
		s_rdy_pipe<=s_rdy;
		abort_pipe<=abort;
	end	
end	

always@(posedge clk) begin
	if(reset) begin
		ad_o_pipe<=32'b0;
		ad_o_enable_pipe<=1'b0;
		stb_pipe<=1'b0;
		we_pipe<=1'b0;
		m_rdy_pipe<=1'b0;
	end else begin
		ad_o_pipe<=ad_o;
		ad_o_enable_pipe<=ad_o_enable;
		stb_pipe<=stb;
		we_pipe<=we;
		m_rdy_pipe<=m_rdy;
	end
end

endmodule
