`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:36 08/18/2010 
// Design Name: 
// Module Name:    LUT_128_customizable 
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
(* rom_extract = "yes" *) (* rom_style = "block" *) module LUT_core(
		clka,
		addra,
		douta
    );

parameter integer DATA_WIDTH=32;
parameter integer ENTRY_NO=128;
parameter integer ADDR_WIDTH=7;
parameter INIT_ROM_coe = "NULL.mif";

input clka;
input  [ADDR_WIDTH-1:0] addra;
output [DATA_WIDTH-1:0] douta;

reg [DATA_WIDTH-1:0] rom [0:ENTRY_NO-1];

initial begin
	$readmemb(INIT_ROM_coe,rom,0,ENTRY_NO-1);
end

assign douta=rom[addra];

endmodule

