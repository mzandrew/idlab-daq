------------------------------------------------------------------------------/
--
--      Project:  Aurora Module Generator version 3.0
--
--         Date:  $Date: 2008/07/21 10:19:47 $
--          Tag:  $Name: i+IP+144966 $
--         File:  $RCSfile: rx_stream_vhd.ejava,v $
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

entity Aurora_RX_STREAM is
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
end Aurora_RX_STREAM;


architecture RTL of Aurora_RX_STREAM is
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
