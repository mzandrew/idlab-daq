`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:44 06/24/2011 
// Design Name: 
// Module Name:    fifo_pool 
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
module fifo_pool(
		input clk,
		input rd_clk,
		input rst_fifo,
		input rst_logic,
		//
		input fifo_wr_en,
		input [31:0] fifo_wr_data,
		output fifo_wr_full,
		output fifo_wr_almost_full,
		output packet_full,				//Full when 140x32bit words are in FIFO
		//
		input fifo_rd_en,
		output fifo_rd_empty,
		output [15:0] fifo_rd_data		
    );
reg [7:0] rst_cnt;
wire rst_fifo_delay;

wire [31:0] fifo_wr_data_in;
wire fifo_wr_en_in;
wire fifo_wr_almost_full_in;

wire [31:0] fifo_rd_data_in;
wire fifo_rd_en_in;
wire fifo_rd_empty_in;

wire fifo_empty_big;

fifo_16k u_fifo_16k (
  .rst(rst_fifo), //input rst
  .wr_clk(clk), // input wr_clk
  .rd_clk(rd_clk), // input rd_clk  
  .din({fifo_wr_data_in[15:0],fifo_wr_data_in[31:16]}), // input [31 : 0] din
  .wr_en(fifo_wr_en_in), // input wr_en
  .rd_en(fifo_rd_en), // input rd_en
  .prog_full_thresh({6'b0,8'h8B}), // input [13 : 0] prog_full_thresh
  .dout(fifo_rd_data), // output [15 : 0] dout
  .full(), // output full
  .empty(fifo_empty_big),//fifo_rd_empty), // output empty
  .almost_full(fifo_wr_almost_full_in),
  .almost_empty(),
  .prog_full(packet_full) // output prog_full
);

always@(posedge clk) begin
	if(rst_fifo)
		rst_cnt<=8'b0;
	else if(rst_cnt[4]==1'b0)
		rst_cnt<=rst_cnt+1'b1;
	else
		rst_cnt<=rst_cnt;
end

assign rst_fifo_delay = ~rst_cnt[4];

data_repeater u_data_repeater (
    .reset_i(rst_fifo_delay), 
    .clk_i(clk), 
    .fifo_full_i(fifo_wr_almost_full_in), 
    .fifo_write_o(fifo_wr_en_in), 
    .fifo_dat_o(fifo_wr_data_in), 
	 
    .fifo_dat_i(fifo_rd_data_in), 
    .fifo_empty_i(fifo_rd_empty_in), 
    .fifo_read_o(fifo_rd_en_in)
    );

fifo_4k u_fifo_4k(
  .clk(clk), // input clk
  .rst(rst_fifo), // input rst
  .din(fifo_wr_data), // input [31 : 0] din
  .wr_en(fifo_wr_en), // input wr_en
  .rd_en(fifo_rd_en_in), // input rd_en
  .dout(fifo_rd_data_in), // output [31 : 0] dout
  .full(fifo_wr_full), // output full
  .empty(fifo_rd_empty_in), // output empty
  .almost_full(fifo_wr_almost_full),
  .almost_empty()
);

assign fifo_rd_empty = fifo_empty_big & fifo_rd_empty_in;

endmodule
