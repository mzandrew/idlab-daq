

//NOTE: This module is developed for the "2ns" binned trigger, 
//i.e., the ROM files are prepared for this kind of trigger, and
//the addressing mode of the ROM is also for the "2ns" binned case.

`timescale 1ns/1ps

module trigger(
		input clk,
		input rst,

		input [31:0] rdfifo_dat,
		input rdfifo_empty,
		output rdfifo_rden,

		output [31:0] wrfifo_dat,
		input wrfifo_prog_full,
		output wrfifo_wren
		);
parameter RD_TIMEOUT=10; // Allowed max value is {10{1'b1}}, allowed minimum value is 1
parameter MAX_EVENT=256; // Allowed max value is {10{1'b1}}, allowed minimum value is 1
parameter SUM_TRESHOLD=0; //sum value threshold

localparam IDLE=0, START=1, CORR1=2, CORR2=3, HOLD=4, READY=5, FINISH=6;
reg[2:0] state;

//rdfifo_empty timeout
reg[9:0] timeout_cnt;
wire rdfifo_timeout;
reg rdfifo_timeout_reg;
always@(posedge clk) begin
	if(rst)
		timeout_cnt<=0;
	else if(state!=HOLD)
		timeout_cnt<=0;
	else if(rdfifo_timeout)
		timeout_cnt<=timeout_cnt;
	else 
		timeout_cnt<=timeout_cnt+1'b1;
end

assign rdfifo_timeout=(timeout_cnt==RD_TIMEOUT)? 1'b1: 1'b0;

always@(posedge clk) begin
	if(rst)
		rdfifo_timeout_reg<=0;
	else
		rdfifo_timeout_reg<=rdfifo_timeout;
end

//event overflow
reg[9:0] event_cnt;
wire event_overflow;
reg event_overflow_reg;
always@(posedge clk) begin
	if(rst)
		event_cnt<=0;
	else if(state==IDLE)
		event_cnt<=0;
	else if(state!=CORR1 || event_overflow==1'b1)
		event_cnt<=event_cnt;
	else 
		event_cnt<=event_cnt+1;
end

assign event_overflow=(event_cnt==MAX_EVENT)? 1'b1: 1'b0;

always@(posedge clk) begin
	if(rst)
		event_overflow_reg<=0;
	else
		event_overflow_reg<=event_overflow;
end

//next round OK
reg event_almost_overflow_reg;
always@(posedge clk) begin
	if(rst)
		event_almost_overflow_reg<=1'b0;
	else if(event_cnt==(MAX_EVENT-1))
		event_almost_overflow_reg<=1'b1;
	else
		event_almost_overflow_reg<=1'b0;
end

reg next_round_ok_reg;
always@(posedge clk) begin
	if(rst)
		next_round_ok_reg<=1'b0;
	else if(state==CORR1 && (event_almost_overflow_reg==1'b1 || rdfifo_empty==1'b1))
		next_round_ok_reg<=1'b0;
	else
		next_round_ok_reg<=1'b1;
end

//start data reg
reg [31:0] start_data_reg;
always@(posedge clk) begin
	if(rst)
		start_data_reg<=0;
	else if(state==START)
		start_data_reg<=rdfifo_dat;
end

//current data reg
reg [31:0] current_data_reg;
always@(posedge clk) begin
	if(rst)
		current_data_reg<=0;
	else if(state==START || (state==CORR2 && next_round_ok_reg==1'b1) || (state==READY))
		current_data_reg<=rdfifo_dat;
end

//diff data reg
reg [31:0] diff_data_reg;
always@(posedge clk) begin
	if(rst)
		diff_data_reg<=0;
	else
		diff_data_reg<=current_data_reg[31:1]-start_data_reg[31:1]; //NOTE here: the binning operattion in done by ignoring the least significant bit
end

always@(posedge clk) begin
	if(rst)
		state<=IDLE;
	else begin
		case(state)
			IDLE: 	begin
					if((~rdfifo_empty)&(~wrfifo_prog_full))
						state<=START;
					else
						state<=state;
				end
			START:  begin
					state<=CORR1;
				end
			CORR1:	begin
					state<=CORR2;
				end
			CORR2:	begin
					if(next_round_ok_reg)
						state<= CORR1;
					else
						state<=HOLD;
				end
			HOLD:	begin
					if(rdfifo_timeout_reg | event_overflow_reg)
						state<=FINISH;
					else if(~rdfifo_empty)
						state<=READY;
					else
						state<=state;
				end
			READY: 	begin
					state<=CORR1;
				end
			FINISH: begin
					state<=IDLE;
				end
			default:begin
					state<=IDLE;
				end
		endcase
	end
end

//rdfifo_rden
assign rdfifo_rden=(state==IDLE)? ((~rdfifo_empty)&(~wrfifo_prog_full)):
		   (state==CORR1)?((~rdfifo_empty)&(~event_almost_overflow_reg)):
		   (state==HOLD)? ((~rdfifo_timeout_reg)&(~event_overflow_reg)&(~rdfifo_empty)):1'b0;

//cmd reg
reg[1:0] cmd_reg;
always@(posedge clk) begin
	if(rst)
		cmd_reg<=2'b11; //clr 
	else if(state==IDLE)
		cmd_reg<=2'b11; //clr 
	else if(state==CORR1 || state==CORR2) 
		cmd_reg<=2'b01; //correlation
	else if((state==HOLD && (rdfifo_timeout_reg==1'b1 || event_overflow_reg==1'b1)) || (state==FINISH))
		cmd_reg<=2'b10; //finish the current burst
	else 
		cmd_reg<=2'b00; //hold
end

//trigger data path
wire [26:0] max_sum;
wire max_sum_valid;
wire [7:0] max_sumid;
trigger_data_path #(
			.B0_R0("../../trigger/src/ROM/B0_R0.coe"),
			.B0_R1("../../trigger/src/ROM/B0_R1.coe"),
			.B0_R2("../../trigger/src/ROM/B0_R2.coe"),
			.B0_R3("../../trigger/src/ROM/B0_R3.coe"),
			.B0_R4("../../trigger/src/ROM/B0_R4.coe"),
			.B0_R5("../../trigger/src/ROM/B0_R5.coe"),
			.B0_R6("../../trigger/src/ROM/B0_R6.coe"),
			.B0_R7("../../trigger/src/ROM/B0_R7.coe"),
			.B0_R8("../../trigger/src/ROM/B0_R8.coe"),
			.B0_R9("../../trigger/src/ROM/B0_R9.coe"),
			.ID_B0_R0_0(0),
			.ID_B0_R0_1(2),
			.ID_B0_R1_0(4),
			.ID_B0_R1_1(6),
			.ID_B0_R2_0(8),
			.ID_B0_R2_1(10),
			.ID_B0_R3_0(12),
			.ID_B0_R3_1(14),
			.ID_B0_R4_0(16),
			.ID_B0_R4_1(18),
			.ID_B0_R5_0(20),
			.ID_B0_R5_1(22),
			.ID_B0_R6_0(24),
			.ID_B0_R6_1(26),
			.ID_B0_R7_0(28),
			.ID_B0_R7_1(30),
			.ID_B0_R8_0(32),
			.ID_B0_R8_1(34),
			.ID_B0_R9_0(36),
			.ID_B0_R9_1(38),
			
			.B1_R0("../../trigger/src/ROM/B1_R0.coe"),
			.B1_R1("../../trigger/src/ROM/B1_R1.coe"),
			.B1_R2("../../trigger/src/ROM/B1_R2.coe"),
			.B1_R3("../../trigger/src/ROM/B1_R3.coe"),
			.B1_R4("../../trigger/src/ROM/B1_R4.coe"),
			.B1_R5("../../trigger/src/ROM/B1_R5.coe"),
			.B1_R6("../../trigger/src/ROM/B1_R6.coe"),
			.B1_R7("../../trigger/src/ROM/B1_R7.coe"),
			.B1_R8("../../trigger/src/ROM/B1_R8.coe"),
			.B1_R9("../../trigger/src/ROM/B1_R9.coe"),
			.ID_B1_R0_0(0),
			.ID_B1_R0_1(2),
			.ID_B1_R1_0(4),
			.ID_B1_R1_1(6),
			.ID_B1_R2_0(8),
			.ID_B1_R2_1(10),
			.ID_B1_R3_0(12),
			.ID_B1_R3_1(14),
			.ID_B1_R4_0(16),
			.ID_B1_R4_1(18),
			.ID_B1_R5_0(20),
			.ID_B1_R5_1(22),
			.ID_B1_R6_0(24),
			.ID_B1_R6_1(26),
			.ID_B1_R7_0(28),
			.ID_B1_R7_1(30),
			.ID_B1_R8_0(32),
			.ID_B1_R8_1(34),
			.ID_B1_R9_0(36),
			.ID_B1_R9_1(38),
			
			.B2_R0("../../trigger/src/ROM/B2_R0.coe"),
			.B2_R1("../../trigger/src/ROM/B2_R1.coe"),
			.B2_R2("../../trigger/src/ROM/B2_R2.coe"),
			.B2_R3("../../trigger/src/ROM/B2_R3.coe"),
			.B2_R4("../../trigger/src/ROM/B2_R4.coe"),
			.B2_R5("../../trigger/src/ROM/B2_R5.coe"),
			.B2_R6("../../trigger/src/ROM/B2_R6.coe"),
			.B2_R7("../../trigger/src/ROM/B2_R7.coe"),
			.B2_R8("../../trigger/src/ROM/B2_R8.coe"),
			.B2_R9("../../trigger/src/ROM/B2_R9.coe"),
			.ID_B2_R0_0(0),
			.ID_B2_R0_1(2),
			.ID_B2_R1_0(4),
			.ID_B2_R1_1(6),
			.ID_B2_R2_0(8),
			.ID_B2_R2_1(10),
			.ID_B2_R3_0(12),
			.ID_B2_R3_1(14),
			.ID_B2_R4_0(16),
			.ID_B2_R4_1(18),
			.ID_B2_R5_0(20),
			.ID_B2_R5_1(22),
			.ID_B2_R6_0(24),
			.ID_B2_R6_1(26),
			.ID_B2_R7_0(28),
			.ID_B2_R7_1(30),
			.ID_B2_R8_0(32),
			.ID_B2_R8_1(34),
			.ID_B2_R9_0(36),
			.ID_B2_R9_1(38),
			
			.B3_R0("../../trigger/src/ROM/B3_R0.coe"),
			.B3_R1("../../trigger/src/ROM/B3_R1.coe"),
			.B3_R2("../../trigger/src/ROM/B3_R2.coe"),
			.B3_R3("../../trigger/src/ROM/B3_R3.coe"),
			.B3_R4("../../trigger/src/ROM/B3_R4.coe"),
			.B3_R5("../../trigger/src/ROM/B3_R5.coe"),
			.B3_R6("../../trigger/src/ROM/B3_R6.coe"),
			.B3_R7("../../trigger/src/ROM/B3_R7.coe"),
			.B3_R8("../../trigger/src/ROM/B3_R8.coe"),
			.B3_R9("../../trigger/src/ROM/B3_R9.coe"),
			.ID_B3_R0_0(0),
			.ID_B3_R0_1(2),
			.ID_B3_R1_0(4),
			.ID_B3_R1_1(6),
			.ID_B3_R2_0(8),
			.ID_B3_R2_1(10),
			.ID_B3_R3_0(12),
			.ID_B3_R3_1(14),
			.ID_B3_R4_0(16),
			.ID_B3_R4_1(18),
			.ID_B3_R5_0(20),
			.ID_B3_R5_1(22),
			.ID_B3_R6_0(24),
			.ID_B3_R6_1(26),
			.ID_B3_R7_0(28),
			.ID_B3_R7_1(30),
			.ID_B3_R8_0(32),
			.ID_B3_R8_1(34),
			.ID_B3_R9_0(36),
			.ID_B3_R9_1(38),
			
			.B4_R0("../../trigger/src/ROM/B4_R0.coe"),
			.B4_R1("../../trigger/src/ROM/B4_R1.coe"),
			.B4_R2("../../trigger/src/ROM/B4_R2.coe"),
			.B4_R3("../../trigger/src/ROM/B4_R3.coe"),
			.B4_R4("../../trigger/src/ROM/B4_R4.coe"),
			.B4_R5("../../trigger/src/ROM/B4_R5.coe"),
			.B4_R6("../../trigger/src/ROM/B4_R6.coe"),
			.B4_R7("../../trigger/src/ROM/B4_R7.coe"),
			.B4_R8("../../trigger/src/ROM/B4_R8.coe"),
			.B4_R9("../../trigger/src/ROM/B4_R9.coe"),
			.ID_B4_R0_0(0),
			.ID_B4_R0_1(2),
			.ID_B4_R1_0(4),
			.ID_B4_R1_1(6),
			.ID_B4_R2_0(8),
			.ID_B4_R2_1(10),
			.ID_B4_R3_0(12),
			.ID_B4_R3_1(14),
			.ID_B4_R4_0(16),
			.ID_B4_R4_1(18),
			.ID_B4_R5_0(20),
			.ID_B4_R5_1(22),
			.ID_B4_R6_0(24),
			.ID_B4_R6_1(26),
			.ID_B4_R7_0(28),
			.ID_B4_R7_1(30),
			.ID_B4_R8_0(32),
			.ID_B4_R8_1(34),
			.ID_B4_R9_0(36),
			.ID_B4_R9_1(38),
			
			.B5_R0("../../trigger/src/ROM/B5_R0.coe"),
			.B5_R1("../../trigger/src/ROM/B5_R1.coe"),
			.B5_R2("../../trigger/src/ROM/B5_R2.coe"),
			.B5_R3("../../trigger/src/ROM/B5_R3.coe"),
			.B5_R4("../../trigger/src/ROM/B5_R4.coe"),
			.B5_R5("../../trigger/src/ROM/B5_R5.coe"),
			.B5_R6("../../trigger/src/ROM/B5_R6.coe"),
			.B5_R7("../../trigger/src/ROM/B5_R7.coe"),
			.B5_R8("../../trigger/src/ROM/B5_R8.coe"),
			.B5_R9("../../trigger/src/ROM/B5_R9.coe"),
			.ID_B5_R0_0(0),
			.ID_B5_R0_1(2),
			.ID_B5_R1_0(4),
			.ID_B5_R1_1(6),
			.ID_B5_R2_0(8),
			.ID_B5_R2_1(10),
			.ID_B5_R3_0(12),
			.ID_B5_R3_1(14),
			.ID_B5_R4_0(16),
			.ID_B5_R4_1(18),
			.ID_B5_R5_0(20),
			.ID_B5_R5_1(22),
			.ID_B5_R6_0(24),
			.ID_B5_R6_1(26),
			.ID_B5_R7_0(28),
			.ID_B5_R7_1(30),
			.ID_B5_R8_0(32),
			.ID_B5_R8_1(34),
			.ID_B5_R9_0(36),
			.ID_B5_R9_1(38),
			
			.B6_R0("../../trigger/src/ROM/B6_R0.coe"),
			.B6_R1("../../trigger/src/ROM/B6_R1.coe"),
			.B6_R2("../../trigger/src/ROM/B6_R2.coe"),
			.B6_R3("../../trigger/src/ROM/B6_R3.coe"),
			.B6_R4("../../trigger/src/ROM/B6_R4.coe"),
			.B6_R5("../../trigger/src/ROM/B6_R5.coe"),
			.B6_R6("../../trigger/src/ROM/B6_R6.coe"),
			.B6_R7("../../trigger/src/ROM/B6_R7.coe"),
			.B6_R8("../../trigger/src/ROM/B6_R8.coe"),
			.B6_R9("../../trigger/src/ROM/B6_R9.coe"),
			.ID_B6_R0_0(0),
			.ID_B6_R0_1(2),
			.ID_B6_R1_0(4),
			.ID_B6_R1_1(6),
			.ID_B6_R2_0(8),
			.ID_B6_R2_1(10),
			.ID_B6_R3_0(12),
			.ID_B6_R3_1(14),
			.ID_B6_R4_0(16),
			.ID_B6_R4_1(18),
			.ID_B6_R5_0(20),
			.ID_B6_R5_1(22),
			.ID_B6_R6_0(24),
			.ID_B6_R6_1(26),
			.ID_B6_R7_0(28),
			.ID_B6_R7_1(30),
			.ID_B6_R8_0(32),
			.ID_B6_R8_1(34),
			.ID_B6_R9_0(36),
			.ID_B6_R9_1(38),
			
			.B7_R0("../../trigger/src/ROM/B7_R0.coe"),
			.B7_R1("../../trigger/src/ROM/B7_R1.coe"),
			.B7_R2("../../trigger/src/ROM/B7_R2.coe"),
			.B7_R3("../../trigger/src/ROM/B7_R3.coe"),
			.B7_R4("../../trigger/src/ROM/B7_R4.coe"),
			.B7_R5("../../trigger/src/ROM/B7_R5.coe"),
			.B7_R6("../../trigger/src/ROM/B7_R6.coe"),
			.B7_R7("../../trigger/src/ROM/B7_R7.coe"),
			.B7_R8("../../trigger/src/ROM/B7_R8.coe"),
			.B7_R9("../../trigger/src/ROM/B7_R9.coe"),
			.ID_B7_R0_0(0),
			.ID_B7_R0_1(2),
			.ID_B7_R1_0(4),
			.ID_B7_R1_1(6),
			.ID_B7_R2_0(8),
			.ID_B7_R2_1(10),
			.ID_B7_R3_0(12),
			.ID_B7_R3_1(14),
			.ID_B7_R4_0(16),
			.ID_B7_R4_1(18),
			.ID_B7_R5_0(20),
			.ID_B7_R5_1(22),
			.ID_B7_R6_0(24),
			.ID_B7_R6_1(26),
			.ID_B7_R7_0(28),
			.ID_B7_R7_1(30),
			.ID_B7_R8_0(32),
			.ID_B7_R8_1(34),
			.ID_B7_R9_0(36),
			.ID_B7_R9_1(38),
			
			.B8_R0("../../trigger/src/ROM/B8_R0.coe"),
			.B8_R1("../../trigger/src/ROM/B8_R1.coe"),
			.B8_R2("../../trigger/src/ROM/B8_R2.coe"),
			.B8_R3("../../trigger/src/ROM/B8_R3.coe"),
			.B8_R4("../../trigger/src/ROM/B8_R4.coe"),
			.B8_R5("../../trigger/src/ROM/B8_R5.coe"),
			.B8_R6("../../trigger/src/ROM/B8_R6.coe"),
			.B8_R7("../../trigger/src/ROM/B8_R7.coe"),
			.B8_R8("../../trigger/src/ROM/B8_R8.coe"),
			.B8_R9("../../trigger/src/ROM/B8_R9.coe"),
			.ID_B8_R0_0(0),
			.ID_B8_R0_1(2),
			.ID_B8_R1_0(4),
			.ID_B8_R1_1(6),
			.ID_B8_R2_0(8),
			.ID_B8_R2_1(10),
			.ID_B8_R3_0(12),
			.ID_B8_R3_1(14),
			.ID_B8_R4_0(16),
			.ID_B8_R4_1(18),
			.ID_B8_R5_0(20),
			.ID_B8_R5_1(22),
			.ID_B8_R6_0(24),
			.ID_B8_R6_1(26),
			.ID_B8_R7_0(28),
			.ID_B8_R7_1(30),
			.ID_B8_R8_0(32),
			.ID_B8_R8_1(34),
			.ID_B8_R9_0(36),
			.ID_B8_R9_1(38),
			
			.B9_R0("../../trigger/src/ROM/B9_R0.coe"),
			.B9_R1("../../trigger/src/ROM/B9_R1.coe"),
			.B9_R2("../../trigger/src/ROM/B9_R2.coe"),
			.B9_R3("../../trigger/src/ROM/B9_R3.coe"),
			.B9_R4("../../trigger/src/ROM/B9_R4.coe"),
			.B9_R5("../../trigger/src/ROM/B9_R5.coe"),
			.B9_R6("../../trigger/src/ROM/B9_R6.coe"),
			.B9_R7("../../trigger/src/ROM/B9_R7.coe"),
			.B9_R8("../../trigger/src/ROM/B9_R8.coe"),
			.B9_R9("../../trigger/src/ROM/B9_R9.coe"),
			.ID_B9_R0_0(0),
			.ID_B9_R0_1(2),
			.ID_B9_R1_0(4),
			.ID_B9_R1_1(6),
			.ID_B9_R2_0(8),
			.ID_B9_R2_1(10),
			.ID_B9_R3_0(12),
			.ID_B9_R3_1(14),
			.ID_B9_R4_0(16),
			.ID_B9_R4_1(18),
			.ID_B9_R5_0(20),
			.ID_B9_R5_1(22),
			.ID_B9_R6_0(24),
			.ID_B9_R6_1(26),
			.ID_B9_R7_0(28),
			.ID_B9_R7_1(30),
			.ID_B9_R8_0(32),
			.ID_B9_R8_1(34),
			.ID_B9_R9_0(36),
			.ID_B9_R9_1(38)	    
		   )
		u_trigger_data_path(
		 .clk(clk),
		 .rst(rst),
		 .cmd_i(cmd_reg),
		 .addr_i(diff_data_reg[5:0]),
		 .max_sum(max_sum),
		 .max_sum_valid(max_sum_valid),
		 .max_sumid(max_sumid)
		);

//start data reg pipe.  
localparam TRIGGER_DATA_PATH_LATENCY=12; //"THIS INSTANTIATION" of trigger_data_path has 12 clock latency.
reg [31:0] start_data_reg_pipe;
reg[31:0] pre_start_data_reg;
wire[31:0] pos_start_data_reg;
always@(posedge clk) begin
	if(rst)
		pre_start_data_reg<=0;
	else
		pre_start_data_reg<=start_data_reg;
end

shift_ram_32x10 u_shift_ram_32x10 (
	 .d(pre_start_data_reg), // input [31 : 0] d
 	 .clk(clk), // input clk
 	 .sclr(rst), // input sclr
 	 .q(pos_start_data_reg) // output [31 : 0] q
			);	
always@(posedge clk) begin
	if(rst)
		start_data_reg_pipe<=0;	
	else 
		start_data_reg_pipe<=pos_start_data_reg;
end

//obtain the estimated time and write to wrfifo
reg [31:0] result_dat;
reg result_dat_valid;
always@(posedge clk) begin
	if(rst) begin
		result_dat<=0;
		result_dat_valid<=0;
	end else if(max_sum>SUM_TRESHOLD && max_sum_valid==1'b1) begin
		result_dat<=start_data_reg_pipe-{{24'b0},max_sumid};
		result_dat_valid<=1'b1;
	end else begin
		result_dat<=result_dat;
		result_dat_valid<=1'b0;
	end
end

assign  wrfifo_dat = result_dat;
assign  wrfifo_wren = result_dat_valid;

endmodule


