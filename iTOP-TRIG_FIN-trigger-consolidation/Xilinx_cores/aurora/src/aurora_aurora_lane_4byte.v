///////////////////////////////////////////////////////////////////////////////
//
// Project:  Aurora Module Generator version 3.1
//
//    Date:  $Date: 2009/09/08 16:23:47 $
//     Tag:  $Name: i+O-61x+189894 $
//    File:  $RCSfile: aurora_lane_v4_4byte.ejava,v $
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
//  AURORA_LANE_4BYTE
//
//
//  Description: the AURORA_LANE_4BYTE module provides a full duplex 4-byte
//               aurora lane connection using a single MGT.  The module handles
//               lane initialization, symbol generation and decoding and error
//               detection.  It also decodes some of the channel bonding
//               indicator signals needed by the Global logic.
//
//               * Supports Virtex 4
//

`timescale 1 ns / 1 ps

module aurora_AURORA_LANE_4BYTE
(
    // MGT Interface
    RX_DATA,
    RX_NOT_IN_TABLE,
    RX_DISP_ERR,
    RX_CHAR_IS_K,
    RX_CHAR_IS_COMMA,
    RX_STATUS,
    RX_BUF_ERR,
    TX_BUF_ERR,
    RX_REALIGN,
    PMA_RX_LOCK,
    RX_POLARITY,
    RX_RESET,
    TX_CHAR_IS_K,
    TX_DATA,
    TX_RESET,

    // Comma Detect Phase Align Interface
    ENA_COMMA_ALIGN,

    // TX_LL Interface
    GEN_SCP,
    GEN_ECP,
    GEN_PAD,
    TX_PE_DATA,
    TX_PE_DATA_V,
    GEN_CC,

    // RX_LL Interface
    RX_PAD,
    RX_PE_DATA,
    RX_PE_DATA_V,
    RX_SCP,
    RX_ECP,

    // Global Logic Interface
    GEN_A,
    GEN_K,
    GEN_R,
    GEN_V,

    LANE_UP,
    SOFT_ERROR,
    HARD_ERROR,
    CHANNEL_BOND_LOAD,
    GOT_A,
    GOT_V,

    // System Interface
    USER_CLK,
    RESET,
    TXPMA_READY_IN,
    RXPMA_READY_IN


);

//******************************* Parameter Declarations ****************************

    parameter   EXTEND_WATCHDOGS            =   0;
    
    
//***********************************Port Declarations*******************************


    // MGT Interface
    input   [31:0]  RX_DATA;                // 4-byte data bus from the MGT.
    input   [3:0]   RX_NOT_IN_TABLE;        // Invalid 10-bit code was recieved.
    input   [3:0]   RX_DISP_ERR;            // Disparity error detected on RX interface.
    input   [3:0]   RX_CHAR_IS_K;           // Indicates which bytes of RX_DATA are control.
    input   [3:0]   RX_CHAR_IS_COMMA;       // Comma received on given byte.
    input   [5:0]   RX_STATUS;              // Part of GT_11 status and error bus
    input           RX_BUF_ERR;             // Overflow/Underflow of RX buffer detected.
    input           TX_BUF_ERR;             // Overflow/Underflow of TX buffer detected.
    input           RX_REALIGN;             // SERDES was realigned because of a new comma.
    input           PMA_RX_LOCK;            // PMA layer in GT10 MGT Locked

    output          RX_POLARITY;            // Controls interpreted polarity of serial data inputs.
    output          RX_RESET;               // Reset RX side of MGT logic.
    output  [3:0]   TX_CHAR_IS_K;           // TX_DATA byte is a control character.
    output  [31:0]  TX_DATA;                // 4-byte data bus to the MGT.
    output          TX_RESET;               // Reset TX side of MGT logic.


    // Comma Detect Phase Align Interface
    output          ENA_COMMA_ALIGN;        // Request comma alignment.


    // TX_LL Interface
    input   [0:1]   GEN_SCP;                // SCP generation request from TX_LL.
    input   [0:1]   GEN_ECP;                // ECP generation request from TX_LL.
    input   [0:1]   GEN_PAD;                // PAD generation request from TX_LL
    input   [0:31]  TX_PE_DATA;             // Data from TX_LL to send over lane.
    input   [0:1]   TX_PE_DATA_V;           // Indicates TX_PE_DATA is Valid.
    input           GEN_CC;                 // CC generation request from TX_LL.


    // RX_LL Interface
    output  [0:1]   RX_PAD;                 // Indicates lane received PAD.
    output  [0:31]  RX_PE_DATA;             // RX data from lane to RX_LL.
    output  [0:1]   RX_PE_DATA_V;           // RX_PE_DATA is data, not control symbol.
    output  [0:1]   RX_SCP;                 // Indicates lane received SCP.
    output  [0:1]   RX_ECP;                 // Indicates lane received ECP


    // Global Logic Interface
    input           GEN_A;                  // 'A character' generation request from Global Logic.
    input   [0:3]   GEN_K;                  // 'K character' generation request from Global Logic.
    input   [0:3]   GEN_R;                  // 'R character' generation request from Global Logic.
    input   [0:3]   GEN_V;                  // Verification data generation request.
    output          LANE_UP;                // Lane is ready for bonding and verification.
    output  [0:1]   SOFT_ERROR;             // Soft error detected.
    output          HARD_ERROR;             // Hard error detected.
    output          CHANNEL_BOND_LOAD;      // Channel Bongding done code recieved.
    output  [0:3]   GOT_A;                  // Indicates lane recieved 'A character' bytes.
    output          GOT_V;                  // Verification symbols received.


    // System Interface
    input           USER_CLK;               // System clock for all non-MGT Aurora Logic.
    input           RESET;                  // Reset the lane.
    input           TXPMA_READY_IN;         // Ready signal from cal block.
    input           RXPMA_READY_IN;         // Ready signal from cal block.


//*********************************Wire Declarations**********************************

    wire            ena_comma_align_i;
    wire            gen_sp_i;
    wire            gen_spa_i;
    wire            rx_sp_i;
    wire            rx_spa_i;
    wire            rx_neg_i;
    wire            enable_error_detect_i;
    wire            do_word_align_i;
    wire            hard_error_reset_i;
    

//*********************************Main Body of Code**********************************

    // Lane Initialization state machine
    defparam aurora_lane_init_sm_4byte_i.EXTEND_WATCHDOGS = EXTEND_WATCHDOGS;
    aurora_LANE_INIT_SM_4BYTE aurora_lane_init_sm_4byte_i
    (
        // MGT Interface
        .RX_NOT_IN_TABLE(RX_NOT_IN_TABLE),
        .RX_DISP_ERR(RX_DISP_ERR),
        .RX_CHAR_IS_COMMA(RX_CHAR_IS_COMMA),
        .RX_REALIGN(RX_REALIGN),

        .RX_RESET(RX_RESET),
        .TX_RESET(TX_RESET),
        .RX_POLARITY(RX_POLARITY),


        // Comma Detect Phase Alignment Interface
        .ENA_COMMA_ALIGN(ENA_COMMA_ALIGN),


        // Symbol Generator Interface
        .GEN_SP(gen_sp_i),
        .GEN_SPA(gen_spa_i),


        // Symbol Decoder Interface
        .RX_SP(rx_sp_i),
        .RX_SPA(rx_spa_i),
        .RX_NEG(rx_neg_i),

        .DO_WORD_ALIGN(do_word_align_i),

        // Error Detection Logic Interface
        .HARD_ERROR_RESET(hard_error_reset_i),

        .ENABLE_ERROR_DETECT(enable_error_detect_i),


        // Global Logic Interface
        .LANE_UP(LANE_UP),


        // System Interface
        .USER_CLK(USER_CLK),
        .RESET(RESET),
        .TXPMA_READY(TXPMA_READY_IN),
        .RXPMA_READY(RXPMA_READY_IN)

    );



    // Channel Bonding Count Decode module
    aurora_CHBOND_COUNT_DEC_4BYTE aurora_chbond_count_dec_4byte_i
    (
        .RX_STATUS(RX_STATUS),
        .CHANNEL_BOND_LOAD(CHANNEL_BOND_LOAD),
        .USER_CLK(USER_CLK)
    );


    // Symbol Generation module
    aurora_SYM_GEN_4BYTE aurora_sym_gen_4byte_i
    (
        // TX_LL Interface
        .GEN_SCP(GEN_SCP),
        .GEN_ECP(GEN_ECP),
        .GEN_PAD(GEN_PAD),
        .TX_PE_DATA(TX_PE_DATA),
        .TX_PE_DATA_V(TX_PE_DATA_V),
        .GEN_CC(GEN_CC),


        // Global Logic Interface
        .GEN_A(GEN_A),
        .GEN_K(GEN_K),
        .GEN_R(GEN_R),
        .GEN_V(GEN_V),


        // Lane Init SM Interface
        .GEN_SP(gen_sp_i),
        .GEN_SPA(gen_spa_i),


        // MGT Interface
        .TX_CHAR_IS_K({TX_CHAR_IS_K[0],TX_CHAR_IS_K[1],TX_CHAR_IS_K[2],TX_CHAR_IS_K[3]}),
        .TX_DATA({TX_DATA[7:0],TX_DATA[15:8],TX_DATA[23:16],TX_DATA[31:24]}),


        // System Interface
        .USER_CLK(USER_CLK)
    );



    // Symbol Decode module
    aurora_SYM_DEC_4BYTE aurora_sym_dec_4byte_i
    (
        // RX_LL Interface
        .RX_PAD(RX_PAD),
        .RX_PE_DATA(RX_PE_DATA),
        .RX_PE_DATA_V(RX_PE_DATA_V),
        .RX_SCP(RX_SCP),
        .RX_ECP(RX_ECP),


        // Lane Init SM Interface
        .DO_WORD_ALIGN(do_word_align_i),
        .LANE_UP(LANE_UP),
        .RX_SP(rx_sp_i),
        .RX_SPA(rx_spa_i),
        .RX_NEG(rx_neg_i),


        // Global Logic Interface
        .GOT_A(GOT_A),
        .GOT_V(GOT_V),


        // MGT Interface
        .RX_DATA({RX_DATA[7:0],RX_DATA[15:8],RX_DATA[23:16],RX_DATA[31:24]}),
        .RX_CHAR_IS_K({RX_CHAR_IS_K[0],RX_CHAR_IS_K[1],RX_CHAR_IS_K[2],RX_CHAR_IS_K[3]}),
        .RX_CHAR_IS_COMMA({RX_CHAR_IS_COMMA[0],RX_CHAR_IS_COMMA[1],RX_CHAR_IS_COMMA[2],RX_CHAR_IS_COMMA[3]}),


        // System Interface
        .USER_CLK(USER_CLK),
        .RESET(RESET)
    );



    // Error Detection module
    aurora_ERROR_DETECT_4BYTE aurora_error_detect_4byte_i
    (
        // Lane Init SM Interface
        .ENABLE_ERROR_DETECT(enable_error_detect_i),

        .HARD_ERROR_RESET(hard_error_reset_i),


        // Global Logic Interface
        .SOFT_ERROR(SOFT_ERROR),
        .HARD_ERROR(HARD_ERROR),


        // MGT Interface
        .RX_DISP_ERR({RX_DISP_ERR[0],RX_DISP_ERR[1],RX_DISP_ERR[2],RX_DISP_ERR[3]}),
        .RX_NOT_IN_TABLE({RX_NOT_IN_TABLE[0],RX_NOT_IN_TABLE[1],RX_NOT_IN_TABLE[2],RX_NOT_IN_TABLE[3]}),
        .RX_BUF_ERR(RX_BUF_ERR),
        .TX_BUF_ERR(TX_BUF_ERR),
        .RX_REALIGN(RX_REALIGN),


        // System Interface
        .USER_CLK(USER_CLK)
    );

endmodule
