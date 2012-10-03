`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:54 06/12/2011 
// Design Name: 
// Module Name:    DMA_FPGA_icon_wrapper 
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
module DMA_FPGA_icon_wrapper(
		inout [35:0] CONTROL0,
		inout [35:0] CONTROL1,
		inout [35:0] CONTROL2,
		inout [35:0] CONTROL3,
		inout [35:0] CONTROL4,
		inout [35:0] CONTROL5
    );

//`define SIMULATION_ONLY_X_G
`ifndef SIMULATION_ONLY_X_G    

DMA_FPGA_icon u_DMA_FPGA_icon (
    .CONTROL0(CONTROL0), // INOUT BUS [35:0]
    .CONTROL1(CONTROL1), // INOUT BUS [35:0]
    .CONTROL2(CONTROL2), // INOUT BUS [35:0]
    .CONTROL3(CONTROL3), // INOUT BUS [35:0]
	 .CONTROL4(CONTROL4),
	 .CONTROL5(CONTROL5)
);

`endif

endmodule
