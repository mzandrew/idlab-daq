`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:49:42 06/02/2011
// Design Name:   data_repeater_fifo
// Module Name:   /home/zihangao/DATA_NT/Work/cPCI/firmware/src/BUS//test_data_repeater_fifo.v
// Project Name:  par
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_repeater_fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_data_repeater_fifo;

	// Inputs
	reg reset_i;
	reg rd_clk_i;
	reg fifo_rd_i;
	reg wr_clk_i;
	reg fifo_wr_i;
	reg [31:0] fifo_wr_dat_i;

	// Outputs
	wire [31:0] fifo_rd_dat_o;
	wire fifo_rd_dat_valid_o;
	wire fifo_wr_full_o;

	// Instantiate the Unit Under Test (UUT)
	data_repeater_fifo uut (
		.reset_i(reset_i), 
		.rd_clk_i(rd_clk_i), 
		.fifo_rd_i(fifo_rd_i), 
		.fifo_rd_dat_o(fifo_rd_dat_o), 
		.fifo_rd_dat_valid_o(fifo_rd_dat_valid_o), 
		.wr_clk_i(wr_clk_i), 
		.fifo_wr_i(fifo_wr_i), 
		.fifo_wr_dat_i(fifo_wr_dat_i), 
		.fifo_wr_full_o(fifo_wr_full_o)
	);

	//clock
	always@(*) begin
		if(reset_i)
			rd_clk_i<=0;
		else
			# 5 rd_clk_i<=~rd_clk_i;
	end
	
	always@(*) begin
		if(reset_i)
			wr_clk_i<=1;
		else
			# 5 wr_clk_i<=~wr_clk_i;
	end

	initial begin
		// Initialize Inputs
		reset_i = 1;
		
		fifo_rd_i = 0;
		
		fifo_wr_i = 0;
		fifo_wr_dat_i = 0;

		// Wait 100 ns for global reset to finish
		#100;        
		// Add stimulus here
		#52; //for reset
		reset_i = 0;
		#50;
		//write
		repeat(10) begin 
			fifo_wr_i=1;
			fifo_wr_dat_i=fifo_wr_dat_i+1;
			#10;
		end
		fifo_wr_i=0;
		#20;
		//read
		repeat(5) begin
			fifo_rd_i=1;
			#10;
		end	
		fifo_rd_i=0;
		#50;
		repeat(5) begin
			fifo_rd_i=1;
			#10;
		end
	end
      
endmodule

