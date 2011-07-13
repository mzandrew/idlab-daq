------------------------------------------------------------------------------/
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
--  RX_STREAM
--
--
--  Description: The RX_LL module receives data from the Aurora Channel,
--               converts it to a simple streaming format. This module expects
--               all data to be carried in a single, infinite frame, and it 
--               expects the data data in lanes to be all valid or all invalid
--
--               This module supports 2 4-byte lane designs.
--
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use WORK.AURORA_PKG.all;

entity Aurora_IP_Core_A_RX_STREAM is
port
(
    -- LocalLink PDU Interface
    RX_D         : out std_logic_vector(0 to 31);
    RX_SRC_RDY_N    : out std_logic;


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
end Aurora_IP_Core_A_RX_STREAM;


architecture RTL of Aurora_IP_Core_A_RX_STREAM is
--************************Constant Declarations********************

    constant DLY    :   time := 1 ns;
    constant ZERO   :   std_logic_vector(0 to 1) := (others => '0');


--************************Register Declarations********************
    
    signal  infinite_frame_started_r    : std_logic;


--***********************Main Body of Code*************************
begin


    
    -- Don't start presenting data until the infinite frame starts.
    -- SCP is expected to be in lane 0
    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK = '1') then
            if(START_RX = '0') then
                infinite_frame_started_r    <=  '0' after DLY;
            elsif(RX_SCP /= ZERO ) then
                infinite_frame_started_r    <=  '1' after DLY;
            end if;
        end if;
    end process;
    
        
    RX_D         <=   RX_PE_DATA;
    
    RX_SRC_RDY_N    <=   not (RX_PE_DATA_V(0) and infinite_frame_started_r);
    
    
    
end RTL;
