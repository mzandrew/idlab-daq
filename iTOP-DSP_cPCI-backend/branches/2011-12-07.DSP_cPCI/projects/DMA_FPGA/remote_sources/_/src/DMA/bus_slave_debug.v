`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:15 06/12/2011 
// Design Name: 
// Module Name:    bus_slave_debug 
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
module bus_slave_debug(
		input wb_clk_2x,
		inout [35:0] control,
		//
		input stb,
		input we,
		input ack,
		input m_rdy,
		input s_rdy,
		input abort,
		input [31:0] dat_i,
		input [31:0] dat_o,
		input req_w_1,
		input req_w_2,
		input req_r_1,
		input req_r_2
    );

//`define SIMULATION_ONLY_X_G
`ifndef SIMULATION_ONLY_X_G    

wire [95:0] debug_bus;
reg [95:0] debug_bus_reg;

reg [31:0] dat_i_reg;
reg duplication_m;

reg [31:0] dat_o_reg;
reg duplication_s;

assign debug_bus[0]=stb;
assign debug_bus[1]=we;
assign debug_bus[2]=ack;
assign debug_bus[3]=m_rdy;
assign debug_bus[4]=s_rdy;
assign debug_bus[5]=abort;
assign debug_bus[37:6]=dat_i;
assign debug_bus[69:38]=dat_o;
assign debug_bus[70]=req_w_1;
assign debug_bus[71]=req_w_2;
assign debug_bus[72]=req_r_1;
assign debug_bus[73]=req_r_2;
assign debug_bus[74]=duplication_m;
assign debug_bus[75]=duplication_s;
assign debug_bus[95:76]=20'b0;

always@(posedge wb_clk_2x) begin
	debug_bus_reg<=debug_bus;
end

always@(posedge wb_clk_2x) begin
	if(debug_bus_reg[3]==1'b1)
		dat_i_reg<=debug_bus_reg[37:6];
	else
		dat_i_reg<=dat_i_reg;
end

always@(posedge wb_clk_2x) begin
	if(dat_i_reg==debug_bus_reg[37:6] && debug_bus_reg[3]==1'b1)
		duplication_m<=1'b1;
	else
		duplication_m<=1'b0;
end

always@(posedge wb_clk_2x) begin
	if(debug_bus_reg[4]==1'b1)
		dat_o_reg<=debug_bus_reg[69:38];
	else
		dat_o_reg<=dat_o_reg;
end

always@(posedge wb_clk_2x) begin
	if(dat_o_reg==debug_bus_reg[69:38] && debug_bus_reg[4]==1'b1)
		duplication_s<=1'b1;
	else
		duplication_s<=1'b0;
end

DMA_FPGA_ila_bus u_DMA_FPGA_ila_bus (
    .CONTROL(control), // INOUT BUS [35:0]
    .CLK(wb_clk_2x), // IN
    .TRIG0(debug_bus_reg) // IN BUS [95:0]
);

`endif

endmodule
