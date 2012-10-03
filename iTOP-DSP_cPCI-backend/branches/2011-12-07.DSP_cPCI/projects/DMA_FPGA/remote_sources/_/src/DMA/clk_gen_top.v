`timescale 1ps/1ps


module clk_gen_top
 (// Clock in ports
  input         CLK_IN1,
  // Clock out ports
  output        CLK_OUT1,
  output        CLK_OUT2,
  // Status and control signals
  input         RESET,
  output        LOCKED,
  output 	WB_CLK,
  output 	WB_RST,
  output 	PCI_CLK,
  output 	WB_CLK_2x,
  output		WB_RST_DELAY
 );
 
  wire pci_clk_in;
  wire locked_in;
  wire wb_clk_in;
  wire wb_clk_2x_in;
  wire wb_reset;
  reg[11:0] wb_reset_cnt;
  reg[7:0] dcm_rst_cnt;
  wire dcm_rst_in;
  
	clk_gen u_clk_gen
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),      // IN
    // Clock out ports
    .CLK_OUT1           (wb_clk_in),     // OUT
    .CLK_OUT2           (wb_clk_2x_in),     // OUT
	 .CLK_IN_BUF			(pci_clk_in),
    // Status and control signals
    .RESET              (dcm_rst_in),        // IN
    .LOCKED             (locked_in),       // OUT
    .CLK_VALID          ());   // OUT

 initial begin
	dcm_rst_cnt<=8'b0;
 end 
 
 always@(posedge pci_clk_in) begin
    if(RESET) 
      dcm_rst_cnt<=8'b0;
    else if(dcm_rst_cnt[7]==1'b0)
      dcm_rst_cnt<=dcm_rst_cnt+1'b1; 
	 else
		dcm_rst_cnt<=dcm_rst_cnt;
 end
 
 assign dcm_rst_in=(~dcm_rst_cnt[7]);

 assign PCI_CLK=pci_clk_in;
 assign WB_CLK=wb_clk_in;
 assign WB_CLK_2x=wb_clk_2x_in;
 assign wb_reset=RESET|(~locked_in);
 assign WB_RST=wb_reset;

 initial begin
	wb_reset_cnt<=0;
 end
 
 always@(posedge wb_clk_in) begin
	if(wb_reset)
		wb_reset_cnt<=12'b0;
	else if(wb_reset_cnt[11]==1'b0)
		wb_reset_cnt<=wb_reset_cnt+1'b1;
	else
		wb_reset_cnt<=wb_reset_cnt;
 end
 
 assign WB_RST_DELAY=(~wb_reset_cnt[11]);

endmodule
