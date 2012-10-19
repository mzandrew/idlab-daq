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

entity Aurora_Partition is
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
end Aurora_Partition; 

architecture Behavioral of Aurora_Partition is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------
	signal USER_CLK			: std_logic;	
	signal USER_CLK_2X_N		: std_logic;
	signal DCM_NOT_LOCKED	: std_logic;
	signal USER_CLK_N			: std_logic;
	signal CLK					: std_logic;	
--------------------------------------------------------------------------------
--   								components     		   						         --
--------------------------------------------------------------------------------
	component Aurora_CLOCK_MODULE
	port (
		MGT_REFERENCE_CLOCK : in std_logic;
      USER_CLK            : out std_logic;
      USER_CLK_2X_N       : out std_logic;
      DCM_NOT_LOCKED      : out std_logic;
	  xCLK				  : out std_logic
	  );	
   end component;
--------------------------------------------------------------------------------
	component Aurora_user_clk
	port (
		xUSER_CLK	: in std_logic;
      xCLK			: out std_logic);
   end component;
--------------------------------------------------------------------------------
	component Aurora_1xlane
	generic(
		xUSE_CHIPSCOPE      : integer := 0);  -- Set to 1 to use Chipscope 
	port ( 
	-- Fiber Link I/Os
      xRX_LOSS   : in  std_logic; 
		-- MGT I/Os
		RXP			: in  std_logic;
		RXN			: in  std_logic;
		TXP			: out std_logic;
		TXN			: out std_logic;
		-- Clocks
		xREF_CLK		: in std_logic;
		xUSER_CLK	: in std_logic;
		xUSER_CLK_2X_N		: in std_logic;
		xDCM_NOT_LOCKED	: in std_logic;
		---------------
		-- User I/O  --
		---------------
		-- TX related
		xSTART_TX_XFER	: in  std_logic;	
		xDONE_TX_XFER	: out std_logic;		
		xTX_DATA			: in  std_logic_vector(23 downto 0);	
		xTX_LENGTH		: in  std_logic_vector(13 downto 0);	
		xTX_ADDR			: out std_logic_vector(13 downto 0);	
		xTX_XFER_EN		: out std_logic;		
		xDOWNSTREAM_TRIG	: in std_logic;
		xDOWNSTREAM_CLR	: in std_logic;			
		-- RX related
		xCLR_LAM		: in  std_logic;
		xLAM			: out std_logic;	
		xRX_DATA		: out std_logic_vector(23 downto 0);	
		xRX_LENGTH	: out std_logic_vector(13 downto 0);	
		xRX_ADDR		: out std_logic_vector(13 downto 0);	
		xRX_XFER_EN	: out std_logic;
		xUPSTREAM_TRIG	: out std_logic;
		xUPSTREAM_CLR	: out std_logic;	
		-- MISC I/O			
		xLINK_ACTIVE	: out   std_logic);
   end component;
--------------------------------------------------------------------------------
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
--------------------------------------------------------------------------------		
begin
--	xCLK <= CLK;
--------------------------------------------------------------------------------		
	xAurora_CLOCK_MODULE : Aurora_CLOCK_MODULE 
	port map (
		MGT_REFERENCE_CLOCK  => REF_CLK,
		USER_CLK  				=> USER_CLK,
		USER_CLK_2X_N  		=> USER_CLK_2X_N,
		DCM_NOT_LOCKED  		=> DCM_NOT_LOCKED,
		xCLK => open
		);
--------------------------------------------------------------------------------		
	xAurora_user_clk : Aurora_user_clk 
	port map (
		xUSER_CLK	=> USER_CLK,
		xCLK 			=> CLK);
--------------------------------------------------------------------------------		
	xBUFG_CLK : BUFG
	port map(
		I => CLK,
      O => xCLK); 
--------------------------------------------------------------------------------	
	xAurora_CH0 : Aurora_1xlane 
	generic map(
        xUSE_CHIPSCOPE => 0)
	port map(
		xRX_LOSS => xRX_LOSS(0),
		RXP => RXP(0),
		RXN => RXN(0),
		TXP => TXP(0),
		TXN => TXN(0),
		xREF_CLK => REF_CLK,
		xUSER_CLK => USER_CLK,
		xUSER_CLK_2X_N => USER_CLK_2X_N,
		xDCM_NOT_LOCKED => DCM_NOT_LOCKED,
		xSTART_TX_XFER => xSTART_TX_XFER(0),
		xDONE_TX_XFER => xDONE_TX_XFER(0),
		xTX_DATA => xTX_DATA0,
		xTX_LENGTH => xTX_LENGTH0,
		xTX_ADDR => xTX_ADDR0,
		xTX_XFER_EN => xTX_XFER_EN(0),
		xDOWNSTREAM_TRIG => xDOWNSTREAM_TRIG(0),
		xDOWNSTREAM_CLR => xDOWNSTREAM_CLR(0),
		xCLR_LAM => xCLR_LAM(0),
		xLAM => xLAM(0),
		xRX_DATA => xRX_DATA0,
		xRX_LENGTH => xRX_LENGTH0,
		xRX_ADDR => xRX_ADDR0,
		xRX_XFER_EN => xRX_XFER_EN(0),
		xUPSTREAM_TRIG => xUPSTREAM_TRIG(0),
		xUPSTREAM_CLR => xUPSTREAM_CLR(0),
		xLINK_ACTIVE => xLINK_ACTIVE(0));
