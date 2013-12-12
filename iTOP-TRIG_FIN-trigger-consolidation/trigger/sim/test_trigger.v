`timescale 1ns/1ps

module test_trigger;

parameter PERIOD=10;
parameter MAX_NUM=80;
parameter PATTERN_NO=5001;

reg clk;
initial clk=0;
always #(PERIOD/2) clk=~clk;

reg [32*(MAX_NUM+1)-1:0] data;
integer pattern_file;
integer result_file;

function [32*(MAX_NUM+1)-1:0] read_in_data;
input integer file;
reg [32*(MAX_NUM+1)-1:0] data;
integer i;
reg [31:0] num;
reg [31:0] tmp;
begin
data=0;
$fscanf(file,"%d",num);
for(i=0;i<num;i=i+1) begin
	$fscanf(file," %d",tmp);
	data[31:0]=tmp;
	data=data<<32;
end
data[31:0]=num;
read_in_data=data;
end
endfunction

integer i;
reg rst;
reg [31:0] num;
reg [31:0] rdfifo_dat;
reg rdfifo_empty;

wire rdfifo_rden_delay;
wire rdfifo_rden;
reg [31:0] rand_empty;
reg [31:0] rand_tmp;

reg trig_fifo_full;

assign #1 rdfifo_rden_delay=rdfifo_rden;
initial begin
	trig_fifo_full=0;
	pattern_file=$fopen("sorted_K_C_2.5.0_WB.txt","r");
	result_file=$fopen("trigger_result.dat","w");
	rst=0;
	rdfifo_empty=1'b1;
	rdfifo_dat=0;
	#(2*PERIOD);
	rst=1;
	#(10*PERIOD);
	rst=0;
	#(2*PERIOD);
	for(i=0;i<PATTERN_NO;i=i+1) begin
		$display("processing pattern %d",i);
		data=read_in_data(pattern_file);	
		num=data[31:0];
		data=data>>32;

		while(num>0) begin
			rdfifo_empty=1'b0;
			@(posedge clk);
			if(rdfifo_rden_delay) begin
				#1;
				rdfifo_dat=data[31:0];
				data=data>>32;
				num=num-1;
				rdfifo_empty=1;
				rand_empty=($random);
				if(rand_empty<0)
					rand_empty=0-rand_empty;
				rand_empty=rand_empty%6;
				for(rand_tmp=0;rand_tmp<rand_empty;rand_tmp=rand_tmp+1) begin
					@(posedge clk);
					#1;
				end
				rdfifo_empty=0;
			end 
		end
		rdfifo_empty=1'b1;
		wait(received);
		if(result>2000) begin
			$fwrite(result_file,"-%d\n",0-result);
		end else begin
			$fwrite(result_file,"%d\n",result);
		end
		trig_fifo_full=1;
		#1;
		trig_fifo_full=0;
	end	
	/*
	for(i=0;i<(MAX_NUM+1);i=i+1) begin
		$display("data[%d] is %d",i,data[31:0]);
		data=data>>32;
	end
	*/
	$fclose(pattern_file);
	$fclose(result_file);
	$finish;
end

reg wrfifo_prog_full;
reg [31:0] fifo_full_rand;
initial begin
	wrfifo_prog_full=0;
end

always@(posedge trig_fifo_full) begin
	wrfifo_prog_full=1;
	fifo_full_rand=($random);
	if(fifo_full_rand<0)
		fifo_full_rand=0-fifo_full_rand;
	fifo_full_rand=fifo_full_rand%6;
	while(fifo_full_rand>0) begin
		@(posedge clk);	
		fifo_full_rand=fifo_full_rand-1;
		#1;
	end
	wrfifo_prog_full=0;
end

wire[31:0] wrfifo_dat; 
wire[31:0] wrfifo_dat_delay; 
wire wrfifo_wren;
wire wrfifo_wren_delay;

assign #1 wrfifo_dat_delay=wrfifo_dat;
assign #1 wrfifo_wren_delay=wrfifo_wren;

reg [31:0] result;
reg received;

always@(posedge clk) begin
	if(rst) begin
		result<=0;	
		received<=0;
	end else if(wrfifo_wren_delay) begin
		#1 result<=wrfifo_dat_delay;
		#1 received<=1;
	end else begin
		#1 result<=result;
		#1 received<=1'b0;
	end
end

trigger #(.RD_TIMEOUT(10),.MAX_EVENT(256),.SUM_LIMIT(0)) u_trigger(
							  .clk(clk),
							  .rst(rst),
							  .rdfifo_dat(rdfifo_dat),
							  .rdfifo_empty(rdfifo_empty),
							  .rdfifo_rden(rdfifo_rden),
							  .wrfifo_dat(wrfifo_dat),
							  .wrfifo_prog_full(wrfifo_prog_full),
							  .wrfifo_wren(wrfifo_wren)
							);

endmodule

