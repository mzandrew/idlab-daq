`timescale 1ns/1ps

module tx(
	  input rst,

	  input rx_p,
	  input rx_n,
	  output tx_p,
	  output tx_n,

	  input ref_clk1,
	  input dcm_not_locked,

	  output channel_up,

	  input init_clk,

	  output user_clk,

	  input[31:0] fifo_data_i, 
	  input fifo_empty_i,
	  output fifo_read_o
	 );
parameter EXTEND_WATCHDOGS=0;
parameter SIMULATION_P=0;
parameter TXPOST_TAP_PD_P="FALSE";
parameter MGT_POS=0;

//pma generation
wire pma_init;
reg [7:0] pma_init_cnt;
initial begin
        pma_init_cnt<=0;
end
always@(posedge init_clk) begin
        if(pma_init_cnt[7]==0)
                pma_init_cnt<=pma_init_cnt+1;
end

assign pma_init=(~pma_init_cnt[7]);

//internal reset
reg[3:0] rst_cnt;
wire rst_in;
initial begin
	rst_cnt<=0;
end
always@(posedge init_clk) begin
	if(pma_init|rst)
       		rst_cnt<=0;
        else if(rst_cnt[3]==0)
                rst_cnt<=rst_cnt+1;
end
assign rst_in=(~rst_cnt[3]);

//tx aurora core 
wire [31:0] tx_d;
wire tx_src_rdy_n;
wire tx_dst_rdy_n;
wire channel_up_in;
wire power_down;
wire user_clk_in;

assign power_down=0;

tx_aurora_wrapper #(.EXTEND_WATCHDOGS(EXTEND_WATCHDOGS),.SIMULATION_P(SIMULATION_P),.TXPOST_TAP_PD_P(TXPOST_TAP_PD_P),.MGT_POS(MGT_POS)) u_tx_aurora_wrapper(
                      //tx stream interface
                     .tx_d(tx_d),
                     .tx_src_rdy_n(tx_src_rdy_n),
                     .tx_dst_rdy_n(tx_dst_rdy_n),
                      //local link rx interface
                     .rx_d(),
                     .rx_src_rdy_n(),
                      //MGT serial IO
                     .rx_p(rx_p),
                     .rx_n(rx_n),
                     .tx_p(tx_p),
                     .tx_n(tx_n),
                      //MGT reference clock
                     .ref_clk1(ref_clk1),
                      //error detection
                     .hard_error(),
                     .soft_error(),
                      //status
                     .channel_up(channel_up_in),
                     .lane_up(),
                      //calibration block interface
                     .init_clk(init_clk),
                     .pma_init(pma_init),
                      //system interface
                     .dcm_not_locked(dcm_not_locked),

                     .reset(rst_in),
                     .power_down(power_down),
                     .user_clk(user_clk_in)
                 );

assign user_clk=user_clk_in;
assign channel_up=channel_up_in;

tx_control #(.WIDTH(32)) u_tx_control(
				      	.rst(rst_in),
					.clk(user_clk_in),	
					.tx_d(tx_d),
					.tx_src_rdy_n(tx_src_rdy_n),
					.tx_dst_rdy_n(tx_dst_rdy_n),
					.link_active(channel_up_in),
					.fifo_data_i(fifo_data_i),
					.fifo_empty_i(fifo_empty_i),
					.fifo_read_o(fifo_read_o)
				     );


endmodule

