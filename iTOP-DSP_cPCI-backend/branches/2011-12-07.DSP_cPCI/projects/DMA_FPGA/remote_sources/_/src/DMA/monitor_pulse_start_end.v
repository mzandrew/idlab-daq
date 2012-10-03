`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:44 12/04/2011 
// Design Name: 
// Module Name:    monitor_pulse_start_end 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module monitor_pulse_start_end(
		input clk_i,
		input reset_i,
		
		input start_pulse_i,
		input end_pulse_i,
		output reg start_pulse_o,
		output reg end_pulse_o,
		output reg start_end_pulse_o
    );

reg start_pulse_reg;
reg start_pulse_pipe;
reg end_pulse_reg;
reg end_pulse_pipe;
reg start_pulse_posedge;
reg end_pulse_posedge;
reg time_out;
reg start_end_pulse;

reg [7:0] cnt_1;
reg [7:0] cnt_2;
reg [15:0] cnt_3;

initial begin
	start_pulse_reg<=1'b0;
	start_pulse_pipe<=1'b0;
	end_pulse_reg<=1'b0;
	end_pulse_pipe<=1'b0;
	start_pulse_posedge<=1'b0;
	end_pulse_posedge<=1'b0;
	time_out<=1'b0;
	start_end_pulse<=1'b0;
	cnt_1<=8'b0;
	cnt_2<=8'b0;
	cnt_3<=16'b0;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		start_pulse_reg<=1'b0;
		start_pulse_pipe<=1'b0;
	end else begin
		start_pulse_reg<=start_pulse_i;
		start_pulse_pipe<=start_pulse_reg;
	end
end

always@(posedge clk_i) begin
	if(reset_i)
		start_pulse_posedge<=1'b0;
	else
		start_pulse_posedge<=(~start_pulse_pipe)&start_pulse_reg;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		end_pulse_reg<=1'b0;
		end_pulse_pipe<=1'b0;
	end else begin
		end_pulse_reg<=end_pulse_i;
		end_pulse_pipe<=end_pulse_reg;
	end
end

always@(posedge clk_i) begin
	if(reset_i)
		end_pulse_posedge<=1'b0;
	else
		end_pulse_posedge<=(~end_pulse_pipe)&end_pulse_reg;
end

always@(posedge clk_i) begin
	if(reset_i | start_pulse_posedge)
		cnt_1<=8'b0;
	else if(cnt_1[7]==1'b1)//128
		cnt_1<=8'h01;
	else	
		cnt_1<=cnt_1+1'b1;
end

always@(posedge clk_i) begin
	if(reset_i | start_pulse_posedge)
		cnt_2<=8'b0;
	else if(cnt_1[7]==1'b1) begin
		if(cnt_2[7]==1'b1) //128
			cnt_2<=8'h01;
		else
			cnt_2<=cnt_2+1'b1;
	end else
		cnt_2<=cnt_2;
end

always@(posedge clk_i) begin
	if(reset_i | start_pulse_posedge)
		cnt_3<=16'b0;
	else if(cnt_2[7]==1'b1) begin
		if(cnt_3[15]==1'b1)
			cnt_3<=16'h0001;
		else
			cnt_3<=cnt_3+1'b1;
	end else 
		cnt_3<=cnt_3;
end

always@(posedge clk_i) begin
	if(reset_i|start_pulse_posedge)
		time_out<=1'b0;
	else if(cnt_3==16'h4f79) //about 5 s
		time_out<=1'b1;
	else
		time_out<=1'b0;
end

always@(posedge clk_i) begin
	if(reset_i)
		start_end_pulse<=1'b0;
	else if(start_pulse_posedge)
		start_end_pulse<=1'b1;
	else if(end_pulse_posedge)
		start_end_pulse<=1'b0;
	else if(time_out)
		start_end_pulse<=1'b0;
	else
		start_end_pulse<=start_end_pulse;
end

always@(posedge clk_i) begin
	if(reset_i) begin
		start_pulse_o<=1'b0;
		end_pulse_o<=1'b0;
		start_end_pulse_o<=1'b0;
	end else begin
		start_pulse_o<=start_pulse_pipe;
		end_pulse_o<=end_pulse_pipe;
		start_end_pulse_o<=start_end_pulse;
	end
end

endmodule
