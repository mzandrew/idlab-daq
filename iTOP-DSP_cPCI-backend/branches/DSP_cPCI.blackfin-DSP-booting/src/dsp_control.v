`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	IDLab
// Engineer:    Lili Zhang
// Create Date:    11:42:20 10/25/2011 
// Module Name:    dsp_control 
// Project Name:  DSP_cPCI_revB DSP booting
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module dsp_control(
	output DSP0_BMODE0,
	output DSP0_BMODE1,
	output DSP1_BMODE0,
	output DSP1_BMODE1,
	
	output DSP0_BYPASS,    
	output DSP1_BYPASS,
	output xBYPASS,
	output DSP0_NMI0,
	output DSP1_NMI0,
	output DSP0_NMI1,
	output DSP1_NMI1,
	output DSP0_BUS_READY,		
	output DSP1_BUS_READY,
	output DSP0_ASYNC_READY,	
	output DSP1_ASYNC_READY   
    );

	
  // set BMODE[1:0] to 11  SPI master mode- Boots from a 16/24-bis addressable SPI memory
	assign DSP0_BMODE0 = 1'b1;
	assign DSP0_BMODE1 = 1'b1;
	assign DSP1_BMODE0 = 1'b1;
	assign DSP1_BMODE1 = 1'b1;
	
 // set 	BMODE[1:0]  to 01  flash/ROM  boot mode in DSP0 and DSP1 --  use boot ROM to boot from 8/16 bits flash  starting address:  0xEF00 0000
	//assign DSP0_BMODE0 = 1'b1;
	//assign DSP0_BMODE1 = 1'b0;
	//assign DSP1_BMODE0 = 1'b1;
	//assign DSP1_BMODE1 = 1'b0;
	
	// set   BMODE[1:0] to 10   SPI slave mode
	//assign DSP0_BMODE0 = 1'b0;
	//assign DSP0_BMODE1 = 1'b1;
	//assign DSP1_BMODE0 = 1'b0;
	//assign DSP1_BMODE1 = 1'b1;
	
	
	
	//DSP0 and DSP1 are in bypass mode
	assign DSP0_BYPASS = 1'b1;
	assign DSP1_BYPASS = 1'b1;
	assign xBYPASS = 1'b1;
	
	assign DSP0_NMI0 = 1'b0;   // see bf561 data page 19.  coreA - pin pulled low when it is not used 
	assign DSP1_NMI0 = 1'b0;   // coreA - pin pulled low when it is not used 
	assign DSP0_NMI1 = 1'b0;
	assign DSP1_NMI1 = 1'b0;
	
	// bus ready  
	assign DSP0_BUS_READY = 1'b1;
	assign DSP1_BUS_READY = 1'b1;
	
	// Asnychronos    
	assign DSP0_ASYNC_READY = 1'b1;
	assign DSP1_ASYNC_READY = 1'b1;
	

endmodule
