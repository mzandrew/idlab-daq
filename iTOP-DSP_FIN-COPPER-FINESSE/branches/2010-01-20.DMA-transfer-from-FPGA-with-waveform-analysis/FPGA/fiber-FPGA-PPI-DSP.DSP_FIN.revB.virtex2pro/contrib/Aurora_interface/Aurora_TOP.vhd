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
-- DATE : 23 JUNE 2009																			--
-- Project name: ICRR firmware																--
--	Module name: Aurora_TOP				  														--
--	Description : 																					--
-- 	Aurora Top Level																			--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Aurora_TOP is
	port ( 
	-- Fiber Link I/Os
		MOD0      : in  std_logic_vector(3 downto 0);	
      MOD1      : out std_logic_vector(3 downto 0);	
      MOD2      : in  std_logic_vector(3 downto 0);	
      RX_LOSS   : in  std_logic_vector(3 downto 0);	 
      TX_FAULT  : in  std_logic_vector(3 downto 0);	
      TX_DIS    : out std_logic_vector(3 downto 0);	
		-- MGT I/Os
		RXP			: in  std_logic_vector(3 downto 0);	
		RXN			: in  std_logic_vector(3 downto 0);	
		TXP			: out std_logic_vector(3 downto 0);	
		TXN			: out std_logic_vector(3 downto 0);	
		---------------
		-- User I/O  --
		---------------
		-- TX related
		xSTART_TX_XFER	: in  std_logic_vector(3 downto 0);		
		xDONE_TX_XFER	: out std_logic_vector(3 downto 0);		
		xTX_DATA0		: in  std_logic_vector(23 downto 0);	
		xTX_DATA1		: in  std_logic_vector(23 downto 0);	
		xTX_DATA2		: in  std_logic_vector(23 downto 0);	
		xTX_DATA3		: in  std_logic_vector(23 downto 0);	
		xTX_LENGTH0		: in  std_logic_vector(13 downto 0);	
		xTX_LENGTH1		: in  std_logic_vector(13 downto 0);	
		xTX_LENGTH2		: in  std_logic_vector(13 downto 0);	
		xTX_LENGTH3		: in  std_logic_vector(13 downto 0);	
		xTX_ADDR0		: out std_logic_vector(13 downto 0);
		xTX_ADDR1		: out std_logic_vector(13 downto 0);
		xTX_ADDR2		: out std_logic_vector(13 downto 0);
		xTX_ADDR3		: out std_logic_vector(13 downto 0);		
		xTX_XFER_EN		: out std_logic_vector(3 downto 0);	
		xDOWNSTREAM_TRIG	: in std_logic_vector(3 downto 0);
		xDOWNSTREAM_CLR	: in std_logic_vector(3 downto 0);			
		-- RX related
		xCLR_LAM		: in  std_logic_vector(3 downto 0);
		xLAM			: out std_logic_vector(3 downto 0);
		xRX_DATA0	: out std_logic_vector(23 downto 0);
		xRX_DATA1	: out std_logic_vector(23 downto 0);
		xRX_DATA2	: out std_logic_vector(23 downto 0);
		xRX_DATA3	: out std_logic_vector(23 downto 0);		
		xRX_LENGTH0	: out std_logic_vector(13 downto 0);
		xRX_LENGTH1	: out std_logic_vector(13 downto 0);
		xRX_LENGTH2	: out std_logic_vector(13 downto 0);
		xRX_LENGTH3	: out std_logic_vector(13 downto 0);		
		xRX_ADDR0	: out std_logic_vector(13 downto 0);	
		xRX_ADDR1	: out std_logic_vector(13 downto 0);	
		xRX_ADDR2	: out std_logic_vector(13 downto 0);	
		xRX_ADDR3	: out std_logic_vector(13 downto 0);	
		xRX_XFER_EN	: out std_logic_vector(3 downto 0);
		xUPSTREAM_TRIG	: out std_logic_vector(3 downto 0);
		xUPSTREAM_CLR	: out std_logic_vector(3 downto 0);
		-- MISC I/O		
		BCLK				: in  std_logic;
		xLINK_ACTIVE	: out std_logic_vector(3 downto 0);
		xCLK				: out std_logic);
