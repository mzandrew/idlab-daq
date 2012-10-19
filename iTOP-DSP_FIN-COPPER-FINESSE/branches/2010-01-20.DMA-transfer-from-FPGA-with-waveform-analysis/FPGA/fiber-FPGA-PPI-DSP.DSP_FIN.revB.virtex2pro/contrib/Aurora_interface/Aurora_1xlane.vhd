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
-- DATE : 23 AUG 2009								 											--
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

entity Aurora_1xlane is
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
end Aurora_1xlane; 

architecture Behavioral of Aurora_1xlane is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------
	-- MGT signals --
	signal RESET		: std_logic;
	signal LINK_ACTIVE : std_logic;
	signal RX_BUSY : std_logic;
	signal RX_DATA : std_logic_vector(31 downto 0);
	signal TX_BUSY : std_logic;
	signal TX_DATA : std_logic_vector(31 downto 0);
	signal TX_XFER_EN : std_logic;
	signal DONE_TX_XFER : std_logic;
	-- RX block signals --
	signal RX_REQ : std_logic;
	signal RX_ACK : std_logic;
	signal BAD_SYNC : std_logic;	
	signal GOOD_PACKET : std_logic;
	signal RECEIVE_BUSY : std_logic;	
	signal UPSTREAM_BUSY : std_logic;
	signal RESEND_PACKET : std_logic;	
	signal PACKET_SENT : std_logic;	
	signal LAM : std_logic;	
	signal RX_XFER_EN: std_logic;	
	signal G_CMD_STRB : std_logic;
	signal GOOD_SYNC : std_logic;
	signal UPSTREAM_TRIG : std_logic;
	signal UPSTREAM_CLR : std_logic;
	-- TX block signals --
	signal G_CMD : std_logic_vector(15 downto 0);
	signal SEND_PACKET : std_logic;	
	signal SEND_DATA: std_logic_vector(23 downto 0);
	signal TIME_OUT_STRB : std_logic;	
	signal SEND_BUSY : std_logic;	
	signal TX_LENGTH: std_logic_vector(13 downto 0);
	signal CLR_GOOD_SYNC	: std_logic;
	signal CLR_BAD_SYNC	: std_logic;
	signal CLR_UPSTREAM_BUSY: std_logic;
	signal CLR_PACKET_SENT	: std_logic;
	signal CLR_RESEND_PACKET: std_logic;
	signal CLR_RX_REQ		: std_logic;
	signal CLR_RX_ACK		: std_logic;
	signal CLR_FEEDBACK  : std_logic;
	signal FEEDBACK  : std_logic;
	signal G_FEEDBACK : std_logic_vector(15 downto 0);
	-- ChipScope signals --	
	signal CONTROL	  		: std_logic_vector(35 downto 0);
	signal DATA		  		: std_logic_vector(127 downto 0);
--------------------------------------------------------------------------------
--   								components     		   						         --
--------------------------------------------------------------------------------
	component Aurora_MGT
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
   end component;
--------------------------------------------------------------------------------		
	component Aurora_TX
	port (
		xCLK				: in  std_logic;
		xLINK_ACTIVE	: in  std_logic;
		xTX_BUSY			: in  std_logic;
		xSEND_PACKET	: in  std_logic;
		xG_CMD			: in  std_logic_vector(15 downto 0);	
		xLENGTH			: in  std_logic_vector(13 downto 0);			
		xSEND_DATA		: in  std_logic_vector(23 downto 0);
		xSEND_BUSY		: out std_logic;
		xTX_XFER_EN		: out std_logic;
		xTX_ADDR			: out std_logic_vector(13 downto 0);		
		xTX_DATA			: out std_logic_vector(31 downto 0));
   end component;
