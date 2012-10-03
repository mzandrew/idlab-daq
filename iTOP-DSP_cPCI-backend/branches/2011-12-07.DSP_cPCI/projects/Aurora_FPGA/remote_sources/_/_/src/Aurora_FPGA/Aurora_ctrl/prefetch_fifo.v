`timescale 1ns/1ps

module prefetch_fifo 	(
			 input clk_i,
			 input reset_i, //reset logic
			 input reset_i_fifo,
			 //rd fifo interface
			 input [31:0] fifo_dat_i,
			 input fifo_empty_i,
			 output fifo_rd_o,
			 //Aurora transmitter interface
			 output prefetch_fifo_empty,
			 input fifo_rd_i,
			 output [31:0] fifo_dat_o,
			 output [17:0] fifo_cnt_o
			);
reg fifo_wr_reg;
reg fifo_wr_reg_pipe;
reg [31:0] fifo_wr_dat_pipe;
wire fifo_full;
wire [7:0] fifo_cnt_tmp;

assign fifo_rd_o_tmp= (reset_i==1'b1)? 1'b0: ((~fifo_full)&(~fifo_empty_i));
assign fifo_rd_o=fifo_rd_o_tmp;

always@(posedge clk_i) begin
	if(reset_i)
		fifo_wr_reg<=1'b0;
	else
		fifo_wr_reg<=#2 fifo_rd_o_tmp;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_wr_reg_pipe<=1'b0;
		fifo_wr_dat_pipe<=32'b0;
	end else begin
		fifo_wr_reg_pipe<=fifo_wr_reg;
		fifo_wr_dat_pipe<=fifo_dat_i;
	end
end

prefetch_fifo_1k u_prefetch_fifo_1k ( //real length is 256
  .clk(clk_i), // input clk
  .rst(reset_i_fifo), // input rst
  .din(fifo_wr_dat_pipe), // input [31 : 0] din
  .wr_en(fifo_wr_reg_pipe), // input wr_en
  .rd_en(fifo_rd_i), // input rd_en
  .dout(fifo_dat_o), // output [31 : 0] dout
  .full(), // output full
  .almost_full(fifo_full), // output almost_full
  .empty(prefetch_fifo_empty), // output empty
  .almost_empty(), // output almost_empty
  .valid(), // output valid
  .data_count(fifo_cnt_tmp) // output [7 : 0] data_count
);

assign fifo_cnt_o[17:10] = {10'b0,fifo_cnt_tmp};

endmodule

