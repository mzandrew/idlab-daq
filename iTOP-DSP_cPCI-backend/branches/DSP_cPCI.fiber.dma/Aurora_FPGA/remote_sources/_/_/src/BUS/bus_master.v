`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:37 06/05/2011 
// Design Name: 
// Module Name:    bus_master 
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

module bus_master(
						input clk_i,
						input reset_i,
						//bus interface
						input ack_i,
						input abort_i,
						output m_rdy_o,
						input  s_rdy_i,
						output we_o,						
						output stb_o,						
						input [31:0] dat_i,					
						output reg [31:0] dat_o,						
						output dat_o_enable_o,

						input req_w_1,
						input req_w_2,
						
						input req_r_1,
						input req_r_2,							
						//read fifo interface 1
						output r_fifo_rd_o_1,
						input [31:0] r_fifo_dat_i_1,
						input r_fifo_empty_i_1,
						input r_fifo_almost_empty_i_1,	
						input r_fifo_prog_empty_i_1,	
						//read fifo interface 2
						output r_fifo_rd_o_2,
						input [31:0] r_fifo_dat_i_2,
						input r_fifo_empty_i_2,
						input r_fifo_almost_empty_i_2,	
						input r_fifo_prog_empty_i_2,		
						//write fifo 1 interface
						output reg [31:0] w_fifo_dat_o_1,
						output reg w_fifo_dat_valid_o_1,
						input w_fifo_full_i_1,
						input w_fifo_almost_full_i_1,
						input w_fifo_prog_full_i_1,//
						//write fifo 2 interface
						output reg [31:0] w_fifo_dat_o_2,
						output reg w_fifo_dat_valid_o_2,
						input w_fifo_full_i_2,
						input w_fifo_almost_full_i_2,
						input w_fifo_prog_full_i_2//
						);

reg [2:0] state;
parameter	IDLE=3'd0,
				WRITE_REQ=3'd1,
				READ_REQ=3'd2,
				WRITE_BURST=3'd3,
				READ_BURST=3'd4,
				WAIT=3'd5,
				WRITE_REQ_ISSUE=3'd6,
				READ_REQ_ISSUE=3'd7;				
				


reg start_rd_1;
reg start_rd_2;
reg start_wr_1;
reg start_wr_2;

reg[1:0] last_done;

reg we;
reg stb;
reg m_rdy;

reg dat_o_enable;
reg r_fifo_rd_1;
reg r_fifo_rd_2;
reg r_mode;

					  
initial begin
	last_done<=2'b00;
end					 

always@(posedge clk_i) begin
	if(reset_i)
		last_done<=2'b0;
	else if(state==IDLE && start_wr_1==1'b1)
		last_done<=2'b11;//try wr_2;
	else if(state==IDLE && start_wr_2==1'b1)
		last_done<=2'b01;//try rd_1
	else if(state==IDLE && start_rd_1==1'b1)
		last_done<=2'b10;//try rd_2
	else if(state==IDLE && start_rd_2==1'b1)
		last_done<=2'b00;//try wr_1
	else
		last_done<=last_done;
end 

//priority 
always@(*) begin
	if(r_fifo_empty_i_1==1'b0 && last_done==2'b00 && req_w_1==1'b1) begin
			start_wr_1<=1'b1;
			start_wr_2<=1'b0;
			start_rd_1<=1'b0;
			start_rd_2<=1'b0;
	end else if(r_fifo_empty_i_2==1'b0 && last_done==2'b11 && req_w_2==1'b1) begin	
			start_wr_1<=1'b0;
			start_wr_2<=1'b1;
			start_rd_1<=1'b0;
			start_rd_2<=1'b0;
	end else if(w_fifo_prog_full_i_1==1'b0 && last_done==2'b01 && req_r_1==1'b1) begin
			start_wr_1<=1'b0;
			start_wr_2<=1'b0;
			start_rd_1<=1'b1;
			start_rd_2<=1'b0;
	end else if(w_fifo_prog_full_i_2==1'b0 && last_done==2'b10 && req_r_2==1'b1) begin
			start_wr_1<=1'b0;
			start_wr_2<=1'b0;
			start_rd_1<=1'b0;
			start_rd_2<=1'b1;	
	end else if(r_fifo_empty_i_1==1'b0 && req_w_1==1'b1) begin
			start_wr_1<=1'b1;
			start_wr_2<=1'b0;
			start_rd_1<=1'b0;
			start_rd_2<=1'b0;
	end else if(r_fifo_empty_i_2==1'b0 && req_w_2==1'b1) begin
			start_wr_1<=1'b0;
			start_wr_2<=1'b1;
			start_rd_1<=1'b0;
			start_rd_2<=1'b0;		
	end else if(w_fifo_prog_full_i_1==1'b0 && req_r_1==1'b1) begin
			start_wr_1<=1'b0;
			start_wr_2<=1'b0;
			start_rd_1<=1'b1;
			start_rd_2<=1'b0;
	end else if(w_fifo_prog_full_i_2==1'b0 && req_r_2==1'b1) begin
			start_wr_1<=1'b0;
			start_wr_2<=1'b0;
			start_rd_1<=1'b0;
			start_rd_2<=1'b1;
	end else begin
			start_wr_1<=1'b0;
			start_wr_2<=1'b0;
			start_rd_1<=1'b0;
			start_rd_2<=1'b0;
	end	
end					 

assign #2 r_fifo_rd_o_1=r_fifo_rd_1;	
assign #2 r_fifo_rd_o_2=r_fifo_rd_2;	

always@(*) begin
	if(state==WRITE_BURST) begin
		if(r_mode==1'b0) dat_o<=r_fifo_dat_i_1;
		else dat_o<=r_fifo_dat_i_2;
	end else
		dat_o<={31'b0,r_mode};
end					 
assign #2 dat_o_enable_o=dat_o_enable;

assign #2 we_o=we;
assign #2 stb_o=stb;
assign #2 m_rdy_o=m_rdy;

always@(posedge clk_i) begin
	if(reset_i) begin
		w_fifo_dat_o_1<=32'b0;
		w_fifo_dat_valid_o_1<=1'b0;
	end else begin
		w_fifo_dat_o_1<=dat_i;
		w_fifo_dat_valid_o_1<=(~r_mode) & s_rdy_i;
	end
end

always@(posedge clk_i) begin
	if(reset_i) begin
		w_fifo_dat_o_2<=32'b0;
		w_fifo_dat_valid_o_2<=1'b0;
	end else begin
		w_fifo_dat_o_2<=dat_i;
		w_fifo_dat_valid_o_2<=(r_mode) & s_rdy_i;
	end
end

always@(posedge clk_i) begin
	if(reset_i)
		r_mode<=1'b0;
	else if(state==IDLE && start_wr_1==1'b1)
		r_mode<=1'b0;
	else if(state==IDLE && start_wr_2==1'b1)	
		r_mode<=1'b1;
	else if(state==IDLE && start_rd_1==1'b1)
		r_mode<=1'b0;
	else if(state==IDLE && start_rd_2==1'b1)
		r_mode<=1'b1;
	else
		r_mode<=r_mode;
end

always@(*) begin
	case(state)
		IDLE: begin
					we<=1'b0;
					stb<=1'b0;
					m_rdy<=1'b0;
					dat_o_enable<=1'b0;
					r_fifo_rd_1<=1'b0;
					r_fifo_rd_2<=1'b0;
				end		
		WRITE_REQ_ISSUE: begin
		          we<=1'b1;
  						  stb<=1'b1;
     						  m_rdy<=1'b0;
						  dat_o_enable<=1'b1;
						  r_fifo_rd_1<=1'b0;
						  r_fifo_rd_2<=1'b0;
		        end		
		WRITE_REQ: begin
		        			we<=1'b1;
						stb<=1'b1;
						m_rdy<=1'b0;
						dat_o_enable<=1'b0;
						if(r_mode==1'b0) begin
							r_fifo_rd_1<=ack_i & (~r_fifo_empty_i_1);
							r_fifo_rd_2<=1'b0;
						end else begin
							r_fifo_rd_1<=1'b0;
							r_fifo_rd_2<=ack_i & (~r_fifo_empty_i_2);
						end
							
            end	       		 
    READ_REQ_ISSUE: begin
              we<=1'b0;
  						  stb<=1'b1;
     						  m_rdy<=1'b0;
						  dat_o_enable<=1'b1;
						  r_fifo_rd_1<=1'b0;
						  r_fifo_rd_2<=1'b0;
            end         
		READ_REQ: begin
						we<=1'b0;
						stb<=1'b1;
						m_rdy<=1'b0;
						dat_o_enable<=1'b0;
						r_fifo_rd_1<=1'b0;
						r_fifo_rd_2<=1'b0;
					 end
		WRITE_BURST: begin
							we<=1'b1;
							stb<=1'b1;
							m_rdy<=1'b1;
							dat_o_enable<=1'b1;
							if(r_mode==1'b0) begin
								r_fifo_rd_1<=ack_i & (~r_fifo_empty_i_1);
								r_fifo_rd_2<=1'b0;
							end else begin
								r_fifo_rd_1<=1'b0;
								r_fifo_rd_2<=ack_i & (~r_fifo_empty_i_2);
							end							
						 end
		READ_BURST: begin
							we<=1'b0;
							stb<=1'b1;
							m_rdy<=1'b0;
							dat_o_enable<=1'b0;
							r_fifo_rd_1<=1'b0;
							r_fifo_rd_2<=1'b0;
						end
		WAIT: begin
					we<=1'b0;
					stb<=1'b0;
					m_rdy<=1'b0;
					dat_o_enable<=1'b0;
					r_fifo_rd_1<=1'b0;
					r_fifo_rd_2<=1'b0;
		      end
		default: begin
					we<=1'b0;
					stb<=1'b0;
					m_rdy<=1'b0;
					dat_o_enable<=1'b0;
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
									if(start_wr_1|start_wr_2) state<=WRITE_REQ_ISSUE;
									else if(start_rd_1|start_rd_2) state<=READ_REQ_ISSUE;
									else state<=IDLE;
								end						
						WRITE_REQ_ISSUE: state<=WRITE_REQ;
						WRITE_REQ: begin 
											if(ack_i==1'b1) begin
												if(r_fifo_empty_i_1==1'b1 && r_mode==1'b0) state<=WAIT;
												else if(r_fifo_empty_i_2==1'b1 && r_mode==1'b1) state<=WAIT;
												else state<=WRITE_BURST;
											end 
											else if(abort_i==1'b1) state<=IDLE;
											else state<=state;
									  end 									  
						READ_REQ_ISSUE: state<=READ_REQ;			  
						READ_REQ: begin
											if(ack_i==1'b1) begin
												if((r_mode==1'b0 && w_fifo_prog_full_i_1==1'b1)||
												   (r_mode==1'b1 && w_fifo_prog_full_i_2==1'b1)) state<=WAIT;
												else state<=READ_BURST;													
											end 
											else if(abort_i==1'b1) state<=IDLE;
											else state<=state;
									 end												
						WRITE_BURST: begin
												if(ack_i==1'b0) state<=IDLE; 
												else if(r_fifo_empty_i_1==1'b1 && r_mode==1'b0) state<=WAIT;
												else if(r_fifo_empty_i_2==1'b1 && r_mode==1'b1) state<=WAIT;
												else state<=state;
										 end
						READ_BURST: begin
												if(ack_i==1'b0) state<=IDLE; 
												else if((r_mode==1'b0 && w_fifo_prog_full_i_1==1'b1)||
												        (r_mode==1'b1 && w_fifo_prog_full_i_2==1'b1) ) state<=WAIT;
												else state<=state;
										end						
						WAIT: begin
							if(ack_i==1'b0) state<=IDLE;
							else state<=state;
						      end
						default: state<=IDLE;				
		endcase
	end
end
						
endmodule					


