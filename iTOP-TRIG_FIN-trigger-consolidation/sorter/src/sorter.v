`timescale 1ns/1ps

module sorter (
	      	clk,
		rst,

		rdfifo_data_i, //input fifo data array
		rdfifo_empty_i,//input fifo empty array
		rdfifo_rden_o,//input fifo rden array
			
		wrfifo_data_o,//sorted output data
		wrfifo_prog_full_i, //output fifo prog full signal
		wrfifo_wren_o //sorted output data valid 
	      );

parameter integer CNO=8; //channel number
parameter integer DATA_WIDTH=32; //the data with of each channel
parameter EMPTY_TIMEOUT=6;

input clk;
input rst;
input [CNO*DATA_WIDTH-1:0] rdfifo_data_i;
input [CNO-1:0] rdfifo_empty_i;
output [CNO-1:0] rdfifo_rden_o;
output reg [DATA_WIDTH-1:0] wrfifo_data_o;
input wrfifo_prog_full_i;
output reg wrfifo_wren_o;

//control
reg [CNO-1:0] rdfifo_valid;
wire [CNO-1:0] rdfifo_rden_in;

assign rdfifo_rden_in=rdfifo_rden_o;

genvar i;
generate
	for(i=0;i<CNO;i=i+1) begin: RDFIFO_VALID
		always@(posedge clk) begin
			if(rst)
				rdfifo_valid[i]<=0;
			else if(rdfifo_rden_in[i])
				rdfifo_valid[i]<=(~rdfifo_empty_i[i]);
		end
	end
endgenerate


wire [DATA_WIDTH-1:0] wrfifo_data_in;
wire wrfifo_wren_in;

reg [8*CNO-1:0] empty_timeout_cnt;
reg [CNO-1:0] empty_timeout;
wire [CNO-1:0] empty_hold;

generate
	for(i=0;i<CNO;i=i+1) begin: EMPTY_TIMEOUT_GEN
		if(EMPTY_TIMEOUT>0) begin: EMPTY_TIMEOUT_NZ
			always@(posedge clk) begin	
				if(rst)
					empty_timeout_cnt[8*i+7:8*i]<=0;
				else if(rdfifo_valid[i])
					empty_timeout_cnt[8*i+7:8*i]<=1;
				else if(empty_timeout_cnt[8*i+7:8*i]<EMPTY_TIMEOUT)
					empty_timeout_cnt[8*i+7:8*i]<=empty_timeout_cnt[8*i+7:8*i]+1;
			end
			always@(posedge clk) begin
				if(rst)			
					empty_timeout[i]<=0;
				else if(rdfifo_valid[i]) 
					empty_timeout[i]<=0;
				else if(empty_timeout_cnt[8*i+7:8*i]==EMPTY_TIMEOUT)
					empty_timeout[i]<=1'b1;
				else
					empty_timeout[i]<=1'b0;
			end
			assign empty_hold[i]= ~(rdfifo_valid[i] | empty_timeout[i]);
		end else begin: EMPTY_TIMEOUT_Z
			assign empty_hold[i]=1'b0;
		end
	end
endgenerate

wire read_result;
assign read_result=(~wrfifo_prog_full_i) & (~| empty_hold);

//pipelined sorter
pipeline_sorting_core #(.WIDTH(DATA_WIDTH),.CNO(CNO),.LATENCY_UNIT(1),.MIN_MAX(1))
	u_pipeline_sorting_core
			(
			 .clk(clk),
			 .arst(rst),
			 .data_array(rdfifo_data_i),
			 .data_strobe_array(rdfifo_valid),
			 .read_array(rdfifo_rden_o),
			 .read_result(read_result),
			 .result(wrfifo_data_in),
			 .result_valid(wrfifo_wren_in)
			);

always@(posedge clk) begin
	if(rst)
		wrfifo_data_o<=0;
	else if(read_result)
		wrfifo_data_o<=wrfifo_data_in;
end

always@(posedge clk) begin
	if(rst)
		wrfifo_wren_o<=0;
	else if(read_result)
		wrfifo_wren_o<=wrfifo_wren_in;
	else
		wrfifo_wren_o<=0;
end

endmodule

