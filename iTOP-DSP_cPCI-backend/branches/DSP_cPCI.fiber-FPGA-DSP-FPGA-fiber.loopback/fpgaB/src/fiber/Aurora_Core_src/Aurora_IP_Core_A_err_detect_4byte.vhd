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
------------------------------------------------------------------------------
--
--  ERR_DETECT_4BYTE
--
--
--  Description : The ERR_DETECT module monitors the GTX to detect hard errors.
--                It accumulates the Soft errors according to the leaky bucket
--                algorithm described in the Aurora Specification to detect Hard
--                errors.  All errors are reported to the Global Logic Interface.
--
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.AURORA_PKG.all; 
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity Aurora_IP_Core_A_ERR_DETECT_4BYTE is

port (
    -- Lane Init SM Interface

        ENABLE_ERR_DETECT : in  std_logic;
        HARD_ERR_RESET    : out std_logic;

    -- Global Logic Interface

        SOFT_ERR          : out std_logic_vector(0 to 1);
        HARD_ERR          : out std_logic;

    -- GTX Interface

        RX_BUF_ERR          : in std_logic;
        RX_DISP_ERR         : in std_logic_vector(3 downto 0);
        RX_NOT_IN_TABLE     : in std_logic_vector(3 downto 0);
        TX_BUF_ERR          : in std_logic;
        RX_REALIGN          : in std_logic;

    -- System Interface

        USER_CLK            : in std_logic
     );

end Aurora_IP_Core_A_ERR_DETECT_4BYTE;

architecture RTL of Aurora_IP_Core_A_ERR_DETECT_4BYTE is

--Constant Declarations --

    constant DLY               : time := 1 ns;

-- VHDL out buffer logic --

    signal  SOFT_ERR_Buffer       : std_logic_vector(0 to 1);
    signal  HARD_ERR_Buffer       : std_logic;


-- Internal Register Declarations --

    signal  count_0_r                   : std_logic_vector(0 to 1);
    signal  count_1_r                   : std_logic_vector(0 to 1);
    signal  bucket_full_0_r             : std_logic;
    signal  bucket_full_1_r             : std_logic;
    signal  soft_err_r                : std_logic_vector(0 to 3);
    signal  good_count_0_r              : std_logic_vector(0 to 1);
    signal  good_count_1_r              : std_logic_vector(0 to 1);


begin

    -- VHDL Output Buffers --

    SOFT_ERR <= SOFT_ERR_Buffer;
    HARD_ERR <= HARD_ERR_Buffer;

