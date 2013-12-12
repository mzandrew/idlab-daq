
///////////////////////////////////////////////////////////////////////////////
//
// Project:  Aurora Module Generator version 3.1
//
//    Date:  $Date: 2009/09/08 16:23:50 $
//     Tag:  $Name: i+O-61x+189894 $
//    File:  $RCSfile: unused_mgt_v4.ejava,v $
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


`timescale 1ns / 1ps


//***************************** Entity Declaration *****************************
module aurora_UNUSED_MGT 
(
    
    //________________________________________________________________________
    //________________________________________________________________________
    //MGT0  

    //------------------------ Calibration Block Ports -------------------------
    MGT0_ACTIVE_OUT,
    MGT0_DRP_RESET_IN,
    MGT0_RX_SIGNAL_DETECT_IN,
    MGT0_TX_SIGNAL_DETECT_IN,
    //------------------- Dynamic Reconfiguration Port (DRP) -------------------
    MGT0_DCLK_IN,
    //-------------------------------- PLL Lock --------------------------------
    MGT0_RXLOCK_OUT,
    MGT0_TXLOCK_OUT,
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
    //------------------------------ Serial Ports ------------------------------
    MGT0_RX1N_IN,
    MGT0_RX1P_IN,
    MGT0_TX1N_OUT,
    MGT0_TX1P_OUT

);


//***************************** Port Declarations ******************************
        


    //__________________________________________________________________________
    //__________________________________________________________________________
    //MGT0

    //------------------------ Calibration Block Ports -------------------------
    output              MGT0_ACTIVE_OUT;
    input               MGT0_DRP_RESET_IN;
    input               MGT0_RX_SIGNAL_DETECT_IN;
    input               MGT0_TX_SIGNAL_DETECT_IN;
    //------------------- Dynamic Reconfiguration Port (DRP) -------------------
    input               MGT0_DCLK_IN;
    //-------------------------------- PLL Lock --------------------------------
    output              MGT0_RXLOCK_OUT;
    output              MGT0_TXLOCK_OUT;
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
    //------------------------------ Serial Ports ------------------------------
    input               MGT0_RX1N_IN;
    input               MGT0_RX1P_IN;
    output              MGT0_TX1N_OUT;
    output              MGT0_TX1P_OUT;




//************************** Parameter Declarations ****************************

    parameter   TXPOST_TAP_PD_P     =   "FALSE";    // Default is false, set to FALSE for serial loopback or tuned preemphasis 
    
    parameter   RXDATAWIDTH_P       =   2'b10;
    parameter   RXINTDATAWIDTH_P    =   2'b11;
    parameter   TXDATAWIDTH_P       =   2'b10;
    parameter   TXINTDATAWIDTH_P    =   2'b11;
    
    parameter   GT11_MODE_P         =   "A";        // Default Location  
    parameter   MGT_ID_P            =   1;          // 0=A, 1=B
    parameter   RXPMACLKSEL_PARAM   =   "REFCLK1";
    parameter   TXABPMACLKSEL_PARAM =   "REFCLK1";


//***************************** Wire Declarations ******************************

    // ground and vcc signals
    wire               tied_to_ground_i;
    wire    [63:0]     tied_to_ground_vec_i;
    wire               tied_to_vcc_i;
    wire    [63:0]     tied_to_vcc_vec_i;

    // calblock connection signals
    wire    [7:0]      mgt0_daddr_i;
    wire               mgt0_den_i;
    wire    [15:0]     mgt0_di_i;
    wire    [15:0]     mgt0_do_i;
    wire               mgt0_drdy_i;
    wire               mgt0_dwe_i;
    wire               mgt0_rxlock_i;
    wire               mgt0_txlock_i;
    wire    [1:0]      mgt0_loopback_i;
    wire               mgt0_txenc8b10buse_i;
    wire    [7:0]      mgt0_txbypass8b10b_i;
    wire               mgt0_rxpmareset_i;
    wire               mgt0_txpmareset_i;
    wire               mgt0_txoutclk1_i;
    wire               mgt0_rxrecclk2_i;





//***************************** Main Body of Code ******************************


    //-------------------------  Static signal Assigments ----------------------   
    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;
    assign MGT0_RXLOCK_OUT              = mgt0_rxlock_i;
    assign MGT0_TXLOCK_OUT              = mgt0_txlock_i;



    //__________________________________________________________________________
    //__________________________________________________________________________
    //MGT0

    


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
.RXPMACLKSEL             (RXPMACLKSEL_PARAM),
.RXRECCLK1_USE_SYNC      ("FALSE"),
.RXUSRDIVISOR            (1),
.TX_CLOCK_DIVIDER        (2'b00),
.TXABPMACLKSEL           (TXABPMACLKSEL_PARAM),
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
.MCOMMA_32B_VALUE        (32'h00000283),
.MCOMMA_DETECT           ("FALSE"),
.PCOMMA_32B_VALUE        (32'h0000017c),
.PCOMMA_DETECT           ("FALSE"),
.PCS_BIT_SLIP            ("FALSE"),
  
    //-- RocketIO MGT Atrributes Common to Clk Correction & Channel Bonding ----   

.CCCB_ARBITRATOR_DISABLE ("FALSE"),
.CLK_COR_8B10B_DE        ("TRUE"),


    //---------------- RocketIO MGT Clock Correction Atrributes ----------------   

.CLK_COR_MAX_LAT         (48),
.CLK_COR_MIN_LAT         (36),
.CLK_COR_SEQ_1_1         (11'b00111110111),
.CLK_COR_SEQ_1_2         (11'b00111110111),
.CLK_COR_SEQ_1_3         (11'b00000000000),
.CLK_COR_SEQ_1_4         (11'b00000000000),
.CLK_COR_SEQ_1_MASK      (4'b1100),
.CLK_COR_SEQ_2_1         (11'b00000000000),
.CLK_COR_SEQ_2_2         (11'b00000000000),
.CLK_COR_SEQ_2_3         (11'b00000000000),
.CLK_COR_SEQ_2_4         (11'b00000000000),
.CLK_COR_SEQ_2_MASK      (4'b1111),
.CLK_COR_SEQ_2_USE       ("FALSE"),
.CLK_COR_SEQ_DROP        ("FALSE"),
.CLK_COR_SEQ_LEN         (2),
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

.GT11_MODE               (GT11_MODE_P),
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

     //  Frequency Detector and Calibration   

.CYCLE_LIMIT_SEL          (2'b00),
.FDET_HYS_CAL             (3'b010),
.FDET_HYS_SEL             (3'b001),
.FDET_LCK_CAL             (3'b101),
.FDET_LCK_SEL             (3'b111),
.LOOPCAL_WAIT             (2'b00),
.RXCYCLE_LIMIT_SEL        (2'b00),
.RXFDET_HYS_CAL           (3'b010),
.RXFDET_HYS_SEL           (3'b001),
.RXFDET_LCK_CAL           (3'b101),  
.RXFDET_LCK_SEL           (3'b100),
.RXLOOPCAL_WAIT           (2'b00),
.RXSLOWDOWN_CAL           (2'b00),
.SLOWDOWN_CAL             (2'b00),

    // Preemphasis and Equalization

.RXAFEEQ                  (9'b000000000),
.RXEQ                     (64'h4000000000000000),
.TXDAT_PRDRV_DAC          (3'b111),
.TXDAT_TAP_DAC            (5'b01010),    
.TXHIGHSIGNALEN           ("TRUE"),
.TXPOST_PRDRV_DAC         (3'b111),
.TXPOST_TAP_DAC           (5'b00001),   
.TXPRE_PRDRV_DAC          (3'b111),
.TXPRE_TAP_DAC            (5'b00000),

    // PLL Settings 

.PMACLKENABLE             ("TRUE"),
.PMACOREPWRENABLE         ("TRUE"),
.PMAVBGCTRL               (5'b00000),
.RXACTST                  ("FALSE"),       
.RXAFETST                 ("FALSE"),      
.RXCMADJ                  (2'b10),
.RXCPSEL                  ("FALSE"),
.RXCPTST                  ("FALSE"),
.RXCTRL1                  (10'h200),
.RXFECONTROL1             (2'b00), 
.RXFECONTROL2             (3'b000), 
.RXFETUNE                 (2'b01), 
.RXLKADJ                  (5'b00000),
.RXLOOPFILT               (4'b1111),
.RXPDDTST                 ("TRUE"),      
.RXRCPADJ                 (3'b010), 
.RXRIBADJ                 (2'b11),
.RXVCO_CTRL_ENABLE        ("TRUE"),
.RXVCODAC_INIT            (10'b0001010001),    
.TXCPSEL                  ("TRUE"),
.TXCTRL1                  (10'h200),
.TXLOOPFILT               (4'b0101),   
.VCO_CTRL_ENABLE          ("TRUE"),
.VCODAC_INIT              (10'b0001010001),  

    // Biasing 

.BANDGAPSEL               ("FALSE"),
.BIASRESSEL               ("FALSE"),    
.IREFBIASMODE             (2'b11),
.PMAIREFTRIM              (4'b0111),
.PMAVREFTRIM              (4'b0111),
.TXAREFBIASSEL            ("TRUE"), 
.TXTERMTRIM               (4'b1100),
.VREFBIASMODE             (2'b11)
) MGT0

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

        .RXPMARESET                  (MGT0_RXPMARESET_IN), 
        .RXRESET                     (MGT0_RXRESET_IN), 
        .TXPMARESET                  (MGT0_TXPMARESET_IN), 
        .TXRESET                     (MGT0_TXRESET_IN), 

        //-------------------------- Synchronization ---------------------------   

        .RXSYNC                      (tied_to_ground_i), 
        .TXSYNC                      (tied_to_ground_i),    

        //-------------------------- Out of Band Signalling --------------------   

        .RXSIGDET                    (),                      
        .TXENOOB                     (tied_to_ground_i), 
 
        //------------------------------ Status --------------------------------   

        .RXBUFERR                    (), 
        .RXCLKSTABLE                 (tied_to_vcc_i), 
        .RXSTATUS                    (), 
        .TXBUFERR                    (), 
        .TXCLKSTABLE                 (tied_to_vcc_i), 
  
        //-------------------------- Polarity Control Ports -------------------- 

        .RXPOLARITY                  (tied_to_ground_i), 
        .TXINHIBIT                   (tied_to_ground_i), 
        .TXPOLARITY                  (tied_to_ground_i), 

        //----------------------------- Channel Bonding Ports ------------------   

        .CHBONDI                     (tied_to_ground_vec_i[4:0]), 
        .CHBONDO                     (), 
        .ENCHANSYNC                  (tied_to_ground_i), 
 
        //-------------------------- 64B66B Blocks Use Ports -------------------   

        .RXBLOCKSYNC64B66BUSE        (tied_to_ground_i), 
        .RXDEC64B66BUSE              (tied_to_ground_i), 
        .RXDESCRAM64B66BUSE          (tied_to_ground_i), 
        .RXIGNOREBTF                 (tied_to_ground_i),   
        .TXENC64B66BUSE              (tied_to_ground_i), 
        .TXGEARBOX64B66BUSE          (tied_to_ground_i), 
        .TXSCRAM64B66BUSE            (tied_to_ground_i), 

        //-------------------------- 8B10B Blocks Use Ports --------------------   

        .RXDEC8B10BUSE               (tied_to_ground_i), 
        .TXBYPASS8B10B               (mgt0_txbypass8b10b_i), 
        .TXENC8B10BUSE               (mgt0_txenc8b10buse_i), 

        //---------------------------- Transmit Control Ports ------------------   
        .TXCHARDISPMODE              (tied_to_ground_vec_i[7:0]), 
        .TXCHARDISPVAL               (tied_to_ground_vec_i[7:0]), 
        .TXCHARISK                   (tied_to_ground_vec_i[7:0]), 
        .TXKERR                      (),                   
        .TXRUNDISP                   (),                

        //---------------------------- Receive Control Ports -------------------   

        .RXCHARISCOMMA               (), 
        .RXCHARISK                   (), 
        .RXDISPERR                   (), 
        .RXNOTINTABLE                (), 
        .RXRUNDISP                   (),            

        //----------------------------- Serdes Alignment -----------------------  

        .ENMCOMMAALIGN               (tied_to_ground_i), 
        .ENPCOMMAALIGN               (tied_to_ground_i),
        .RXCOMMADET                  (),                   
        .RXCOMMADETUSE               (tied_to_ground_i), 
        .RXLOSSOFSYNC                (),           
        .RXREALIGN                   (), 
        .RXSLIDE                     (tied_to_ground_i), 

        //--------- Data Width Settings - Internal and fabric interface -------- 

        .RXDATAWIDTH                 (RXDATAWIDTH_P),        //parameter
        .RXINTDATAWIDTH              (RXINTDATAWIDTH_P),     //parameter 
        .TXDATAWIDTH                 (TXDATAWIDTH_P),        //parameter
        .TXINTDATAWIDTH              (TXINTDATAWIDTH_P),     //parameter 

        //----------------------------- Data Ports -----------------------------    

        .RXDATA                      (), 
        .TXDATA                      (tied_to_ground_vec_i[63:0]), 

       //----------------------------- User Clocks -----------------------------   

        .RXMCLK                      (), 
        .RXPCSHCLKOUT                (), 
        .RXRECCLK1                   (),     
        .RXRECCLK2                   (mgt0_rxrecclk2_i),     
        .RXUSRCLK                    (tied_to_ground_i), 
        .RXUSRCLK2                   (tied_to_ground_i), 
        .TXOUTCLK1                   (mgt0_txoutclk1_i), 
        .TXOUTCLK2                   (), 
        .TXPCSHCLKOUT                (),
        .TXUSRCLK                    (tied_to_ground_i), 
        .TXUSRCLK2                   (tied_to_ground_i), 


        //-------------------------- Reference Clocks --------------------------   

        .GREFCLK                     (MGT0_GREFCLK_IN), 
        .REFCLK1                     (MGT0_REFCLK1_IN),        
        .REFCLK2                     (MGT0_REFCLK2_IN), 

        //-------------------------- Powerdown and Loopback Ports --------------  

        .LOOPBACK                    (mgt0_loopback_i), 
        .POWERDOWN                   (tied_to_ground_i),

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







    //----------------------------- Calibration Block --------------------------


    aurora_cal_block_v1_4_1 #(
        .C_MGT_ID         (MGT_ID_P),                              //0=A, 1=B
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

        // Calibration Block Active and Disable Signals (legacy)
        .ACTIVE         (MGT0_ACTIVE_OUT),

        .USER_LOOPBACK  (tied_to_ground_vec_i[1:0]),
        .USER_TXENC8B10BUSE (tied_to_ground_i),
        .USER_TXBYPASS8B10B (tied_to_ground_vec_i[7:0]),

        .GT_LOOPBACK  (mgt0_loopback_i),
        .GT_TXENC8B10BUSE (mgt0_txenc8b10buse_i),
        .GT_TXBYPASS8B10B (mgt0_txbypass8b10b_i),

        // Signal Detect Ports
        .TX_SIGNAL_DETECT (MGT0_TX_SIGNAL_DETECT_IN),
        .RX_SIGNAL_DETECT (MGT0_RX_SIGNAL_DETECT_IN)

    );




endmodule
