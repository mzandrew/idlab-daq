`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:46 04/27/2011 
// Design Name: 
// Module Name:    fifo_interface 
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
module fifo_interface(
		input rst,
		input wr_clk,
		input rd_clk,
		input [31:0] din,
		input wr_en,
		input rd_en,
		output[31:0] dout,
		output full,
		output almost_full,
		output empty,
		output almost_empty,
		output next_valid,
		output[27:0] rd_data_count,
		output prog_full,
		output dout_valid
    );

wire [11:0] rd_data_count_i;	 
wire [35:0] dout_tmp;

reg[7:0] rst_cnt_wr;
reg[7:0] rst_cnt_rd;
wire prog_full_in;
wire dout_valid_in;

always@(posedge wr_clk) begin
	if(rst)
		rst_cnt_wr<=8'b0;
	else if(rst_cnt_wr[4]==1'b0)
		rst_cnt_wr<=rst_cnt_wr+1'b1;
	else
		rst_cnt_wr<=rst_cnt_wr;
end

always@(posedge rd_clk) begin
	if(rst)
		rst_cnt_rd<=8'b0;
	else if(rst_cnt_rd[4]==1'b0)
		rst_cnt_rd<=rst_cnt_rd+1'b1;
	else
		rst_cnt_rd<=rst_cnt_rd;
end

//assign dout=dout_tmp[31:0];

fifo_32_32 u_fifo_32_32 (
	.rst(rst),
	.wr_clk(wr_clk),
	.rd_clk(rd_clk),
	.din(din), // Bus [31 : 0] 
	.wr_en(wr_en),
	.rd_en(rd_en),
	.dout(dout), // Bus [31 : 0] 
	.full(full),
	.almost_full(almost_full),
	.empty(empty),
	.valid(dout_valid_in),
	.almost_empty(almost_empty),
	.rd_data_count(rd_data_count_i),
	.prog_full(prog_full_in)); //8180

assign rd_data_count={{16'b0},rd_data_count_i};
assign next_valid=(~ empty) & rst_cnt_rd[4];
assign dout_valid=dout_valid_in & rst_cnt_rd[4];
assign prog_full=prog_full_in | (~rst_cnt_wr[4]);




endmodule
