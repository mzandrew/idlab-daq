--
--      Project:  Aurora Module Generator version 3.0
--
--         Date:  $Date: 2008/07/21 10:19:47 $
--          Tag:  $Name: i+IP+144966 $
--         File:  $RCSfile: stream_top_4byte_vhd.ejava,v $
--          Rev:  $Revision: 1.1.2.2 $
--
--      Company:  Xilinx
--
--   Disclaimer:  XILINX IS PROVIDING THIS DESIGN, CODE, OR
--                INFORMATION "AS IS" SOLELY FOR USE IN DEVELOPING
--                PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY
--                PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
--                ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
--                APPLICATION OR STANDARD, XILINX IS MAKING NO
--                REPRESENTATION THAT THIS IMPLEMENTATION IS FREE
--                FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE
--                RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY
--                REQUIRE FOR YOUR IMPLEMENTATION.  XILINX
--                EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH
--                RESPECT TO THE ADEQUACY OF THE IMPLEMENTATION,
--                INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
--                REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
--                FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES
--                OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
--                PURPOSE.
--
--                (c) Copyright 2008 Xilinx, Inc.
--                All rights reserved.
--

--
--  Aurora
--
--
--
--  Description: This is the top level module for a 1 4-byte lane Aurora
--               reference design module. This module supports the following features:
--
--               * Supports Virtex 2 Pro
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.all;
-- synthesis translate_on

entity Aurora is
    generic (                    
            EXTEND_WATCHDOGS   : boolean := FALSE
    );
    port (

    -- TX Stream Interface

            TX_D                : in  std_logic_vector(0 to 31);
            TX_SRC_RDY_N        : in  std_logic;
            TX_DST_RDY_N        : out std_logic;

    -- RX Stream Interface

            RX_D                : out std_logic_vector(0 to 31);
            RX_SRC_RDY_N        : out std_logic;


    -- Clock Correction Interface

            DO_CC               : in  std_logic;
            WARN_CC             : in  std_logic;


    -- MGT Serial I/O

            RXP              : in std_logic;
            RXN              : in std_logic;
            TXP              : out std_logic;
            TXN              : out std_logic;

    -- MGT Reference Clock Interface

            BOTTOM_REF_CLK  : in std_logic;

    -- Error Detection Interface

            HARD_ERROR       : out std_logic;
            SOFT_ERROR       : out std_logic;

    -- Status

            CHANNEL_UP       : out std_logic;
            LANE_UP          : out std_logic;


    -- System Interface

            DCM_NOT_LOCKED   : in std_logic;
            USER_CLK         : in std_logic;
            USER_CLK_N_2X    : in std_logic;
            RESET            : in std_logic;
            POWER_DOWN       : in std_logic;
            LOOPBACK         : in std_logic_vector(1 downto 0)

         );

end Aurora;

architecture MAPPED of Aurora is

-- External Register Declarations --

    signal TXP_Buffer              : std_logic;
    signal TXN_Buffer              : std_logic;
    signal HARD_ERROR_Buffer       : std_logic;
    signal SOFT_ERROR_Buffer       : std_logic;
    signal CHANNEL_UP_Buffer       : std_logic;
    signal LANE_UP_Buffer          : std_logic;

