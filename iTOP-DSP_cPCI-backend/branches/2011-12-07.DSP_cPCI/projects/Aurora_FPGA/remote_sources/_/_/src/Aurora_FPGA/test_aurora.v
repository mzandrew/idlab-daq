`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:01 06/24/2011
// Design Name:   Aurora_unit_1
// Module Name:   /home/zihangao/DATA_NT/Work/cPCI/firmware/src/Aurora_FPGA/test_aurora.v
// Project Name:  Aurora_FPGA_par
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Aurora_unit_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_aurora;

reg RESET;
initial begin
RESET=1'b0;
#100;
RESET=1'b1;
#300;
RESET=1'b0;
end

reg INIT_CLK;
initial begin
INIT_CLK=1'b0;
#100;
INIT_CLK=1'b1;
forever begin
#15 INIT_CLK=!INIT_CLK;
end
end

reg GTPD1_P;
reg GTPD1_N;
initial begin
GTPD1_P=1'b0;
GTPD1_N=1'b0;
#100;
GTPD1_P=1'b1;
GTPD1_N=1'b0;
forever begin
#3.2;
GTPD1_P=!GTPD1_P;
GTPD1_N=!GTPD1_N;
end
end

	Aurora_unit_1 u_Aurora_unit_1 (
    .RESET(RESET), 
    .INIT_CLK(INIT_CLK), 
    .HARD_ERR(HARD_ERR_1), 
    .SOFT_ERR(SOFT_ERR_1), 
    .CHANNEL_UP(CHANNEL_UP_1), 
    .LANE_UP(LANE_UP_1), 
    .GTPD1_P(GTPD1_P), 
    .GTPD1_N(GTPD1_N), 
    .rxp(rxp), 
    .rxn(rxn), 
    .txp(txp), 
    .txn(txn), 
    .fifo_dat_i(32'b0), 
    .fifo_empty_i(1'b1), 
    .fifo_rd_o(), 
    .fifo_wr_dat_o(), 
    .fifo_wr_o(), 
    .fifo_full_i(1'b0), 
    .user_clk(user_clk_1), 
    .CONTROL()
    );

reg GTPD0_P;
reg GTPD0_N;
initial begin
GTPD0_P=1'b0;
GTPD0_N=1'b0;
#100;
GTPD0_P=1'b1;
GTPD0_N=1'b0;
forever begin
#3.2;
GTPD0_P=!GTPD0_P;
GTPD0_N=!GTPD0_N;
end
end

Aurora_unit_2 u_Aurora_unit_2 (
    .RESET(RESET), 
    .INIT_CLK(INIT_CLK), 
    .HARD_ERR(HARD_ERR_2), 
    .SOFT_ERR(SOFT_ERR_2), 
    .CHANNEL_UP(CHANNEL_UP_2), 
    .LANE_UP(LANE_UP_2), 
    .GTPD0_P(GTPD0_P), 
    .GTPD0_N(GTPD0_N), 
    .rxp(txp), 
    .rxn(txn), 
    .txp(rxp), 
    .txn(rxn), 
    .fifo_dat_i(32'b0), 
    .fifo_empty_i(1'b1), 
    .fifo_rd_o(), 
    .fifo_wr_dat_o(), 
    .fifo_wr_o(), 
    .fifo_full_i(1'b0), 
    .user_clk(user_clk_2), 
    .CONTROL()
    );	 

      
endmodule

