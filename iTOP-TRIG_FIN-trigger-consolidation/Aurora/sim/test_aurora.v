`timescale 1ns/1ps

module test_aurora;

parameter PERIOD=8;
parameter LENGTH=256;
parameter TEST_RX_C=0; //test which channel on the rx side
parameter CNO=8; //total no. of channels on the rx side
localparam DEBUG=0;

initial begin
	$display("Test setup: LENGTH %d, TEST_RX_C %d, CNO %d",LENGTH,TEST_RX_C,CNO);
end

reg gsr_r;
reg gts_r;

assign glbl.GSR=gsr_r;
assign glbl.GTS=gts_r;

initial begin
	gts_r=1'b0;
	gsr_r=1'b1;
	#(50*PERIOD);
	gsr_r=1'b0;
end

//clk generation
reg clk;
initial clk=0;
always #(PERIOD/2) clk=~clk;

//init_clk generation
reg init_clk;
initial init_clk=1;
always #(PERIOD) init_clk=~init_clk;

//data generation
reg [LENGTH*32-1:0] data;
integer j;
initial begin
	if(DEBUG==1)
		$display("********* Test data ***********");
	for(j=0;j<LENGTH;j=j+1) begin
		data[LENGTH*32-1:(LENGTH-1)*32]=($random);
		if(DEBUG==1)
			$display("data[%d] is %x",j,data[LENGTH*32-1:(LENGTH-1)*32]);
		if(j<(LENGTH-1)) 
			data=data>>32;
	end
end

wire tx_user_clk;
reg [32-1:0] tx_fifo_data;
reg tx_fifo_empty;
wire tx_fifo_read;
integer tx_fifo_cnt;
reg [LENGTH*32-1:0] tx_fifo;
//fifo behavior model
always@(posedge tx_user_clk or posedge rst_tx) begin
	if(rst_tx) begin
		tx_fifo_data<=0;
		tx_fifo_empty<=0;
		tx_fifo_cnt<=0;
		tx_fifo<=data;
	end else if(tx_fifo_read) begin
		if(tx_fifo_cnt==(LENGTH-1)) begin
			tx_fifo_data<=tx_fifo[31:0];
			tx_fifo<=tx_fifo>>32;
			tx_fifo_cnt<=tx_fifo_cnt+1;
			tx_fifo_empty<=1'b1;
		end else if(tx_fifo_cnt>=LENGTH) begin
			tx_fifo_data<=0;
			tx_fifo<=tx_fifo;
			tx_fifo_cnt<=tx_fifo_cnt;
			tx_fifo_empty<=1'b1;
		end else begin
			tx_fifo_data<=tx_fifo[31:0];
			tx_fifo<=tx_fifo>>32;
			tx_fifo_cnt<=tx_fifo_cnt+1;
			tx_fifo_empty<=1'b0;
		end
	end else begin
		tx_fifo_data<=tx_fifo_data;
		tx_fifo<=tx_fifo;
		tx_fifo_cnt<=tx_fifo_cnt;
		tx_fifo_empty=tx_fifo_empty;
	end
end

//tx control
reg rst_tx;
reg dcm_not_locked_tx;
wire channel_up_tx;
wire tx_finish;

assign tx_finish=(tx_fifo_cnt==LENGTH);
initial begin
	rst_tx=0;
	dcm_not_locked_tx=0;
	#(60*PERIOD);
	rst_tx=1;
	#(10*PERIOD);
	rst_tx=0;
	wait(channel_up_tx);
	$display("tx channel is up ...");
	wait(tx_finish);
	$display("tx transmission finished ...");
end

wire tx_p;
wire tx_n;
wire rx_p;
wire rx_n;

tx #(.SIMULATION_P(1)) u_tx 
	(
	 .rst(rst_tx),
	 .rx_p(rx_p),
	 .rx_n(rx_n),
	 .tx_p(tx_p),
	 .tx_n(tx_n),
	 .ref_clk1(clk),
	 .dcm_not_locked(dcm_not_locked_tx),
	 .channel_up(channel_up_tx),
	 .init_clk(init_clk),
	 .user_clk(tx_user_clk),
	 .fifo_data_i(tx_fifo_data),
	 .fifo_empty_i(tx_fifo_empty),
	 .fifo_read_o(tx_fifo_read)
	);

//rx part
reg [CNO-1:0] rst_rx;
wire [CNO-1:0] rx_p_rx;
wire [CNO-1:0] rx_n_rx;
wire [CNO-1:0] tx_p_rx;
wire [CNO-1:0] tx_n_rx;
reg [CNO-1:0] dcm_not_locked_rx;
wire [CNO-1:0] refclk_rx;
wire [CNO-1:0] channel_up_rx;
wire rx_finish;
wire [CNO-1:0] user_clk_rx;
wire [32*CNO-1:0] fifo_data_o_rx;
wire [CNO-1:0] fifo_wren_o_rx;
wire [CNO-1:0] fifo_full_i_rx;

reg [LENGTH*32-1:0] tmp_rx_data;
integer k;
initial begin
	rst_rx=0;
	dcm_not_locked_rx=0;
	#(60*PERIOD);
	rst_rx={CNO{1'b1}};
	#(10*PERIOD);
	rst_rx=0;
	$display("waiting for channel up ...");
	wait(channel_up_rx[TEST_RX_C]);
	$display("rx channel is up ...");
	$display("data in transmission ...");
	wait(rx_finish);
	$display("rx transmission finished ...");
	if(DEBUG==1) begin
		tmp_rx_data=rx_data;
		for(k=0;k<LENGTH;k=k+1) begin
			$display("rx_data %d is %x",k,tmp_rx_data[31:0]);
			tmp_rx_data=tmp_rx_data>>32;
		end
	end
	if(rx_data==data) 
		$display("*******************************\ntest passed!\n*******************************");
	else
		$display("*******************************\ntest failed!\n*******************************");
	$finish;
end
 
assign refclk_rx={CNO{clk}};

rx #(.CNO(CNO),.SIMULATION_P(1)) u_rx
				(
				 .rst(rst_rx),
				 .rx_p(rx_p_rx),
				 .rx_n(rx_n_rx),
				 .tx_p(tx_p_rx),
				 .tx_n(tx_n_rx),
				 .ref_clk1(refclk_rx),
				 .dcm_not_locked(dcm_not_locked_rx),
				 .channel_up(channel_up_rx),
				 .init_clk(init_clk),
				 .user_clk(user_clk_rx),
				 .fifo_data_o(fifo_data_o_rx),
				 .fifo_wren_o(fifo_wren_o_rx),
				 .fifo_full_i(fifo_full_i_rx)
				);

//fifo
reg [LENGTH*32-1:0] rx_data;
integer rx_data_cnt;
reg fifo_full_i;

assign rx_finish=(rx_data_cnt==LENGTH);

genvar i;
generate
	for(i=0;i<CNO;i=i+1) begin: RX_ARRAY
		if(i==TEST_RX_C) begin
			assign rx_p_rx[i]=tx_p;	
			assign rx_n_rx[i]=tx_n;
			assign rx_p=tx_p_rx[i];
			assign rx_n=tx_n_rx[i];

			always@(posedge user_clk_rx[i] or posedge rst_rx[i]) begin
				if(rst_rx[i]) begin
					rx_data=0;
					rx_data_cnt<=0;
					fifo_full_i<=0;
				end else if(fifo_wren_o_rx[i]) begin
					if(DEBUG==1)
						$display("received data: %x",fifo_data_o_rx[32*(TEST_RX_C+1)-1:32*TEST_RX_C]);
					if(rx_data_cnt<(LENGTH-1)) begin
						rx_data[LENGTH*32-1:(LENGTH-1)*32]=fifo_data_o_rx[32*(TEST_RX_C+1)-1:32*TEST_RX_C];
						rx_data=rx_data>>32;
						rx_data_cnt<=rx_data_cnt+1;
						fifo_full_i<=0;
					end else if(rx_data_cnt==(LENGTH-1)) begin
						rx_data[LENGTH*32-1:(LENGTH-1)*32]=fifo_data_o_rx[32*(TEST_RX_C+1)-1:32*TEST_RX_C];
						rx_data_cnt<=rx_data_cnt+1;
						fifo_full_i<=1;	
					end else begin
						rx_data=rx_data;
						rx_data_cnt<=rx_data_cnt;
						fifo_full_i<=1;
					end
				end 
			end
			assign fifo_full_i_rx[i]=fifo_full_i;
			
		end else begin	
			assign rx_p_rx[i]=0;
			assign rx_n_rx[i]=0;
			assign fifo_full_i_rx[i]=1;
		end
	end
endgenerate


endmodule

