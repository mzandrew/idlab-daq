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

--
--  SYM_DEC_4BYTE
--
--
--  Description: The SYM_DEC_4BYTE module is a symbol decoder for the
--               4-byte Aurora Lane.  Its inputs are the raw data from
--               the GTX.  It word-aligns the regular data and decodes
--               all of the Aurora control symbols.  Its outputs are the
--               word-aligned data and signals indicating the arrival of
--               specific control characters.
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.AURORA_PKG.all; 

entity Aurora_IP_Core_A_SYM_DEC_4BYTE is

    port (

    -- RX_LL Interface

            RX_PAD           : out std_logic_vector(0 to 1);     -- LSByte is PAD.
            RX_PE_DATA       : out std_logic_vector(0 to 31);    -- Word aligned data from channel partner.
            RX_PE_DATA_V     : out std_logic_vector(0 to 1);     -- Data is valid data and not a control character.
            RX_SCP           : out std_logic_vector(0 to 1);     -- SCP symbol received.
            RX_ECP           : out std_logic_vector(0 to 1);     -- ECP symbol received.

    -- Lane Init SM Interface

            DO_WORD_ALIGN    : in std_logic;                     -- Word alignment is allowed.
            LANE_UP          : in std_logic;
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

end Aurora_IP_Core_A_SYM_DEC_4BYTE;

architecture RTL of Aurora_IP_Core_A_SYM_DEC_4BYTE is

-- Parameter Declarations --

    constant DLY : time := 1 ns;

    constant K_CHAR_0       : std_logic_vector(0 to 3) := X"B";
    constant K_CHAR_1       : std_logic_vector(0 to 3) := X"C";
    constant SP_DATA_0      : std_logic_vector(0 to 3) := X"4";
    constant SP_DATA_1      : std_logic_vector(0 to 3) := X"A";
    constant SPA_DATA_0     : std_logic_vector(0 to 3) := X"2";
    constant SPA_DATA_1     : std_logic_vector(0 to 3) := X"C";
    constant SP_NEG_DATA_0  : std_logic_vector(0 to 3) := X"B";
    constant SP_NEG_DATA_1  : std_logic_vector(0 to 3) := X"5";
    constant SPA_NEG_DATA_0 : std_logic_vector(0 to 3) := X"D";
    constant SPA_NEG_DATA_1 : std_logic_vector(0 to 3) := X"3";
    constant PAD_0          : std_logic_vector(0 to 3) := X"9";
    constant PAD_1          : std_logic_vector(0 to 3) := X"C";
    constant SCP_0          : std_logic_vector(0 to 3) := X"5";
    constant SCP_1          : std_logic_vector(0 to 3) := X"C";
    constant SCP_2          : std_logic_vector(0 to 3) := X"F";
    constant SCP_3          : std_logic_vector(0 to 3) := X"B";
    constant ECP_0          : std_logic_vector(0 to 3) := X"F";
    constant ECP_1          : std_logic_vector(0 to 3) := X"D";
    constant ECP_2          : std_logic_vector(0 to 3) := X"F";
    constant ECP_3          : std_logic_vector(0 to 3) := X"E";
    constant A_CHAR_0       : std_logic_vector(0 to 3) := X"7";
    constant A_CHAR_1       : std_logic_vector(0 to 3) := X"C";
    constant VER_DATA_0     : std_logic_vector(0 to 3) := X"E";
    constant VER_DATA_1     : std_logic_vector(0 to 3) := X"8";

-- External Register Declarations --

    signal RX_PAD_Buffer       : std_logic_vector(0 to 1);
    signal RX_PE_DATA_Buffer   : std_logic_vector(0 to 31);
    signal RX_PE_DATA_V_Buffer : std_logic_vector(0 to 1);
    signal RX_SCP_Buffer       : std_logic_vector(0 to 1);
    signal RX_ECP_Buffer       : std_logic_vector(0 to 1);
    signal RX_SP_Buffer        : std_logic;
    signal RX_SPA_Buffer       : std_logic;
    signal RX_NEG_Buffer       : std_logic;
    signal GOT_A_Buffer        : std_logic_vector(0 to 3);
    signal GOT_V_Buffer        : std_logic;

-- Internal Register Declarations --

    signal left_align_select_r         : std_logic_vector(0 to 1);
    signal previous_cycle_data_r       : std_logic_vector(23 downto 0);
    signal previous_cycle_control_r    : std_logic_vector(2 downto 0);
    signal word_aligned_data_r         : std_logic_vector(0 to 31);
    signal word_aligned_control_bits_r : std_logic_vector(0 to 3);
    signal rx_pe_data_r                : std_logic_vector(0 to 31);
    signal rx_pe_control_r             : std_logic_vector(0 to 3);
    signal rx_pad_d_r                  : std_logic_vector(0 to 3);
    signal rx_scp_d_r                  : std_logic_vector(0 to 7);
    signal rx_ecp_d_r                  : std_logic_vector(0 to 7);
    signal rx_sp_r                     : std_logic_vector(0 to 7);
    signal rx_spa_r                    : std_logic_vector(0 to 7);
    signal rx_sp_neg_d_r               : std_logic_vector(0 to 1);
    signal rx_spa_neg_d_r              : std_logic_vector(0 to 1);
    signal rx_v_d_r                    : std_logic_vector(0 to 7);
    signal got_a_d_r                   : std_logic_vector(0 to 7);
    signal first_v_received_r          : std_logic := '0';

-- Wire Declarations --

    signal got_v_c : std_logic;

begin

    RX_PAD       <= RX_PAD_Buffer;
    RX_PE_DATA   <= RX_PE_DATA_Buffer;
    RX_PE_DATA_V <= RX_PE_DATA_V_Buffer;
    RX_SCP       <= RX_SCP_Buffer;
    RX_ECP       <= RX_ECP_Buffer;
    RX_SP        <= RX_SP_Buffer;
    RX_SPA       <= RX_SPA_Buffer;
    RX_NEG       <= RX_NEG_Buffer;
    GOT_A        <= GOT_A_Buffer;
    GOT_V        <= GOT_V_Buffer;

-- Main Body of Code --

    -- Word Alignment --

    -- Determine whether the lane is aligned to the left byte (MSByte) or the
    -- right byte (LSByte).  This information is used for word alignment. To
    -- prevent the word align from changing during normal operation, we do word
    -- alignment only when it is allowed by the lane_init_sm.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if ((DO_WORD_ALIGN and not first_v_received_r) = '1') then

                case RX_CHAR_IS_K is

                    when "1000" => left_align_select_r <= "00" after DLY;
                    when "0100" => left_align_select_r <= "01" after DLY;
                    when "0010" => left_align_select_r <= "10" after DLY;
                    when "1100" => left_align_select_r <= "01" after DLY;
                    when "1110" => left_align_select_r <= "10" after DLY;
                    when "0001" => left_align_select_r <= "11" after DLY;
                    when others => left_align_select_r <= left_align_select_r after DLY;

                end case;

            end if;

        end if;

    end process;


    -- Store bytes 1, 2 and 3 from the previous cycle.  If the lane is aligned
    -- on one of those bytes, we use the data in the current cycle.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            previous_cycle_data_r <= RX_DATA(23 downto 0) after DLY;

        end if;

    end process;


    -- Store the control bits from bytes 1, 2 and 3 from the previous cycle.  If
    -- we align on one of those bytes, we will also need to use their previous
    -- value control bits.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            previous_cycle_control_r <= RX_CHAR_IS_K(2 downto 0) after DLY;

        end if;

    end process;


    -- Select the word-aligned data byte 0.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_data_r(0 to 7) <= RX_DATA(31 downto 24) after DLY;
                when "01"   => word_aligned_data_r(0 to 7) <= previous_cycle_data_r(23 downto 16) after DLY;
                when "10"   => word_aligned_data_r(0 to 7) <= previous_cycle_data_r(15 downto 8) after DLY;
                when "11"   => word_aligned_data_r(0 to 7) <= previous_cycle_data_r(7 downto 0) after DLY;
                when others => word_aligned_data_r(0 to 7) <= "00000000" after DLY;

            end case;

        end if;

    end process;


    -- Select the word-aligned data byte 1.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_data_r(8 to 15) <= RX_DATA(23 downto 16) after DLY;
                when "01"   => word_aligned_data_r(8 to 15) <= previous_cycle_data_r(15 downto 8) after DLY;
                when "10"   => word_aligned_data_r(8 to 15) <= previous_cycle_data_r(7 downto 0) after DLY;
                when "11"   => word_aligned_data_r(8 to 15) <= RX_DATA(31 downto 24) after DLY;
                when others => word_aligned_data_r(8 to 15) <= "00000000" after DLY;

            end case;

        end if;

    end process;


    -- Select the word-aligned data byte 2.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_data_r(16 to 23) <= RX_DATA(15 downto 8) after DLY;
                when "01"   => word_aligned_data_r(16 to 23) <= previous_cycle_data_r(7 downto 0) after DLY;
                when "10"   => word_aligned_data_r(16 to 23) <= RX_DATA(31 downto 24) after DLY;
                when "11"   => word_aligned_data_r(16 to 23) <= RX_DATA(23 downto 16) after DLY;
                when others => word_aligned_data_r(16 to 23) <= "00000000" after DLY;

            end case;

        end if;

    end process;


    -- Select the word-aligned data byte 3.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_data_r(24 to 31) <= RX_DATA(7 downto 0) after DLY;
                when "01"   => word_aligned_data_r(24 to 31) <= RX_DATA(31 downto 24) after DLY;
                when "10"   => word_aligned_data_r(24 to 31) <= RX_DATA(23 downto 16) after DLY;
                when "11"   => word_aligned_data_r(24 to 31) <= RX_DATA(15 downto 8) after DLY;
                when others => word_aligned_data_r(24 to 31) <= "00000000" after DLY;

            end case;

        end if;

    end process;


    -- Select the word-aligned control bit 0.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_control_bits_r(0) <= RX_CHAR_IS_K(3) after DLY;
                when "01"   => word_aligned_control_bits_r(0) <= previous_cycle_control_r(2) after DLY;
                when "10"   => word_aligned_control_bits_r(0) <= previous_cycle_control_r(1) after DLY;
                when "11"   => word_aligned_control_bits_r(0) <= previous_cycle_control_r(0) after DLY;
                when others => word_aligned_control_bits_r(0) <= '0' after DLY;

            end case;

        end if;

    end process;


    -- Select the word-aligned control bit 1.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_control_bits_r(1) <= RX_CHAR_IS_K(2) after DLY;
                when "01"   => word_aligned_control_bits_r(1) <= previous_cycle_control_r(1) after DLY;
                when "10"   => word_aligned_control_bits_r(1) <= previous_cycle_control_r(0) after DLY;
                when "11"   => word_aligned_control_bits_r(1) <= RX_CHAR_IS_K(3) after DLY;
                when others => word_aligned_control_bits_r(1) <= '0' after DLY;

            end case;

        end if;

    end process;


    -- Select the word-aligned control bit 2.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_control_bits_r(2) <= RX_CHAR_IS_K(1) after DLY;
                when "01"   => word_aligned_control_bits_r(2) <= previous_cycle_control_r(0) after DLY;
                when "10"   => word_aligned_control_bits_r(2) <= RX_CHAR_IS_K(3) after DLY;
                when "11"   => word_aligned_control_bits_r(2) <= RX_CHAR_IS_K(2) after DLY;
                when others => word_aligned_control_bits_r(2) <= '0' after DLY;

            end case;

        end if;

    end process;


    -- Select the word-aligned control bit 3.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            case left_align_select_r is

                when "00"   => word_aligned_control_bits_r(3) <= RX_CHAR_IS_K(0) after DLY;
                when "01"   => word_aligned_control_bits_r(3) <= RX_CHAR_IS_K(3) after DLY;
                when "10"   => word_aligned_control_bits_r(3) <= RX_CHAR_IS_K(2) after DLY;
                when "11"   => word_aligned_control_bits_r(3) <= RX_CHAR_IS_K(1) after DLY;
                when others => word_aligned_control_bits_r(3) <= '0' after DLY;

            end case;

        end if;

    end process;


    -- Pipeline the word-aligned data for 1 cycle to match the Decodes.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_pe_data_r <= word_aligned_data_r after DLY;

        end if;

    end process;


    -- Register the pipelined word-aligned data for the RX_LL interface.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_PE_DATA_Buffer <= rx_pe_data_r after DLY;

        end if;

    end process;


    -- Decode Control Symbols --

    -- All decodes are pipelined to keep the number of logic levels to a minimum.

    -- Delay the control bits: they are most often used in the second stage of the
    -- decoding process.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_pe_control_r <= word_aligned_control_bits_r after DLY;

        end if;

    end process;


    -- Decode PAD.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_pad_d_r(0) <= std_bool(word_aligned_data_r(8 to 11)  = PAD_0) after DLY;
            rx_pad_d_r(1) <= std_bool(word_aligned_data_r(12 to 15) = PAD_1) after DLY;
            rx_pad_d_r(2) <= std_bool(word_aligned_data_r(24 to 27) = PAD_0) after DLY;
            rx_pad_d_r(3) <= std_bool(word_aligned_data_r(28 to 31) = PAD_1) after DLY;

        end if;

    end process;


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_PAD_Buffer(0) <= std_bool((rx_pad_d_r(0 to 1) = "11") and (rx_pe_control_r(0 to 1)) = "01") after DLY;
            RX_PAD_Buffer(1) <= std_bool((rx_pad_d_r(2 to 3) = "11") and (rx_pe_control_r(2 to 3)) = "01") after DLY;

        end if;

    end process;



    -- Decode RX_PE_DATA_V.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_PE_DATA_V_Buffer(0) <= not rx_pe_control_r(0) after DLY;
            RX_PE_DATA_V_Buffer(1) <= not rx_pe_control_r(2) after DLY;

        end if;

    end process;


    -- Decode RX_SCP.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_scp_d_r(0) <= std_bool(word_aligned_data_r(0 to 3)   = SCP_0) after DLY;
            rx_scp_d_r(1) <= std_bool(word_aligned_data_r(4 to 7)   = SCP_1) after DLY;
            rx_scp_d_r(2) <= std_bool(word_aligned_data_r(8 to 11)  = SCP_2) after DLY;
            rx_scp_d_r(3) <= std_bool(word_aligned_data_r(12 to 15) = SCP_3) after DLY;
            rx_scp_d_r(4) <= std_bool(word_aligned_data_r(16 to 19) = SCP_0) after DLY;
            rx_scp_d_r(5) <= std_bool(word_aligned_data_r(20 to 23) = SCP_1) after DLY;
            rx_scp_d_r(6) <= std_bool(word_aligned_data_r(24 to 27) = SCP_2) after DLY;
            rx_scp_d_r(7) <= std_bool(word_aligned_data_r(28 to 31) = SCP_3) after DLY;

        end if;

    end process;


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_SCP_Buffer(0) <= rx_pe_control_r(0) and
                                rx_pe_control_r(1) and
                                rx_scp_d_r(0)      and
                                rx_scp_d_r(1)      and
                                rx_scp_d_r(2)      and
                                rx_scp_d_r(3) after DLY;

            RX_SCP_Buffer(1) <= rx_pe_control_r(2) and
                                rx_pe_control_r(3) and
                                rx_scp_d_r(4)      and
                                rx_scp_d_r(5)      and
                                rx_scp_d_r(6)      and
                                rx_scp_d_r(7) after DLY;

        end if;

    end process;


    -- Decode RX_ECP.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_ecp_d_r(0) <= std_bool(word_aligned_data_r(0 to 3)   = ECP_0) after DLY;
            rx_ecp_d_r(1) <= std_bool(word_aligned_data_r(4 to 7)   = ECP_1) after DLY;
            rx_ecp_d_r(2) <= std_bool(word_aligned_data_r(8 to 11)  = ECP_2) after DLY;
            rx_ecp_d_r(3) <= std_bool(word_aligned_data_r(12 to 15) = ECP_3) after DLY;
            rx_ecp_d_r(4) <= std_bool(word_aligned_data_r(16 to 19) = ECP_0) after DLY;
            rx_ecp_d_r(5) <= std_bool(word_aligned_data_r(20 to 23) = ECP_1) after DLY;
            rx_ecp_d_r(6) <= std_bool(word_aligned_data_r(24 to 27) = ECP_2) after DLY;
            rx_ecp_d_r(7) <= std_bool(word_aligned_data_r(28 to 31) = ECP_3) after DLY;

        end if;

    end process;


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_ECP_Buffer(0) <= rx_pe_control_r(0) and
                                rx_pe_control_r(1) and
                                rx_ecp_d_r(0)      and
                                rx_ecp_d_r(1)      and
                                rx_ecp_d_r(2)      and
                                rx_ecp_d_r(3) after DLY;

            RX_ECP_Buffer(1) <= rx_pe_control_r(2) and
                                rx_pe_control_r(3) and
                                rx_ecp_d_r(4)      and
                                rx_ecp_d_r(5)      and
                                rx_ecp_d_r(6)      and
                                rx_ecp_d_r(7) after DLY;

        end if;

    end process;


    -- Indicate the SP sequence was received.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_sp_r(0) <= std_bool(word_aligned_data_r(0 to 3)    = K_CHAR_0) after DLY;
            rx_sp_r(1) <= std_bool(word_aligned_data_r(4 to 7)    = K_CHAR_1) after DLY;

            rx_sp_r(2) <= std_bool((word_aligned_data_r(8 to 11)  = SP_DATA_0) or
                                   (word_aligned_data_r(8 to 11)  = SP_NEG_DATA_0)) after DLY;

            rx_sp_r(3) <= std_bool((word_aligned_data_r(12 to 15) = SP_DATA_1) or
                                   (word_aligned_data_r(12 to 15) = SP_NEG_DATA_1)) after DLY;

            rx_sp_r(4) <= std_bool((word_aligned_data_r(16 to 19) = SP_DATA_0) or
                                   (word_aligned_data_r(16 to 19) = SP_NEG_DATA_0)) after DLY;

            rx_sp_r(5) <= std_bool((word_aligned_data_r(20 to 23) = SP_DATA_1) or
                                   (word_aligned_data_r(20 to 23) = SP_NEG_DATA_1)) after DLY;

            rx_sp_r(6) <= std_bool((word_aligned_data_r(24 to 27) = SP_DATA_0) or
                                   (word_aligned_data_r(24 to 27) = SP_NEG_DATA_0)) after DLY;

            rx_sp_r(7) <= std_bool((word_aligned_data_r(28 to 31) = SP_DATA_1) or
                                   (word_aligned_data_r(28 to 31) = SP_NEG_DATA_1)) after DLY;

        end if;

    end process;


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_SP_Buffer <= std_bool((rx_pe_control_r = "1000") and (rx_sp_r = X"FF")) after DLY;

        end if;

    end process;


    -- Indicate the SPA sequence was received.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_spa_r(0) <= std_bool(word_aligned_data_r(0 to 3)   = K_CHAR_0) after DLY;
            rx_spa_r(1) <= std_bool(word_aligned_data_r(4 to 7)   = K_CHAR_1) after DLY;
            rx_spa_r(2) <= std_bool(word_aligned_data_r(8 to 11)  = SPA_DATA_0) after DLY;
            rx_spa_r(3) <= std_bool(word_aligned_data_r(12 to 15) = SPA_DATA_1) after DLY;
            rx_spa_r(4) <= std_bool(word_aligned_data_r(16 to 19) = SPA_DATA_0) after DLY;
            rx_spa_r(5) <= std_bool(word_aligned_data_r(20 to 23) = SPA_DATA_1) after DLY;
            rx_spa_r(6) <= std_bool(word_aligned_data_r(24 to 27) = SPA_DATA_0) after DLY;
            rx_spa_r(7) <= std_bool(word_aligned_data_r(28 to 31) = SPA_DATA_1) after DLY;

        end if;

    end process;


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_SPA_Buffer <= std_bool((rx_pe_control_r = "1000") and (rx_spa_r = X"FF")) after DLY;

        end if;

    end process;


    -- Indicate reversed data received.  We look only at the word aligned LSByte
    -- which, during an SP or SPA sequence, will always contain a data byte.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_sp_neg_d_r(0)  <= std_bool(word_aligned_data_r(8 to 11)  = SP_NEG_DATA_0) after DLY;
            rx_sp_neg_d_r(1)  <= std_bool(word_aligned_data_r(12 to 15) = SP_NEG_DATA_1) after DLY;

            rx_spa_neg_d_r(0) <= std_bool(word_aligned_data_r(8 to 11)  = SPA_NEG_DATA_0) after DLY;
            rx_spa_neg_d_r(1) <= std_bool(word_aligned_data_r(12 to 15) = SPA_NEG_DATA_1) after DLY;

        end if;

    end process;


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            RX_NEG_Buffer <= not rx_pe_control_r(1) and
                             std_bool((rx_sp_neg_d_r  = "11") or
                                      (rx_spa_neg_d_r = "11")) after DLY;

        end if;

    end process;


    -- Decode GOT_A.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            got_a_d_r(0) <= std_bool(RX_DATA(31 downto 28)   = A_CHAR_0) after DLY;
            got_a_d_r(1) <= std_bool(RX_DATA(27 downto 24)   = A_CHAR_1) after DLY;
            got_a_d_r(2) <= std_bool(RX_DATA(23 downto 20)   = A_CHAR_0) after DLY;
            got_a_d_r(3) <= std_bool(RX_DATA(19 downto 16)   = A_CHAR_1) after DLY;
            got_a_d_r(4) <= std_bool(RX_DATA(15 downto 12)   = A_CHAR_0) after DLY;
            got_a_d_r(5) <= std_bool(RX_DATA(11 downto 8)    = A_CHAR_1) after DLY;
            got_a_d_r(6) <= std_bool(RX_DATA(7  downto 4)    = A_CHAR_0) after DLY;
            got_a_d_r(7) <= std_bool(RX_DATA(3  downto 0)    = A_CHAR_1) after DLY;

        end if;

    end process;


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            GOT_A_Buffer(0) <= RX_CHAR_IS_K(3) and std_bool(got_a_d_r(0 to 1) = "11") after DLY;
            GOT_A_Buffer(1) <= RX_CHAR_IS_K(2) and std_bool(got_a_d_r(2 to 3) = "11") after DLY;
            GOT_A_Buffer(2) <= RX_CHAR_IS_K(1) and std_bool(got_a_d_r(4 to 5) = "11") after DLY;
            GOT_A_Buffer(3) <= RX_CHAR_IS_K(0) and std_bool(got_a_d_r(6 to 7) = "11") after DLY;

        end if;

    end process;


    -- Verification symbol decode --

    -- Indicate the SP sequence was received.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            rx_v_d_r(0) <= std_bool(word_aligned_data_r(0 to 3)   = K_CHAR_0) after DLY;
            rx_v_d_r(1) <= std_bool(word_aligned_data_r(4 to 7)   = K_CHAR_1) after DLY;
            rx_v_d_r(2) <= std_bool(word_aligned_data_r(8 to 11)  = VER_DATA_0) after DLY;
            rx_v_d_r(3) <= std_bool(word_aligned_data_r(12 to 15) = VER_DATA_1) after DLY;
            rx_v_d_r(4) <= std_bool(word_aligned_data_r(16 to 19) = VER_DATA_0) after DLY;
            rx_v_d_r(5) <= std_bool(word_aligned_data_r(20 to 23) = VER_DATA_1) after DLY;
            rx_v_d_r(6) <= std_bool(word_aligned_data_r(24 to 27) = VER_DATA_0) after DLY;
            rx_v_d_r(7) <= std_bool(word_aligned_data_r(28 to 31) = VER_DATA_1) after DLY;

        end if;

    end process;


    got_v_c <= std_bool((rx_pe_control_r = "1000") and (rx_v_d_r = X"FF"));


    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            GOT_V_Buffer <= got_v_c after DLY;

        end if;

    end process;


    -- Remember that the first V sequence has been detected.

    process (USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if (LANE_UP = '0') then

                first_v_received_r <= '0' after DLY;

            else

                if (got_v_c = '1') then

                    first_v_received_r <= '1' after DLY;

                end if;

            end if;

        end if;

    end process;

end RTL;