--------------------------------------------------------------------------------		
	component Aurora_RX
	port ( 
		xCLK				: in  std_logic;
		xLINK_ACTIVE	: in  std_logic;
		xRX_BUSY			: in  std_logic;
		xRX_DATA			: in  std_logic_vector(31 downto 0);
		-- Clearing handshaking
		xCLR_GOOD_SYNC	: in  std_logic;
		xCLR_BAD_SYNC	: in  std_logic;
		xCLR_PACKET_SENT	: in  std_logic;
		xCLR_RESEND_PACKET: in  std_logic;
		xCLR_RX_REQ		: in  std_logic;
		xCLR_RX_ACK		: in  std_logic;
		xCLR_UPSTREAM_BUSY: in  std_logic;
		xCLR_FEEDBACK	: in  std_logic;
		-- global TRIG and CLR
		xCLR				: out std_logic;
		xTRIG				: out std_logic;
		-- REQ checks
		xRX_REQ			: out std_logic;
		xRX_ACK			: out std_logic;
		xUPSTREAM_BUSY	: out std_logic;
		--sync 
		xGOOD_SYNC		: out std_logic;
		xBAD_SYNC		: out std_logic;
		xGOOD_PACKET	: out std_logic;
		--feed back
		xFEEDBACK		: out std_logic;
		xG_FEEDBACK		: out std_logic_vector(15 downto 0);	
		-- response downstream
		xRESEND_PACKET	: out std_logic;
		xPACKET_SENT	: out std_logic;
		--misc signals
		xRECEIVE_BUSY	: out std_logic;
		xW_EN				: out std_logic;
		xG_CMD_STRB		: out std_logic;
		xWADDR			: out std_logic_vector(13 downto 0);	
		xLENGTH			: out std_logic_vector(13 downto 0);			
		xWRITE			: out std_logic_vector(23 downto 0));
   end component;
--------------------------------------------------------------------------------		
--	component Aurora_RX_MESS
	component aurora_rx_mess
	port ( 
		xCLK				: in  std_logic;
		xLINK_ACTIVE	: in  std_logic;
		xGOOD_PACKET	: in  std_logic;
		xCLR_LAM			: in  std_logic;
		xLAM				: out std_logic);
   end component;
--------------------------------------------------------------------------------		
	component Aurora_TX_MESS
	port ( 
		xCLK				: in  std_logic;
		xLINK_ACTIVE	: in  std_logic;
		xSTART			: in  std_logic;	
		xSEND_CLR		: in  std_logic;
		xSEND_TRIG		: in  std_logic;
		xPACKET_SENT	: in  std_logic;
		xRESEND_PACKET	: in  std_logic;
		xFEEDBACK		: in  std_logic;
		xG_FEEDBACK		: in  std_logic_vector(15 downto 0);	
		xRX_REQ			: in  std_logic;
		xRX_ACK			: in  std_logic;
		xUPSTREAM_BUSY	: in  std_logic;
		xBAD_SYNC		: in  std_logic;
		xLAM				: in  std_logic;
		xSEND_BUSY		: in  std_logic;
		xLENGTH			: in  std_logic_vector(13 downto 0);	
		xGOOD_SYNC		: in  std_logic;
		xG_CMD_STRB		: in  std_logic;
		xCLR_GOOD_SYNC	: out std_logic;
		xCLR_BAD_SYNC	: out std_logic;
		xCLR_PACKET_SENT	: out std_logic;
		xCLR_RESEND_PACKET: out std_logic;
		xCLR_RX_REQ		: out std_logic;
		xCLR_RX_ACK		: out std_logic;
		xCLR_UPSTREAM_BUSY: out std_logic;
		xCLR_FEEDBACK	: out std_logic;
		xDONE				: out std_logic;		
		xSEND_PACKET	: out std_logic;
		xTIME_OUT_STRB : out std_logic;
		xTX_LENGTH		: out std_logic_vector(13 downto 0);
		xG_CMD			: out std_logic_vector(15 downto 0));
   end component;
--------------------------------------------------------------------------------
--   component icon
--      port( 
--			CONTROL0 : inout STD_LOGIC_VECTOR (35 downto 0));
--   end component;
--------------------------------------------------------------------------------	
--   component ila
--      port ( 
--		   CLK 		: in STD_LOGIC := 'X'; 
--			CONTROL 	: inout STD_LOGIC_VECTOR (35 downto 0); 
--			TRIG0 	: in STD_LOGIC_VECTOR (127 downto 0));
--   end component;
--------------------------------------------------------------------------------	
begin
--------------------------------------------------------------------------------		
	xLAM <= LAM;
	xRX_XFER_EN <= RX_XFER_EN;
	xTX_XFER_EN <= TX_XFER_EN;
	xUPSTREAM_TRIG <= UPSTREAM_TRIG;
	xUPSTREAM_CLR <= UPSTREAM_CLR;
	xLINK_ACTIVE <= LINK_ACTIVE;
	xDONE_TX_XFER <= DONE_TX_XFER;  
