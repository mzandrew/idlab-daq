`timescale 1ns/1ps

module virtual_board(
			input rxp_rx,
			input rxn_rx,
			output txp_rx,
			output txn_rx,
			input[7:0] rxp_tx,
			input[7:0] rxn_tx,
			output[7:0] txp_tx,
			output[7:0] txn_tx
		    );
parameter PERIOD=8;
parameter MAX_NUM=80;
parameter PATTERN_NO=1;
parameter DEBUG=0;


integer sending_fifos_limit[0:7]; //
reg load_sending_fifos; //
reg [32*MAX_NUM-1:0] sending_data [0:7]; //


reg bclk;
initial bclk=0;
always #(PERIOD/2) bclk=~bclk;

reg rst;
reg dcm_not_locked;
integer j;
integer pattern_file;
integer result_file;
integer k;
integer l;
integer num;
reg[31:0] tmp;
integer rand_cno;

reg [32*MAX_NUM-1:0] tmp_single;

initial begin
	pattern_file=$fopen("sorted_K_C_2.5.0_WB.txt","r");
	result_file=$fopen("trigger_result.dat","w");
	rst=0;
	dcm_not_locked=0;
	load_sending_fifos=0;
	for(j=0;j<8;j=j+1) begin
		sending_fifos_limit[j]=0;
		sending_data[j]=0;
	end
	#(60*PERIOD);
	rst=1;
	#(10*PERIOD);
	rst=0;
	$display("waiting for rx channel up in virtual_board ...");
	wait(channel_up_rx);
	$display("rx channel in virtual_board is up ...");
	wait(channel_up_tx);
	$display("tx channel in virtual_board is up ...");
	$display("data transmission");
	for(k=0;k<PATTERN_NO;k=k+1) begin
		$display("processing pattern %d",k);
		for(j=0;j<8;j=j+1) begin
			sending_fifos_limit[j]=0;
			sending_data[j]=0;
		end
		//read number
		$fscanf(pattern_file,"%d",num);
		if(DEBUG==1)
			$display("num is %d",num);
		for(l=0;l<num;l=l+1) begin
			$fscanf(pattern_file," %d",tmp);	
			if(DEBUG==1)
				$display("tmp is %d",tmp);
			rand_cno=($random);
			if(rand_cno<0)
				rand_cno=0-rand_cno;
			rand_cno=rand_cno%8;	
			if(DEBUG==1)
				$display("rand_cno is %d",rand_cno);
			sending_fifos_limit[rand_cno]=sending_fifos_limit[rand_cno]+1;
			tmp_single=sending_data[rand_cno];
			tmp_single=tmp_single<<32;
			tmp_single[31:0]=tmp;
			sending_data[rand_cno]=tmp_single;
		end
		load_sending_fifos=1;
		#(2*PERIOD);
		load_sending_fifos=0;
		wait(fifo_wren_rx);
		$display("processing pattern %d done",k);
		if(fifo_data_rx>2000)
			$fwrite(result_file,"-%d\n",0-fifo_data_rx);
		else
			$fwrite(result_file,"%d\n",fifo_data_rx);
		#(2*PERIOD);
	end
	$fclose(pattern_file);
	$fclose(result_file);
	$finish;
end

reg ref_clk;
initial ref_clk=0;
always #(PERIOD/4) ref_clk=~ref_clk;

wire[7:0] txp_rx_in;
wire[7:0] txn_rx_in;
assign txp_rx=txp_rx_in[0];
assign txn_rx=txn_rx_in[0];

wire[7:0] user_clk_in_rx;
wire user_clk_rx;
assign user_clk_rx=user_clk_in_rx[0];

wire[7:0] channel_up_in_rx;
wire channel_up_rx;
assign channel_up_rx=channel_up_in_rx[0];

wire [32*8-1:0] fifo_data_rx_in;
wire [31:0] fifo_data_rx;
assign fifo_data_rx=fifo_data_rx_in[31:0];

wire [7:0] fifo_wren_rx_in;
wire fifo_wren_rx;
assign fifo_wren_rx=fifo_wren_rx_in[0];

rx #(.SIMULATION_P(1)) u_rx(
        .rst({8{rst}}),
        .rx_p({{7{1'b0}},rxp_rx}),
        .rx_n({{7{1'b0}},rxn_rx}),
        .tx_p(txp_rx_in),
        .tx_n(txn_rx_in),
        .ref_clk1({8{ref_clk}}),
        .dcm_not_locked({8{dcm_not_locked}}),
        .channel_up(channel_up_in_rx),
        .init_clk(bclk),
        .user_clk(user_clk_in_rx),
        .fifo_data_o(fifo_data_rx_in),
        .fifo_wren_o(fifo_wren_rx_in),
        .fifo_full_i({8{1'b0}})
        );


wire[7:0] channel_up_tx_in;
wire channel_up_tx;
assign channel_up_tx=&channel_up_tx_in;

wire[7:0] user_clk_tx;

integer sending_fifos_cnt[0:7];
wire [7:0] read_sending_fifos;
reg [7:0] sending_fifos_empty;

reg [32*MAX_NUM-1:0] sending_data_bk [0:7];
reg [31:0] sending_fifos_data [0:7];

genvar i;
generate
	for(i=0;i<8;i=i+1) begin: TX_ARRAY
		tx #(.SIMULATION_P(1)) u_tx	
			(
			 .rst(rst),
			 .rx_p(rxp_tx[i]),
			 .rx_n(rxn_tx[i]),
			 .tx_p(txp_tx[i]),
			 .tx_n(txn_tx[i]),
			 .ref_clk1(ref_clk),
			 .dcm_not_locked(dcm_not_locked),
			 .channel_up(channel_up_tx_in[i]),
			 .init_clk(bclk),
			 .user_clk(user_clk_tx[i]),
			 .fifo_data_i(sending_fifos_data[i]),
			 .fifo_empty_i(sending_fifos_empty[i]),
			 .fifo_read_o(read_sending_fifos[i])
			);
		
		initial sending_fifos_empty[i]=1;

		always@(posedge user_clk_tx[i]) begin
			if(load_sending_fifos) begin
				sending_fifos_cnt[i]<=0;
				sending_fifos_empty[i]<=(sending_fifos_limit[i]<=0);
			end else if(sending_fifos_cnt[i]<sending_fifos_limit[i] && read_sending_fifos[i]==1'b1) begin
				sending_fifos_cnt[i]<=sending_fifos_cnt[i]+1;
				sending_fifos_empty[i]<=(sending_fifos_cnt[i]==(sending_fifos_limit[i]-1));
			end else begin
				sending_fifos_cnt[i]<=sending_fifos_cnt[i];
				sending_fifos_empty[i]<=sending_fifos_empty[i];
			end
		end

		always@(sending_data[i] or sending_fifos_cnt[i]) begin
			sending_data_bk[i]=sending_data[i];
			if(sending_fifos_cnt[i]>=1)
				sending_data_bk[i]=sending_data_bk[i]>>32*(sending_fifos_cnt[i]-1);
			else
				sending_data_bk[i]=0;
			sending_fifos_data[i]=sending_data_bk[i][31:0];
		end
	end
endgenerate


endmodule

