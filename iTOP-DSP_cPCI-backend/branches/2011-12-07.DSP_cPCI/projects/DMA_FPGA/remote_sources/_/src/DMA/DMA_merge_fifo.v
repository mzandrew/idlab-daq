`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:05 06/02/2011 
// Design Name: 
// Module Name:    data_repeater_fifo 
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
module DMA_merge_fifo(
		input reset_i,
		//
		input rd_clk_i,
		input fifo_rd_i,
		output [31:0] fifo_rd_dat_o,
		output fifo_rd_dat_valid_o,
		//
		input wr_clk_i,
		input fifo_wr_i,
		input [31:0] fifo_wr_dat_i,		
		//others
		output fifo_full,
		output fifo_almost_full,
		output fifo_prog_full,
		output fifo_empty,
		output fifo_almost_empty,
		output prog_empty,
		output [27:0] wr_data_count,
		output [27:0] rd_data_count
    );
	 
wire [10:0] wr_data_count_i;
wire [10:0] rd_data_count_i;
wire [35:0] dout_tmp;

reg [7:0] rst_cnt;
wire fifo_empty_in;

reg [7:0] rst_cnt_wr;
wire fifo_prog_full_in;

always@(posedge rd_clk_i) begin
	if(reset_i)
		rst_cnt<=8'b0;
	else if(rst_cnt[4]==1'b0)
		rst_cnt<=rst_cnt+1'b1;
	else	
		rst_cnt<=rst_cnt;
end

always@(posedge wr_clk_i) begin
	if(reset_i)
		rst_cnt_wr<=8'b0;
	else if(rst_cnt_wr[4]==1'b0)
		rst_cnt_wr<=rst_cnt_wr+1'b1;
	else
		rst_cnt_wr<=rst_cnt_wr;
end

//assign fifo_rd_dat_o=dout_tmp[31:0];
DMA_merge_fifo_core u_DMA_merge_fifo_core (
	.rst(reset_i),
	.wr_clk(wr_clk_i),
	.rd_clk(rd_clk_i),
	.din(fifo_wr_dat_i), // Bus [31 : 0] 
	.wr_en(fifo_wr_i),
	.rd_en(fifo_rd_i),
	.dout(fifo_rd_dat_o), // Bus [31 : 0] 
	.full(fifo_full),
	.almost_full(fifo_almost_full),
	.empty(fifo_empty_in),
	.almost_empty(fifo_almost_empty),
	.valid(fifo_rd_dat_valid_o),
	.prog_full(fifo_prog_full_in),
	.wr_data_count(wr_data_count_i),
	.prog_empty(prog_empty),
	.rd_data_count(rd_data_count_i));

assign wr_data_count={{17'b0},wr_data_count_i};	
assign rd_data_count={{17'b0},rd_data_count_i};	

assign fifo_empty=fifo_empty_in | (~rst_cnt[4]);
assign fifo_prog_full=fifo_prog_full_in | (~rst_cnt_wr[4]);

endmodule
