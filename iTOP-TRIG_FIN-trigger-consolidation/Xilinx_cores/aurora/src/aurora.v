///////////////////////////////////////////////////////////////////////////////
//
// Project:  Aurora Module Generator version 3.1
//
//    Date:  $Date: 2009/09/08 16:23:50 $
//     Tag:  $Name: i+O-61x+189894 $
//    File:  $RCSfile: stream_top_v4_4byte.ejava,v $
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
//  aurora
//
//
//  Description: This is the top level module for a 1 4-byte lane Aurora
//               reference design module with streaming interface. This module supports 
//               the following features:
//
//               * Supports Virtex 4
//


`timescale 1 ns / 1 ps
(* core_generation_info = "aurora,v4fx_aurora_8b10b_v3_1,{c_aurora_lanes=1, c_mgt_clock_1=REF_CLK1, c_mgt_clock_2=None, c_mgt_loc_1=1, c_mgt_loc_10=X, c_mgt_loc_11=X, c_mgt_loc_12=X, c_mgt_loc_13=X, c_mgt_loc_14=X, c_mgt_loc_15=X, c_mgt_loc_16=X, c_mgt_loc_17=X, c_mgt_loc_18=X, c_mgt_loc_19=X, c_mgt_loc_2=X, c_mgt_loc_20=X, c_mgt_loc_21=X, c_mgt_loc_22=X, c_mgt_loc_23=X, c_mgt_loc_24=X, c_mgt_loc_3=X, c_mgt_loc_4=X, c_mgt_loc_5=X, c_mgt_loc_6=X, c_mgt_loc_7=X, c_mgt_loc_8=X, c_mgt_loc_9=X, c_lane_width=4, c_line_rate=3.0, c_nfc=false, c_nfc_mode=IMM, c_refclk_frequency=300.0, c_simplex=false, c_simplex_mode=TX, c_stream=true, c_ufc=false, c_simplex_timer=false,}" *)

module aurora
(
    // TX Stream Interface
    TX_D,
    TX_SRC_RDY_N,
    TX_DST_RDY_N,

    // RX Stream Interface
    RX_D,
    RX_SRC_RDY_N,

    //Clock Correction Interface
    DO_CC,
    WARN_CC,

    //MGT Serial I/O
    RXP,
    RXN,
    TXP,
    TXN,

    //MGT Reference Clock Interface
    REF_CLK1_LEFT,

    //Error Detection Interface
    HARD_ERROR,
    SOFT_ERROR,

    //Status
    CHANNEL_UP,
    LANE_UP,
    
    //Calibration Block Interface
    CALBLOCK_ACTIVE,
    RESET_CALBLOCKS,
    RX_SIGNAL_DETECT,
    DCLK,

    //Ports for simulation
    MGT0_COMBUSIN,
    MGT0_COMBUSOUT,
    

    //System Interface
    DCM_NOT_LOCKED,
    USER_CLK,
    RESET,
    POWER_DOWN,
    LOOPBACK,
    PMA_INIT,
    TX_OUT_CLK
);

`define DLY #1

// synthesis attribute X_CORE_INFO of aurora is "v4fx_aurora_8b10b_v3_1, Coregen v11.1_ip1, Number of lanes = 1, Line rate is 3.0Gbps with reference clock of 300.0,Lane width of 4bytes, Interface is streaming and is operating in DUPLEX configuration";
//*******************************Parameter Declarations******************************

    parameter   EXTEND_WATCHDOGS    =   0;
    parameter   SIMULATION_P        =   0;
    
 
    parameter   LANE0_GT11_MODE_P = "B";        // Based on MGT Location
    parameter   LANE0_MGT_ID_P = 1;
    parameter   TXPOST_TAP_PD_P  =   "FALSE";    // Default is false, set to FALSE for serial loopback or tuned preemphasis
    
    
//***********************************Port Declarations*******************************


    // TX Stream Interface
    input   [0:31]     TX_D;
    input              TX_SRC_RDY_N;
    output             TX_DST_RDY_N;


    // RX Stream Interface
    output  [0:31]     RX_D;
    output             RX_SRC_RDY_N;


    // Clock Correction Interface
    input              DO_CC;
    input              WARN_CC;
    
    
    //MGT Serial I/O
    input              RXP;
    input              RXN;
    output             TXP;
    output             TXN;


    //MGT Reference Clock Interface
    input              REF_CLK1_LEFT;


    //Error Detection Interface
    output             HARD_ERROR;
    output             SOFT_ERROR;


    //Status
    output             CHANNEL_UP;
    output             LANE_UP;


    //Calibration Block Interface
    output             CALBLOCK_ACTIVE;
    input              RESET_CALBLOCKS;
    input              RX_SIGNAL_DETECT;
    input              DCLK;  
    
    //Ports for simulation
    input   [15:0]     MGT0_COMBUSIN;
    output  [15:0]     MGT0_COMBUSOUT;

    //System Interface
    input              DCM_NOT_LOCKED;
    input              USER_CLK;
    input              RESET;
    input              POWER_DOWN;
    input   [1:0]      LOOPBACK;
    input              PMA_INIT;
    output             TX_OUT_CLK;


