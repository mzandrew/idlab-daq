`timescale 1ns/1ps

module tx_control(
		  clk,
		  rst,

		  tx_d,
		  tx_src_rdy_n,
		  tx_dst_rdy_n,
		  link_active,
		  
		  fifo_data_i,
		  fifo_empty_i,
		  fifo_read_o
		 );

parameter WIDTH=32;

input clk;
input rst;

output [WIDTH-1:0] tx_d;
output tx_src_rdy_n;
input tx_dst_rdy_n;
input link_active;

input [WIDTH-1:0] fifo_data_i;
input fifo_empty_i;
output fifo_read_o;

reg strobe;
wire link_ready;

assign link_ready=(~tx_dst_rdy_n);

always@(posedge clk) begin
	if(rst|(~link_active))
		strobe<=0;
	else if(link_ready)
		strobe<=(~fifo_empty_i);
end

reg [WIDTH-1:0] data;
reg data_valid;

always@(posedge clk) begin
	if(rst|(~link_active)) begin
		data<=0;
		data_valid<=0;
	end else if(link_ready) begin
		data<=fifo_data_i;
		data_valid<=strobe;
	end
end

assign tx_d=data;
assign tx_src_rdy_n=(~ data_valid);
assign fifo_read_o=link_active & link_ready & (~fifo_empty_i);

endmodule

