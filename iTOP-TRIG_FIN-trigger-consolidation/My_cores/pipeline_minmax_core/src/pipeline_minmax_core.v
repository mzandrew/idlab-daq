`timescale 1ns/1ps

module one2one_minmax
(
 clk,
 arst,

 din,
 din_m,
 din_valid,
 
 dout,
 dout_m,
 dout_valid
);

parameter D_WIDTH=26;
parameter M_WIDTH=8;
parameter LATENCY=1; //allowed minimum value is 1


input clk;
input arst;
input [D_WIDTH-1:0] din;
input [M_WIDTH-1:0] din_m;
input din_valid;
output [D_WIDTH-1:0] dout;
output [M_WIDTH-1:0] dout_m;
output dout_valid;

pipeline_propagation_core #(.DATA_WIDTH(D_WIDTH),.PSTAGE(LATENCY))	
			u_data_pipe(
					.clk(clk),
					.ce(1'b1),
					.arst(arst),
					.data_in(din),
					.data_o(dout)
				   );

pipeline_propagation_core #(.DATA_WIDTH(M_WIDTH),.PSTAGE(LATENCY))	
			u_m_pipe(
					.clk(clk),
					.ce(1'b1),
					.arst(arst),
					.data_in(din_m),
					.data_o(dout_m)
				   );

pipeline_propagation_core #(.DATA_WIDTH(1),.PSTAGE(LATENCY))	
			u_valid_pipe(
					.clk(clk),
					.ce(1'b1),
					.arst(arst),
					.data_in(din_valid),
					.data_o(dout_valid)
				   );

endmodule

module two2one_minmax
(
 clk,
 arst,

 a_data,
 a_m,
 a_valid,

 b_data,
 b_m,
 b_valid,

 o_data,
 o_m,
 o_valid
);

parameter D_WIDTH=26;
parameter M_WIDTH=8;
parameter MINMAX=0; //MAX
parameter LATENCY=1; //allowed minimum value is 1
localparam LATENCY_IN=LATENCY-1;


input clk;
input arst;

input [D_WIDTH-1:0] a_data;
input [M_WIDTH-1:0] a_m;
input a_valid;

input [D_WIDTH-1:0] b_data;
input [M_WIDTH-1:0] b_m;
input b_valid;

output [D_WIDTH-1:0] o_data;
output [M_WIDTH-1:0] o_m;
output o_valid; 

reg [D_WIDTH-1:0] o_data_in;
reg [M_WIDTH-1:0] o_m_in;
reg o_valid_in;

wire sel_a_b;
wire a_b;

generate
	if(MINMAX==1) begin //MIN
		assign a_b=(a_data<b_data)? 1'b1:1'b0;
	end else begin //MAX
		assign a_b=(a_data>b_data)? 1'b1:1'b0;
	end
endgenerate

assign sel_a_b=(~b_valid)|(a_valid & a_b);

always@(posedge clk or posedge arst) begin
	if(arst) begin
		o_data_in<=0;	
		o_m_in<=0;
		o_valid_in<=0;
	end else if(sel_a_b) begin
		o_data_in<=a_data;
		o_m_in<=a_m;
		o_valid_in<=a_valid|b_valid;
	end else begin
		o_data_in<=b_data;
		o_m_in<=b_m;
		o_valid_in<=a_valid|b_valid;
	end
end

generate 
	if(LATENCY_IN>=0) begin
		pipeline_propagation_core #(.DATA_WIDTH(D_WIDTH),.PSTAGE(LATENCY_IN))	
			u_data_pipe(
					.clk(clk),
					.ce(1'b1),
					.arst(arst),
					.data_in(o_data_in),
					.data_o(o_data)
				   );
		pipeline_propagation_core #(.DATA_WIDTH(M_WIDTH),.PSTAGE(LATENCY_IN))	
			u_m_pipe(
					.clk(clk),
					.ce(1'b1),
					.arst(arst),
					.data_in(o_m_in),
					.data_o(o_m)
				   );
		pipeline_propagation_core #(.DATA_WIDTH(1),.PSTAGE(LATENCY_IN))	
			u_valid_pipe(
					.clk(clk),
					.ce(1'b1),
					.arst(arst),
					.data_in(o_valid_in),
					.data_o(o_valid)
				   );

	end
endgenerate

endmodule


module pipeline_minmax_core
		(
		 clk,
		 arst,
		 data_array, //real data
		 m_array, //accessory data accompanied with real data
		 valid_array, //indicate whether real data is valid

		 result, //result real data
		 result_m, //the accessory data accompanied with the result real data
		 result_valid //indicate whether result is valid
		);

parameter D_WIDTH=26;
parameter M_WIDTH=8;
parameter MINMAX=0; //max
parameter CNO=10;
parameter LATENCY_UNIT=1;

input clk;
input arst;
input [D_WIDTH*CNO-1:0] data_array;
input [M_WIDTH*CNO-1:0] m_array;
input [CNO-1:0] valid_array;
output [D_WIDTH-1:0] result;
output [M_WIDTH-1:0] result_m;
output result_valid;


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

localparam integer inport_number=cal_binary_tree_inport_number(CNO);
localparam integer outport_number=cal_binary_tree_outport_number(CNO);
localparam integer depth=cal_binary_tree_depth(CNO);

wire [inport_number*D_WIDTH-1:0] comp_inports;
wire [inport_number*M_WIDTH-1:0] m_inports;
wire [outport_number*D_WIDTH-1:0] comp_outports;
wire [outport_number*M_WIDTH-1:0] m_outports;
wire [inport_number-1:0] valid_inports;
wire [outport_number-1:0] valid_outports;

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
						
			two2one_minmax #(.D_WIDTH(D_WIDTH),.M_WIDTH(M_WIDTH),.MINMAX(MINMAX),.LATENCY(LATENCY_UNIT)) u_two2one_minmax	
			(
			 .clk(clk),
			 .arst(arst),

			 .a_data(comp_inports[(ib_array_param[32*i+31:32*i]+2*j+1)*D_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j)*D_WIDTH]),
			 .a_m(m_inports[(ib_array_param[32*i+31:32*i]+2*j+1)*M_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j)*M_WIDTH]),
			 .a_valid(valid_inports[(ib_array_param[32*i+31:32*i]+2*j)]),

			 .b_data(comp_inports[(ib_array_param[32*i+31:32*i]+2*j+2)*D_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j+1)*D_WIDTH]),
			 .b_m(m_inports[(ib_array_param[32*i+31:32*i]+2*j+2)*M_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j+1)*M_WIDTH]),
			 .b_valid(valid_inports[(ib_array_param[32*i+31:32*i]+2*j+1)]),
	
			 .o_data(comp_outports[(ob_array_param[32*i+31:32*i]+j+1)*D_WIDTH-1:(ob_array_param[32*i+31:32*i]+j)*D_WIDTH]),
			 .o_m(m_outports[(ob_array_param[32*i+31:32*i]+j+1)*M_WIDTH-1:(ob_array_param[32*i+31:32*i]+j)*M_WIDTH]),
			 .o_valid(valid_outports[(ob_array_param[32*i+31:32*i]+j)])
			);
			
			if(i==0) begin: first_level
				assign comp_inports[(ib_array_param[31:0]+2*j+1)*D_WIDTH-1:(ib_array_param[31:0]+2*j)*D_WIDTH] = data_array[(2*j+1)*D_WIDTH-1:2*j*D_WIDTH];
				assign comp_inports[(ib_array_param[31:0]+2*j+2)*D_WIDTH-1:(ib_array_param[31:0]+2*j+1)*D_WIDTH] = data_array[(2*j+2)*D_WIDTH-1:(2*j+1)*D_WIDTH];
				assign m_inports[(ib_array_param[31:0]+2*j+1)*M_WIDTH-1:(ib_array_param[31:0]+2*j)*M_WIDTH] = m_array[(2*j+1)*M_WIDTH-1:2*j*M_WIDTH];
				assign m_inports[(ib_array_param[31:0]+2*j+2)*M_WIDTH-1:(ib_array_param[31:0]+2*j+1)*M_WIDTH] = m_array[(2*j+2)*M_WIDTH-1:(2*j+1)*M_WIDTH];
				assign valid_inports[ib_array_param[31:0]+2*j] = valid_array[2*j];
				assign valid_inports[ib_array_param[31:0]+2*j+1] = valid_array[2*j+1];
			end else begin: mid_level
				assign comp_inports[(ib_array_param[32*i+31:32*i]+2*j+1)*D_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j)*D_WIDTH]=comp_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)*D_WIDTH-1:(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j)*D_WIDTH];
				assign comp_inports[(ib_array_param[32*i+31:32*i]+2*j+2)*D_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j+1)*D_WIDTH]=comp_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+2)*D_WIDTH-1:(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)*D_WIDTH];
				assign m_inports[(ib_array_param[32*i+31:32*i]+2*j+1)*M_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j)*M_WIDTH]=m_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)*M_WIDTH-1:(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j)*M_WIDTH];
				assign m_inports[(ib_array_param[32*i+31:32*i]+2*j+2)*M_WIDTH-1:(ib_array_param[32*i+31:32*i]+2*j+1)*M_WIDTH]=m_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+2)*M_WIDTH-1:(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)*M_WIDTH];
				assign valid_inports[(ib_array_param[32*i+31:32*i]+2*j)]=valid_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j)];
				assign valid_inports[(ib_array_param[32*i+31:32*i]+2*j+1)]=valid_outports[(ob_array_param[32*(i-1)+31:32*(i-1)]+2*j+1)];
			end 
			if(i==(depth-1)) begin: last_level
				 assign result=comp_outports[(ob_array_param[32*i+31:32*i]+j+1)*D_WIDTH-1:(ob_array_param[32*i+31:32*i]+j)*D_WIDTH];
				 assign result_m=m_outports[(ob_array_param[32*i+31:32*i]+j+1)*M_WIDTH-1:(ob_array_param[32*i+31:32*i]+j)*M_WIDTH];
				 assign result_valid=valid_outports[(ob_array_param[32*i+31:32*i]+j)];
			end
		end

		if(depth_array_param[32*i+31:32*i]%2==1) begin: SINGLE_OP_ARRAY
			one2one_minmax #(.D_WIDTH(D_WIDTH),.M_WIDTH(M_WIDTH),.LATENCY(LATENCY_UNIT)) u_one2one_minmax
			(
			 .clk(clk),
			 .arst(arst),
			
			 .din(comp_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*D_WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*D_WIDTH]),
			 .din_m(m_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*M_WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*M_WIDTH]),
			 .din_valid(valid_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1]),

			 .dout(comp_outports[(ob_array_param[32*(i+1)+31:32*(i+1)])*D_WIDTH-1:(ob_array_param[32*(i+1)+31:32*(i+1)]-1)*D_WIDTH]),
			 .dout_m(m_outports[(ob_array_param[32*(i+1)+31:32*(i+1)])*M_WIDTH-1:(ob_array_param[32*(i+1)+31:32*(i+1)]-1)*M_WIDTH]),
			 .dout_valid(valid_outports[(ob_array_param[32*(i+1)+31:32*(i+1)])-1])
			);

			if(i==0) begin: single_first_level
				assign comp_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*D_WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*D_WIDTH]=data_array[(D_WIDTH*CNO-1):(D_WIDTH*(CNO-1))];
				assign m_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*M_WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*M_WIDTH]=m_array[(M_WIDTH*CNO-1):(M_WIDTH*(CNO-1))];
				assign valid_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1]=valid_array[CNO-1];
			end else begin: single_inter_level
				assign comp_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*D_WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*D_WIDTH]=comp_outports[(ob_array_param[32*i+31:32*i])*D_WIDTH-1:(ob_array_param[32*i+31:32*i]-1)*D_WIDTH];
				assign m_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])*M_WIDTH-1:(ib_array_param[32*(i+1)+31:32*(i+1)]-1)*M_WIDTH]=m_outports[(ob_array_param[32*i+31:32*i])*M_WIDTH-1:(ob_array_param[32*i+31:32*i]-1)*M_WIDTH];
				assign valid_inports[(ib_array_param[32*(i+1)+31:32*(i+1)])-1]=valid_outports[(ob_array_param[32*i+31:32*i])-1];
			end
		end
	end
endgenerate


endmodule

