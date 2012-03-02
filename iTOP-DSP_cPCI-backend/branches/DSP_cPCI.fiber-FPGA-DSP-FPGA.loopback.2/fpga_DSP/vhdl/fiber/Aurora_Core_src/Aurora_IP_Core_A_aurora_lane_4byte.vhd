------------------------------------------------------------------------------
-- (c) Copyright 2008 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- 
------------------------------------------------------------------------------/
--
--  AURORA_LANE_4BYTE
--
--
--  Description: the AURORA_LANE_4BYTE module provides a full duplex 4-byte
--               aurora lane connection using a single GTX.  The module handles
--               lane initialization, symbol generation and decoding and error
--               detection.  It also decodes some of the channel bonding
--               indicator signals needed by the Global logic.
--
--               * Supports Virtex-5 
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.AURORA_PKG.all;

entity Aurora_IP_Core_A_AURORA_LANE_4BYTE is

    port (

    -- GTX Interface

            RX_DATA             : in  std_logic_vector(31 downto 0);    -- 4-byte data bus from the GTX.
            RX_NOT_IN_TABLE     : in  std_logic_vector(3 downto 0);     -- Invalid 10-bit code was recieved.
            RX_DISP_ERR         : in  std_logic_vector(3 downto 0);     -- Disparity error detected on RX interface.
            RX_CHAR_IS_K        : in  std_logic_vector(3 downto 0);     -- Indicates which bytes of RX_DATA are control.
            RX_CHAR_IS_COMMA    : in  std_logic_vector(3 downto 0);     -- Comma received on given byte.
            RX_STATUS           : in  std_logic_vector(5 downto 0);     -- Part of GT_11 status and error bus
            RX_BUF_ERR          : in  std_logic;                        -- Overflow/Underflow of RX buffer detected.
            TX_BUF_ERR          : in  std_logic;                        -- Overflow/Underflow of TX buffer detected.
            RX_REALIGN          : in  std_logic;                        -- SERDES was realigned because of a new comma.
            RX_POLARITY         : out std_logic;                        -- Controls interpreted polarity of serial data inputs.
            RX_RESET            : out std_logic;                        -- Reset RX side of GTX logic.
            TX_CHAR_IS_K        : out std_logic_vector(3 downto 0);     -- TX_DATA byte is a control character.
            TX_DATA             : out std_logic_vector(31 downto 0);    -- 4-byte data bus to the GTX.
            TX_RESET            : out std_logic;                        -- Reset TX side of GTX logic.

    -- Comma Detect Phase Align Interface

            ENA_COMMA_ALIGN     : out std_logic;                        -- Request comma alignment.

    -- TX_LL Interface

            GEN_SCP             : in  std_logic_vector(0 to 1);         -- SCP generation request from TX_LL.
            GEN_ECP             : in  std_logic_vector(0 to 1);         -- ECP generation request from TX_LL.
            GEN_PAD             : in  std_logic_vector(0 to 1);         -- PAD generation request from TX_LL
            TX_PE_DATA          : in  std_logic_vector(0 to 31);        -- Data from TX_LL to send over lane.
            TX_PE_DATA_V        : in  std_logic_vector(0 to 1);         -- Indicates TX_PE_DATA is Valid.
            GEN_CC              : in  std_logic;                        -- CC generation request from TX_LL.

    -- RX_LL Interface

            RX_PAD              : out std_logic_vector(0 to 1);         -- Indicates lane received PAD.
            RX_PE_DATA          : out std_logic_vector(0 to 31);        -- RX data from lane to RX_LL.
            RX_PE_DATA_V        : out std_logic_vector(0 to 1);         -- RX_PE_DATA is data, not control symbol.
            RX_SCP              : out std_logic_vector(0 to 1);         -- Indicates lane received SCP.
            RX_ECP              : out std_logic_vector(0 to 1);         -- Indicates lane received ECP

    -- Global Logic Interface

            GEN_A               : in  std_logic;                        -- 'A character' generation request from Global Logic.
            GEN_K               : in  std_logic_vector(0 to 3);         -- 'K character' generation request from Global Logic.
            GEN_R               : in  std_logic_vector(0 to 3);         -- 'R character' generation request from Global Logic.
            GEN_V               : in  std_logic_vector(0 to 3);         -- Verification data generation request.
            LANE_UP             : out std_logic;                        -- Lane is ready for bonding and verification.
            SOFT_ERR          : out std_logic_vector(0 to 1);         -- Soft error detected.
            HARD_ERR          : out std_logic;                        -- Hard error detected.
            CHANNEL_BOND_LOAD   : out std_logic;                        -- Channel Bongding done code recieved.
            GOT_A               : out std_logic_vector(0 to 3);         -- Indicates lane recieved 'A character' bytes.
            GOT_V               : out std_logic;                        -- Verification symbols received.

    -- System Interface

            USER_CLK            : in  std_logic;                        -- System clock for all non-GTX Aurora Logic.
            RESET_SYMGEN        : in  std_logic;                        -- Reset the SYM_GEN module.
            RESET               : in  std_logic;                        -- Reset the lane.

	 -- State machine monitoring (added by Kurtis)
				LANE_INIT_STATE     : out std_logic_vector(6 downto 0)

         );

