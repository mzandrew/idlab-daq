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
--  TX_STREAM
--
--
--  Description: The TX_STREAM module converts user data from a streaming interface
--               to Aurora Data, then sends it to the Aurora Channel for transmission.
--               To perform streaming with Aurora, it starts an infinite frame after
--               channel up and performs opporunistic clock correction automatically
--
--               This module supports 2 4-byte lane designs
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;
use WORK.AURORA_PKG.all;

entity Aurora_IP_Core_A_TX_STREAM is
port
(
    -- Data interface
    TX_D                : in  std_logic_vector(0 to 31);
    TX_SRC_RDY_N        : in  std_logic;
    TX_DST_RDY_N        : out std_logic;


    -- Global Logic Interface
    CHANNEL_UP          : in  std_logic;


    -- Clock Correction Interface
    DO_CC               : in  std_logic;
    WARN_CC             : in  std_logic;
    

    -- Aurora Lane Interface
    GEN_SCP             : out std_logic;
    GEN_ECP             : out std_logic;
    TX_PE_DATA_V        : out std_logic_vector(0 to 1);
    GEN_PAD             : out std_logic_vector(0 to 1);
    TX_PE_DATA          : out std_logic_vector(0 to 31);
    GEN_CC              : out std_logic;


    -- System Interface
    USER_CLK            : in  std_logic


);
end Aurora_IP_Core_A_TX_STREAM;


architecture RTL of Aurora_IP_Core_A_TX_STREAM is

--************************Constant Declarations************************************

    constant DLY : time := 1 ns;
    

--************************Register Declarations************************************

    --State registers
    signal  rst_r                   : std_logic;
    signal  start_r                 : std_logic;
    signal  run_r                   : std_logic;
    
    signal  tx_dst_rdy_n_r          : std_logic;        
    
    
--*********************************Wire Declarations**********************************

    --FSM nextstate signals
    signal  next_start_c            : std_logic;
    signal  next_run_c              : std_logic;


--*********************************Main Body of Code**********************************
begin


    --____________________________  Data Interface Signals__________________________
    

    -- Data interface is ready when the channel is up and running and not forcing a cc
    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK = '1') then
            tx_dst_rdy_n_r  <=   not CHANNEL_UP or not run_r or DO_CC after DLY;
        end if;
    end process;
    
         
    TX_DST_RDY_N   <=   tx_dst_rdy_n_r;   
    
    
    
    --____________________________  Aurora Lane Interface Signals __________________

    
    -- Generate CCs whenever DO_CC is asserted. Register the signal to line it up
    -- with the cycle when TX_DST_RDY_N is deasserted
    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK = '1') then
            GEN_CC  <=  DO_CC   after DLY;
        end if;
    end process;
                                
    
    
    -- Send an SCP to start the infinite frame
    GEN_SCP         <=   start_r;
    
    
    -- Never send ECPs or PADs
    GEN_ECP         <=   '0';
    GEN_PAD         <=   (others => '0');
    
    
    
    
    -- Send the user's data directly to the Aurora Lane 
    TX_PE_DATA      <=   TX_D;
    
    
    -- The data is valid if it is written when the channel is ready and TX_SRC_RDY_N is asserted
    TX_PE_DATA_V(0)   <=   not tx_dst_rdy_n_r and not TX_SRC_RDY_N;
    TX_PE_DATA_V(1)   <=   not tx_dst_rdy_n_r and not TX_SRC_RDY_N;




    
    
    --_______________  State machine to start infinite frame ______________
    

    -- After channel up, the tx_stream module sends an SCP character
    -- to start the inifinite frame that will carry the data stream, then 
    -- goes to the run state.


    --Control state machine state registers
    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK = '1') then
            if(CHANNEL_UP = '0') then
                rst_r       <=  '1' after DLY;
                start_r     <=  '0' after DLY;
                run_r       <=  '0' after DLY;
            elsif(DO_CC = '0') then
                rst_r       <=  '0' after DLY;
                start_r     <=  next_start_c after DLY;
                run_r       <=  next_run_c after DLY;
            end if;
        end if;
    end process;


    --Nextstate logic
    
    -- After reset, sent the SCP character to open the infinite 
    -- frame 
    next_start_c            <=  rst_r;

    
    -- After the start state, go to normal operation
    next_run_c              <=  start_r or
                                run_r;
      
    

end RTL;
