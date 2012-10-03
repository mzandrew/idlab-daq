`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:53 06/17/2011 
// Design Name: 
// Module Name:    down_fifo_interface_debug 
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
module down_fifo_interface_debug(
		input clk_i,
		input reset_i,
		inout [35:0] control,
		
		//
		input [31:0] fifo_dat_1, //wr_data
		input [31:0] fifo_dat_2, //rd_data
		
		input fifo_empty_1, //full
		input fifo_empty_2, //valid
		
		input fifo_rd_1, //wr_en
		input fifo_rd_2 //rd_en
    );

//`define SIMULATION_ONLY_X_G
`ifndef SIMULATION_ONLY_X_G     

wire [95:0] bus;
reg [95:0] bus_reg;
reg [95:0] bus_reg_1;
reg [95:0] bus_reg_2;

reg [31:0] prev_rd_data;
reg [31:0] curr_rd_data;
reg curr_rd_data_valid;
reg dup_rd;
reg [31:0] dup_rd_data;

reg [31:0] prev_wr_data;
reg [31:0] curr_wr_data;
reg dup_wr;
reg [31:0] dup_wr_data;

wire [95:0] bus_final;

assign bus[31:0]=fifo_dat_1;
assign bus[63:32]=fifo_dat_2;
assign bus[64]=fifo_empty_1;
assign bus[65]=fifo_empty_2;
assign bus[66]=fifo_rd_1;
assign bus[67]=fifo_rd_2;
assign bus[95:68]=0;

always@(posedge clk_i) begin
	if(reset_i) begin
		bus_reg<=96'b0;
	end else begin
		bus_reg<=bus;
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		curr_rd_data<=32'b0;
		prev_rd_data<=32'hFFFFFFFF;
	end else if(curr_rd_data_valid==1'b1) begin
		curr_rd_data<=bus_reg[63:32];
		prev_rd_data<=curr_rd_data;
	end else begin
		curr_rd_data<=curr_rd_data;
		prev_rd_data<=prev_rd_data;
	end	
end

always@(posedge clk_i) begin
	if(reset_i)
		curr_rd_data_valid<=1'b0;
	else if(bus_reg[67]==1'b1)
		curr_rd_data_valid<=1'b1;
	else
		curr_rd_data_valid<=1'b0;
end


always@(posedge clk_i) begin
	if(reset_i)
		dup_rd<=1'b0;
	else if(curr_rd_data==prev_rd_data)
		dup_rd<=1'b1;
	else
		dup_rd<=1'b0;		
end

always@(posedge clk_i) begin
	if(reset_i)
		dup_rd_data<=32'b0;
	else
		dup_rd_data<=curr_rd_data;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		curr_wr_data<=32'b0;
		prev_wr_data<=32'hFFFFFFFF;
	end else if (bus_reg[66]==1'b1) begin
		curr_wr_data<=bus_reg[31:0];
		prev_wr_data<=curr_wr_data;
	end else begin
		curr_wr_data<=curr_wr_data;
		prev_wr_data<=prev_wr_data;
	end	
end

always@(posedge clk_i) begin
	if(reset_i)
		dup_wr<=1'b0;
	else if(curr_wr_data==prev_wr_data)
		dup_wr<=1'b1;
	else
		dup_wr<=1'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		dup_wr_data<=32'b0;
	else
		dup_wr_data<=curr_wr_data;
end

assign bus_final[0]=dup_rd;
assign bus_final[32:1]=dup_rd_data;
assign bus_final[33]=dup_wr;
assign bus_final[65:34]=dup_wr_data;
assign bus_final[95:66]=30'b0;

DMA_FPGA_ila_bus u_fifo_bus (
    .CONTROL(control), // INOUT BUS [35:0]
    .CLK(clk_i), // IN
    .TRIG0(bus_final) // IN BUS [95:0]
);

`endif

endmodule
