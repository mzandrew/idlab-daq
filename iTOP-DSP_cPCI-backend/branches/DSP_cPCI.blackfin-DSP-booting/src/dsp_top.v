`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		IDLab
// Engineer: 		Lili Zhang 
// Create Date:    10:37:46 10/18/2011    
// Module Name:    dsp_top 
// Project Name:   DSP_cPCI_revB DSP booting
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module dsp_top(
	//for dsp_dcm module
    input BCLK_A,			//osc  150 MHz
	 output DSP_CLK0,		//33.333MHz clock input to DSP0
	 output DSP_CLK1,		//33.333MHz clock input to DSP0
	 output PPI0_CLK_0,	//60 Mhz clock input to dsp0 PPI0
	 output PPI1_CLK_0,	//60 Mhz clock input to dsp0 PPI1
	 output PPI0_CLK_1,	//60 Mhz clock input to dsp1 PPI0
	 output PPI1_CLK_1,	//60 Mhz clock input to dsp1 PPI1 
	 
//	dsp_reset module
//	input dsp_clkin,
	input dsp_reset_button_test_signal,
	output DSP_RST0,	 //DSP0 reset signal
	output DSP_RST1,   //DSP1 reset signal
	output BYPASS_0,
	output BYPASS_1,
	
	
	//dsp_jtag module
	input DSP_EMU_A,
	input TMS_A,
	input TCK_A,
	input TDI_A,
	input TRST_A,
	output TDO_A,
	output EMU_A,
	
	input DSP_TDO_0,
	output DSP_TMS_0,
	output DSP_TCK_0,
	output DSP_TDI_0,
	output DSP_TRST_0,
	
	input DSP_TDO_1,
	output DSP_TMS_1,
	output DSP_TCK_1,
	output DSP_TDI_1,
	output DSP_TRST_1,
	
	output BMODE0_0,
	output BMODE1_0,
	output BMODE0_1,
	output BMODE1_1,
	
	output NMI0_0,
	output NMI1_0,
	output NMI0_1,
	output NMI1_1,
	
	output BR0,        //Bus Request  	
	output BR1,		  
	output ARDY0,			//DSP0_ASYNC_READY,	
	output ARDY1,			//DSP1_ASYNC_READY
		
	//debug signals
	 output	 MON_A0,
	 output	 MON_A2,
	 output	 MON_A4,
	 output	 MON_A6,
	 output	 MON_A8,
	 output	 MON_A10,
	 output	 MON_A12,
	 output	 MON_A14
	 
	 //output	MON_A1,
	 //output	MON_A3,
	 //output	MON_A5,
	 //output	MON_A7,
	 //output	MON_A9,
	 //output	MON_A11,
	 //output	MON_A13,
	 //output	MON_A15
	
    );
	 
	 //module dsp_dcm 
	 wire clk_out1;	//75 MHz  --  extra clock for testing
	 wire clk_out2;	//33.3333MHz   -- input to dsp0 and dsp1
	 wire clk_out3;	//60 MHz
	 wire reset;		//set to 0
	 wire locked;
	 
	 //module dsp_reset
	 wire dsp_rst0;
	 wire dsp_rst1;
	 wire xdsp_reset;
	 wire dsp_reset_button;
	 
	 //module dsp_jtag
	 wire tdo_a;
	 wire emu_a;
	 wire dsp_tdi_0;
	 wire dsp_tms_0;
	 wire dsp_tck_0;
	 wire dsp_trst_0;
	 
	 wire dsp_tdi_1;
	 wire dsp_tms_1;
	 wire dsp_tck_1;
	 wire dsp_trst_1;
	 
	 wire dsp0_bmode0;
	 wire dsp1_bmode0;
	 wire dsp0_bmode1;
	 wire dsp1_bmode1;
	 wire dsp0_bypass;
	 wire dsp1_bypass;
	 wire xbypass;
	 wire dsp0_nmi0;
	 wire dsp1_nmi0;
	 wire dsp0_nmi1;
	 wire dsp1_nmi1;
	 wire dsp0_bus_ready;	 //BR0	
	 wire dsp1_bus_ready;	 //BR1	
	 wire dsp0_async_ready;	 //ARDY0
	 wire dsp1_async_ready;  //ARDY1
	 wire clk_dspReset;      // clock to DSP reset module
	 
	 assign reset = 1'b0;
	
	 // *********  for DCM module ***********
	 
	 
	 OBUF OBUF_dsp_rst0(.I(dsp_rst0), .O(DSP_RST0));   //dsp0 reset signal 
	 OBUF OBUF_dsp_rst1(.I(dsp_rst1), .O(DSP_RST1));   //dsp1 reset signal
	 OBUF OBUF_dsp0_bypass(.I(dsp0_bypass), .O(BYPASS_0));
	 OBUF OBUF_dsp1_bypass(.I(dsp1_bypass), .O(BYPASS_1));
	 
	//Clock clk_out2 to DSP0
	ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_dsp_clk0(
			.Q(DSP_CLK0),		//DDR output data to dsp
			.C0(clk_out2),		//1 bit clock input
			.C1(~clk_out2),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);
	
	//clock clk_out2 to DSP1
	 ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_dsp_clk1(
			.Q(DSP_CLK1),		//DDR output data to dsp
			.C0(clk_out2),		//1 bit clock input
			.C1(~clk_out2),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);	
			
	//clk_out1 to PPI0  clk0
	ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_PPI0_clk0(
			.Q(PPI0_CLK_0),		//DDR output data to dsp
			.C0(clk_out1),		//1 bit clock input
			.C1(~clk_out1),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);
	
	//clk_out1 to PPI0  clk1
	ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_PPI0_clk1(
			.Q(PPI0_CLK_1),		//DDR output data to dsp
			.C0(clk_out1),		//1 bit clock input
			.C1(~clk_out1),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);
			
	//clk_out1 to PPI1  clk0
	ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_PPI1_clk0(
			.Q(PPI1_CLK_0),		//DDR output data to dsp
			.C0(clk_out1),		//1 bit clock input
			.C1(~clk_out1),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);
			
	//clk_out1 to PPI1  clk1
	ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_PPI1_clk1(
			.Q(PPI1_CLK_1),		//DDR output data to dsp
			.C0(clk_out1),		//1 bit clock input
			.C1(~clk_out1),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);
						
			
			
/*  Not use ODDR2 buffer 		
	 OBUF OBUF_dsp_clk0(.I(clk_out2), .O(DSP_CLK0));	//CLOCK to DSP0 33.333MHz
	 OBUF OBUF_dsp_clk1(.I(clk_out2), .O(DSP_CLK1));	//CLOCK to DSP1 33.333MHz
		//use 75 MHz clock  - clk_out1
	 OBUF OBUF_ppi0_clk_0(.I(clk_out1), .O(PPI0_CLK_0));
	 OBUF OBUF_ppi1_clk_0(.I(clk_out1), .O(PPI1_CLK_0));
	 OBUF OBUF_ppi0_clk_1(.I(clk_out1), .O(PPI0_CLK_1));
	 OBUF OBUF_ppi1_clk_1(.I(clk_out1), .O(PPI1_CLK_1));
*/
	 
/* 
		// use 60 MHz clock  -  clk_out3
	 OBUF OBUF_ppi0_clk_0(.I(clk_out3), .O(PPI0_CLK_0));
	 OBUF OBUF_ppi1_clk_0(.I(clk_out3), .O(PPI1_CLK_0));
	 OBUF OBUF_ppi0_clk_1(.I(clk_out3), .O(PPI0_CLK_1));
	 OBUF OBUF_ppi1_clk_1(.I(clk_out3), .O(PPI1_CLK_1));
*/
	 
	 //for dsp_jtag module
	 OBUF OBUF_emu_a(.I(emu_a), .O(EMU_A));
	 OBUF OBUF_dto_a(.I(tdo_a), .O(TDO_A));
	 OBUF OBUF_dsp_tdi_0(.I(dsp_tdi_0), .O(DSP_TDI_0));
	 OBUF OBUF_dsp_tms_0(.I(dsp_tms_0), .O(DSP_TMS_0));
	 OBUF OBUF_dsp_tck_0(.I(dsp_tck_0), .O(DSP_TCK_0));
	 OBUF OBUF_dsp_trst_0(.I(dsp_trst_0), .O(DSP_TRST_0));
	 
	 OBUF OBUF_dsp_tdi_1(.I(dsp_tdi_1), .O(DSP_TDI_1));
	 OBUF OBUF_dsp_tms_1(.I(dsp_tms_1), .O(DSP_TMS_1));
	 OBUF OBUF_dsp_tck_1(.I(dsp_tck_1), .O(DSP_TCK_1));
	 OBUF OBUF_dsp_trst_1(.I(dsp_trst_1), .O(DSP_TRST_1));
	 
	 //for dsp_control module
	 OBUF OBUF_dsp0_bmode0(.I(dsp0_bmode0), .O(BMODE0_0));
	 OBUF OBUF_dsp1_bmode0(.I(dsp1_bmode0), .O(BMODE0_1));
	 OBUF OBUF_dsp0_bmode1(.I(dsp0_bmode1), .O(BMODE1_0));
	 OBUF OBUF_dsp1_bmode1(.I(dsp1_bmode1), .O(BMODE1_1));
	 
	 OBUF OBUF_dsp0_nmi0(.I(dsp0_nmi0), .O(NMI0_0));
	 OBUF OBUF_dsp1_nmi0(.I(dsp1_nmi0), .O(NMI1_0));
	 OBUF OBUF_dsp0_nmi1(.I(dsp0_nmi1), .O(NMI0_1));
	 OBUF OBUF_dsp1_nmi1(.I(dsp1_nmi1), .O(NMI1_1));
	 
	 OBUF OBUF_dsp0_bus_ready(.I(dsp0_bus_ready), .O(BR0));
	 OBUF OBUF_dsp1_bus_ready(.I(dsp1_bus_ready), .O(BR1));
	 OBUF OBUF_dsp0_async_ready(.I(dsp0_async_ready), .O(ARDY0));
	 OBUF OBUF_dsp1_async_ready(.I(dsp1_async_ready), .O(ARDY1));
	 
						
			 
	// BUFG dspReset_clk(.I(clk_out2), .O(clk_dspReset));
	
	dsp_dcm inst_dsp_dcm(
		.CLK_IN1(BCLK_A),
		.CLK_OUT1(clk_out1),
		.CLK_OUT2(clk_out2),
		.CLK_OUT3(clk_out3),
		.RESET(reset),
		.LOCKED(locked)
		);
		
		
	dsp_reset inst_dsp_reset(
	.DSP_CLKIN(clk_out2),
	//.DSP_CLKIN(clk_dspReset),
	.LOCKED_IN(locked),
	.DSP0_RESET(dsp_rst0),
	.DSP1_RESET(dsp_rst1),
	.xDSP_RESET(xdsp_reset),
	.DSP_PLL_BYPASS(xbypass),
	.dsp_reset_button(dsp_reset_button)
	);
	
	dsp_jtag inst_dsp_jtag(
	.DSP_EMU_A(DSP_EMU_A),
	.TMS_A(TMS_A),
	.TCK_A(TCK_A),
	.TDI_A(TDI_A),
   .TDO_A(tdo_a),
	.EMU_A(emu_a),		//emulator signal from DSP to FPGA and from FPGA to JTA	
	
	
`ifndef TEST_CHOISE_II 
	 //FPGA-DSP CONNECTION ON DSP0
    .DSP_TDI_0(dsp_tdi_0),
    .DSP_TMS_0(dsp_tms_0),
    .DSP_TCK_0(dsp_tck_0),
    .DSP_TDO_0(DSP_TDO_0),
    .DSP_TRST_0(dsp_trst_0),  //JTAG reset to dsp0