--------------------------------------------------------------------------------	
	xAurora_CH1 : Aurora_1xlane 
	generic map(
        xUSE_CHIPSCOPE => 0)
	port map(
		xRX_LOSS => xRX_LOSS(1),
		RXP => RXP(1),
		RXN => RXN(1),
		TXP => TXP(1),
		TXN => TXN(1),
		xREF_CLK => REF_CLK,
		xUSER_CLK => USER_CLK,
		xUSER_CLK_2X_N => USER_CLK_2X_N,
		xDCM_NOT_LOCKED => DCM_NOT_LOCKED,
		xSTART_TX_XFER => xSTART_TX_XFER(1),
		xDONE_TX_XFER => xDONE_TX_XFER(1),
		xTX_DATA => xTX_DATA1,
		xTX_LENGTH => xTX_LENGTH1,
		xTX_ADDR => xTX_ADDR1,
		xTX_XFER_EN => xTX_XFER_EN(1),
		xDOWNSTREAM_TRIG => xDOWNSTREAM_TRIG(1),
		xDOWNSTREAM_CLR => xDOWNSTREAM_CLR(1),
		xCLR_LAM => xCLR_LAM(1),
		xLAM => xLAM(1),
		xRX_DATA => xRX_DATA1,
		xRX_LENGTH => xRX_LENGTH1,
		xRX_ADDR => xRX_ADDR1,
		xRX_XFER_EN => xRX_XFER_EN(1),
		xUPSTREAM_TRIG => xUPSTREAM_TRIG(1),
		xUPSTREAM_CLR => xUPSTREAM_CLR(1),
		xLINK_ACTIVE => xLINK_ACTIVE(1));
--------------------------------------------------------------------------------	
	xAurora_CH2 : Aurora_1xlane 
	generic map(
        xUSE_CHIPSCOPE => 0)
	port map(
		xRX_LOSS => xRX_LOSS(2),
		RXP => RXP(2),
		RXN => RXN(2),
		TXP => TXP(2),
		TXN => TXN(2),
		xREF_CLK => REF_CLK,
		xUSER_CLK => USER_CLK,
		xUSER_CLK_2X_N => USER_CLK_2X_N,
		xDCM_NOT_LOCKED => DCM_NOT_LOCKED,
		xSTART_TX_XFER => xSTART_TX_XFER(2),
		xDONE_TX_XFER => xDONE_TX_XFER(2),
		xTX_DATA => xTX_DATA2,
		xTX_LENGTH => xTX_LENGTH2,
		xTX_ADDR => xTX_ADDR2,
		xTX_XFER_EN => xTX_XFER_EN(2),
		xDOWNSTREAM_TRIG => xDOWNSTREAM_TRIG(2),
		xDOWNSTREAM_CLR => xDOWNSTREAM_CLR(2),
		xCLR_LAM => xCLR_LAM(2),
		xLAM => xLAM(2),
		xRX_DATA => xRX_DATA2,
		xRX_LENGTH => xRX_LENGTH2,
		xRX_ADDR => xRX_ADDR2,
		xRX_XFER_EN => xRX_XFER_EN(2),
		xUPSTREAM_TRIG => xUPSTREAM_TRIG(2),
		xUPSTREAM_CLR => xUPSTREAM_CLR(2),
		xLINK_ACTIVE => xLINK_ACTIVE(2));
--------------------------------------------------------------------------------	
	xAurora_CH3 : Aurora_1xlane 
	generic map(
        xUSE_CHIPSCOPE => 0)
	port map(
		xRX_LOSS => xRX_LOSS(3),
		RXP => RXP(3),
		RXN => RXN(3),
		TXP => TXP(3),
		TXN => TXN(3),
		xREF_CLK => REF_CLK,
		xUSER_CLK => USER_CLK,
		xUSER_CLK_2X_N => USER_CLK_2X_N,
		xDCM_NOT_LOCKED => DCM_NOT_LOCKED,
		xSTART_TX_XFER => xSTART_TX_XFER(3),
		xDONE_TX_XFER => xDONE_TX_XFER(3),
		xTX_DATA => xTX_DATA3,
		xTX_LENGTH => xTX_LENGTH3,
		xTX_ADDR => xTX_ADDR3,
		xTX_XFER_EN => xTX_XFER_EN(3),
		xDOWNSTREAM_TRIG => xDOWNSTREAM_TRIG(3),
		xDOWNSTREAM_CLR => xDOWNSTREAM_CLR(3),
		xCLR_LAM => xCLR_LAM(3),
		xLAM => xLAM(3),
		xRX_DATA => xRX_DATA3,
		xRX_LENGTH => xRX_LENGTH3,
		xRX_ADDR => xRX_ADDR3,
		xRX_XFER_EN => xRX_XFER_EN(3),
		xUPSTREAM_TRIG => xUPSTREAM_TRIG(3),
		xUPSTREAM_CLR => xUPSTREAM_CLR(3),
		xLINK_ACTIVE => xLINK_ACTIVE(3));
--------------------------------------------------------------------------------		
end Behavioral;