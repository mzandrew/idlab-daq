--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--								University of Hawaii at Manoa						         --
--						Instrumentation Development Lab / GARY S. VARNER				--
--   								Watanabe Hall Room 214								      --
--  								  2505 Correa Road										   --
--  								 Honolulu, HI 96822											--
--  								Lab: (808) 956-2920											--
--	 								Fax: (808) 956-2930										   --
--  						E-mail: idlab@phys.hawaii.edu									   --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------	
-- Design by: Larry L. Ruckman Jr.															--
-- DATE : 23 JUNE 2007																			--
-- Project name: ICRR firmware																--
--	Module name: Aurora_MGT				  													--
--	Description : 																					--
-- 	Aurora_MGT																				--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------     

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.AURORA_PKG.all; 

-- synthesis translate_off
library UNISIM;
use UNISIM.all;
-- synthesis translate_on

entity Aurora_MGT is
	port (
	-- User I/O
		xLOOP_BACK			: in std_logic_vector(1 downto 0);
		xHARD_ERROR       : out std_logic;
      xSOFT_ERROR       : out std_logic;
		xTX_DATA				: in std_logic_vector(31 downto 0);
		xRX_DATA				: out std_logic_vector(31 downto 0);
      xTX_BUSY          : out std_logic;
      xRX_BUSY     	   : out std_logic;	
		xRESET           	: out std_logic;
		xLINK_ACTIVE      : out std_logic;
		xWARN_CC      		: out std_logic;
		xDO_CC      		: out std_logic;
		xRX_LOSS_N			: in std_logic;
    -- Clocks
		xREF_CLK				: in std_logic;
		xUSER_CLK			: in std_logic;
		xUSER_CLK_2X_N		: in std_logic;
		xDCM_NOT_LOCKED	: in std_logic;
    -- MGT I/O
		RXP               : in std_logic;
      RXN               : in std_logic;
      TXP               : out std_logic;
      TXN               : out std_logic);
end Aurora_MGT;

architecture MAPPED of Aurora_MGT is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------
	-- buffers --
		signal HARD_ERROR_Buffer   : std_logic;
		signal SOFT_ERROR_Buffer   : std_logic;
		signal TX_DATA_Buffer      : std_logic_vector(31 downto 0);
		signal TX_BUSY_Buffer      : std_logic;
		signal RX_DATA_Buffer      : std_logic_vector(31 downto 0);
		signal RX_BUSY_Buffer      : std_logic;
		signal RESET	     			: std_logic;
		signal WARN_CC	     			: std_logic;
		signal DO_CC	     			: std_logic;
		signal LINK_ACTIVE 			: std_logic;
		signal TX_SRC_RDY_N			: std_logic;
	-- Stream TX Interface
		signal tx_d_i             : std_logic_vector(31 downto 0);
		signal tx_dst_rdy_n_i     : std_logic;
	-- Stream RX Interface
		signal rx_d_i             : std_logic_vector(31 downto 0);
		signal rx_src_rdy_n_i     : std_logic;
	-- Error Detection Interface
		signal hard_error_i       : std_logic;
		signal soft_error_i       : std_logic;
--------------------------------------------------------------------------------
--   								components     		   						         --
--------------------------------------------------------------------------------
   component Aurora_reset
    Port ( 	CLK     : 	in std_logic; 	
          	WAKEUP  : 	in std_logic; 	
				Clr_all : 	out std_logic; 
           	GLRST   : 	out std_logic); 
   end component;
--------------------------------------------------------------------------------
	component Aurora_STANDARD_CC_MODULE
	port(
		-- Clock Compensation Control Interface
		WARN_CC        : out std_logic;
      DO_CC          : out std_logic;
		-- System Interface
		DCM_NOT_LOCKED : in std_logic;
      USER_CLK       : in std_logic;
      RESET          : in std_logic);
	end component;
