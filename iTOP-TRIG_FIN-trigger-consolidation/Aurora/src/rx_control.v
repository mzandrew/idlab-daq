`timescale 1ns/1ps

module rx_control(
		  rst,
		  clk,

		  rx_d,
		  rx_src_rdy_n,
		  link_active,

		  fifo_data_o,
		  fifo_wren_o,
		  fifo_full_i
		 );
parameter WIDTH=32;

input rst;
input[WIDTH-1:0] rx_d; 
input rx_src_rdy_n;
input clk;
input link_active;
output [WIDTH-1:0] fifo_data_o;
output fifo_wren_o;
input fifo_full_i;

reg [WIDTH-1:0] data;
reg data_valid;

always@(posedge clk) begin
	if(rst|(~link_active)) begin
		data<=0;
		data_valid<=0;
	end else begin
		data<=rx_d;
		data_valid<=(~rx_src_rdy_n) & (~fifo_full_i);
	end
end

assign fifo_data_o=data;
assign fifo_wren_o=data_valid;

endmodule

