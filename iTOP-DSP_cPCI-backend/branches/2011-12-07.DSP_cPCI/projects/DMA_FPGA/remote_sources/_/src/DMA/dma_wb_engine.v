`timescale 1ns/1ps
//currently supports:
//1) a linked list of external descriptors (real dma address and length are stored in external memory);
//2) 4 read fifo interfaces
//3) 4 write fifo interfaces

module dma_wb_engine
	(
	 //wishbone clock
	 input clk_i,
	 input reset_i,
	 //wishbone slave interface
	 output cyc_o,
	 output stb_o,
	 input err_i,
	 input rty_i,
	 input ack_i,
	 input [31:0] dat_i,
	 output reg [31:0] dat_o,
	 output [31:0] adr_o,
	 output [2:0] cti_o,
	 output [1:0] bte_o,
	 output we_o,
	 output[3:0] sel_o,
	 //DMA fifo interface A1
	 input [31:0] DMA_fifo_dat_i_A1,
	 input DMA_fifo_dat_strobe_i_A1, //indicate whether the next data in fifo is valid
	 input DMA_fifo_data_strobe_current_i_A1,
	 output DMA_fifo_rd_o_A1,
	 //DMA fifo interface A2
	 input [31:0] DMA_fifo_dat_i_A2,
	 input DMA_fifo_dat_strobe_i_A2, //indicate whether the next data in fifo is valid
	 input DMA_fifo_data_strobe_current_i_A2,
	 output DMA_fifo_rd_o_A2,
	 //DMA fifo interface B1
	 input [31:0] DMA_fifo_dat_i_B1,
	 input DMA_fifo_dat_strobe_i_B1, //indicate whether the next data in fifo is valid
	 input DMA_fifo_data_strobe_current_i_B1,
	 output DMA_fifo_rd_o_B1,
	 //DMA fifo interface B2
	 input [31:0] DMA_fifo_dat_i_B2,
	 input DMA_fifo_dat_strobe_i_B2, //indicate whether the next data in fifo is valid
	 input DMA_fifo_data_strobe_current_i_B2,
	 output DMA_fifo_rd_o_B2,
	 //fifo A1 interface
	 input fifo_full_A1,
	 output reg [31:0] fifo_data_A1,
	 output reg fifo_data_valid_A1,
	 //fifo A2 interface
	 input fifo_full_A2,
	 output reg [31:0] fifo_data_A2,
	 output reg fifo_data_valid_A2,
	 //fifo A3 interface
	 input fifo_full_A3,
	 output reg [31:0] fifo_data_A3,
	 output reg fifo_data_valid_A3,
	 //fifo A4 interface
	 input fifo_full_A4,
	 output reg [31:0] fifo_data_A4,
	 output reg fifo_data_valid_A4,
	 //dma control registers
	 input [15:0] ctrl_i, //15 to 7 is control reg, 7 to 0 is chunk size register
	 input [15:0] watch_dog_cnt_i, //watch dog counter to control the wait time: from 16'h0000 to 16'hFFFE
	 input [31:0] dmaadr_i,
	 input [31:0] dmalen_i,
	 output [31:0] transfer_size_o, //transfered size register
	 output transfer_size_valid,
	 output dma_in_use,
	 output [7:0] stat_o, //error register
	 output stat_valid,
	 output fin_o //for interrupt
	);

  `define RECORD_END_MARK 32'hFFFF_FFFC

wire abort_i;
wire start_i;
wire watch_dog_enabled_i;
wire interrupt_enabled_i;

reg cyc_wb;
reg stb_wb;
reg[31:0] adr_wb;
reg[2:0] cti_wb;
reg[1:0] bte_wb;
reg we_wb;
reg [3:0] sel_wb;

reg [15:0] watch_dog_cnt;
reg [15:0] watch_dog_cnt_limit;
reg watch_dog_overflow;

reg [31:0] record_length_addr;
reg [31:0] record_pointer_addr;
reg [31:0] record_start_addr;
reg [31:0] record_next_addr;
reg [31:0] next_record_addr;
wire single_word_record;
reg [31:0] record_length;
reg record_done;

