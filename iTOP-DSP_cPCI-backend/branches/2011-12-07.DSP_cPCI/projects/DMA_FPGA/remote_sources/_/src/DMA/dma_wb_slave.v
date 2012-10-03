`timescale 1ns/1ps

//this interface supports burst operation but may incur unpredicatable results if DMA
//related registers are involved

`define FIFO_LIMITATION_A1 28'd2040
`define FIFO_LIMITATION_A2 28'd2040
`define FIFO_LIMITATION_B1 28'd2040
`define FIFO_LIMITATION_B2 28'd2040
`define FIFO_EMPTY_MARK_A1 28'd1
`define FIFO_EMPTY_MARK_A2 28'd1
`define FIFO_EMPTY_MARK_B1 28'd1
`define FIFO_EMPTY_MARK_B2 28'd1

`define DMA_FIFO_LIMITATION_A1 28'd4084
`define DMA_FIFO_LIMITATION_A2 28'd4084
`define DMA_FIFO_LIMITATION_B1 28'd4084
`define DMA_FIFO_LIMITATION_B2 28'd4084
`define DMA_FIFO_FULL_MARK_A1 28'd4083
`define DMA_FIFO_FULL_MARK_A2 28'd4083
`define DMA_FIFO_FULL_MARK_B1 28'd4083
`define DMA_FIFO_FULL_MARK_B2 28'd4083

module dma_wb_slave
		(
		 input clk_i,
		 input reset_i,
		 //wb master interface
		 input cyc_i,
		 input stb_i,
		 output err_o,
		 output rty_o,
		 output ack_o,
		 input [31:0] dat_i,
		 output [31:0] dat_o,
		 input [31:0] adr_i,
		 input [2:0] cti_i,
		 input [1:0] bte_i,
		 input we_i,
		 input[3:0] sel_i,	
		 //dma_wb_engine interface
		 input dma_in_use,
		 output[15:0] ctrl_o,
		 output[15:0] watch_dog_cnt_o,
		 output[31:0] dmaadr_o,
		 output[31:0] dmalen_o,
		 input [31:0] transfer_size_i,
		 input tranfer_size_valid_i,
		 input [7:0] stat_i,
		 input stat_valid_i,
		 //DMA fifo interface A1
		 input DMA_fifo_prog_full_A1,
		 input [27:0] DMA_fifo_cnt_A1,
		 output DMA_fifo_prog_full_int_A1,
		 //DMA fifo interface A2
		 input DMA_fifo_prog_full_A2,
		 input [27:0] DMA_fifo_cnt_A2,
		 output DMA_fifo_prog_full_int_A2,	
		 //DMA fifo interface B1
		 input DMA_fifo_prog_full_B1,
		 input [27:0] DMA_fifo_cnt_B1,
		 output DMA_fifo_prog_full_int_B1,
		 //DMA fifo interface B2
		 input DMA_fifo_prog_full_B2,
		 input [27:0] DMA_fifo_cnt_B2,
		 output DMA_fifo_prog_full_int_B2,
		 //IDENT
		 input [5:0] board_ident,
		 //FIFO A1 interface
		 input fifo_prog_empty_A1,
		 input [27:0] fifo_length_A1,		 		 
		 output fifo_prog_empty_int_A1,
		 //FIFO A2 interface
		 input fifo_prog_empty_A2,
		 input [27:0] fifo_length_A2,		 		 
		 output fifo_prog_empty_int_A2,
		 //FIFO B1 interface
		 input fifo_prog_empty_B1,
		 input [27:0] fifo_length_B1,		 		 
		 output fifo_prog_empty_int_B1,
		 //FIFO B2 interface
		 input fifo_prog_empty_B2,
		 input [27:0] fifo_length_B2,		 		 
		 output fifo_prog_empty_int_B2,
		 //channel reset
		 output reg reset_channel_0,
		 output reg reset_channel_1,
		 output reg reset_channel_2,
		 output reg reset_channel_3,
		 output reg reset_wb_dma,
		 //channel status
		 input channel_0_up,
		 input channel_1_up,
		 input channel_2_up,
		 input channel_3_up,
		 //MON signals
		 output pulse_A,
		 output pulse_B,
		 output reg [5:0] pulse_A_width,
		 output reg [5:0] pulse_B_width,
		 //MON input signals 
		 input start_pulse_A, //
		 input end_pulse_A, //
		 input start_end_pulse_A,
		 input start_pulse_B, //
		 input end_pulse_B, //
		 input start_end_pulse_B,
		 
		 input bc0,
		 input bc1,
		 input bc2,
		 input bc3
		);

`define RECEIVER_FSM_BITS 2
reg [`RECEIVER_FSM_BITS-1:0] state;
parameter	IDLE=`RECEIVER_FSM_BITS'h0,
		REQ_SINGLE_RECEIVED=`RECEIVER_FSM_BITS'h1,
		REQ_BURST_RECEIVED=`RECEIVER_FSM_BITS'h2,
		REQ_ERROR=`RECEIVER_FSM_BITS'h3;

reg [31:0] dat_i_reg;
reg [9:0] adr_i_reg;
reg [2:0] cti_i_reg;
reg [1:0] bte_i_reg;
reg we_i_reg;
reg [3:0] sel_i_reg;

reg [31:0] control_reg; //including ctrl_o and watch_dog_cnt;
reg [31:0] dmaadr_reg; //
reg [31:0] dmalen_reg;
reg [31:0] transfered_size_reg;
reg [31:0] status_reg;
reg [31:0] dat_o_reg;
reg [31:0] id_reg;

reg [31:0] DMA_FIFO_ctrl_reg_A1;
reg [31:0] DMA_FIFO_status_reg_A1;

reg [31:0] DMA_FIFO_ctrl_reg_A2;
reg [31:0] DMA_FIFO_status_reg_A2;

reg [31:0] DMA_FIFO_ctrl_reg_B1;
reg [31:0] DMA_FIFO_status_reg_B1;

reg [31:0] DMA_FIFO_ctrl_reg_B2;
reg [31:0] DMA_FIFO_status_reg_B2;

reg [31:0] FIFO_A1_ctrl_reg;
reg [31:0] FIFO_A1_status_reg;
wire [27:0] fifo_slots_A1;

reg [31:0] FIFO_A2_ctrl_reg;
reg [31:0] FIFO_A2_status_reg;
wire [27:0] fifo_slots_A2;

reg [31:0] FIFO_B1_ctrl_reg;
reg [31:0] FIFO_B1_status_reg;
wire [27:0] fifo_slots_B1;

reg [31:0] FIFO_B2_ctrl_reg;
reg [31:0] FIFO_B2_status_reg;
wire [27:0] fifo_slots_B2;

reg [31:0] RESET_reg;

reg ack_reg;

reg channel_0_up_reg;
reg channel_1_up_reg;
reg channel_2_up_reg;
reg channel_3_up_reg;

reg [7:0] MON_reg;
reg  [1:0] MON_reg_pipe;
reg [3:0] bc_reg;

reg [7:0] start_end_mon;
reg [7:0] start_end_mon_pipe;

always@(posedge clk_i) begin
	if(reset_i)
		start_end_mon<=8'b0;
	else
		start_end_mon<={{1'b0},start_end_pulse_A,start_pulse_A,end_pulse_A,
							 {1'b0},start_end_pulse_B,start_pulse_B,end_pulse_B};
end

always@(posedge clk_i) begin
	if(reset_i)
		start_end_mon_pipe<=8'b0;
	else
		start_end_mon_pipe<=start_end_mon;
end
		
always@(posedge clk_i) begin
	if(reset_i)
		state<=IDLE;
	else begin
		case(state)
			IDLE: 	begin
			 		if(cyc_i==1'b1 && stb_i==1'b1) begin
						if(cti_i==3'b000 || cti_i==3'b111) state<=REQ_SINGLE_RECEIVED;
						else if(cti_i==3'b001 || cti_i==3'b010) state<=REQ_BURST_RECEIVED;
						else state<=REQ_ERROR;
					end else state<=IDLE;
				end
			REQ_SINGLE_RECEIVED:	state<=IDLE;	
			REQ_BURST_RECEIVED:	begin
											if(cti_i==3'b111) state<=IDLE;
											else if(cti_i==3'b001 || cti_i==3'b010) state<=REQ_BURST_RECEIVED;
											else state<=REQ_ERROR;
										end	
			REQ_ERROR: state<=IDLE;	
		endcase
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		dat_i_reg<=32'b0;
		adr_i_reg<={10{1'b1}};
		cti_i_reg<=3'b0;
		bte_i_reg<=2'b0;
		we_i_reg<=1'b0;
		sel_i_reg<=4'b0;
	end else if(cyc_i==1'b1 && stb_i==1'b1)begin
		dat_i_reg<=dat_i;
		adr_i_reg<={adr_i[11:2]};
		cti_i_reg<=cti_i;
		bte_i_reg<=bte_i;
		we_i_reg<=we_i;
		sel_i_reg<=sel_i;
	end else begin
		dat_i_reg<=32'b0;
		adr_i_reg<={10{1'b1}};
		cti_i_reg<=3'b0;
		bte_i_reg<=2'b0;
		we_i_reg<=1'b0;
		sel_i_reg<=4'b0;
	end
end

always@(posedge clk_i) begin
	if(reset_i)
		ack_reg<=1'b0;
	else 
		ack_reg<=(cyc_i & stb_i);
end

assign ack_o=ack_reg;

assign err_o=(state==REQ_ERROR);
assign rty_o=1'b0;//(state==REQ_RETRY);

//read reg file

always@(*) begin
	case(adr_i_reg)
		10'd0: dat_o_reg<={26'b0, board_ident};//id_reg;
		10'd1: dat_o_reg<=control_reg;
		10'd2: dat_o_reg<=dmaadr_reg;
		10'd3: dat_o_reg<=dmalen_reg;
		10'd4: dat_o_reg<=transfered_size_reg;
		10'd5: dat_o_reg<=status_reg;
		10'd6: dat_o_reg<=DMA_FIFO_status_reg_A1;
		10'd7: dat_o_reg<=DMA_FIFO_ctrl_reg_A1;
		10'd8: dat_o_reg<=FIFO_A1_status_reg;
		10'd9: dat_o_reg<=FIFO_A1_ctrl_reg;
		10'd10: dat_o_reg<=FIFO_A2_status_reg;
		10'd11: dat_o_reg<=FIFO_A2_ctrl_reg;
		10'd12: dat_o_reg<=FIFO_B1_status_reg;
		10'd13: dat_o_reg<=FIFO_B1_ctrl_reg;
		10'd14: dat_o_reg<=FIFO_B2_status_reg;
		10'd15: dat_o_reg<=FIFO_B2_ctrl_reg;
		10'd16: dat_o_reg<=DMA_FIFO_status_reg_A2;
		10'd17: dat_o_reg<=DMA_FIFO_ctrl_reg_A2;
		10'd18: dat_o_reg<=DMA_FIFO_status_reg_B1;
		10'd19: dat_o_reg<=DMA_FIFO_ctrl_reg_B1;
		10'd20: dat_o_reg<=DMA_FIFO_status_reg_B2;
		10'd21: dat_o_reg<=DMA_FIFO_ctrl_reg_B2;
		10'd22: dat_o_reg<=RESET_reg;
		10'd23: dat_o_reg<={{24'b0},MON_reg};
		10'd24: dat_o_reg<={{24'b0},start_end_mon_pipe};
		default: dat_o_reg<=32'b0;
	endcase
end

assign dat_o=dat_o_reg;
assign ctrl_o=control_reg[31:16];
assign watch_dog_cnt_o=control_reg[15:0];
assign dmaadr_o=dmaadr_reg;
assign dmalen_o=dmalen_reg;

//write reg file

always@(posedge clk_i) begin
	if(reset_i) 
		transfered_size_reg<=32'b0;
	else if(tranfer_size_valid_i==1'b1)
		transfered_size_reg<=transfer_size_i;
	else
		transfered_size_reg<=transfered_size_reg;
end

always@(posedge clk_i) begin
	if(reset_i)
		status_reg[7:0]<=8'b0;
	else if(stat_valid_i)
		status_reg[7:0]<=stat_i;
	else
		status_reg[7:0]<=status_reg[7:0];
end


always@(posedge clk_i) begin
	channel_0_up_reg<=channel_0_up;
	channel_1_up_reg<=channel_1_up;
	channel_2_up_reg<=channel_2_up;
	channel_3_up_reg<=channel_3_up;
end

always@(posedge clk_i) begin
	bc_reg<={bc3,bc2,bc1,bc0};
end

always@(*) begin
	status_reg[15:8]<={dma_in_use,{3'b0},channel_3_up_reg,channel_2_up_reg,channel_1_up_reg,channel_0_up_reg};
	status_reg[19:16]<=bc_reg;
	status_reg[31:20]<=12'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		id_reg<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd0) begin
							 if(sel_i_reg[0]==1'b1) id_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else id_reg[8*0+7:8*0]<=id_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) id_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else id_reg[8*1+7:8*1]<=id_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) id_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else id_reg[8*2+7:8*2]<=id_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) id_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else id_reg[8*3+7:8*3]<=id_reg[8*3+7:8*3];
	end else
		id_reg<=id_reg;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		control_reg<=32'b0; 
		dmaadr_reg<=32'b0;
		dmalen_reg<=32'b0;
	end else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && dma_in_use==1'b0) begin
		case(adr_i_reg)
			10'd1: begin
						    if(sel_i_reg[0]==1'b1) control_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else control_reg[8*0+7:8*0]<=control_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) control_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else control_reg[8*1+7:8*1]<=control_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) control_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else control_reg[8*2+7:8*2]<=control_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) control_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else control_reg[8*3+7:8*3]<=control_reg[8*3+7:8*3];  
			       end
			10'd2: begin
							 if(sel_i_reg[0]==1'b1) dmaadr_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else dmaadr_reg[8*0+7:8*0]<=dmaadr_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) dmaadr_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else dmaadr_reg[8*1+7:8*1]<=dmaadr_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) dmaadr_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else dmaadr_reg[8*2+7:8*2]<=dmaadr_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) dmaadr_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else dmaadr_reg[8*3+7:8*3]<=dmaadr_reg[8*3+7:8*3];
			       end
			10'd3: begin
			         if(sel_i_reg[0]==1'b1) dmalen_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else dmalen_reg[8*0+7:8*0]<=dmalen_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) dmalen_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else dmalen_reg[8*1+7:8*1]<=dmalen_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) dmalen_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else dmalen_reg[8*2+7:8*2]<=dmalen_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) dmalen_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else dmalen_reg[8*3+7:8*3]<=dmalen_reg[8*3+7:8*3];
			       end
			default: begin
					control_reg<=control_reg;
					dmaadr_reg<=dmaadr_reg;
					dmalen_reg<=dmalen_reg;
				 end
		endcase
	end else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && dma_in_use==1'b1) begin
		if(adr_i_reg==1 && sel_i_reg[3])
			control_reg[31:24]<={dat_i_reg[31],control_reg[30:24]};
		else
			control_reg[31:24]<=control_reg[31:24];
		control_reg[23:0]<=control_reg[23:0];
		dmaadr_reg<=dmaadr_reg;
		dmalen_reg<=dmalen_reg;
	end else begin
		control_reg<=control_reg;
		dmaadr_reg<=dmaadr_reg;
		dmalen_reg<=dmalen_reg;
	end
end

//DMA_FIFO_ctrl_reg A1
initial begin
	DMA_FIFO_ctrl_reg_A1<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_ctrl_reg_A1<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd7) begin
							 if(sel_i_reg[0]==1'b1) DMA_FIFO_ctrl_reg_A1[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else DMA_FIFO_ctrl_reg_A1[8*0+7:8*0]<=DMA_FIFO_ctrl_reg_A1[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) DMA_FIFO_ctrl_reg_A1[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else DMA_FIFO_ctrl_reg_A1[8*1+7:8*1]<=DMA_FIFO_ctrl_reg_A1[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) DMA_FIFO_ctrl_reg_A1[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else DMA_FIFO_ctrl_reg_A1[8*2+7:8*2]<=DMA_FIFO_ctrl_reg_A1[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) DMA_FIFO_ctrl_reg_A1[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else DMA_FIFO_ctrl_reg_A1[8*3+7:8*3]<=DMA_FIFO_ctrl_reg_A1[8*3+7:8*3];
	end else
		DMA_FIFO_ctrl_reg_A1<=DMA_FIFO_ctrl_reg_A1;
end

//DMA_FIFO_status reg A1
always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_status_reg_A1<=32'b0;
	else begin
		if(DMA_fifo_cnt_A1 > `DMA_FIFO_FULL_MARK_A1)
			DMA_FIFO_status_reg_A1[31]<=1'b1;
		else
			DMA_FIFO_status_reg_A1[31]<=1'b0;
		DMA_FIFO_status_reg_A1[30:28]<=3'b0;
		DMA_FIFO_status_reg_A1[27:2]<=DMA_fifo_cnt_A1[25:0];
		DMA_FIFO_status_reg_A1[1:0]<=2'b0;
	end
