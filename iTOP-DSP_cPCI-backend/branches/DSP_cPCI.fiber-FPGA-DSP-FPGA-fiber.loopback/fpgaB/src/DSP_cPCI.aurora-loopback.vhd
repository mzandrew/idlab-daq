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
--  AURORA_EXAMPLE
--
--  Aurora Generator
--
--
--
--  Description: Receives data, adds one to it and sends the data back
--               
--
--         

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_MISC.all;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.NUMERIC_STD.all;
use WORK.AURORA_PKG.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
-- synthesis translate_on

entity fpga_B is
   generic(
           USE_CHIPSCOPE          : integer :=   1;
           SIM_GTPRESET_SPEEDUP   : integer :=   1      --Set to 1 to speed up sim reset
         );
    port (
    -- User I/O
--            RESET             : in std_logic;
            HARD_ERR          : out std_logic;
            SOFT_ERR          : out std_logic;
            ERR_COUNT         : out std_logic_vector(0 to 7);
            LANE_UP           : out std_logic;
            CHANNEL_UP        : out std_logic;
--            INIT_CLK          : in std_logic;
--            GT_RESET_IN       : in  std_logic;
    -- Clocks
				MGTCLK0_P : out std_logic;
				MGTCLK0_N : out std_logic;
				MGTCLK1_P : out std_logic;
				MGTCLK1_N : out std_logic;
--           GTPD2_P    : in  std_logic;
--           GTPD2_N    : in  std_logic;
           GTPD0_P    : in  std_logic;
           GTPD0_N    : in  std_logic;
    -- V5 I/O
            RXP               : in std_logic;
            RXN               : in std_logic;
            TXP               : out std_logic;
            TXN               : out std_logic;
				
				MON_A0				: out std_logic;

	-- Specific to SCROD 
				FIBER_TRANSCEIVER_0_MODULE_DEFINITION_0_LOW_IF_PRESENT : in std_logic;
				FIBER_TRANSCEIVER_1_MODULE_DEFINITION_0_LOW_IF_PRESENT : in std_logic;
				FIBER_TRANSCEIVER_0_DISABLE_MODULE		: out std_logic;
				FIBER_TRANSCEIVER_1_DISABLE_MODULE		: out std_logic;	
--				BOARD_CLOCKP		: in std_logic;
--				BOARD_CLOCKN		: in std_logic;				
				BOARD_CLOCK : in std_logic;
				LEDS					: out std_logic_vector(15 downto 0);
				
				--Transceiver pins
				FIBER_TRANSCEIVER_0_LASER_FAULT_DETECTED_IN_TRANSMITTER : in std_logic;
				FIBER_TRANSCEIVER_1_LASER_FAULT_DETECTED_IN_TRANSMITTER : in std_logic;
				FIBER_TRANSCEIVER_0_LOSS_OF_SIGNAL_DETECTED_BY_RECEIVER : in std_logic;
				FIBER_TRANSCEIVER_1_LOSS_OF_SIGNAL_DETECTED_BY_RECEIVER : in std_logic
         );

end fpga_B;

architecture MAPPED of fpga_B is
  attribute core_generation_info           : string;
  attribute core_generation_info of MAPPED : architecture is "Aurora_IP_Core_A,aurora_8b10b_v5_2,{backchannel_mode=Sidebands, c_aurora_lanes=1, c_column_used=None, c_gt_clock_1=GTPD2, c_gt_clock_2=None, c_gt_loc_1=X, c_gt_loc_10=X, c_gt_loc_11=X, c_gt_loc_12=X, c_gt_loc_13=X, c_gt_loc_14=X, c_gt_loc_15=X, c_gt_loc_16=X, c_gt_loc_17=X, c_gt_loc_18=X, c_gt_loc_19=X, c_gt_loc_2=X, c_gt_loc_20=X, c_gt_loc_21=X, c_gt_loc_22=X, c_gt_loc_23=X, c_gt_loc_24=X, c_gt_loc_25=X, c_gt_loc_26=X, c_gt_loc_27=X, c_gt_loc_28=X, c_gt_loc_29=X, c_gt_loc_3=X, c_gt_loc_30=X, c_gt_loc_31=X, c_gt_loc_32=X, c_gt_loc_33=X, c_gt_loc_34=X, c_gt_loc_35=X, c_gt_loc_36=X, c_gt_loc_37=X, c_gt_loc_38=X, c_gt_loc_39=X, c_gt_loc_4=X, c_gt_loc_40=X, c_gt_loc_41=X, c_gt_loc_42=X, c_gt_loc_43=X, c_gt_loc_44=X, c_gt_loc_45=X, c_gt_loc_46=X, c_gt_loc_47=X, c_gt_loc_48=X, c_gt_loc_5=1, c_gt_loc_6=X, c_gt_loc_7=X, c_gt_loc_8=X, c_gt_loc_9=X, c_lane_width=4, c_line_rate=3.125, c_nfc=false, c_nfc_mode=IMM, c_refclk_frequency=156.25, c_simplex=false, c_simplex_mode=TX, c_stream=true, c_ufc=false, flow_mode=None, interface_mode=Streaming, dataflow_config=Duplex}";

