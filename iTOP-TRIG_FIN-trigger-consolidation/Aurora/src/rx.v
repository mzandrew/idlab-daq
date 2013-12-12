`timescale 1ns/1ps

module rx(
	  rst,
	  //MGT serial IO
	  rx_p,
	  rx_n,
	  tx_p,
	  tx_n,
	  //MGT ref clk
	  ref_clk1,
	  dcm_not_locked,
	  //channel status
	  channel_up, 
	  //Aurora calibration
	  init_clk,
	  //user clk
	  user_clk,
	  //FIFO interface
	  fifo_data_o,
	  fifo_wren_o,
	  fifo_full_i
	 );
parameter CNO=8;
parameter EXTEND_WATCHDOGS=0;
parameter SIMULATION_P=0;
parameter TXPOST_TAP_PD_P="FALSE";
parameter [32*CNO-1:0]MGT_ARRAY={
                                     //TWO MGTs in the same tile
                                     {32'd0}, //X1Y0
                                     {32'd1}, //X1Y1
                                     //TWO MGTs in the same tile
                                     {32'd2}, //X1Y2
                                     {32'd3}, //X1Y3
                                     //TWO MGTs in the same tile
                                     {32'd4}, //X1Y4
                                     {32'd5}, //X1Y5
                                     //TWO MGTs in the same tile
                                     {32'd5}, //X0Y5
                                     {32'd4} //X0Y4
                                    };


input [CNO-1:0] rst;
input [CNO-1:0] rx_p;
input [CNO-1:0] rx_n;
output [CNO-1:0] tx_p;
output [CNO-1:0] tx_n;
input [CNO-1:0] ref_clk1;
input [CNO-1:0] dcm_not_locked;
output [CNO-1:0] channel_up;
input init_clk;
output [CNO-1:0] user_clk;
output [CNO*32-1:0] fifo_data_o;
output [CNO-1:0] fifo_wren_o;
input [CNO-1:0] fifo_full_i;

//pma_init generation
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

//internal resets
reg[CNO*4-1:0] rst_cnt;
wire [CNO-1:0] rst_in;
initial rst_cnt<=0;

genvar i;
generate 
	for(i=0;i<CNO;i=i+1) begin: RX_RESET_ARRAY
		always@(posedge init_clk) begin
			if(pma_init|rst[i]) 
				rst_cnt[i*4+3:i*4]<=0;	
			else if(rst_cnt[i*4+3]==0)
				rst_cnt[i*4+3:i*4]<=rst_cnt[i*4+3:i*4]+1;
		end
		assign rst_in[i]=(~rst_cnt[i*4+3]);
	end
endgenerate

//rx aurora core array
wire [32*CNO-1:0] rx_d;
wire [CNO-1:0] rx_src_rdy_n;
wire [32*CNO-1:0] tx_d;
wire [CNO-1:0] tx_src_rdy_n;
wire [CNO-1:0] channel_up_in;
wire [CNO-1:0] power_down;
wire [CNO-1:0] user_clk_in;

assign tx_d=0;
assign tx_src_rdy_n=0;
assign power_down=0;

rx_aurora_wrapper #(.EXTEND_WATCHDOGS(EXTEND_WATCHDOGS),.SIMULATION_P(SIMULATION_P),.TXPOST_TAP_PD_P(TXPOST_TAP_PD_P),.CNO(CNO),.MGT_ARRAY(MGT_ARRAY)) u_rx_aurora_wrapper(
                      //tx stream interface
                     .tx_d(tx_d),
                     .tx_src_rdy_n(tx_src_rdy_n),
                     .tx_dst_rdy_n(),
                      //local link rx interface
                     .rx_d(rx_d),
                     .rx_src_rdy_n(rx_src_rdy_n),
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

generate
	for(i=0;i<CNO;i=i+1) begin: RX_CONTROL_ARRAY
		rx_control #(.WIDTH(32)) u_rx_control(	
						      .rst(rst_in[i]),		
						      .clk(user_clk_in[i]),
						      .rx_d(rx_d[32*i+31:32*i]),
						      .rx_src_rdy_n(rx_src_rdy_n[i]),
						      .link_active(channel_up_in[i]),
						      .fifo_data_o(fifo_data_o[32*i+31:32*i]),
						      .fifo_wren_o(fifo_wren_o[i]),
						      .fifo_full_i(fifo_full_i[i])
						     );
	end
endgenerate


endmodule

