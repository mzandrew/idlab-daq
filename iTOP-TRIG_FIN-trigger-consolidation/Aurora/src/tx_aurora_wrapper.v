`timescale 1ns/1ps

//NOTE: THIS MODULE ASSUMES THAT ONLY ONE MGT is used

module tx_aurora_wrapper(
			 //tx stream interface
			 input [31:0] tx_d,
			 input tx_src_rdy_n,
			 output tx_dst_rdy_n,
			 //rx stream interface
			 output [31:0] rx_d,
			 output rx_src_rdy_n,
			 //MGT IO
			 input rx_p,
			 input rx_n,
			 output tx_p,
			 output tx_n,
			 //ref clk
			 input ref_clk1,
			 //error
			 output hard_error,
			 output soft_error,
			 //status
			 output channel_up,
			 output lane_up,
			 //init
			 input init_clk,
			 input pma_init,
			 //dcm locked
			 input dcm_not_locked,
			 //
			 input reset,
			 input power_down,
			 output user_clk
			);

parameter EXTEND_WATCHDOGS=0;
parameter SIMULATION_P=0;
parameter TXPOST_TAP_PD_P="FALSE";
parameter MGT_POS=0; //Y0

wire channel_up_in;
wire warn_cc;
wire do_cc;
wire user_clk_in;
wire [15:0] mgt0_combusout;
wire [15:0] mgt1_combusout;
wire tx_out_clk;

generate
		if(MGT_POS%2==0) begin: EVEN_SINGLE_MGT

			aurora #(.LANE0_GT11_MODE_P("B"),
	                         .LANE0_MGT_ID_P(1),
                                 .EXTEND_WATCHDOGS(EXTEND_WATCHDOGS),
                                 .SIMULATION_P(SIMULATION_P),
                                 .TXPOST_TAP_PD_P(TXPOST_TAP_PD_P)
                                ) u_aurora
                                (
                                 .TX_D(tx_d),
                                 .TX_SRC_RDY_N(tx_src_rdy_n),
                                 .TX_DST_RDY_N(tx_dst_rdy_n),
                                 .RX_D(rx_d),
                                 .RX_SRC_RDY_N(rx_src_rdy_n),
                                 .RXP(rx_p),
                                 .RXN(rx_n),
                                 .TXP(tx_p),
                                 .TXN(tx_n),
                                 .REF_CLK1_LEFT(ref_clk1),
                                 .HARD_ERROR(hard_error),
                                 .SOFT_ERROR(soft_error),
                                 .CHANNEL_UP(channel_up_in),
                                 .LANE_UP(lane_up),
                                 .WARN_CC(warn_cc),
                                 .DO_CC(do_cc),
                                 .CALBLOCK_ACTIVE(),
                                 .RESET_CALBLOCKS(pma_init),
                                 .RX_SIGNAL_DETECT(1'b1),
                                 .DCLK(init_clk),
                                 .MGT0_COMBUSIN(mgt0_combusout),
                                 .MGT0_COMBUSOUT(mgt1_combusout),
                                 .DCM_NOT_LOCKED(dcm_not_locked),
                                 .USER_CLK(user_clk_in),
                                 .RESET(reset),
                                 .POWER_DOWN(power_down),
                                 .LOOPBACK(2'b00),
                                 .PMA_INIT(pma_init),
                                 .TX_OUT_CLK(tx_out_clk)
                                );

			   aurora_UNUSED_MGT #(.GT11_MODE_P("A"), .MGT_ID_P(0), .RXPMACLKSEL_PARAM("REFCLK1"), .TXABPMACLKSEL_PARAM("REFCLK1")) u_aurora_unused
   				 ( 
   				     .MGT0_ACTIVE_OUT(),
   				     .MGT0_DRP_RESET_IN(pma_init),
   				     .MGT0_RX_SIGNAL_DETECT_IN(1'b1),
   				     .MGT0_TX_SIGNAL_DETECT_IN(1'b1),
   				     //------------------- Dynamic Reconfiguration Port (DRP) -------------------
   				     .MGT0_DCLK_IN(init_clk),
   				     //-------------------------------- PLL Lock --------------------------------
   				     .MGT0_RXLOCK_OUT(),                                                 //Unused       
   				     .MGT0_TXLOCK_OUT(),                                                 //Unused
   				     //-------------------------- Ports for Simulation --------------------------
   				     .MGT0_COMBUSIN_IN(mgt1_combusout),
   				     .MGT0_COMBUSOUT_OUT(mgt0_combusout),
   				     //---------------------------- Reference Clocks ----------------------------
   				     .MGT0_GREFCLK_IN(1'b0),
   				     .MGT0_REFCLK1_IN(ref_clk1),
   				     .MGT0_REFCLK2_IN(1'b0),
   				     //--------------------------------- Resets ---------------------------------
   				     .MGT0_RXPMARESET_IN(pma_init),
   				     .MGT0_RXRESET_IN(1'b0),
   				     .MGT0_TXPMARESET_IN(pma_init),
   				     .MGT0_TXRESET_IN(1'b0),
   				     //------------------------------ Serial Ports ------------------------------
   				     .MGT0_RX1N_IN(1'b0),                                    //Unused
   				     .MGT0_RX1P_IN(1'b0),                                    //Unused
   				     .MGT0_TX1N_OUT(),                                       //Unused
   				     .MGT0_TX1P_OUT()                                        //Unused
   				 );
	
		 end else begin: ODD_SINGLE_MGT

			aurora #(.LANE0_GT11_MODE_P("A"),
	                         .LANE0_MGT_ID_P(0),
                                 .EXTEND_WATCHDOGS(EXTEND_WATCHDOGS),
                                 .SIMULATION_P(SIMULATION_P),
                                 .TXPOST_TAP_PD_P(TXPOST_TAP_PD_P)
                                ) u_aurora
                                (
                                 .TX_D(tx_d),
                                 .TX_SRC_RDY_N(tx_src_rdy_n),
                                 .TX_DST_RDY_N(tx_dst_rdy_n),
                                 .RX_D(rx_d),
                                 .RX_SRC_RDY_N(rx_src_rdy_n),
                                 .RXP(rx_p),
                                 .RXN(rx_n),
                                 .TXP(tx_p),
                                 .TXN(tx_n),
                                 .REF_CLK1_LEFT(ref_clk1),
                                 .HARD_ERROR(hard_error),
                                 .SOFT_ERROR(soft_error),
                                 .CHANNEL_UP(channel_up_in),
                                 .LANE_UP(lane_up),
                                 .WARN_CC(warn_cc),
                                 .DO_CC(do_cc),
                                 .CALBLOCK_ACTIVE(),
                                 .RESET_CALBLOCKS(pma_init),
                                 .RX_SIGNAL_DETECT(1'b1),
                                 .DCLK(init_clk),
                                 .MGT0_COMBUSIN(mgt0_combusout),
                                 .MGT0_COMBUSOUT(mgt1_combusout),
                                 .DCM_NOT_LOCKED(dcm_not_locked),
                                 .USER_CLK(user_clk_in),
                                 .RESET(reset),
                                 .POWER_DOWN(power_down),
                                 .LOOPBACK(2'b00),
                                 .PMA_INIT(pma_init),
                                 .TX_OUT_CLK(tx_out_clk)
                                );
			   aurora_UNUSED_MGT 
				#(
				  .GT11_MODE_P("B"),
				  .MGT_ID_P(1),
				  .RXPMACLKSEL_PARAM("REFCLK1"),
				  .TXABPMACLKSEL_PARAM("REFCLK1")
				 ) u_aurora_unused
   				 (
   				     .MGT0_ACTIVE_OUT(),
   				     .MGT0_DRP_RESET_IN(pma_init),
   				     .MGT0_RX_SIGNAL_DETECT_IN(1'b1),
   				     .MGT0_TX_SIGNAL_DETECT_IN(1'b1),
   				     //------------------- Dynamic Reconfiguration Port (DRP) -------------------
   				     .MGT0_DCLK_IN(init_clk),
   				     //-------------------------------- PLL Lock --------------------------------
   				     .MGT0_RXLOCK_OUT(),                                                 //Unused       
   				     .MGT0_TXLOCK_OUT(),                                                 //Unused
   				     //-------------------------- Ports for Simulation --------------------------
   				     .MGT0_COMBUSIN_IN(mgt1_combusout),
   				     .MGT0_COMBUSOUT_OUT(mgt0_combusout),
   				     //---------------------------- Reference Clocks ----------------------------
   				     .MGT0_GREFCLK_IN(1'b0),
   				     .MGT0_REFCLK1_IN(ref_clk1),
   				     .MGT0_REFCLK2_IN(1'b0),
   				     //--------------------------------- Resets ---------------------------------
   				     .MGT0_RXPMARESET_IN(pma_init),
   				     .MGT0_RXRESET_IN(1'b0),
   				     .MGT0_TXPMARESET_IN(pma_init),
   				     .MGT0_TXRESET_IN(1'b0),
   				     //------------------------------ Serial Ports ------------------------------
   				     .MGT0_RX1N_IN(1'b0),                                    //Unused
   				     .MGT0_RX1P_IN(1'b0),                                    //Unused
   				     .MGT0_TX1N_OUT(),                                       //Unused
   				     .MGT0_TX1P_OUT()                                        //Unused
   				 );

		 end
endgenerate

aurora_STANDARD_CC_MODULE u_standard_cc(
                                        .RESET(!channel_up_in),
                                        .WARN_CC(warn_cc),
                                        .DO_CC(do_cc),
                                        .DCM_NOT_LOCKED(dcm_not_locked),
                                        .USER_CLK(user_clk_in)
                                      );
assign channel_up=channel_up_in;
assign user_clk=user_clk_in;
BUFG user_clk_bufg(
	.I(tx_out_clk),
        .O(user_clk_in)
                 );

endmodule

