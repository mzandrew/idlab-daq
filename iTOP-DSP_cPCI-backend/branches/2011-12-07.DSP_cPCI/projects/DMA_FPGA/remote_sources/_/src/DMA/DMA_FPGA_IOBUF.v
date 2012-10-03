`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:53 06/08/2011 
// Design Name: 
// Module Name:    DMA_FPGA_IOBUF 
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
module DMA_FPGA_IOBUF(
					input bus_ad_out_en,
					output[31:0] bus_ad_in,
					
					input [31:0] bus_ad_out,
					
					output bus_stb,
					input bus_ack,
					output bus_we,
					
					input bus_req_r_1,
					input bus_req_r_2,
					input bus_req_w_1,
					input bus_req_w_2,
					input clock,
					
					//input clock_source,
					
					inout [31:0] BUS_AD_PAD,					
					
					input BUS_STB_PAD,
					output BUS_ACK_PAD,
					input BUS_WE_PAD,
					
					output BUS_REQ_R_1_PAD,					
					output BUS_REQ_R_2_PAD,
					output BUS_REQ_W_1_PAD,					
					output BUS_REQ_W_2_PAD,					
					output CLOCK_PAD,

					input clk_i,
					
					input BUS_M_RDY_PAD,
					output bus_m_rdy,
					
					input bus_s_rdy,
					output BUS_S_RDY_PAD,				

					input bus_abort,
					output BUS_ABORT_PAD
					
					
    );
	 
	 wire clock_in;
	 
	 //wire clock_source_in;
	 
	 wire[31:0] bus_ad_in_latch;
	 wire[31:0] bus_ad_pad_latch;
	 wire[31:0] bus_ad_out_en_latch;
	 wire bus_stb_latch;
	 wire bus_ack_latch;
	 wire bus_we_latch;
	 wire bus_req_r_1_latch;
	 wire bus_req_r_2_latch;
	 wire bus_req_w_1_latch;
	 wire bus_req_w_2_latch;
	 wire bus_s_rdy_latch;
	 wire bus_abort_latch;	 
	 wire bus_m_rdy_latch;
	 
	 
	 generate 
	genvar bus_ad_index;
	for(bus_ad_index=0;bus_ad_index<32;bus_ad_index=bus_ad_index+1) begin: BUS_AD_BUF_LOOP
		IBUF BUS_AD_IN_BUF(.I(BUS_AD_PAD[bus_ad_index]),.O(bus_ad_in_latch[bus_ad_index]));				
		(* IOB="TRUE" *) FD #(.INIT(0)) BUS_AD_IN_FF(.D(bus_ad_in_latch[bus_ad_index]),.C(clk_i),.Q(bus_ad_in[bus_ad_index]));
		
		(*IOB="TRUE"*) FD #(.INIT(0)) BUS_AD_OUT_FF(.D(bus_ad_out[bus_ad_index]),.C(clk_i),.Q(bus_ad_pad_latch[bus_ad_index]));
		(*IOB="TRUE"*) (* equivalent_register_removal = "no" *) FD #(.INIT(0)) BUS_AD_EN_FF(.D(~bus_ad_out_en),.C(clk_i),.Q(bus_ad_out_en_latch[bus_ad_index]));
		OBUFT BUS_AD_OUT_BUF(.T(bus_ad_out_en_latch[bus_ad_index]),.I(bus_ad_pad_latch[bus_ad_index]),.O(BUS_AD_PAD[bus_ad_index]));		
	end
	endgenerate
	
	IBUF BUS_STB_BUF(.I(BUS_STB_PAD),.O(bus_stb_latch));
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_STB_LATCH(.D(bus_stb_latch),.C(clk_i),.Q(bus_stb)); 
	
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_ACK_LATCH(.D(bus_ack),.C(clk_i),.Q(bus_ack_latch));
	OBUF BUS_ACK_BUF(.I(bus_ack_latch),.O(BUS_ACK_PAD));
	
	IBUF BUS_WE_BUF(.I(BUS_WE_PAD),.O(bus_we_latch));
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_WE_LATCH(.D(bus_we_latch),.C(clk_i),.Q(bus_we));	
	
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_REQ_R_1_LATCH(.D(bus_req_r_1),.C(clk_i),.Q(bus_req_r_1_latch));
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_REQ_R_2_LATCH(.D(bus_req_r_2),.C(clk_i),.Q(bus_req_r_2_latch));
	OBUF BUS_REQ_R_1_BUF(.I(bus_req_r_1_latch),.O(BUS_REQ_R_1_PAD));
	OBUF BUS_REQ_R_2_BUF(.I(bus_req_r_2_latch),.O(BUS_REQ_R_2_PAD));
	
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_REQ_W_1_LATCH(.D(bus_req_w_1),.C(clk_i),.Q(bus_req_w_1_latch)); 
	OBUF BUS_REQ_W_1_BUF(.I(bus_req_w_1_latch),.O(BUS_REQ_W_1_PAD));
	
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_REQ_W_2_LATCH(.D(bus_req_w_2),.C(clk_i),.Q(bus_req_w_2_latch)); 
	OBUF BUS_REQ_W_2_BUF(.I(bus_req_w_2_latch),.O(BUS_REQ_W_2_PAD));
	
	OBUF BUS_S_RDY_BUF(.I(bus_s_rdy_latch),.O(BUS_S_RDY_PAD));
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_S_RDY_LATCH(.D(bus_s_rdy),.C(clk_i),.Q(bus_s_rdy_latch));
	
	OBUF BUS_ABORT_BUF(.I(bus_abort_latch),.O(BUS_ABORT_PAD));
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_ABORT_LATCH(.D(bus_abort),.C(clk_i),.Q(bus_abort_latch));
	
	IBUF BUS_M_RDY_BUF(.I(BUS_M_RDY_PAD),.O(bus_m_rdy_latch));
	(*IOB="TRUE"*) FD #(.INIT(0)) BUS_M_RDY_LATCH(.D(bus_m_rdy_latch),.C(clk_i),.Q(bus_m_rdy));
	
	ODDR2 #(
   // The following parameters specify the behavior
   // of the component.
   .DDR_ALIGNMENT("NONE"), // Sets output alignment 
                           // to "NONE", "C0" or "C1"
   .INIT(1'b0),    // Sets initial state of the Q  
                   //   output to 1'b0 or 1'b1
   .SRTYPE("SYNC")) // Specifies "SYNC" or "ASYNC" 
                   //   set/reset
	ODDR2_inst (
   .Q(clock_in),   // 1-bit DDR output data
   .C0(clock), // 1-bit clock input
   .C1(~clock), // 1-bit clock input
   .CE(1'b1), // 1-bit clock enable input
   .D0(1'b1), // 1-bit data input (associated with C0)
   .D1(1'b0), // 1-bit data input (associated with C1)
   .R(1'b0),   // 1-bit reset input
   .S(1'b0)    // 1-bit set input
);

   OBUF BUS_CLOCK_BUF(.I(clock_in),.O(CLOCK_PAD));
	
	//IBUFG clock_source_buf(.I(clock_source),.O(clock_source_in));
	
	
	

endmodule
