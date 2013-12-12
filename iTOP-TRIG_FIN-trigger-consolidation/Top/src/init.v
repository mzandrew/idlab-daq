`timescale 1ns/1ps

//power up initialization sequence
module init(
	input clk,
	output rst_fifos,
	output rst_sorter,
	output rst_trigger,
	output rst_dcm,
	input  dcm_locked,
	output rst_aurora
	);

reg [1:0] state;
localparam RST_START=0, RST_DCM=1, RST_AURORA=2, RST_DONE=3;

wire rst_dcm_done;
wire rst_aurora_done;
wire rst_not_done;
reg [7:0] cnt;

initial begin
	state<=RST_START;
	cnt<=0;
end

always@(posedge clk) begin
	case(state)
		RST_START: 	state<=RST_DCM;
		RST_DCM: 	begin
					if(rst_dcm_done) state<=RST_AURORA;
					else state<=state;
			 	end
		RST_AURORA: 	begin
					if(rst_aurora_done) state<=RST_DONE;
					else state<=state;
				end
		RST_DONE:	state<=state;
		default:	state<=RST_START;
	endcase
end

always@(posedge clk) begin
	if(state==RST_START)
			cnt<=0;
	if(state==RST_DCM && cnt[7]==1'b0)
			cnt<=cnt+1;
	else if(state==RST_DCM && rst_dcm_done==1'b1)
			cnt<=0;
	else if(state==RST_AURORA && cnt[7]==1'b0)
			cnt<=cnt+1;
	else if(state==RST_AURORA && rst_aurora_done==1'b1)
			cnt<=0;
	else
			cnt<=cnt;
end

assign rst_dcm_done=(state==RST_DCM) && (cnt[7]==1'b1) && (dcm_locked==1'b1);
assign rst_aurora_done=(state==RST_AURORA) && (cnt[7]==1'b1); 

assign rst_not_done=(state!=RST_DONE);

assign rst_fifos=rst_not_done;
assign rst_sorter=rst_not_done;
assign rst_trigger=rst_not_done;
assign rst_dcm=(state==RST_DCM) && (cnt[7]==1'b0);
assign rst_aurora=(state==RST_AURORA) && (cnt[7]==1'b0);

endmodule


