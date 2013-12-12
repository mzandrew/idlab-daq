`timescale 1ns/1ps

module test_board(
		  input rxp_tx,
		  input rxn_tx,
		  output txp_tx,
		  output txn_tx,

		  input [7:0] rxp_rx,
		  input [7:0] rxn_rx,
		  input [7:0] txp_rx,
		  input [7:0] txn_rx
		 );
parameter BCLK_PERIOD=8;

reg bclk;
initial bclk=0;
always #(BCLK_PERIOD/2) bclk=~bclk;

wire[3:0] mgtclk_p;
wire[3:0] mgtclk_n;

top #(.SIMULATION_P(1)) u_top(
					 .bclk(bclk),
					 .mgtclk_p_in(mgtclk_p),
					 .mgtclk_n_in(mgtclk_n),

					 .mgtclk_p_out(mgtclk_p),
					 .mgtclk_n_out(mgtclk_n),

					 .mod0_tx(),
					 .mod1_tx(),
					 .mod2_tx(),
					 .rx_loss_tx(),
					 .tx_fault_tx(),
					 .tx_dis_tx(),
					 .rxp_tx(rxp_tx),
					 .rxn_tx(rxn_tx),
					 .txp_tx(txp_tx),
					 .txn_tx(txn_tx),
					
					.mod0_rx(),
					.mod1_rx(),
					.mod2_rx(),
					.rx_loss_rx(),
					.tx_fault_rx(),
					.tx_dis_rx(),
					.rxp_rx(rxp_rx),
					.rxn_rx(rxn_rx),
					.txp_rx(txp_rx),
					.txn_rx(txn_rx)
					);

endmodule