-- Parameter Declarations --
    constant DLY : time := 1 ns;

-- External Register Declarations --
    signal HARD_ERR_Buffer    : std_logic;
    signal SOFT_ERR_Buffer    : std_logic;
    signal LANE_UP_Buffer     : std_logic;
    signal CHANNEL_UP_Buffer  : std_logic;
    signal TXP_Buffer         : std_logic;
    signal TXN_Buffer         : std_logic;

-- Internal Register Declarations --
    signal gt_reset_i         : std_logic; 
    signal system_reset_i     : std_logic;
 
-- Wire Declarations --

    -- Stream TX Interface
    signal tx_d_i             : std_logic_vector(0 to 31) := X"00000000";
    signal tx_src_rdy_n_i     : std_logic;
    signal tx_dst_rdy_n_i     : std_logic;

    -- Stream RX Interface
    signal rx_d_i             : std_logic_vector(0 to 31);
    signal rx_src_rdy_n_i     : std_logic;
	 signal rx_d_i_r				: std_logic_vector(0 to 31);

    -- V5 Reference Clock Interface
    signal GTPD0_left_i      : std_logic;

    -- Error Detection Interface
    signal hard_err_i       : std_logic;
    signal soft_err_i       : std_logic;

    -- Status
    signal channel_up_i       : std_logic;
    signal lane_up_i          : std_logic;

    -- Clock Compensation Control Interface
    signal warn_cc_i          : std_logic;
    signal do_cc_i            : std_logic;

    -- System Interface
    signal pll_not_locked_i   : std_logic;
    signal user_clk_i         : std_logic;
    signal sync_clk_i         : std_logic;
    signal reset_i            : std_logic;
    signal power_down_i       : std_logic;
    signal loopback_i         : std_logic_vector(2 downto 0);
    signal tx_lock_i          : std_logic;
    signal gtpclkout_i        : std_logic;
    signal buf_gtpclkout_i    : std_logic;
	 
    --Frame check signals
    signal err_count_i      : std_logic_vector(0 to 7);
    signal ERR_COUNT_Buffer : std_logic_vector(0 to 7);

   signal lane_up_i_i  	      : std_logic;
   signal tx_lock_i_i  	      : std_logic;
   signal lane_up_reduce_i    : std_logic;
   attribute ASYNC_REG        : string;
   attribute ASYNC_REG of tx_lock_i  : signal is "TRUE";

   -------Kurtis additions------------
	signal internal_BOARD_CLOCK : std_logic;
	signal internal_COUNTER : std_logic_vector(31 downto 0);
	signal INIT_CLK : std_logic;
	signal RESET : std_logic := '1';
	signal GT_RESET_IN : std_logic := '1';
	signal rx_char_is_comma_i : std_logic_vector(3 downto 0);
	signal lane_init_state_i  : std_logic_vector(6 downto 0);
	signal reset_lanes_i : std_logic;
	signal tx_pe_data_i : std_logic_vector(31 downto 0);
   -----------------------------------

	-- Component Declarations --
    component IBUFDS
    port (
                O : out std_ulogic;
                I : in std_ulogic;
                IB : in std_ulogic);
    end component;

    component IBUFGDS
    port (
                O  :  out STD_ULOGIC;
                I  : in STD_ULOGIC;
                IB : in STD_ULOGIC);
    end component;

    component OBUFDS
    port (
                I  : in  STD_ULOGIC;
                O  : out STD_ULOGIC;
                OB : out STD_ULOGIC);
    end component;

    component BUFIO2 

    generic(

      DIVIDE_BYPASS : boolean := TRUE;  -- TRUE, FALSE
      DIVIDE        : integer := 1;     -- {1..8}
      I_INVERT      : boolean := FALSE; -- TRUE, FALSE
      USE_DOUBLER   : boolean := FALSE  -- TRUE, FALSE
      );

    port(
      DIVCLK       : out std_ulogic;
      IOCLK        : out std_ulogic;
      SERDESSTROBE : out std_ulogic;
      I            : in  std_ulogic
    );
    end component;
    component IBUFG
        port (
                O : out std_ulogic;
                I : in  std_ulogic
             );
    
    end component;

    component Aurora_IP_Core_A_CLOCK_MODULE
        port (
                GT_CLK                  : in std_logic;
                GT_CLK_LOCKED           : in std_logic;
                USER_CLK                : out std_logic;
                SYNC_CLK                : out std_logic;
                PLL_NOT_LOCKED          : out std_logic
             );
    end component;

    component Aurora_IP_Core_A_RESET_LOGIC
        port (
                RESET                  : in std_logic;
                USER_CLK               : in std_logic;
                INIT_CLK               : in std_logic;
                GT_RESET_IN            : in std_logic;
                TX_LOCK_IN             : in std_logic;
                PLL_NOT_LOCKED         : in std_logic;

                SYSTEM_RESET           : out std_logic;
                GT_RESET_OUT           : out std_logic
             );
    end component;

    component Aurora_IP_Core_A
        generic(
                 SIM_GTPRESET_SPEEDUP :integer := 1
               );
        port   (
        -- LocalLink TX Interface
                TX_D             : in std_logic_vector(0 to 31);
                TX_SRC_RDY_N     : in std_logic;
                TX_DST_RDY_N     : out std_logic;
        -- LocalLink RX Interface
                RX_D             : out std_logic_vector(0 to 31);
                RX_SRC_RDY_N     : out std_logic;
        -- V5 Serial I/O
                RXP              : in std_logic;
                RXN              : in std_logic;
                TXP              : out std_logic;
                TXN              : out std_logic;
        -- V5 Reference Clock Interface
                GTPD2    			: in std_logic;
        -- Error Detection Interface
                HARD_ERR       	: out std_logic;
                SOFT_ERR       	: out std_logic;
        -- Status
                CHANNEL_UP       : out std_logic;
                LANE_UP          : out std_logic;
        -- Clock Compensation Control Interface
                WARN_CC          : in std_logic;
                DO_CC            : in std_logic;
        -- System Interface
                USER_CLK         : in std_logic;
                SYNC_CLK         : in std_logic;
                GT_RESET         : in std_logic;
                RESET            : in std_logic;
                POWER_DOWN       : in std_logic;
                LOOPBACK         : in std_logic_vector(2 downto 0);
                GTPCLKOUT        : out std_logic;
                TX_LOCK          : out std_logic;			 
			--Kurtis added
					 RX_CHAR_IS_COMMA : out std_logic_vector(3 downto 0);
					 LANE_INIT_STATE  : out std_logic_vector(6 downto 0);
					 RESET_LANES      : out std_logic;
					 TX_PE_DATA			: out std_logic_vector(31 downto 0)
            );
    end component;

    component Aurora_IP_Core_A_STANDARD_CC_MODULE
        port (
        -- Clock Compensation Control Interface
                WARN_CC        : out std_logic;
                DO_CC          : out std_logic;
        -- System Interface
                PLL_NOT_LOCKED : in std_logic;
                USER_CLK       : in std_logic;
                RESET          : in std_logic
             );
    end component;

