`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:44 07/01/2011 
// Design Name: 
// Module Name:    delay_unit 
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
module delay_unit(
		input clk,
		input rst,
		output delay_rst
    );

reg [7:0] rst_cnt;	 
	 
always@(posedge clk) begin
	if(rst)
		rst_cnt<=8'b0;
	else if(rst_cnt[4]==1'b0)
		rst_cnt<=rst_cnt+1'b1;
	else
		rst_cnt<=rst_cnt;
end

assign delay_rst = (~rst_cnt[4]);

endmodule
