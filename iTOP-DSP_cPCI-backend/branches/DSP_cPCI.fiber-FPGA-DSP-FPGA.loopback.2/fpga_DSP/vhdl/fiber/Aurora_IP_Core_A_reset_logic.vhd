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
---------------------------------------------------------------------------------------------
--  AURORA RESET LOGIC
--
--
--  Description: RESET logic using Debouncer 
--
--         

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
-- synthesis translate_on

entity Aurora_IP_Core_A_RESET_LOGIC is
    port (

    -- User I/O

           RESET                  : in std_logic;
           USER_CLK               : in std_logic;
           INIT_CLK               : in std_logic;
           GT_RESET_IN            : in std_logic;
           TX_LOCK_IN             : in std_logic;
           PLL_NOT_LOCKED         : in std_logic;

           SYSTEM_RESET           : out std_logic;
           GT_RESET_OUT           : out std_logic
         );

end Aurora_IP_Core_A_RESET_LOGIC;

architecture MAPPED of Aurora_IP_Core_A_RESET_LOGIC is
  attribute core_generation_info           : string;
  attribute core_generation_info of MAPPED : architecture is "Aurora_IP_Core_A,aurora_8b10b_v5_2,{backchannel_mode=Sidebands, c_aurora_lanes=1, c_column_used=None, c_gt_clock_1=GTPD2, c_gt_clock_2=None, c_gt_loc_1=X, c_gt_loc_10=X, c_gt_loc_11=X, c_gt_loc_12=X, c_gt_loc_13=X, c_gt_loc_14=X, c_gt_loc_15=X, c_gt_loc_16=X, c_gt_loc_17=X, c_gt_loc_18=X, c_gt_loc_19=X, c_gt_loc_2=X, c_gt_loc_20=X, c_gt_loc_21=X, c_gt_loc_22=X, c_gt_loc_23=X, c_gt_loc_24=X, c_gt_loc_25=X, c_gt_loc_26=X, c_gt_loc_27=X, c_gt_loc_28=X, c_gt_loc_29=X, c_gt_loc_3=X, c_gt_loc_30=X, c_gt_loc_31=X, c_gt_loc_32=X, c_gt_loc_33=X, c_gt_loc_34=X, c_gt_loc_35=X, c_gt_loc_36=X, c_gt_loc_37=X, c_gt_loc_38=X, c_gt_loc_39=X, c_gt_loc_4=X, c_gt_loc_40=X, c_gt_loc_41=X, c_gt_loc_42=X, c_gt_loc_43=X, c_gt_loc_44=X, c_gt_loc_45=X, c_gt_loc_46=X, c_gt_loc_47=X, c_gt_loc_48=X, c_gt_loc_5=1, c_gt_loc_6=X, c_gt_loc_7=X, c_gt_loc_8=X, c_gt_loc_9=X, c_lane_width=4, c_line_rate=3.125, c_nfc=false, c_nfc_mode=IMM, c_refclk_frequency=156.25, c_simplex=false, c_simplex_mode=TX, c_stream=true, c_ufc=false, flow_mode=None, interface_mode=Streaming, dataflow_config=Duplex}";

-- Parameter Declarations --

    constant DLY : time := 1 ns;

-- Internal Register Declarations --

    signal reset_debounce_r   : std_logic_vector(0 to 3);
    signal debounce_gt_rst_r  : std_logic_vector(0 to 3);
    signal reset_debounce_r2  : std_logic;
    signal reset_debounce_r3  : std_logic;
    signal reset_debounce_r4  : std_logic;
    signal gt_rst_r           : std_logic; 
    signal init_clk_i         : std_logic; 
    attribute ASYNC_REG       : string;
    attribute ASYNC_REG of GT_RESET_IN : signal is "TRUE";

-- Component Declarations --

    component IBUFG

        port (

                O : out std_ulogic;
                I : in  std_ulogic

             );

    end component;


begin

                                  -- Main Body of Code --
                 


    -- Assign an IBUFG to INIT_CLK
--    init_clk_ibufg_i : IBUFG 
--    port map
--    (
--        I   =>  INIT_CLK,
--        O   =>  init_clk_i
--    );
	 init_clk_i <= INIT_CLK;

    -- ___________________________Debouncing circuit for GT_RESET_IN________________________
    -- Debounce the GT_RESET_IN signal using the INIT_CLK
    process(init_clk_i)
    begin
        if(init_clk_i'event and init_clk_i='1') then
            debounce_gt_rst_r <=  GT_RESET_IN & debounce_gt_rst_r(0 to 2);
        end if;
    end process;
        
    gt_rst_r  <=   debounce_gt_rst_r(0) and 
                   debounce_gt_rst_r(1) and
                   debounce_gt_rst_r(2) and
                   debounce_gt_rst_r(3);

    GT_RESET_OUT  <=   gt_rst_r;

    -- _______________________Debounce the Reset signal________________________ --

    -- Simple Debouncer for Reset button. The debouncer has an
    -- asynchronous reset tied to GT_RESET_IN. This is primarily for simulation, to ensure
    -- that unknown values are not driven into the reset line
    process (USER_CLK, gt_rst_r)
    begin
        if (gt_rst_r = '1') then
            reset_debounce_r <= "1111";
        elsif (USER_CLK 'event and USER_CLK = '1') then
--            reset_debounce_r <= not RESET & reset_debounce_r(0 to 2);
            reset_debounce_r <= RESET & reset_debounce_r(0 to 2);  -- Kurtis
        end if;
    end process;

    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK='1') then
            reset_debounce_r2 <=  (reset_debounce_r(0) and 
                                  reset_debounce_r(1) and
                                  reset_debounce_r(2) and
                                  reset_debounce_r(3));
            reset_debounce_r3 <=  reset_debounce_r2 or (not TX_LOCK_IN);
            reset_debounce_r4 <=  reset_debounce_r3;
        end if;
    end process;

    SYSTEM_RESET <=  (reset_debounce_r4 or PLL_NOT_LOCKED);

end MAPPED;