-- Main Body of Code --

    -- Error Processing --

    -- Detect Soft Errors.  The lane is divided into 2 2-byte sublanes for this purpose.

    process(USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            -- Sublane 0
            soft_err_r(0) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(3) or RX_NOT_IN_TABLE(3)) after DLY;
            soft_err_r(1) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(2) or RX_NOT_IN_TABLE(2)) after DLY;

            -- Sublane 1
            soft_err_r(2) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(1) or RX_NOT_IN_TABLE(1)) after DLY;
            soft_err_r(3) <= ENABLE_ERR_DETECT and (RX_DISP_ERR(0) or RX_NOT_IN_TABLE(0)) after DLY;

        end if;

    end process;


    process(USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            -- Sublane 0
            SOFT_ERR_Buffer(0) <= soft_err_r(0) or soft_err_r(1) after DLY;

            -- Sublane 1
            SOFT_ERR_Buffer(1) <= soft_err_r(2) or soft_err_r(3) after DLY;

        end if;

    end process;


    -- Detect Hard Errors

    process(USER_CLK)

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if(ENABLE_ERR_DETECT = '1') then

                HARD_ERR_Buffer <= (RX_BUF_ERR or TX_BUF_ERR or RX_REALIGN
                                      or bucket_full_0_r or bucket_full_1_r) after DLY;

            else

                HARD_ERR_Buffer <= '0' after DLY;

            end if;

        end if;

    end process;

    -- Assert hard error reset when there is a hard error.  This assignment
    -- just renames the two fanout branches of the hard error signal.

    HARD_ERR_RESET <= HARD_ERR_Buffer;


    -- Leaky Bucket Sublane 0 --

    -- Good cycle counter: it takes 2 good cycles in a row to remove a demerit from
    -- the leaky bucket.

    process (USER_CLK)

        variable vec : std_logic_vector(3 downto 0);

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if (ENABLE_ERR_DETECT = '0') then

                good_count_0_r <= "00" after DLY;

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r = "00" ) then
                        good_count_0_r <= "10" after DLY;
                

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r = "01" ) then
                        good_count_0_r <= "11" after DLY;
                

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r = "10" ) then
                        good_count_0_r <= "00" after DLY;
                

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r = "11" ) then
                        good_count_0_r <= "01" after DLY;
                

            elsif (soft_err_r(1) = '1') then
                        good_count_0_r <= "00" after DLY;
                

            elsif (soft_err_r(0 to 1) = "10") then
                        good_count_0_r <= "01" after DLY;
            else 
                        good_count_0_r <= good_count_0_r after DLY;
                

            end if;

        end if;

    end process;
    
    
    -- Perform the leaky bucket algorithm using an up/down counter.  A drop is
    -- added to the bucket whenever a soft error occurs, and is allowed to leak
    -- out whenever the good cycles counter reaches 2.  Once the bucket fills
    -- (3 drops) it stays full until it is reset by disabling and then enabling
    -- the error detection circuit.

    process (USER_CLK)

        variable vec : std_logic_vector(5 downto 0);

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if (ENABLE_ERR_DETECT = '0') then

                count_0_r <= "00" after DLY;

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r(0) = '0' ) then
                        count_0_r <= count_0_r after DLY;
               

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r(0) = '1'  and count_0_r = "00") then
                         count_0_r <= "00" after DLY;
              

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r(0) = '1'  and count_0_r = "01") then
                        count_0_r <= "00" after DLY;
               

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r(0) = '1'  and count_0_r = "10") then
                        count_0_r <= "01" after DLY;
               

            elsif (soft_err_r(0 to 1) = "00" and good_count_0_r(0) = '1'  and count_0_r = "11") then
                        count_0_r <= "10" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "00"  and count_0_r = "00") then
                        count_0_r <= "01" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "01"  and count_0_r = "00") then
                        count_0_r <= "01" after DLY;
               
            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "10"  and count_0_r = "00") then
                        count_0_r <= "01" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "11"  and count_0_r = "00") then
                        count_0_r <= "00" after DLY;
               
            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "00"  and count_0_r = "01") then
                        count_0_r <= "10" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "01"  and count_0_r = "01") then
                        count_0_r <= "10" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "10"  and count_0_r = "01") then
                        count_0_r <= "10" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "11"  and count_0_r = "01") then
                        count_0_r <= "01" after DLY;
               
            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "00"  and count_0_r = "10") then
                        count_0_r <= "11" after DLY;
              

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "01"  and count_0_r = "10") then
                        count_0_r <= "11" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "10"  and count_0_r = "10") then
                        count_0_r <= "11" after DLY;
              

            elsif (soft_err_r(0 to 1) = "01" and good_count_0_r = "11"  and count_0_r = "10") then
                        count_0_r <= "10" after DLY;
               

            elsif (soft_err_r(0 to 1) = "01" and count_0_r = "11") then
                        count_0_r <= "11" after DLY;
               

            elsif (soft_err_r(0 to 1) = "10" and count_0_r = "00") then
                        count_0_r <= "01" after DLY;
               

            elsif (soft_err_r(0 to 1) = "10" and count_0_r = "01") then
                        count_0_r <= "10" after DLY;
              

            elsif (soft_err_r(0 to 1) = "10" and count_0_r = "10") then
                        count_0_r <= "11" after DLY;
               

            elsif (soft_err_r(0 to 1) = "10" and count_0_r = "11") then
                        count_0_r <= "11" after DLY;
               

            elsif (soft_err_r(0 to 1) = "11" and count_0_r = "00") then
                        count_0_r <= "10" after DLY;
              

            elsif (soft_err_r(0 to 1) = "11" and count_0_r = "01") then
                        count_0_r <= "11" after DLY;
               

            elsif (soft_err_r(0 to 1) = "11" and count_0_r = "10") then
                        count_0_r <= "11" after DLY;
               

            elsif (soft_err_r(0 to 1) = "11" and count_0_r = "11") then
                        count_0_r <= "11" after DLY;
            else 
                        count_0_r <= count_0_r after DLY;
              

            end if;

        end if;

    end process;

    -- Detect when the bucket is full and register the signal.

    process (USER_CLK)

    variable leaky_bucket_0_v : std_logic_vector(5 downto 0);

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

           if(not ENABLE_ERR_DETECT = '1') then

             bucket_full_0_r <= '0' after DLY;

           elsif (soft_err_r(0 to 1) = "01" and good_count_0_r  = "00" and count_0_r = "11") then
                        bucket_full_0_r <= '1';
               

           elsif (soft_err_r(0 to 1) = "01" and good_count_0_r  = "01" and count_0_r = "11") then
                        bucket_full_0_r <= '1';
                
           elsif (soft_err_r(0 to 1) = "01" and good_count_0_r  = "10" and count_0_r = "11") then
                        bucket_full_0_r <= '1';
                

           elsif (soft_err_r(0 to 1) = "01" and count_0_r = "11") then
                        bucket_full_0_r <= '1';
                

           elsif (soft_err_r(0 to 1) = "11" and count_0_r(0) = '1') then
                        bucket_full_0_r <= '1';
           else 
                        bucket_full_0_r <= '0';
                
          end if;

        end if;

     end process;

    -- Leaky Bucket Sublane 1 --

    -- Good cycle counter: it takes 2 good cycles in a row to remove a demerit from
    -- the leaky bucket.

    process (USER_CLK)

        variable vec : std_logic_vector(3 downto 0);

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if (ENABLE_ERR_DETECT = '0') then

                good_count_1_r <= "00" after DLY;

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r = "00" ) then
                        good_count_1_r <= "10" after DLY;
             

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r = "01" ) then
                        good_count_1_r <= "11" after DLY;
              

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r = "10" ) then
                        good_count_1_r <= "00" after DLY;
             

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r = "11" ) then
                        good_count_1_r <= "01" after DLY;
              

            elsif (soft_err_r(1) = '1') then
                        good_count_1_r <= "00" after DLY;
              

            elsif (soft_err_r(2 to 3) = "10") then
                        good_count_1_r <= "01" after DLY;
            else 
                         good_count_1_r <= good_count_1_r after DLY;
              

            end if;

        end if;

    end process;


    -- Perform the leaky bucket algorithm using an up/down counter.  A drop is
    -- added to the bucket whenever a soft error occurs, and is allowed to leak
    -- out whenever the good cycles counter reaches 2.  Once the bucket fills
    -- (3 drops) it stays full until it is reset by disabling and then enabling
    -- the error detection circuit.

    process (USER_CLK)

        variable vec : std_logic_vector(5 downto 0);

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

            if (ENABLE_ERR_DETECT = '0') then

                count_1_r <= "00" after DLY;

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r(0) = '0' ) then
                        count_1_r <= count_1_r after DLY;
                

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r(0) = '1'  and count_1_r = "00") then
                         count_1_r <= "00" after DLY;
                

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r(0) = '1'  and count_1_r = "01") then
                        count_1_r <= "00" after DLY;
                
            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r(0) = '1'  and count_1_r = "10") then
                        count_1_r <= "01" after DLY;
             

            elsif (soft_err_r(2 to 3) = "00" and good_count_1_r(0) = '1'  and count_1_r = "11") then
                        count_1_r <= "10" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "00"  and count_1_r = "00") then
                        count_1_r <= "01" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "01"  and count_1_r = "00") then
                        count_1_r <= "01" after DLY;
                
            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "10"  and count_1_r = "00") then
                        count_1_r <= "01" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "11"  and count_1_r = "00") then
                        count_1_r <= "00" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "00"  and count_1_r = "01") then
                        count_1_r <= "10" after DLY;
                
            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "01"  and count_1_r = "01") then
                        count_1_r <= "10" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "10"  and count_1_r = "01") then
                        count_1_r <= "10" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "11"  and count_1_r = "01") then
                        count_1_r <= "01" after DLY;
               

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "00"  and count_1_r = "10") then
                        count_1_r <= "11" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "01"  and count_1_r = "10") then
                        count_1_r <= "11" after DLY;
                

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "10"  and count_1_r = "10") then
                        count_1_r <= "11" after DLY;
              

            elsif (soft_err_r(2 to 3) = "01" and good_count_1_r = "11"  and count_1_r = "10") then
                        count_1_r <= "10" after DLY;
               

            elsif (soft_err_r(2 to 3) = "01" and count_1_r = "11") then
                        count_1_r <= "11" after DLY;
               

            elsif (soft_err_r(2 to 3) = "10" and count_1_r = "00") then
                       count_1_r <= "01" after DLY;
               

            elsif (soft_err_r(2 to 3) = "10" and count_1_r = "01") then
                        count_1_r <= "10" after DLY;
               

            elsif (soft_err_r(2 to 3) = "10" and count_1_r = "10") then
                        count_1_r <= "11" after DLY;
              

            elsif (soft_err_r(2 to 3) = "10" and count_1_r = "11") then
                        count_1_r <= "11" after DLY;
               

            elsif (soft_err_r(2 to 3) = "11" and count_1_r = "00") then
                        count_1_r <= "10" after DLY;
               

            elsif (soft_err_r(2 to 3) = "11" and count_1_r = "01") then
                        count_1_r <= "11" after DLY;
               
            elsif (soft_err_r(2 to 3) = "11" and count_1_r = "10") then
                        count_1_r <= "11" after DLY;
               

            elsif (soft_err_r(2 to 3) = "11" and count_1_r = "11") then
                        count_1_r <= "11" after DLY;
            else 
                       count_1_r <= count_1_r after DLY;
               

            end if;

        end if;

    end process;

    -- Detect when the bucket is full and register the signal.

    process (USER_CLK)

    variable leaky_bucket_1_v : std_logic_vector(5 downto 0);

    begin

        if (USER_CLK 'event and USER_CLK = '1') then

           if(not ENABLE_ERR_DETECT = '1') then

             bucket_full_1_r <= '0' after DLY;

           elsif (soft_err_r(2 to 3) = "01" and good_count_1_r  = "00" and count_1_r = "11") then
                        bucket_full_1_r <= '1';
                
           elsif (soft_err_r(2 to 3) = "01" and good_count_1_r  = "01" and count_1_r = "11") then
                        bucket_full_1_r <= '1';
                
           elsif (soft_err_r(2 to 3) = "01" and good_count_1_r  = "10" and count_1_r = "11") then
                        bucket_full_1_r <= '1';
                
           elsif (soft_err_r(2 to 3) = "01" and count_1_r = "11") then
                        bucket_full_1_r <= '1';
                
           elsif (soft_err_r(2 to 3) = "11" and count_1_r(0) = '1') then
                        bucket_full_1_r <= '1';
           else 
                        bucket_full_1_r <= '0';  
                

          end if;

        end if;

    end process;

end RTL;