---------------------CHIPSCOPE
	component s6_icon
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
	end component;

	component s6_ila
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 TRIG0 : IN STD_LOGIC_VECTOR(126 DOWNTO 0));
	end component;
	
	component chipscope_vio
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 SYNC_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	end component;

	signal CHIPSCOPE_CONTROL0	: std_logic_vector(35 downto 0);
	signal CHIPSCOPE_CONTROL1	: std_logic_vector(35 downto 0);
	signal VIO_OUT					: std_logic_vector(7 downto 0);
	
	-- Synplicity black box declaration
	attribute syn_black_box : boolean;
	attribute syn_black_box of s6_icon: component is true;
	attribute syn_black_box of s6_ila: component is true;
---------------------END CHIPSCOPE

begin
    lane_up_reduce_i    <=  lane_up_i;

    HARD_ERR  <= HARD_ERR_Buffer;
    SOFT_ERR  <= SOFT_ERR_Buffer;
    ERR_COUNT   <= ERR_COUNT_Buffer;
    LANE_UP     <= LANE_UP_Buffer;
    CHANNEL_UP  <= CHANNEL_UP_Buffer;
    TXP         <= TXP_Buffer;
    TXN         <= TXN_Buffer;

	 INIT_CLK <= internal_COUNTER(2);