`endif
	 
`ifndef TEST_CHOISE_I	
	//FPGA-DSP CONNECTION ON DSP1
    .DSP_TDI_1(dsp_tdi_1),
    .DSP_TMS_1(dsp_tms_1),
    .DSP_TCK_1(dsp_tck_1),
    .DSP_TDO_1(DSP_TDO_1),
    .DSP_TRST_1(dsp_trst_1),	//JTAG reset to dsp1
    
`endif
	.TRST_A(TRST_A)		//JTAG reset signal
);
	
	
	
//********** dsp_control *********************

	dsp_control inst_dsp_control(
		.DSP0_BMODE0(dsp0_bmode0),
		.DSP0_BMODE1(dsp0_bmode1),
		.DSP1_BMODE0(dsp1_bmode0),
		.DSP1_BMODE1(dsp1_bmode1),
		.DSP0_BYPASS(dsp0_bypass),
		.DSP1_BYPASS(dsp1_bypass),
		.xBYPASS(xbypass),
		.DSP0_NMI0(dsp0_nmi0),
		.DSP1_NMI0(dsp1_nmi0),
		.DSP0_NMI1(dsp0_nmi1),
		.DSP1_NMI1(dsp1_nmi1),
		.DSP0_BUS_READY(dsp0_bus_ready),		
		.DSP1_BUS_READY(dsp1_bus_ready),		
		.DSP0_ASYNC_READY(dsp0_async_ready),	//???
		.DSP1_ASYNC_READY(dsp1_async_ready)
		);
		
	
	
		 
	 //********************************************
	 //********* debugging code *************
	 //********************************************
	 
				
	
	//clk_out1 to MON_A12		
	ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_MON_A12_clk_out1(
			.Q(MON_A12),		//DDR output data to dsp
			.C0(clk_out1),		//1 bit clock input
			.C1(~clk_out1),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);
	
		
			//Clock clk_out2 to MON_A10
	ODDR2 #(
			.DDR_ALIGNMENT("NONE"),  //Sets output alignment to "NONE", "C0", or "C1"
			.INIT(1'b0),				 //Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("SYNC")			 //Specifies "SYNC" OR "ASYNC"  set/reset
			)
			ODDR2_MON_A10_clk_out2(
			.Q(MON_A10),		//DDR output data to dsp
			.C0(clk_out2),		//1 bit clock input
			.C1(~clk_out2),	//inverted clock input
			.CE(1'b1),
			.D0(1'b1),
			.D1(1'b0),
			.R(1'b0),
			.S(1'b0)
			);
					
				//assign MON_A14 = dsp_rst0;	//ch7
				//assign MON_A12 = clk_out1;	//ch6
				//assign MON_A12 = clk_out3;	//ch6
				//assign MON_A10 = clk_out2;	//ch5
				//assign MON_A8 = TCK_A;		//ch4
				assign MON_A8 = dsp_rst0;		//ch4
				//assign MON_A6 = TMS_A;		//ch3
				assign MON_A6 = dsp_rst1;   //ch3
				assign MON_A4 = tdo_a;		//ch2
				assign MON_A2 = TDI_A;		//ch1
				assign MON_A0 = emu_a;    	//ch0
		  

endmodule
