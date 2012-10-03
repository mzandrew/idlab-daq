`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:39 07/15/2011 
// Design Name: 
// Module Name:    pulse_gen 
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
module pulse_gen(
		input clk,
		input rst,
		input trig,
		input [5:0] interval,
		output pulse
    );

reg pulse_reg;
reg [5:0] pulse_cnt;

always@(posedge clk) begin
	if(rst)
		pulse_cnt<=6'b0;
	else if(trig)
		pulse_cnt<=interval;
	else if(pulse_cnt>0)
		pulse_cnt<=pulse_cnt-1'b1;
	else
		pulse_cnt<=pulse_cnt;
end

always@(posedge clk) begin
	if(pulse_cnt>0)
		pulse_reg<=1'b1;
	else
		pulse_reg<=1'b0;
end

assign pulse = pulse_reg;

endmodule
