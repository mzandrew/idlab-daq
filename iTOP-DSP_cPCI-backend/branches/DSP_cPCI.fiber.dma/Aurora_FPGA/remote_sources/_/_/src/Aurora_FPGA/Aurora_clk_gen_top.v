`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:49 06/06/2011 
// Design Name: 
// Module Name:    Aurora_clk_gen_top 
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
module Aurora_clk_gen_top(
  // Clock in ports
  input         CLK_IN1,
  // Clock out ports
  output        CLK_OUT1,
  output        CLK_OUT2,
  // Status and control signals
  input         RESET,
  output        LOCKED,
  output 	WB_CLK_SLAVE,
  output 	WB_RST,
  output 	WB_CLK_MASTER,
  output 	WB_CLK_DIVIDE,
  output		WB_RST_DELAY
    );

 wire locked_in;
 wire wb_clk_slave_in;
 wire wb_clk_master_in;
 wire wb_clk_divide_in;
 wire wb_reset;
 reg wb_reset_delay;
 reg[11:0] wb_reset_cnt;
 reg[7:0] dcm_rst_cnt;
 wire dcm_rst_in;
 
   Aurora_FPGA_clock u_Aurora_FPGA_clock
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),      // IN
    // Clock out ports
    .CLK_OUT1           (wb_clk_slave_in),     // OUT
    .CLK_OUT2           (wb_clk_divide_in),     // OUT
    // Status and control signals
    .RESET              (dcm_rst_in),        // IN
    .LOCKED             (locked_in),
	 .CLK_IN_BUF			(wb_clk_master_in));      // OUT
	 
 assign LOCKED=locked_in;
 assign WB_CLK_SLAVE=wb_clk_slave_in;
 assign WB_CLK_MASTER=wb_clk_master_in;
 assign wb_reset=RESET|(~locked_in);
 assign WB_RST=wb_reset;
 assign WB_CLK_DIVIDE=wb_clk_divide_in;
 
 initial begin
      dcm_rst_cnt<=8'b0;
 end
 
 always@(posedge wb_clk_master_in) begin
    if(RESET) 
      dcm_rst_cnt<=8'b0;
    else if(dcm_rst_cnt[7]==1'b0)
      dcm_rst_cnt<=dcm_rst_cnt+1'b1; 
	 else
		dcm_rst_cnt<=dcm_rst_cnt;
 end
 
 assign dcm_rst_in=(~dcm_rst_cnt[7]);
 
 
 initial begin
	wb_reset_cnt<=0;
 end
 
 always@(posedge wb_clk_slave_in) begin
	if(wb_reset)
		wb_reset_cnt<=0;
	else if(wb_reset_cnt[11]==1'b0)
		wb_reset_cnt<=wb_reset_cnt+1'b1;
	else
		wb_reset_cnt<=wb_reset_cnt;
 end
 
 initial begin
	wb_reset_delay<=1'b1;
 end
 
 always@(posedge wb_clk_slave_in) begin
	if(wb_reset)
		wb_reset_delay<=1'b1;
	else
		wb_reset_delay<=(~wb_reset_cnt[11]);
 end
 
 assign WB_RST_DELAY=wb_reset_delay; 

endmodule