//*********************************Wire Declarations**********************************

    wire               ch_bond_done_i;
    wire    [4:0]      rx_status_float_i;    
    wire               channel_up_i;
    wire               en_chan_sync_i;
    wire               ena_comma_align_i;
    wire               gen_a_i;
    wire               gen_cc_i;
    wire               gen_ecp_i;
    wire    [0:1]      gen_ecp_striped_i;
    wire    [0:3]      gen_k_i;
    wire    [0:1]      gen_pad_i;
    wire    [0:1]      gen_pad_striped_i;
    wire    [0:3]      gen_r_i;
    wire               gen_scp_i;
    wire    [0:1]      gen_scp_striped_i;
    wire    [0:3]      gen_v_i;
    wire    [0:3]      got_a_i;
    wire               got_v_i;
    wire               hard_error_i;
    wire               lane_up_i;
    wire               pma_rx_lock_i;
    wire               raw_tx_out_clk_i;
    wire               reset_lanes_i;
    wire               rx_buf_err_i;
    wire    [3:0]      rx_char_is_comma_i;
    wire    [3:0]      rx_char_is_k_i;
    wire    [2:0]      rx_clk_cor_cnt_i;
    wire    [31:0]     rx_data_i;
    wire    [3:0]      rx_disp_err_i;
    wire    [0:1]      rx_ecp_i;
    wire    [0:1]      rx_ecp_striped_i;
    wire    [3:0]      rx_not_in_table_i;
    wire    [0:1]      rx_pad_i;
    wire    [0:1]      rx_pad_striped_i;
    wire    [0:31]     rx_pe_data_i;
    wire    [0:31]     rx_pe_data_striped_i;
    wire    [0:1]      rx_pe_data_v_i;
    wire    [0:1]      rx_pe_data_v_striped_i;
    wire               rx_polarity_i;
    wire               rx_realign_i;
    wire               rx_reset_i;
    wire    [0:1]      rx_scp_i;
    wire    [0:1]      rx_scp_striped_i;
    wire    [0:1]      soft_error_i;
    wire               all_soft_error_i;
    wire               start_rx_i;
    wire               system_reset_c;
    wire               tied_to_ground_i;
    wire    [31:0]     tied_to_ground_vec_i;
    wire               tied_to_vcc_i;
    wire               tx_buf_err_i;
    wire    [3:0]      tx_char_is_k_i;
    wire    [31:0]     tx_data_i;
    wire               tx_lock_i;
    wire               tx_out_clk_i;
    wire    [0:31]     tx_pe_data_i;
    wire    [0:31]     tx_pe_data_striped_i;
    wire    [0:1]      tx_pe_data_v_i;
    wire    [0:1]      tx_pe_data_v_striped_i;
    wire               tx_reset_i;
    wire    txpma_ready_0_i;
    wire    rxpma_ready_0_i;
    wire               dcm_is_locked_i;