end Aurora_TOP; 

architecture Behavioral of Aurora_TOP is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------
	signal REF_CLK		: std_logic;
	signal USER_CLK	: std_logic;	
	signal CLK			: std_logic;	
	signal USER_CLK_2X_N		: std_logic;
	signal DCM_NOT_LOCKED	: std_logic;
	signal USER_CLK_N			: std_logic;	
	signal xRX_LOSS			: std_logic_vector(3 downto 0);
--------------------------------------------------------------------------------
--   								components     		   						         --
--------------------------------------------------------------------------------
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
--------------------------------------------------------------------------------
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
--------------------------------------------------------------------------------
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
--------------------------------------------------------------------------------
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
--------------------------------------------------------------------------------
	component fo_io
   port ( MOD0      : in    std_logic; 
          MOD2      : in    std_logic; 
          RX_LOSS    : in    std_logic; 
          TX_FAULT  : in    std_logic; 
          MOD1      : out   std_logic; 
          xRX_LOSS_N : out   std_logic; 
          TX_DIS    : out   std_logic; 
          xMOD0     : out   std_logic; 
          xMOD2     : out   std_logic; 
          xTX_FAULT : out   std_logic);
   end component;
--------------------------------------------------------------------------------
	component Aurora_Partition
	port ( 
	-- Fiber Link I/Os
      xRX_LOSS   : in  std_logic_vector(3 downto 0);	 
		-- MGT I/Os
		RXP			: in  std_logic_vector(3 downto 0);	
		RXN			: in  std_logic_vector(3 downto 0);	
		TXP			: out std_logic_vector(3 downto 0);	
		TXN			: out std_logic_vector(3 downto 0);	
		---------------
		-- User I/O  --
		---------------
		-- TX related
		xSTART_TX_XFER	: in  std_logic_vector(3 downto 0);		
		xDONE_TX_XFER	: out std_logic_vector(3 downto 0);		
		xTX_DATA0		: in  std_logic_vector(23 downto 0);	
		xTX_DATA1		: in  std_logic_vector(23 downto 0);	
		xTX_DATA2		: in  std_logic_vector(23 downto 0);	
		xTX_DATA3		: in  std_logic_vector(23 downto 0);	
		xTX_LENGTH0		: in  std_logic_vector(13 downto 0);	
		xTX_LENGTH1		: in  std_logic_vector(13 downto 0);	
		xTX_LENGTH2		: in  std_logic_vector(13 downto 0);	
		xTX_LENGTH3		: in  std_logic_vector(13 downto 0);	
		xTX_ADDR0		: out std_logic_vector(13 downto 0);
		xTX_ADDR1		: out std_logic_vector(13 downto 0);
		xTX_ADDR2		: out std_logic_vector(13 downto 0);
		xTX_ADDR3		: out std_logic_vector(13 downto 0);		
		xTX_XFER_EN		: out std_logic_vector(3 downto 0);	
		xDOWNSTREAM_TRIG	: in std_logic_vector(3 downto 0);
		xDOWNSTREAM_CLR	: in std_logic_vector(3 downto 0);			
		-- RX related
		xCLR_LAM		: in  std_logic_vector(3 downto 0);
		xLAM			: out std_logic_vector(3 downto 0);
		xRX_DATA0	: out std_logic_vector(23 downto 0);
		xRX_DATA1	: out std_logic_vector(23 downto 0);
		xRX_DATA2	: out std_logic_vector(23 downto 0);
		xRX_DATA3	: out std_logic_vector(23 downto 0);		
		xRX_LENGTH0	: out std_logic_vector(13 downto 0);
		xRX_LENGTH1	: out std_logic_vector(13 downto 0);
		xRX_LENGTH2	: out std_logic_vector(13 downto 0);
		xRX_LENGTH3	: out std_logic_vector(13 downto 0);		
		xRX_ADDR0	: out std_logic_vector(13 downto 0);	
		xRX_ADDR1	: out std_logic_vector(13 downto 0);	
		xRX_ADDR2	: out std_logic_vector(13 downto 0);	
		xRX_ADDR3	: out std_logic_vector(13 downto 0);	
		xRX_XFER_EN	: out std_logic_vector(3 downto 0);
		xUPSTREAM_TRIG	: out std_logic_vector(3 downto 0);
		xUPSTREAM_CLR	: out std_logic_vector(3 downto 0);
		-- MISC I/O		
		REF_CLK			: in  std_logic;
		xLINK_ACTIVE	: out std_logic_vector(3 downto 0);
		xCLK				: out std_logic);
   end component;