--------------------------------------------------------------------------------	
	xAurora_MGT : Aurora_MGT 
	port map(
		-- User I/O
		xLOOP_BACK 	=> "00",--"00"
		xHARD_ERROR => open,
		xSOFT_ERROR => open,
		xTX_DATA 	=> TX_DATA,
		xRX_DATA	 	=> RX_DATA,
		xTX_BUSY 	=> TX_BUSY,
		xRX_BUSY 	=> RX_BUSY,
		xRESET		=> RESET,
		xLINK_ACTIVE	=> LINK_ACTIVE,
		xWARN_CC		=> open,
		xDO_CC		=> open,
		xRX_LOSS_N	=> xRX_LOSS,
		-- Clocks
		xREF_CLK	 			=> xREF_CLK,
		xUSER_CLK	 		=>	xUSER_CLK,
		xUSER_CLK_2X_N 	=>	xUSER_CLK_2X_N,
		xDCM_NOT_LOCKED	=> xDCM_NOT_LOCKED,
		-- MGT I/O
		RXP 	=> RXP,
      RXN 	=> RXN,
      TXP  	=> TXP,
      TXN	=> TXN);
--------------------------------------------------------------------------------	
	xAurora_TX : Aurora_TX 
	PORT MAP(
		xCLK 			=> xUSER_CLK,
		xLINK_ACTIVE => LINK_ACTIVE,
		xTX_BUSY 	=> TX_BUSY,
		xSEND_PACKET => SEND_PACKET,
		xG_CMD 		=> G_CMD,
		xLENGTH 		=> TX_LENGTH,
		xSEND_DATA 	=> xTX_DATA,
		xSEND_BUSY 	=> SEND_BUSY,
		xTX_XFER_EN => TX_XFER_EN,
		xTX_ADDR 	=> xTX_ADDR,
		xTX_DATA 	=> TX_DATA);	
--------------------------------------------------------------------------------	
	xAurora_RX: Aurora_RX 
	PORT MAP(
		xCLK => xUSER_CLK,
		xLINK_ACTIVE => LINK_ACTIVE,
		xRX_BUSY => RX_BUSY,
		xRX_DATA => RX_DATA,
		xCLR_GOOD_SYNC => CLR_GOOD_SYNC,
		xCLR_BAD_SYNC => CLR_BAD_SYNC,
		xCLR_PACKET_SENT => CLR_PACKET_SENT,
		xCLR_RESEND_PACKET => CLR_RESEND_PACKET,
		xCLR_RX_REQ => CLR_RX_REQ,
		xCLR_RX_ACK => CLR_RX_ACK,
		xCLR_UPSTREAM_BUSY => CLR_UPSTREAM_BUSY,
		xCLR_FEEDBACK => CLR_FEEDBACK,
		xCLR => UPSTREAM_CLR,
		xTRIG => UPSTREAM_TRIG,
		xRX_REQ => RX_REQ,
		xRX_ACK => RX_ACK,
		xUPSTREAM_BUSY => UPSTREAM_BUSY,
		xGOOD_PACKET => GOOD_PACKET,
		xGOOD_SYNC => GOOD_SYNC,
		xBAD_SYNC => BAD_SYNC,
		xFEEDBACK => FEEDBACK,
		xG_FEEDBACK => G_FEEDBACK,
		xRESEND_PACKET => RESEND_PACKET,
		xPACKET_SENT => PACKET_SENT,
		xRECEIVE_BUSY => RECEIVE_BUSY,
		xW_EN => RX_XFER_EN,
		xG_CMD_STRB => G_CMD_STRB,
		xWADDR => xRX_ADDR,
		xLENGTH => xRX_LENGTH,
		xWRITE => xRX_DATA);
--------------------------------------------------------------------------------	
--	xAurora_RX_MESS: Aurora_RX_MESS 
	xAurora_RX_MESS: aurora_rx_mess
	PORT MAP(
		xCLK => xUSER_CLK,
		xLINK_ACTIVE => LINK_ACTIVE,
		xGOOD_PACKET => GOOD_PACKET,
		xCLR_LAM => xCLR_LAM,
		xLAM => LAM);
