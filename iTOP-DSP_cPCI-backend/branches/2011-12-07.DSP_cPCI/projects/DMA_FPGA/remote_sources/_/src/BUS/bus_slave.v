`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:26 06/05/2011 
// Design Name: 
// Module Name:    bus_slave 
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
module bus_slave(
		input clk_i,
		input reset_i,
		//bus interface
		output ack_o,
		output abort_o,
		input m_rdy_i,
		output s_rdy_o,
		input we_i,
		input stb_i,		
		output [31:0] dat_o,
		output dat_o_enable_o,
		input [31:0] dat_i,
		
		output req_w_o_1,
		output req_w_o_2,
		
		output req_r_o_1,
		output req_r_o_2,		
		//read fifo  1 interface
		output r_fifo_rd_o_1,
		input [31:0] r_fifo_dat_i_1,
		input r_fifo_empty_i_1,
		input r_fifo_almost_empty_i_1,
		input r_fifo_prog_empty_i_1,
		//read fifo  2 interface
		output r_fifo_rd_o_2,
		input [31:0] r_fifo_dat_i_2,
		input r_fifo_empty_i_2,
		input r_fifo_almost_empty_i_2,
		input r_fifo_prog_empty_i_2,
		//write fifo interface 1
		output reg [31:0] w_fifo_dat_o_1,
		output reg w_fifo_dat_valid_o_1,
		input w_fifo_full_i_1,
		input w_fifo_almost_full_i_1,
		input w_fifo_prog_full_i_1,//
		//write fifo interface 2
		output reg [31:0] w_fifo_dat_o_2,
		output reg w_fifo_dat_valid_o_2,
		input w_fifo_full_i_2,
		input w_fifo_almost_full_i_2,
		input w_fifo_prog_full_i_2
    );

reg [2:0] state;
parameter	IDLE=3'd0,
				WRITE_ACK=3'd1,	
				READ_ACK=3'd2,		
				WRITE_BURST=3'd3,
				READ_BURST=3'd4,
        			WAIT=3'd5;

reg ack;
reg abort;
reg s_rdy;

reg req_r_1;
reg req_r_2;

reg req_w_1;
reg req_w_2;

reg r_mode;

reg r_fifo_rd_1;
reg r_fifo_rd_2;

initial begin
	state<=IDLE;
	ack<=1'b0;
	req_r_1<=1'b0;
	req_r_2<=1'b0;
	req_w_1<=1'b0;
	req_w_2<=1'b0;
	s_rdy<=1'b0;
	abort<=1'b0;
end

assign #2 ack_o=ack;
assign #2 abort_o=abort;

always@(posedge clk_i) begin
	if(reset_i)
		req_w_1<=1'b0;
	else if(w_fifo_prog_full_i_1==1'b0)
		req_w_1<=1'b1;
	else
		req_w_1<=1'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		req_w_2<=1'b0;
	else if(w_fifo_prog_full_i_2==1'b0)
		req_w_2<=1'b1;
	else
		req_w_2<=1'b0;
end

assign #2 req_w_o_1=req_w_1;
assign #2 req_w_o_2=req_w_2;

always@(posedge clk_i) begin
	if(reset_i)
		req_r_1<=1'b0;
	else if(r_fifo_empty_i_1==1'b0)	
		req_r_1<=1'b1;
	else
		req_r_1<=1'b0;
end

assign #2 req_r_o_1=req_r_1;

always@(posedge clk_i) begin
	if(reset_i)
		req_r_2<=1'b0;
	else if(r_fifo_empty_i_2==1'b0)	
		req_r_2<=1'b1;
	else
		req_r_2<=1'b0;
end

assign #2 req_r_o_2=req_r_2;

always@(posedge clk_i) begin
	if(reset_i) begin
		w_fifo_dat_o_1<=32'b0;
		w_fifo_dat_valid_o_1<=1'b0;
	end else begin
		w_fifo_dat_o_1<=dat_i;
		w_fifo_dat_valid_o_1<=m_rdy_i & (~r_mode);
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		w_fifo_dat_o_2<=32'b0;
		w_fifo_dat_valid_o_2<=1'b0;
	end else begin
		w_fifo_dat_o_2<=dat_i;
		w_fifo_dat_valid_o_2<=m_rdy_i & (r_mode);
	end
end

assign #2 r_fifo_rd_o_1=r_fifo_rd_1;
assign #2 r_fifo_rd_o_2=r_fifo_rd_2;

always@(posedge clk_i) begin
	if(reset_i)
		s_rdy<=1'b0;
	else
		s_rdy<=(r_fifo_rd_1 | r_fifo_rd_2);
end

assign #2 s_rdy_o=s_rdy;
assign #2 dat_o_enable_o=s_rdy;

assign #2 dat_o=(r_mode==1'b0)? r_fifo_dat_i_1[31:0]:r_fifo_dat_i_2[31:0];

always@(posedge clk_i) begin
	if(reset_i) 
		r_mode<=1'b0;
	else if(state==IDLE && stb_i==1'b1 )
		r_mode<=dat_i[0];
	else
		r_mode<=r_mode;
end

always@(*) begin
	case(state)
		IDLE: begin
					ack<=1'b0;
					abort<=1'b0;
					r_fifo_rd_1<=1'b0;
					r_fifo_rd_2<=1'b0;
				end
		WRITE_ACK: begin
						 if(r_mode==1'b0) begin
							ack<=(~w_fifo_prog_full_i_1);
							abort<=w_fifo_prog_full_i_1;
						 end else begin
							ack<=(~w_fifo_prog_full_i_2);
							abort<=w_fifo_prog_full_i_2;
						 end
						 r_fifo_rd_1<=1'b0;
						 r_fifo_rd_2<=1'b0;
					  end
		WRITE_BURST: begin
							ack<=1'b1;
							abort<=1'b0;
							r_fifo_rd_1<=1'b0;
							r_fifo_rd_2<=1'b0;
						 end					 
		READ_ACK: begin
							if((r_fifo_empty_i_1==1'b1 && r_mode==1'b0)||
								(r_fifo_empty_i_2==1'b1 && r_mode==1'b1)) begin
								ack<=1'b0;
								abort<=1'b1;
								r_fifo_rd_1<=1'b0;
								r_fifo_rd_2<=1'b0;
							end else begin
								ack<=1'b1;
								abort<=1'b0;
								if(r_mode==1'b0) begin
									r_fifo_rd_1<=1'b1;
									r_fifo_rd_2<=1'b0;
								end else begin
									r_fifo_rd_1<=1'b0;
									r_fifo_rd_2<=1'b1;
								end									
							end		
					 end
		READ_BURST: begin
							if(stb_i==1'b0) begin
							   ack<=1'b0;
								 abort<=1'b0;
								 r_fifo_rd_1<=1'b0;
								 r_fifo_rd_2<=1'b0;
              end else if((r_fifo_empty_i_1==1'b1 && r_mode==1'b0)||
								(r_fifo_empty_i_2==1'b1 && r_mode==1'b1)) begin
								ack<=1'b0;
								abort<=1'b0;
								r_fifo_rd_1<=1'b0;
								r_fifo_rd_2<=1'b0;
							end else begin
								ack<=1'b1;
								abort<=1'b0;
								if(r_mode==1'b0) begin
									r_fifo_rd_1<=1'b1;
									r_fifo_rd_2<=1'b0;
								end else begin
									r_fifo_rd_1<=1'b0;
									r_fifo_rd_2<=1'b1;
								end
							end			
						end
		WAIT: begin
		           ack<=1'b0;
	              abort<=1'b0;
							 r_fifo_rd_1<=1'b0;
							 r_fifo_rd_2<=1'b0;
            end				
		default: begin
						ack<=1'b0;
						abort<=1'b0;
						r_fifo_rd_1<=1'b0;
						r_fifo_rd_2<=1'b0;
					end
							
	endcase
end

		

always@(posedge clk_i) begin
	if(reset_i)
		state<=IDLE;
	else begin
		case(state)
				IDLE: begin
							if(we_i==1'b1 && stb_i==1'b1)
									state<=WRITE_ACK;
							else if(we_i==1'b0 && stb_i==1'b1)
									state<=READ_ACK;								
							else
									state<=IDLE;
						end		
				WRITE_ACK: begin
									if(w_fifo_prog_full_i_1==1'b0 && r_mode==1'b0)
											state<=WRITE_BURST;
									else if(w_fifo_prog_full_i_2==1'b0 && r_mode==1'b1)
											state<=WRITE_BURST;
									else
											state<=WAIT;
							  end
				WRITE_BURST: begin
									if(stb_i==1'b0) state<=IDLE; 
									else if(w_fifo_prog_full_i_1==1'b1 && r_mode==1'b0) state<=WAIT;
									else if(w_fifo_prog_full_i_2==1'b1 && r_mode==1'b1) state<=WAIT;
									else state<=state;
								 end							 
				READ_ACK:begin 
								if((r_fifo_empty_i_1==1'b1 && r_mode==1'b0)||
								   (r_fifo_empty_i_2==1'b1 && r_mode==1'b1)) state<=WAIT;
								else state<=READ_BURST;				 
							end
				READ_BURST: begin
									if(stb_i==1'b0) state<=IDLE; 
									else if((r_fifo_empty_i_1==1'b1 && r_mode==1'b0)||
								          (r_fifo_empty_i_2==1'b1 && r_mode==1'b1)) state<=WAIT;
									else state<=state;
								end
				WAIT: begin
				         if(stb_i==1'b0) state<=IDLE;
				         else state<= WAIT;
                end				
				default: state<=IDLE;	
		endcase
	end	
end

endmodule
