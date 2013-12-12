///////////////////////////////////////////////////////////////////////////////
//
// Project:  Aurora Module Generator version 3.1
//
//    Date:  $Date: 2009/09/08 16:23:47 $
//     Tag:  $Name: i+O-61x+189894 $
//    File:  $RCSfile: aurora_example_v4.ejava,v $
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
//  AURORA_SAMPLE
//
//  Aurora Generator
//
//
//  Description: Sample Instantiation of a 1 4-byte lane module.
//               Only tests initialization in hardware.
//
//  Note:  This example design is intended for use on a Xilinx ML421
//         prototyping Board which contains an XC4VFX60 part.  Aurora
//         configurations that are too large to fit within this part
//         cannot use this example design as is.  If you wish to use
//         this design with larger configurations of Aurora or with
//         a custom board, you must modify this source file and the
//         aurora_example.ucf file as needed.
//         

`timescale 1 ns / 1 ps

module aurora_aurora_example #
(
    parameter       USE_CHIPSCOPE = 1,
    parameter       SIMULATION_P = 0,         // Set to 1 for simulation
    parameter       EXTEND_WATCHDOGS = 0,
 
    parameter       LANE0_GT11_MODE_P = "B",        // Based on MGT Location
    parameter       LANE0_MGT_ID_P = 1,
    parameter       aurora_UNUSED_MGT0_GT11_MODE_P = "A",
    parameter       aurora_UNUSED_MGT0_MGT_ID_P    = 0,
    parameter       RXPMACLKSEL0_PARAM      = "REFCLK1",
    parameter       TXABPMACLKSEL0_PARAM    = "REFCLK1",
    parameter       TXPOST_TAP_PD_P     = "FALSE"    // Default is false, set to FALSE for serial loopback or tuned preemphasis
)
(
    // User IO
    RESET,
    HARD_ERROR,
    SOFT_ERROR,
    ERROR_COUNT,
    LANE_UP,
    CHANNEL_UP,
    INIT_CLK,
    PMA_INIT,
    RX_SIGNAL_DETECT,
    RESET_CALBLOCKS,


    REF_CLK1_LEFT_P,
    REF_CLK1_LEFT_N,


    // MGT I/O
    RXP,
    RXN,
    TXP,
    TXN

);


//********************************Parameter Declarations*****************************
    
//***********************************Port Declarations*******************************

    // User I/O
    input              RESET;
    input              INIT_CLK;
    input              PMA_INIT;
    input              RESET_CALBLOCKS;
    input              RX_SIGNAL_DETECT;

    output             HARD_ERROR;
    output             SOFT_ERROR;
    output  [0:7]      ERROR_COUNT;
    output             LANE_UP;
    output             CHANNEL_UP;
    


    // Clocks
    input              REF_CLK1_LEFT_P;
    input              REF_CLK1_LEFT_N;



    // MGT I/O
    input              RXP;
    input              RXN;

    output             TXP;
    output             TXN;


//**************************External Register Declarations****************************

    reg                HARD_ERROR;
    reg                SOFT_ERROR;
    reg                FRAME_ERROR;
    reg     [0:7]      ERROR_COUNT;    
    reg                LANE_UP;
    reg                CHANNEL_UP;


//**************************Internal Register Declarations****************************

    reg     [0:3]      reset_debounce_r;
    reg     [0:3]      debounce_pma_init_r;
    reg                reset_calblocks_r;
    reg                rx_signal_detect_r;


//********************************Wire Declarations**********************************
    wire               lane_up_i_i;
    wire    [41:0]     ila_data_i;
    wire    [35:0]     icon_ila_i;
    // Stream TX Interface
    wire    [0:31]     tx_d_i;
    wire               tx_src_rdy_n_i;

    wire               tx_dst_rdy_n_i;


    // Stream RX Interface
    wire    [0:31]     rx_d_i;
    wire               rx_src_rdy_n_i;






    // MGT Reference Clock Interface
    
    wire               ref_clk1_left_i;
    wire               ref_clk2_left_i;



    // Error Detection Interface
    wire               hard_error_i;
    wire               soft_error_i;


    // Status
    wire               channel_up_i;
    wire               lane_up_i;


    // Clock Compensation Control Interface
    wire               warn_cc_i;
    wire               do_cc_i;


    // System Interface
    wire               dcm_not_locked_i;
    wire               user_clk_i;
    wire               reset_i;
    wire               power_down_i;
    wire    [0:1]      loopback_i;
    wire               tx_out_clk_i;
    wire               init_clk_i;
    wire               pma_init_r; 


    //Frame check signals
    wire    [0:7]      error_count_i;
    wire               test_reset_i;

    
    //Ports for simulation
   
    wire    [15:0]     mgt0_combusout_i;
    wire    [15:0]     mgt1_combusout_i;
    

    
    //Tie offs
    wire               tied_to_ground_i;
    wire    [15:0]     tied_to_ground_vec_i;
    wire               tied_to_vcc_i;
    wire    [15:0]     tied_to_vcc_vec_i;
    
    


//*********************************Main Body of Code**********************************



    // Bufg used to drive user clk on global clock net.
    BUFG  user_clock_bufg_i
    (
        .I(tx_out_clk_i),
        .O(user_clk_i)
    );


    //_______________________________Clock Buffers_________________________________


    GT11CLK_MGT GT11CLK_MGT_LEFT 
    (
        .MGTCLKN(REF_CLK1_LEFT_N), 
        .MGTCLKP(REF_CLK1_LEFT_P), 
        .SYNCLK1OUT(ref_clk1_left_i), 
        .SYNCLK2OUT(ref_clk2_left_i)
    );
                                 
   
   defparam GT11CLK_MGT_LEFT.SYNCLK1OUTEN = "ENABLE";
   defparam GT11CLK_MGT_LEFT.SYNCLK2OUTEN = "DISABLE";



    

    //____________________________Register User I/O___________________________________

    // Register User Outputs from core.
    always @(posedge user_clk_i)
    begin
        HARD_ERROR      <=  hard_error_i;
        SOFT_ERROR      <=  soft_error_i;
        ERROR_COUNT     <=  error_count_i;
        LANE_UP         <=  lane_up_i;
        CHANNEL_UP      <=  channel_up_i;
    end



    //____________________________Tie off unused signals_______________________________







    // System Interface
    assign  dcm_not_locked_i    =   1'b0;
    assign  power_down_i        =   1'b0;
    assign  loopback_i          =   2'b00;


    //_______________________________ Tie Offs __________________________________
    
    assign  tied_to_ground_i        =    1'b0;
    assign  tied_to_ground_vec_i    =    16'h0000;
    assign  tied_to_vcc_i           =    1'b1;
    assign  tied_to_vcc_vec_i       =    16'hffff;
    
    //_____________________________Debounce the Reset and PMA init signal___________________________


    // Simple Debouncer for Reset button. The debouncer has an
    // asynchronous reset tied to PMA_INIT. This is primarily for simulation, to ensure
    // that unknown values are not driven into the reset line
    always @(posedge user_clk_i or posedge pma_init_r)
        if(pma_init_r)
            reset_debounce_r    <=  4'b1111;
        else
            reset_debounce_r    <=  {RESET,reset_debounce_r[0:2]};


    assign  reset_i =   &reset_debounce_r;

        
    // Assign an IBUFG to INIT_CLK
    IBUFG init_clk_ibufg_i
    (
        .I(INIT_CLK),
        .O(init_clk_i)
    );


    // Debounce the PMA_INIT signal using the INIT_CLK
    always @(posedge init_clk_i)
        debounce_pma_init_r <=  {PMA_INIT,debounce_pma_init_r[0:2]};
        
    assign  pma_init_r  =   &debounce_pma_init_r;
    
    
    
    //Register the calblock control signals
    always @(posedge init_clk_i)
    begin
        reset_calblocks_r   <=  RESET_CALBLOCKS;
        rx_signal_detect_r  <=  RX_SIGNAL_DETECT;
    end


    //___________________________Module Instantiations_________________________________



    defparam aurora_aurora_module_i.LANE0_GT11_MODE_P = LANE0_GT11_MODE_P;        // Based on MGT Location
    defparam aurora_aurora_module_i.LANE0_MGT_ID_P    = LANE0_MGT_ID_P;
    defparam aurora_aurora_module_i.EXTEND_WATCHDOGS  = EXTEND_WATCHDOGS;
    defparam aurora_aurora_module_i.SIMULATION_P      = SIMULATION_P;      // Set to 1 for simulation
    defparam aurora_aurora_module_i.TXPOST_TAP_PD_P   = TXPOST_TAP_PD_P;   // Default is false, set to FALSE for serial loopback or tuned preemphasis
    aurora aurora_aurora_module_i
    (
        // TX Stream Interface
        .TX_D(tx_d_i),
        .TX_SRC_RDY_N(tx_src_rdy_n_i),

        .TX_DST_RDY_N(tx_dst_rdy_n_i),


        // LocalLink RX Interface
        .RX_D(rx_d_i),
        .RX_SRC_RDY_N(rx_src_rdy_n_i),
        
    
    
    
    
        //MGT Serial I/O
        .RXP(RXP),
        .RXN(RXN),
    
        .TXP(TXP),
        .TXN(TXN),
    
    
        //MGT Reference Clock Interface
        .REF_CLK1_LEFT(ref_clk1_left_i),
    
    
        //Error Detection Interface
        .HARD_ERROR(hard_error_i),
        .SOFT_ERROR(soft_error_i),
        
    
    
        //Status
        .CHANNEL_UP(channel_up_i),
        .LANE_UP(lane_up_i),
    
   
        //Clock Compensation Control Interface
        .WARN_CC(warn_cc_i),
        .DO_CC(do_cc_i),
        
        //Calibration Block Interface
        .CALBLOCK_ACTIVE(),       
        .RESET_CALBLOCKS(reset_calblocks_r),
        .RX_SIGNAL_DETECT(rx_signal_detect_r),
        .DCLK(init_clk_i),

        //Ports for simulation
        .MGT0_COMBUSIN(mgt1_combusout_i),
        .MGT0_COMBUSOUT(mgt0_combusout_i),
        
    
    
        //System Interface
        .DCM_NOT_LOCKED(dcm_not_locked_i),
        .USER_CLK(user_clk_i),
        
        .RESET(reset_i),
        .POWER_DOWN(power_down_i),    
        .LOOPBACK(loopback_i),
        .PMA_INIT(pma_init_r),
        
        .TX_OUT_CLK(tx_out_clk_i)
    
    );



    defparam aurora_unused_mgt_0_i.GT11_MODE_P = aurora_UNUSED_MGT0_GT11_MODE_P;        //Based on MGT Location
    defparam aurora_unused_mgt_0_i.MGT_ID_P = aurora_UNUSED_MGT0_MGT_ID_P;  
    defparam aurora_unused_mgt_0_i.RXPMACLKSEL_PARAM = RXPMACLKSEL0_PARAM;
    defparam aurora_unused_mgt_0_i.TXABPMACLKSEL_PARAM = TXABPMACLKSEL0_PARAM;
    aurora_UNUSED_MGT aurora_unused_mgt_0_i
    ( 

        //------------------------ Calibration Block Ports -------------------------
        .MGT0_ACTIVE_OUT(),
        .MGT0_DRP_RESET_IN(reset_calblocks_r),
        .MGT0_RX_SIGNAL_DETECT_IN(tied_to_vcc_i),
        .MGT0_TX_SIGNAL_DETECT_IN(tied_to_vcc_i),
        //------------------- Dynamic Reconfiguration Port (DRP) -------------------
        .MGT0_DCLK_IN(init_clk_i),
        //-------------------------------- PLL Lock --------------------------------
        .MGT0_RXLOCK_OUT(),                                                 //Unused       
        .MGT0_TXLOCK_OUT(),                                                 //Unused
        //-------------------------- Ports for Simulation --------------------------
        .MGT0_COMBUSIN_IN(mgt0_combusout_i),
        .MGT0_COMBUSOUT_OUT(mgt1_combusout_i),
        //---------------------------- Reference Clocks ----------------------------
        .MGT0_GREFCLK_IN(tied_to_ground_i),
        .MGT0_REFCLK1_IN(ref_clk1_left_i),
        .MGT0_REFCLK2_IN(tied_to_ground_i),        
        //--------------------------------- Resets ---------------------------------
        .MGT0_RXPMARESET_IN(pma_init_r),
        .MGT0_RXRESET_IN(tied_to_ground_i),
        .MGT0_TXPMARESET_IN(pma_init_r),
        .MGT0_TXRESET_IN(tied_to_ground_i),
        //------------------------------ Serial Ports ------------------------------
        .MGT0_RX1N_IN(1'b0),                                    //Unused
        .MGT0_RX1P_IN(1'b0),                                    //Unused
        .MGT0_TX1N_OUT(),                                       //Unused
        .MGT0_TX1P_OUT()                                        //Unused
    );





    aurora_STANDARD_CC_MODULE aurora_standard_cc_module_i
    (
        .RESET(!channel_up_i),
        // Clock Compensation Control Interface
        .WARN_CC(warn_cc_i),
        .DO_CC(do_cc_i),

        // System Interface
        .DCM_NOT_LOCKED(dcm_not_locked_i),
        .USER_CLK(user_clk_i)

    );


    //Use one of the lane up signals to reset the test logic
    assign test_reset_i = !lane_up_i;


    //Connect a frame generator to the TX User interface
    aurora_FRAME_GEN aurora_frame_gen_i
    (
        // User Interface
        .TX_D(tx_d_i),  
        .TX_SRC_RDY_N(tx_src_rdy_n_i),
        .TX_DST_RDY_N(tx_dst_rdy_n_i),

        // System Interface
        .USER_CLK(user_clk_i),       
        .RESET(test_reset_i)
    );

    aurora_FRAME_CHECK aurora_frame_check_i
    (
        // User Interface
        .RX_D(rx_d_i),  
        .RX_SRC_RDY_N(rx_src_rdy_n_i),  

        // System Interface
        .USER_CLK(user_clk_i),       
        .RESET(test_reset_i),
        .ERROR_COUNT(error_count_i)
    );    

generate
if (USE_CHIPSCOPE==1)
begin : chipscope
assign lane_up_i_i = &lane_up_i;
assign ila_data_i = {tx_d_i[0:15],rx_d_i[0:15],error_count_i,lane_up_i_i,channel_up_i};

//-----------------------------------------------------------------
//  ILA core instance
//-----------------------------------------------------------------
  v4_ila i_ila
    (
      .control(icon_ila_i),
      .clk(user_clk_i),
      .trig0(ila_data_i)
    );

//-----------------------------------------------------------------
//  ICON core instance
//-----------------------------------------------------------------
  v4_icon i_icon
    (
      .control0(icon_ila_i)
    );
end
endgenerate

endmodule

//-------------------------------------------------------------------
//  ILA core module declaration
//-------------------------------------------------------------------
module v4_ila
  (
    control,
    clk,
    trig0
  );
  input [35:0] control;
  input clk;
  input [41:0] trig0;
endmodule

//-------------------------------------------------------------------
//  ICON core module declaration
//-------------------------------------------------------------------
module v4_icon
  (
      control0
  );
  output [35:0] control0;
endmodule