end

// DMA_fifo_prog_full_int A1
assign DMA_fifo_prog_full_int_A1=(DMA_FIFO_status_reg_A1[31] & DMA_FIFO_ctrl_reg_A1[31]);

//DMA_FIFO_ctrl_reg A2
initial begin
	DMA_FIFO_ctrl_reg_A2<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_ctrl_reg_A2<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd7) begin
							 if(sel_i_reg[0]==1'b1) DMA_FIFO_ctrl_reg_A2[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else DMA_FIFO_ctrl_reg_A2[8*0+7:8*0]<=DMA_FIFO_ctrl_reg_A2[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) DMA_FIFO_ctrl_reg_A2[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else DMA_FIFO_ctrl_reg_A2[8*1+7:8*1]<=DMA_FIFO_ctrl_reg_A2[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) DMA_FIFO_ctrl_reg_A2[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else DMA_FIFO_ctrl_reg_A2[8*2+7:8*2]<=DMA_FIFO_ctrl_reg_A2[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) DMA_FIFO_ctrl_reg_A2[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else DMA_FIFO_ctrl_reg_A2[8*3+7:8*3]<=DMA_FIFO_ctrl_reg_A2[8*3+7:8*3];
	end else
		DMA_FIFO_ctrl_reg_A2<=DMA_FIFO_ctrl_reg_A2;
end

//DMA_FIFO_status reg A2
always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_status_reg_A2<=32'b0;
	else begin
		if(DMA_fifo_cnt_A2 > `DMA_FIFO_FULL_MARK_A2)
			DMA_FIFO_status_reg_A2[31]<=1'b1;
		else
			DMA_FIFO_status_reg_A2[31]<=1'b0;
		DMA_FIFO_status_reg_A2[30:28]<=3'b0;
		DMA_FIFO_status_reg_A2[27:2]<=DMA_fifo_cnt_A2[25:0];
		DMA_FIFO_status_reg_A2[1:0]<=2'b0;
	end
end

// DMA_fifo_prog_full_int A2
assign DMA_fifo_prog_full_int_A2=(DMA_FIFO_status_reg_A2[31] & DMA_FIFO_ctrl_reg_A2[31]);

//DMA_FIFO_ctrl_reg B1
initial begin
	DMA_FIFO_ctrl_reg_B1<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_ctrl_reg_B1<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd7) begin
							 if(sel_i_reg[0]==1'b1) DMA_FIFO_ctrl_reg_B1[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else DMA_FIFO_ctrl_reg_B1[8*0+7:8*0]<=DMA_FIFO_ctrl_reg_B1[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) DMA_FIFO_ctrl_reg_B1[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else DMA_FIFO_ctrl_reg_B1[8*1+7:8*1]<=DMA_FIFO_ctrl_reg_B1[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) DMA_FIFO_ctrl_reg_B1[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else DMA_FIFO_ctrl_reg_B1[8*2+7:8*2]<=DMA_FIFO_ctrl_reg_B1[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) DMA_FIFO_ctrl_reg_B1[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else DMA_FIFO_ctrl_reg_B1[8*3+7:8*3]<=DMA_FIFO_ctrl_reg_B1[8*3+7:8*3];
	end else
		DMA_FIFO_ctrl_reg_B1<=DMA_FIFO_ctrl_reg_B1;
end

//DMA_FIFO_status reg B1
always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_status_reg_B1<=32'b0;
	else begin
		if(DMA_fifo_cnt_B1 > `DMA_FIFO_FULL_MARK_B1)
			DMA_FIFO_status_reg_B1[31]<=1'b1;
		else
			DMA_FIFO_status_reg_B1[31]<=1'b0;
		DMA_FIFO_status_reg_B1[30:28]<=3'b0;
		DMA_FIFO_status_reg_B1[27:2]<=DMA_fifo_cnt_B1[25:0];
		DMA_FIFO_status_reg_B1[1:0]<=2'b0;
	end
end

// DMA_fifo_prog_full_int B1
assign DMA_fifo_prog_full_int_B1=(DMA_FIFO_status_reg_B1[31] & DMA_FIFO_ctrl_reg_B1[31]);

//DMA_FIFO_ctrl_reg B2
initial begin
	DMA_FIFO_ctrl_reg_B2<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_ctrl_reg_B2<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd7) begin
							 if(sel_i_reg[0]==1'b1) DMA_FIFO_ctrl_reg_B2[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else DMA_FIFO_ctrl_reg_B2[8*0+7:8*0]<=DMA_FIFO_ctrl_reg_B2[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) DMA_FIFO_ctrl_reg_B2[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else DMA_FIFO_ctrl_reg_B2[8*1+7:8*1]<=DMA_FIFO_ctrl_reg_B2[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) DMA_FIFO_ctrl_reg_B2[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else DMA_FIFO_ctrl_reg_B2[8*2+7:8*2]<=DMA_FIFO_ctrl_reg_B2[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) DMA_FIFO_ctrl_reg_B2[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else DMA_FIFO_ctrl_reg_B2[8*3+7:8*3]<=DMA_FIFO_ctrl_reg_B2[8*3+7:8*3];
	end else
		DMA_FIFO_ctrl_reg_B2<=DMA_FIFO_ctrl_reg_B2;
end

//DMA_FIFO_status reg B2
always@(posedge clk_i) begin
	if(reset_i)
		DMA_FIFO_status_reg_B2<=32'b0;
	else begin
		if(DMA_fifo_cnt_B2 > `DMA_FIFO_FULL_MARK_B2)
			DMA_FIFO_status_reg_B2[31]<=1'b1;
		else
			DMA_FIFO_status_reg_B2[31]<=1'b0;
		DMA_FIFO_status_reg_B2[30:28]<=3'b0;
		DMA_FIFO_status_reg_B2[27:2]<=DMA_fifo_cnt_B2[25:0];
		DMA_FIFO_status_reg_B2[1:0]<=2'b0;
	end
end

// DMA_fifo_prog_full_int B2
assign DMA_fifo_prog_full_int_B2=(DMA_FIFO_status_reg_B2[31] & DMA_FIFO_ctrl_reg_B2[31]);

//FIFO_A1_ctrl_reg
initial begin
	FIFO_A1_ctrl_reg<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		FIFO_A1_ctrl_reg<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd9) begin
							 if(sel_i_reg[0]==1'b1) FIFO_A1_ctrl_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else FIFO_A1_ctrl_reg[8*0+7:8*0]<=FIFO_A1_ctrl_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) FIFO_A1_ctrl_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else FIFO_A1_ctrl_reg[8*1+7:8*1]<=FIFO_A1_ctrl_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) FIFO_A1_ctrl_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else FIFO_A1_ctrl_reg[8*2+7:8*2]<=FIFO_A1_ctrl_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) FIFO_A1_ctrl_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else FIFO_A1_ctrl_reg[8*3+7:8*3]<=FIFO_A1_ctrl_reg[8*3+7:8*3];
	end else
		FIFO_A1_ctrl_reg<=FIFO_A1_ctrl_reg;
end

//FIFO_A1_status_reg
assign fifo_slots_A1=`FIFO_LIMITATION_A1-fifo_length_A1;
always@(posedge clk_i) begin
	if(reset_i)
		FIFO_A1_status_reg<=32'b0;
	else begin
		if(fifo_length_A1<`FIFO_EMPTY_MARK_A1)
			FIFO_A1_status_reg[31]<=1'b1;
		else
			FIFO_A1_status_reg[31]<=1'b0;
		FIFO_A1_status_reg[30:28]<=3'b0;
		if(fifo_length_A1 > `FIFO_LIMITATION_A1)
			FIFO_A1_status_reg[27:0]<=28'b0;
		else
			FIFO_A1_status_reg[27:0]<={fifo_slots_A1[25:0],{2'b0}};
	end
end

assign fifo_prog_empty_int_A1=(FIFO_A1_status_reg[31] & FIFO_A1_ctrl_reg[31]);

//FIFO_A2_ctrl_reg
initial begin
	FIFO_A2_ctrl_reg<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		FIFO_A2_ctrl_reg<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd11) begin
							 if(sel_i_reg[0]==1'b1) FIFO_A2_ctrl_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else FIFO_A2_ctrl_reg[8*0+7:8*0]<=FIFO_A2_ctrl_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) FIFO_A2_ctrl_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else FIFO_A2_ctrl_reg[8*1+7:8*1]<=FIFO_A2_ctrl_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) FIFO_A2_ctrl_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else FIFO_A2_ctrl_reg[8*2+7:8*2]<=FIFO_A2_ctrl_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) FIFO_A2_ctrl_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else FIFO_A2_ctrl_reg[8*3+7:8*3]<=FIFO_A2_ctrl_reg[8*3+7:8*3];
	end else
		FIFO_A2_ctrl_reg<=FIFO_A2_ctrl_reg;
end

//FIFO_A2_status_reg
assign fifo_slots_A2=`FIFO_LIMITATION_A2-fifo_length_A2;
always@(posedge clk_i) begin
	if(reset_i)
		FIFO_A2_status_reg<=32'b0;
	else begin
		if(fifo_length_A2<`FIFO_EMPTY_MARK_A2)
			FIFO_A2_status_reg[31]<=1'b1;
		else
			FIFO_A2_status_reg[31]<=1'b0;
		FIFO_A2_status_reg[30:28]<=3'b0;
		if(fifo_length_A2 > `FIFO_LIMITATION_A2)
			FIFO_A2_status_reg[27:0]<=28'b0;
		else
			FIFO_A2_status_reg[27:0]<={fifo_slots_A2[25:0],{2'b0}};
	end
end

assign fifo_prog_empty_int_A2=(FIFO_A2_status_reg[31] & FIFO_A2_ctrl_reg[31]);

//FIFO_B1_ctrl_reg
initial begin
	FIFO_B1_ctrl_reg<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		FIFO_B1_ctrl_reg<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd13) begin
							 if(sel_i_reg[0]==1'b1) FIFO_B1_ctrl_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else FIFO_B1_ctrl_reg[8*0+7:8*0]<=FIFO_B1_ctrl_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) FIFO_B1_ctrl_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else FIFO_B1_ctrl_reg[8*1+7:8*1]<=FIFO_B1_ctrl_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) FIFO_B1_ctrl_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else FIFO_B1_ctrl_reg[8*2+7:8*2]<=FIFO_B1_ctrl_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) FIFO_B1_ctrl_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else FIFO_B1_ctrl_reg[8*3+7:8*3]<=FIFO_B1_ctrl_reg[8*3+7:8*3];
	end else
		FIFO_B1_ctrl_reg<=FIFO_B1_ctrl_reg;
end

//FIFO_B1_status_reg
assign fifo_slots_B1=`FIFO_LIMITATION_B1-fifo_length_B1;
always@(posedge clk_i) begin
	if(reset_i)
		FIFO_B1_status_reg<=32'b0;
	else begin
		if(fifo_length_B1<`FIFO_EMPTY_MARK_B1)
			FIFO_B1_status_reg[31]<=1'b1;
		else
			FIFO_B1_status_reg[31]<=1'b0;
		FIFO_B1_status_reg[30:28]<=3'b0;
		if(fifo_length_B1 > `FIFO_LIMITATION_B1)
			FIFO_B1_status_reg[27:0]<=28'b0;
		else
			FIFO_B1_status_reg[27:0]<={fifo_slots_B1[25:0],{2'b0}};
	end
end

assign fifo_prog_empty_int_B1=(FIFO_B1_status_reg[31] & FIFO_B1_ctrl_reg[31]);

//FIFO_B2_ctrl_reg
initial begin
	FIFO_B2_ctrl_reg<=32'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		FIFO_B2_ctrl_reg<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd15) begin
							 if(sel_i_reg[0]==1'b1) FIFO_B2_ctrl_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else FIFO_B2_ctrl_reg[8*0+7:8*0]<=FIFO_B2_ctrl_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) FIFO_B2_ctrl_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else FIFO_B2_ctrl_reg[8*1+7:8*1]<=FIFO_B2_ctrl_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) FIFO_B2_ctrl_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else FIFO_B2_ctrl_reg[8*2+7:8*2]<=FIFO_B2_ctrl_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) FIFO_B2_ctrl_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else FIFO_B2_ctrl_reg[8*3+7:8*3]<=FIFO_B2_ctrl_reg[8*3+7:8*3];
	end else
		FIFO_B2_ctrl_reg<=FIFO_B2_ctrl_reg;
end

//FIFO_B2_status_reg
assign fifo_slots_B2=`FIFO_LIMITATION_B2-fifo_length_B2;
always@(posedge clk_i) begin
	if(reset_i)
		FIFO_B2_status_reg<=32'b0;
	else begin
		if(fifo_length_B2<`FIFO_EMPTY_MARK_B2)
			FIFO_B2_status_reg[31]<=1'b1;
		else
			FIFO_B2_status_reg[31]<=1'b0;
		FIFO_B2_status_reg[30:28]<=3'b0;
		if(fifo_length_B2 > `FIFO_LIMITATION_B2)
			FIFO_B2_status_reg[27:0]<=28'b0;
		else
			FIFO_B2_status_reg[27:0]<={fifo_slots_B2[25:0],{2'b0}};
	end
end

assign fifo_prog_empty_int_B2=(FIFO_B2_status_reg[31] & FIFO_B2_ctrl_reg[31]);

//****************
always@(posedge clk_i) begin
	if(reset_i)
		MON_reg<=8'b0;
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd23 && sel_i_reg[0]==1'b1)
		MON_reg<=dat_i_reg[7:0];
	else
		MON_reg<={MON_reg[7:2],{2'b0}};		
end

always@(posedge clk_i) begin
	if(reset_i)
		MON_reg_pipe<=2'b0;
	else
		MON_reg_pipe<=MON_reg[1:0];
end

always@(*) begin
	case(MON_reg[4:2])
		3'b000: pulse_A_width<=16;
		3'b001: pulse_A_width<=8;
		3'b010: pulse_A_width<=4;
		3'b011: pulse_A_width<=32;
		default: pulse_A_width<=16;
	endcase	
end

always@(*) begin
	case(MON_reg[7:5])
		3'b000: pulse_B_width<=16;
		3'b001: pulse_B_width<=8;
		3'b010: pulse_B_width<=4;
		3'b011: pulse_B_width<=32;
		default: pulse_B_width<=16;
	endcase	
end

assign pulse_A= MON_reg[0] & (~MON_reg_pipe[0]);
assign pulse_B= MON_reg[1] & (~MON_reg_pipe[1]); 
//****************

always@(posedge clk_i) begin
	if(reset_i)
		RESET_reg<=32'b0;	
	else if(we_i_reg==1'b1 && (state==REQ_SINGLE_RECEIVED || state==REQ_BURST_RECEIVED) && adr_i_reg==10'd22) begin
							 if(sel_i_reg[0]==1'b1) RESET_reg[8*0+7:8*0]<=dat_i_reg[8*0+7:8*0];
							 else RESET_reg[8*0+7:8*0]<=RESET_reg[8*0+7:8*0];
							   
							 if(sel_i_reg[1]==1'b1) RESET_reg[8*1+7:8*1]<=dat_i_reg[8*1+7:8*1];
							 else RESET_reg[8*1+7:8*1]<=RESET_reg[8*1+7:8*1];
							 
							 if(sel_i_reg[2]==1'b1) RESET_reg[8*2+7:8*2]<=dat_i_reg[8*2+7:8*2];
							 else RESET_reg[8*2+7:8*2]<=RESET_reg[8*2+7:8*2];
							 
							 if(sel_i_reg[3]==1'b1) RESET_reg[8*3+7:8*3]<=dat_i_reg[8*3+7:8*3];
							 else RESET_reg[8*3+7:8*3]<=RESET_reg[8*3+7:8*3];
	end else
		RESET_reg<=RESET_reg;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		reset_channel_0<=1'b0;
		reset_channel_1<=1'b0;
		reset_channel_2<=1'b0;
		reset_channel_3<=1'b0;
		reset_wb_dma<=1'b0;
	end else begin
		reset_channel_0<=RESET_reg[0];
		reset_channel_1<=RESET_reg[1];
		reset_channel_2<=RESET_reg[2];
		reset_channel_3<=RESET_reg[3];
		reset_wb_dma<=RESET_reg[4];
	end
end

//--------------------------------------------------------------

endmodule


