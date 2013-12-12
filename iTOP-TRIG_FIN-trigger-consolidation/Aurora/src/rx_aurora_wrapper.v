`timescale 1ns/1ps


//NOTE: THIS MODULE ASSUMES THAT BOTH OF THE TWO MGTS in EACH USED TILE ARE OCCUPIED, i.e., NO UNUSED_MGT module is needed.

module rx_aurora_wrapper(
		      //tx stream interface
		      tx_d,
		      tx_src_rdy_n,
		      tx_dst_rdy_n, 
		      //local link rx interface
		      rx_d,
		      rx_src_rdy_n,
		      //MGT serial IO
		      rx_p,
		      rx_n,
		      tx_p,
		      tx_n,
		      //MGT reference clock
		      ref_clk1,
		      //error detection
		      hard_error,	
		      soft_error,
		      //status
		      channel_up,
		      lane_up,
		      //calibration block interface
		      init_clk,
		      pma_init,
		      //system interface
		      dcm_not_locked,

		      reset,
		      power_down,
		      user_clk
		     );
parameter EXTEND_WATCHDOGS=0;
parameter SIMULATION_P=0;
parameter TXPOST_TAP_PD_P="FALSE";

parameter CNO=8;
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

input [32*CNO-1:0] tx_d;
input [1*CNO-1:0] tx_src_rdy_n;
output [1*CNO-1:0] tx_dst_rdy_n;

output [32*CNO-1:0] rx_d;
output [1*CNO-1:0] rx_src_rdy_n;

input [1*CNO-1:0] rx_p;
input [1*CNO-1:0] rx_n;
output [1*CNO-1:0] tx_p;
output [1*CNO-1:0] tx_n;

input [1*CNO-1:0] ref_clk1;

output [1*CNO-1:0] hard_error;
output [1*CNO-1:0] soft_error;

output [1*CNO-1:0] channel_up;
wire [1*CNO-1:0] channel_up_in;

output [1*CNO-1:0] lane_up;

wire [1*CNO-1:0] warn_cc;
wire [1*CNO-1:0] do_cc;


input init_clk;
input [1*CNO-1:0] dcm_not_locked;

input [1*CNO-1:0] reset;
input [1*CNO-1:0] power_down;

output [1*CNO-1:0]user_clk;
wire [1*CNO-1:0] user_clk_in;

input pma_init;

wire [16*CNO/2-1:0] mgt0_combusout;
wire [16*CNO/2-1:0] mgt1_combusout;
wire [1*CNO-1:0] tx_out_clk;

genvar i;
generate 
	for(i=0;i<CNO;i=i+1) begin: RX_MGT_ARRAY
		if(MGT_ARRAY[32*i+31:32*i]%2==0) begin: EVEN_MGT
			aurora #(.LANE0_GT11_MODE_P("B"),
				 .LANE0_MGT_ID_P(1),
				 .EXTEND_WATCHDOGS(EXTEND_WATCHDOGS),
				 .SIMULATION_P(SIMULATION_P),
				 .TXPOST_TAP_PD_P(TXPOST_TAP_PD_P)
				) u_aurora
				(
				 .TX_D(tx_d[32*i+31:32*i]),
				 .TX_SRC_RDY_N(tx_src_rdy_n[i]),
				 .TX_DST_RDY_N(tx_dst_rdy_n[i]),
				 .RX_D(rx_d[32*i+31:32*i]),
				 .RX_SRC_RDY_N(rx_src_rdy_n[i]),
				 .RXP(rx_p[i]),
				 .RXN(rx_n[i]),
				 .TXP(tx_p[i]),
				 .TXN(tx_n[i]),
				 .REF_CLK1_LEFT(ref_clk1[i]),
				 .HARD_ERROR(hard_error[i]),
				 .SOFT_ERROR(soft_error[i]),
				 .CHANNEL_UP(channel_up_in[i]),
				 .LANE_UP(lane_up[i]),
				 .WARN_CC(warn_cc[i]),
				 .DO_CC(do_cc[i]),
				 .CALBLOCK_ACTIVE(),
				 .RESET_CALBLOCKS(pma_init),
				 .RX_SIGNAL_DETECT(1'b1),
				 .DCLK(init_clk),
				 .MGT0_COMBUSIN(mgt0_combusout[16*(i/2)+15:16*(i/2)]),
				 .MGT0_COMBUSOUT(mgt1_combusout[16*(i/2)+15:16*(i/2)]),
				 .DCM_NOT_LOCKED(dcm_not_locked[i]),
				 .USER_CLK(user_clk_in[i]),
				 .RESET(reset[i]),
				 .POWER_DOWN(power_down[i]),
				 .LOOPBACK(2'b00),
				 .PMA_INIT(pma_init),
				 .TX_OUT_CLK(tx_out_clk[i])
				);
		end else begin: ODD_MGT
			aurora #(.LANE0_GT11_MODE_P("A"),
				 .LANE0_MGT_ID_P(0),
				 .EXTEND_WATCHDOGS(EXTEND_WATCHDOGS),
				 .SIMULATION_P(SIMULATION_P),
				 .TXPOST_TAP_PD_P(TXPOST_TAP_PD_P)
				) u_aurora
				(
				 .TX_D(tx_d[32*i+31:32*i]),
				 .TX_SRC_RDY_N(tx_src_rdy_n[i]),
				 .TX_DST_RDY_N(tx_dst_rdy_n[i]),
				 .RX_D(rx_d[32*i+31:32*i]),
				 .RX_SRC_RDY_N(rx_src_rdy_n[i]),
				 .RXP(rx_p[i]),
				 .RXN(rx_n[i]),
				 .TXP(tx_p[i]),
				 .TXN(tx_n[i]),
				 .REF_CLK1_LEFT(ref_clk1[i]),
				 .HARD_ERROR(hard_error[i]),
				 .SOFT_ERROR(soft_error[i]),
				 .CHANNEL_UP(channel_up_in[i]),
				 .LANE_UP(lane_up[i]),
				 .WARN_CC(warn_cc[i]),
				 .DO_CC(do_cc[i]),
				 .CALBLOCK_ACTIVE(),
				 .RESET_CALBLOCKS(pma_init),
				 .RX_SIGNAL_DETECT(1'b1),
				 .DCLK(init_clk),
				 .MGT0_COMBUSIN(mgt1_combusout[16*(i/2)+15:16*(i/2)]),
				 .MGT0_COMBUSOUT(mgt0_combusout[16*(i/2)+15:16*(i/2)]),
				 .DCM_NOT_LOCKED(dcm_not_locked[i]),
				 .USER_CLK(user_clk_in[i]),
				 .RESET(reset[i]),
				 .POWER_DOWN(power_down[i]),
				 .LOOPBACK(2'b00),
				 .PMA_INIT(pma_init),
				 .TX_OUT_CLK(tx_out_clk[i])
				);
		end
		aurora_STANDARD_CC_MODULE u_standard_cc(
						 .RESET(!channel_up_in[i]),
						 .WARN_CC(warn_cc[i]),
						 .DO_CC(do_cc[i]),
						 .DCM_NOT_LOCKED(dcm_not_locked[i]),
						 .USER_CLK(user_clk_in[i])
						);
		assign channel_up[i]=channel_up_in[i];
		assign user_clk[i]=user_clk_in[i];
		BUFG user_clk_bufg(
				   .I(tx_out_clk[i]),
				   .O(user_clk_in[i])
				  );
	end
endgenerate
	

endmodule

