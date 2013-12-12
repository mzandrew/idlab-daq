`timescale 1ns/1ps

module test_pipeline_sorting_core;

parameter CLOCK_PERIOD=10;
parameter CNO=11;
parameter WIDTH=33;
parameter CL=1;

parameter MAX_DEPTH=40;

parameter debug=0;
parameter debug_sub=0;

reg clk;
initial clk=0;
always #(CLOCK_PERIOD/2) clk=~clk;

reg arst;
reg start_sorting;
reg ce;
wire [CNO-1:0] finish;

integer i,j;
integer rand;
reg [32*CNO-1:0] DEPTH_ARRAY;
reg [32*CNO-1:0] depth_array_tmp;
reg [31:0] tmp_reg;

reg [WIDTH*MAX_DEPTH*CNO-1:0] data_array;
wire [WIDTH*MAX_DEPTH*CNO-1:0] data_array_sorted_final;
reg  [WIDTH*MAX_DEPTH*CNO-1:0] data_array_sorted_final_reg;
reg [WIDTH*MAX_DEPTH*CNO-1:0] data_array_tmp;
reg [WIDTH*MAX_DEPTH-1:0] tmp_data_array;
reg [WIDTH-1:0] tmp_data_reg;

reg [WIDTH*MAX_DEPTH-1:0] tmp_data_array_out;

wire [WIDTH*MAX_DEPTH*CNO-1:0] data_array_sorted;
wire [WIDTH*MAX_DEPTH-1:0] data_array_sorted_parse [0:CNO-1];

wire [WIDTH-1:0] result;
wire result_valid;
reg [WIDTH*MAX_DEPTH*CNO-1:0] result_array;
reg [WIDTH*MAX_DEPTH*CNO-1:0] result_array_tmp;
reg [31:0] result_cnt;
reg [31:0] total_candidate_solution;
reg [WIDTH-1:0] tmp_result_reg;

function integer internal_state_count;
input integer no;
integer out;
integer tmp;
begin
	out=0;
	while(no>1) begin
		out=out+no;
		if(no%2==1)
			no=no/2+1;
		else
			no=no/2;
	end
	out=out+1;
	internal_state_count=out;
end
endfunction

localparam integer isc=internal_state_count(CNO);
reg[31:0] failure_no;
integer output_file;
integer raw_data_file;

initial begin
	start_sorting=0;
	arst=1'b1;
	ce=0;
	#(CLOCK_PERIOD);
	start_sorting=1;
	#(10.5*CLOCK_PERIOD);
	arst=1'b0;
	#(CLOCK_PERIOD);
	ce=1;
	if(debug==1)
		$display("at time %t ce is enabled",$time);
	wait(&finish);
	#((isc+1.5)*CLOCK_PERIOD);
	ce=0;
	if(debug==1)
		$display("at time %t ce is disabled",$time);
	#(CLOCK_PERIOD);
	output_file=$fopen("output.dat","w");
	if(debug==1)
		$display("***** sorted result *****");
	result_array_tmp=result_array;
	for(i=0;i<result_cnt;i=i+1) begin
		tmp_data_reg=result_array_tmp[WIDTH-1:0];
		result_array_tmp=result_array_tmp>>(WIDTH);
		if(debug==1)
			$display("%d - %d",i,tmp_data_reg);
		$fwrite(output_file,"%x\n",tmp_data_reg);
	end
	$fclose(output_file);
	$finish;
end


initial begin
	if(debug==1)
		$display("building depth array ...");
	DEPTH_ARRAY=0;
	total_candidate_solution=0;
	for(i=0;i<CNO;i=i+1) begin
		rand=$random;
		if(rand<0)
			rand=0-rand;
		rand=rand%MAX_DEPTH;
		tmp_reg=rand;
		total_candidate_solution=total_candidate_solution+tmp_reg;
		DEPTH_ARRAY=DEPTH_ARRAY|(tmp_reg<<32*i);	
	end
	if(debug==1) begin
		for(i=0;i<CNO;i=i+1) begin	
			depth_array_tmp=DEPTH_ARRAY>>(32*i);
			tmp_reg=depth_array_tmp[31:0];
			rand=tmp_reg;
			$display("depth_array[%d]=%d",i,rand);
		end
	end
	if(debug==1)
		$display("building random channel data ...");
	data_array=0;
	for(i=0;i<CNO;i=i+1) begin
		if(debug==1)
			$display("channel %d raw data:",i);
		tmp_data_array=0;

		for(j=0;j<MAX_DEPTH;j=j+1) begin
			tmp_data_reg=($random);	
			tmp_data_array=tmp_data_array|(tmp_data_reg<<(WIDTH*j));
			if(debug==1)
				$display("%d",tmp_data_reg);
		end
		data_array=data_array|(tmp_data_array << (WIDTH*MAX_DEPTH*i));
	end
	wait(start_sorting);
	#(2);
	raw_data_file=$fopen("raw.dat","w");
		for(i=0;i<CNO;i=i+1) begin
			data_array_tmp=data_array_sorted>>(WIDTH*MAX_DEPTH*i);
			tmp_data_array=data_array_tmp[WIDTH*MAX_DEPTH-1:0];
			depth_array_tmp=DEPTH_ARRAY>>(32*i);
			tmp_reg=depth_array_tmp[31:0];

			if(debug==1)
				$display("channel %d sorted data:",i);
			for(j=0;j<MAX_DEPTH;j=j+1) begin
				tmp_data_reg=tmp_data_array[WIDTH-1:0];
				tmp_data_array=tmp_data_array>>WIDTH;
				if(j<tmp_reg) begin
					if(debug==1)
						$display("%d - %d",j,tmp_data_reg);
					$fwrite(raw_data_file,"%x\n",tmp_data_reg);
				end
			end
		end
	$fclose(raw_data_file);
end

reg [WIDTH*CNO-1:0] data_to_sort;
reg [CNO-1:0] data_to_sort_valid;
wire [CNO-1:0] read_array;
reg [32*CNO-1:0] cnt_array;


genvar l;
generate 
	for(l=0;l<CNO;l=l+1) begin: array_structure
		//sort
		heap_sort #(.array_size(MAX_DEPTH),.element_size(WIDTH),.debug(debug_sub),.MIN_MAX(1)) 		u_heap_sort(			
			  .start(start_sorting),
			  .array_i(data_array[WIDTH*MAX_DEPTH*(l+1)-1:WIDTH*MAX_DEPTH*l]),
			  .array_o(data_array_sorted[WIDTH*MAX_DEPTH*(l+1)-1:WIDTH*MAX_DEPTH*l])
			 );

		assign data_array_sorted_parse[l]=(cnt_array[32*(l+1)-1:32*l]<DEPTH_ARRAY[32*(l+1)-1:32*l])? (data_array_sorted[WIDTH*MAX_DEPTH*(l+1)-1:WIDTH*MAX_DEPTH*l]>>(WIDTH*cnt_array[32*(l+1)-1:32*l])):(data_array_sorted[WIDTH*MAX_DEPTH*(l+1)-1:WIDTH*MAX_DEPTH*l]>>(32*(DEPTH_ARRAY[32*(l+1)-1:32*l]-1)));

		//FIFO
		always@(posedge clk or posedge arst) begin
			if(arst)
				cnt_array[32*(l+1)-1:32*l]<=0;
			else if(read_array[l]) begin
				if(cnt_array[32*(l+1)-1:32*l]<DEPTH_ARRAY[32*(l+1)-1:32*l])
					cnt_array[32*(l+1)-1:32*l]<=cnt_array[32*(l+1)-1:32*l]+1;
				else
					cnt_array[32*(l+1)-1:32*l]<=cnt_array[32*(l+1)-1:32*l];
			end else begin
				cnt_array[32*(l+1)-1:32*l]<=cnt_array[32*(l+1)-1:32*l];
			end
		end
		
		assign finish[l]=(~arst)&(cnt_array[32*(l+1)-1:32*l]==DEPTH_ARRAY[32*(l+1)-1:32*l]);

		always@(posedge clk or posedge arst) begin
			if(arst) begin
				data_to_sort[WIDTH*(l+1)-1:WIDTH*l]<=0;		
				data_to_sort_valid[l]<=0;
			end else if (read_array[l]) begin
				if(cnt_array[32*(l+1)-1:32*l]<DEPTH_ARRAY[32*(l+1)-1:32*l]) begin
					data_to_sort[WIDTH*(l+1)-1:WIDTH*l]<=data_array_sorted_parse[l][WIDTH-1:0];
					data_to_sort_valid[l]<=1;
				end else begin
					data_to_sort[WIDTH*(l+1)-1:WIDTH*l]<=data_to_sort[WIDTH*(l+1)-1:WIDTH*l];
					data_to_sort_valid[l]<=0;
				end
			end else begin
				data_to_sort[WIDTH*(l+1)-1:WIDTH*l]<=data_to_sort[WIDTH*(l+1)-1:WIDTH*l];
				data_to_sort_valid[l]<=data_to_sort_valid[l];
			end
		end
	end
endgenerate


pipeline_sorting_core #(.WIDTH(WIDTH),.CNO(CNO),.LATENCY_UNIT(CL)) u_psc
        (
          //input
        . clk(clk), //clock
        . arst(arst), //reset
        . data_array(data_to_sort), //data array of the input data channels
        . data_strobe_array(data_to_sort_valid), //data strobe array of the input data channels
        . read_array(read_array), //hand-shaking signal for controlling the rate of the input channels
        //output sorted stream
	.read_result(ce),
        . result(result),
        . result_valid(result_valid)
        );

always@(posedge clk or posedge arst) begin
	if(arst)
		result_cnt<=0;
	else if(result_valid)
		result_cnt<=result_cnt+1;
	else
		result_cnt<=result_cnt;
end

always@(posedge clk or posedge arst) begin
	if(arst)
		result_array<=0;	
	else if(result_valid) begin
		result_array<=result_array|(result<<(result_cnt*WIDTH));
		if(debug==1 && result_valid==1) begin
			$display("at time %t, result array is written %d - %d", $time, result_cnt, result);
		end
	end else
		result_array<=result_array;
end

endmodule