--	 TX_DISCONNECT0 <= '0';	
--	 TX_DISCONNECT1 <= '1';
	FIBER_TRANSCEIVER_0_DISABLE_MODULE <= '1';
--	FIBER_TRANSCEIVER_0_DISABLE_MODULE <= reset_i;
--	FIBER_TRANSCEIVER_1_DISABLE_MODULE <= '0';
	FIBER_TRANSCEIVER_1_DISABLE_MODULE <= reset_i;
	-- green = 0, 2
	LEDS(0) <= CHANNEL_UP_Buffer;
	LEDS(1) <= HARD_ERR_Buffer or SOFT_ERR_Buffer;
	LEDS(2) <= internal_COUNTER(27);
	LEDS(3) <= FIBER_TRANSCEIVER_1_LASER_FAULT_DETECTED_IN_TRANSMITTER or FIBER_TRANSCEIVER_1_LOSS_OF_SIGNAL_DETECTED_BY_RECEIVER;
--	 LEDS(4) <= TX_FAULT0;
	LEDS(4) <= FIBER_TRANSCEIVER_1_LASER_FAULT_DETECTED_IN_TRANSMITTER;
--	 LEDS(5) <= RX_LOS0;
	LEDS(5) <= FIBER_TRANSCEIVER_1_LOSS_OF_SIGNAL_DETECTED_BY_RECEIVER;
	 LEDS(6) <= tx_lock_i;
	 LEDS(7) <= pll_not_locked_i;
--	 LEDS(7) <= internal_COUNTER(26);
	 LEDS(15 downto 8) <= ERR_COUNT_Buffer;
------------------------------------------
	process(internal_BOARD_CLOCK) begin
	if rising_edge(internal_BOARD_CLOCK) then
		internal_COUNTER <= internal_COUNTER + 1;
	end if;
	end process;
	process(internal_COUNTER(27)) begin
	if rising_edge(internal_COUNTER(27)) then
		RESET <= '0';
		GT_RESET_IN <= '0';
	end if;
	end process;
---------------------------------------

