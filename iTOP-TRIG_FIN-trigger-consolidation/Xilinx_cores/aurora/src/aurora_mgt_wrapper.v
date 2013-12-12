 
///////////////////////////////////////////////////////////////////////////////
//
// Project:  Aurora Module Generator version 3.1
//
//    Date:  $Date: 2009/09/08 16:23:49 $
//     Tag:  $Name: i+O-61x+189894 $
//    File:  $RCSfile: mgt_wrapper.ejava,v $
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





`timescale 1 ns / 1 ps


//***************************** Entity Declaration *****************************
module aurora_MGT_WRAPPER
(
    
    //________________________________________________________________________
    //________________________________________________________________________
    //MGT0  

    //--------------- 8B10B Receive Data Path and Control Ports ----------------
    MGT0_RXCHARISCOMMA_OUT,
    MGT0_RXCHARISK_OUT,
    MGT0_RXDATA_OUT,
    MGT0_RXDISPERR_OUT,
    MGT0_RXNOTINTABLE_OUT,
    MGT0_RXRUNDISP_OUT,
    //--------------- 8B10B Transmit Data Path and Control Ports ---------------
    MGT0_TXBYPASS8B10B_IN,
    MGT0_TXCHARDISPMODE_IN,
    MGT0_TXCHARDISPVAL_IN,
    MGT0_TXCHARISK_IN,
    MGT0_TXDATA_IN,
    MGT0_TXKERR_OUT,
    MGT0_TXRUNDISP_OUT,
    //------------------------ Calibration Block Ports -------------------------
    MGT0_ACTIVE_OUT,
    MGT0_DRP_RESET_IN,
    MGT0_RX_SIGNAL_DETECT_IN,
    MGT0_TX_SIGNAL_DETECT_IN,
    //------------------------- Channel Bonding Ports --------------------------
    MGT0_ENCHANSYNC_IN,
    //------------------- Dynamic Reconfiguration Port (DRP) -------------------
    MGT0_DCLK_IN,
    //------------------------------ Global Ports ------------------------------
    MGT0_POWERDOWN_IN,
    MGT0_TXINHIBIT_IN,
    //-------------------------------- PLL Lock --------------------------------
    MGT0_RXLOCK_OUT,
    MGT0_TXLOCK_OUT,
    //------------------------- Polarity Control Ports -------------------------
    MGT0_RXPOLARITY_IN,
    MGT0_TXPOLARITY_IN,
    //-------------------------- Ports for Simulation --------------------------
    MGT0_COMBUSIN_IN,
    MGT0_COMBUSOUT_OUT,
    //---------------------------- Reference Clocks ----------------------------
    MGT0_GREFCLK_IN,
    MGT0_REFCLK1_IN,
    MGT0_REFCLK2_IN,
    //--------------------------------- Resets ---------------------------------
    MGT0_RXPMARESET_IN,
    MGT0_RXRESET_IN,
    MGT0_TXPMARESET_IN,
    MGT0_TXRESET_IN,
    MGT0_DCM_IS_LOCKED,
    MGT0_TXPMA_READY_OUT,
    MGT0_RXPMA_READY_OUT,
    MGT0_PCS_ERROR_IN,
    //---------------------------- Serdes Alignment ----------------------------
    MGT0_ENMCOMMAALIGN_IN,
    MGT0_ENPCOMMAALIGN_IN,
    MGT0_RXREALIGN_OUT,
    //------------------------------ Serial Ports ------------------------------
    MGT0_RX1N_IN,
    MGT0_RX1P_IN,
    MGT0_TX1N_OUT,
    MGT0_TX1P_OUT,
    //--------------------------------- Status ---------------------------------
    MGT0_RXBUFERR_OUT,
    MGT0_RXSTATUS_OUT,
    MGT0_TXBUFERR_OUT,
    //--------------------------------- Loop Back ---------------------------------
    MGT0_USER_LOOPBACK,
    //------------------------------ User Clocks -------------------------------
    MGT0_RXRECCLK1_OUT,
    MGT0_RXRECCLK2_OUT,
    MGT0_RXUSRCLK_IN,
    MGT0_RXUSRCLK2_IN,
    MGT0_TXOUTCLK1_OUT,
    MGT0_TXOUTCLK2_OUT,
    MGT0_TXUSRCLK_IN,
    MGT0_TXUSRCLK2_IN

    
);


//***************************** Port Declarations ******************************
        

    //__________________________________________________________________________
    //__________________________________________________________________________
    //MGT0

    //--------------- 8B10B Receive Data Path and Control Ports ----------------
    output  [3:0]       MGT0_RXCHARISCOMMA_OUT;
    output  [3:0]       MGT0_RXCHARISK_OUT;
    output  [31:0]       MGT0_RXDATA_OUT;
    output  [3:0]       MGT0_RXDISPERR_OUT;
    output  [3:0]       MGT0_RXNOTINTABLE_OUT;
    output  [3:0]       MGT0_RXRUNDISP_OUT;
    //--------------- 8B10B Transmit Data Path and Control Ports ---------------
    input   [3:0]       MGT0_TXBYPASS8B10B_IN;
    input   [3:0]       MGT0_TXCHARDISPMODE_IN;
    input   [3:0]       MGT0_TXCHARDISPVAL_IN;
    input   [3:0]       MGT0_TXCHARISK_IN;
    input   [31:0]       MGT0_TXDATA_IN;
    output  [3:0]       MGT0_TXKERR_OUT;
    output  [3:0]       MGT0_TXRUNDISP_OUT;
    //------------------------ Calibration Block Ports -------------------------
    output              MGT0_ACTIVE_OUT;
    input               MGT0_DRP_RESET_IN;
    input               MGT0_RX_SIGNAL_DETECT_IN;
    input               MGT0_TX_SIGNAL_DETECT_IN;
    //------------------------- Channel Bonding Ports --------------------------
    input               MGT0_ENCHANSYNC_IN;
    //------------------- Dynamic Reconfiguration Port (DRP) -------------------
    input               MGT0_DCLK_IN;
    //------------------------------ Global Ports ------------------------------
    input               MGT0_POWERDOWN_IN;
    input               MGT0_TXINHIBIT_IN;
    //-------------------------------- PLL Lock --------------------------------
    output              MGT0_RXLOCK_OUT;
    output              MGT0_TXLOCK_OUT;
    //------------------------- Polarity Control Ports -------------------------
    input               MGT0_RXPOLARITY_IN;
    input               MGT0_TXPOLARITY_IN;
    //-------------------------- Ports for Simulation --------------------------
    input   [15:0]      MGT0_COMBUSIN_IN;
    output  [15:0]      MGT0_COMBUSOUT_OUT;
    //---------------------------- Reference Clocks ----------------------------
    input               MGT0_GREFCLK_IN;    
    input               MGT0_REFCLK1_IN;
    input               MGT0_REFCLK2_IN;    
    //--------------------------------- Resets ---------------------------------
    input               MGT0_RXPMARESET_IN;
    input               MGT0_RXRESET_IN;
    input               MGT0_TXPMARESET_IN;
    input               MGT0_TXRESET_IN;
    input               MGT0_DCM_IS_LOCKED;
    output              MGT0_TXPMA_READY_OUT;
    output              MGT0_RXPMA_READY_OUT;
    input               MGT0_PCS_ERROR_IN;
    //---------------------------- Serdes Alignment ----------------------------
    input               MGT0_ENMCOMMAALIGN_IN;
    input               MGT0_ENPCOMMAALIGN_IN;
    output              MGT0_RXREALIGN_OUT;
    //------------------------------ Serial Ports ------------------------------
    input               MGT0_RX1N_IN;
    input               MGT0_RX1P_IN;
    output              MGT0_TX1N_OUT;
    output              MGT0_TX1P_OUT;
    //--------------------------------- Status ---------------------------------
    output              MGT0_RXBUFERR_OUT;
    output  [5:0]       MGT0_RXSTATUS_OUT;
    output              MGT0_TXBUFERR_OUT;
    //--------------------------------- Loop Back ---------------------------------
    input   [1:0]       MGT0_USER_LOOPBACK;
    //------------------------------ User Clocks -------------------------------
    output              MGT0_RXRECCLK1_OUT;
    output              MGT0_RXRECCLK2_OUT;
    input               MGT0_RXUSRCLK_IN;
    input               MGT0_RXUSRCLK2_IN;
    output              MGT0_TXOUTCLK1_OUT;
    output              MGT0_TXOUTCLK2_OUT;
    input               MGT0_TXUSRCLK_IN;
    input               MGT0_TXUSRCLK2_IN;



//************************** Parameter Declarations ****************************

    parameter   TXPOST_TAP_PD_P     =   "FALSE";    // Default is false, set to FALSE for serial loopback or tuned preemphasis
    parameter   TXPRE_TAP_PD     =   "TRUE";

    // Preemphasis and Equalization
    parameter   RXAFEEQ          =   9'b000000000;
    parameter   RXEQ             =   64'h4000000000000000;
    parameter   TXDAT_PRDRV_DAC  =   3'b111;
    parameter   TXDAT_TAP_DAC    =   5'b01010;
    parameter   TXHIGHSIGNALEN   =   "TRUE";
    parameter   TXPOST_PRDRV_DAC =   3'b111;
    parameter   TXPOST_TAP_DAC   =   5'b00001;
    parameter   TXPRE_PRDRV_DAC  =   3'b111;
    parameter   TXPRE_TAP_DAC    =   5'b0000;

    
    parameter   RXDATAWIDTH_P       =   2'b10;
    parameter   RXINTDATAWIDTH_P    =   2'b11;
    parameter   TXDATAWIDTH_P       =   2'b10;
    parameter   TXINTDATAWIDTH_P    =   2'b11;

    parameter   SIMULATION_P        =   0;          // Set to 1 when simulating

    parameter   LANE0_GT11_MODE_P   =   "B";        // Set based on locations chosen in Aurora Core Customization GUI  
    parameter   LANE0_MGT_ID_P      =   1;          // 0=A, 1=B


//***************************** Wire Declarations ******************************

    // ground and vcc signals
    wire               tied_to_ground_i;
    wire    [63:0]     tied_to_ground_vec_i;
    wire               tied_to_vcc_i;
    wire    [63:0]     tied_to_vcc_vec_i;

    // channel bond signals
    wire    [4:0]      mgt0_chbondo_i;
        
    // calblock connection signals
    wire    [7:0]      mgt0_daddr_i;
    wire               mgt0_den_i;
    wire    [15:0]     mgt0_di_i;
    wire    [15:0]     mgt0_do_i;
    wire               mgt0_drdy_i;
    wire               mgt0_dwe_i;
    wire    [1:0]      mgt0_loopback_i;
    wire               mgt0_txenc8b10buse_i;
    wire    [7:0]      mgt0_txbypass8b10b_i;
    wire               mgt0_txpmareset_i;
    wire               mgt0_rxpmareset_i;
    wire               mgt0_gt11_txpcsreset_i;
    wire               mgt0_gt11_rxpcsreset_i;
    wire               mgt0_txpcs_reset_i;
    wire               mgt0_rxpcs_reset_i;
    wire               mgt0_txlock_i;
    wire               mgt0_rxlock_i;
    wire               mgt0_txoutclk1_i;
    wire               mgt0_rxrecclk2_i;
    
    //Floating wires for unused sections of MGT bus
    wire    [3:0]      mgt0_rxchariscomma_out_float_i;
    wire    [3:0]      mgt0_rxcharisk_out_float_i;
    wire    [31:0]     mgt0_rxdata_out_float_i;
    wire    [3:0]      mgt0_rxdisperr_out_float_i;
    wire    [3:0]      mgt0_rxnotintable_out_float_i;
    wire    [3:0]      mgt0_rxrundisp_out_float_i;
    wire    [3:0]      mgt0_txkerr_out_float_i;
    wire    [3:0]      mgt0_txrundisp_out_float_i;






//***************************** Main Body of Code ******************************


    //-------------------------  Static signal Assigments ----------------------   
    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;


    //__________________________________________________________________________
    //__________________________________________________________________________
    //MGT0
    assign MGT0_RXLOCK_OUT = mgt0_rxlock_i;
    assign MGT0_TXLOCK_OUT = mgt0_txlock_i;

    //MGT PCS reset is asserted if there is any hard error or soft error, soft error is taken care by Aurora, hard error by GT11_INIT module
    assign mgt0_txpcs_reset_i  = MGT0_TXRESET_IN ;
    assign mgt0_rxpcs_reset_i  = MGT0_RXRESET_IN ;

    //------------------------- GT11 Instantiations  ---------------------------   

GT11 # 
(
    //-------------------- RocketIO MGT Clocking Atrributes --------------------      

.RX_CLOCK_DIVIDER        (2'b00),
.RXASYNCDIVIDE           (2'b10),
.RXCLK0_FORCE_PMACLK     ("FALSE"),
.RXCLKMODE               (6'b000011),
.RXOUTDIV2SEL            (2),
.RXPLLNDIVSEL            (10),
.RXPMACLKSEL             ("REFCLK1"),
.RXRECCLK1_USE_SYNC      ("FALSE"),
.RXUSRDIVISOR            (1),
.TX_CLOCK_DIVIDER        (2'b00),
.TXABPMACLKSEL           ("REFCLK1"),
.TXASYNCDIVIDE           (2'b10),
.TXCLK0_FORCE_PMACLK     ("TRUE"),
.TXCLKMODE               (4'b0100),
.TXOUTCLK1_USE_SYNC      ("FALSE"),
.TXOUTDIV2SEL            (2),
.TXPHASESEL              ("FALSE"), 
.TXPLLNDIVSEL            (10),

    //------------------- RocketIO MGT Data Path Atrributes --------------------   

.RXDATA_SEL              (2'b00),
.TXDATA_SEL              (2'b00),

    //--------------------- RocketIO MGT Alignment Atrributes ------------------   

.ALIGN_COMMA_WORD        (4),
.COMMA_10B_MASK          (10'h3ff),
.COMMA32                 ("FALSE"),
.DEC_MCOMMA_DETECT       ("TRUE"),
.DEC_PCOMMA_DETECT       ("TRUE"),
.DEC_VALID_COMMA_ONLY    ("FALSE"),
.MCOMMA_32B_VALUE        (32'h0000017c),
.MCOMMA_DETECT           ("TRUE"),
.PCOMMA_32B_VALUE        (32'h00000283),
.PCOMMA_DETECT           ("TRUE"),
.PCS_BIT_SLIP            ("FALSE"),
  
    //-- RocketIO MGT Atrributes Common to Clk Correction & Channel Bonding ----   

.CCCB_ARBITRATOR_DISABLE ("FALSE"),
.CLK_COR_8B10B_DE        ("TRUE"),


    //---------------- RocketIO MGT Clock Correction Atrributes ----------------   

.CLK_COR_MAX_LAT         (48),
.CLK_COR_MIN_LAT         (36),
.CLK_COR_SEQ_1_1         (11'b00111110111),
.CLK_COR_SEQ_1_2         (11'b00111110111),
.CLK_COR_SEQ_1_3         (11'b00111110111),
.CLK_COR_SEQ_1_4         (11'b00111110111),
.CLK_COR_SEQ_1_MASK      (4'b0000),
.CLK_COR_SEQ_2_1         (11'b00000000000),
.CLK_COR_SEQ_2_2         (11'b00000000000),
.CLK_COR_SEQ_2_3         (11'b00000000000),
.CLK_COR_SEQ_2_4         (11'b00000000000),
.CLK_COR_SEQ_2_MASK      (4'b1111),
.CLK_COR_SEQ_2_USE       ("FALSE"),
.CLK_COR_SEQ_DROP        ("FALSE"),
.CLK_COR_SEQ_LEN         (4),
.CLK_CORRECT_USE         ("TRUE"),
    
    //----------------- RocketIO MGT Channel Bonding Atrributes ----------------   
    
.CHAN_BOND_LIMIT         (16),
.CHAN_BOND_MODE          ("NONE"),
.CHAN_BOND_ONE_SHOT      ("FALSE"),
.CHAN_BOND_SEQ_1_1       (11'b00101111100),
.CHAN_BOND_SEQ_1_2       (11'b00000000000),
.CHAN_BOND_SEQ_1_3       (11'b00000000000),
.CHAN_BOND_SEQ_1_4       (11'b00000000000),
.CHAN_BOND_SEQ_1_MASK    (4'b1110),
.CHAN_BOND_SEQ_2_1       (11'b00000000000),
.CHAN_BOND_SEQ_2_2       (11'b00000000000),
.CHAN_BOND_SEQ_2_3       (11'b00000000000),
.CHAN_BOND_SEQ_2_4       (11'b00000000000),
.CHAN_BOND_SEQ_2_MASK    (4'b1111),
.CHAN_BOND_SEQ_2_USE     ("FALSE"),
.CHAN_BOND_SEQ_LEN       (1),

    //-------- RocketIO MGT 64B66B Block Sync State Machine Attributes --------- 

.SH_CNT_MAX              (64),
.SH_INVALID_CNT_MAX      (16),

    //-------------- RocketIO MGT Digital Receiver Attributes ------------------   

.DIGRX_FWDCLK            (2'b00),
.DIGRX_SYNC_MODE         ("FALSE"),
.ENABLE_DCDR             ("FALSE"),
.RXBY_32                 ("FALSE"),
.RXDIGRESET              ("FALSE"),
.RXDIGRX                 ("FALSE"),
.SAMPLE_8X               ("FALSE"),

    //------------------------ RocketIO MGT CRC Atrributes ---------------------   

.RXCRCCLOCKDOUBLE        ("FALSE"),
.RXCRCENABLE             ("FALSE"),
.RXCRCINITVAL            (32'hFFFFFFFF),
.RXCRCINVERTGEN          ("FALSE"),
.RXCRCSAMECLOCK          ("TRUE"),
.TXCRCCLOCKDOUBLE        ("FALSE"),
.TXCRCENABLE             ("FALSE"),
.TXCRCINITVAL            (32'hFFFFFFFF),
.TXCRCINVERTGEN          ("FALSE"),
.TXCRCSAMECLOCK          ("TRUE"),

    //------------------------- Miscellaneous Attributes -----------------------     

.GT11_MODE               (LANE0_GT11_MODE_P),
.OPPOSITE_SELECT         ("FALSE"),
.PMA_BIT_SLIP            ("FALSE"),
.REPEATER                ("FALSE"),
.RX_BUFFER_USE           ("TRUE"),
.RXCDRLOS                (6'b000000),
.TX_BUFFER_USE           ("TRUE"),

    //--------------------- Advanced RocketIO MGT Attributes -------------------  

    ///Note : THE FOLLOWING ATTRIBUTES ARE FOR ADVANCED USERS. PLEASE EDIT WITH CAUTION.
       
     //  Miscellaneous Attributes    
.RXDCCOUPLE              ("FALSE"),
.RXFDCAL_CLOCK_DIVIDE    ("TWO"),
.TXFDCAL_CLOCK_DIVIDE    ("TWO"),

    //--------------------- Restricted RocketIO MGT Attributes -------------------  

    ///Note : THE FOLLOWING ATTRIBUTES ARE RESTRICTED. PLEASE DO NOT EDIT.

     //  Powerdowns   
.POWER_ENABLE             ("TRUE"),
.RXAFEPD                  ("FALSE"),
.RXAPD                    ("FALSE"),
.RXLKAPD                  ("FALSE"),
.RXPD                     ("FALSE"),
.RXRCPPD                  ("FALSE"),
.RXRPDPD                  ("FALSE"),
.RXRSDPD                  ("FALSE"),
.TXAPD                    ("FALSE"),
.TXDIGPD                  ("FALSE"),
.TXLVLSHFTPD              ("FALSE"),
.TXPD                     ("FALSE"),
.TXPOST_TAP_PD            (TXPOST_TAP_PD_P),
.TXPRE_TAP_PD             ("TRUE"),

    // Preemphasis and Equalization
.RXAFEEQ                  (RXAFEEQ),
.RXEQ                     (RXEQ),
.TXDAT_PRDRV_DAC          (TXDAT_PRDRV_DAC),
.TXDAT_TAP_DAC            (TXDAT_TAP_DAC),    
.TXHIGHSIGNALEN           (TXHIGHSIGNALEN),
.TXPOST_PRDRV_DAC         (TXPOST_PRDRV_DAC),
.TXPOST_TAP_DAC           (TXPOST_TAP_DAC),   
.TXPRE_PRDRV_DAC          (TXPRE_PRDRV_DAC),
.TXPRE_TAP_DAC            (TXPRE_TAP_DAC),

    // PLL Settings 
.PMACLKENABLE             ("TRUE"),
.PMACOREPWRENABLE         ("TRUE"),
.PMAVBGCTRL               (5'b00000),
.RXACTST                  ("FALSE"),       
.RXAFETST                 ("FALSE"),      
.RXCMADJ                  (2'b01),
.RXCPTST                  ("FALSE"),
.RXFECONTROL1             (2'b00), 
.RXFECONTROL2             (3'b000), 
.RXFETUNE                 (2'b01), 
.RXPDDTST                 ("TRUE"),      
.RXRIBADJ                 (2'b11),

    // Biasing 
.BANDGAPSEL               ("FALSE"),
.BIASRESSEL               ("FALSE"),  
.IREFBIASMODE             (2'b11),
.PMAIREFTRIM              (4'b0111),
.PMAVREFTRIM              (4'b0111),
.TXAREFBIASSEL            ("TRUE"), 
.TXTERMTRIM               (4'b1100),
.VREFBIASMODE             (2'b11),

    //-------------- Restricted: Frequency Detector and Calibration -----------   
      
.CYCLE_LIMIT_SEL          (2'b00),
.FDET_HYS_CAL             (3'b010),
.FDET_HYS_SEL             (3'b100),
.FDET_LCK_CAL             (3'b101),
.FDET_LCK_SEL             (3'b001),
.LOOPCAL_WAIT             (2'b00),
.RXCYCLE_LIMIT_SEL        (2'b00),
.RXFDET_HYS_CAL           (3'b010),
.RXFDET_HYS_SEL           (3'b100),
.RXFDET_LCK_CAL           (3'b101),
.RXFDET_LCK_SEL           (3'b001),
.RXLOOPCAL_WAIT           (2'b00),
.RXSLOWDOWN_CAL           (2'b00),
.SLOWDOWN_CAL             (2'b00),
.RXCPSEL                  ("FALSE"),
.RXCTRL1                  (10'h200),
.RXLKADJ                  (5'b00000),
.RXLOOPFILT               (4'b1111),
.RXRCPADJ                 (3'b011),
.RXVCO_CTRL_ENABLE        ("TRUE"),
.RXVCODAC_INIT            (10'b0000101001),
.TXCPSEL                  ("FALSE"),
.TXCTRL1                  (10'h200),
.TXLOOPFILT               (4'b1101),
.VCO_CTRL_ENABLE          ("TRUE"),
.VCODAC_INIT              (10'b0000101001),
.TXSLEWRATE               ("TRUE")
)
 MGT0
(
        //----------------------------- CRC Ports ------------------------------  

        .RXCRCCLK                    (tied_to_ground_i), 
        .RXCRCDATAVALID              (tied_to_ground_i), 
        .RXCRCDATAWIDTH              (tied_to_ground_vec_i[2:0]), 
        .RXCRCIN                     (tied_to_ground_vec_i[63:0]), 
        .RXCRCINIT                   (tied_to_ground_i), 
        .RXCRCINTCLK                 (tied_to_ground_i), 
        .RXCRCOUT                    ( ),                        
        .RXCRCPD                     (tied_to_ground_i), 
        .RXCRCRESET                  (tied_to_ground_i), 

        .TXCRCCLK                    (tied_to_ground_i), 
        .TXCRCDATAVALID              (tied_to_ground_i), 
        .TXCRCDATAWIDTH              (tied_to_ground_vec_i[2:0]), 
        .TXCRCIN                     (tied_to_ground_vec_i[63:0]), 
        .TXCRCINIT                   (tied_to_ground_i), 
        .TXCRCINTCLK                 (tied_to_ground_i), 
        .TXCRCOUT                    ( ),                        
        .TXCRCPD                     (tied_to_vcc_i),                       
        .TXCRCRESET                  (tied_to_ground_i), 

         //-------------------------- Calibration Ports ------------------------   

        .RXCALFAIL                   ( ),                       
        .RXCYCLELIMIT                ( ),                    
        .TXCALFAIL                   ( ),                         
        .TXCYCLELIMIT                ( ),                     

        //---------------------------- Serial Ports ----------------------------   

        .RX1N                        (MGT0_RX1N_IN), 
        .RX1P                        (MGT0_RX1P_IN), 
        .TX1N                        (MGT0_TX1N_OUT), 
        .TX1P                        (MGT0_TX1P_OUT),


        //----------------------------- PLL Lock -------------------------------   

        .RXLOCK                      (mgt0_rxlock_i),
        .TXLOCK                      (mgt0_txlock_i),  


        //------------------------------ Resets --------------------------------  

        .RXPMARESET                  (mgt0_rxpmareset_i), 
        .RXRESET                     (mgt0_rxpcs_reset_i), 
        .TXPMARESET                  (mgt0_txpmareset_i), 
        .TXRESET                     (mgt0_txpcs_reset_i), 

        //-------------------------- Synchronization ---------------------------   

        .RXSYNC                      (tied_to_ground_i), 
        .TXSYNC                      (tied_to_ground_i),    

        //-------------------------- Out of Band Signalling --------------------   

        .RXSIGDET                    ( ),                      
        .TXENOOB                     (tied_to_ground_i), 
 
        //------------------------------ Status --------------------------------   

        .RXBUFERR                    (MGT0_RXBUFERR_OUT), 
        .RXCLKSTABLE                 (tied_to_vcc_i), 
        .RXSTATUS                    (MGT0_RXSTATUS_OUT), 
        .TXBUFERR                    (MGT0_TXBUFERR_OUT), 
        .TXCLKSTABLE                 (tied_to_vcc_i), 
  
        //-------------------------- Polarity Control Ports -------------------- 

        .RXPOLARITY                  (MGT0_RXPOLARITY_IN), 
        .TXINHIBIT                   (MGT0_TXINHIBIT_IN), 
        .TXPOLARITY                  (MGT0_TXPOLARITY_IN), 

        //----------------------------- Channel Bonding Ports ------------------   

        .CHBONDI                     (tied_to_ground_vec_i[4:0]),
        .CHBONDO                     (mgt0_chbondo_i),
        .ENCHANSYNC                  (MGT0_ENCHANSYNC_IN), 
 
        //-------------------------- 64B66B Blocks Use Ports -------------------   

        .RXBLOCKSYNC64B66BUSE        (tied_to_ground_i), 
        .RXDEC64B66BUSE              (tied_to_ground_i), 
        .RXDESCRAM64B66BUSE          (tied_to_ground_i), 
        .RXIGNOREBTF                 (tied_to_ground_i),   
        .TXENC64B66BUSE              (tied_to_ground_i), 
        .TXGEARBOX64B66BUSE          (tied_to_ground_i), 
        .TXSCRAM64B66BUSE            (tied_to_ground_i), 

        //-------------------------- 8B10B Blocks Use Ports --------------------   

        .RXDEC8B10BUSE               (tied_to_vcc_i), 
        .TXBYPASS8B10B               (mgt0_txbypass8b10b_i), 
        .TXENC8B10BUSE               (mgt0_txenc8b10buse_i), 

        //---------------------------- Transmit Control Ports ------------------   
        .TXCHARDISPMODE              ({tied_to_ground_vec_i[3:0],MGT0_TXCHARDISPMODE_IN[3:0]}), 
        .TXCHARDISPVAL               ({tied_to_ground_vec_i[3:0],MGT0_TXCHARDISPVAL_IN[3:0]}), 
        .TXCHARISK                   ({tied_to_ground_vec_i[3:0],MGT0_TXCHARISK_IN[3:0]}), 
        .TXKERR                      ({mgt0_txkerr_out_float_i[3:0],MGT0_TXKERR_OUT[3:0]}),                   
        .TXRUNDISP                   ({mgt0_txrundisp_out_float_i[3:0],MGT0_TXRUNDISP_OUT[3:0]}),                

        //---------------------------- Receive Control Ports -------------------   

        .RXCHARISCOMMA               ({mgt0_rxchariscomma_out_float_i[3:0],MGT0_RXCHARISCOMMA_OUT[3:0]}), 
        .RXCHARISK                   ({mgt0_rxcharisk_out_float_i[3:0],MGT0_RXCHARISK_OUT[3:0]}), 
        .RXDISPERR                   ({mgt0_rxdisperr_out_float_i[3:0],MGT0_RXDISPERR_OUT[3:0]}), 
        .RXNOTINTABLE                ({mgt0_rxnotintable_out_float_i[3:0],MGT0_RXNOTINTABLE_OUT[3:0]}), 
        .RXRUNDISP                   ({mgt0_rxrundisp_out_float_i[3:0],MGT0_RXRUNDISP_OUT[3:0]}),            

        //----------------------------- Serdes Alignment -----------------------  

        .ENMCOMMAALIGN               (MGT0_ENMCOMMAALIGN_IN), 
        .ENPCOMMAALIGN               (MGT0_ENPCOMMAALIGN_IN),
        .RXCOMMADET                  ( ),                   
        .RXCOMMADETUSE               (tied_to_vcc_i), 
        .RXLOSSOFSYNC                ( ),           
        .RXREALIGN                   (MGT0_RXREALIGN_OUT), 
        .RXSLIDE                     (tied_to_ground_i), 

        //--------- Data Width Settings - Internal and fabric interface -------- 

        .RXDATAWIDTH                 (RXDATAWIDTH_P),        //parameter
        .RXINTDATAWIDTH              (RXINTDATAWIDTH_P),     //parameter 
        .TXDATAWIDTH                 (TXDATAWIDTH_P),        //parameter
        .TXINTDATAWIDTH              (TXINTDATAWIDTH_P),     //parameter 

        //----------------------------- Data Ports -----------------------------    

        .RXDATA                      ({mgt0_rxdata_out_float_i[31:0],MGT0_RXDATA_OUT[31:0]}), 
        .TXDATA                      ({tied_to_ground_vec_i[31:0],MGT0_TXDATA_IN[31:0]}), 

       //----------------------------- User Clocks -----------------------------   

        .RXMCLK                      ( ), 
        .RXPCSHCLKOUT                ( ), 
        .RXRECCLK1                   (MGT0_RXRECCLK1_OUT),   
        .RXRECCLK2                   (mgt0_rxrecclk2_i),     
        .RXUSRCLK                    (MGT0_RXUSRCLK_IN), 
        .RXUSRCLK2                   (MGT0_RXUSRCLK2_IN), 
        .TXOUTCLK1                   (mgt0_txoutclk1_i), 
        .TXOUTCLK2                   (MGT0_TXOUTCLK2_OUT), 
        .TXPCSHCLKOUT                ( ),
        .TXUSRCLK                    (MGT0_TXUSRCLK_IN), 
        .TXUSRCLK2                   (MGT0_TXUSRCLK2_IN), 


        //-------------------------- Reference Clocks --------------------------   

        .GREFCLK                     (MGT0_GREFCLK_IN), 
        .REFCLK1                     (MGT0_REFCLK1_IN),        
        .REFCLK2                     (MGT0_REFCLK2_IN), 

        //-------------------------- Powerdown and Loopback Ports --------------  

        .LOOPBACK                    (mgt0_loopback_i), 
        .POWERDOWN                   (MGT0_POWERDOWN_IN),

       //----------------- Dynamic Reconfiguration Port (DRP) ------------------
 
        .DADDR                       (mgt0_daddr_i),  
        .DCLK                        (MGT0_DCLK_IN), 
        .DEN                         (mgt0_den_i), 
        .DI                          (mgt0_di_i),    
        .DO                          (mgt0_do_i),                             
        .DRDY                        (mgt0_drdy_i),                            
        .DWE                         (mgt0_dwe_i), 

           //------------------- MGT Tile Communication Ports ------------------       

        .COMBUSIN                    (MGT0_COMBUSIN_IN), 
        .COMBUSOUT                   (MGT0_COMBUSOUT_OUT) 
    );

    
    //Drive the MGT output clocks to their respective output ports
    assign  MGT0_RXRECCLK2_OUT   =   mgt0_rxrecclk2_i;

    assign  MGT0_TXOUTCLK1_OUT   =   mgt0_txoutclk1_i;



    //----------------------------- Calibration Block --------------------------



    aurora_cal_block_v1_4_1 #(
        .C_MGT_ID         (LANE0_MGT_ID_P),     //0=A, 1=B
        .C_RXDIGRX        ("FALSE"),
        .C_TXPOST_TAP_PD  (TXPOST_TAP_PD_P)
    )
    calblock_0_i
    (
        // User DRP Interface (destination/slave interface)
        .USER_DO        ( ),
        .USER_DI        (tied_to_ground_vec_i[15:0]),
        .USER_DADDR     (tied_to_ground_vec_i[7:0]),
        .USER_DEN       (tied_to_ground_i),
        .USER_DWE       (tied_to_ground_i),
        .USER_DRDY      ( ),

        // MGT DRP Interface (source/master interface)
        .GT_DO          (mgt0_di_i),
        .GT_DI          (mgt0_do_i),
        .GT_DADDR       (mgt0_daddr_i),
        .GT_DEN         (mgt0_den_i),
        .GT_DWE         (mgt0_dwe_i),
        .GT_DRDY        (mgt0_drdy_i),

        // DRP Clock and Reset
        .DCLK           (MGT0_DCLK_IN),
        .RESET          (MGT0_DRP_RESET_IN),

        // Calibration Block Active Signal (legacy)
        .ACTIVE         (MGT0_ACTIVE_OUT),

        .USER_LOOPBACK  (MGT0_USER_LOOPBACK),
        .USER_TXENC8B10BUSE (tied_to_vcc_i),
        .USER_TXBYPASS8B10B ({tied_to_ground_vec_i[3:0],MGT0_TXBYPASS8B10B_IN[3:0]}),


        .GT_LOOPBACK  (mgt0_loopback_i),
        .GT_TXENC8B10BUSE (mgt0_txenc8b10buse_i),
        .GT_TXBYPASS8B10B (mgt0_txbypass8b10b_i),


        // Signal Detect Ports
        .TX_SIGNAL_DETECT (MGT0_TX_SIGNAL_DETECT_IN),
        .RX_SIGNAL_DETECT (MGT0_RX_SIGNAL_DETECT_IN)

      
    );

     //  ------------- reset module integration-----------------------


    GT11_INIT_TX #
    (
        .C_SIMULATION (SIMULATION_P)
    )
    gt11_init_tx_0_i
    (
        .CLK          (MGT0_DCLK_IN),
        .USER_CLK     (MGT0_RXUSRCLK_IN),
        .START_INIT   (MGT0_TXPMARESET_IN),
        .USRCLK_STABLE(MGT0_DCM_IS_LOCKED),
        .LOCK         (mgt0_txlock_i),
        .PCS_ERROR    (MGT0_PCS_ERROR_IN),
        .PMA_RESET    (mgt0_txpmareset_i),
        .PCS_RESET    (mgt0_gt11_txpcsreset_i),
        .READY        (MGT0_TXPMA_READY_OUT)
    );


    GT11_INIT_RX #
    (
        .C_SIMULATION (SIMULATION_P)
    )
    gt11_init_rx_0_i
    (
        .CLK          (MGT0_DCLK_IN),
        .USER_CLK     (MGT0_RXUSRCLK_IN),
        .START_INIT   (MGT0_RXPMARESET_IN),
        .USRCLK_STABLE(MGT0_DCM_IS_LOCKED),
        .LOCK         (mgt0_rxlock_i),
        .PCS_ERROR    (MGT0_PCS_ERROR_IN),
        .PMA_RESET    (mgt0_rxpmareset_i),
        .PCS_RESET    (mgt0_gt11_rxpcsreset_i),
        .READY        (MGT0_RXPMA_READY_OUT)
    );


endmodule

///////////////////////////////////////////////////////////////////////////////
//$Date: 2009/09/08 16:23:49 $
//$RCSfile: mgt_wrapper.ejava,v $
//$Revision: 1.3 $
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps

module GT11_INIT_TX #(
    parameter       C_SIMULATION = 0  // set to 1 for simulation
)
(
    input           CLK,
    input           USER_CLK,
    input           START_INIT,

    input           LOCK,
    input           USRCLK_STABLE,
    input           PCS_ERROR,

    output   reg       PMA_RESET,
    output   reg       PCS_RESET,
    output   reg       READY

);

//********************************Parameter Declarations**********************

//----------------------------------------------------------------------------
// Delays - these numbers are defined by the number of USRCLK needed in each
//          state for each reset.  Refer to the User Guide on the block
//          diagrams on the reset and the required delay.
//----------------------------------------------------------------------------
parameter C_DELAY_PMA_RESET = 3;
parameter C_DELAY_PCS_RESET = 3;
parameter C_DELAY_LOCK = 16;
parameter C_DELAY_WAIT_PCS = 5;
parameter C_DELAY_WAIT_READY = 64;

parameter C_PCS_ERROR_COUNT = 16;

//----------------------------------------------------------------------------
// GT11 Initialization FSM
//----------------------------------------------------------------------------
parameter C_RESET         = 7'b0000001;
parameter C_PMA_RESET     = 7'b0000010;
parameter C_WAIT_LOCK     = 7'b0000100;
parameter C_PCS_RESET     = 7'b0001000;
parameter C_WAIT_PCS      = 7'b0010000;
parameter C_ALMOST_READY  = 7'b0100000;
parameter C_READY         = 7'b1000000;

//*******************************Register Declarations************************

reg           lock_r;

reg           pcs_error_r1;
reg           pcs_error_1;
reg           pcs_error_r2;

reg   [2:0]   pma_reset_count_r;
reg   [2:0]   pcs_reset_count_r;
reg   [3:0]   wait_pcs_count_r;
reg   [4:0]   pcs_error_count_r;
reg   [7:0]   wait_ready_count_r;

reg   [6:0]   init_state_r;
reg   [6:0]   init_next_state_r;

reg [40*7:0]  init_fsm_name;
reg           usrclk_stable_r;

//*******************************Wire Declarations****************************

wire          pcs_reset_c;
wire          pma_reset_c;
wire          pma_reset_done_i;
wire          ready_c;
wire          sync_c;



wire          pcs_reset_done_i;
wire          wait_pcs_done_i;
wire          pcs_error_count_done_i;
wire          wait_ready_done_i;

//*******************************Main Body of Code****************************

//----------------------------------------------------------------------------
// Synchronize LOCK
//----------------------------------------------------------------------------
always @(posedge CLK or posedge START_INIT)
    if (START_INIT)
        lock_r <= 1'b0;
    else
        lock_r <= LOCK;
 
//----------------------------------------------------------------------------
// Synchronize USRCLK_STABLE
//----------------------------------------------------------------------------
always @(posedge CLK or posedge START_INIT)
    if (START_INIT)
        usrclk_stable_r <= 1'b0;
    else
        usrclk_stable_r <= USRCLK_STABLE;

//----------------------------------------------------------------------------
// Synchronize PCS error and generate a pulse when PCS error is high
//----------------------------------------------------------------------------

always @(posedge CLK or posedge START_INIT)
    if (START_INIT) 
        pcs_error_1 <= 1'b0;
    else 
        pcs_error_1 <= PCS_ERROR;
always @(posedge CLK or posedge START_INIT)
    if (START_INIT) 
        pcs_error_r1 <= 1'b0;
    else 
        pcs_error_r1 <= pcs_error_1;


//----------------------------------------------------------------------------
// Ready, PMA and PCS reset signals
//----------------------------------------------------------------------------
always @(posedge CLK)
    PMA_RESET <= pma_reset_c;


always @(posedge CLK)
    PCS_RESET <= pcs_reset_c;

always @(posedge CLK)
    READY <= ready_c;

assign pma_reset_c = (init_state_r == C_PMA_RESET);
assign pcs_reset_c = (init_state_r == C_PCS_RESET);
assign ready_c = (init_state_r == C_READY);

//----------------------------------------------------------------------------
// Counter for holding PMA reset for an amount of C_DELAY_PMA_RESET
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_PMA_RESET))
        pma_reset_count_r <= C_DELAY_PMA_RESET;
    else
        pma_reset_count_r <= pma_reset_count_r - 1'b1;
end

assign pma_reset_done_i = (pma_reset_count_r == 1);



//----------------------------------------------------------------------------
// Counter for holding PCS reset for an amount of C_DELAY_PCS_RESET
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_PCS_RESET))
        pcs_reset_count_r <= C_DELAY_PCS_RESET;
    else
        pcs_reset_count_r <= pcs_reset_count_r - 1'b1;
end

assign pcs_reset_done_i = (pcs_reset_count_r == 1);

//----------------------------------------------------------------------------
// Counter for waiting C_DELAY_WAIT_PCS after de-assertion of PCS reset
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_WAIT_PCS))
        wait_pcs_count_r <= C_DELAY_WAIT_PCS;
    else
        wait_pcs_count_r <= wait_pcs_count_r - 1'b1;
end

assign wait_pcs_done_i = (wait_pcs_count_r == 1);

//----------------------------------------------------------------------------
// Counter for PCS error
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (init_state_r == C_PMA_RESET)
        pcs_error_count_r <= C_PCS_ERROR_COUNT;
    else if (((init_state_r == C_ALMOST_READY) | (init_state_r == C_READY)) & pcs_error_r1 & lock_r)
        pcs_error_count_r <= pcs_error_count_r - 1'b1;
end

assign pcs_error_count_done_i = (pcs_error_count_r == 1);

//----------------------------------------------------------------------------
// Counter for the READY signal
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_ALMOST_READY) || pcs_error_r1)
        wait_ready_count_r <= C_DELAY_WAIT_READY;
    else if (~pcs_error_r1)
        wait_ready_count_r <= wait_ready_count_r - 1'b1;
end

assign wait_ready_done_i = (wait_ready_count_r == 1);


//----------------------------------------------------------------------------
// GT11 Initialization FSM - This FSM is used to initialize the GT11 block
//   asserting the PMA and PCS reset in sequence.  It also takes into account
//   of any error that may happen during initialization.  The block uses
//   USRCLK as reference for the delay.  DO NOT use the output of the GT11
//   clocks for this reset module, as the output clocks may change when reset
//   is applied to the GT11.  Use a system clock, and make sure that the
//   wait time for each state equals the specified number of USRCLK cycles.
//
// The following steps are applied:
//   1. C_RESET:  Upon system reset of this block, PMA reset will be asserted
//   2. C_PMA_RESET:  PMA reset is held for 3 USRCLK cycles
//   3. C_WAIT_LOCK:  Wait for LOCK.  After LOCK is asserted, wait for the
//      USRCLK of the GT11s to be stable before going to the next state to
//      assert the PCS reset.  If LOCK gets de-asserted, we reset the counter
//      and wait for LOCK again.
//   4. C_PCS_RESET:  Assert PCS reset for 3 USRCLK cycles.  If LOCK gets
//      de-asserted, we go back to Step 3.
//   5. C_WAIT_PCS:  After de-assertion of PCS reset, wait 5 USRCLK cycles.
//      If LOCK gets de-asserted, we go back to Step 3.
//   6. C_ALMOST_READY:  Go to the Almost Ready state.  If LOCK gets
//      de-asserted, we go back to Step 3.  If there is a PCS error
//      (i.e. buffer error) detected while LOCK is high, we go back to Step 4.
//      If we cycle PCS reset for an N number of C_PCS_ERROR_COUNT, we go back
//      to Step 1 to do a PMA reset.
//   7. C_READY:  Go to the Ready state.  We reach this state after waiting
//      64 USRCLK cycles without any PCS errors.  We assert the READY signal
//      to denote that this block finishes initializing the GT11.  If there is
//      a PCS error during this state, we go back to Step 4.  If LOCK is lost,
//      we go back to Step 3.
//----------------------------------------------------------------------------
always @(posedge CLK or posedge START_INIT)
begin
    if (START_INIT)
        init_state_r <= C_RESET;
    else
        init_state_r <= init_next_state_r;
end

always @*
begin
    case (init_state_r)
        C_RESET: begin
            init_next_state_r <= C_PMA_RESET;
            init_fsm_name = "C_RESET";
        end

        C_PMA_RESET: begin
            init_next_state_r <= pma_reset_done_i ? C_WAIT_LOCK : C_PMA_RESET;
            init_fsm_name = "C_PMA_RESET";
        end

        C_WAIT_LOCK: begin
            init_next_state_r <= (lock_r & usrclk_stable_r) ?
                                  C_PCS_RESET : C_WAIT_LOCK;
            init_fsm_name = "C_WAIT_LOCK";
        end


        C_PCS_RESET: begin
            if (lock_r)
                init_next_state_r <= pcs_reset_done_i ?
                                     C_WAIT_PCS : C_PCS_RESET;
            else
                init_next_state_r <= C_WAIT_LOCK;
            init_fsm_name = "C_PCS_RESET";
        end

        C_WAIT_PCS: begin
            if (lock_r)
                init_next_state_r <= wait_pcs_done_i ?
                                     C_ALMOST_READY : C_WAIT_PCS;
            else
                init_next_state_r <= C_WAIT_LOCK;
            init_fsm_name = "C_WAIT_PCS";
        end

        C_ALMOST_READY: begin
            if (~lock_r)
                init_next_state_r <= C_WAIT_LOCK;
            else if (pcs_error_r1 & ~pcs_error_count_done_i)
                init_next_state_r <= C_PCS_RESET;
            else if (pcs_error_r1 & pcs_error_count_done_i)
                init_next_state_r <= C_PMA_RESET;
            else if (wait_ready_done_i)
                init_next_state_r <= C_READY;
            else
                init_next_state_r <= C_ALMOST_READY;
            init_fsm_name = "C_ALMOST_READY";
        end

        C_READY: begin
              if (lock_r & ~pcs_error_r1)
                init_next_state_r <= C_READY;
              else if (lock_r & pcs_error_r1)
                init_next_state_r <= C_PCS_RESET;
              else
                init_next_state_r <= C_WAIT_LOCK;
            init_fsm_name = "C_READY";
        end

        default: begin
            init_next_state_r <= C_RESET;
            init_fsm_name = "default";
        end

    endcase
end

endmodule


///////////////////////////////////////////////////////////////////////////////
//$Date: 2009/09/08 16:23:49 $
//$RCSfile: mgt_wrapper.ejava,v $
//$Revision: 1.3 $
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps

module GT11_INIT_RX #(
    parameter       C_SIMULATION = 0  // set to 1 for simulation
)
(
    input           CLK,
    input           USER_CLK,
    input           START_INIT,

    input           LOCK,
    input           USRCLK_STABLE,
    input           PCS_ERROR,

    output     reg     PMA_RESET,
    output     reg     PCS_RESET,
    output     reg     READY

);

//********************************Parameter Declarations**********************

//----------------------------------------------------------------------------
// Delays - these numbers are defined by the number of USRCLK needed in each
//          state for each reset.  Refer to the User Guide on the block
//          diagrams on the reset and the required delay.
//----------------------------------------------------------------------------
parameter C_DELAY_PMA_RESET = 3;
parameter C_DELAY_PCS_RESET = 3;
parameter C_DELAY_LOCK = 16;
parameter C_DELAY_WAIT_PCS = 5;
parameter C_DELAY_WAIT_READY = 64;

parameter C_PCS_ERROR_COUNT = 16;

//----------------------------------------------------------------------------
// GT11 Initialization FSM
//----------------------------------------------------------------------------
parameter C_RESET         = 7'b0000001;
parameter C_PMA_RESET     = 7'b0000010;
parameter C_WAIT_LOCK     = 7'b0000100;
parameter C_PCS_RESET     = 7'b0001000;
parameter C_WAIT_PCS      = 7'b0010000;
parameter C_ALMOST_READY  = 7'b0100000;
parameter C_READY         = 7'b1000000;

//*******************************Register Declarations************************

reg           lock_r;
reg           lock_r2;

reg           pcs_error_r1;
reg           pcs_error_1;
reg           pcs_error_r2;

reg   [2:0]   pma_reset_count_r;
reg   [2:0]   pcs_reset_count_r;
reg   [3:0]   wait_pcs_count_r;
reg   [4:0]   pcs_error_count_r;
reg   [7:0]   wait_ready_count_r;

reg   [6:0]   init_state_r;
reg   [6:0]   init_next_state_r;

reg [40*7:0]  init_fsm_name;
reg           usrclk_stable_r;

//*******************************Wire Declarations****************************

wire          pcs_reset_c;
wire          pma_reset_c;
wire          pma_reset_done_i;
wire          ready_c;
wire          sync_c;

wire          lock_pulse_i;
wire          lockupdate_ready_i;
wire          stage_1_enable_i;
wire          stage_2_enable_i;
wire          stage_3_enable_i;
wire          shift_register_1_enable_i;
wire          shift_register_2_enable_i;
wire          shift_register_3_enable_i;
wire          shift_register_0_d_i;
wire          shift_register_1_d_i;
wire          shift_register_2_d_i;
wire          shift_register_3_d_i;
wire          shift_register_0_q_i;
wire          shift_register_1_q_i;
wire          shift_register_2_q_i;
wire          shift_register_3_q_i;


wire          pcs_reset_done_i;
wire          wait_pcs_done_i;
wire          pcs_error_count_done_i;
wire          wait_ready_done_i;

//*******************************Main Body of Code****************************

//----------------------------------------------------------------------------
// Synchronize LOCK
//----------------------------------------------------------------------------
always @(posedge CLK or posedge START_INIT)
    if (START_INIT)
        lock_r <= 1'b0;
    else
        lock_r <= LOCK;

//----------------------------------------------------------------------------
// Synchronize USRCLK_STABLE
//----------------------------------------------------------------------------
always @(posedge CLK or posedge START_INIT)
    if (START_INIT)
        usrclk_stable_r <= 1'b0;
    else
        usrclk_stable_r <= USRCLK_STABLE;

//----------------------------------------------------------------------------
// Synchronize PCS error and generate a pulse when PCS error is high
//----------------------------------------------------------------------------
always @(posedge CLK or posedge START_INIT)
    if (START_INIT) 
        pcs_error_1 <= 1'b0;
    else 
        pcs_error_1 <= PCS_ERROR;
always @(posedge CLK or posedge START_INIT)
    if (START_INIT) 
        pcs_error_r1 <= 1'b0;
    else 
        pcs_error_r1 <= pcs_error_1;

//----------------------------------------------------------------------------
// Ready, PMA and PCS reset signals
//----------------------------------------------------------------------------
always @(posedge CLK)
    PMA_RESET <= pma_reset_c;


always @(posedge CLK)
    PCS_RESET <= pcs_reset_c;

always @(posedge CLK)
    READY <= ready_c;

assign pma_reset_c = (init_state_r == C_PMA_RESET);
assign pcs_reset_c = (init_state_r == C_PCS_RESET);
assign ready_c = (init_state_r == C_READY);

//----------------------------------------------------------------------------
// Counter for holding PMA reset for an amount of C_DELAY_PMA_RESET
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_PMA_RESET))
        pma_reset_count_r <= C_DELAY_PMA_RESET;
    else
        pma_reset_count_r <= pma_reset_count_r - 1'b1;
end

assign pma_reset_done_i = (pma_reset_count_r == 1);

generate
    if (C_SIMULATION) begin : for_simulation
        assign lockupdate_ready_i = 1'b1;
    end
    else begin: for_hardware
        //--------------------------------------------------------------------
        // Counter for the LOCKUPDATE cycles for RXLOCK:  This is built with
        // SRL16s.  Currently, we need to wait for 16 LOCKUPDATE cycles to
        // qualify the RXLOCK signal.  Each LOCKUPDATE = 1024 REFCLK cycles.
        // In this module, we assume 1 REFCLK = 1 USRCLK (please adjust the
        // address of the fourth SRL16 stage as neccessary).  The whole four
        // stages give 16,304 cycles of delay (16 * 16 * 16 * 4); note that
        // the last stage has an extra FF at the end.
        //---------------------------------------------------------------------
        // Create a pulse from RXLOCK to initialize SRL16's.  Need to register
        // the LOCK signal from the GT11 twice since the LOCK is based on
        // REFCLK
        always @(posedge CLK)
            lock_r2 <= lock_r; 

        assign lock_pulse_i = lock_r & ~lock_r2;
        
        // SRL16 Stage Zero - First stage of shifting
        assign shift_register_0_d_i = lock_r &
                                      (lock_pulse_i | stage_1_enable_i);

        SRL16E shift_register_0
        (
            .Q    (shift_register_0_q_i),
            .A0   (1'b0),
            .A1   (1'b1),
            .A2   (1'b1),
            .A3   (1'b1),
            .CE   (1'b1),
            .CLK  (CLK),
            .D    (shift_register_0_d_i)
            );

        FDE flop_stage_0
        (
            .Q  (stage_1_enable_i),
            .C  (CLK),
            .CE (1'b1),
            .D  (shift_register_0_q_i)
            );

        // SRL16 Stage One - Second stage of shifting
        assign shift_register_1_d_i = lock_r & (lock_pulse_i |
                                      (stage_1_enable_i & stage_2_enable_i));
        assign shift_register_1_enable_i = !lock_r2 | stage_1_enable_i;

        SRL16E shift_register_1
        (
            .Q    (shift_register_1_q_i),
            .A0   (1'b0),
            .A1   (1'b1),
            .A2   (1'b1),
            .A3   (1'b1),
            .CE   (shift_register_1_enable_i),
            .CLK  (CLK),
            .D    (shift_register_1_d_i)
            );

        FDE flop_stage_1
        (
            .Q  (stage_2_enable_i),
            .C  (CLK),
            .CE (shift_register_1_enable_i),
            .D  (shift_register_1_q_i)
            );

        // SRL16 Stage Two - Third stage of shifting
        assign shift_register_2_d_i = lock_r & (lock_pulse_i |
                                       (stage_1_enable_i & stage_2_enable_i &
                                       stage_3_enable_i));

        assign shift_register_2_enable_i = !lock_r2 |
                                    (stage_1_enable_i & stage_2_enable_i);

        SRL16E shift_register_2
        (
            .Q    (shift_register_2_q_i),
            .A0   (1'b0),
            .A1   (1'b1),
            .A2   (1'b1),
            .A3   (1'b1),
            .CE   (shift_register_2_enable_i),
            .CLK  (CLK),
            .D    (shift_register_2_d_i)
            );

        FDE flop_stage_2
        (
            .Q  (stage_3_enable_i),
            .C  (CLK),
            .CE (shift_register_2_enable_i),
            .D  (shift_register_2_q_i)
            );

        // SRL16 Stage Three - Fourth stage of shifting
        // LOCKUPDATE ready is redundant here in resetting the SRL16 since the
        // flop is already reset by RXLOCK from the MGT
        assign shift_register_3_d_i = lock_r & (lock_pulse_i | 
                                      (stage_1_enable_i & stage_2_enable_i &
                                       stage_3_enable_i & lockupdate_ready_i));

        assign shift_register_3_enable_i = !lock_r2 |
                                    (stage_1_enable_i & stage_2_enable_i &
                                     stage_3_enable_i & !lockupdate_ready_i);

        SRL16E shift_register_3
        (
            .Q    (shift_register_3_q_i),
            .A0   (1'b1),
            .A1   (1'b1),
            .A2   (1'b0),
            .A3   (1'b0),
            .CE   (shift_register_3_enable_i),
            .CLK  (CLK),
            .D    (shift_register_3_d_i)
            );

        FDRE flop_stage_3
        (
            .Q  (lockupdate_ready_i),
            .C  (CLK),
            .CE (shift_register_3_enable_i),
            .D  (shift_register_3_q_i),
            .R  (!lock_r)
            );
    end
endgenerate


//----------------------------------------------------------------------------
// Counter for holding PCS reset for an amount of C_DELAY_PCS_RESET
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_PCS_RESET))
        pcs_reset_count_r <= C_DELAY_PCS_RESET;
    else
        pcs_reset_count_r <= pcs_reset_count_r - 1'b1;
end

assign pcs_reset_done_i = (pcs_reset_count_r == 1);

//----------------------------------------------------------------------------
// Counter for waiting C_DELAY_WAIT_PCS after de-assertion of PCS reset
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_WAIT_PCS))
        wait_pcs_count_r <= C_DELAY_WAIT_PCS;
    else
        wait_pcs_count_r <= wait_pcs_count_r - 1'b1;
end

assign wait_pcs_done_i = (wait_pcs_count_r == 1);

//----------------------------------------------------------------------------
// Counter for PCS error
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (init_state_r == C_PMA_RESET)
        pcs_error_count_r <= C_PCS_ERROR_COUNT;
    else if (((init_state_r == C_ALMOST_READY) | (init_state_r == C_READY)) & pcs_error_r1 & lock_r)
        pcs_error_count_r <= pcs_error_count_r - 1'b1;
end

assign pcs_error_count_done_i = (pcs_error_count_r == 1);

//----------------------------------------------------------------------------
// Counter for the READY signal
//----------------------------------------------------------------------------
always @(posedge CLK)
begin
    if (!(init_state_r == C_ALMOST_READY) || pcs_error_r1)
        wait_ready_count_r <= C_DELAY_WAIT_READY;
    else if (~pcs_error_r1)
        wait_ready_count_r <= wait_ready_count_r - 1'b1;
end

assign wait_ready_done_i = (wait_ready_count_r == 1);


//----------------------------------------------------------------------------
// GT11 Initialization FSM - This FSM is used to initialize the GT11 block
//   asserting the PMA and PCS reset in sequence.  It also takes into account
//   of any error that may happen during initialization.  The block uses
//   USRCLK as reference for the delay.  DO NOT use the output of the GT11
//   clocks for this reset module, as the output clocks may change when reset
//   is applied to the GT11.  Use a system clock, and make sure that the
//   wait time for each state equals the specified number of USRCLK cycles.
//
// The following steps are applied:
//   1. C_RESET:  Upon system reset of this block, PMA reset will be asserted
//   2. C_PMA_RESET:  PMA reset is held for 3 USRCLK cycles
//   3. C_WAIT_LOCK:  Wait for LOCK.  After LOCK is asserted, wait for 16
//      LOCKUPDATE cycles and wait for the USRCLK of the GT11s to be stabled
//      before going to the next state to assert the PCS reset.  If LOCK gets
//      de-asserted, we reset the counter and wait for LOCK again.
//   4. C_PCS_RESET:  Assert PCS reset for 3 USRCLK cycles.  If LOCK gets
//      de-asserted, we go back to Step 3.
//   5. C_WAIT_PCS:  After de-assertion of PCS reset, wait 5 USRCLK cycles.
//      If LOCK gets de-asserted, we go back to Step 3.
//   6. C_ALMOST_READY:  Go to the Almost Ready state.  If LOCK gets
//      de-asserted, we go back to Step 3.  If there is a PCS error
//      (i.e. buffer error) detected while LOCK is high, we go back to Step 4.
//      If we cycle PCS reset for an N number of C_PCS_ERROR_COUNT, we go back
//      to Step 1 to do a PMA reset.
//   7. C_READY:  Go to the Ready state.  We reach this state after waiting
//      64 USRCLK cycles without any PCS errors.  We assert the READY signal
//      to denote that this block finishes initializing the GT11.  If there is
//      a PCS error during this state, we go back to Step 4.  If LOCK is lost,
//      we go back to Step 3.
//----------------------------------------------------------------------------
always @(posedge CLK or posedge START_INIT)
begin
    if (START_INIT)
        init_state_r <= C_RESET;
    else
        init_state_r <= init_next_state_r;
end

always @*
begin
    case (init_state_r)
        C_RESET: begin
            init_next_state_r <= C_PMA_RESET;
            init_fsm_name = "C_RESET";
        end

        C_PMA_RESET: begin
            init_next_state_r <= pma_reset_done_i ? C_WAIT_LOCK : C_PMA_RESET;
            init_fsm_name = "C_PMA_RESET";
        end

        C_WAIT_LOCK: begin
            init_next_state_r <= (lock_r & usrclk_stable_r &
                                  lockupdate_ready_i) ?
                                  C_PCS_RESET : C_WAIT_LOCK;
            init_fsm_name = "C_WAIT_LOCK";
        end


        C_PCS_RESET: begin
            if (lock_r)
                init_next_state_r <= pcs_reset_done_i ?
                                     C_WAIT_PCS : C_PCS_RESET;
            else
                init_next_state_r <= C_WAIT_LOCK;
            init_fsm_name = "C_PCS_RESET";
        end

        C_WAIT_PCS: begin
            if (lock_r)
                init_next_state_r <= wait_pcs_done_i ?
                                     C_ALMOST_READY : C_WAIT_PCS;
            else
                init_next_state_r <= C_WAIT_LOCK;
            init_fsm_name = "C_WAIT_PCS";
        end

        C_ALMOST_READY: begin
            if (~lock_r)
                init_next_state_r <= C_WAIT_LOCK;
            else if (pcs_error_r1 & ~pcs_error_count_done_i)
                init_next_state_r <= C_PCS_RESET;
            else if (pcs_error_r1 & pcs_error_count_done_i)
                init_next_state_r <= C_PMA_RESET;
            else if (wait_ready_done_i)
                init_next_state_r <= C_READY;
            else
                init_next_state_r <= C_ALMOST_READY;
            init_fsm_name = "C_ALMOST_READY";
        end

        C_READY: begin
              if (lock_r & ~pcs_error_r1)
                init_next_state_r <= C_READY;
              else if (lock_r & pcs_error_r1)
                init_next_state_r <= C_PCS_RESET;
              else
                init_next_state_r <= C_WAIT_LOCK;
            init_fsm_name = "C_READY";
        end

        default: begin
            init_next_state_r <= C_RESET;
            init_fsm_name = "default";
        end

    endcase
end

endmodule
