`timescale 1ns/1ps

//"PSTAGE" is the number of stages in the pipeline. When "PSTAGE<=0", no pipeline is added.
//"DATA_WIDTH" is the width of the data port.

module pipeline_propagation_core
				(
				 clk,
				 ce,
				 arst,
				 data_in,
				 data_o
				);
input clk,ce,arst;
parameter DATA_WIDTH=32;
input [DATA_WIDTH-1:0] data_in;
output [DATA_WIDTH-1:0] data_o;
parameter PSTAGE=1;

genvar i;
generate 

if(PSTAGE<=0) begin: NO_PIPELINE
	assign data_o=data_in;	
end else begin: WITH_PIPELINE
	reg [DATA_WIDTH-1:0] preg [0:PSTAGE-1];
	always@(posedge clk or posedge arst) begin: FIRST_PIPELINE
		if(arst)
			preg[0]<=0;
		else begin 
			if(ce)
				preg[0]<=data_in;
		end
	end	
	for(i=1;i<PSTAGE;i=i+1) begin: OTHER_PIPELINES
		always@(posedge clk or posedge arst) begin
			if(arst)
				preg[i]<=0;
			else begin
				if(ce)
					preg[i]<=preg[i-1];
			end
		end
	end
	assign data_o=preg[PSTAGE-1];
end

endgenerate

endmodule

