`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		IDlab
// Engineer: 		Lili Zhang
// Create Date:    11:17:32 10/20/2011 	
// Module Name:   dsp_jtag
// Project Name:  DSP_cPCI_revB DSP booting
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module dsp_jtag(
		
	 input DSP_EMU_A,   //emulator signal, it is the signal from DSP to FPGA	  
    input TMS_A,		//the signal that controls the TAP controller
    input TCK_A,		//JTAG clock signal
    input TDI_A,		//data in
    output  TDO_A,		//data out
	 //EMULATOR
    output   EMU_A,		//emulator signal from DSP to FPGA and from FPGA to JTAG
   
	
`ifndef TEST_CHOISE_II 
	 //FPGA-DSP CONNECTION ON DSP0
    output  DSP_TDI_0,
    output  DSP_TMS_0,
    output  DSP_TCK_0,
    input  DSP_TDO_0,
    //output DSP_SLEEP_0,
    output  DSP_TRST_0,  //JTAG reset to dsp0
`endif
	 
`ifndef TEST_CHOISE_I	
	//FPGA-DSP CONNECTION ON DSP1
    output  DSP_TDI_1,
    output  DSP_TMS_1,
    output  DSP_TCK_1,
    input  DSP_TDO_1,
    //output DSP_SLEEP_1,
    output  DSP_TRST_1,	//JTAG reset to dsp1
`endif
	input TRST_A		//JTAG reset signal

    );
	 
	
	assign EMU_A = 1'b0;			//change FPGA code and tie the EMU signal that goes to the JTAG header to the GND 
	assign DSP_TMS_0 = TMS_A;
	assign DSP_TCK_0 = TCK_A;
	assign DSP_TMS_1 = TMS_A;
	assign DSP_TCK_1 = TCK_A;
	assign DSP_TDI_0 = TDI_A;
	assign DSP_TDI_1 = DSP_TDO_0;    //DSP0'a output is the input of dsp1
	assign TDO_A = DSP_TDO_1;			//dsp1's output is sent to jtag through fpga
	assign DSP_TRST_0 = TRST_A;
	assign DSP_TRST_1 = TRST_A;

endmodule

