`timescale 1ns/1ps

module test_pipeline_minmax_core;

localparam D_WIDTH=26;
localparam M_WIDTH=8;
localparam MINMAX=1;
localparam CNO=8;
localparam LATENCY_UNIT=1;

localparam PERIOD=60; //clock period
localparam INO=10; //the number of rounds
localparam debug=0;

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

function [CNO*D_WIDTH-1:0] data_random_gen;
input m;
integer i;
reg [CNO*D_WIDTH-1:0] out;
reg [D_WIDTH-1:0] tmp_reg;
begin
	out=0;
	for(i=0;i<CNO;i=i+1) begin
		tmp_reg=($random);	
		out=out|(tmp_reg<<(D_WIDTH*i));
	end
	data_random_gen=out;
end
endfunction

function [CNO*M_WIDTH-1:0] m_random_gen;
input m;
integer i;
reg [CNO*M_WIDTH-1:0] out;
reg [M_WIDTH-1:0] tmp_reg;
begin
	out=0;
	for(i=0;i<CNO;i=i+1) begin
		tmp_reg=($random);	
		out=out|(tmp_reg<<(M_WIDTH*i));
	end
	m_random_gen=out;
end
endfunction

function [CNO*1-1:0] valid_random_gen;
input m;
integer i;
reg [CNO*1-1:0] out;
reg tmp_reg;
begin
	out=0;
	for(i=0;i<CNO;i=i+1) begin
		tmp_reg=($random);	
		out=out|(tmp_reg<<(1*i));
	end
	valid_random_gen=out;
end
endfunction

function [D_WIDTH+M_WIDTH:0] result_gen;
input [CNO*D_WIDTH-1:0] data;
input [CNO*M_WIDTH-1:0] m;
input [CNO-1:0] valid;
reg [D_WIDTH-1:0] tmp_result;
reg [M_WIDTH-1:0] tmp_m;
reg tmp_valid;
integer i;

reg [D_WIDTH-1:0] tmp_data_reg;
reg [M_WIDTH-1:0] tmp_m_reg;
reg tmp_valid_reg;
begin
	tmp_result=0;
	tmp_m=0;
	tmp_valid=0;
	for(i=0;i<CNO;i=i+1) begin
		tmp_data_reg=data[D_WIDTH-1:0];		
		data=data>>D_WIDTH;
		tmp_m_reg=m[M_WIDTH-1:0];
		m=m>>M_WIDTH;
		tmp_valid_reg=valid[0];
		valid=valid>>1;
		if(tmp_valid_reg==1) begin //only check valid data
			if(tmp_valid==0) begin //currently holds an invalid data
				tmp_result=tmp_data_reg;
				tmp_m=tmp_m_reg;
				tmp_valid=tmp_valid_reg;
			end else begin
				if((tmp_result>tmp_data_reg && MINMAX==1)||(tmp_result<tmp_data_reg && MINMAX==0)) begin 
					tmp_result=tmp_data_reg;
					tmp_m=tmp_m_reg;
					tmp_valid=tmp_valid_reg;
				end else begin
					tmp_result=tmp_result;
					tmp_m=tmp_m;
					tmp_valid=tmp_valid;
				end
			end
		end
	end
	result_gen={tmp_result,tmp_m,tmp_valid};
end
endfunction

localparam integer internal_latency=internal_state_count(CNO)*LATENCY_UNIT; //total latency time measured in terms of clock cycle.

reg [D_WIDTH*INO-1:0] correct_data;
reg [M_WIDTH*INO-1:0] correct_m;
reg [INO-1:0] correct_valid;

reg [D_WIDTH*INO-1:0] obtained_data;
reg [M_WIDTH*INO-1:0] obtained_m;
reg [INO-1:0] obtained_valid;

//clock gen
reg clk;
initial clk=0;
always #(PERIOD/2) clk=~clk;

//test
reg arst;
integer i;
reg [CNO*D_WIDTH-1:0] data_input;
reg [CNO*M_WIDTH-1:0] m_input;
reg [CNO-1:0] valid_input;
reg [D_WIDTH+M_WIDTH:0] tmp_result;
initial begin
	arst=0;	
	data_input=0;
	m_input=0;
	valid_input=0;
	#(1*PERIOD);
	arst=1;
	#(10*PERIOD);
	arst=0;
	$display("start testing ...\n");
	correct_data=0;
	correct_m=0;
	correct_valid=0;
	repeat(INO) begin
		@(posedge clk);	
		#(2);
		data_input=data_random_gen(0);
		m_input=m_random_gen(0);
		valid_input=valid_random_gen(0);
		tmp_result=result_gen(data_input,m_input,valid_input);
		if(tmp_result[0]==1'b1) begin //valid
			correct_data=correct_data<<D_WIDTH;
			correct_data[D_WIDTH-1:0]=tmp_result[D_WIDTH+M_WIDTH:M_WIDTH+1];
			correct_m=correct_m<<M_WIDTH;
			correct_m[M_WIDTH-1:0]=tmp_result[M_WIDTH:1];
			correct_valid=correct_valid<<1;
			correct_valid[0]=tmp_result[0];
		end
	end
	@(posedge clk);
	#2;
	data_input=0;
	m_input=0;
	valid_input=0;
	#((internal_latency+2)*PERIOD);
	$display("comparing ...\n");
	for(i=0;i<result_cnt;i=i+1) begin
		if(debug==1) begin
			$display("correct: data %d, m %b, valid %d",correct_data[D_WIDTH-1:0],correct_m[M_WIDTH-1:0],correct_valid[0]);
			$display("obtained: data %d, m %b, valid %d",obtained_data[D_WIDTH-1:0],obtained_m[M_WIDTH-1:0],obtained_valid[0]);
		end
		if(correct_data[D_WIDTH-1:0]!=obtained_data[D_WIDTH-1:0] ||
		   correct_m[M_WIDTH-1:0]!=obtained_m[M_WIDTH-1:0]) begin
			$display("************************************************************\n");
			$display("******************* The Test Has Failed! *******************\n");
			$display("************************************************************\n");
			$finish;
		end 
		correct_data=correct_data>>D_WIDTH;
		obtained_data=obtained_data>>D_WIDTH;
		correct_m=correct_m>>M_WIDTH;
		obtained_m=obtained_m>>M_WIDTH;
		correct_valid=correct_valid>>1;
		obtained_valid=obtained_valid>>1;
	end
	$display("************************************************************\n");
	$display("******************* The Test Has Passed! *******************\n");
	$display("************************************************************\n");
	$finish;
end

wire [D_WIDTH-1:0] result;
wire [M_WIDTH-1:0] result_m;
wire result_valid;
reg [31:0] result_cnt;

pipeline_minmax_core #(.D_WIDTH(D_WIDTH),.M_WIDTH(M_WIDTH),.MINMAX(MINMAX),.CNO(CNO),.LATENCY_UNIT(LATENCY_UNIT)) 
	u_pipeline_minmax_core
		(
		 .clk(clk),
		 .arst(arst),
		 .data_array(data_input),
		 .m_array(m_input),
		 .valid_array(valid_input),
		 .result(result),
		 .result_m(result_m),
		 .result_valid(result_valid)
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
	if(arst) begin	
		obtained_data=0;
		obtained_m=0;
		obtained_valid=0;
	end else if(result_valid) begin
		obtained_data=obtained_data<<D_WIDTH;
		obtained_data[D_WIDTH-1:0]=result;
		obtained_m=obtained_m<<M_WIDTH;
		obtained_m[M_WIDTH-1:0]=result_m;
		obtained_valid=obtained_valid<<1;
		obtained_valid[0]=result_valid;
	end else begin
		obtained_data=obtained_data;
		obtained_m=obtained_m;
		obtained_valid=obtained_valid;
	end
end

endmodule