--	IBUFGDS_i :  IBUFGDS port map (I  => BOARD_CLOCKP, IB => BOARD_CLOCKN, O  => internal_BOARD_CLOCK);
	IBUFG_i :  IBUFG port map (I  => BOARD_CLOCK, O  => internal_BOARD_CLOCK);
	OBUFDS_0i :  OBUFDS port map (I  => internal_BOARD_CLOCK, O => MGTCLK0_P, OB  => MGTCLK0_N);
	OBUFDS_1i :  OBUFDS port map (I  => internal_BOARD_CLOCK, O => MGTCLK1_P, OB  => MGTCLK1_N);
    -- ___________________________Clock Buffers________________________
   IBUFDS_i :  IBUFDS port map (I  => GTPD0_P, IB => GTPD0_N, O  => GTPD0_left_i);

    BUFIO2_i : BUFIO2 generic map (
        DIVIDE                          =>      1,
        DIVIDE_BYPASS                   =>      TRUE
    ) port map (
        I                               =>      gtpclkout_i,
        DIVCLK                          =>      buf_gtpclkout_i,
        IOCLK                           =>      open,
        SERDESSTROBE                    =>      open
    );

    -- Instantiate a clock module for clock division
    clock_module_i : Aurora_IP_Core_A_CLOCK_MODULE
        port map (
                    GT_CLK              => buf_gtpclkout_i,
                    GT_CLK_LOCKED       => tx_lock_i,
                    USER_CLK            => user_clk_i,
                    SYNC_CLK            => sync_clk_i,
                    PLL_NOT_LOCKED      => pll_not_locked_i
                 );

    -- Register User I/O --
    -- Register User Outputs from core.
    process (user_clk_i)
    begin
        if (user_clk_i 'event and user_clk_i = '1') then
            HARD_ERR_Buffer  <= hard_err_i;
            SOFT_ERR_Buffer  <= soft_err_i;
            ERR_COUNT_Buffer <= err_count_i;
            LANE_UP_Buffer     <= lane_up_i;
            CHANNEL_UP_Buffer  <= channel_up_i;
        end if;
    end process;

    -- System Interface
    power_down_i     <= '0';
    loopback_i       <= "000";

    -- _______________________________ Module Instantiations ________________________--

	loopback: process(user_clk_i)
	begin
		if rising_edge(user_clk_i) then
			if reset_i = '1' then
				tx_d_i <= X"00000000";
				tx_src_rdy_n_i <= '1';
			else
				tx_d_i <= std_logic_vector(unsigned(rx_d_i) + 1);
				tx_src_rdy_n_i <= rx_src_rdy_n_i;
			end if;
			rx_d_i_r <= rx_d_i;
		end if;
	end process loopback;

    -- Module Instantiations --
    aurora_module_i : Aurora_IP_Core_A
        generic map(
                    SIM_GTPRESET_SPEEDUP => SIM_GTPRESET_SPEEDUP
                   )
        port map   (
        -- LocalLink TX Interface
                    TX_D             => tx_d_i,
                    TX_SRC_RDY_N     => tx_src_rdy_n_i,
                    TX_DST_RDY_N     => tx_dst_rdy_n_i,		--TX valid if '0'
        -- LocalLink RX Interface
                    RX_D             => rx_d_i,
                    RX_SRC_RDY_N     => rx_src_rdy_n_i,
        -- V5 Serial I/O
                    RXP              => RXP,
                    RXN              => RXN,
                    TXP              => TXP_Buffer,
                    TXN              => TXN_Buffer,
        -- V5 Reference Clock Interface
                   GTPD2    => GTPD0_left_i,
        -- Error Detection Interface
                    HARD_ERR       => hard_err_i,
                    SOFT_ERR       => soft_err_i,
        -- Status
                    CHANNEL_UP       => channel_up_i,
                    LANE_UP          => lane_up_i,
        -- Clock Compensation Control Interface
                    WARN_CC          => warn_cc_i,
                    DO_CC            => do_cc_i,
        -- System Interface
                    USER_CLK         => user_clk_i,
                    SYNC_CLK         => sync_clk_i,
                    RESET            => reset_i,
                    POWER_DOWN       => power_down_i,
                    LOOPBACK         => loopback_i,
                    GT_RESET         => gt_reset_i,
                    GTPCLKOUT        => gtpclkout_i,
                    TX_LOCK          => tx_lock_i,
			-- Kurtis added
						  RX_CHAR_IS_COMMA => rx_char_is_comma_i,
						  LANE_INIT_STATE  => lane_init_state_i,
						  RESET_LANES      => reset_lanes_i,
						  TX_PE_DATA       => tx_pe_data_i
                 );

    standard_cc_module_i : Aurora_IP_Core_A_STANDARD_CC_MODULE
        port map (
        -- Clock Compensation Control Interface
                    WARN_CC        => warn_cc_i,
                    DO_CC          => do_cc_i,
        -- System Interface
                    PLL_NOT_LOCKED => pll_not_locked_i,
                    USER_CLK       => user_clk_i,
                    RESET          => not(lane_up_reduce_i)
                 );

    reset_logic_i : Aurora_IP_Core_A_RESET_LOGIC
        port map (
                    RESET            => RESET,
                    USER_CLK         => user_clk_i,
                    INIT_CLK         => INIT_CLK,
                    GT_RESET_IN      => GT_RESET_IN,
                    TX_LOCK_IN       => tx_lock_i,
                    PLL_NOT_LOCKED   => pll_not_locked_i,
                    SYSTEM_RESET     => system_reset_i,
                    GT_RESET_OUT     => gt_reset_i
                 );
					  
------------CHIPSCOPE
	chipscope_icon : s6_icon
	  port map (
		 CONTROL0 => CHIPSCOPE_CONTROL0,
		 CONTROL1 => CHIPSCOPE_CONTROL1);

	S6_VIO : chipscope_vio
	  port map (
		 CONTROL => CHIPSCOPE_CONTROL1,
		 CLK => user_clk_i,
		 SYNC_OUT => VIO_OUT);
		 
	MON_A0 <= VIO_OUT(0);
		 
	chipscope_ila : s6_ila
	  port map (
		 CONTROL => CHIPSCOPE_CONTROL0,
		 CLK => user_clk_i,
		 TRIG0 => VIO_OUT(0) & rx_d_i_r & tx_d_i & tx_src_rdy_n_i & tx_dst_rdy_n_i & rx_src_rdy_n_i 
		 & (58 downto 0 => '0'));
------------END CHIPSCOPE

end MAPPED;