-- Wire Declarations --

    signal rx_data_i              : std_logic_vector(31 downto 0);
    signal rx_not_in_table_i      : std_logic_vector(3 downto 0);
    signal rx_disp_err_i          : std_logic_vector(3 downto 0);
    signal rx_char_is_k_i         : std_logic_vector(3 downto 0);
    signal rx_char_is_comma_i     : std_logic_vector(3 downto 0);
    signal rx_buf_status_i        : std_logic;
    signal tx_buf_err_i           : std_logic;
    signal tx_k_err_i             : std_logic_vector(3 downto 0);
    signal rx_clk_cor_cnt_i       : std_logic_vector(2 downto 0);
    signal rx_realign_i           : std_logic;

    signal rx_polarity_i          : std_logic;
    signal rx_reset_i             : std_logic;
    signal tx_char_is_k_i         : std_logic_vector(3 downto 0);
    signal tx_data_i              : std_logic_vector(31 downto 0);
    signal tx_reset_i             : std_logic;

    signal ena_comma_align_i      : std_logic;

    signal gen_scp_i              : std_logic;
    signal genscp_lane_0_i        : std_logic_vector(0 to 1);

    signal gen_ecp_i              : std_logic;
    signal genecp_lane_0_i        : std_logic_vector(0 to 1);
    signal gen_pad_i              : std_logic_vector(0 to 1);
    signal tx_pe_data_i           : std_logic_vector(0 to 31);
    signal tx_pe_data_v_i         : std_logic_vector(0 to 1);
    signal gen_cc_i               : std_logic;

    signal rx_pad_i               : std_logic_vector(0 to 1);
    signal rx_pe_data_i           : std_logic_vector(0 to 31);
    signal rx_pe_data_v_i         : std_logic_vector(0 to 1);
    signal rx_scp_i               : std_logic_vector(0 to 1);
    signal rx_ecp_i               : std_logic_vector(0 to 1);

    signal gen_a_i                : std_logic;
    signal gen_k_i                : std_logic_vector(0 to 3);
    signal gen_r_i                : std_logic_vector(0 to 3);
    signal gen_v_i                : std_logic_vector(0 to 3);

    signal lane_up_i              : std_logic;
    signal soft_error_i           : std_logic_vector(0 to 1);
    signal hard_error_i           : std_logic;
    signal channel_bond_load_i    : std_logic;
    signal got_a_i                : std_logic_vector(0 to 3);
    signal got_v_i                : std_logic;

    signal reset_lanes_i          : std_logic;

    signal rx_rec_clk_i           : std_logic;
    signal ena_calign_rec_i       : std_logic;

    signal genpad_lane_0_i        : std_logic_vector(0 to 1);
    signal txpedata_lane_0_i      : std_logic_vector(0 to 31);
    signal txpedatav_lane_0_i     : std_logic_vector(0 to 1);
    signal refclksel_lane_0_i     : std_logic;

    signal rxbufstatus_lane_0_i   : std_logic_vector(0 to 1);
    signal rxpad_lane_0_i         : std_logic_vector(0 to 1);
    signal rxpedata_lane_0_i      : std_logic_vector(0 to 31);
    signal rxpedatav_lane_0_i     : std_logic_vector(0 to 1);
    signal rxscp_lane_0_i         : std_logic_vector(0 to 1);
    signal rxecp_lane_0_i         : std_logic_vector(0 to 1);

    signal ch_bond_done_i         : std_logic;
    signal en_chan_sync_i         : std_logic;
    signal channel_up_i           : std_logic;
    signal start_rx_i             : std_logic;

    signal chbondi_not_used_i     : std_logic_vector(3 downto 0);
    signal chbondo_not_used_i     : std_logic_vector(3 downto 0);



    signal tied_to_ground_i       : std_logic;
    signal tied_to_ground_v2_i    : std_logic_vector(0 to 1);
    signal tied_to_ground_v4_i    : std_logic_vector(0 to 3);
    signal tied_to_ground_v8_i    : std_logic_vector(0 to 7);
    signal tied_to_vcc_i          : std_logic;
    signal system_reset_c         : std_logic;


