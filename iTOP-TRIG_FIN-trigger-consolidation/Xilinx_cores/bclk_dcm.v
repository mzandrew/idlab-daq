////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 13.2
//  \   \         Application : xaw2verilog
//  /   /         Filename : bclk_dcm.v
// /___/   /\     Timestamp : 04/26/2012 15:53:13
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -st /home/zihangao/Work/firmware/TOP_trigger/src/working/Xilinx_cores/./bclk_dcm.xaw /home/zihangao/Work/firmware/TOP_trigger/src/working/Xilinx_cores/./bclk_dcm
//Design Name: bclk_dcm
//Device: xc4vfx40-10ff672
//
// Module bclk_dcm
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
`timescale 1ns / 1ps

module bclk_dcm(CLKIN_IN, 
                RST_IN, 
                CLKDV_OUT, 
                CLK0_OUT, 
                CLK2X_OUT, 
                LOCKED_OUT);

    input CLKIN_IN;
    input RST_IN;
   output CLKDV_OUT;
   output CLK0_OUT;
   output CLK2X_OUT;
   output LOCKED_OUT;
   
   wire CLKDV_BUF;
   wire CLKFB_IN;
   wire CLK0_BUF;
   wire CLK2X_BUF;
   wire GND_BIT;
   wire [6:0] GND_BUS_7;
   wire [15:0] GND_BUS_16;
   
   assign GND_BIT = 0;
   assign GND_BUS_7 = 7'b0000000;
   assign GND_BUS_16 = 16'b0000000000000000;
   assign CLK0_OUT = CLKFB_IN;
   BUFG  CLKDV_BUFG_INST (.I(CLKDV_BUF), 
                         .O(CLKDV_OUT));
   BUFG  CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   BUFG  CLK2X_BUFG_INST (.I(CLK2X_BUF), 
                         .O(CLK2X_OUT));
   DCM_ADV #( .CLK_FEEDBACK("1X"), .CLKDV_DIVIDE(2.0), .CLKFX_DIVIDE(1), 
         .CLKFX_MULTIPLY(4), .CLKIN_DIVIDE_BY_2("FALSE"), .CLKIN_PERIOD(6.667), 
         .CLKOUT_PHASE_SHIFT("NONE"), .DCM_AUTOCALIBRATION("TRUE"), 
         .DCM_PERFORMANCE_MODE("MAX_SPEED"), 
         .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), .DFS_FREQUENCY_MODE("LOW"), 
         .DLL_FREQUENCY_MODE("LOW"), .DUTY_CYCLE_CORRECTION("TRUE"), 
         .FACTORY_JF(16'hF0F0), .PHASE_SHIFT(0), .STARTUP_WAIT("FALSE") ) 
         DCM_ADV_INST (.CLKFB(CLKFB_IN), 
                         .CLKIN(CLKIN_IN), 
                         .DADDR(GND_BUS_7[6:0]), 
                         .DCLK(GND_BIT), 
                         .DEN(GND_BIT), 
                         .DI(GND_BUS_16[15:0]), 
                         .DWE(GND_BIT), 
                         .PSCLK(GND_BIT), 
                         .PSEN(GND_BIT), 
                         .PSINCDEC(GND_BIT), 
                         .RST(RST_IN), 
                         .CLKDV(CLKDV_BUF), 
                         .CLKFX(), 
                         .CLKFX180(), 
                         .CLK0(CLK0_BUF), 
                         .CLK2X(CLK2X_BUF), 
                         .CLK2X180(), 
                         .CLK90(), 
                         .CLK180(), 
                         .CLK270(), 
                         .DO(), 
                         .DRDY(), 
                         .LOCKED(LOCKED_OUT), 
                         .PSDONE());
endmodule