end Aurora_IP_Core_A_AURORA_LANE_4BYTE;

architecture RTL of Aurora_IP_Core_A_AURORA_LANE_4BYTE is

-- Wire Declarations --

    signal  ena_comma_align_i     : std_logic;
    signal  gen_sp_i              : std_logic;
    signal  gen_spa_i             : std_logic;
    signal  rx_sp_i               : std_logic;
    signal  rx_spa_i              : std_logic;
    signal  rx_neg_i              : std_logic;
    signal  enable_err_detect_i : std_logic;
    signal  do_word_align_i       : std_logic;
    signal  hard_err_reset_i    : std_logic;
    
    signal  tx_char_is_k_i        : std_logic_vector(3 downto 0);
    signal  tx_data_i             : std_logic_vector(31 downto 0);
    signal  rx_data_i             : std_logic_vector(31 downto 0);
    signal  rx_char_is_k_i        : std_logic_vector(3 downto 0);
    signal  rx_char_is_comma_i    : std_logic_vector(3 downto 0);
    signal  rx_disp_err_i         : std_logic_vector(3 downto 0);
    signal  rx_not_in_table_i     : std_logic_vector(3 downto 0);
    signal  LANE_UP_Buffer        : std_logic;

-- Component Declarations --

    component Aurora_IP_Core_A_LANE_INIT_SM_4BYTE

        port (

        -- GTX Interface

                RX_NOT_IN_TABLE     : in std_logic_vector(3 downto 0); -- GTX received invalid 10b code
                RX_DISP_ERR         : in std_logic_vector(3 downto 0); -- GTX received 10b code w/ wrong disparity
                RX_CHAR_IS_COMMA    : in std_logic_vector(3 downto 0); -- GTX received a Comma
                RX_REALIGN          : in std_logic;                    -- GTX had to change alignment due to new comma
                RX_RESET            : out std_logic;                   -- Reset the RX side of the GTX
                TX_RESET            : out std_logic;                   -- Reset the TX side of the GTX
                RX_POLARITY         : out std_logic;                   -- Sets polarity used to interpet rx'ed symbols

        -- Comma Detect Phase Alignment Interface

                ENA_COMMA_ALIGN     : out std_logic;                   -- Turn on SERDES Alignment in GTX

        -- Symbol Generator Interface

                GEN_SP              : out std_logic;                   -- Generate SP symbol
                GEN_SPA             : out std_logic;                   -- Generate SPA symbol

        -- Symbol Decoder Interface

                RX_SP               : in std_logic;                    -- Lane rx'ed SP sequence w/ + or - data
                RX_SPA              : in std_logic;                    -- Lane rx'ed SPA sequence
                RX_NEG              : in std_logic;                    -- Lane rx'ed inverted SP or SPA data
                DO_WORD_ALIGN       : out std_logic;                   -- Enable word alignment

        -- Error Detection Logic Interface

                ENABLE_ERR_DETECT : out std_logic;                   -- Turn on Soft Error detection
                HARD_ERR_RESET    : in std_logic;                    -- Reset lane due to hard error

        -- Global Logic Interface

                LANE_UP             : out std_logic;                   -- Lane is initialized

        -- System Interface

                USER_CLK            : in std_logic;                    -- Clock for all non-GTX Aurora logic
                RESET               : in std_logic;                    -- Reset Aurora Lane

		  -- State machine monitoring (added by Kurtis)
					 LANE_INIT_STATE     : out std_logic_vector(6 downto 0)

             );

    end component;


    component Aurora_IP_Core_A_CHBOND_COUNT_DEC_4BYTE

        port (

                RX_STATUS         : in std_logic_vector(5 downto 0);
                CHANNEL_BOND_LOAD : out std_logic;
                USER_CLK          : in std_logic

             );

    end component;


    component Aurora_IP_Core_A_SYM_GEN_4BYTE

        port (

        -- TX_LL Interface                                        -- See description for info about GEN_PAD and TX_PE_DATA_V.

                GEN_SCP      : in std_logic_vector(0 to 1);       -- Generate SCP.
                GEN_ECP      : in std_logic_vector(0 to 1);       -- Generate ECP.
                GEN_PAD      : in std_logic_vector(0 to 1);       -- Replace LSB with Pad character.
                TX_PE_DATA   : in std_logic_vector(0 to 31);      -- Data.  Transmitted when TX_PE_DATA_V is asserted.
                TX_PE_DATA_V : in std_logic_vector(0 to 1);       -- Transmit data.
                GEN_CC       : in std_logic;                      -- Generate Clock Correction symbols.

        -- Global Logic Interface                                 -- See description for info about GEN_K,GEN_R and GEN_A.

                GEN_A        : in std_logic;                      -- Generate A character for MSBYTE
                GEN_K        : in std_logic_vector(0 to 3);       -- Generate K character for selected bytes.
                GEN_R        : in std_logic_vector(0 to 3);       -- Generate R character for selected bytes.
                GEN_V        : in std_logic_vector(0 to 3);       -- Generate Ver data character on selected bytes.

        -- Lane Init SM Interface

                GEN_SP       : in std_logic;                      -- Generate SP pattern.
                GEN_SPA      : in std_logic;                      -- Generate SPA pattern.

        -- GTX Interface

                TX_CHAR_IS_K : out std_logic_vector(3 downto 0);  -- Transmit TX_DATA as a control character.
                TX_DATA      : out std_logic_vector(31 downto 0); -- Data to GTX for transmission to channel partner.

        -- System Interface

                USER_CLK     : in std_logic;                      -- Clock for all non-GTX Aurora Logic.
                RESET        : in  std_logic

             );

    end component;


    component Aurora_IP_Core_A_SYM_DEC_4BYTE

        port (

        -- RX_LL Interface

                RX_PAD           : out std_logic_vector(0 to 1);     -- LSByte is PAD.
                RX_PE_DATA       : out std_logic_vector(0 to 31);    -- Word aligned data from channel partner.
                RX_PE_DATA_V     : out std_logic_vector(0 to 1);     -- Data is valid data and not a control character.
                RX_SCP           : out std_logic_vector(0 to 1);     -- SCP symbol received.
                RX_ECP           : out std_logic_vector(0 to 1);     -- ECP symbol received.

        -- Lane Init SM Interface

                DO_WORD_ALIGN    : in std_logic;                     -- Word alignment is allowed.
                LANE_UP          : in std_logic;                     -- Lane is up
                RX_SP            : out std_logic;                    -- SP sequence received with positive or negative data.
                RX_SPA           : out std_logic;                    -- SPA sequence received.
                RX_NEG           : out std_logic;                    -- Inverted data for SP or SPA received.

        -- Global Logic Interface

                GOT_A            : out std_logic_vector(0 to 3);     -- A character received on indicated byte(s).
                GOT_V            : out std_logic;                    -- V sequence received.

        -- GTX Interface

                RX_DATA          : in std_logic_vector(31 downto 0); -- Raw RX data from GTX.
                RX_CHAR_IS_K     : in std_logic_vector(3 downto 0);  -- Bits indicating which bytes are control characters.
                RX_CHAR_IS_COMMA : in std_logic_vector(3 downto 0);  -- Rx'ed a comma.

        -- System Interface

                USER_CLK         : in std_logic;                     -- System clock for all non-GTX Aurora Logic.
                RESET            : in std_logic

             );

    end component;


    component Aurora_IP_Core_A_ERR_DETECT_4BYTE is

        port (

        -- Lane Init SM Interface

                ENABLE_ERR_DETECT : in  std_logic;
                HARD_ERR_RESET    : out std_logic;

        -- Global Logic Interface

                SOFT_ERR          : out std_logic_vector(0 to 1);
                HARD_ERR          : out std_logic;

        -- GTX Interface

                RX_DISP_ERR         : in  std_logic_vector(3 downto 0);
                RX_NOT_IN_TABLE     : in  std_logic_vector(3 downto 0);
                RX_BUF_ERR          : in  std_logic;
                TX_BUF_ERR          : in  std_logic;
                RX_REALIGN          : in  std_logic;

        -- System Interface

                USER_CLK            : in std_logic

             );

    end component;

