`include "Aurora_ctrl_words.vh"
`timescale 1ns / 1ps

module Aurora_receiver	(
			 input clk_i,
			 input reset_i,
			 //
			 input [31:0] rx_data,
			 input rx_data_src_rdy,
			 //wr fifo interface
			 output reg [31:0] fifo_data,
			 output reg fifo_wr_en,
			 //ctrl words
			 output reg [17:0] partner_empty_slots,
			 output reg partner_empty_slots_valid		 
			);
always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_data<=32'b0;
		fifo_wr_en<=1'b0;
	end else begin
		fifo_data<=rx_data;
		fifo_wr_en<=rx_data_src_rdy;
	end		
end

/*			
localparam IDLE=2'd0,
				PARSE=2'd1,
				RECEIVE_DATA=2'd2;		
			
reg [1:0] state;
reg [31:0] parse_data_reg;
wire ctrl_head_found;
wire data_head_found;
wire [17:0] packet_length;

reg [31:0] rx_data_reg;
reg rx_data_src_rdy_reg;

reg [17:0] packet_length_load;

always@(posedge clk_i) begin
	if(reset_i)
		state<=IDLE;
	else begin
		case(state)
			IDLE: begin
				if(rx_data_src_rdy) state<=PARSE;
				else state<=state;
			      end
			PARSE: 	begin
					if(ctrl_head_found) state<=IDLE;
					else if(data_head_found) begin
						if(packet_length>0) state<=RECEIVE_DATA;
						else state<=IDLE;
					end else
						state<=IDLE;					
				end
			RECEIVE_DATA: begin
					if(all_data_received) state<=IDLE;
					else state<=state;	
				      end
			default: state<=state;
		endcase
	end
end

always@(posedge clk_i) begin
	if(reset_i)
		parse_data_reg<=32'b0;
	else if(state==IDLE && rx_data_src_rdy==1'b1)
		parse_data_reg<=rx_data;
	else
		parse_data_reg<=parse_data_reg;
end

assign ctrl_head_found=(parse_data_reg[31:28]==`CTRL_HEAD)? 1'b1: 1'b0;
assign data_head_found=(parse_data_reg[31:28]==`DATA_HEAD)? 1'b1: 1'b0;
assign packet_length=parse_data_reg[17:0];

always@(posedge clk_i) begin
	if(reset_i) begin
		partner_empty_slots<=18'b0;
		partner_empty_slots_valid<=1'b0;	
	end else if(state==PARSE && ctrl_head_found==1'b1) begin
		partner_empty_slots<=parse_data_reg[17:0];
		partner_empty_slots_valid<=1'b1;	
	end else begin
		partner_empty_slots<=18'b0;
		partner_empty_slots_valid<=1'b0;
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		rx_data_reg<=32'b0;
		rx_data_src_rdy_reg<=1'b0;
	end else begin
		rx_data_reg<=rx_data;
		rx_data_src_rdy_reg<=rx_data_src_rdy;
	end	
end

always@(posedge clk_i) begin
	if(reset_i)
		packet_length_load<=18'b0;
	else if(state==PARSE)
		packet_length_load<=packet_length;
	else if(state==RECEIVE_DATA && rx_data_src_rdy_reg==1'b1)
		packet_length_load<=packet_length_load-1'b1;
	else
		packet_length_load<=packet_length_load;	
end

assign all_data_received=(state==RECEIVE_DATA && packet_length_load==18'd1 && rx_data_src_rdy_reg==1'b1)? 1'b1:1'b0;

always@(posedge clk_i) begin
	if(reset_i) begin
		fifo_data<=32'b0;
		fifo_wr_en<=1'b0;
	end else if(state==RECEIVE_DATA) begin
		fifo_data<=rx_data_reg;
		fifo_wr_en<=rx_data_src_rdy_reg;		
	end else begin
		fifo_data<=32'b0;
		fifo_wr_en<=1'b0;
	end
end

*/
endmodule