wire single_word_dma;
reg [31:0] dma_length;
reg dma_done;

wire single_word_burst;
reg [7:0] burst_length;
reg burst_done;

reg record_list_ended;

reg [7:0] burst_length_comb;

reg just_finish_reg;

//define DMA states
`define DMA_FSM_BITS 3
reg [`DMA_FSM_BITS-1:0] state;

reg [7:0] status_reg;
reg status_valid_reg;

//for some special cases
reg zero_dma_length;
wire zero_record_length;

reg interrupt_enabled_reg;
reg interrupt;

wire[2:0] dma_mode;//dma mode control

wire fifo_rd;
reg src_rdy;

parameter	IDLE=`DMA_FSM_BITS'h0,
		FETCH_ADDR=`DMA_FSM_BITS'h1,
		FETCH_LENGTH=`DMA_FSM_BITS'h2,
		FETCH_POINTER=`DMA_FSM_BITS'h3,
		WRITE_WB=`DMA_FSM_BITS'h4,
		END_BURST=`DMA_FSM_BITS'h5,
		FINISH=`DMA_FSM_BITS'h6,
		WAIT=`DMA_FSM_BITS'h7;
		
//
assign abort_i=ctrl_i[15];
assign start_i=ctrl_i[14];
assign watch_dog_enabled_i=ctrl_i[13];
assign interrupt_enabled_i=ctrl_i[12];
assign dma_mode=ctrl_i[11:9];

always@(*) begin
	case(dma_mode)
		3'b000: src_rdy<=DMA_fifo_dat_strobe_i_A1;
		3'b001: src_rdy<=DMA_fifo_dat_strobe_i_A2;
		3'b010: src_rdy<=DMA_fifo_dat_strobe_i_B1;
		3'b011: src_rdy<=DMA_fifo_dat_strobe_i_B2;

		3'b100: src_rdy<=(!fifo_full_A1);
		3'b101: src_rdy<=(!fifo_full_A2);
		3'b110: src_rdy<=(!fifo_full_A3);
		3'b111: src_rdy<=(!fifo_full_A4);
		default: src_rdy<=1'b0;
	endcase
end