begin


    -- Buffers for twisting data from GTX --
    -- To reuse the Pro Aurora logic, we twist the data to make it compatible.

    TX_DATA            <= tx_data_i(7 downto 0) & tx_data_i(15 downto 8) & tx_data_i(23 downto 16) & tx_data_i(31 downto 24);
    TX_CHAR_IS_K       <= tx_char_is_k_i(0) & tx_char_is_k_i(1) & tx_char_is_k_i(2) & tx_char_is_k_i(3);
    rx_data_i          <= RX_DATA(7 downto 0) & RX_DATA(15 downto 8) & RX_DATA(23 downto 16) & RX_DATA(31 downto 24);
    rx_char_is_k_i     <= RX_CHAR_IS_K(0) & RX_CHAR_IS_K(1) & RX_CHAR_IS_K(2) & RX_CHAR_IS_K(3);
    rx_char_is_comma_i <= RX_CHAR_IS_COMMA(0) & RX_CHAR_IS_COMMA(1) & RX_CHAR_IS_COMMA(2) & RX_CHAR_IS_COMMA(3);
    rx_disp_err_i      <= RX_DISP_ERR(0) & RX_DISP_ERR(1) & RX_DISP_ERR(2) & RX_DISP_ERR(3);
    rx_not_in_table_i  <= RX_NOT_IN_TABLE(0) & RX_NOT_IN_TABLE(1) & RX_NOT_IN_TABLE(2) & RX_NOT_IN_TABLE(3);

    LANE_UP            <= LANE_UP_Buffer;