-- Component Declarations --



    component Aurora_AURORA_LANE_4BYTE
        generic (                    
                EXTEND_WATCHDOGS   : boolean := FALSE
        );
        port (

        -- MGT Interface

                RX_DATA           : in std_logic_vector(31 downto 0);  -- 4-byte data bus from the MGT.
                RX_NOT_IN_TABLE   : in std_logic_vector(3 downto 0);   -- Invalid 10-bit code was recieved.
                RX_DISP_ERR       : in std_logic_vector(3 downto 0);   -- Disparity error detected on RX interface.
                RX_CHAR_IS_K      : in std_logic_vector(3 downto 0);   -- Indicates which bytes of RX_D are control.
                RX_CHAR_IS_COMMA  : in std_logic_vector(3 downto 0);   -- Comma received on given byte.
                RX_BUF_STATUS     : in std_logic;                      -- Overflow/Underflow of RX buffer detected.
                TX_BUF_ERR        : in std_logic;                      -- Overflow/Underflow of TX buffer detected.
                TX_K_ERR          : in std_logic_vector(3 downto 0);   -- Attempt to send bad control byte detected.
                RX_CLK_COR_CNT    : in std_logic_vector(2 downto 0);   -- Value used to determine channel bonding status.
                RX_REALIGN        : in std_logic;                      -- SERDES was realigned because of a new comma.
                RX_POLARITY       : out std_logic;                     -- Controls interpreted polarity of serial data inputs.
                RX_RESET          : out std_logic;                     -- Reset RX side of MGT logic.
                TX_CHAR_IS_K      : out std_logic_vector(3 downto 0);  -- TX_D byte is a control character.
                TX_DATA           : out std_logic_vector(31 downto 0); -- 4-byte data bus to the MGT.
                TX_RESET          : out std_logic;                     -- Reset TX side of MGT logic.

        -- Comma Detect Phase Align Interface

                ENA_COMMA_ALIGN   : out std_logic;                     -- Request comma alignment.

        -- TX_LL Interface

                GEN_SCP           : in std_logic_vector(0 to 1);       -- SCP generation request from TX_LL.
                GEN_ECP           : in std_logic_vector(0 to 1);       -- ECP generation request from TX_LL.
                GEN_PAD           : in std_logic_vector(0 to 1);       -- PAD generation request from TX_LL.
                TX_PE_DATA        : in std_logic_vector(0 to 31);      -- Data from TX_LL to send over lane.
                TX_PE_DATA_V      : in std_logic_vector(0 to 1);       -- Indicates TX_PE_DATA is Valid.
                GEN_CC            : in std_logic;                      -- CC generation request from TX_LL.

        -- RX_LL Interface

                RX_PAD            : out std_logic_vector(0 to 1);      -- Indicates lane received PAD.
                RX_PE_DATA        : out std_logic_vector(0 to 31);     -- RX data from lane to RX_LL.
                RX_PE_DATA_V      : out std_logic_vector(0 to 1);      -- RX_PE_DATA is data, not control symbol.
                RX_SCP            : out std_logic_vector(0 to 1);      -- Indicates lane received SCP.
                RX_ECP            : out std_logic_vector(0 to 1);      -- Indicates lane received ECP.

        -- Global Logic Interface

                GEN_A             : in std_logic;                      -- 'A character' generation request from Global Logic.
                GEN_K             : in std_logic_vector(0 to 3);       -- 'K character' generation request from Global Logic.
                GEN_R             : in std_logic_vector(0 to 3);       -- 'R character' generation request from Global Logic.
                GEN_V             : in std_logic_vector(0 to 3);       -- Verification data generation request.
                LANE_UP           : out std_logic;                     -- Lane is ready for bonding and verification.
                SOFT_ERROR        : out std_logic_vector(0 to 1);      -- Soft error detected.
                HARD_ERROR        : out std_logic;                     -- Hard error detected.
                CHANNEL_BOND_LOAD : out std_logic;                     -- Channel Bongding done code recieved.
                GOT_A             : out std_logic_vector(0 to 3);      -- Indicates lane recieved 'A character' bytes.
                GOT_V             : out std_logic;                     -- Verification symbols received.

        -- System Interface

                USER_CLK          : in std_logic;                      -- System clock for all non-MGT Aurora Logic.
                RESET             : in std_logic                       -- Reset the lane.

             );

    end component;

    component Aurora_PHASE_ALIGN

        port (

        -- Aurora Lane Interface

                ENA_COMMA_ALIGN : in std_logic;

        -- MGT Interface

                RX_REC_CLK      : in std_logic;
                ENA_CALIGN_REC  : out std_logic

             );

    end component;


    component GT_CUSTOM


        generic (

                    ALIGN_COMMA_MSB          : boolean;
                    CHAN_BOND_MODE           : string;
                    CHAN_BOND_ONE_SHOT       : boolean;
                    CHAN_BOND_SEQ_1_1        : bit_vector;
                    REF_CLK_V_SEL            : integer;
                    CLK_COR_INSERT_IDLE_FLAG : boolean;
                    CLK_COR_KEEP_IDLE        : boolean;
                    CLK_COR_REPEAT_WAIT      : integer;
                    CLK_COR_SEQ_1_1          : bit_vector;
                    CLK_COR_SEQ_1_2          : bit_vector;
                    CLK_COR_SEQ_1_3          : bit_vector;
                    CLK_COR_SEQ_1_4          : bit_vector;
                    CLK_COR_SEQ_2_USE        : boolean;
                    CLK_COR_SEQ_LEN          : integer;
                    CLK_CORRECT_USE          : boolean;
                    COMMA_10B_MASK           : bit_vector;
                    MCOMMA_10B_VALUE         : bit_vector;
                    PCOMMA_10B_VALUE         : bit_vector;
                    RX_CRC_USE               : boolean;
                    RX_DATA_WIDTH            : integer;
                    RX_LOSS_OF_SYNC_FSM      : boolean;
                    RX_LOS_INVALID_INCR      : integer;
                    RX_LOS_THRESHOLD         : integer;
                    SERDES_10B               : boolean;
                    TERMINATION_IMP          : integer;
                    TX_CRC_USE               : boolean;
                    TX_DATA_WIDTH            : integer;
                    TX_DIFF_CTRL             : integer;
                    TX_PREEMPHASIS           : integer

                );
        port (

                CHBONDDONE     : out std_logic;
                CHBONDO        : out std_logic_vector(3 downto 0);
                CONFIGOUT      : out std_logic;
                RXBUFSTATUS    : out std_logic_vector(1 downto 0);
                RXCHARISCOMMA  : out std_logic_vector(3 downto 0);
                RXCHARISK      : out std_logic_vector(3 downto 0);
                RXCHECKINGCRC  : out std_logic;
                RXCLKCORCNT    : out std_logic_vector(2 downto 0);
                RXCOMMADET     : out std_logic;
                RXCRCERR       : out std_logic;
                RXDATA         : out std_logic_vector(31 downto 0);
                RXDISPERR      : out std_logic_vector(3 downto 0);
                RXLOSSOFSYNC   : out std_logic_vector(1 downto 0);
                RXNOTINTABLE   : out std_logic_vector(3 downto 0);
                RXREALIGN      : out std_logic;
                RXRECCLK       : out std_logic;
                RXRUNDISP      : out std_logic_vector(3 downto 0);
                TXBUFERR       : out std_logic;
                TXKERR         : out std_logic_vector(3 downto 0);
                TXN            : out std_logic;
                TXP            : out std_logic;
                TXRUNDISP      : out std_logic_vector(3 downto 0);
                BREFCLK        : in std_logic;
                BREFCLK2       : in std_logic;
                CHBONDI        : in std_logic_vector(3 downto 0);
                CONFIGENABLE   : in std_logic;
                CONFIGIN       : in std_logic;
                ENCHANSYNC     : in std_logic;
                ENMCOMMAALIGN  : in std_logic;
                ENPCOMMAALIGN  : in std_logic;
                LOOPBACK       : in std_logic_vector(1 downto 0);
                POWERDOWN      : in std_logic;
                REFCLK         : in std_logic;
                REFCLK2        : in std_logic;
                REFCLKSEL      : in std_logic;
                RXN            : in std_logic;
                RXP            : in std_logic;
                RXPOLARITY     : in std_logic;
                RXRESET        : in std_logic;
                RXUSRCLK       : in std_logic;
                RXUSRCLK2      : in std_logic;
                TXBYPASS8B10B  : in std_logic_vector(3 downto 0);
                TXCHARDISPMODE : in std_logic_vector(3 downto 0);
                TXCHARDISPVAL  : in std_logic_vector(3 downto 0);
                TXCHARISK      : in std_logic_vector(3 downto 0);
                TXDATA         : in std_logic_vector(31 downto 0);
                TXFORCECRCERR  : in std_logic;
                TXINHIBIT      : in std_logic;
                TXPOLARITY     : in std_logic;
                TXRESET        : in std_logic;
                TXUSRCLK       : in std_logic;
                TXUSRCLK2      : in std_logic

             );

    end component;


    component Aurora_GLOBAL_LOGIC
        generic (                    
                EXTEND_WATCHDOGS   : boolean := FALSE
        );
        port (

        -- MGT Interface

                CH_BOND_DONE       : in std_logic;
                EN_CHAN_SYNC       : out std_logic;

        -- Aurora Lane Interface

                LANE_UP            : in std_logic;
                SOFT_ERROR         : in std_logic_vector(0 to 1);
                HARD_ERROR         : in std_logic;
                CHANNEL_BOND_LOAD  : in std_logic;
                GOT_A              : in std_logic_vector(0 to 3);
                GOT_V              : in std_logic;
                GEN_A              : out std_logic;
                GEN_K              : out std_logic_vector(0 to 3);
                GEN_R              : out std_logic_vector(0 to 3);
                GEN_V              : out std_logic_vector(0 to 3);
                RESET_LANES        : out std_logic;

        -- System Interface

                USER_CLK           : in std_logic;
                RESET              : in std_logic;
                POWER_DOWN         : in std_logic;
                CHANNEL_UP         : out std_logic;
                START_RX           : out std_logic;
                CHANNEL_SOFT_ERROR : out std_logic;
                CHANNEL_HARD_ERROR : out std_logic

             );

    end component;


    component Aurora_TX_STREAM
    port
    (
        -- Data interface
        TX_D                : in  std_logic_vector(0 to 31);
        TX_SRC_RDY_N        : in  std_logic;
        TX_DST_RDY_N        : out std_logic;


        -- Global Logic Interface
        CHANNEL_UP      : in  std_logic;


        -- Clock Correction Interface
        DO_CC           : in  std_logic;
        WARN_CC         : in  std_logic;


        -- Aurora Lane Interface
        GEN_SCP         : out std_logic;
        GEN_ECP         : out std_logic;
        TX_PE_DATA_V    : out std_logic_vector(0 to 1);
        GEN_PAD         : out std_logic_vector(0 to 1);
        TX_PE_DATA      : out std_logic_vector(0 to 31);
        GEN_CC          : out std_logic;


        -- System Interface
        USER_CLK        : in  std_logic


    );
    end component;


    component Aurora_RX_STREAM
    port
    (
        -- LocalLink PDU Interface
        RX_D                : out std_logic_vector(0 to 31);
        RX_SRC_RDY_N        : out std_logic;


        -- Global Logic Interface
        START_RX        : in  std_logic;


        -- Aurora Lane Interface
        RX_PAD          : in  std_logic_vector(0 to 1);
        RX_PE_DATA      : in  std_logic_vector(0 to 31);
        RX_PE_DATA_V    : in  std_logic_vector(0 to 1);
        RX_SCP          : in  std_logic_vector(0 to 1);
        RX_ECP          : in  std_logic_vector(0 to 1);


        -- System Interface
        USER_CLK        : in  std_logic


    );
    end component;






