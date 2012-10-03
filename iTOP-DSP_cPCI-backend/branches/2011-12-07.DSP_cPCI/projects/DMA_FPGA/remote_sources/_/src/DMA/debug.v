`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:53 05/02/2011 
// Design Name: 
// Module Name:    debug 
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

module debug(
		input wb_clk,
		inout[35:0] CONTROL0,
		inout[35:0] CONTROL1,
		//WB slave interface
		input slave_cyc_i,
		input slave_stb_i,
		input slave_we_i,
		input [31:0] slave_dat_i,
		input [31:0] slave_adr_i,
		input [2:0] slave_cti_i,
		input [1:0] slave_bte_i,
		input [3:0] slave_sel_i,
		input slave_err_i,
		input slave_rty_i,
		input slave_ack_i,
		input [31:0] slave_dat_o,
		//WB engine interface
		input engine_cyc_i,
		input engine_stb_i,
		input engine_we_i,
		input [31:0] engine_dat_i,
		input [31:0] engine_adr_i,
		input [2:0] engine_cti_i,
		input [1:0] engine_bte_i,
		input [3:0] engine_sel_i,
		input engine_err_i,
		input engine_rty_i,
		input engine_ack_i,
		input [31:0] engine_dat_o,
		//others
		input wb_int
    );

//`define SIMULATION_ONLY_X_G
`ifndef SIMULATION_ONLY_X_G    

wire [127:0] wb_slave_signals;
wire [127:0] wb_engine_signals;
reg [127:0] wb_slave_signals_reg;
reg [127:0] wb_engine_signals_reg;
reg [31:0] wb_engine_dat_i_reg;
reg [31:0] wb_engine_dat_o_reg;
reg duplication;

ila_wb u_ila_wb_slave (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(wb_clk), // IN
    .TRIG0(wb_slave_signals_reg) // IN BUS [127:0]
);

ila_wb u_ila_wb_engine (
    .CONTROL(CONTROL1), // INOUT BUS [35:0]
    .CLK(wb_clk), // IN
    .TRIG0(wb_engine_signals_reg) // IN BUS [127:0]
);

always@(posedge wb_clk)
	wb_slave_signals_reg<=wb_slave_signals;

always@(posedge wb_clk)
	wb_engine_signals_reg<=wb_engine_signals;

//signal mapping

assign wb_slave_signals[31:0]=slave_dat_i;
assign wb_slave_signals[63:32]=slave_adr_i;
assign wb_slave_signals[95:64]=slave_dat_o;
assign wb_slave_signals[96]=slave_cyc_i;
assign wb_slave_signals[97]=slave_stb_i;
assign wb_slave_signals[98]=slave_we_i;
assign wb_slave_signals[101:99]=slave_cti_i;
assign wb_slave_signals[103:102]=slave_bte_i;
assign wb_slave_signals[107:104]=slave_sel_i;
assign wb_slave_signals[108]=slave_err_i;
assign wb_slave_signals[109]=slave_rty_i;
assign wb_slave_signals[110]=slave_ack_i;
assign wb_slave_signals[111]=wb_int;
assign wb_slave_signals[127:112]=16'b0;

assign wb_engine_signals[31:0]=engine_dat_i;
assign wb_engine_signals[63:32]=engine_adr_i;
assign wb_engine_signals[95:64]=engine_dat_o;
assign wb_engine_signals[96]=engine_cyc_i;
assign wb_engine_signals[97]=engine_stb_i;
assign wb_engine_signals[98]=engine_we_i;
assign wb_engine_signals[101:99]=engine_cti_i;
assign wb_engine_signals[103:102]=engine_bte_i;
assign wb_engine_signals[107:104]=engine_sel_i;
assign wb_engine_signals[108]=engine_err_i;
assign wb_engine_signals[109]=engine_rty_i;
assign wb_engine_signals[110]=engine_ack_i;
assign wb_engine_signals[111]=wb_int;
assign wb_engine_signals[112]=duplication;
assign wb_engine_signals[127:113]=16'b0;

initial begin
	wb_engine_dat_i_reg<=32'hFFFFFFFF;
	duplication<=1'b0;
end

always@(posedge wb_clk) begin
	if(wb_engine_signals_reg[110]) 
		wb_engine_dat_i_reg<=wb_engine_signals_reg[31:0];
	else
		wb_engine_dat_i_reg<=wb_engine_dat_i_reg;
end

always@(posedge wb_clk) begin
	if(wb_engine_dat_i_reg==wb_engine_signals_reg[31:0] && wb_engine_signals_reg[110]==1'b1)
		duplication<=1'b1;
	else
		duplication<=1'b0;
end

`endif

endmodule
