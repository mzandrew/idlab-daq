`timescale 1ns/1ps
`unconnected_drive strong0

module test_top;

wire rxp_rx;
wire rxn_rx;
wire txp_rx;
wire txn_rx;

wire[7:0] rxp_tx;
wire[7:0] rxn_tx;
wire[7:0] txp_tx;
wire[7:0] txn_tx;

virtual_board #(.PATTERN_NO(20)) u_virtual_board
				(
				 .rxp_rx(rxp_rx),
				 .rxn_rx(rxn_rx),
				 .txp_rx(txp_rx),
				 .txn_rx(txn_rx),
				 .rxp_tx(rxp_tx),
				 .rxn_tx(rxn_tx),
				 .txp_tx(txp_tx),
				 .txn_tx(txn_tx)
				);

test_board u_test_board(
			.rxp_tx(txp_rx),
			.rxn_tx(txn_rx),
			.txp_tx(rxp_rx),
			.txn_tx(rxn_rx),

			.rxp_rx(txp_tx),
			.rxn_rx(txn_tx),
			.txp_rx(rxp_tx),
			.txn_rx(rxn_tx)
			);
endmodule

