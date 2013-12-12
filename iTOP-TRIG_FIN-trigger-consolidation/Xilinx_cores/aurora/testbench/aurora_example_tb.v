///////////////////////////////////////////////////////////////////////////////
//
// Project:  Aurora Module Generator version 3.1
//
//    Date:  $Date: 2009/09/08 16:23:47 $
//     Tag:  $Name: i+O-61x+189894 $
//    File:  $RCSfile: aurora_example_tb_v4.ejava,v $
//     Rev:  $Revision: 1.3 $
//
// Company:  Xilinx
//
// (c) Copyright 2004 ? 2009 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical Applications"). 
// Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
///////////////////////////////////////////////////////////////////////////////
//
//  SAMPLE_TB
//
//  Aurora Generator
//
//
//
//  Description:  This testbench instantiates 2 Aurora Sample Modules. The serial TX pins from  
//                one module are connected to the RX pins of the other and vice versa. A simple Local-Link
//                frame generator is used to generate packets for the TX data interface while a frame checker
//                module is connected to the RX data interface to check the incoming frames and keep 
//                track of any errors.
//         

`timescale 1 ns / 1 ps

module aurora_SAMPLE_TB;

//*************************Parameter Declarations**************************

    parameter       CLOCKPERIOD_1 = 3.33;
    parameter       CLOCKPERIOD_2 = 3.33;
    parameter       INITCLKPERIOD = 20;     //Default INIT_CLK is 50 Mhz to meet DCLK requirements

  
//************************Internal Register Declarations*****************************

    //Freerunning Clock
    reg                reference_clk_1_n_r;
    reg                reference_clk_2_n_r;
    reg                init_clk_r;

    //Global signals
    reg                gsr_r;
    reg                gts_r;
    reg                reset_i;
    

//********************************Wire Declarations**********************************
    
    //Freerunning Clock         
    wire               reference_clk_1_p_r;
    wire               reference_clk_2_p_r;         

//Dut11

    //Error Detection Interface
    wire               hard_error_1_i;        
    wire               soft_error_1_i;        

    //Status 
    wire               channel_up_1_i;        
    wire               lane_up_1_i;


    //MGT Serial I/O
    wire               rxp_1_i; 
    wire               rxn_1_i; 
    
    wire               txp_1_i; 
    wire               txn_1_i; 

    // Error signals from the Local Link packet checker
    wire    [0:7]      error_count_1_i; 
     
    
    
//Dut12

    //Error Detection Interface
    wire               hard_error_2_i;        
    wire               soft_error_2_i;        

    //Status 
    wire               channel_up_2_i;        
    wire               lane_up_2_i;


    //MGT Serial I/O
    wire               rxp_2_i; 
    wire               rxn_2_i; 
    
    wire               txp_2_i; 
    wire               txn_2_i; 

    // Error signals from the Local Link packet checker
    wire    [0:7]      error_count_2_i; 
     
    
    
    
    //Tie offs
    wire               tied_to_ground_i;
    wire               tied_to_vcc_i;
    wire    [15:0]     tied_to_vcc_vec_i;

//*********************************Main Body of Code**********************************


    //________________________ Tie offs ___________________________________
    
    assign  tied_to_ground_i     =    1'b0;
    assign  tied_to_vcc_i        =    1'b1;
    assign  tied_to_vcc_vec_i    =    16'hffff;
    
    //_________________________MGT Serial Connections________________
   

    assign   rxn_1_i      =    txn_2_i;
    assign   rxp_1_i      =    txp_2_i;
    assign   rxn_2_i      =    txn_1_i;
    assign   rxp_2_i      =    txp_1_i;
    
   
    //__________________________Global Signals_____________________________
    
    //Simultate the global reset that occurs after configuration at the beginning
    //of the simulation. Note that both MGT swift models use the same global signals.
    assign glbl.GSR = gsr_r;
    assign glbl.GTS = gts_r;

    initial
        begin
            gts_r = 1'b0;        
            gsr_r = 1'b1;
            #(50*CLOCKPERIOD_1);
            gsr_r = 1'b0;
    end


    //____________________________Clocks____________________________
    
    initial
        init_clk_r  =   1'b0;
        
    always
        #(INITCLKPERIOD / 2) init_clk_r =   !init_clk_r;
        
    

    initial
        reference_clk_1_n_r = 1'b0;


    always  
        #(CLOCKPERIOD_1 / 2) reference_clk_1_n_r = !reference_clk_1_n_r;

    assign reference_clk_1_p_r = !reference_clk_1_n_r;



    initial
        reference_clk_2_n_r = 1'b0;


    always  
        #(CLOCKPERIOD_2 / 2) reference_clk_2_n_r = !reference_clk_2_n_r;

    assign reference_clk_2_p_r = !reference_clk_2_n_r;



    //____________________________Resets____________________________
    
    initial
    begin
        reset_i = 1'b1;
        #45 reset_i = 1'b0;
    end

    //________________________Instantiate Dut 1 ________________
aurora_aurora_example #
(
.EXTEND_WATCHDOGS(0),
 
.LANE0_GT11_MODE_P("B"),        // Based on MGT Location
.LANE0_MGT_ID_P(1),
.aurora_UNUSED_MGT0_GT11_MODE_P("A"),
.aurora_UNUSED_MGT0_MGT_ID_P(0),
.SIMULATION_P(1)         // Set to 1 for simulation
)
aurora_aurora_example_1_i
(
        // User IO
        .RESET(reset_i),
        // Error signals from Aurora    
        .HARD_ERROR(hard_error_1_i),
        .SOFT_ERROR(soft_error_1_i),

        // Status Signals
        .LANE_UP(lane_up_1_i),
        .CHANNEL_UP(channel_up_1_i),

        .INIT_CLK(init_clk_r),
        .PMA_INIT(gsr_r),
        .RX_SIGNAL_DETECT(tied_to_vcc_i),
        .RESET_CALBLOCKS(gsr_r),

        // Clock Signals
        .REF_CLK1_LEFT_P(reference_clk_1_p_r),
        .REF_CLK1_LEFT_N(reference_clk_1_n_r),

        // MGT I/O
        .RXP(rxp_1_i),
        .RXN(rxn_1_i),

        .TXP(txp_1_i),
        .TXN(txn_1_i),

        // Error signals from the Local Link packet checker
        .ERROR_COUNT(error_count_1_i)

    );

    //________________________Instantiate Dut 2 ________________
aurora_aurora_example #
(
.EXTEND_WATCHDOGS(0),
 
.LANE0_GT11_MODE_P("B"),        // Based on MGT Location
.LANE0_MGT_ID_P(1),
.aurora_UNUSED_MGT0_GT11_MODE_P("A"),
.aurora_UNUSED_MGT0_MGT_ID_P(0),
.SIMULATION_P(1)         // Set to 1 for simulation
)
aurora_aurora_example_2_i
(
        // User IO
        .RESET(reset_i),
        // Error signals from Aurora    
        .HARD_ERROR(hard_error_2_i),
        .SOFT_ERROR(soft_error_2_i),

        // Status Signals
        .LANE_UP(lane_up_2_i),
        .CHANNEL_UP(channel_up_2_i),

        .INIT_CLK(init_clk_r),
        .PMA_INIT(gsr_r),
        .RX_SIGNAL_DETECT(tied_to_vcc_i),
        .RESET_CALBLOCKS(gsr_r),

        // Clock Signals
        .REF_CLK1_LEFT_P(reference_clk_2_p_r),
        .REF_CLK1_LEFT_N(reference_clk_2_n_r),

        // MGT I/O
        .RXP(rxp_2_i),
        .RXN(rxn_2_i),

        .TXP(txp_2_i),
        .TXN(txn_2_i),

        // Error signals from the Local Link packet checker
        .ERROR_COUNT(error_count_2_i)

    );


    always @ (posedge channel_up_1_i or posedge channel_up_2_i)
    begin
      $display("## Time:%t CHANNEL_UP is asserted in both DUT\n",$time);
      #50000
      if(!(error_count_1_i[7] & error_count_2_i[7]))
        $display("## Time:%t Test Pass\n",$time);
      $finish;
    end

endmodule
