`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:03 06/30/2011 
// Design Name: 
// Module Name:    Aurora_FPGA_ctrl_bk 
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
module Aurora_FPGA_ctrl(
		input user_clk,
		input pll_not_locked, //will reset channel
		//
		input rst, //clear fifo and logic, will reset channel
		//
		input channel_rdy,
		
			//rd fifo interface
		    input [31:0] fifo_dat_i,
		    input fifo_empty_i,
		    output fifo_rd_o,	
		    //wr fifo interface
		    output [31:0] fifo_wr_dat_o,
		    output fifo_wr_o,
		    input  fifo_full_i, //should be connected to almost_full flag
		    //Aurora transfer interface
		    output [31:0] tx_data,
		    output tx_data_src_rdy,	
		    input tx_data_dst_rdy,

		    input [31:0] rx_data,
		    input rx_data_src_rdy 
    );

wire rst_in;
reg [7:0] rst_fifo_cnt;
wire rst_in_delay;

assign rst_in = rst | pll_not_locked;

always@(posedge user_clk or posedge rst_in) begin
	if(rst_in)
		rst_fifo_cnt<=8'b0;
	else if(rst_fifo_cnt[4]==1'b0)
		rst_fifo_cnt<=rst_fifo_cnt+1'b1;
	else
		rst_fifo_cnt<=rst_fifo_cnt;
end

assign rst_in_delay=(~rst_fifo_cnt[4]);

//--------------------------------------

wire fifo_rd_t;
wire [31:0] fifo_rd_data_t;
wire [17:0] fifo_cnt_t;
wire [17:0] partner_empty_slots;
wire partner_empty_slots_valid;
wire [17:0] empty_slots;
wire fifo_wr_s;
wire [31:0] fifo_wr_dat_s;

wire rst_transmitter;
wire rst_receiver;

prefetch_fifo u_prefetch_fifo(
				.clk_i(user_clk),
			 	.reset_i(rst_in_delay), //logic
				.reset_i_fifo(rst_in), //fifo
				//rd fifo interface
			  	.fifo_dat_i(fifo_dat_i),
			 	.fifo_empty_i(fifo_empty_i),
			 	.fifo_rd_o(fifo_rd_o),
			 	//Aurora transmitter interface
				.prefetch_fifo_empty(prefetch_fifo_empty),
				.fifo_rd_i(fifo_rd_t),
			 	.fifo_dat_o(fifo_rd_data_t),
			 	.fifo_cnt_o(fifo_cnt_t)
				);

assign rst_transmitter= (~channel_rdy) | rst_in_delay;

Aurora_transmitter u_Aurora_transmitter(
					.clk_i(user_clk),
			  		.reset_i(rst_transmitter),
			  		//rd fifo interface
			  		.fifo_rd(fifo_rd_t),
			  		.fifo_dat(fifo_rd_data_t),
			  		.fifo_empty(prefetch_fifo_empty),
			  		.fifo_cnt(fifo_cnt_t),
			  		.fifo_dat_valid(1'b0),
			  		//wr fifo interface
			  		.empty_slots(empty_slots), //lower bounds of available slots
			  		//partner info
			  		.partner_empty_slots(partner_empty_slots),
			  		.partner_empty_slots_valid(partner_empty_slots_valid),
			  		//
			 		.tx_data(tx_data),
			  		.tx_data_src_rdy(tx_data_src_rdy),	
			  		.tx_data_dst_rdy(tx_data_dst_rdy)	
					);

assign rst_receiver= (~channel_rdy) | rst_in_delay;

Aurora_receiver u_Aurora_receiver(
				  .clk_i(user_clk),
			 	  .reset_i(rst_receiver),
			 	  //
				  .rx_data(rx_data),
			 	  .rx_data_src_rdy(rx_data_src_rdy),
			 	  //wr fifo interface
			 	  .fifo_data(fifo_wr_dat_s),
			 	  .fifo_wr_en(fifo_wr_s),
				  //ctrl words
			 	  .partner_empty_slots(partner_empty_slots),
			 	  .partner_empty_slots_valid(partner_empty_slots_valid)		
				);

hold_fifo u_hold_fifo(
			.clk_i(user_clk),
		 	.reset_i(rst_in_delay),
		 	.reset_i_fifo(rst_in),
		 	//wr fifo interface
			 .fifo_wr_dat_o(fifo_wr_dat_o),
			 .fifo_wr_o(fifo_wr_o),
			 .fifo_full_i(fifo_full_i), 
		 	//Aurora receiver interface
			 .fifo_wr_i(fifo_wr_s),
			 .fifo_wr_dat_i(fifo_wr_dat_s),
		 	//Aurora transmitter interface
		 	 .empty_slots(empty_slots)
			);





endmodule
