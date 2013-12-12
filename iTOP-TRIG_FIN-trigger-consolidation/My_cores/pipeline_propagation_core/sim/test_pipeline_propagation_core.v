`timescale 1ns/1ps

`define CLOCK_PERIOD 6

module test_pipeline_propagation_core;

	reg clk;
 	reg arst;
	localparam data_width=32;
	localparam pstage=3;

	initial clk=1'b0;
	always begin
		# (`CLOCK_PERIOD/2) clk=~clk;
	end

	initial begin
		arst =1'b1;
		# (10.5*`CLOCK_PERIOD); 
		arst =1'b0;
	end

	reg [data_width-1:0] data_in;
	wire [data_width-1:0] data_o;

	initial begin
		data_in<=0;				
		# (11*`CLOCK_PERIOD);
		repeat(10) begin
			@(posedge clk);	
			data_in<=data_in+1;
		end
	end

	initial begin
		$display("TIME\tDATA_IN\tDATA_O");
		$monitor("%t\t%x\t%x",$time, data_in,data_o);
	end
	
	pipeline_propagation_core #(.DATA_WIDTH(data_width),.PSTAGE(pstage))
	u_test
		(
		 .clk(clk),		 
		 .ce(1'b1),
		 .arst(arst),
		 .data_in(data_in),
		 .data_o(data_o)
		);

endmodule

