`timescale 1ns/1ps

module top(
		input bclk,		
	
		input[3:0] mgtclk_p_in,
		input[3:0] mgtclk_n_in,	

		output[3:0] mgtclk_p_out,
		output[3:0] mgtclk_n_out,	

		input mod0_tx,
		output mod1_tx,
		input mod2_tx,
		input rx_loss_tx,
		input tx_fault_tx,
		output tx_dis_tx,
		input rxp_tx,
		input rxn_tx,
		output txp_tx,
		output txn_tx,

		input[7:0]mod0_rx,
		output[7:0]mod1_rx,
		input[7:0]mod2_rx,
		input[7:0]rx_loss_rx,
		input[7:0]tx_fault_rx,
		output[7:0]tx_dis_rx,
		input[7:0]rxp_rx,
		input[7:0]rxn_rx,
		output[7:0] txp_rx,
		output[7:0] txn_rx
		);

parameter SIMULATION_P=0;


wire bclk_in;
wire bclk_2x;
wire bclk_lock;
wire[3:0] ref_clk;
(* KEEP = "TRUE" *) wire rst_dcm;
(* KEEP = "TRUE" *) wire rst_fifos;
(* KEEP = "TRUE" *) wire rst_sorter;
(* KEEP = "TRUE" *) wire rst_trigger;
(* KEEP = "TRUE" *) wire rst_aurora;
wire bclk_dv;

//---------------------------------------init----------------------------------
init u_init(
		.clk(bclk_in),	
		.rst_fifos(rst_fifos),
		.rst_sorter(rst_sorter),
		.rst_trigger(rst_trigger),
		.rst_dcm(rst_dcm),
		.dcm_locked(bclk_lock),
		.rst_aurora(rst_aurora)
		);


//---------------------------------------clock---------------------------------- 
//output clocks. (These clocks are used in the other parts of the module).
//bclk_in is 150MHz
//bclk_dv 75MHz
//ref_clk 300MHz
//bclk_2x 300MHz

IBUFG bclk_buf(.I(bclk),.O(bclk_in));

//dcm is generated for real clock. But, the period of the real clock is not suitable for aurora simulation, due to some problems with the xilinx core simulation model.
//So, use a different model (8ns period) when doing simulation
generate
	if(SIMULATION_P==0) begin
		bclk_dcm u_bclk_dcm(.CLKIN_IN(bclk_in),.RST_IN(rst_dcm),.CLK0_OUT(),.CLK2X_OUT(bclk_2x),.LOCKED_OUT(bclk_lock),.CLKDV_OUT(bclk_dv));
	end else begin
		bclk_dcm_simulation u_bclk_dcm(.CLKIN_IN(bclk_in),.RST_IN(rst_dcm),.CLK0_OUT(),.CLK2X_OUT(bclk_2x),.LOCKED_OUT(bclk_lock),.CLKDV_OUT(bclk_dv));
	end
		
endgenerate

genvar i;
generate
	for(i=0;i<4;i=i+1) begin: MGT_CLK_ARRAY
		OBUFDS u_mgt_obufds(.I(bclk_2x),.O(mgtclk_p_out[i]),.OB(mgtclk_n_out[i]));
		GT11CLK_MGT #(.SYNCLK1OUTEN("ENABLE"),.SYNCLK2OUTEN("DISABLE")) u_GT11CLK_MGT (
	        .MGTCLKN(mgtclk_n_in[i]),
	        .MGTCLKP(mgtclk_p_in[i]),
	        .SYNCLK1OUT(ref_clk[i]),
	        .SYNCLK2OUT()
	    );
	end
endgenerate

//---------------------------------transceiver_io--------------------------------
transceiver_io u_transceiver_io(
				.mod0(mod0_tx),
				.mod2(mod2_tx),
				.rx_loss(rx_loss_tx),
				.tx_fault(tx_fault_tx),
				.mod1(mod1_tx),
				.tx_dis(tx_dis_tx),
			
				.mod0_o(),
				.mod2_o(),
				.tx_fault_o(),
				.rx_loss_o()
				);
generate
	for(i=0;i<8;i=i+1) begin: TRANSCEIVER_ARRAY
		transceiver_io u_transceiver_io(
				.mod0(mod0_rx[i]),
				.mod2(mod2_rx[i]),
				.rx_loss(rx_loss_rx[i]),
				.tx_fault(tx_fault_rx[i]),
				.mod1(mod1_rx[i]),
				.tx_dis(tx_dis_rx[i]),
			
				.mod0_o(),
				.mod2_o(),
				.tx_fault_o(),
				.rx_loss_o()
				);
	end
endgenerate

//-------------------------- rx aurora core ---------------------------------------
wire[7:0] ref_clk_aurora_rx;
wire [7:0] user_clk;
wire [8*32-1:0] fifo_data_rx;
wire [7:0] fifo_wren_rx;
wire [7:0] fifo_full_rx;

//clock mapping

assign ref_clk_aurora_rx={ref_clk[2],ref_clk[2],ref_clk[2],ref_clk[2],ref_clk[2],ref_clk[2],ref_clk[1],ref_clk[1]}; //function of ref_clk;

rx #(.SIMULATION_P(SIMULATION_P)) u_rx(
	.rst({8{rst_aurora}}),
	.rx_p(rxp_rx),
	.rx_n(rxn_rx),
	.tx_p(txp_rx),
	.tx_n(txn_rx),
	.ref_clk1(ref_clk_aurora_rx),
	.dcm_not_locked({8{!bclk_lock}}),
	.channel_up(),
	.init_clk(bclk_in),
	.user_clk(user_clk),
	.fifo_data_o(fifo_data_rx),
	.fifo_wren_o(fifo_wren_rx),
	.fifo_full_i(fifo_full_rx)
	);

//-----------------------------rx fifo array-------------------------------------
wire [32*8-1:0] sorter_data;
wire [7:0] sorter_empty;
wire [7:0] sorter_rden;

generate
	for(i=0;i<8;i=i+1) begin: RX_FIFO_ARRAY
		rx_fifo u_rx_fifo(  //fifo size is 256x32
		  .rst(rst_fifos), // input rst
		  .wr_clk(user_clk[i]), // input wr_clk
		  .rd_clk(bclk_dv), // input rd_clk
		  .din(fifo_data_rx[32*i+31:32*i]), // input [31 : 0] din
		  .wr_en(fifo_wren_rx[i]), // input wr_en
		  .rd_en(sorter_rden[i]), // input rd_en
		  .dout(sorter_data[32*i+31:32*i]), // output [31 : 0] dout
		  .full(fifo_full_rx[i]), // output full
		  .empty(sorter_empty[i]) // output empty
		);
	end
endgenerate

//---------------------------sorter-----------------------------------------------
wire [31:0] sorter_fifo_data;
wire sorter_fifo_wren;
wire sorter_fifo_prog_full;

sorter u_sorter(
                .clk(bclk_dv),
                .rst(rst_sorter),

                .rdfifo_data_i(sorter_data), //input fifo data array
                .rdfifo_empty_i(sorter_empty),//input fifo empty array
                .rdfifo_rden_o(sorter_rden),//input fifo rden array

                .wrfifo_data_o(sorter_fifo_data),//sorted output data
                .wrfifo_prog_full_i(sorter_fifo_prog_full), //output fifo prog full signal
                .wrfifo_wren_o(sorter_fifo_wren) //sorted output data valid 
              );

//--------------------------sorter fifo --------------------------------------

wire trigger_rden;
wire [31:0] trigger_dat;
wire trigger_empty;

sorter_fifo u_sorter_fifo(
  .rst(rst_fifos), // input rst
  .wr_clk(bclk_dv), // input wr_clk
  .rd_clk(bclk_in), // input rd_clk
  .din(sorter_fifo_data), // input [31 : 0] din
  .wr_en(sorter_fifo_wren), // input wr_en
  .rd_en(trigger_rden), // input rd_en
  .dout(trigger_dat), // output [31 : 0] dout
  .full(), // output full
  .empty(trigger_empty), // output empty
  .prog_full(sorter_fifo_prog_full) // output prog_full
);

//---------------------------trigger-----------------------------------------
wire [31:0] trigger_fifo_data;
wire trigger_fifo_wren;
wire trigger_fifo_prog_full;

trigger u_trigger(
		.clk(bclk_in),
		.rst(rst_trigger),
		.rdfifo_dat(trigger_dat),
		.rdfifo_empty(trigger_empty),
		.rdfifo_rden(trigger_rden),
		.wrfifo_dat(trigger_fifo_data),
		.wrfifo_prog_full(trigger_fifo_prog_full),
		.wrfifo_wren(trigger_fifo_wren)
		);

//---------------------------trigger_fifo--------------------------------------
wire[31:0] fifo_data_tx;
wire fifo_rden_tx;
wire fifo_empty_tx;
wire user_clk_tx;

trigger_fifo u_trigger_fifo(
		  .rst(rst_fifos), // input rst
		  .wr_clk(bclk_in), // input wr_clk
		  .rd_clk(user_clk_tx), // input rd_clk
		  .din(trigger_fifo_data), // input [31 : 0] din
		  .wr_en(trigger_fifo_wren), // input wr_en
		  .rd_en(fifo_rden_tx), // input rd_en
		  .dout(fifo_data_tx), // output [31 : 0] dout
		  .full(), // output full
		  .empty(fifo_empty_tx), // output empty
		  .prog_full(trigger_fifo_prog_full) // output prog_full
		);

//----------------------------tx-----------------------------------------------
wire ref_clk_aurora_tx=ref_clk[1]; //function of ref_clk
tx #(.SIMULATION_P(SIMULATION_P)) u_tx(
		   .rst(rst_aurora),
		   .rx_p(rxp_tx),
		   .rx_n(rxn_tx),
		   .tx_p(txp_tx),
		   .tx_n(txn_tx),
		   .ref_clk1(ref_clk_aurora_tx),
		   .dcm_not_locked(!bclk_lock),
		   .channel_up(),
		   .init_clk(bclk_in),
		   .user_clk(user_clk_tx),
		   .fifo_data_i(fifo_data_tx),
		   .fifo_empty_i(fifo_empty_tx),
		   .fifo_read_o(fifo_rden_tx)
					);
endmodule