always@(posedge clk_i) begin
	if(reset_i)
		interrupt_enabled_reg<=1'b0;
	else if(state==IDLE && start_i==1'b1)
		interrupt_enabled_reg<=interrupt_enabled_i;
	else
		interrupt_enabled_reg<=interrupt_enabled_reg;
end

always@(posedge clk_i) begin
	if(reset_i)
		interrupt<=1'b0;
	else if(state==FINISH)
		interrupt<=interrupt_enabled_reg;
	else if(state==WAIT && start_i==1'b0)
		interrupt<=1'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		burst_length_comb<=0;
	else if(state==IDLE && start_i==1'b1) begin
		case(ctrl_i[7:0])
			8'h00: burst_length_comb<=128;
			8'h01: burst_length_comb<=64;
			8'h02: burst_length_comb<=32;
			default: burst_length_comb<=128;
		endcase
	end else
		burst_length_comb<=burst_length_comb;
end		

always@(posedge clk_i) begin
	if(reset_i)
		watch_dog_cnt_limit<=0;
	else if(state==IDLE && start_i==1'b1) begin
		case(watch_dog_cnt_i[1:0])
			16'h0000: watch_dog_cnt_limit<=4;
			16'h0001: watch_dog_cnt_limit<=8;
			16'h0002: watch_dog_cnt_limit<=16;
			default: watch_dog_cnt_limit<=4;
		endcase
	end else
		watch_dog_cnt_limit<=watch_dog_cnt_limit;
end		

always@(posedge clk_i) begin
	if(reset_i)
		record_start_addr<=32'b0;
	else if(state==FETCH_ADDR && ack_i==1'b1)
		record_start_addr<=dat_i;
	else
		record_start_addr<=record_start_addr;
end

always@(posedge clk_i) begin
	if(reset_i)
		record_next_addr<=32'b0;
	else if(state==FETCH_POINTER && src_rdy==1'b1)
		record_next_addr<=record_start_addr+4;
	else if(state==FETCH_POINTER && src_rdy==1'b0)
		record_next_addr<=record_start_addr;
	else if( state==WRITE_WB && ack_i==1'b1 && single_word_record==1'b0 && single_word_dma==1'b0 && single_word_burst==1'b0 && src_rdy==1'b1)
		record_next_addr<=record_next_addr+4;
	else if(state==END_BURST && burst_done==1'b1 && src_rdy==1'b1)
		record_next_addr<=record_next_addr+4;
	else 
		record_next_addr<=record_next_addr;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		record_length_addr<=32'b0;
		record_pointer_addr<=32'b0;
	end else if(state==IDLE && start_i ==1'b1) begin
		record_length_addr<=dmaadr_i+4; //BYTE number
		record_pointer_addr<=dmaadr_i+8; //BYTE address
	end else if(state==END_BURST && record_done==1'b1) begin
		record_length_addr<=next_record_addr+4;
		record_pointer_addr<=next_record_addr+8;
	end else begin
		record_length_addr<=record_length_addr;
		record_pointer_addr<=record_pointer_addr;	
	end		
end

always@(posedge clk_i) begin
	if(reset_i)
		record_done<=1'b0;
	else if(state==WRITE_WB && single_word_record==1'b1 && ack_i==1'b1)
		record_done<=1'b1;
	else
		record_done<=1'b0;
end

assign single_word_record=(record_length==4)? 1'b1:1'b0;

always@(posedge clk_i) begin
	if(reset_i)
		burst_done<=1'b0;
	else if(state==WRITE_WB && single_word_burst==1'b1 && ack_i==1'b1)
		burst_done<=1'b1;
	else if(state==WRITE_WB && src_rdy==1'b0 && ack_i==1'b1)
		burst_done<=1'b1;
	else if(state==FETCH_POINTER && src_rdy==1'b0 && ack_i==1'b1)
		burst_done<=1'b1;
	else if(state==END_BURST && src_rdy==1'b0)
		burst_done<=1'b1;
	else
		burst_done<=1'b0;
end

assign single_word_burst=(burst_length==1)? 1'b1: 1'b0;

always@(posedge clk_i) begin
	if(reset_i)
		dma_done<=1'b0;
	else if(state==WRITE_WB && single_word_dma==1'b1 && ack_i==1'b1)
		dma_done<=1'b1;
	else
		dma_done<=1'b0;
end
assign single_word_dma=(dma_length==4)?1'b1:1'b0;

always@(posedge clk_i) begin
	if(reset_i)
		record_length<=32'b0;
	else if(state==FETCH_LENGTH && ack_i==1'b1)
		record_length<=dat_i;
	else if(state==WRITE_WB && ack_i==1'b1)
		record_length<=record_length-4;
	else
		record_length<=record_length;
end

assign zero_record_length=(record_length==0)?1'b1:1'b0;

always@(posedge clk_i) begin
	if(reset_i)
		next_record_addr<=32'b0;
	else if(state==FETCH_POINTER && ack_i==1'b1)
		next_record_addr<=dat_i;
	else
		next_record_addr<=next_record_addr;
end

always@(posedge clk_i) begin
	if(reset_i)
		record_list_ended<=1'b0;
	else if(next_record_addr==`RECORD_END_MARK)
		record_list_ended<=1'b1;
	else	
		record_list_ended<=1'b0;	
end

always@(posedge clk_i) begin
	if(reset_i)
		watch_dog_cnt<=0;
	else if(state==IDLE)
		watch_dog_cnt<=16'b0;
	else if(state==END_BURST && src_rdy==1'b0 && watch_dog_cnt < watch_dog_cnt_limit)
		watch_dog_cnt<=watch_dog_cnt+1'b1;
	else
		watch_dog_cnt<=watch_dog_cnt;
end

always@(posedge clk_i) begin
	if(reset_i)
		watch_dog_overflow<=1'b0;
	else if(watch_dog_cnt==watch_dog_cnt_limit)
		watch_dog_overflow<=1'b1;
	else
		watch_dog_overflow<=1'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		burst_length<=0;
	else if( state==FETCH_POINTER || state==END_BURST )
		burst_length<=burst_length_comb[7:0];
	else if(state==WRITE_WB && ack_i==1'b1)
		burst_length<=burst_length-1'b1;
	else
		burst_length<=burst_length;
end

assign transfer_size_o= dma_length;

always@(posedge clk_i) begin
	if(reset_i)
		dma_length<=0;
	else if(state==IDLE && start_i==1'b1)
		dma_length<=dmalen_i;
	else if(state==WRITE_WB && ack_i==1'b1)
		dma_length<=dma_length-4;
	else if(state==FINISH)
		dma_length<=dmalen_i-dma_length;
	else
		dma_length<=dma_length;
end

always@(posedge clk_i) begin
	if(reset_i)
		zero_dma_length<=1'b0;
	else if(dma_length==0)
		zero_dma_length<=1'b1;
	else
		zero_dma_length<=1'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		just_finish_reg<=1'b0;
	else if(state==FINISH)
		just_finish_reg<=1'b1;
	else	
		just_finish_reg<=1'b0;
end

assign transfer_size_valid=just_finish_reg;

always@(posedge clk_i) begin
	if(reset_i | abort_i)
		state<=IDLE;
	else begin
		case (state)
			IDLE: begin
						if(start_i) begin
							if(dmaadr_i[1:0]!=0)
								state<=FINISH; //segment error
							else
								state<=FETCH_ADDR;
						end else state<=state;
			      end
			FETCH_ADDR: begin //present stb_o, cyc_o, adr_o, we_o, sel_o, cti_o and bte_o are in classical state
							if(ack_i) begin
								if(dat_i[1:0]!=0)
									state<=FINISH;
								else	
									state<= FETCH_LENGTH;
							end else if(err_i) state<=FINISH;
							else state<=state;
				    end	
			FETCH_LENGTH: begin //similar to FETCH_ADDR,
					if(ack_i) begin 
						if(dat_i[1:0]!=0)
							state<=FINISH;
						else 
							state<= FETCH_POINTER;
					end else if(err_i) state<=FINISH;
					else state<=state;
				      end
			FETCH_POINTER: begin //similar to FETCH_LENGTH
					if(ack_i) begin
						if(dat_i[1:0]!=0)
							state<=FINISH;
						else if(zero_dma_length | zero_record_length)
							state<=END_BURST;
						else if(!src_rdy)
							state<=END_BURST;
						else state<= WRITE_WB;						
					end
					else if(err_i) state<=FINISH;
					else state<=state;
				       end
			WRITE_WB: begin
					if(ack_i) begin
						if(single_word_record | single_word_dma | single_word_burst | (!src_rdy) ) state<=END_BURST;
						else state<=WRITE_WB;
				        end
					else if(err_i) state<=FINISH;					
					else state<=state;
				  end
			END_BURST: begin
							if(dma_done | zero_dma_length) state<=FINISH;
							else if(record_done | zero_record_length) begin
														if(record_list_ended)
															state<=FINISH;
														else	
															state<=FETCH_ADDR;
														end
							else if(burst_done) begin
								if(src_rdy) state<=WRITE_WB;
								else if(watch_dog_overflow & watch_dog_enabled_i) state<=FINISH;
								else state<=END_BURST;
							end							
							else state<=FINISH; //error found
						  end
			FINISH: state<=WAIT;
			WAIT: begin
						if(start_i==1'b0) state<=IDLE;
						else state<=WAIT;
					end	
			default: state<=IDLE;
		endcase
	end
end

//the control signals on the wishbone slave interface

always@(*) begin
	case(dma_mode)
		3'b000: dat_o<=DMA_fifo_dat_i_A1;
		3'b001: dat_o<=DMA_fifo_dat_i_A2;
		3'b010: dat_o<=DMA_fifo_dat_i_B1;
		3'b011: dat_o<=DMA_fifo_dat_i_B2;
		default: dat_o<=DMA_fifo_dat_i_A1;
	endcase
end

assign cyc_o=cyc_wb;
assign stb_o=stb_wb;
assign adr_o=adr_wb;
assign cti_o=cti_wb;
assign bte_o=bte_wb;
assign we_o=we_wb;
assign sel_o=sel_wb;
assign stat_o=status_reg;

always@(*) begin
	if(state==WRITE_WB) begin
		if(single_word_record|single_word_burst|single_word_dma|(!src_rdy))
			cti_wb<=3'b111;
		else
			cti_wb<=3'b010;
	end else
		cti_wb<=3'b0;
end

always@(posedge clk_i) begin
	if(reset_i | abort_i) begin
	 cyc_wb<=1'b0;
	 stb_wb<=1'b0;
	 adr_wb<=32'b0;
	 bte_wb<=2'b0;
	 we_wb<=1'b0;
	 sel_wb<=4'b0;
	 status_reg<=8'b0;
	end else begin
		case(state)
			IDLE: 	begin
					if(start_i==1'b1) begin						
					   if(dmaadr_i[1:0]==2'b0) begin
						cyc_wb<=1'b1;
						stb_wb<=1'b1;						
						adr_wb<=dmaadr_i;						
						bte_wb<=2'b0;
						we_wb<=1'b0;
						sel_wb<=4'hF;
						status_reg<=status_reg; end
						else begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;						
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[6]<=1'b1;	
						status_reg[7]<=status_reg[7];
						status_reg[5:0]<=status_reg[5:0];end
					end else begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;						
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg<=status_reg;	
					end
				end
			FETCH_ADDR: begin										
					if(ack_i) begin
						if(dat_i[1:0]==2'b0) begin
						cyc_wb<=1'b1;
						stb_wb<=1'b1;							
						adr_wb<=record_length_addr; //wire signal
						bte_wb<=2'b0;
						we_wb<=1'b0;
						sel_wb<=4'hF;
						status_reg<=status_reg; end
						else begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[6]<=1'b1;	
						status_reg[7]<=status_reg[7];
						status_reg[5:0]<=status_reg[5:0]; end
					end else if(err_i) begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;									
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[0]<=1'b1;
						status_reg[7:1]<=status_reg[7:1];						
					end else begin
						cyc_wb<=cyc_wb;
	 					stb_wb<=stb_wb; //still 1'b1								
						adr_wb<=adr_wb;
	 					bte_wb<=bte_wb;
	 					we_wb<=we_wb;
	 					sel_wb<=sel_wb;
						status_reg<=status_reg;
					end
				    end	
			FETCH_LENGTH: begin
					if(ack_i) begin
					   if(dat_i[1:0]==2'b0) begin
						cyc_wb<=1'b1;
						stb_wb<=1'b1;								
						adr_wb<=record_pointer_addr; //wire signal
						bte_wb<=2'b0;
						we_wb<=1'b0;
						sel_wb<=4'hF;
						status_reg<=status_reg; end
						else begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;						
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[6]<=1'b1;	
						status_reg[7]<=status_reg[7];
						status_reg[5:0]<=status_reg[5:0];end
					end else if(err_i) begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;	 					
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[1]<=1'b1;
						status_reg[7:2]<=status_reg[7:2];
						status_reg[0]<=status_reg[0];						
					end else begin
						cyc_wb<=cyc_wb;
	 					stb_wb<=stb_wb;//still 1'b1							
						adr_wb<=adr_wb;
	 					bte_wb<=bte_wb;
	 					we_wb<=we_wb;
	 					sel_wb<=sel_wb;
						status_reg<=status_reg;
					end
				      end
			FETCH_POINTER: begin
					if(ack_i) begin
						if(dat_i[1:0]!=2'b0) begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;						
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[6]<=1'b1;	
						status_reg[7]<=status_reg[7];
						status_reg[5:0]<=status_reg[5:0]; end					
						else if(zero_dma_length | zero_record_length | (!src_rdy)) begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;						
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg<=status_reg; end
						else begin
						cyc_wb<=1'b1;
						stb_wb<=1'b1;	
						we_wb<=~(dma_mode[2]);						 						
						adr_wb<=record_start_addr; //reg signal
						bte_wb<=2'b0;
						sel_wb<=4'hF;
						status_reg<=status_reg;	end
					end else if(err_i) begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;							
						adr_wb<=32'b0;
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;	
						status_reg[2]<=1'b1;
						status_reg[7:3]<=status_reg[7:3];
						status_reg[1:0]<=status_reg[1:0];					
					end else begin
						cyc_wb<=cyc_wb;
	 					stb_wb<=stb_wb;//still 1'b1	 					
						adr_wb<=adr_wb;
	 					bte_wb<=bte_wb;
	 					we_wb<=we_wb;
	 					sel_wb<=sel_wb;
						status_reg<=status_reg;						
					end
				       end
			WRITE_WB: begin
					if(ack_i) begin
						if(single_word_record | single_word_dma | single_word_burst | (~src_rdy)) begin
							cyc_wb<=1'b0;
							stb_wb<=1'b0;							
							adr_wb<=32'b0;							
							bte_wb<=2'b0;
							we_wb<=1'b0;
							sel_wb<=4'b0;
							status_reg<=status_reg; end
						else begin	
							cyc_wb<=1'b1;
							stb_wb<=1'b1;
							we_wb<=~(dma_mode[2]);
							adr_wb<=record_next_addr; //wire signal
							bte_wb<=2'b0;							
							sel_wb<=4'hF;
							status_reg<=status_reg; end
					end else if(err_i) begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;	 							
						adr_wb<=32'b0;	 				
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[3]<=1'b1;
						status_reg[7:4]<=status_reg[7:4];
						status_reg[2:0]<=status_reg[2:0];
					end else begin
						cyc_wb<=cyc_wb;
	 					stb_wb<=stb_wb;							
						adr_wb<=adr_wb;	 					
	 					bte_wb<=bte_wb;
	 					we_wb<=we_wb;
	 					sel_wb<=sel_wb;
						status_reg<=status_reg;
					end		
				  end
			END_BURST: 							
				  begin
				       if(dma_done | zero_dma_length) begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;							
						adr_wb<=32'b0;	 					
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg<=status_reg;
					end else if(record_done | zero_record_length) begin
						if(record_list_ended) begin
							cyc_wb<=1'b0;
							stb_wb<=1'b0;							
							adr_wb<=32'b0;	 					
							bte_wb<=2'b0;
							we_wb<=1'b0;
							sel_wb<=4'b0;
							status_reg<=status_reg;
						end else begin
							cyc_wb<=1'b1;
							stb_wb<=1'b1;							
							adr_wb<=next_record_addr;//reg signal							
							bte_wb<=2'b0;
							we_wb<=1'b0;
							sel_wb<=4'hF;
							status_reg<=status_reg;
						end
					end else if(burst_done) begin
						if(src_rdy) begin
							cyc_wb<=1'b1;
							stb_wb<=1'b1;
							we_wb<=~(dma_mode[2]);
							adr_wb<=record_next_addr;
							bte_wb<=2'b0;						
							sel_wb<=4'hF;
							status_reg<=status_reg;
						end else if(watch_dog_overflow & watch_dog_enabled_i) begin
							cyc_wb<=1'b0;
	 						stb_wb<=1'b0;	 							
							adr_wb<=32'b0;	 				
	 						bte_wb<=2'b0;
	 						we_wb<=1'b0;
	 						sel_wb<=4'b0;
							status_reg[7]<=1'b1;
							status_reg[7:6]<=status_reg[7:6];
							status_reg[4:0]<=status_reg[4:0];
						end else begin
							cyc_wb<=1'b0;
	 						stb_wb<=1'b0;	 							
							adr_wb<=32'b0;	 				
	 						bte_wb<=2'b0;
	 						we_wb<=1'b0;
	 						sel_wb<=4'b0;
							status_reg<=status_reg;
						end						
					end else begin
						cyc_wb<=1'b0;
	 					stb_wb<=1'b0;							
						adr_wb<=32'b0;	 					
	 					bte_wb<=2'b0;
	 					we_wb<=1'b0;
	 					sel_wb<=4'b0;
						status_reg[4]<=1'b1;
						status_reg[7:5]<=status_reg[7:5];
						status_reg[3:0]<=status_reg[3:0];
					end
			   	  end	
			FINISH: begin
					cyc_wb<=1'b0;
	 				stb_wb<=1'b0;	 					
					adr_wb<=32'b0;	 				
	 				bte_wb<=2'b0;
	 				we_wb<=1'b0;
	 				sel_wb<=4'b0;
					status_reg[5]<=1'b1;
					status_reg[7:6]<=status_reg[7:6];
					status_reg[4:0]<=status_reg[4:0];	
				end
			WAIT:	begin
					cyc_wb<=1'b0;
	 				stb_wb<=1'b0;	 					
					adr_wb<=32'b0;	 				
	 				bte_wb<=2'b0;
	 				we_wb<=1'b0;
	 				sel_wb<=4'b0;
	 				if(start_i==1'b0)
	 				  status_reg<=8'b0;
	 				else 
					  status_reg<=status_reg;	
					end
			default: begin
					cyc_wb<=1'b0;
	 				stb_wb<=1'b0;					
					adr_wb<=32'b0;	 				
	 				bte_wb<=2'b0;
	 				we_wb<=1'b0;
	 				sel_wb<=4'b0;
					status_reg<=status_reg;
				 end	
		endcase	
	end
end

assign fifo_rd    =(dma_mode[2]==1'b1)? 1'b0:
		   (state==FETCH_POINTER && zero_dma_length==1'b0 && zero_record_length==1'b0 && dat_i[1:0]==2'b0)? (ack_i & src_rdy):
		   (state==WRITE_WB && single_word_record==1'b0 && single_word_dma==1'b0 &&  single_word_burst==1'b0)? (ack_i & src_rdy):
		   (state==END_BURST && dma_done==1'b0 && zero_dma_length==1'b0 && record_done==1'b0 && zero_record_length==1'b0)? (burst_done & src_rdy):1'b0;


assign DMA_fifo_rd_o_A1=(dma_mode==3'b000) && (fifo_rd==1'b1); 
assign DMA_fifo_rd_o_A2=(dma_mode==3'b001) && (fifo_rd==1'b1); 
assign DMA_fifo_rd_o_B1=(dma_mode==3'b010) && (fifo_rd==1'b1); 
assign DMA_fifo_rd_o_B2=(dma_mode==3'b011) && (fifo_rd==1'b1);
							
//
assign dma_in_use=(state!=IDLE && state!=WAIT) || (state==IDLE && start_i==1'b1);

//
always@(posedge clk_i) begin
	if(reset_i)
		status_valid_reg<=1'b0;
	else if( (state==FINISH) || (state==WAIT && start_i==1'b0) )
		status_valid_reg<=1'b1;
	else
		status_valid_reg<=1'b0;
end

assign stat_valid=status_valid_reg;

assign fin_o=interrupt;

always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_data_A1<=32'b0;
		fifo_data_valid_A1<=1'b0;
	end else if(state==WRITE_WB && ack_i==1'b1 && dma_mode==3'b100) begin
		fifo_data_A1<=dat_i;
		fifo_data_valid_A1<=1'b1;
	end else begin
		fifo_data_A1<=32'b0;
		fifo_data_valid_A1<=1'b0;
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_data_A2<=32'b0;
		fifo_data_valid_A2<=1'b0;
	end else if(state==WRITE_WB && ack_i==1'b1 && dma_mode==3'b101) begin
		fifo_data_A2<=dat_i;
		fifo_data_valid_A2<=1'b1;
	end else begin
		fifo_data_A2<=32'b0;
		fifo_data_valid_A2<=1'b0;
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_data_A3<=32'b0;
		fifo_data_valid_A3<=1'b0;
	end else if(state==WRITE_WB && ack_i==1'b1 && dma_mode==3'b110) begin
		fifo_data_A3<=dat_i;
		fifo_data_valid_A3<=1'b1;
	end else begin
		fifo_data_A3<=32'b0;
		fifo_data_valid_A3<=1'b0;
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_data_A4<=32'b0;
		fifo_data_valid_A4<=1'b0;
	end else if(state==WRITE_WB && ack_i==1'b1 && dma_mode==3'b111) begin
		fifo_data_A4<=dat_i;
		fifo_data_valid_A4<=1'b1;
	end else begin
		fifo_data_A4<=32'b0;
		fifo_data_valid_A4<=1'b0;
	end
end

endmodule
