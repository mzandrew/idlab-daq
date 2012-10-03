`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:21 06/29/2011 
// Design Name: 
// Module Name:    DMA_LED_driver 
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
module DMA_LED_driver(
		input clk, //33Mhz clock
		input rdy,
		input dma_in_use,
		output green,
		output red
    );
	 
reg red_reg;
reg green_reg;
reg [22:0] blink_cnt;
wire trans_data;
reg dma_in_use_pipe_1;
reg dma_in_use_pipe_2;
reg [25:0] blink_valid_cnt;
reg [25:0] blink_red_cnt;

always@(posedge clk) begin
	dma_in_use_pipe_1<=dma_in_use;
	dma_in_use_pipe_2<=dma_in_use_pipe_1;
end

assign trans_data=  dma_in_use_pipe_2;

always@(posedge clk) begin
	if(~rdy)
		red_reg<=1'b1;
	else
		red_reg<=(~blink_red_cnt[25]);
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