--------------------------------------------------------------------------------		
begin
--------------------------------------------------------------------------------		
--	xCLK <= CLK;
--------------------------------------------------------------------------------		
	xBUFG_BCLK : BUFG 
	port map (
		I  => BCLK,
		O  => REF_CLK);
--------------------------------------------------------------------------------		
	xBUFG_CLK : BUFG
	port map(
		I => CLK,
      O => xCLK);
--------------------------------------------------------------------------------		
	GEN: for I in 3 downto 0 generate
		xfo_io : fo_io
		port map (
			TX_FAULT => TX_FAULT(I), 
			RX_LOSS => RX_LOSS(I), 
			MOD2 => MOD2(I), 
			MOD0 => MOD0(I), 
			xTX_FAULT => open, 
			xMOD2 => open, 
			xMOD0 => open, 
			TX_DIS => TX_DIS(I), 
			MOD1 => MOD1(I), 
			xRX_LOSS_N => xRX_LOSS(I));	
	end generate GEN;
--------------------------------------------------------------------------------	
	xAurora_Partition : Aurora_Partition 
	port map(
		xRX_LOSS => xRX_LOSS,
		RXP => RXP,
		RXN => RXN,
		TXP => TXP,
		TXN => TXN,
		REF_CLK => REF_CLK,
		xCLK		=> CLK,
		xSTART_TX_XFER => xSTART_TX_XFER,
		xDONE_TX_XFER => xDONE_TX_XFER,
		xTX_DATA0 => xTX_DATA0,
		xTX_DATA1 => xTX_DATA1,
		xTX_DATA2 => xTX_DATA2,
		xTX_DATA3 => xTX_DATA3,
		xTX_LENGTH0 => xTX_LENGTH0,
		xTX_LENGTH1 => xTX_LENGTH1,
		xTX_LENGTH2 => xTX_LENGTH2,
		xTX_LENGTH3 => xTX_LENGTH3,
		xTX_ADDR0 => xTX_ADDR0,
		xTX_ADDR1 => xTX_ADDR1,
		xTX_ADDR2 => xTX_ADDR2,
		xTX_ADDR3 => xTX_ADDR3,
		xTX_XFER_EN => xTX_XFER_EN,
		xDOWNSTREAM_TRIG => xDOWNSTREAM_TRIG,
		xDOWNSTREAM_CLR => xDOWNSTREAM_CLR,
		xCLR_LAM => xCLR_LAM,
		xLAM => xLAM,
		xRX_DATA0 => xRX_DATA0,
		xRX_DATA1 => xRX_DATA1,
		xRX_DATA2 => xRX_DATA2,
		xRX_DATA3 => xRX_DATA3,
		xRX_LENGTH0 => xRX_LENGTH0,
		xRX_LENGTH1 => xRX_LENGTH1,
		xRX_LENGTH2 => xRX_LENGTH2,
		xRX_LENGTH3 => xRX_LENGTH3,
		xRX_ADDR0 => xRX_ADDR0,
		xRX_ADDR1 => xRX_ADDR1,
		xRX_ADDR2 => xRX_ADDR2,
		xRX_ADDR3 => xRX_ADDR3,
		xRX_XFER_EN => xRX_XFER_EN,
		xUPSTREAM_TRIG => xUPSTREAM_TRIG,
		xUPSTREAM_CLR => xUPSTREAM_CLR,
		xLINK_ACTIVE => xLINK_ACTIVE);
--------------------------------------------------------------------------------	
end Behavioral;