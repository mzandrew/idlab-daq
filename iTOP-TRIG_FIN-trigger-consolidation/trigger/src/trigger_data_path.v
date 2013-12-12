`timescale 1ns/1ps

module trigger_data_path(
                input clk,
                input rst,

                input [1:0] cmd_i,
                input [5:0] addr_i,

                output[26:0] max_sum,
                output max_sum_valid,
                output[7:0] max_sumid
                );

parameter B0_R0="NULL.mif";
parameter B0_R1="NULL.mif";
parameter B0_R2="NULL.mif";
parameter B0_R3="NULL.mif";
parameter B0_R4="NULL.mif";
parameter B0_R5="NULL.mif";
parameter B0_R6="NULL.mif";
parameter B0_R7="NULL.mif";
parameter B0_R8="NULL.mif";
parameter B0_R9="NULL.mif";
parameter B1_R0="NULL.mif";
parameter B1_R1="NULL.mif";
parameter B1_R2="NULL.mif";
parameter B1_R3="NULL.mif";
parameter B1_R4="NULL.mif";
parameter B1_R5="NULL.mif";
parameter B1_R6="NULL.mif";
parameter B1_R7="NULL.mif";
parameter B1_R8="NULL.mif";
parameter B1_R9="NULL.mif";
parameter B2_R0="NULL.mif";
parameter B2_R1="NULL.mif";
parameter B2_R2="NULL.mif";
parameter B2_R3="NULL.mif";
parameter B2_R4="NULL.mif";
parameter B2_R5="NULL.mif";
parameter B2_R6="NULL.mif";
parameter B2_R7="NULL.mif";
parameter B2_R8="NULL.mif";
parameter B2_R9="NULL.mif";
parameter B3_R0="NULL.mif";
parameter B3_R1="NULL.mif";
parameter B3_R2="NULL.mif";
parameter B3_R3="NULL.mif";
parameter B3_R4="NULL.mif";
parameter B3_R5="NULL.mif";
parameter B3_R6="NULL.mif";
parameter B3_R7="NULL.mif";
parameter B3_R8="NULL.mif";
parameter B3_R9="NULL.mif";
parameter B4_R0="NULL.mif";
parameter B4_R1="NULL.mif";
parameter B4_R2="NULL.mif";
parameter B4_R3="NULL.mif";
parameter B4_R4="NULL.mif";
parameter B4_R5="NULL.mif";
parameter B4_R6="NULL.mif";
parameter B4_R7="NULL.mif";
parameter B4_R8="NULL.mif";
parameter B4_R9="NULL.mif";
parameter B5_R0="NULL.mif";
parameter B5_R1="NULL.mif";
parameter B5_R2="NULL.mif";
parameter B5_R3="NULL.mif";
parameter B5_R4="NULL.mif";
parameter B5_R5="NULL.mif";
parameter B5_R6="NULL.mif";
parameter B5_R7="NULL.mif";
parameter B5_R8="NULL.mif";
parameter B5_R9="NULL.mif";
parameter B6_R0="NULL.mif";
parameter B6_R1="NULL.mif";
parameter B6_R2="NULL.mif";
parameter B6_R3="NULL.mif";
parameter B6_R4="NULL.mif";
parameter B6_R5="NULL.mif";
parameter B6_R6="NULL.mif";
parameter B6_R7="NULL.mif";
parameter B6_R8="NULL.mif";
parameter B6_R9="NULL.mif";
parameter B7_R0="NULL.mif";
parameter B7_R1="NULL.mif";
parameter B7_R2="NULL.mif";
parameter B7_R3="NULL.mif";
parameter B7_R4="NULL.mif";
parameter B7_R5="NULL.mif";
parameter B7_R6="NULL.mif";
parameter B7_R7="NULL.mif";
parameter B7_R8="NULL.mif";
parameter B7_R9="NULL.mif";
parameter B8_R0="NULL.mif";
parameter B8_R1="NULL.mif";
parameter B8_R2="NULL.mif";
parameter B8_R3="NULL.mif";
parameter B8_R4="NULL.mif";
parameter B8_R5="NULL.mif";
parameter B8_R6="NULL.mif";
parameter B8_R7="NULL.mif";
parameter B8_R8="NULL.mif";
parameter B8_R9="NULL.mif";
parameter B9_R0="NULL.mif";
parameter B9_R1="NULL.mif";
parameter B9_R2="NULL.mif";
parameter B9_R3="NULL.mif";
parameter B9_R4="NULL.mif";
parameter B9_R5="NULL.mif";
parameter B9_R6="NULL.mif";
parameter B9_R7="NULL.mif";
parameter B9_R8="NULL.mif";
parameter B9_R9="NULL.mif";

parameter ID_B0_R0_0=8'h00;
parameter ID_B0_R0_1=8'h00;
parameter ID_B0_R1_0=8'h00;
parameter ID_B0_R1_1=8'h00;
parameter ID_B0_R2_0=8'h00;
parameter ID_B0_R2_1=8'h00;
parameter ID_B0_R3_0=8'h00;
parameter ID_B0_R3_1=8'h00;
parameter ID_B0_R4_0=8'h00;
parameter ID_B0_R4_1=8'h00;
parameter ID_B0_R5_0=8'h00;
parameter ID_B0_R5_1=8'h00;
parameter ID_B0_R6_0=8'h00;
parameter ID_B0_R6_1=8'h00;
parameter ID_B0_R7_0=8'h00;
parameter ID_B0_R7_1=8'h00;
parameter ID_B0_R8_0=8'h00;
parameter ID_B0_R8_1=8'h00;
parameter ID_B0_R9_0=8'h00;
parameter ID_B0_R9_1=8'h00;
parameter ID_B1_R0_0=8'h00;
parameter ID_B1_R0_1=8'h00;
parameter ID_B1_R1_0=8'h00;
parameter ID_B1_R1_1=8'h00;
parameter ID_B1_R2_0=8'h00;
parameter ID_B1_R2_1=8'h00;
parameter ID_B1_R3_0=8'h00;
parameter ID_B1_R3_1=8'h00;
parameter ID_B1_R4_0=8'h00;
parameter ID_B1_R4_1=8'h00;
parameter ID_B1_R5_0=8'h00;
parameter ID_B1_R5_1=8'h00;
parameter ID_B1_R6_0=8'h00;
parameter ID_B1_R6_1=8'h00;
parameter ID_B1_R7_0=8'h00;
parameter ID_B1_R7_1=8'h00;
parameter ID_B1_R8_0=8'h00;
parameter ID_B1_R8_1=8'h00;
parameter ID_B1_R9_0=8'h00;
parameter ID_B1_R9_1=8'h00;
parameter ID_B2_R0_0=8'h00;
parameter ID_B2_R0_1=8'h00;
parameter ID_B2_R1_0=8'h00;
parameter ID_B2_R1_1=8'h00;
parameter ID_B2_R2_0=8'h00;
parameter ID_B2_R2_1=8'h00;
parameter ID_B2_R3_0=8'h00;
parameter ID_B2_R3_1=8'h00;
parameter ID_B2_R4_0=8'h00;
parameter ID_B2_R4_1=8'h00;
parameter ID_B2_R5_0=8'h00;
parameter ID_B2_R5_1=8'h00;
parameter ID_B2_R6_0=8'h00;
parameter ID_B2_R6_1=8'h00;
parameter ID_B2_R7_0=8'h00;
parameter ID_B2_R7_1=8'h00;
parameter ID_B2_R8_0=8'h00;
parameter ID_B2_R8_1=8'h00;
parameter ID_B2_R9_0=8'h00;
parameter ID_B2_R9_1=8'h00;
parameter ID_B3_R0_0=8'h00;
parameter ID_B3_R0_1=8'h00;
parameter ID_B3_R1_0=8'h00;
parameter ID_B3_R1_1=8'h00;
parameter ID_B3_R2_0=8'h00;
parameter ID_B3_R2_1=8'h00;
parameter ID_B3_R3_0=8'h00;
parameter ID_B3_R3_1=8'h00;
parameter ID_B3_R4_0=8'h00;
parameter ID_B3_R4_1=8'h00;
parameter ID_B3_R5_0=8'h00;
parameter ID_B3_R5_1=8'h00;
parameter ID_B3_R6_0=8'h00;
parameter ID_B3_R6_1=8'h00;
parameter ID_B3_R7_0=8'h00;
parameter ID_B3_R7_1=8'h00;
parameter ID_B3_R8_0=8'h00;
parameter ID_B3_R8_1=8'h00;
parameter ID_B3_R9_0=8'h00;
parameter ID_B3_R9_1=8'h00;
parameter ID_B4_R0_0=8'h00;
parameter ID_B4_R0_1=8'h00;
parameter ID_B4_R1_0=8'h00;
parameter ID_B4_R1_1=8'h00;
parameter ID_B4_R2_0=8'h00;
parameter ID_B4_R2_1=8'h00;
parameter ID_B4_R3_0=8'h00;
parameter ID_B4_R3_1=8'h00;
parameter ID_B4_R4_0=8'h00;
parameter ID_B4_R4_1=8'h00;
parameter ID_B4_R5_0=8'h00;
parameter ID_B4_R5_1=8'h00;
parameter ID_B4_R6_0=8'h00;
parameter ID_B4_R6_1=8'h00;
parameter ID_B4_R7_0=8'h00;
parameter ID_B4_R7_1=8'h00;
parameter ID_B4_R8_0=8'h00;
parameter ID_B4_R8_1=8'h00;
parameter ID_B4_R9_0=8'h00;
parameter ID_B4_R9_1=8'h00;
parameter ID_B5_R0_0=8'h00;
parameter ID_B5_R0_1=8'h00;
parameter ID_B5_R1_0=8'h00;
parameter ID_B5_R1_1=8'h00;
parameter ID_B5_R2_0=8'h00;
parameter ID_B5_R2_1=8'h00;
parameter ID_B5_R3_0=8'h00;
parameter ID_B5_R3_1=8'h00;
parameter ID_B5_R4_0=8'h00;
parameter ID_B5_R4_1=8'h00;
parameter ID_B5_R5_0=8'h00;
parameter ID_B5_R5_1=8'h00;
parameter ID_B5_R6_0=8'h00;
parameter ID_B5_R6_1=8'h00;
parameter ID_B5_R7_0=8'h00;
parameter ID_B5_R7_1=8'h00;
parameter ID_B5_R8_0=8'h00;
parameter ID_B5_R8_1=8'h00;
parameter ID_B5_R9_0=8'h00;
parameter ID_B5_R9_1=8'h00;
parameter ID_B6_R0_0=8'h00;
parameter ID_B6_R0_1=8'h00;
parameter ID_B6_R1_0=8'h00;
parameter ID_B6_R1_1=8'h00;
parameter ID_B6_R2_0=8'h00;
parameter ID_B6_R2_1=8'h00;
parameter ID_B6_R3_0=8'h00;
parameter ID_B6_R3_1=8'h00;
parameter ID_B6_R4_0=8'h00;
parameter ID_B6_R4_1=8'h00;
parameter ID_B6_R5_0=8'h00;
parameter ID_B6_R5_1=8'h00;
parameter ID_B6_R6_0=8'h00;
parameter ID_B6_R6_1=8'h00;
parameter ID_B6_R7_0=8'h00;
parameter ID_B6_R7_1=8'h00;
parameter ID_B6_R8_0=8'h00;
parameter ID_B6_R8_1=8'h00;
parameter ID_B6_R9_0=8'h00;
parameter ID_B6_R9_1=8'h00;
parameter ID_B7_R0_0=8'h00;
parameter ID_B7_R0_1=8'h00;
parameter ID_B7_R1_0=8'h00;
parameter ID_B7_R1_1=8'h00;
parameter ID_B7_R2_0=8'h00;
parameter ID_B7_R2_1=8'h00;
parameter ID_B7_R3_0=8'h00;
parameter ID_B7_R3_1=8'h00;
parameter ID_B7_R4_0=8'h00;
parameter ID_B7_R4_1=8'h00;
parameter ID_B7_R5_0=8'h00;
parameter ID_B7_R5_1=8'h00;
parameter ID_B7_R6_0=8'h00;
parameter ID_B7_R6_1=8'h00;
parameter ID_B7_R7_0=8'h00;
parameter ID_B7_R7_1=8'h00;
parameter ID_B7_R8_0=8'h00;
parameter ID_B7_R8_1=8'h00;
parameter ID_B7_R9_0=8'h00;
parameter ID_B7_R9_1=8'h00;
parameter ID_B8_R0_0=8'h00;
parameter ID_B8_R0_1=8'h00;
parameter ID_B8_R1_0=8'h00;
parameter ID_B8_R1_1=8'h00;
parameter ID_B8_R2_0=8'h00;
parameter ID_B8_R2_1=8'h00;
parameter ID_B8_R3_0=8'h00;
parameter ID_B8_R3_1=8'h00;
parameter ID_B8_R4_0=8'h00;
parameter ID_B8_R4_1=8'h00;
parameter ID_B8_R5_0=8'h00;
parameter ID_B8_R5_1=8'h00;
parameter ID_B8_R6_0=8'h00;
parameter ID_B8_R6_1=8'h00;
parameter ID_B8_R7_0=8'h00;
parameter ID_B8_R7_1=8'h00;
parameter ID_B8_R8_0=8'h00;
parameter ID_B8_R8_1=8'h00;
parameter ID_B8_R9_0=8'h00;
parameter ID_B8_R9_1=8'h00;
parameter ID_B9_R0_0=8'h00;
parameter ID_B9_R0_1=8'h00;
parameter ID_B9_R1_0=8'h00;
parameter ID_B9_R1_1=8'h00;
parameter ID_B9_R2_0=8'h00;
parameter ID_B9_R2_1=8'h00;
parameter ID_B9_R3_0=8'h00;
parameter ID_B9_R3_1=8'h00;
parameter ID_B9_R4_0=8'h00;
parameter ID_B9_R4_1=8'h00;
parameter ID_B9_R5_0=8'h00;
parameter ID_B9_R5_1=8'h00;
parameter ID_B9_R6_0=8'h00;
parameter ID_B9_R6_1=8'h00;
parameter ID_B9_R7_0=8'h00;
parameter ID_B9_R7_1=8'h00;
parameter ID_B9_R8_0=8'h00;
parameter ID_B9_R8_1=8'h00;
parameter ID_B9_R9_0=8'h00;
parameter ID_B9_R9_1=8'h00;

(* equivalent_register_removal = "no" *) reg [2*10-1:0] cmd_reg;
(* equivalent_register_removal = "no" *) reg [6*10-1:0] addr_reg;

always@(posedge clk) begin
        if(rst) begin
                cmd_reg<=0;
                addr_reg<=0;
        end else begin
                cmd_reg<={10{cmd_i}};
                addr_reg<={10{addr_i}};
        end
end

wire [27*10-1:0] sums;
wire [8*10-1:0] sumids;
wire [9:0] sum_valids;

correlator_block #(
.ROM0_coe(B0_R0),
.ROM1_coe(B0_R1),
.ROM2_coe(B0_R2),
.ROM3_coe(B0_R3),
.ROM4_coe(B0_R4),
.ROM5_coe(B0_R5),
.ROM6_coe(B0_R6),
.ROM7_coe(B0_R7),
.ROM8_coe(B0_R8),
.ROM9_coe(B0_R9),
.ID_0_0(ID_B0_R0_0),
.ID_1_0(ID_B0_R0_1),
.ID_0_1(ID_B0_R1_0),
.ID_1_1(ID_B0_R1_1),
.ID_0_2(ID_B0_R2_0),
.ID_1_2(ID_B0_R2_1),
.ID_0_3(ID_B0_R3_0),
.ID_1_3(ID_B0_R3_1),
.ID_0_4(ID_B0_R4_0),
.ID_1_4(ID_B0_R4_1),
.ID_0_5(ID_B0_R5_0),
.ID_1_5(ID_B0_R5_1),
.ID_0_6(ID_B0_R6_0),
.ID_1_6(ID_B0_R6_1),
.ID_0_7(ID_B0_R7_0),
.ID_1_7(ID_B0_R7_1),
.ID_0_8(ID_B0_R8_0),
.ID_1_8(ID_B0_R8_1),
.ID_0_9(ID_B0_R9_0),
.ID_1_9(ID_B0_R9_1)
)
u_correlator_block_0(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*0+1:2*0]),
.addr_i(addr_reg[6*0+5:6*0]),
.max_sum(sums[27*0+26:27*0]),
.max_sumid(sumids[8*0+7:8*0]),
.max_sum_valid(sum_valids[0])
);
correlator_block #(
.ROM0_coe(B1_R0),
.ROM1_coe(B1_R1),
.ROM2_coe(B1_R2),
.ROM3_coe(B1_R3),
.ROM4_coe(B1_R4),
.ROM5_coe(B1_R5),
.ROM6_coe(B1_R6),
.ROM7_coe(B1_R7),
.ROM8_coe(B1_R8),
.ROM9_coe(B1_R9),
.ID_0_0(ID_B1_R0_0),
.ID_1_0(ID_B1_R0_1),
.ID_0_1(ID_B1_R1_0),
.ID_1_1(ID_B1_R1_1),
.ID_0_2(ID_B1_R2_0),
.ID_1_2(ID_B1_R2_1),
.ID_0_3(ID_B1_R3_0),
.ID_1_3(ID_B1_R3_1),
.ID_0_4(ID_B1_R4_0),
.ID_1_4(ID_B1_R4_1),
.ID_0_5(ID_B1_R5_0),
.ID_1_5(ID_B1_R5_1),
.ID_0_6(ID_B1_R6_0),
.ID_1_6(ID_B1_R6_1),
.ID_0_7(ID_B1_R7_0),
.ID_1_7(ID_B1_R7_1),
.ID_0_8(ID_B1_R8_0),
.ID_1_8(ID_B1_R8_1),
.ID_0_9(ID_B1_R9_0),
.ID_1_9(ID_B1_R9_1)
)
u_correlator_block_1(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*1+1:2*1]),
.addr_i(addr_reg[6*1+5:6*1]),
.max_sum(sums[27*1+26:27*1]),
.max_sumid(sumids[8*1+7:8*1]),
.max_sum_valid(sum_valids[1])
);
correlator_block #(
.ROM0_coe(B2_R0),
.ROM1_coe(B2_R1),
.ROM2_coe(B2_R2),
.ROM3_coe(B2_R3),
.ROM4_coe(B2_R4),
.ROM5_coe(B2_R5),
.ROM6_coe(B2_R6),
.ROM7_coe(B2_R7),
.ROM8_coe(B2_R8),
.ROM9_coe(B2_R9),
.ID_0_0(ID_B2_R0_0),
.ID_1_0(ID_B2_R0_1),
.ID_0_1(ID_B2_R1_0),
.ID_1_1(ID_B2_R1_1),
.ID_0_2(ID_B2_R2_0),
.ID_1_2(ID_B2_R2_1),
.ID_0_3(ID_B2_R3_0),
.ID_1_3(ID_B2_R3_1),
.ID_0_4(ID_B2_R4_0),
.ID_1_4(ID_B2_R4_1),
.ID_0_5(ID_B2_R5_0),
.ID_1_5(ID_B2_R5_1),
.ID_0_6(ID_B2_R6_0),
.ID_1_6(ID_B2_R6_1),
.ID_0_7(ID_B2_R7_0),
.ID_1_7(ID_B2_R7_1),
.ID_0_8(ID_B2_R8_0),
.ID_1_8(ID_B2_R8_1),
.ID_0_9(ID_B2_R9_0),
.ID_1_9(ID_B2_R9_1)
)
u_correlator_block_2(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*2+1:2*2]),
.addr_i(addr_reg[6*2+5:6*2]),
.max_sum(sums[27*2+26:27*2]),
.max_sumid(sumids[8*2+7:8*2]),
.max_sum_valid(sum_valids[2])
);
correlator_block #(
.ROM0_coe(B3_R0),
.ROM1_coe(B3_R1),
.ROM2_coe(B3_R2),
.ROM3_coe(B3_R3),
.ROM4_coe(B3_R4),
.ROM5_coe(B3_R5),
.ROM6_coe(B3_R6),
.ROM7_coe(B3_R7),
.ROM8_coe(B3_R8),
.ROM9_coe(B3_R9),
.ID_0_0(ID_B3_R0_0),
.ID_1_0(ID_B3_R0_1),
.ID_0_1(ID_B3_R1_0),
.ID_1_1(ID_B3_R1_1),
.ID_0_2(ID_B3_R2_0),
.ID_1_2(ID_B3_R2_1),
.ID_0_3(ID_B3_R3_0),
.ID_1_3(ID_B3_R3_1),
.ID_0_4(ID_B3_R4_0),
.ID_1_4(ID_B3_R4_1),
.ID_0_5(ID_B3_R5_0),
.ID_1_5(ID_B3_R5_1),
.ID_0_6(ID_B3_R6_0),
.ID_1_6(ID_B3_R6_1),
.ID_0_7(ID_B3_R7_0),
.ID_1_7(ID_B3_R7_1),
.ID_0_8(ID_B3_R8_0),
.ID_1_8(ID_B3_R8_1),
.ID_0_9(ID_B3_R9_0),
.ID_1_9(ID_B3_R9_1)
)
u_correlator_block_3(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*3+1:2*3]),
.addr_i(addr_reg[6*3+5:6*3]),
.max_sum(sums[27*3+26:27*3]),
.max_sumid(sumids[8*3+7:8*3]),
.max_sum_valid(sum_valids[3])
);
correlator_block #(
.ROM0_coe(B4_R0),
.ROM1_coe(B4_R1),
.ROM2_coe(B4_R2),
.ROM3_coe(B4_R3),
.ROM4_coe(B4_R4),
.ROM5_coe(B4_R5),
.ROM6_coe(B4_R6),
.ROM7_coe(B4_R7),
.ROM8_coe(B4_R8),
.ROM9_coe(B4_R9),
.ID_0_0(ID_B4_R0_0),
.ID_1_0(ID_B4_R0_1),
.ID_0_1(ID_B4_R1_0),
.ID_1_1(ID_B4_R1_1),
.ID_0_2(ID_B4_R2_0),
.ID_1_2(ID_B4_R2_1),
.ID_0_3(ID_B4_R3_0),
.ID_1_3(ID_B4_R3_1),
.ID_0_4(ID_B4_R4_0),
.ID_1_4(ID_B4_R4_1),
.ID_0_5(ID_B4_R5_0),
.ID_1_5(ID_B4_R5_1),
.ID_0_6(ID_B4_R6_0),
.ID_1_6(ID_B4_R6_1),
.ID_0_7(ID_B4_R7_0),
.ID_1_7(ID_B4_R7_1),
.ID_0_8(ID_B4_R8_0),
.ID_1_8(ID_B4_R8_1),
.ID_0_9(ID_B4_R9_0),
.ID_1_9(ID_B4_R9_1)
)
u_correlator_block_4(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*4+1:2*4]),
.addr_i(addr_reg[6*4+5:6*4]),
.max_sum(sums[27*4+26:27*4]),
.max_sumid(sumids[8*4+7:8*4]),
.max_sum_valid(sum_valids[4])
);
correlator_block #(
.ROM0_coe(B5_R0),
.ROM1_coe(B5_R1),
.ROM2_coe(B5_R2),
.ROM3_coe(B5_R3),
.ROM4_coe(B5_R4),
.ROM5_coe(B5_R5),
.ROM6_coe(B5_R6),
.ROM7_coe(B5_R7),
.ROM8_coe(B5_R8),
.ROM9_coe(B5_R9),
.ID_0_0(ID_B5_R0_0),
.ID_1_0(ID_B5_R0_1),
.ID_0_1(ID_B5_R1_0),
.ID_1_1(ID_B5_R1_1),
.ID_0_2(ID_B5_R2_0),
.ID_1_2(ID_B5_R2_1),
.ID_0_3(ID_B5_R3_0),
.ID_1_3(ID_B5_R3_1),
.ID_0_4(ID_B5_R4_0),
.ID_1_4(ID_B5_R4_1),
.ID_0_5(ID_B5_R5_0),
.ID_1_5(ID_B5_R5_1),
.ID_0_6(ID_B5_R6_0),
.ID_1_6(ID_B5_R6_1),
.ID_0_7(ID_B5_R7_0),
.ID_1_7(ID_B5_R7_1),
.ID_0_8(ID_B5_R8_0),
.ID_1_8(ID_B5_R8_1),
.ID_0_9(ID_B5_R9_0),
.ID_1_9(ID_B5_R9_1)
)
u_correlator_block_5(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*5+1:2*5]),
.addr_i(addr_reg[6*5+5:6*5]),
.max_sum(sums[27*5+26:27*5]),
.max_sumid(sumids[8*5+7:8*5]),
.max_sum_valid(sum_valids[5])
);
correlator_block #(
.ROM0_coe(B6_R0),
.ROM1_coe(B6_R1),
.ROM2_coe(B6_R2),
.ROM3_coe(B6_R3),
.ROM4_coe(B6_R4),
.ROM5_coe(B6_R5),
.ROM6_coe(B6_R6),
.ROM7_coe(B6_R7),
.ROM8_coe(B6_R8),
.ROM9_coe(B6_R9),
.ID_0_0(ID_B6_R0_0),
.ID_1_0(ID_B6_R0_1),
.ID_0_1(ID_B6_R1_0),
.ID_1_1(ID_B6_R1_1),
.ID_0_2(ID_B6_R2_0),
.ID_1_2(ID_B6_R2_1),
.ID_0_3(ID_B6_R3_0),
.ID_1_3(ID_B6_R3_1),
.ID_0_4(ID_B6_R4_0),
.ID_1_4(ID_B6_R4_1),
.ID_0_5(ID_B6_R5_0),
.ID_1_5(ID_B6_R5_1),
.ID_0_6(ID_B6_R6_0),
.ID_1_6(ID_B6_R6_1),
.ID_0_7(ID_B6_R7_0),
.ID_1_7(ID_B6_R7_1),
.ID_0_8(ID_B6_R8_0),
.ID_1_8(ID_B6_R8_1),
.ID_0_9(ID_B6_R9_0),
.ID_1_9(ID_B6_R9_1)
)
u_correlator_block_6(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*6+1:2*6]),
.addr_i(addr_reg[6*6+5:6*6]),
.max_sum(sums[27*6+26:27*6]),
.max_sumid(sumids[8*6+7:8*6]),
.max_sum_valid(sum_valids[6])
);
correlator_block #(
.ROM0_coe(B7_R0),
.ROM1_coe(B7_R1),
.ROM2_coe(B7_R2),
.ROM3_coe(B7_R3),
.ROM4_coe(B7_R4),
.ROM5_coe(B7_R5),
.ROM6_coe(B7_R6),
.ROM7_coe(B7_R7),
.ROM8_coe(B7_R8),
.ROM9_coe(B7_R9),
.ID_0_0(ID_B7_R0_0),
.ID_1_0(ID_B7_R0_1),
.ID_0_1(ID_B7_R1_0),
.ID_1_1(ID_B7_R1_1),
.ID_0_2(ID_B7_R2_0),
.ID_1_2(ID_B7_R2_1),
.ID_0_3(ID_B7_R3_0),
.ID_1_3(ID_B7_R3_1),
.ID_0_4(ID_B7_R4_0),
.ID_1_4(ID_B7_R4_1),
.ID_0_5(ID_B7_R5_0),
.ID_1_5(ID_B7_R5_1),
.ID_0_6(ID_B7_R6_0),
.ID_1_6(ID_B7_R6_1),
.ID_0_7(ID_B7_R7_0),
.ID_1_7(ID_B7_R7_1),
.ID_0_8(ID_B7_R8_0),
.ID_1_8(ID_B7_R8_1),
.ID_0_9(ID_B7_R9_0),
.ID_1_9(ID_B7_R9_1)
)
u_correlator_block_7(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*7+1:2*7]),
.addr_i(addr_reg[6*7+5:6*7]),
.max_sum(sums[27*7+26:27*7]),
.max_sumid(sumids[8*7+7:8*7]),
.max_sum_valid(sum_valids[7])
);
correlator_block #(
.ROM0_coe(B8_R0),
.ROM1_coe(B8_R1),
.ROM2_coe(B8_R2),
.ROM3_coe(B8_R3),
.ROM4_coe(B8_R4),
.ROM5_coe(B8_R5),
.ROM6_coe(B8_R6),
.ROM7_coe(B8_R7),
.ROM8_coe(B8_R8),
.ROM9_coe(B8_R9),
.ID_0_0(ID_B8_R0_0),
.ID_1_0(ID_B8_R0_1),
.ID_0_1(ID_B8_R1_0),
.ID_1_1(ID_B8_R1_1),
.ID_0_2(ID_B8_R2_0),
.ID_1_2(ID_B8_R2_1),
.ID_0_3(ID_B8_R3_0),
.ID_1_3(ID_B8_R3_1),
.ID_0_4(ID_B8_R4_0),
.ID_1_4(ID_B8_R4_1),
.ID_0_5(ID_B8_R5_0),
.ID_1_5(ID_B8_R5_1),
.ID_0_6(ID_B8_R6_0),
.ID_1_6(ID_B8_R6_1),
.ID_0_7(ID_B8_R7_0),
.ID_1_7(ID_B8_R7_1),
.ID_0_8(ID_B8_R8_0),
.ID_1_8(ID_B8_R8_1),
.ID_0_9(ID_B8_R9_0),
.ID_1_9(ID_B8_R9_1)
)
u_correlator_block_8(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*8+1:2*8]),
.addr_i(addr_reg[6*8+5:6*8]),
.max_sum(sums[27*8+26:27*8]),
.max_sumid(sumids[8*8+7:8*8]),
.max_sum_valid(sum_valids[8])
);
correlator_block #(
.ROM0_coe(B9_R0),
.ROM1_coe(B9_R1),
.ROM2_coe(B9_R2),
.ROM3_coe(B9_R3),
.ROM4_coe(B9_R4),
.ROM5_coe(B9_R5),
.ROM6_coe(B9_R6),
.ROM7_coe(B9_R7),
.ROM8_coe(B9_R8),
.ROM9_coe(B9_R9),
.ID_0_0(ID_B9_R0_0),
.ID_1_0(ID_B9_R0_1),
.ID_0_1(ID_B9_R1_0),
.ID_1_1(ID_B9_R1_1),
.ID_0_2(ID_B9_R2_0),
.ID_1_2(ID_B9_R2_1),
.ID_0_3(ID_B9_R3_0),
.ID_1_3(ID_B9_R3_1),
.ID_0_4(ID_B9_R4_0),
.ID_1_4(ID_B9_R4_1),
.ID_0_5(ID_B9_R5_0),
.ID_1_5(ID_B9_R5_1),
.ID_0_6(ID_B9_R6_0),
.ID_1_6(ID_B9_R6_1),
.ID_0_7(ID_B9_R7_0),
.ID_1_7(ID_B9_R7_1),
.ID_0_8(ID_B9_R8_0),
.ID_1_8(ID_B9_R8_1),
.ID_0_9(ID_B9_R9_0),
.ID_1_9(ID_B9_R9_1)
)
u_correlator_block_9(
.clk(clk),
.rst(rst),
.cmd_i(cmd_reg[2*9+1:2*9]),
.addr_i(addr_reg[6*9+5:6*9]),
.max_sum(sums[27*9+26:27*9]),
.max_sumid(sumids[8*9+7:8*9]),
.max_sum_valid(sum_valids[9])
);

wire[26:0] max_sum_in;
wire[7:0] max_sumid_in;
wire max_sum_valid_in;

pipeline_minmax_core #(.D_WIDTH(27),.M_WIDTH(8),.MINMAX(0),.CNO(10),.LATENCY_UNIT(1))
        u_max(
         .clk(clk),
         .arst(rst),
         .data_array(sums),
         .m_array(sumids),
         .valid_array(sum_valids),
         .result(max_sum_in),
         .result_m(max_sumid_in),
         .result_valid(max_sum_valid_in)
        );

reg flip;

always@(posedge clk) begin
	if(rst)
		flip<=0;
	else if(max_sum_valid_in)
		flip<=(~flip);
end

reg [26:0] max_sum_reg;
reg [7:0] max_sumid_reg;
reg max_sum_valid_reg;

always@(posedge clk) begin
	if(rst) begin
		max_sum_reg<=0;
		max_sumid_reg<=0;
	end else if(flip==1'b0 && max_sum_valid_in==1'b1) begin
		max_sum_reg<=max_sum_in;
		max_sumid_reg<=max_sumid_in;
	end else if(flip==1'b1 && max_sum_valid_in==1'b1 && max_sum_in>max_sum_reg) begin
		max_sum_reg<=max_sum_in;
		max_sumid_reg<=max_sumid_in;
	end else begin
		max_sum_reg<=max_sum_reg;
		max_sumid_reg<=max_sumid_reg;
	end
end

always@(posedge clk) begin
	if(rst)
		max_sum_valid_reg<=0;
	else if(flip==1'b1 && max_sum_valid_in==1'b1)
		max_sum_valid_reg<=1;
	else
		max_sum_valid_reg<=0;
end

assign max_sum=max_sum_reg;
assign max_sumid=max_sumid_reg;
assign max_sum_valid=max_sum_valid_reg;

endmodule


