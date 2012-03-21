`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:05 06/28/2011 
// Design Name: 
// Module Name:    rst_flag_delay 
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
module rst_flag_delay(
		input clk,
		input rst,
		input flag,
		output flag_delay
    );

reg[7:0] rst_cnt;	
	
always@(posedge clk) begin
	if(rst)
		rst_cnt<=8'b0;
	else if(rst_cnt[4]==1'b0)
		rst_cnt<=rst_cnt+1'b1;
	else
		rst_cnt<=rst_cnt;
end

assign flag_delay=flag | (~rst_cnt[4]);	 


endmodule
