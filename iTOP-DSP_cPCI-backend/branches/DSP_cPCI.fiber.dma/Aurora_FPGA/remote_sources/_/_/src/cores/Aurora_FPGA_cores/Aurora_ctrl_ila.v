///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 13.3
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : Aurora_ctrl_ila.v
// /___/   /\     Timestamp  : Wed Mar 07 15:16:46 Hawaiian Standard Time 2012
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module Aurora_ctrl_ila(
    CONTROL,
    CLK,
    TRIG0);


inout [35 : 0] CONTROL;
input CLK;
input [154 : 0] TRIG0;

endmodule
