`include "Aurora_ctrl_words.vh"
`timescale 1ns/1ps


module Aurora_transmitter(
			  input clk_i,
			  input reset_i, 
			  //rd fifo interface
			  output fifo_rd,
			  input [31:0] fifo_dat,
			  input	fifo_empty,
			  input [17:0] fifo_cnt,
			  input fifo_dat_valid,
			  //wr fifo interface
			  input [17:0] empty_slots, //lower bounds of available slots
			  //partner info
			  input [17:0] partner_empty_slots,
			  input partner_empty_slots_valid,
			  //
			  output [31:0] tx_data,
			  output tx_data_src_rdy,	
			  input tx_data_dst_rdy						  	  
			);

reg tx_data_src_rdy_reg;
wire fifo_rd_in;
			
always@(posedge clk_i) begin
	if(reset_i) begin
		tx_data_src_rdy_reg<=1'b0;
	end else begin
		case({tx_data_src_rdy_reg,fifo_rd_in,tx_data_dst_rdy})
			3'b000: tx_data_src_rdy_reg<=1'b0;
			3'b100: tx_data_src_rdy_reg<=1'b1;
			3'b001: tx_data_src_rdy_reg<=1'b0;
			3'b010: tx_data_src_rdy_reg<=1'b1;
			3'b011: tx_data_src_rdy_reg<=1'b1;
			3'b101: tx_data_src_rdy_reg<=1'b0;
			3'b110: tx_data_src_rdy_reg<=1'b1; //impossible to happen
			3'b111: tx_data_src_rdy_reg<=1'b1;
			default: tx_data_src_rdy_reg<=1'b0;
		endcase
	end
end			

assign tx_data_src_rdy=tx_data_src_rdy_reg;

assign tx_data = fifo_dat;
assign fifo_rd_in=(~reset_i) & (~fifo_empty) & (tx_data_dst_rdy);
assign fifo_rd=fifo_rd_in;
			