//*********************************Main Body of Code**********************************



    //Tie off top level constants
    assign          tied_to_ground_vec_i    = 32'd0;
    assign          tied_to_ground_i        = 1'b0;
    assign          tied_to_vcc_i           = 1'b1;

    assign          all_soft_error_i        = soft_error_i[0] | soft_error_i[1];
    
    //Connect top level logic
    assign          CHANNEL_UP  =   channel_up_i;
    assign          system_reset_c = RESET || DCM_NOT_LOCKED || !tx_lock_i;



    //Connect the TXOUTCLK of lane 0 to TX_OUT_CLK
    assign  TX_OUT_CLK  =   raw_tx_out_clk_i;
    

    //dcm_is_locked_i is added to trigger the gt11_init blocks for PMA RESET
    assign  dcm_is_locked_i  = ! DCM_NOT_LOCKED;


    //_________________________Instantiate Lane 0______________________________




    assign          LANE_UP =   lane_up_i;

    //Aurora lane striping rules require each 4-byte lane to carry 2 bytes from the first 
    //half of the overall word, and 2 bytes from the second half. This ensures that the 
    //data will be ordered correctly if it is send to a 2-byte lane. Here we perform the 
    //required concatenation
    
    assign  gen_scp_striped_i       =   {gen_scp_i,1'b0};
    assign  gen_ecp_striped_i       =   {1'b0,gen_ecp_i};
    assign  gen_pad_striped_i[0:1]  =  {gen_pad_i[0],gen_pad_i[1]};
    assign  tx_pe_data_striped_i[0:31]   =   {tx_pe_data_i[0:15],tx_pe_data_i[16:31]};
    assign  tx_pe_data_v_striped_i[0:1]  =   {tx_pe_data_v_i[0],tx_pe_data_v_i[1]};
    assign  {rx_pad_i[0],rx_pad_i[1]}    =   rx_pad_striped_i[0:1];
    assign  {rx_pe_data_i[0:15],rx_pe_data_i[16:31]}   =   rx_pe_data_striped_i[0:31];
    assign  {rx_pe_data_v_i[0],rx_pe_data_v_i[1]}  = rx_pe_data_v_striped_i[0:1];
    assign  {rx_scp_i[0],rx_scp_i[1]}  =   rx_scp_striped_i[0:1];
    assign  {rx_ecp_i[0],rx_ecp_i[1]}  =   rx_ecp_striped_i[0:1];
    
    
    



    defparam aurora_aurora_lane_4byte_0_i.EXTEND_WATCHDOGS = EXTEND_WATCHDOGS;
    aurora_AURORA_LANE_4BYTE aurora_aurora_lane_4byte_0_i
    (
        //MGT Interface
        .RX_DATA(rx_data_i[31:0]),
        .RX_NOT_IN_TABLE(rx_not_in_table_i[3:0]),
        .RX_DISP_ERR(rx_disp_err_i[3:0]),
        .RX_CHAR_IS_K(rx_char_is_k_i[3:0]),
        .RX_CHAR_IS_COMMA(rx_char_is_comma_i[3:0]),
        .RX_STATUS(tied_to_ground_vec_i[5:0]),
        .TX_BUF_ERR(tx_buf_err_i),
        .RX_BUF_ERR(rx_buf_err_i),
        .RX_REALIGN(rx_realign_i),
        .PMA_RX_LOCK(pma_rx_lock_i),
        .RX_POLARITY(rx_polarity_i),
        .RX_RESET(rx_reset_i),
        .TX_CHAR_IS_K(tx_char_is_k_i[3:0]),
        .TX_DATA(tx_data_i[31:0]),
        .TX_RESET(tx_reset_i),
        
        
        //Comma Detect Phase Align Interface
        .ENA_COMMA_ALIGN(ena_comma_align_i),


        //TX_LL Interface
        .GEN_SCP(gen_scp_striped_i),
        .GEN_ECP(gen_ecp_striped_i),
        .GEN_PAD(gen_pad_striped_i[0:1]),
        .TX_PE_DATA(tx_pe_data_striped_i[0:31]),
        .TX_PE_DATA_V(tx_pe_data_v_striped_i[0:1]),
        .GEN_CC(gen_cc_i),


        //RX_LL Interface
        .RX_PAD(rx_pad_striped_i[0:1]),
        .RX_PE_DATA(rx_pe_data_striped_i[0:31]),
        .RX_PE_DATA_V(rx_pe_data_v_striped_i[0:1]),
        .RX_SCP(rx_scp_striped_i[0:1]),
        .RX_ECP(rx_ecp_striped_i[0:1]),


        //Global Logic Interface
        .GEN_A(gen_a_i),
        .GEN_K(gen_k_i[0:3]),
        .GEN_R(gen_r_i[0:3]),
        .GEN_V(gen_v_i[0:3]),
        .LANE_UP(lane_up_i),
        .TXPMA_READY_IN(txpma_ready_0_i),
        .RXPMA_READY_IN(rxpma_ready_0_i),
        .SOFT_ERROR(soft_error_i[0:1]),
        .HARD_ERROR(hard_error_i),
        .CHANNEL_BOND_LOAD(),
        .GOT_A(got_a_i[0:3]),
        .GOT_V(got_v_i),


        //System Interface
        .USER_CLK(USER_CLK),
        .RESET(reset_lanes_i)
    );


    
    
    

    //_________________________Instantiate MGT Wrapper ______________________________

    defparam aurora_mgt_wrapper_i.SIMULATION_P = SIMULATION_P;
 
    defparam aurora_mgt_wrapper_i.LANE0_GT11_MODE_P = LANE0_GT11_MODE_P;
    defparam aurora_mgt_wrapper_i.LANE0_MGT_ID_P = LANE0_MGT_ID_P;
    defparam aurora_mgt_wrapper_i.TXPOST_TAP_PD_P  = TXPOST_TAP_PD_P;   
    aurora_MGT_WRAPPER aurora_mgt_wrapper_i
    (
        
        //________________________________________________________________________
        //________________________________________________________________________
        //MGT0  

        //--------------- 8B10B Receive Data Path and Control Ports ----------------
        .MGT0_RXCHARISCOMMA_OUT     (rx_char_is_comma_i[3:0]),
        .MGT0_RXCHARISK_OUT         (rx_char_is_k_i[3:0]),
        .MGT0_RXDATA_OUT            (rx_data_i[31:0]),
        .MGT0_RXDISPERR_OUT         (rx_disp_err_i[3:0]),
        .MGT0_RXNOTINTABLE_OUT      (rx_not_in_table_i[3:0]),
        .MGT0_RXRUNDISP_OUT         (),                             //Unused
        //--------------- 8B10B Transmit Data Path and Control Ports ---------------
        .MGT0_TXBYPASS8B10B_IN      (tied_to_ground_vec_i[3:0]),
        .MGT0_TXCHARDISPMODE_IN     (tied_to_ground_vec_i[3:0]),
        .MGT0_TXCHARDISPVAL_IN      (tied_to_ground_vec_i[3:0]),
        .MGT0_TXCHARISK_IN          (tx_char_is_k_i[3:0]),
        .MGT0_TXDATA_IN             (tx_data_i[31:0]),
        .MGT0_TXKERR_OUT            (),                             //Unused
        .MGT0_TXRUNDISP_OUT         (),                             //Unused
        //------------------------ Calibration Block Ports -------------------------
        .MGT0_ACTIVE_OUT            (CALBLOCK_ACTIVE),
        .MGT0_DRP_RESET_IN          (RESET_CALBLOCKS),
        .MGT0_RX_SIGNAL_DETECT_IN   (RX_SIGNAL_DETECT),
        .MGT0_TX_SIGNAL_DETECT_IN   (tied_to_vcc_i),
        //------------------------- Channel Bonding Ports --------------------------
        .MGT0_ENCHANSYNC_IN         (en_chan_sync_i),                             
        //------------------- Dynamic Reconfiguration Port (DRP) -------------------
        .MGT0_DCLK_IN               (DCLK),
        //------------------------------ Global Ports ------------------------------
        .MGT0_POWERDOWN_IN          (POWER_DOWN),
        .MGT0_TXINHIBIT_IN          (tied_to_ground_i),
        //-------------------------------- PLL Lock --------------------------------
        .MGT0_RXLOCK_OUT            (pma_rx_lock_i),
        .MGT0_TXLOCK_OUT            (tx_lock_i),
        //------------------------- Polarity Control Ports -------------------------
        .MGT0_RXPOLARITY_IN         (rx_polarity_i),
        .MGT0_TXPOLARITY_IN         (tied_to_ground_i),
        //-------------------------- Ports for Simulation --------------------------
        .MGT0_COMBUSIN_IN           (MGT0_COMBUSIN),
        .MGT0_COMBUSOUT_OUT         (MGT0_COMBUSOUT),
        //---------------------------- Reference Clocks ----------------------------
        .MGT0_GREFCLK_IN            (tied_to_ground_i),
        .MGT0_REFCLK1_IN            (REF_CLK1_LEFT),
        .MGT0_REFCLK2_IN            (tied_to_ground_i),
        //--------------------------------- Resets ---------------------------------
        .MGT0_RXPMARESET_IN         (PMA_INIT),
        .MGT0_RXRESET_IN            (rx_reset_i),
        .MGT0_TXPMARESET_IN         (PMA_INIT),
        .MGT0_TXRESET_IN            (tx_reset_i),
        .MGT0_DCM_IS_LOCKED         (dcm_is_locked_i),
        .MGT0_TXPMA_READY_OUT       (txpma_ready_0_i),
        .MGT0_RXPMA_READY_OUT       (rxpma_ready_0_i),
        .MGT0_PCS_ERROR_IN          (hard_error_i),
        //---------------------------- Serdes Alignment ----------------------------
        .MGT0_ENMCOMMAALIGN_IN      (ena_comma_align_i),
        .MGT0_ENPCOMMAALIGN_IN      (ena_comma_align_i),
        .MGT0_RXREALIGN_OUT         (rx_realign_i),
        //------------------------------ Serial Ports ------------------------------
        .MGT0_RX1N_IN               (RXN),
        .MGT0_RX1P_IN               (RXP),
        .MGT0_TX1N_OUT              (TXN),
        .MGT0_TX1P_OUT              (TXP),
        //--------------------------------- Status ---------------------------------
        .MGT0_RXBUFERR_OUT          (rx_buf_err_i),
        .MGT0_RXSTATUS_OUT          ({ch_bond_done_i,rx_status_float_i[4:0]}),                             //Unused
        .MGT0_TXBUFERR_OUT          (tx_buf_err_i),
        //--------------------------------- Loop Back ---------------------------------
        .MGT0_USER_LOOPBACK         (LOOPBACK),
        //------------------------------ User Clocks -------------------------------
        .MGT0_RXRECCLK1_OUT         (),                             //Unused
        .MGT0_RXRECCLK2_OUT         (),                             //Unused
        .MGT0_RXUSRCLK_IN           (USER_CLK),
        .MGT0_RXUSRCLK2_IN          (USER_CLK),
        .MGT0_TXOUTCLK1_OUT         (raw_tx_out_clk_i),
        .MGT0_TXOUTCLK2_OUT         (),                             //Unused
        .MGT0_TXUSRCLK_IN           (USER_CLK),
        .MGT0_TXUSRCLK2_IN          (USER_CLK)

        
    );  



    //__________Instantiate Global Logic to combine Lanes into a Channel______

    defparam aurora_global_logic_i.EXTEND_WATCHDOGS = EXTEND_WATCHDOGS;
    aurora_GLOBAL_LOGIC    aurora_global_logic_i
    (
        //MGT Interface
        .CH_BOND_DONE(ch_bond_done_i),
        .EN_CHAN_SYNC(en_chan_sync_i),


        //Aurora Lane Interface
        .LANE_UP(lane_up_i),
        .SOFT_ERROR(soft_error_i),
        .HARD_ERROR(hard_error_i),
        .CHANNEL_BOND_LOAD(ch_bond_done_i),
        .GOT_A(got_a_i),
        .GOT_V(got_v_i),
        .GEN_A(gen_a_i),
        .GEN_K(gen_k_i),
        .GEN_R(gen_r_i),
        .GEN_V(gen_v_i),
        .RESET_LANES(reset_lanes_i),


        //System Interface
        .USER_CLK(USER_CLK),
        .RESET(system_reset_c),
        .POWER_DOWN(POWER_DOWN),
        .CHANNEL_UP(channel_up_i),
        .START_RX(start_rx_i),
        .CHANNEL_SOFT_ERROR(SOFT_ERROR),
        .CHANNEL_HARD_ERROR(HARD_ERROR)
    );



    //_____________________________Instantiate TX_STREAM___________________________

    
    aurora_TX_STREAM aurora_tx_stream_i
    (
        // Data interface
        .TX_D(TX_D),
        .TX_SRC_RDY_N(TX_SRC_RDY_N),
        .TX_DST_RDY_N(TX_DST_RDY_N),


        // Global Logic Interface
        .CHANNEL_UP(channel_up_i),


        //Clock Correction Interface
        .DO_CC(DO_CC),
        .WARN_CC(WARN_CC),
        
        
        // Aurora Lane Interface
        .GEN_SCP(gen_scp_i),
        .GEN_ECP(gen_ecp_i),
        .TX_PE_DATA_V(tx_pe_data_v_i),
        .GEN_PAD(gen_pad_i),
        .TX_PE_DATA(tx_pe_data_i),
        .GEN_CC(gen_cc_i),


        // System Interface
        .USER_CLK(USER_CLK)
    );



    //_____________________________ Instantiate RX_STREAM____________________________
    
    
    aurora_RX_STREAM aurora_rx_stream_i
    (
        // LocalLink PDU Interface
        .RX_D(RX_D),
        .RX_SRC_RDY_N(RX_SRC_RDY_N),
    
    
        // Global Logic Interface
        .START_RX(start_rx_i),
    
    
        // Aurora Lane Interface
        .RX_PAD(rx_pad_i),
        .RX_PE_DATA(rx_pe_data_i),
        .RX_PE_DATA_V(rx_pe_data_v_i),
        .RX_SCP(rx_scp_i),
        .RX_ECP(rx_ecp_i),
    
   
        // System Interface
        .USER_CLK(USER_CLK)
    );



endmodule
