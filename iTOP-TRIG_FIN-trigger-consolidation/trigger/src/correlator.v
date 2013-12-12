`timescale 1ns/1ps

module correlator (
		   input clk,
		   input rst,
		
		   input [5:0] addr_i,
		   input [1:0] cmd_i, 

		   output [26:0] sum_o, //sum data
		   output [7:0]  sumid_o, //sum id
		   output sum_valid_o
		  );

parameter CORR_ROM_coe = "NULL.mif";
parameter ID_0 = 8'h00;
parameter ID_1 = 8'hFF;

//cmd decoding
//11: clear all the regs, disable sum_valid
//00: hold all the regs,  disable sum_valid
//01: switch look-up index and sum, disable sum_valid
//10: assert sum_valid, switch output_sum
wire clr;
wire switch_index;
wire switch_output;

assign clr=(cmd_i==2'b11)? 1'b1: 1'b0;
assign switch_index=(cmd_i==2'b01)? 1'b1: 1'b0;
assign switch_output=(cmd_i==2'b10)? 1'b1: 1'b0;

reg clr_pipe_1;
reg clr_pipe_2;
reg switch_index_pipe_1;
reg switch_index_pipe_2;
reg switch_output_pipe_1;
reg switch_output_pipe_2;

always@(posedge clk) begin
	if(rst) begin
		clr_pipe_1<=0;	
		clr_pipe_2<=0;	
		switch_index_pipe_1<=0;
		switch_index_pipe_2<=0;
		switch_output_pipe_1<=0;
		switch_output_pipe_2<=0;
	end begin
		clr_pipe_1<=clr;
		clr_pipe_2<=clr_pipe_1;
		switch_index_pipe_1<=switch_index;
		switch_index_pipe_2<=switch_index_pipe_1;
		switch_output_pipe_1<=switch_output;
		switch_output_pipe_2<=switch_output_pipe_1;
	end
end

reg [26:0] sum_add;
reg [26:0] sum_bk;

wire switch_index_in;
wire switch_output_in;
wire clr_in;
wire [19:0] data_in;

assign switch_index_in=switch_index_pipe_2;
assign switch_output_in=switch_output_pipe_2;
assign clr_in=clr_pipe_2;

wire [26:0] sum_tmp;
always@(posedge clk) begin
	if(clr_in|rst)
		sum_add<=0;
	else if(switch_index_in|switch_output_in)
		sum_add<=sum_bk;
end

always@(posedge clk) begin
	if(clr_in|rst)
		sum_bk<=0;
	else if(switch_index_in)
		sum_bk<=sum_tmp;
		
end

assign sum_tmp=sum_add+{{7'b0}+data_in};

// ROM look up

reg first_second_in;
reg [5:0] addr_in;
always@(posedge clk) begin
	if(clr|rst)
		first_second_in<=1'b1;
	else if(switch_index)
		first_second_in<=(~first_second_in);
end

always@(posedge clk) begin
	if(clr|rst)
		addr_in<=0;	
	else
		addr_in<=addr_i;
end

wire [6:0] rom_addr;
assign rom_addr={first_second_in,addr_in};

wire [19:0] rom_data;
LUT_core #(.DATA_WIDTH(20),.ENTRY_NO(128),.ADDR_WIDTH(7),.INIT_ROM_coe(CORR_ROM_coe)) u_LUT_core(
                .clka(clk),
                .addra(rom_addr),
                .douta(rom_data)
    );

reg [19:0] rom_data_reg;
always@(posedge clk) begin
	if(clr_pipe_1|rst)
		rom_data_reg<=0;
	else
		rom_data_reg<=rom_data;
end

assign data_in=rom_data_reg;

//
reg switch_flip;
reg [7:0] sumid;

always@(posedge clk) begin
	if(clr|rst)
		switch_flip<=1'b1;
	else if(switch_output)
		switch_flip<=(~switch_flip);
end

always@(posedge clk) begin
	if(~switch_flip)	
		sumid<=ID_0;
	else
		sumid<=ID_1;
end

//
assign sum_valid_o=switch_output_pipe_2;
assign sum_o=sum_add;
assign sumid_o=sumid;

endmodule

