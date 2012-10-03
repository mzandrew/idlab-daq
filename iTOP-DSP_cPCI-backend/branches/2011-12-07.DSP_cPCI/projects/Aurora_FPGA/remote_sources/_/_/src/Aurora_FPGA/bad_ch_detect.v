`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:31 07/15/2011 
// Design Name: 
// Module Name:    bad_ch_detect 
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
module bad_ch_detect(
		input rst,
		input clk,
		input channel_up,
		input soft_error,
		input hard_error,
		output bad_channel
    );

reg bc_reg;
reg cu_reg;

always@(posedge clk) begin
	if(rst)
		cu_reg<=1'b0;
	else if(cu_reg==1'b0)
		cu_reg<=channel_up;
	else
		cu_reg<=cu_reg;
end

always@(posedge clk) begin
	if(rst)
		bc_reg<=1'b0;
	else if(bc_reg==1'b0)
		bc_reg<=(cu_reg & ((~channel_up)|soft_error|hard_error));
	else
		bc_reg<=bc_reg;
end

assign bad_channel=bc_reg;

endmodule

