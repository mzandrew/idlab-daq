`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:42 06/12/2011 
// Design Name: 
// Module Name:    Aurora_FPGA_debug 
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
module Aurora_FPGA_debug(
		input clk,
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
		input req_r_2,
		inout [35:0] control1,
		inout [35:0] control2,
		inout [35:0] control3,
		inout [35:0] control4
//		inout [35:0] control5,
//		inout [35:0] control6
    );
//`define SIMULATION_ONLY_X_G
`ifndef SIMULATION_ONLY_X_G

wire [95:0] debug_bus;
reg [95:0] debug_bus_reg;
reg [95:0] debug_bus_reg_1;
reg [95:0] debug_bus_reg_2;
reg [95:0] debug_bus_reg_3;
wire [35:0] control;

reg [31:0] dat_i_reg;
reg duplication_s;

reg [31:0] dat_o_reg;
reg duplication_m;
wire [95:0] debug_bus_final;

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
assign debug_bus[74]=duplication_s;
assign debug_bus[75]=duplication_m;
assign debug_bus[95:76]=20'b0;

always@(posedge clk) begin
	debug_bus_reg<=debug_bus;
end

always@(posedge clk) begin
	if(debug_bus_reg[4]==1'b1)
		dat_i_reg<=debug_bus_reg[37:6];
	else
		dat_i_reg<=dat_i_reg;
end

always@(posedge clk) begin
	if(dat_i_reg==debug_bus_reg[37:6] && debug_bus_reg[4]==1'b1)
		duplication_s<=1'b1;
	else
		duplication_s<=1'b0;
end

always@(posedge clk) begin
	if(debug_bus_reg[3]==1'b1)
		dat_o_reg<=debug_bus_reg[69:38];
	else
		dat_o_reg<=dat_o_reg;
end

always@(posedge clk) begin
	if(dat_o_reg==debug_bus_reg[69:38] && debug_bus_reg[3]==1'b1)
		duplication_m<=1'b1;
	else
		duplication_m<=1'b0;
end

always@(posedge clk) begin
	debug_bus_reg_1<=debug_bus_reg;
	debug_bus_reg_2<=debug_bus_reg_1;
	debug_bus_reg_3<=debug_bus_reg_2;
end

Aurora_FPGA_small_icon u_Aurora_FPGA_icon (
    .CONTROL0(control), // INOUT BUS [35:0]
	 .CONTROL1(control1),
	 .CONTROL2(control2),
	 .CONTROL3(control3),
	 .CONTROL4(control4)
//	 .CONTROL5(control5),
//	 .CONTROL6(control6)
);

Aurora_FPGA_ila u_Aurora_FPGA_ila (
    .CONTROL(control), // INOUT BUS [35:0]
    .CLK(clk), // IN
    .TRIG0(debug_bus_reg[75:0]) // IN BUS [75:0]
);

assign debug_bus_final[73:0] = debug_bus_reg_3[73:0];
assign debug_bus_final[74]=duplication_s;
assign debug_bus_final[75]=duplication_m;
assign debug_bus_final[76]=duplication_m|duplication_s;
assign debug_bus_final[95:77]=19'b0;

`endif

endmodule
