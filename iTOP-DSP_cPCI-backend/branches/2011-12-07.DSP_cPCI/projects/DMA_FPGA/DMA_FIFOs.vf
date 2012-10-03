////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 13.1
//  \   \         Application : sch2hdl
//  /   /         Filename : DMA_FIFOs.vf
// /___/   /\     Timestamp : 07/01/2011 15:12:42
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: sch2hdl -sympath /home/zihangao/DATA_NT/Work/cPCI/firmware/src/cores/DMA_FPGA_cores -intstyle ise -family spartan6 -verilog /home/zihangao/DATA_NT/Work/cPCI/firmware/par/DMA_FIFOs.vf -w /home/zihangao/DATA_NT/Work/cPCI/firmware/src/DMA/DMA_FIFOs.sch
//Design Name: DMA_FIFOs
//Device: spartan6
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module DMA_FIFOs(DMA_fifo_rd_A1, 
                 DMA_fifo_rd_A2, 
                 DMA_fifo_rd_B1, 
                 DMA_fifo_rd_B2, 
                 DMA_merge_fifo_wr_dat_A1, 
                 DMA_merge_fifo_wr_dat_A2, 
                 DMA_merge_fifo_wr_dat_B1, 
                 DMA_merge_fifo_wr_dat_B2, 
                 DMA_merge_fifo_wr_en_A1, 
                 DMA_merge_fifo_wr_en_A2, 
                 DMA_merge_fifo_wr_en_B1, 
                 DMA_merge_fifo_wr_en_B2, 
                 down_fifo_rd_A1, 
                 down_fifo_rd_A2, 
                 down_fifo_rd_B1, 
                 down_fifo_rd_B2, 
                 fifo_data_A1, 
                 fifo_data_A2, 
                 fifo_data_B1, 
                 fifo_data_B2, 
                 fifo_data_valid_A1, 
                 fifo_data_valid_A2, 
                 fifo_data_valid_B1, 
                 fifo_data_valid_B2, 
                 rst_channel_0, 
                 rst_channel_1, 
                 rst_channel_2, 
                 rst_channel_3, 
                 WB_CLK, 
                 WB_CLK_2x, 
                 WB_RST, 
                 DMA_fifo_cnt_A1, 
                 DMA_fifo_cnt_A2, 
                 DMA_fifo_cnt_B1, 
                 DMA_fifo_cnt_B2, 
                 DMA_fifo_dat_A1, 
                 DMA_fifo_dat_A2, 
                 DMA_fifo_dat_B1, 
                 DMA_fifo_dat_B2, 
                 DMA_fifo_dat_strobe_A1, 
                 DMA_fifo_dat_strobe_A2, 
                 DMA_fifo_dat_strobe_B1, 
                 DMA_fifo_dat_strobe_B2, 
                 DMA_fifo_dat_strobe_current_A1, 
                 DMA_fifo_dat_strobe_current_A2, 
                 DMA_fifo_dat_strobe_current_B1, 
                 DMA_fifo_dat_strobe_current_B2, 
                 DMA_merge_fifo_prog_full_A1, 
                 DMA_merge_fifo_prog_full_A2, 
                 DMA_merge_fifo_prog_full_B1, 
                 DMA_merge_fifo_prog_full_B2, 
                 down_fifo_almost_empty_A1, 
                 down_fifo_almost_empty_A2, 
                 down_fifo_almost_empty_B1, 
                 down_fifo_almost_empty_B2, 
                 down_fifo_empty_A1, 
                 down_fifo_empty_A2, 
                 down_fifo_empty_B1, 
                 down_fifo_empty_B2, 
                 down_fifo_prog_empty_A1, 
                 down_fifo_prog_empty_A2, 
                 down_fifo_prog_empty_B1, 
                 down_fifo_prog_empty_B2, 
                 down_fifo_rdat_A1, 
                 down_fifo_rdat_A2, 
                 down_fifo_rdat_B1, 
                 down_fifo_rdat_B2, 
                 fifo_length_A1, 
                 fifo_length_A2, 
                 fifo_length_B1, 
                 fifo_length_B2, 
                 fifo_prog_full_A1, 
                 fifo_prog_full_A2, 
                 fifo_prog_full_B1, 
                 fifo_prog_full_B2);

    input DMA_fifo_rd_A1;
    input DMA_fifo_rd_A2;
    input DMA_fifo_rd_B1;
    input DMA_fifo_rd_B2;
    input [31:0] DMA_merge_fifo_wr_dat_A1;
    input [31:0] DMA_merge_fifo_wr_dat_A2;
    input [31:0] DMA_merge_fifo_wr_dat_B1;
    input [31:0] DMA_merge_fifo_wr_dat_B2;
    input DMA_merge_fifo_wr_en_A1;
    input DMA_merge_fifo_wr_en_A2;
    input DMA_merge_fifo_wr_en_B1;
    input DMA_merge_fifo_wr_en_B2;
    input down_fifo_rd_A1;
    input down_fifo_rd_A2;
    input down_fifo_rd_B1;
    input down_fifo_rd_B2;
    input [31:0] fifo_data_A1;
    input [31:0] fifo_data_A2;
    input [31:0] fifo_data_B1;
    input [31:0] fifo_data_B2;
    input fifo_data_valid_A1;
    input fifo_data_valid_A2;
    input fifo_data_valid_B1;
    input fifo_data_valid_B2;
    input rst_channel_0;
    input rst_channel_1;
    input rst_channel_2;
    input rst_channel_3;
    input WB_CLK;
    input WB_CLK_2x;
    input WB_RST;
   output [27:0] DMA_fifo_cnt_A1;
   output [27:0] DMA_fifo_cnt_A2;
   output [27:0] DMA_fifo_cnt_B1;
   output [27:0] DMA_fifo_cnt_B2;
   output [31:0] DMA_fifo_dat_A1;
   output [31:0] DMA_fifo_dat_A2;
   output [31:0] DMA_fifo_dat_B1;
   output [31:0] DMA_fifo_dat_B2;
   output DMA_fifo_dat_strobe_A1;
   output DMA_fifo_dat_strobe_A2;
   output DMA_fifo_dat_strobe_B1;
   output DMA_fifo_dat_strobe_B2;
   output DMA_fifo_dat_strobe_current_A1;
   output DMA_fifo_dat_strobe_current_A2;
   output DMA_fifo_dat_strobe_current_B1;
   output DMA_fifo_dat_strobe_current_B2;
   output DMA_merge_fifo_prog_full_A1;
   output DMA_merge_fifo_prog_full_A2;
   output DMA_merge_fifo_prog_full_B1;
   output DMA_merge_fifo_prog_full_B2;
   output down_fifo_almost_empty_A1;
   output down_fifo_almost_empty_A2;
   output down_fifo_almost_empty_B1;
   output down_fifo_almost_empty_B2;
   output down_fifo_empty_A1;
   output down_fifo_empty_A2;
   output down_fifo_empty_B1;
   output down_fifo_empty_B2;
   output down_fifo_prog_empty_A1;
   output down_fifo_prog_empty_A2;
   output down_fifo_prog_empty_B1;
   output down_fifo_prog_empty_B2;
   output [31:0] down_fifo_rdat_A1;
   output [31:0] down_fifo_rdat_A2;
   output [31:0] down_fifo_rdat_B1;
   output [31:0] down_fifo_rdat_B2;
   output [27:0] fifo_length_A1;
   output [27:0] fifo_length_A2;
   output [27:0] fifo_length_B1;
   output [27:0] fifo_length_B2;
   output fifo_prog_full_A1;
   output fifo_prog_full_A2;
   output fifo_prog_full_B1;
   output fifo_prog_full_B2;
   
   wire rst_channel_0_in;
   wire rst_channel_1_in;
   wire rst_channel_2_in;
   wire rst_channel_3_in;
   
   fifo_interface  u_DMA_fifo_A1 (.din(DMA_merge_fifo_wr_dat_A1[31:0]), 
                                 .rd_clk(WB_CLK), 
                                 .rd_en(DMA_fifo_rd_A1), 
                                 .rst(rst_channel_0_in), 
                                 .wr_clk(WB_CLK_2x), 
                                 .wr_en(DMA_merge_fifo_wr_en_A1), 
                                 .almost_empty(), 
                                 .almost_full(), 
                                 .dout(DMA_fifo_dat_A1[31:0]), 
                                 .dout_valid(DMA_fifo_dat_strobe_current_A1), 
                                 .empty(), 
                                 .full(), 
                                 .next_valid(DMA_fifo_dat_strobe_A1), 
                                 .prog_full(DMA_merge_fifo_prog_full_A1), 
                                 .rd_data_count(DMA_fifo_cnt_A1[27:0]));
   fifo_interface  u_DMA_fifo_A2 (.din(DMA_merge_fifo_wr_dat_A2[31:0]), 
                                 .rd_clk(WB_CLK), 
                                 .rd_en(DMA_fifo_rd_A2), 
                                 .rst(rst_channel_1_in), 
                                 .wr_clk(WB_CLK_2x), 
                                 .wr_en(DMA_merge_fifo_wr_en_A2), 
                                 .almost_empty(), 
                                 .almost_full(), 
                                 .dout(DMA_fifo_dat_A2[31:0]), 
                                 .dout_valid(DMA_fifo_dat_strobe_current_A2), 
                                 .empty(), 
                                 .full(), 
                                 .next_valid(DMA_fifo_dat_strobe_A2), 
                                 .prog_full(DMA_merge_fifo_prog_full_A2), 
                                 .rd_data_count(DMA_fifo_cnt_A2[27:0]));
   fifo_interface  u_DMA_fifo_B1 (.din(DMA_merge_fifo_wr_dat_B1[31:0]), 
                                 .rd_clk(WB_CLK), 
                                 .rd_en(DMA_fifo_rd_B1), 
                                 .rst(rst_channel_2_in), 
                                 .wr_clk(WB_CLK_2x), 
                                 .wr_en(DMA_merge_fifo_wr_en_B1), 
                                 .almost_empty(), 
                                 .almost_full(), 
                                 .dout(DMA_fifo_dat_B1[31:0]), 
                                 .dout_valid(DMA_fifo_dat_strobe_current_B1), 
                                 .empty(), 
                                 .full(), 
                                 .next_valid(DMA_fifo_dat_strobe_B1), 
                                 .prog_full(DMA_merge_fifo_prog_full_B1), 
                                 .rd_data_count(DMA_fifo_cnt_B1[27:0]));
   fifo_interface  u_DMA_fifo_B2 (.din(DMA_merge_fifo_wr_dat_B2[31:0]), 
                                 .rd_clk(WB_CLK), 
                                 .rd_en(DMA_fifo_rd_B2), 
                                 .rst(rst_channel_3_in), 
                                 .wr_clk(WB_CLK_2x), 
                                 .wr_en(DMA_merge_fifo_wr_en_B2), 
                                 .almost_empty(), 
                                 .almost_full(), 
                                 .dout(DMA_fifo_dat_B2[31:0]), 
                                 .dout_valid(DMA_fifo_dat_strobe_current_B2), 
                                 .empty(), 
                                 .full(), 
                                 .next_valid(DMA_fifo_dat_strobe_B2), 
                                 .prog_full(DMA_merge_fifo_prog_full_B2), 
                                 .rd_data_count(DMA_fifo_cnt_B2[27:0]));
   DMA_merge_fifo  u_fifo_A1 (.fifo_rd_i(down_fifo_rd_A1), 
                             .fifo_wr_dat_i(fifo_data_A1[31:0]), 
                             .fifo_wr_i(fifo_data_valid_A1), 
                             .rd_clk_i(WB_CLK_2x), 
                             .reset_i(rst_channel_0_in), 
                             .wr_clk_i(WB_CLK), 
                             .fifo_almost_empty(down_fifo_almost_empty_A1), 
                             .fifo_almost_full(), 
                             .fifo_empty(down_fifo_empty_A1), 
                             .fifo_full(), 
                             .fifo_prog_full(fifo_prog_full_A1), 
                             .fifo_rd_dat_o(down_fifo_rdat_A1[31:0]), 
                             .fifo_rd_dat_valid_o(), 
                             .prog_empty(down_fifo_prog_empty_A1), 
                             .rd_data_count(), 
                             .wr_data_count(fifo_length_A1[27:0]));
   DMA_merge_fifo  u_fifo_A2 (.fifo_rd_i(down_fifo_rd_A2), 
                             .fifo_wr_dat_i(fifo_data_A2[31:0]), 
                             .fifo_wr_i(fifo_data_valid_A2), 
                             .rd_clk_i(WB_CLK_2x), 
                             .reset_i(rst_channel_1_in), 
                             .wr_clk_i(WB_CLK), 
                             .fifo_almost_empty(down_fifo_almost_empty_A2), 
                             .fifo_almost_full(), 
                             .fifo_empty(down_fifo_empty_A2), 
                             .fifo_full(), 
                             .fifo_prog_full(fifo_prog_full_A2), 
                             .fifo_rd_dat_o(down_fifo_rdat_A2[31:0]), 
                             .fifo_rd_dat_valid_o(), 
                             .prog_empty(down_fifo_prog_empty_A2), 
                             .rd_data_count(), 
                             .wr_data_count(fifo_length_A2[27:0]));
   DMA_merge_fifo  u_fifo_B1 (.fifo_rd_i(down_fifo_rd_B1), 
                             .fifo_wr_dat_i(fifo_data_B1[31:0]), 
                             .fifo_wr_i(fifo_data_valid_B1), 
                             .rd_clk_i(WB_CLK_2x), 
                             .reset_i(rst_channel_2_in), 
                             .wr_clk_i(WB_CLK), 
                             .fifo_almost_empty(down_fifo_almost_empty_B1), 
                             .fifo_almost_full(), 
                             .fifo_empty(down_fifo_empty_B1), 
                             .fifo_full(), 
                             .fifo_prog_full(fifo_prog_full_B1), 
                             .fifo_rd_dat_o(down_fifo_rdat_B1[31:0]), 
                             .fifo_rd_dat_valid_o(), 
                             .prog_empty(down_fifo_prog_empty_B1), 
                             .rd_data_count(), 
                             .wr_data_count(fifo_length_B1[27:0]));
   DMA_merge_fifo  u_fifo_B2 (.fifo_rd_i(down_fifo_rd_B2), 
                             .fifo_wr_dat_i(fifo_data_B2[31:0]), 
                             .fifo_wr_i(fifo_data_valid_B2), 
                             .rd_clk_i(WB_CLK_2x), 
                             .reset_i(rst_channel_3_in), 
                             .wr_clk_i(WB_CLK), 
                             .fifo_almost_empty(down_fifo_almost_empty_B2), 
                             .fifo_almost_full(), 
                             .fifo_empty(down_fifo_empty_B2), 
                             .fifo_full(), 
                             .fifo_prog_full(fifo_prog_full_B2), 
                             .fifo_rd_dat_o(down_fifo_rdat_B2[31:0]), 
                             .fifo_rd_dat_valid_o(), 
                             .prog_empty(down_fifo_prog_empty_B2), 
                             .rd_data_count(), 
                             .wr_data_count(fifo_length_B2[27:0]));
   OR2  XLXI_5 (.I0(WB_RST), 
               .I1(rst_channel_0), 
               .O(rst_channel_0_in));
   OR2  XLXI_6 (.I0(WB_RST), 
               .I1(rst_channel_1), 
               .O(rst_channel_1_in));
   OR2  XLXI_7 (.I0(WB_RST), 
               .I1(rst_channel_2), 
               .O(rst_channel_2_in));
   OR2  XLXI_8 (.I0(WB_RST), 
               .I1(rst_channel_3), 
               .O(rst_channel_3_in));
endmodule
