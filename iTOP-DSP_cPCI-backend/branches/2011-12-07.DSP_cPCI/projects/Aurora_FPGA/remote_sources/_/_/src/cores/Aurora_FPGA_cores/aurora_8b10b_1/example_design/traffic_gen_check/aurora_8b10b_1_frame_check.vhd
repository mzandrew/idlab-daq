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
--  FRAME_CHECK
--
--
--
--  Description: This module is a  pattern checker to test the Aurora
--               designs in hardware. The frames generated by FRAME_GEN
--               pass through the Aurora channel and arrive at the frame checker 
--               through the RX User interface. Every time an error is found in
--               the data recieved, the error count is incremented until it 
--               reaches its max value.


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use WORK.AURORA_PKG.all; 

-- synthesis translate_off
library UNISIM;
use UNISIM.all;
-- synthesis translate_on


entity aurora_8b10b_1_FRAME_CHECK is
port
(
    -- User Interface
    RX_D            : in  std_logic_vector(0 to 31); 
    RX_SRC_RDY_N    : in  std_logic;


    -- System Interface
    USER_CLK        : in  std_logic;   
    RESET           : in  std_logic;
    CHANNEL_UP      : in  std_logic;
    ERR_COUNT       : out std_logic_vector(0 to 7)
  
);
end aurora_8b10b_1_FRAME_CHECK;



architecture RTL of aurora_8b10b_1_FRAME_CHECK is

--***********************************Parameter Declarations***************************

    constant DLY : time := 1 ns;

--***************************Internal Register Declarations*************************** 
    signal  tied_to_ground           :   std_logic_vector(23 downto 0);
    signal  reset_c                  :   std_logic;

    signal  data_lfsr_r              :   std_logic_vector(0 to 15);
    signal  data_err_detected_c    :   std_logic;
    signal  data_err_detected_r    :   std_logic;
    --temporary signal for ERR_COUNT
    signal  err_count_tmp          :   std_logic_vector(0 to 8);
    
    signal  data_valid_c             :   std_logic;
    
    signal  data_lfsr_concat_w       :   std_logic_vector(0 to 31);


begin
--*********************************Main Body of Code**********************************

    tied_to_ground <= (others => '0');	

    --Generate RESET signal when Aurora channel is not ready
    reset_c <= RESET or not CHANNEL_UP;

    --______________________________ Capture incoming data ___________________________    
    --Data is valid when RX_SRC_RDY_N is asserted
    data_valid_c    <=   not RX_SRC_RDY_N;
    

    --generate expected RX_D using Data LFSR
    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK='1') then
            if(reset_c = '1') then
                data_lfsr_r     <=  X"D5E6" after DLY;  --random seed value
            elsif(data_valid_c='1') then
                data_lfsr_r <= (not(data_lfsr_r(3) xor data_lfsr_r(12) xor data_lfsr_r(14) xor data_lfsr_r(15)) & 
                                data_lfsr_r(0 to 14)) after DLY;
            end if;
        end if;
    end process; 
  
    data_lfsr_concat_w <= (data_lfsr_r & data_lfsr_r); 

    
    --___________________________ Check incoming data for errors __________________________
    --An error is detected when LFSR generated RX data from the data_lfsr_concat_w register, 
    --does not match valid data from the RX_D port
    data_err_detected_c    <= (data_valid_c and std_bool(RX_D /= data_lfsr_concat_w));

    --We register the data_err_detected_c signal for use with the error counter logic
    process(USER_CLK)
    begin
        if(USER_CLK'event and USER_CLK = '1') then
          data_err_detected_r    <=  data_err_detected_c after DLY;
        end if;
    end process;
   
    --Compare the incoming data with calculated expected data.
    --Increment the ERROR COUNTER if mismatch occurs.
    --Stop the ERROR COUNTER once it reaches its max value (i.e. 255)    
    process(USER_CLK)
    begin
      if(USER_CLK'event and USER_CLK = '1') then
        if(reset_c = '1') then
          err_count_tmp <= (others => '0') after DLY;
        elsif(err_count_tmp = X"1FF") then
          err_count_tmp <= err_count_tmp after DLY;
        elsif(data_err_detected_r = '1') then
          err_count_tmp <= err_count_tmp + 1 after DLY;  
        end if;
      end if;
    end process;

    --Here we connect the lower 8 bits of the count (the MSbit is used only to check when the counter reaches
    --max value) to the module output
    ERR_COUNT <= err_count_tmp(1 to 8);

end RTL;