--------------------------------------------------------------------------------
	component Aurora
		generic(                    
			EXTEND_WATCHDOGS   : boolean := TRUE);
		port(
      -- LocalLink TX Interface
		TX_D             : in std_logic_vector(31 downto 0);
      TX_SRC_RDY_N     : in std_logic;
		TX_DST_RDY_N     : out std_logic;
		-- LocalLink RX Interface
		RX_D             : out std_logic_vector(31 downto 0);
      RX_SRC_RDY_N     : out std_logic;
		-- MGT Serial I/O
		RXP              : in std_logic;
      RXN              : in std_logic;
		TXP              : out std_logic;
      TXN              : out std_logic;
		-- MGT Reference Clock Interface
		BOTTOM_REF_CLK   : in std_logic;
		-- Error Detection Interface
		HARD_ERROR       : out std_logic;
      SOFT_ERROR       : out std_logic;
		-- Status
		CHANNEL_UP       : out std_logic;
      LANE_UP          : out std_logic;
		-- Clock Compensation Control Interface
		WARN_CC          : in std_logic;
      DO_CC            : in std_logic;
		-- System Interface
		DCM_NOT_LOCKED   : in std_logic;
      USER_CLK         : in std_logic;
		USER_CLK_N_2X    : in std_logic;
      RESET            : in std_logic;
      POWER_DOWN       : in std_logic;
      LOOPBACK         : in std_logic_vector(1 downto 0));
	end component;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
   xHARD_ERROR <= HARD_ERROR_Buffer;
   xSOFT_ERROR	<= SOFT_ERROR_Buffer;
   xTX_BUSY   	<= TX_BUSY_Buffer or RESET or not(LINK_ACTIVE) or TX_SRC_RDY_N;
   xRX_BUSY		<= RX_BUSY_Buffer or RESET or not(LINK_ACTIVE);
	xRX_DATA		<= RX_DATA_Buffer;
	xRESET		<= RESET;
	xLINK_ACTIVE <= LINK_ACTIVE;
	xWARN_CC <= WARN_CC;
	xDO_CC <= DO_CC;
--------------------------------------------------------------------------------
	process(xUSER_CLK)
	begin
		if falling_edge(xUSER_CLK) then
			HARD_ERROR_Buffer <= hard_error_i;
         SOFT_ERROR_Buffer <= soft_error_i;
			TX_BUSY_Buffer    <= tx_dst_rdy_n_i;
			RX_BUSY_Buffer    <= rx_src_rdy_n_i;
			TX_DATA_Buffer  	<= xTX_DATA;
         RX_DATA_Buffer  	<= rx_d_i;		
			TX_SRC_RDY_N		<= DO_CC;	
		end if;
	end process;
--------------------------------------------------------------------------------
	xAurora_STANDARD_CC_MODULE : Aurora_STANDARD_CC_MODULE
	port map(
		-- Clock Compensation Control Interface
		WARN_CC        => WARN_CC,
      DO_CC          => DO_CC,
		-- System Interface
		DCM_NOT_LOCKED => xDCM_NOT_LOCKED,
      USER_CLK       => xUSER_CLK,
      RESET          => RESET);
--------------------------------------------------------------------------------
	xAurora_reset : Aurora_reset
	port map(		
		CLK 		=> xUSER_CLK,
		WAKEUP 	=> xRX_LOSS_N,
		Clr_all 	=> RESET,
		GLRST 	=> open);
--------------------------------------------------------------------------------
	xAurora : Aurora
   generic map(                    
		EXTEND_WATCHDOGS	=> FALSE)
	port map(
	-- LocalLink TX Interface
	TX_D             => TX_DATA_Buffer,
   TX_SRC_RDY_N     => TX_SRC_RDY_N,
	TX_DST_RDY_N     => tx_dst_rdy_n_i,
	-- LocalLink RX Interface
	RX_D             => rx_d_i,
   RX_SRC_RDY_N     => rx_src_rdy_n_i,
	-- MGT Serial I/O
	RXP              => RXP,
   RXN              => RXN,
   TXP              => TXP,
   TXN              => TXN,
	-- MGT Reference Clock Interface
	BOTTOM_REF_CLK  => xREF_CLK,
   -- Error Detection Interface
	HARD_ERROR       => hard_error_i,
	SOFT_ERROR       => soft_error_i,
	-- Status
	CHANNEL_UP       => LINK_ACTIVE,
   LANE_UP          => open,
	-- Clock Compensation Control Interface 
	WARN_CC          => WARN_CC,
   DO_CC            => DO_CC,
	-- System Interface
	DCM_NOT_LOCKED   => xDCM_NOT_LOCKED,
   USER_CLK         => xUSER_CLK,
   USER_CLK_N_2X    => xUSER_CLK_2X_N,
   RESET            => RESET,
   POWER_DOWN       => RESET,
   LOOPBACK         => xLOOP_BACK);
--------------------------------------------------------------------------------
end MAPPED;