-- Main Body of Code --

    -- Lane Initialization state machine

    Aurora_IP_Core_A_lane_init_sm_4byte_i : Aurora_IP_Core_A_LANE_INIT_SM_4BYTE

        port map (

        -- GTX Interface

                    RX_NOT_IN_TABLE     =>  RX_NOT_IN_TABLE,
                    RX_DISP_ERR         =>  RX_DISP_ERR,
                    RX_CHAR_IS_COMMA    =>  RX_CHAR_IS_COMMA,
                    RX_REALIGN          =>  RX_REALIGN,
                    RX_RESET            =>  RX_RESET,
                    TX_RESET            =>  TX_RESET,
                    RX_POLARITY         =>  RX_POLARITY,

        -- Comma Detect Phase Alignment Interface

                    ENA_COMMA_ALIGN     =>  ENA_COMMA_ALIGN,

        -- Symbol Generator Interface

                    GEN_SP              =>  gen_sp_i,
                    GEN_SPA             =>  gen_spa_i,

        -- Symbol Decoder Interface

                    RX_SP               =>  rx_sp_i,
                    RX_SPA              =>  rx_spa_i,
                    RX_NEG              =>  rx_neg_i,
                    DO_WORD_ALIGN       =>  do_word_align_i,

        -- Error Detection Logic Interface

                    HARD_ERR_RESET    =>  hard_err_reset_i,
                    ENABLE_ERR_DETECT =>  enable_err_detect_i,

        -- Global Logic Interface

                    LANE_UP             =>  LANE_UP_Buffer,

        -- System Interface

                    USER_CLK            =>  USER_CLK,
                    RESET               =>  RESET,
						  
		  -- State machine monitoring (added by Kurtis)
						  LANE_INIT_STATE     => LANE_INIT_STATE

                 );


    -- Channel Bonding Count Decode module

    Aurora_IP_Core_A_chbond_count_dec_4byte_i : Aurora_IP_Core_A_CHBOND_COUNT_DEC_4BYTE

        port map (

                    RX_STATUS         => RX_STATUS,
                    CHANNEL_BOND_LOAD => CHANNEL_BOND_LOAD,
                    USER_CLK          => USER_CLK

                 );


    -- Symbol Generation module

    Aurora_IP_Core_A_sym_gen_4byte_i : Aurora_IP_Core_A_SYM_GEN_4BYTE

        port map (

        -- TX_LL Interface

                    GEN_SCP      => GEN_SCP,
                    GEN_ECP      => GEN_ECP,
                    GEN_PAD      => GEN_PAD,
                    TX_PE_DATA   => TX_PE_DATA,
                    TX_PE_DATA_V => TX_PE_DATA_V,
                    GEN_CC       => GEN_CC,

        -- Global Logic Interface

                    GEN_A        => GEN_A,
                    GEN_K        => GEN_K,
                    GEN_R        => GEN_R,
                    GEN_V        => GEN_V,

        -- Lane Init SM Interface

                    GEN_SP       => gen_sp_i,
                    GEN_SPA      => gen_spa_i,

        -- GTX Interface

                    TX_CHAR_IS_K => tx_char_is_k_i,
                    TX_DATA      => tx_data_i,

        -- System Interface

                    USER_CLK     => USER_CLK,
                    RESET        => RESET_SYMGEN

                 );


    -- Symbol Decode module

    Aurora_IP_Core_A_sym_dec_4byte_i : Aurora_IP_Core_A_SYM_DEC_4BYTE

        port map (

        -- RX_LL Interface

                    RX_PAD           => RX_PAD,
                    RX_PE_DATA       => RX_PE_DATA,
                    RX_PE_DATA_V     => RX_PE_DATA_V,
                    RX_SCP           => RX_SCP,
                    RX_ECP           => RX_ECP,

        -- Lane Init SM Interface

                    DO_WORD_ALIGN    => do_word_align_i,
                    LANE_UP          => LANE_UP_Buffer,
                    RX_SP            => rx_sp_i,
                    RX_SPA           => rx_spa_i,
                    RX_NEG           => rx_neg_i,

        -- Global Logic Interface

                    GOT_A            => GOT_A,
                    GOT_V            => GOT_V,

        -- GTX Interface

                    RX_DATA          => rx_data_i,
                    RX_CHAR_IS_K     => rx_char_is_k_i,
                    RX_CHAR_IS_COMMA => rx_char_is_comma_i,

        -- System Interface

                    USER_CLK         => USER_CLK,
                    RESET            => RESET

                 );


    -- Error Detection module

    Aurora_IP_Core_A_err_detect_4byte_i : Aurora_IP_Core_A_ERR_DETECT_4BYTE

        port map (

        -- Lane Init SM Interface

                    ENABLE_ERR_DETECT => enable_err_detect_i,
                    HARD_ERR_RESET    => hard_err_reset_i,

        -- Global Logic Interface

                    SOFT_ERR          => SOFT_ERR,
                    HARD_ERR          => HARD_ERR,

        -- GTX Interface

                    RX_DISP_ERR         => rx_disp_err_i,
                    RX_NOT_IN_TABLE     => rx_not_in_table_i,
                    RX_BUF_ERR          => RX_BUF_ERR,
                    TX_BUF_ERR          => TX_BUF_ERR,
                    RX_REALIGN          => RX_REALIGN,

        -- System Interface

                    USER_CLK            => USER_CLK

                 );

end RTL;
