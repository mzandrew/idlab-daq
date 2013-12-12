`timescale 1ns/1ps

module basic_propagation_unit
(
 clk,
 arst,
 enable,

 din,
 din_valid,
 dout,
 dout_valid
);

parameter integer DATA_WIDTH=32;
parameter integer LATENCY=1;

input clk;
input arst;
input enable;

input [DATA_WIDTH-1:0] din;
input din_valid;
output [DATA_WIDTH-1:0] dout;
output dout_valid;

pipeline_propagation_core #(.DATA_WIDTH(1),.PSTAGE(LATENCY))
                                u_pipeline_propagation_core_valid
                                        (
                                         .clk(clk),
                                         .ce(enable),
                                         .arst(arst),
                                         .data_in(din_valid),
                                         .data_o(dout_valid)
                                        );

pipeline_propagation_core #(.DATA_WIDTH(DATA_WIDTH),.PSTAGE(LATENCY))
                                u_pipeline_propagation_core_data
                                        (
                                         .clk(clk),
                                         .ce(enable),
                                         .arst(arst),
                                         .data_in(din),
                                         .data_o(dout)
                                        );
endmodule

module selection_unit
(
 clk,
 arst,
 enable,

 a,
 a_valid,
 rd_a,

 b,
 b_valid,
 rd_b,

 o,
 o_valid
);

parameter integer WIDTH=32;
parameter integer MIN_MAX=1; //min

input clk;
input arst;
input enable;

input [WIDTH-1:0] a;
input a_valid;
output rd_a;

input [WIDTH-1:0] b;
input b_valid;
output rd_b;

output [WIDTH-1:0] o;
output o_valid;
wire a_b;


generate 
	wire sel_a,sel_b;
	if(MIN_MAX==1) begin //MIN
		assign a_b=(a<b)? 1'b1: 1'b0;
	end else begin
		assign a_b=(a>b)? 1'b1: 1'b0;
	end
endgenerate

assign sel_a=a_valid & ((~b_valid) | a_b);
assign sel_b=b_valid & ((~a_valid) | (~a_b));

assign o=(sel_a)? a:b;
assign o_valid=(a_valid|b_valid);

assign rd_a=(~a_valid | sel_a) & enable; //(~a_valid) | (sel_a & enable); 
assign rd_b=(~b_valid | sel_b) & enable;//(~b_valid) | (sel_b & enable); 

endmodule

module two2one_unit
(
 clk,
 arst,
 enable,

 a,
 a_valid,
 rd_a,

 b,
 b_valid,
 rd_b,

 o,
 o_valid
);

parameter integer WIDTH=32;
parameter integer MIN_MAX=1; //min
parameter integer LATENCY=1; 

input clk;
input arst;
input enable;

input [WIDTH-1:0] a;
input a_valid;
output rd_a;

input [WIDTH-1:0] b;
input b_valid;
output rd_b;

output [WIDTH-1:0] o;
output o_valid;

wire [WIDTH-1:0] o_in;
wire o_valid_in;

selection_unit#(.WIDTH(WIDTH),.MIN_MAX(1)) u_selection_unit
	(
	 .clk(clk),
	 .arst(arst),
	 .enable(enable),

	 .a(a),
	 .a_valid(a_valid),
	 .rd_a(rd_a),
	 .b(b),
	 .b_valid(b_valid),
	 .rd_b(rd_b),
	 .o(o_in),
	 .o_valid(o_valid_in)
	);

basic_propagation_unit#(.DATA_WIDTH(WIDTH),.LATENCY(LATENCY)) u_basic_propagation_unit
	(
	 .clk(clk),
	 .arst(arst),
	 .enable(enable),
	 
	 .din(o_in),
	 .din_valid(o_valid_in),
	 .dout(o),
	 .dout_valid(o_valid)
	);
endmodule

module one2one_unit
(
 clk,
 arst,
 enable,

 din,
 din_valid,
 dout,
 dout_valid,
 rd
);

parameter integer DATA_WIDTH=32;
parameter integer LATENCY=1;

input clk;
input arst;
input enable;

input [DATA_WIDTH-1:0] din;
input din_valid;
output [DATA_WIDTH-1:0] dout;
output dout_valid;
output rd;

basic_propagation_unit#(.DATA_WIDTH(DATA_WIDTH),.LATENCY(LATENCY))
		u_basic_propagation_unit(
		 .clk(clk),
		 .arst(arst),
		 .enable(enable),
		 .din(din),
		 .din_valid(din_valid),
		 .dout(dout),
		 .dout_valid(dout_valid)
		);
assign rd=enable;//(~din_valid)|enable;
endmodule


//NOTE: it is assumed that the comparator has a throughput of 1op/clk.
module pipeline_sorting_core
(
         //input
         clk, //clock
         arst, //reset

         data_array, //data array of the input data channels
         data_strobe_array, //data strobe array of the input data channels
         read_array, //reading signal array of the input data channels

	 read_result, //signal indicating reading the next result
         result, //output sorted data stream
         result_valid //output data strobe signal
);

parameter integer WIDTH=32; //the width of each channel
parameter integer CNO=8; //channel number
parameter integer LATENCY_UNIT = 1; //Latency in a single stage
parameter integer MIN_MAX=1;

function integer cal_binary_tree_width;
input integer no;
integer out;
begin
        if(no%2==0)
                out=no/2;
        else
                out=(no+1)/2;
        cal_binary_tree_width=out;
end
endfunction

function integer cal_binary_tree_depth;
input integer no;
integer out;
begin
        out=0;
        while(no>1) begin
                out=out+1;
                no=cal_binary_tree_width(no);
        end
        cal_binary_tree_depth=out;
end
endfunction

function integer cal_binary_tree_inport_number;
input integer no;
integer out;
begin
        out=0;
        while(no>1) begin
                out=out+no;
                no=cal_binary_tree_width(no);
        end
        cal_binary_tree_inport_number=out;
end
endfunction

function integer cal_binary_tree_outport_number;
input integer no;
integer out;
begin
        out=0;
        while(no>1) begin
                no=cal_binary_tree_width(no);
                out=out+no;
        end
        cal_binary_tree_outport_number=out;
end
endfunction

input [WIDTH*CNO-1:0] data_array;
input [CNO-1:0] data_strobe_array;
output [CNO-1:0] read_array;

input clk;
input arst;
input read_result;
output[WIDTH-1:0] result;
output result_valid;

localparam integer inport_number=cal_binary_tree_inport_number(CNO);
localparam integer outport_number=cal_binary_tree_outport_number(CNO);
localparam integer depth=cal_binary_tree_depth(CNO);

wire [inport_number*WIDTH-1:0] comp_inports;
wire [outport_number*WIDTH-1:0] comp_outports;
wire [inport_number-1:0] valid_inports;
wire [outport_number-1:0] valid_outports;

wire [inport_number-1:0] rd_inports;
wire [outport_number-1:0] rd_outports;


function [32*cal_binary_tree_depth(CNO)-1:0] depth_array;
input integer cno;
input integer d;
integer i;
integer shift;
integer no;
reg [32*cal_binary_tree_depth(CNO)-1:0] tmp;
reg [32*cal_binary_tree_depth(CNO)-1:0] out;
begin
        tmp=cno;
        no=cno;
        out=0;
        for(i=0;i<d;i=i+1) begin
                shift=32*i;
                tmp=tmp<<shift;
                out=out|tmp;
                no=cal_binary_tree_width(no);
                tmp=no;
        end
        depth_array=out;
end
endfunction

function [32*cal_binary_tree_depth(CNO)-1:0] ib_array;
input integer cno;
input integer d;
integer i,no;
integer shift;
reg [32*cal_binary_tree_depth(CNO)-1:0] tmp;
reg [32*cal_binary_tree_depth(CNO)-1:0] out;
begin
        tmp=0;
        no=cno;
        out=0;
        for(i=0;i<d;i=i+1) begin
                shift=32*i;
                out=out|(tmp<<shift);
                tmp=tmp+no;
                no=cal_binary_tree_width(no);
        end
        ib_array=out;
end
endfunction

function [32*cal_binary_tree_depth(CNO)-1:0] ob_array;
input integer cno;
input integer d;
integer i,no;
integer shift;
reg [32*cal_binary_tree_depth(CNO)-1:0] tmp;
reg [32*cal_binary_tree_depth(CNO)-1:0] out;
begin
        tmp=0;
        no=cno;
        out=0;
        for(i=0;i<d;i=i+1) begin
                shift=32*i;
                out=out|(tmp<<shift);
                no=cal_binary_tree_width(no);
                tmp=tmp+no;
        end
        ob_array=out;
end
endfunction

localparam [32*cal_binary_tree_depth(CNO)-1:0] depth_array_param=depth_array(CNO,depth);
localparam [32*cal_binary_tree_depth(CNO)-1:0] ib_array_param=ib_array(CNO,depth);
localparam [32*cal_binary_tree_depth(CNO)-1:0] ob_array_param=ob_array(CNO,depth);


genvar i,j;
generate
	for(i=0;i<depth;i=i+1) begin: comp_array_depth
		for(j=0;j<depth_array_param[32*i+31:32*i]/2;j=j+1) begin: comp_array_width
						
			two2one_unit #(.WIDTH(WIDTH),.MIN_MAX(MIN_MAX),.LATENCY(LATENCY_UNIT)) u_two2one_unit	
			(
			 .clk(clk),
			 .arst(arst),
			 .enable(rd_outports[(ob_array_param[32*i+31:32*i]+j)]),

			 .a(comp_inports[(ib_array_param[32*i+31:32*i]+2*j+1)*WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j)*WIDTH]),
			 .a_valid(valid_inports[(ib_array_param[32*i+31:32*i]+2*j)]),
			 .rd_a(rd_inports[(ib_array_param[32*i+31:32*i]+2*j)]),

			 .b(comp_inports[(ib_array_param[32*i+31:32*i]+2*j+2)*WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j+1)*WIDTH]),
			 .b_valid(valid_inports[(ib_array_param[32*i+31:32*i]+2*j+1)]),
			 .rd_b(rd_inports[(ib_array_param[32*i+31:32*i]+2*j+1)]),
	
			 .o(comp_outports[(ob_array_param[32*i+31:32*i]+j+1)*WIDTH-1:(ob_array_param[32*i+31:32*i]+j)*WIDTH]),
			 .o_valid(valid_outports[(ob_array_param[32*i+31:32*i]+j)])
			);
			
			if(i==0) begin: first_level
				assign comp_inports[(ib_array_param[31:0]+2*j+1)*WIDTH-1:(ib_array_param[31:0]+2*j)*WIDTH] = data_array[(2*j+1)*WIDTH-1:2*j*WIDTH];
				assign comp_inports[(ib_array_param[31:0]+2*j+2)*WIDTH-1:(ib_array_param[31:0]+2*j+1)*WIDTH] = data_array[(2*j+2)*WIDTH-1:(2*j+1)*WIDTH];
				assign valid_inports[ib_array_param[31:0]+2*j] = data_strobe_array[2*j];
				assign valid_inports[ib_array_param[31:0]+2*j+1] = data_strobe_array[2*j+1];
				assign read_array[2*j] = rd_inports[ib_array_param[31:0]+2*j]|(~data_strobe_array[2*j]);
				assign read_array[2*j+1] = rd_inports[ib_array_param[31:0]+2*j+1]|(~data_strobe_array[2*j+1]);
			end else begin: mid_level
				assign comp_inports[(ib_array_param[32*i+31:32*i]+2*j+1)*WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j)*WIDTH]=comp_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)*WIDTH-1:(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j)*WIDTH];
				assign comp_inports[(ib_array_param[32*i+31:32*i]+2*j+2)*WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j+1)*WIDTH]=comp_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+2)*WIDTH-1:(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)*WIDTH];
				assign valid_inports[(ib_array_param[32*i+31:32*i]+2*j)]=valid_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j)];
				assign valid_inports[(ib_array_param[32*i+31:32*i]+2*j+1)]=valid_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)];
				assign rd_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j)]= rd_inports[(ib_array_param[32*i+31:32*i]+2*j)];
				assign rd_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)]= rd_inports[(ib_array_param[32*i+31:32*i]+2*j+1)];
			end 
			if(i==(depth-1)) begin: last_level
				 assign rd_outports[(ob_array_param[32*i+31:32*i]+j)] = read_result;
				 assign result=comp_outports[(ob_array_param[32*i+31:32*i]+j+1)*WIDTH-1:(ob_array_param[32*i+31:32*i]+j)*WIDTH];
				 assign result_valid=valid_outports[(ob_array_param[32*i+31:32*i]+j)];
			end
		end

		if(depth_array_param[32*i+31:32*i]%2==1) begin: SINGLE_OP_ARRAY
			one2one_unit #(.DATA_WIDTH(WIDTH),.LATENCY(LATENCY_UNIT)) u_one2one_unit
			(
			 .clk(clk),
			 .arst(arst),
			 .enable(rd_outports[(ob_array_param[32*(i+1)+31:32*(i+1)])-1]),
			
			 .din(comp_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*WIDTH]),
			 .din_valid(valid_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1]),
			 .dout(comp_outports[(ob_array_param[32*(i+1)+31:32*(i+1)])*WIDTH-1:(ob_array_param[32*(i+1)+31:32*(i+1)]-1)*WIDTH]),
			 .dout_valid(valid_outports[(ob_array_param[32*(i+1)+31:32*(i+1)])-1]),
			 .rd(rd_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1])
			);

			if(i==0) begin: single_first_level
				assign comp_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*WIDTH]=data_array[(WIDTH*CNO-1):(WIDTH*(CNO-1))];
				assign valid_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1]=data_strobe_array[CNO-1];
				assign read_array[CNO-1]=rd_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1] |(~data_strobe_array[CNO-1]);
			end else begin: single_inter_level
				assign comp_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*WIDTH]=comp_outports[(ob_array_param[32*i+31:32*i])*WIDTH-1:(ob_array_param[32*i+31:32*i]-1)*WIDTH];
				assign valid_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1]=valid_outports[(ob_array_param[32*i+31:32*i])-1];
				assign rd_outports[(ob_array_param[32*i+31:32*i])-1]= rd_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1];
			end
		end
	end

endgenerate

endmodule

