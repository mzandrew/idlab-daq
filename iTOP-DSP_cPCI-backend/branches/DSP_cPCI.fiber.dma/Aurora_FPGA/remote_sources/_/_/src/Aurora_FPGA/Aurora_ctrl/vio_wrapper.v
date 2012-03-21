`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:34:50 06/27/2011 
// Design Name: 
// Module Name:    vio_wrapper 
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
module vio_wrapper(
		inout [35:0] control,
		output [7:0] aurora_ctrl
    );
Aurora_vio u_Aurora_vioa (
    .CONTROL(control), // INOUT BUS [35:0]
    .ASYNC_OUT(aurora_ctrl) // OUT BUS [7:0]
);

endmodule
