`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:45 06/29/2011 
// Design Name: 
// Module Name:    Aurora_FPGA_LED_driver 
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
module Aurora_FPGA_LED_driver(
		input clk, //33Mhz clock
		input rdy,
		input wr_en,
		input rd_en,
		output green,
		output red
    );

reg red_reg;
reg green_reg;
reg [22:0] blink_cnt;
wire trans_data;
reg wr_en_pipe_1;
reg rd_en_pipe_1;
reg wr_en_pipe_2;
reg rd_en_pipe_2;
reg [25:0] blink_valid_cnt;
reg [25:0] blink_red_cnt;

always@(posedge clk) begin
	wr_en_pipe_1<=wr_en;
	wr_en_pipe_2<=wr_en_pipe_1;
end

always@(posedge clk) begin
	rd_en_pipe_1<=rd_en;
	rd_en_pipe_2<=rd_en_pipe_1;
end

assign trans_data=  rd_en_pipe_2 | wr_en_pipe_2;

always@(posedge clk) begin
	if(~rdy)
		red_reg<=1'b1;
	else
		red_reg<=(~blink_red_cnt[25]);
end

always@(posedge clk) begin
	if(~rdy)
		green_reg<=1'b0;
	else if(blink_valid_cnt[25]==1'b0)
		green_reg<=blink_cnt[21];
	else
		green_reg<=1'b1;
end

always@(posedge clk) begin
	if(~rdy)
		blink_cnt<=23'b0;
	else	
		blink_cnt<=blink_cnt+1'b1;
end

always@(posedge clk) begin
	if(~rdy)
		blink_red_cnt<=26'b0;
	else if(blink_red_cnt[25]==1'b0)
		blink_red_cnt<=blink_red_cnt+1'b1;
	else
		blink_red_cnt<=blink_red_cnt;
end

always@(posedge clk) begin
	if(~rdy)
			blink_valid_cnt<=26'h3FFFFFF;
	else if(trans_data)
			blink_valid_cnt<=26'b0;
	else if(blink_valid_cnt[25]==1'b0)
			blink_valid_cnt<=blink_valid_cnt+1'b1;
	else
			blink_valid_cnt<=blink_valid_cnt;			
end

assign red =red_reg;
assign green =green_reg;

endmodule
