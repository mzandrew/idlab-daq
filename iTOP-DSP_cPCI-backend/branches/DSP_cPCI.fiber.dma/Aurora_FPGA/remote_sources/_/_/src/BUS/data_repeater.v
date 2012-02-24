`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:50 06/02/2011 
// Design Name: 
// Module Name:    data_master 
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
module data_repeater(
		input reset_i,
		input clk_i,
		//FIFO write interface
		input fifo_full_i,
		output reg fifo_write_o,
		output [31:0] fifo_dat_o,
		//FIFO read interface
		input [31:0] fifo_dat_i,
		input fifo_empty_i,		
		output fifo_read_o
    );

wire fifo_read;	

assign #2 fifo_read= (reset_i==1'b1)? 1'b0:((~fifo_full_i)&(~fifo_empty_i));

always@(posedge clk_i) begin
	if(reset_i)
		fifo_write_o<=1'b0;
	else
		fifo_write_o<=#2 fifo_read;
end

//output
assign #2 fifo_read_o=fifo_read;
assign #2 fifo_dat_o= fifo_dat_i;

endmodule