begin


    TXP              <= TXP_Buffer;
    TXN              <= TXN_Buffer;
    HARD_ERROR       <= HARD_ERROR_Buffer;
    SOFT_ERROR       <= SOFT_ERROR_Buffer;
    CHANNEL_UP       <= CHANNEL_UP_Buffer;
    LANE_UP          <= LANE_UP_Buffer;

-- Main Body of Code --

    tied_to_ground_i    <= '0';
    tied_to_ground_v2_i <= "00";
    tied_to_ground_v4_i <= "0000";
    tied_to_ground_v8_i <= "00000000";
    tied_to_vcc_i       <= '1';
    chbondi_not_used_i  <= "0000";

    CHANNEL_UP_Buffer <= channel_up_i;
    system_reset_c    <= RESET or DCM_NOT_LOCKED;

    Aurora_lane_phase_align_i : Aurora_PHASE_ALIGN

        port map (

        -- Aurora Lane Interface

                    ENA_COMMA_ALIGN => ena_comma_align_i,

        -- MGT Interface

                    RX_REC_CLK      => rx_rec_clk_i,
                    ENA_CALIGN_REC  => ena_calign_rec_i

                 );

    -- Instantiate Lane 0 --

    LANE_UP_Buffer <= lane_up_i;

    genscp_lane_0_i <= gen_scp_i & '0';

    genecp_lane_0_i <= '0' & gen_ecp_i;

    genpad_lane_0_i    <= gen_pad_i(0) & gen_pad_i(1);
    txpedata_lane_0_i  <= tx_pe_data_i(0 to 15) & tx_pe_data_i(16 to 31);
    txpedatav_lane_0_i <= tx_pe_data_v_i(0) & tx_pe_data_v_i(1);

    rx_pad_i(0)            <= rxpad_lane_0_i(0);
    rx_pad_i(1)            <= rxpad_lane_0_i(1);
    rx_pe_data_i(0 to 15)  <= rxpedata_lane_0_i(0 to 15);
    rx_pe_data_i(16 to 31) <= rxpedata_lane_0_i(16 to 31);
    rx_pe_data_v_i(0)      <= rxpedatav_lane_0_i(0);
    rx_pe_data_v_i(1)      <= rxpedatav_lane_0_i(1);
    rx_scp_i(0)            <= rxscp_lane_0_i(0);
    rx_scp_i(1)            <= rxscp_lane_0_i(1);
    rx_ecp_i(0)            <= rxecp_lane_0_i(0);
    rx_ecp_i(1)            <= rxecp_lane_0_i(1);


    Aurora_aurora_lane_4byte_0_i : Aurora_AURORA_LANE_4BYTE
        generic map (                    
                EXTEND_WATCHDOGS        => EXTEND_WATCHDOGS
        )
        port map (

        -- MGT Interface

                    RX_DATA           => rx_data_i(31 downto 0),
                    RX_NOT_IN_TABLE   => rx_not_in_table_i(3 downto 0),
                    RX_DISP_ERR       => rx_disp_err_i(3 downto 0),
                    RX_CHAR_IS_K      => rx_char_is_k_i(3 downto 0),
                    RX_CHAR_IS_COMMA  => rx_char_is_comma_i(3 downto 0),
                    RX_BUF_STATUS     => rx_buf_status_i,
                    TX_BUF_ERR        => tx_buf_err_i,
                    TX_K_ERR          => tx_k_err_i(3 downto 0),
                    RX_CLK_COR_CNT    => rx_clk_cor_cnt_i(2 downto 0),
                    RX_REALIGN        => rx_realign_i,
                    RX_POLARITY       => rx_polarity_i,
                    RX_RESET          => rx_reset_i,
                    TX_CHAR_IS_K      => tx_char_is_k_i(3 downto 0),
                    TX_DATA           => tx_data_i(31 downto 0),
                    TX_RESET          => tx_reset_i,

        -- Comma Detect Phase Align Interface

                    ENA_COMMA_ALIGN   => ena_comma_align_i,

        -- TX_LL Interface
                    GEN_SCP           => genscp_lane_0_i,
                    GEN_ECP           => genecp_lane_0_i,
                    GEN_PAD           => genpad_lane_0_i,
                    TX_PE_DATA        => txpedata_lane_0_i,
                    TX_PE_DATA_V      => txpedatav_lane_0_i,
                    GEN_CC            => gen_cc_i,

        -- RX_LL Interface

                    RX_PAD            => rxpad_lane_0_i,
                    RX_PE_DATA        => rxpedata_lane_0_i,
                    RX_PE_DATA_V      => rxpedatav_lane_0_i,
                    RX_SCP            => rxscp_lane_0_i,
                    RX_ECP            => rxecp_lane_0_i,

        -- Global Logic Interface

                    GEN_A             => gen_a_i,
                    GEN_K             => gen_k_i(0 to 3),
                    GEN_R             => gen_r_i(0 to 3),
                    GEN_V             => gen_v_i(0 to 3),
                    LANE_UP           => lane_up_i,
                    SOFT_ERROR        => soft_error_i(0 to 1),
                    HARD_ERROR        => hard_error_i,
                    CHANNEL_BOND_LOAD => channel_bond_load_i,
                    GOT_A             => got_a_i(0 to 3),
                    GOT_V             => got_v_i,

        -- System Interface

                    USER_CLK          => USER_CLK,
                    RESET             => reset_lanes_i

                 );

    refclksel_lane_0_i <= '0';

    rx_buf_status_i <= rxbufstatus_lane_0_i(0);


    lane_0_mgt_i : GT_CUSTOM

    -- Lane 0 MGT attributes

            generic map (
                            ALIGN_COMMA_MSB          => TRUE,
                            CHAN_BOND_MODE           => "OFF",
                            CHAN_BOND_ONE_SHOT       => FALSE,
                            CHAN_BOND_SEQ_1_1        => "00101111100",
                            REF_CLK_V_SEL            => 0,
                            CLK_COR_INSERT_IDLE_FLAG => FALSE,
                            CLK_COR_KEEP_IDLE        => FALSE,
                            CLK_COR_REPEAT_WAIT      => 8,
                            CLK_COR_SEQ_1_1          => "00111110111",
                            CLK_COR_SEQ_1_2          => "00111110111",
                            CLK_COR_SEQ_1_3          => "00111110111",
                            CLK_COR_SEQ_1_4          => "00111110111",
                            CLK_COR_SEQ_2_USE        => FALSE,
                            CLK_COR_SEQ_LEN          => 4,
                            CLK_CORRECT_USE          => TRUE,
                            COMMA_10B_MASK           => "1111111111",
                            MCOMMA_10B_VALUE         => "1100000101",
                            PCOMMA_10B_VALUE         => "0011111010",
                            RX_CRC_USE               => FALSE,
                            RX_DATA_WIDTH            => 4,
                            RX_LOSS_OF_SYNC_FSM      => FALSE,
                            RX_LOS_INVALID_INCR      => 1,
                            RX_LOS_THRESHOLD         => 4,
                            SERDES_10B               => FALSE,
                            TERMINATION_IMP          => 50,
                            TX_CRC_USE               => FALSE,
                            TX_DATA_WIDTH            => 4,
                            TX_DIFF_CTRL             => 600,
                            TX_PREEMPHASIS           => 1

                        )
        port map (

        -- Aurora Lane Interface

                    RXPOLARITY     => rx_polarity_i,
                    RXRESET        => rx_reset_i,
                    TXCHARISK      => tx_char_is_k_i(3 downto 0),
                    TXDATA         => tx_data_i(31 downto 0),
                    TXRESET        => tx_reset_i,
                    RXDATA         => rx_data_i(31 downto 0),
                    RXNOTINTABLE   => rx_not_in_table_i(3 downto 0),
                    RXDISPERR      => rx_disp_err_i(3 downto 0),
                    RXCHARISK      => rx_char_is_k_i(3 downto 0),
                    RXCHARISCOMMA  => rx_char_is_comma_i(3 downto 0),
                    RXBUFSTATUS    => rxbufstatus_lane_0_i,
                    TXBUFERR       => tx_buf_err_i,
                    TXKERR         => tx_k_err_i(3 downto 0),
                    RXCLKCORCNT    => rx_clk_cor_cnt_i(2 downto 0),
                    RXREALIGN      => rx_realign_i,

        -- Phase Align Interface

                    ENMCOMMAALIGN  => ena_calign_rec_i,
                    ENPCOMMAALIGN  => ena_calign_rec_i,
                    RXRECCLK       => rx_rec_clk_i,

        -- Global Logic Interface

                    ENCHANSYNC     => tied_to_ground_i,
                    CHBONDDONE     => ch_bond_done_i,

        -- Peer Channel Bonding Interface

                    CHBONDI        => chbondi_not_used_i,
                    CHBONDO        => chbondo_not_used_i(3 downto 0),

        -- Unused MGT Ports

                    CONFIGOUT      => open,
                    RXCHECKINGCRC  => open,
                    RXCOMMADET     => open,
                    RXCRCERR       => open,
                    RXLOSSOFSYNC   => open,
                    RXRUNDISP      => open,
                    TXRUNDISP      => open,

        -- Fixed MGT settings for Aurora

                    TXBYPASS8B10B  => tied_to_ground_v4_i,
                    TXCHARDISPMODE => tied_to_ground_v4_i,
                    TXCHARDISPVAL  => tied_to_ground_v4_i,
                    CONFIGENABLE   => tied_to_ground_i,
                    CONFIGIN       => tied_to_ground_i,
                    TXFORCECRCERR  => tied_to_ground_i,
                    TXINHIBIT      => tied_to_ground_i,
                    TXPOLARITY     => tied_to_ground_i,

        -- Serial IO

                    RXN            => RXN,
                    RXP            => RXP,
                    TXN            => TXN_Buffer,
                    TXP            => TXP_Buffer,

        -- Reference Clocks and User Clock

                    RXUSRCLK       => USER_CLK_N_2X,
                    RXUSRCLK2      => USER_CLK,
                    TXUSRCLK       => USER_CLK_N_2X,
                    TXUSRCLK2      => USER_CLK,
                    BREFCLK        => tied_to_ground_i,
                    BREFCLK2       => tied_to_ground_i,
                    REFCLK         => BOTTOM_REF_CLK,
                    REFCLK2        => tied_to_ground_i,
                    REFCLKSEL      => refclksel_lane_0_i,

        -- System Interface

                    LOOPBACK       => LOOPBACK,
                    POWERDOWN      => POWER_DOWN

                 );



    -- Instantiate Global Logic to combine Lanes into a Channel --

    Aurora_global_logic_i : Aurora_GLOBAL_LOGIC
        generic map (                    
                EXTEND_WATCHDOGS       => EXTEND_WATCHDOGS
        )
        port map (

        -- MGT Interface

                    CH_BOND_DONE       => ch_bond_done_i,
                    EN_CHAN_SYNC       => en_chan_sync_i,

        -- Aurora Lane Interface

                    LANE_UP            => lane_up_i,
                    SOFT_ERROR         => soft_error_i,
                    HARD_ERROR         => hard_error_i,
                    CHANNEL_BOND_LOAD  => channel_bond_load_i,
                    GOT_A              => got_a_i,
                    GOT_V              => got_v_i,
                    GEN_A              => gen_a_i,
                    GEN_K              => gen_k_i,
                    GEN_R              => gen_r_i,
                    GEN_V              => gen_v_i,
                    RESET_LANES        => reset_lanes_i,

        -- System Interface

                    USER_CLK           => USER_CLK,
                    RESET              => system_reset_c,
                    POWER_DOWN         => POWER_DOWN,
                    CHANNEL_UP         => channel_up_i,
                    START_RX           => start_rx_i,
                    CHANNEL_SOFT_ERROR => SOFT_ERROR_Buffer,
                    CHANNEL_HARD_ERROR => HARD_ERROR_Buffer

                 );



    -- Instantiate TX_STREAM --

    Aurora_tx_stream_i : Aurora_TX_STREAM
    port map
    (
        -- Data interface
        TX_D            =>  TX_D,
        TX_SRC_RDY_N    =>  TX_SRC_RDY_N,
        TX_DST_RDY_N    =>  TX_DST_RDY_N,


        -- Global Logic Interface
        CHANNEL_UP      =>  channel_up_i,


        -- Clock Correction Interface
        DO_CC           =>  DO_CC,
        WARN_CC         =>  WARN_CC,


        -- Aurora Lane Interface
        GEN_SCP         =>  gen_scp_i,
        GEN_ECP         =>  gen_ecp_i,
        TX_PE_DATA_V    =>  tx_pe_data_v_i,
        GEN_PAD         =>  gen_pad_i,
        TX_PE_DATA      =>  tx_pe_data_i,
        GEN_CC          =>  gen_cc_i,


        -- System Interface
        USER_CLK        =>  USER_CLK

    );




    -- Instantiate RX_STREAM --

    Aurora_rx_stream_i : Aurora_RX_STREAM
    port map
    (
        -- LocalLink PDU Interface
        RX_D                =>  RX_D,
        RX_SRC_RDY_N        =>  RX_SRC_RDY_N,

        -- Global Logic Interface
        START_RX        =>  start_rx_i,


        -- Aurora Lane Interface
        RX_PAD          =>  rx_pad_i,
        RX_PE_DATA      =>  rx_pe_data_i,
        RX_PE_DATA_V    =>  rx_pe_data_v_i,
        RX_SCP          =>  rx_scp_i,
        RX_ECP          =>  rx_ecp_i,


        -- System Interface
        USER_CLK        =>  USER_CLK

    );

end MAPPED;
