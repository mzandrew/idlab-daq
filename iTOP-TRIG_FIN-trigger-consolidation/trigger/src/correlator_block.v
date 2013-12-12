`timescale 1ns/1ps

module correlator_block(

		input clk,
		input rst,

		input [1:0] cmd_i,
		input [5:0] addr_i,

		output [26:0] max_sum,
		output [7:0]  max_sumid,
		output max_sum_valid
    );

parameter ROM0_coe = "NULL.mif";
parameter ROM1_coe = "NULL.mif";
parameter ROM2_coe = "NULL.mif";
parameter ROM3_coe = "NULL.mif";
parameter ROM4_coe = "NULL.mif";
parameter ROM5_coe = "NULL.mif";
parameter ROM6_coe = "NULL.mif";
parameter ROM7_coe = "NULL.mif";
parameter ROM8_coe = "NULL.mif";
parameter ROM9_coe = "NULL.mif";

parameter ID_0_0 = 8'h00;
parameter ID_0_1 = 8'h01;
parameter ID_0_2 = 8'h02;
parameter ID_0_3 = 8'h04;
parameter ID_0_4 = 8'h08;
parameter ID_0_5 = 8'h10;
parameter ID_0_6 = 8'h20;
parameter ID_0_7 = 8'h40;
parameter ID_0_8 = 8'h80;
parameter ID_0_9 = 8'h11;

parameter ID_1_0 = 8'h10;
parameter ID_1_1 = 8'hF1;
parameter ID_1_2 = 8'h12;
parameter ID_1_3 = 8'h14;
parameter ID_1_4 = 8'h18;
parameter ID_1_5 = 8'h18;
parameter ID_1_6 = 8'h22;
parameter ID_1_7 = 8'h44;
parameter ID_1_8 = 8'h88;
parameter ID_1_9 = 8'hFF;


wire [269:0] sums;
wire [79:0]  sumids;
wire [9:0] sum_valid;

correlator #(.CORR_ROM_coe(ROM0_coe),
	     .ID_0(ID_0_0),
	     .ID_1(ID_1_0) ) 
		u_correlator_0(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*0+26:27*0]),
  			   .sumid_o(sumids[8*0+7:8*0]),
			   .sum_valid_o(sum_valid[0])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM1_coe),
	     .ID_0(ID_0_1),
	     .ID_1(ID_1_1) ) 
		u_correlator_1(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*1+26:27*1]),
  			   .sumid_o(sumids[8*1+7:8*1]),
			   .sum_valid_o(sum_valid[1])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM2_coe),
	     .ID_0(ID_0_2),
	     .ID_1(ID_1_2) ) 
		u_correlator_2(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*2+26:27*2]),
  			   .sumid_o(sumids[8*2+7:8*2]),
			   .sum_valid_o(sum_valid[2])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM3_coe),
	     .ID_0(ID_0_3),
	     .ID_1(ID_1_3) ) 
		u_correlator_3(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*3+26:27*3]),
  			   .sumid_o(sumids[8*3+7:8*3]),
			   .sum_valid_o(sum_valid[3])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM4_coe),
	     .ID_0(ID_0_4),
	     .ID_1(ID_1_4) ) 
		u_correlator_4(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*4+26:27*4]),
  			   .sumid_o(sumids[8*4+7:8*4]),
			   .sum_valid_o(sum_valid[4])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM5_coe),
	     .ID_0(ID_0_5),
	     .ID_1(ID_1_5) ) 
		u_correlator_5(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*5+26:27*5]),
  			   .sumid_o(sumids[8*5+7:8*5]),
			   .sum_valid_o(sum_valid[5])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM6_coe),
	     .ID_0(ID_0_6),
	     .ID_1(ID_1_6) ) 
		u_correlator_6(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*6+26:27*6]),
  			   .sumid_o(sumids[8*6+7:8*6]),
			   .sum_valid_o(sum_valid[6])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM7_coe),
	     .ID_0(ID_0_7),
	     .ID_1(ID_1_7) ) 
		u_correlator_7(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*7+26:27*7]),
  			   .sumid_o(sumids[8*7+7:8*7]),
			   .sum_valid_o(sum_valid[7])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM8_coe),
	     .ID_0(ID_0_8),
	     .ID_1(ID_1_8) ) 
		u_correlator_8(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*8+26:27*8]),
  			   .sumid_o(sumids[8*8+7:8*8]),
			   .sum_valid_o(sum_valid[8])
   			  );   			  

correlator #(.CORR_ROM_coe(ROM9_coe),
	     .ID_0(ID_0_9),
	     .ID_1(ID_1_9) ) 
		u_correlator_9(
   			   .clk(clk),
   			   .rst(rst),
			   .cmd_i(cmd_i),
   			   .addr_i(addr_i),   			   
   			   .sum_o(sums[27*9+26:27*9]),
  			   .sumid_o(sumids[8*9+7:8*9]),
			   .sum_valid_o(sum_valid[9])
   			  );   			  

pipeline_minmax_core#(.D_WIDTH(27),.M_WIDTH(8),.MINMAX(0),.CNO(10),.LATENCY_UNIT(1))
	u_max(
	 .clk(clk),
	 .arst(rst),
	 .data_array(sums),
	 .m_array(sumids),
	 .valid_array(sum_valid),
	 .result(max_sum),
	 .result_m(max_sumid),
	 .result_valid(max_sum_valid)
	);

endmodule


