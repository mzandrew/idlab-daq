////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.61xd
//  \   \         Application: netgen
//  /   /         Filename: shift_ram_32x10.v
// /___/   /\     Timestamp: Fri Apr 13 21:02:43 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/zihangao/Work/firmware/TOP_trigger/src/working/Xilinx_cores/tmp/_cg/shift_ram_32x10.ngc /home/zihangao/Work/firmware/TOP_trigger/src/working/Xilinx_cores/tmp/_cg/shift_ram_32x10.v 
// Device	: 4vfx40ff672-10
// Input file	: /home/zihangao/Work/firmware/TOP_trigger/src/working/Xilinx_cores/tmp/_cg/shift_ram_32x10.ngc
// Output file	: /home/zihangao/Work/firmware/TOP_trigger/src/working/Xilinx_cores/tmp/_cg/shift_ram_32x10.v
// # of Modules	: 1
// Design Name	: shift_ram_32x10
// Xilinx        : /opt/Xilinx/13.2/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module shift_ram_32x10 (
  clk, sclr, q, d
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input sclr;
  output [31 : 0] q;
  input [31 : 0] d;
  
  // synthesis translate_off
  
  wire \U0/i_synth/i_bb_inst/srl_sig_8_9_131 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_8_130 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_7_129 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_6_128 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_5_127 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_4_126 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_31_125 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_30_124 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_3_123 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_29_122 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_28_121 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_27_120 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_26_119 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_25_118 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_24_117 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_23_116 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_22_115 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_21_114 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_20_113 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_2_112 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_19_111 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_18_110 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_17_109 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_16_108 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_15_107 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_14_106 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_13_105 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_12_104 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_11_103 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_10_102 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_1_101 ;
  wire \U0/i_synth/i_bb_inst/srl_sig_8_0_100 ;
  wire \U0/i_synth/i_bb_inst/N1 ;
  wire \U0/i_synth/i_bb_inst/N0 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_9_31 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_8_30 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_7_29 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_6_28 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_5_27 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_4_26 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_31_25 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_30_24 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_3_23 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_29_22 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_28_21 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_27_20 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_26_19 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_25_18 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_24_17 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_23_16 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_22_15 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_21_14 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_20_13 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_2_12 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_19_11 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_18_10 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_17_9 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_16_8 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_15_7 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_14_6 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_13_5 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_12_4 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_11_3 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_10_2 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_1_1 ;
  wire \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_0_0 ;
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_31  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_31_25 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_31_125 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_31  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[31]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_31_25 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_30  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_30_24 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_30_124 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_30  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[30]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_30_24 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_29  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_29_22 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_29_122 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_29  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[29]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_29_22 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_28  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_28_21 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_28_121 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_28  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[28]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_28_21 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_27  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_27_20 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_27_120 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_27  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[27]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_27_20 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_26  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_26_19 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_26_119 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_26  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[26]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_26_19 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_25  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_25_18 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_25_118 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_25  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[25]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_25_18 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_24  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_24_17 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_24_117 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_24  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[24]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_24_17 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_23  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_23_16 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_23_116 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_23  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[23]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_23_16 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_22  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_22_15 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_22_115 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_22  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[22]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_22_15 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_21  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_21_14 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_21_114 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_21  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[21]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_21_14 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_20  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_20_13 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_20_113 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_20  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[20]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_20_13 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_19  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_19_11 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_19_111 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_19  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[19]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_19_11 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_18  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_18_10 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_18_110 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_18  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[18]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_18_10 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_17  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_17_9 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_17_109 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_17  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[17]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_17_9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_16  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_16_8 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_16_108 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_16  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[16]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_16_8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_15  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_15_7 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_15_107 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_15  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[15]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_15_7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_14  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_14_6 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_14_106 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_14  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[14]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_14_6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_13  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_13_5 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_13_105 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_13  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[13]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_13_5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_12  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_12_4 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_12_104 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_12  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[12]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_12_4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_11  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_11_3 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_11_103 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_11  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[11]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_11_3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_10  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_10_2 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_10_102 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_10  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[10]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_10_2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_9  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_9_31 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_9_131 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_9  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[9]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_9_31 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_8  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_8_30 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_8_130 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_8  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[8]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_8_30 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_7  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_7_29 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_7_129 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_7  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[7]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_7_29 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_6  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_6_28 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_6_128 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_6  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[6]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_6_28 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_5  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_5_27 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_5_127 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_5  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[5]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_5_27 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_4  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_4_26 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_4_126 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_4  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[4]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_4_26 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_3  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_3_23 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_3_123 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_3  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[3]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_3_23 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_2  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_2_12 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_2_112 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_2  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[2]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_2_12 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_1  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_1_1 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_1_101 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_1  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[1]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_1_1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/srl_sig_8_0  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_0_0 ),
    .Q(\U0/i_synth/i_bb_inst/srl_sig_8_0_100 )
  );
  SRL16 #(
    .INIT ( 16'h0000 ))
  \U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_0  (
    .A0(\U0/i_synth/i_bb_inst/N1 ),
    .A1(\U0/i_synth/i_bb_inst/N1 ),
    .A2(\U0/i_synth/i_bb_inst/N1 ),
    .A3(\U0/i_synth/i_bb_inst/N0 ),
    .CLK(clk),
    .D(d[0]),
    .Q(\U0/i_synth/i_bb_inst/Mshreg_srl_sig_8_0_0 )
  );
  VCC   \U0/i_synth/i_bb_inst/XST_VCC  (
    .P(\U0/i_synth/i_bb_inst/N1 )
  );
  GND   \U0/i_synth/i_bb_inst/XST_GND  (
    .G(\U0/i_synth/i_bb_inst/N0 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_32  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_31_125 ),
    .R(sclr),
    .Q(q[31])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_31  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_30_124 ),
    .R(sclr),
    .Q(q[30])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_30  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_29_122 ),
    .R(sclr),
    .Q(q[29])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_29  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_28_121 ),
    .R(sclr),
    .Q(q[28])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_28  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_27_120 ),
    .R(sclr),
    .Q(q[27])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_27  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_26_119 ),
    .R(sclr),
    .Q(q[26])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_26  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_25_118 ),
    .R(sclr),
    .Q(q[25])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_25  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_24_117 ),
    .R(sclr),
    .Q(q[24])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_24  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_23_116 ),
    .R(sclr),
    .Q(q[23])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_23  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_22_115 ),
    .R(sclr),
    .Q(q[22])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_22  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_21_114 ),
    .R(sclr),
    .Q(q[21])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_21  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_20_113 ),
    .R(sclr),
    .Q(q[20])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_20  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_19_111 ),
    .R(sclr),
    .Q(q[19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_19  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_18_110 ),
    .R(sclr),
    .Q(q[18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_18  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_17_109 ),
    .R(sclr),
    .Q(q[17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_17  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_16_108 ),
    .R(sclr),
    .Q(q[16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_16  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_15_107 ),
    .R(sclr),
    .Q(q[15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_15  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_14_106 ),
    .R(sclr),
    .Q(q[14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_14  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_13_105 ),
    .R(sclr),
    .Q(q[13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_13  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_12_104 ),
    .R(sclr),
    .Q(q[12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_12  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_11_103 ),
    .R(sclr),
    .Q(q[11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_11  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_10_102 ),
    .R(sclr),
    .Q(q[10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_10  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_9_131 ),
    .R(sclr),
    .Q(q[9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_9  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_8_130 ),
    .R(sclr),
    .Q(q[8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_8  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_7_129 ),
    .R(sclr),
    .Q(q[7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_7  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_6_128 ),
    .R(sclr),
    .Q(q[6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_6  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_5_127 ),
    .R(sclr),
    .Q(q[5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_5  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_4_126 ),
    .R(sclr),
    .Q(q[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_4  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_3_123 ),
    .R(sclr),
    .Q(q[3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_3  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_2_112 ),
    .R(sclr),
    .Q(q[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_2  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_1_101 ),
    .R(sclr),
    .Q(q[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/i_synth/i_bb_inst/gen_output_regs.output_regs/fd/output_1  (
    .C(clk),
    .D(\U0/i_synth/i_bb_inst/srl_sig_8_0_100 ),
    .R(sclr),
    .Q(q[0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
