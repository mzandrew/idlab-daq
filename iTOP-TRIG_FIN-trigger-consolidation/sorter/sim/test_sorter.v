`timescale 1ns/1ps

module test_sorter;

parameter CNO=8;
parameter MAX_DEPTH=16;
parameter EMPTY_TIMEOUT=6;

parameter PERIOD=10;

reg clk;
initial clk=0;
always #(PERIOD/2) clk=~clk;

reg rst_done;
reg rst;
initial begin
	rst_done=0;
	rst=1;
	#(10*PERIOD);
	rst_done=1;
	rst=0;
end



reg [CNO*(MAX_DEPTH+1)*32-1:0] data_array;
integer DATA_FILE;
integer i,j;
reg [31:0] num;
reg [31:0] tmp;
reg [(MAX_DEPTH+1)*32-1:0] data_slice;
integer total_num;

initial begin
	$display("reading data_file ...");
	total_num=0;
	data_array=0;
	DATA_FILE=$fopen("test_pattern.txt","r");
	for(i=0;i<CNO;i=i+1) begin
		data_array=data_array<<((MAX_DEPTH+1)*32);
		data_slice=0;
		$fscanf(DATA_FILE,"%d",num);	
		//$display("channel %d, num %d",i,num);
		total_num=total_num+num;
		for(j=0;j<num;j=j+1) begin
			$fscanf(DATA_FILE," %d",tmp);	
			//$display("%d",tmp);
			data_slice[31:0]=tmp;
			data_slice=data_slice<<32;
		end
		data_slice[31:0]=num;
		data_array[(MAX_DEPTH+1)*32-1:0]=data_slice;
	end
	$fclose(DATA_FILE);
	$display("reading data_file done");
end

reg [32*CNO-1:0] rdfifo_data;
reg [CNO-1:0] rdfifo_empty;
wire [CNO-1:0] rdfifo_rden;

reg [32*CNO-1:0] num_array;
reg [32*CNO-1:0] index_array;
reg [32*CNO-1:0] rand_array;
reg [MAX_DEPTH*32-1:0] fifo_slice[0:CNO-1];
reg [CNO-1:0] mark_array;


//fifo array
genvar g;
generate
	for(g=0;g<CNO;g=g+1) begin: behavior_fifo_array	
		initial begin
			rdfifo_data[32*g+31:32*g]=0;	
			rdfifo_empty[g]=1;
			#(2*PERIOD);
			wait(rst_done);
			num_array[32*g+31:32*g]=data_array[(MAX_DEPTH+1)*32*g+31:(MAX_DEPTH+1)*32*g];

			//$display("channel %d, num %d",g,num_array[32*g+31:32*g]);
			fifo_slice[g]=data_array[(MAX_DEPTH+1)*32*(g+1)-1:(MAX_DEPTH+1)*32*g+32];
			index_array[32*g+31:32*g]=0;
			while(index_array[32*g+31:32*g]<num_array[32*g+31:32*g]) begin
				rand_array[32*g+31:32*g]=($random);		
				if(rand_array[32*g+31:32*g]<0)
					rand_array[32*g+31:32*g]=0-rand_array[32*g+31:32*g];
				rand_array[32*g+31:32*g]=rand_array[32*g+31:32*g]%EMPTY_TIMEOUT;
				while(rand_array[32*g+31:32*g]>0) begin
					@(posedge clk);
					rand_array[32*g+31:32*g]=rand_array[32*g+31:32*g]-1;	
				end
				rdfifo_empty[g]=0;
				mark_array[g]=0;
				//$display("pre wait %d, rdfifo_rden %b",g,rdfifo_rden[g]);
				while(mark_array[g]==0) begin
					@(posedge clk);
					if(rdfifo_rden[g])
						mark_array[g]=1;
				end
				rdfifo_data[32*g+31:32*g]=fifo_slice[g][31:0];
				//$display("rdfifo_data %d",rdfifo_data[32*g+31:32*g]);
				fifo_slice[g]=fifo_slice[g]>>32;
				rdfifo_data[32*g+31:32*g]=rdfifo_data[32*g+31:32*g];
				//$display("rdfifo_data %d",rdfifo_data[32*g+31:32*g]);
				rdfifo_empty[g]=1;
				index_array[32*g+31:32*g]=index_array[32*g+31:32*g]+1;
			end
		end
	end
endgenerate

wire [32*CNO-1:0] rdfifo_data_delay;
wire [CNO-1:0] rdfifo_empty_delay;
wire [CNO-1:0] rdfifo_rden_delay;

assign #1 rdfifo_data_delay = rdfifo_data;
assign #1 rdfifo_empty_delay = rdfifo_empty;
assign #1 rdfifo_rden = rdfifo_rden_delay;

//receiver fifo
wire [31:0] wrfifo_data;
wire wrfifo_wren;
reg wrfifo_prog_full;
integer RESULT_FILE;
reg[31:0] result_cnt;
reg[31:0] rand_result;
reg [31:0] index_result;
reg [31:0] tmp_result;
wire new_result_found;

assign new_result_found=result_cnt[0];

initial begin
	wrfifo_prog_full=0;
end

always@(posedge new_result_found or negedge new_result_found) begin
	wrfifo_prog_full=1;
	rand_result=($random);
	 if(rand_result<0)
		rand_result=0-rand_result;
	 rand_result=rand_result%3;
	 for(index_result=0;index_result<rand_result;index_result=index_result+1) begin
		  @(posedge clk);
	 end
	wrfifo_prog_full=0;
end

reg mark_result;

initial begin
	result_cnt=0;
	RESULT_FILE=$fopen("result_file.txt","w");
	#(2*PERIOD);
	wait(rst_done);
	while(result_cnt<total_num) begin
		 mark_result=0;
		 while(mark_result==0) begin
			@(posedge clk);
			if(wrfifo_wren)
				mark_result=1;	
		 end
		 tmp_result=wrfifo_data;
		 result_cnt=result_cnt+1;
		 //$display("recevied %dth sample: %d",result_cnt,tmp_result);
		 $fwrite(RESULT_FILE,"%d\n",tmp_result);
	end
	$fclose(RESULT_FILE);
	$finish;
end

wire [31:0] wrfifo_data_delay;
wire wrfifo_wren_delay;
wire wrfifo_prog_full_delay;

assign #1 wrfifo_data=wrfifo_data_delay;
assign #1 wrfifo_wren=wrfifo_wren_delay;
assign #1 wrfifo_prog_full_delay=wrfifo_prog_full;

sorter #(.CNO(CNO),.DATA_WIDTH(32),.EMPTY_TIMEOUT(EMPTY_TIMEOUT))
		u_sorter(
			 .clk(clk),
			 .rst(rst),
			 .rdfifo_data_i(rdfifo_data_delay),
			 .rdfifo_empty_i(rdfifo_empty_delay),
			 .rdfifo_rden_o(rdfifo_rden_delay),
			 .wrfifo_data_o(wrfifo_data_delay),
			 .wrfifo_prog_full_i(wrfifo_prog_full_delay),
			 .wrfifo_wren_o(wrfifo_wren_delay)
			);



endmodule