--------------------------------------------------------------------------------	
	xAurora_TX_MESS: Aurora_TX_MESS 
	PORT MAP(
		xCLK => xUSER_CLK,
		xLINK_ACTIVE => LINK_ACTIVE,
		xSTART => xSTART_TX_XFER,
		xSEND_CLR => xDOWNSTREAM_CLR,
		xSEND_TRIG => xDOWNSTREAM_TRIG,
		xPACKET_SENT => PACKET_SENT,
		xRESEND_PACKET => RESEND_PACKET,
		xRX_REQ => RX_REQ,
		xRX_ACK => RX_ACK,
		xUPSTREAM_BUSY => UPSTREAM_BUSY,
		xFEEDBACK => FEEDBACK,
		xG_FEEDBACK => G_FEEDBACK,
		xGOOD_SYNC => GOOD_SYNC,
		xBAD_SYNC => BAD_SYNC,
		xLAM => LAM,
		xSEND_BUSY => SEND_BUSY,
		xLENGTH => xTX_LENGTH,
		xG_CMD_STRB => G_CMD_STRB,
		xCLR_BAD_SYNC => CLR_BAD_SYNC,
		xCLR_GOOD_SYNC => CLR_GOOD_SYNC,
		xCLR_UPSTREAM_BUSY => CLR_UPSTREAM_BUSY,
		xCLR_PACKET_SENT => CLR_PACKET_SENT,
		xCLR_RESEND_PACKET => CLR_RESEND_PACKET,
		xCLR_RX_REQ => CLR_RX_REQ,
		xCLR_RX_ACK => CLR_RX_ACK,
		xDONE => DONE_TX_XFER,
		xTIME_OUT_STRB => TIME_OUT_STRB,
		xSEND_PACKET => SEND_PACKET,
		xTX_LENGTH => TX_LENGTH,
		xG_CMD => G_CMD);
--------------------------------------------------------------------------------	
--	chipscope : if xUSE_CHIPSCOPE = 1 generate 		
--		xicon : icon
--		port map (
--			CONTROL0  => CONTROL);
--------------------------------------------------------------------------------	
--		xila : ila
--		port map (
--			CLK  	=> xUSER_CLK,
--			TRIG0  	=> DATA,
--			CONTROL  => CONTROL);
--	end generate chipscope;
--------------------------------------------------------------------------------	
	-- MGT block signals --
--	DATA(31 downto 0) <= TX_DATA;
--	DATA(63 downto 32) <= RX_DATA;
--	DATA(64) <= TX_BUSY;	
--	DATA(65) <= RX_BUSY;		
--	DATA(66) <= LINK_ACTIVE;
	-- TX block signals --	
--	DATA(67) <= SEND_PACKET; 	
--	DATA(68) <= SEND_BUSY; 
--	DATA(69) <= TX_XFER_EN; 
	-- RX block signals --
--	DATA(70) <= RX_REQ; 
--	DATA(71) <= RX_ACK; 
--	DATA(72) <= UPSTREAM_BUSY; 
	
--	DATA(73) <= GOOD_SYNC; 
--	DATA(74) <= GOOD_PACKET; 
	
--	DATA(75) <= RECEIVE_BUSY;
--	DATA(76) <= PACKET_SENT; 
--	DATA(77) <= RESEND_PACKET; 
--	DATA(78) <= RX_XFER_EN; 
	-- MISC signals --	
--	DATA(79) <= LAM; 
--	DATA(80) <= xCLR_LAM; 
	
--	DATA(81) <= xSTART_TX_XFER; 
--	DATA(82) <= DONE_TX_XFER; 	
	
--	DATA(83) <= TIME_OUT_STRB;
--	DATA(84) <= G_CMD_STRB;
	
--	DATA(85) <= CLR_GOOD_SYNC;
--	DATA(86) <= CLR_BAD_SYNC;
--	DATA(87) <= CLR_PACKET_SENT;
--	DATA(88) <= CLR_RESEND_PACKET;
--	DATA(89) <= CLR_RX_REQ;
--	DATA(90) <= CLR_RX_ACK;
--	DATA(91) <= CLR_UPSTREAM_BUSY;
--	DATA(92) <= CLR_FEEDBACK;

--	DATA(93) <= xDOWNSTREAM_TRIG;
--	DATA(94) <= xDOWNSTREAM_CLR;
	
--	DATA(95) <= UPSTREAM_TRIG;
--	DATA(96) <= UPSTREAM_CLR;
	
--	DATA(97) <= xRX_LOSS;	
--	DATA(111 downto 98) <= TX_LENGTH;	
--	DATA(127 downto 112) <= G_CMD;
--------------------------------------------------------------------------------	
end Behavioral;