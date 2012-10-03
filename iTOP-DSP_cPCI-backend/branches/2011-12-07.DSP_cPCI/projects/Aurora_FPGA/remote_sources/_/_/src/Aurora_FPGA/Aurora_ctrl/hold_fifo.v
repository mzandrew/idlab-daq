`timescale 1ns/1ps

module hold_fifo(
		 input clk_i,
		 input reset_i,
		 input reset_i_fifo,
		 //wr fifo interface
		 output [31:0] fifo_wr_dat_o,
		 output fifo_wr_o,
		 input  fifo_full_i, //note this should be connected to almost full flag
		 //Aurora receiver interface
		 input fifo_wr_i,
		 input [31:0] fifo_wr_dat_i,
		 //Aurora transmitter interface
		 output [17:0] empty_slots
		);

wire fifo_empty;
reg fifo_wr_o_reg;
reg fifo_wr_o_pipe;
reg [31:0] fifo_wr_dat_o_pipe;
wire fifo_rd;
wire [31:0] fifo_dat;
wire [7:0] data_cnt;
reg [7:0] empty_slots_part;

assign fifo_rd= (reset_i==1'b1)? 1'b0: ((~fifo_full_i)&(~fifo_empty));

always@(posedge clk_i) begin
	if(reset_i)
		fifo_wr_o_reg<=1'b0;
	else
		fifo_wr_o_reg<=fifo_rd;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_wr_o_pipe<=1'b0;
		fifo_wr_dat_o_pipe<=32'b0;
	end else begin
		fifo_wr_o_pipe<=fifo_wr_o_reg;
		fifo_wr_dat_o_pipe<=fifo_dat;
	end
end

assign fifo_wr_dat_o=fifo_wr_dat_o_pipe;
assign fifo_wr_o=fifo_wr_o_pipe;


hold_fifo_1k u_hold_fifo_1k (
  .clk(clk_i), // input clk
  .rst(reset_i_fifo), // input rst
  .din(fifo_wr_dat_i), // input [31 : 0] din
  .wr_en(fifo_wr_i), // input wr_en
  .rd_en(fifo_rd), // input rd_en
  .dout(fifo_dat), // output [31 : 0] dout
  .full(), // output full
  .almost_full(), // output almost_full
  .empty(fifo_empty), // output empty
  .almost_empty(), // output almost_empty
  .valid(), // output valid
  .data_count(data_cnt) // output [7 : 0] data_count
);

always@(posedge clk_i) begin
	if(reset_i)
		empty_slots_part<=8'b0;
	else if(data_cnt>8'd216)
		empty_slots_part<=8'b0;
	else	
		empty_slots_part<=8'd216-data_cnt;
end

assign empty_slots={10'b0,empty_slots_part};

endmodule