/*
parameter IDLE=2'd0,
	  SEND_FLOW=2'd1,
	  SEND_DATA_HEAD=2'd2,
	  SEND_DATA=2'd3;
	

reg [1:0] state; 
reg last_transfer;
reg send_data_head_finished;
reg send_flow_finished;
reg [17:0] packet_length;
reg [17:0] packet_length_load;
reg  [17:0] partner_empty_slots_in;
reg send_data_finished;
reg fifo_rd_in;

wire comp_1;
wire comp_2;
wire comp_3;

reg ctrl_flow_scheduled;
reg data_flow_scheduled;

//scheduler
always@(posedge clk_i) begin
	if(reset_i)
		last_transfer<=1'b1;
	else if(state==IDLE && ctrl_flow_scheduled==1'b1)
		last_transfer<=1'b0;
	else if(state==IDLE && data_flow_scheduled==1'b1)
		last_transfer<=1'b1;
	else
		last_transfer<=last_transfer;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		ctrl_flow_scheduled<=1'b0;
		data_flow_scheduled<=1'b0;	
	end else if (last_transfer==1'b1) begin
		ctrl_flow_scheduled<=1'b1;
		data_flow_scheduled<=1'b0;
	end else if(fifo_cnt>0) begin
		ctrl_flow_scheduled<=1'b0;
		data_flow_scheduled<=1'b1;
	end else begin
		ctrl_flow_scheduled<=1'b1;
		data_flow_scheduled<=1'b0;
	end		
end

//

always@(posedge clk_i) begin
	if(reset_i)
		partner_empty_slots_in<=18'b0;
	else if(partner_empty_slots_valid)
		partner_empty_slots_in<=partner_empty_slots;
	else if(state==SEND_DATA && tx_data_dst_rdy==1'b1)
		partner_empty_slots_in<=partner_empty_slots_in-1'b1;
	else
		partner_empty_slots_in<=partner_empty_slots_in;
end

assign comp_1=(fifo_cnt<`AURORA_PACKET_LENGTH)? 1'b1: 1'b0;
assign comp_2=(fifo_cnt<partner_empty_slots_in)? 1'b1: 1'b0;
assign comp_3=(partner_empty_slots_in < `AURORA_PACKET_LENGTH)? 1'b1: 1'b0;

always@(posedge clk_i) begin
	if(reset_i)
		packet_length<=18'b0;
	else if(state==IDLE && ctrl_flow_scheduled==1'b0 && data_flow_scheduled==1'b1) begin
		case({comp_1,comp_2,comp_3})
			3'b000: packet_length<= `AURORA_PACKET_LENGTH;
			3'b001: packet_length<= partner_empty_slots_in;
			3'b010: packet_length<= `AURORA_PACKET_LENGTH;
			3'b011: packet_length<= 0;//impossible to happen
			3'b100: packet_length<= 0;//impossible to happen
			3'b101: packet_length<= partner_empty_slots_in;
			3'b110: packet_length<= fifo_cnt;
			3'b111: packet_length<= fifo_cnt;
			default: packet_length<= 0;
		endcase
	end else
		packet_length<=packet_length;
end

always@(posedge clk_i) begin
	if(reset_i)
		packet_length_load<=18'b0;
	else if(state==SEND_DATA_HEAD)
		packet_length_load<=packet_length;
	else if(state==SEND_DATA && tx_data_dst_rdy==1'b1)
		packet_length_load<=packet_length_load-1'b1;
	else
		packet_length_load<=packet_length_load;
end

always@(posedge clk_i) begin
	if(reset_i)
		send_data_finished<=1'b0;
	else if(state==SEND_DATA && tx_data_dst_rdy==1'b1 && packet_length_load==18'd1)
		send_data_finished<=1'b1;
	else
		send_data_finished<=1'b0;
end


always@(posedge clk_i) begin
	if(reset_i)
		state<=IDLE;
	else begin
		case(state)
			IDLE: begin
				if(ctrl_flow_scheduled) state<=SEND_FLOW;
				else if(data_flow_scheduled) state<=SEND_DATA_HEAD;
				else state<=state;	
			      end	
			SEND_FLOW: begin
					if(send_flow_finished) state<=IDLE;
					else state<=state;			
				   end
			SEND_DATA_HEAD: begin
						if(send_data_head_finished) begin
							if(packet_length>0)
								state<=SEND_DATA;
							else
								state<=IDLE;

						end else state<=state;			
				   	end	
			SEND_DATA: begin
						if(send_data_finished) state<=IDLE;
						else state<=state;
				   end	
			default: state<=IDLE;
		endcase
	end
end

assign fifo_rd = fifo_rd_in;

always@(*) begin
	case(state)
		IDLE:   	begin
					tx_data<=32'b0;
					tx_data_src_rdy<=1'b0;
					fifo_rd_in<=1'b0;

					send_data_head_finished<=1'b0;
					send_flow_finished<=1'b0;
				end
		SEND_FLOW: 	begin
					tx_data<={`CTRL_HEAD,10'b0,empty_slots};
					tx_data_src_rdy<=1'b1;
					fifo_rd_in<=1'b0;

					send_data_head_finished<=1'b0;
					send_flow_finished<=tx_data_dst_rdy;
				end
		SEND_DATA_HEAD: begin
					tx_data<={`DATA_HEAD,10'b0,packet_length};
					tx_data_src_rdy<=1'b1;
					if(send_data_head_finished==1'b1 && packet_length>0)
						fifo_rd_in<=1'b1;
					else
						fifo_rd_in<=1'b0;

					send_data_head_finished<=tx_data_dst_rdy;
					send_flow_finished<=1'b0;
				end
		SEND_DATA: 	begin
					tx_data<= fifo_dat;
					tx_data_src_rdy<=(~send_data_finished);
					fifo_rd_in<=(~send_data_finished) & tx_data_dst_rdy;

					send_data_head_finished<=1'b0;
					send_flow_finished<=1'b0;
				end
		default:	begin
					tx_data<=32'b0;
					tx_data_src_rdy<=1'b0;
					fifo_rd_in<=1'b0;

					send_data_head_finished<=1'b0;
					send_flow_finished<=1'b0;
			 	end
	endcase
end

*/
endmodule

