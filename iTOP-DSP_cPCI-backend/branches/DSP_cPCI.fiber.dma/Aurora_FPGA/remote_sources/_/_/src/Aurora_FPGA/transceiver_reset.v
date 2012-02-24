`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:10 12/04/2011 
// Design Name: 
// Module Name:    transceiver_reset 
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
module transceiver_reset(
		input reset,
		input clk, //init clock
		output reg transceiver_dis,
		output reg gtp_rst,
		output reg aurora_rst
    );

reg [2:0] state;
localparam IDLE=3'd0,
			  RESET_DIS=3'd1,
			  WAIT_DIS=3'd2,
			  WAIT_GTP=3'd3,
			  WAIT_RST=3'd4;
			  
reg [23:0] dis_100ms;
reg [23:0] dis_300ms;
reg reset_dis_done;
reg wait_dis_done;
reg [7:0] gtp_reset_cnt;
reg wait_gtp_done;
reg [7:0] wait_rst_cnt;
reg wait_rst_done;

initial begin
	dis_100ms<=24'b0;
	dis_300ms<=24'b0;
	reset_dis_done<=1'b0;
	wait_dis_done<=1'b0;
	gtp_reset_cnt<=8'b0;
	wait_gtp_done<=1'b0;
	wait_rst_cnt<=8'b0;
	wait_rst_done<=1'b0;
end

always@(posedge clk) begin
	if(reset)
		dis_100ms<=24'b0;	
	else if(state==RESET_DIS)
		dis_100ms<=dis_100ms+1'b1;
	else
		dis_100ms<=dis_100ms;
end

always@(posedge clk) begin
	if(reset)
		reset_dis_done<=1'b0;
	else
		reset_dis_done<=dis_100ms[22];
end
			  
always@(posedge clk) begin
	if(reset)
		dis_300ms<=24'b0;
	else if(state==WAIT_DIS)
		dis_300ms<=dis_300ms+1'b1;
	else
		dis_300ms<=dis_300ms;
end			  

always@(posedge clk) begin
	if(reset)
		wait_dis_done<=1'b0;
	else
		wait_dis_done<=dis_300ms[23]&dis_300ms[22];
end		

always@(posedge clk) begin
	if(reset)
		gtp_reset_cnt<=8'b0;
	else if(state==WAIT_GTP)
		gtp_reset_cnt<=gtp_reset_cnt+1'b1;
	else
		gtp_reset_cnt<=gtp_reset_cnt;
end	  

always@(posedge clk) begin
	if(reset)
		wait_gtp_done<=1'b0;
	else
		wait_gtp_done<=gtp_reset_cnt[7];
end	

always@(posedge clk) begin
	if(reset)
		wait_rst_cnt<=8'b0;
	else if(state==WAIT_RST)
		wait_rst_cnt<=wait_rst_cnt+1'b1;
	else
		wait_rst_cnt<=wait_rst_cnt;
end
		  
always@(posedge clk) begin
	if(reset)
		wait_rst_done<=1'b0;
	else
		wait_rst_done<=wait_rst_cnt[7];
end		  

initial begin
	state<=IDLE;
end				

always@(posedge clk) begin
	if(reset)
		state<=RESET_DIS;
	else begin
		case(state)
			RESET_DIS: begin
								if(reset_dis_done) state<=WAIT_DIS;
								else state<=state;
							end
			WAIT_DIS: begin
								if(wait_dis_done) state<=WAIT_GTP;
								else state<=state;
						 end
			WAIT_GTP: begin
								if(wait_gtp_done) state<=WAIT_RST;
								else state<=state;
						 end
			WAIT_RST: begin
								if(wait_rst_done) state<=IDLE;
								else state<=WAIT_RST;
						 end
			IDLE:		state<=IDLE;
			default: state<=IDLE;
		endcase
	end	
end

always@(posedge clk) begin
	if(state==RESET_DIS)
		transceiver_dis<=1'b1;
	else
		transceiver_dis<=1'b0;
end

always@(posedge clk) begin
	if(state==RESET_DIS || state==WAIT_DIS || state==WAIT_GTP)
		gtp_rst<=1'b1;
	else
		gtp_rst<=1'b0;
end

always@(posedge clk) begin
	if(state!=IDLE)
		aurora_rst<=1'b1;
	else
		aurora_rst<=1'b0;
end

endmodule
