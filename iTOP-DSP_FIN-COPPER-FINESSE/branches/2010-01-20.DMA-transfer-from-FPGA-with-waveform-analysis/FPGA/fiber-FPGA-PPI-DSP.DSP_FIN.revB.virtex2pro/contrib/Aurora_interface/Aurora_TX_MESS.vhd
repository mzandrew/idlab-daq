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
-- Project name: DSP_FIN firmware															--
--	Module name: Aurora_TX_MESS				  												--
--	Description : 																					--
-- 	Aurora_TX_MESS Top Level																--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Aurora_TX_MESS is
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
end Aurora_TX_MESS;

architecture Behavioral of Aurora_TX_MESS is
	type STATE_TYPE is ( IDLE,STRT_HDR_WAIT,LENGTH_WAIT,INSERT_DATA,
								WAIT_FOR_UPSTREAM_CONFIRMATION);
	signal STATE 			: STATE_TYPE;
	signal G_CMD_STATE 	: std_logic_vector(15 downto 0);
	signal G_TOGGLE		: std_logic_vector(15 downto 0);
	signal SEND_PACKET 	: std_logic;
	signal TOGGLE		 	: std_logic;
	signal START		 	: std_logic;
	signal CLR_CLR			: std_logic;
	signal CLR_TRIG		: std_logic;
	signal CLR_PACKET_SENT	: std_logic;
	signal CLR_RESEND_PACKET	: std_logic;
	signal CLR_RX_REQ		: std_logic;
	signal CLR_RX_ACK		: std_logic;
	signal CLR_UPSTREAM_BUSY	: std_logic;
	signal CLR_BAD_SYNC	: std_logic;
	signal CLR_GOOD_SYNC	: std_logic;
	signal CLR_START		: std_logic;
   signal SEND_CLR		: std_logic;
	signal SEND_TRIG 		: std_logic;
	signal TX_LENGTH 		: std_logic_vector(13 downto 0);
	signal TIME_OUT 		: std_logic_vector(31 downto 0);
	signal TIME_OUT_STRB : std_logic;
	signal TOGGLE_ACK		: std_logic;
	signal DOUBLE_ACK		: std_logic_vector(15 downto 0);
--------------------------------------------------------------------------------			
begin
--------------------------------------------------------------------------------			
	xSEND_PACKET	<= SEND_PACKET;
	xG_CMD	<= G_CMD_STATE;
	xTX_LENGTH	<= TX_LENGTH;
	xDONE	<= CLR_START;
	xTIME_OUT_STRB <= TIME_OUT_STRB;
	xCLR_BAD_SYNC	<= CLR_BAD_SYNC;
	xCLR_GOOD_SYNC	<= CLR_GOOD_SYNC;
	xCLR_UPSTREAM_BUSY	<= CLR_UPSTREAM_BUSY;
	xCLR_PACKET_SENT	<= CLR_PACKET_SENT;
	xCLR_RESEND_PACKET	<= CLR_RESEND_PACKET;
	xCLR_RX_REQ	<= CLR_RX_REQ;
	xCLR_RX_ACK		<= CLR_RX_ACK;
--------------------------------------------------------------------------------			
	process(xLINK_ACTIVE,xCLK)
	begin
		if xLINK_ACTIVE = '0' then
			SEND_PACKET	<= '0';
			CLR_CLR <= '1';
			CLR_TRIG <= '1';
			CLR_PACKET_SENT <= '1';
			CLR_RESEND_PACKET <= '1';
			CLR_RX_REQ <= '1';
			CLR_RX_ACK <= '1';
			CLR_UPSTREAM_BUSY <= '1';
			CLR_GOOD_SYNC <= '1';
			CLR_BAD_SYNC <= '1';
			CLR_START <= '1';
			TIME_OUT_STRB	<= '0';
			G_CMD_STATE <= x"0000";
			TOGGLE_ACK <= '0';
			DOUBLE_ACK	<= (others=>'0');
			TOGGLE <= '0';
			G_TOGGLE	<= (others=>'0');
			TX_LENGTH	<= (others=>'0');
			TIME_OUT		<= (others=>'0');
			STATE 		<= IDLE;
		elsif falling_edge(xCLK) then
--------------------------------------------------------------------------------			
			case STATE is
--------------------------------------------------------------------------------	
				when IDLE =>
					CLR_CLR <= '0';
					CLR_TRIG <= '0';
					CLR_PACKET_SENT <= '0';
					CLR_RESEND_PACKET <= '0';
					CLR_RX_REQ <= '0';
					CLR_RX_ACK <= '0';
					CLR_UPSTREAM_BUSY <= '0';
					CLR_GOOD_SYNC <= '0';
					CLR_BAD_SYNC <= '0';
					CLR_START <= '0';
					TIME_OUT_STRB <= '0';
					G_CMD_STATE <= x"FFFF";
					TOGGLE_ACK <= '0';
					DOUBLE_ACK	<= (others=>'0');
					TOGGLE <= '0';
					G_TOGGLE	<= (others=>'0');
					TX_LENGTH	<= (others=>'0');
					if SEND_CLR = '1' then
						G_CMD_STATE <= x"0001";--CLR
						SEND_PACKET	<= '1';
						STATE	<= STRT_HDR_WAIT;
					elsif SEND_TRIG = '1' then
						G_CMD_STATE <= x"0002";--TRIG
						SEND_PACKET	<= '1';
						STATE	<= STRT_HDR_WAIT;					
					elsif xGOOD_SYNC = '1' then
						G_CMD_STATE <= x"0004";--PACKET_SENT
						SEND_PACKET	<= '1';
						STATE	<= STRT_HDR_WAIT;
					elsif xBAD_SYNC = '1' then
						G_CMD_STATE <= x"0008";--RESEND_PACKET
						SEND_PACKET	<= '1';
						STATE	<= STRT_HDR_WAIT;
					elsif xRX_REQ = '1' then
						if xLAM = '1' then
							G_CMD_STATE <= x"0010";--UPSTREAM_BUSY
							SEND_PACKET	<= '1';
							STATE	<= STRT_HDR_WAIT;
						else
							G_CMD_STATE <= x"0020";--RX_ACK
							SEND_PACKET	<= '1';
							STATE	<= STRT_HDR_WAIT;
						end if;
					elsif START = '1' then
							G_CMD_STATE <= x"0040";--RX_REQ
							G_TOGGLE <= x"0040";
							SEND_PACKET	<= '1';
							STATE	<= STRT_HDR_WAIT;
					end if;
--------------------------------------------------------------------------------	
				when STRT_HDR_WAIT =>
					CLR_CLR <= '0';
					CLR_TRIG <= '0';
					CLR_PACKET_SENT <= '0';
					CLR_RESEND_PACKET <= '0';
					CLR_RX_REQ <= '0';
					CLR_RX_ACK <= '0';
					CLR_UPSTREAM_BUSY <= '0';
					CLR_GOOD_SYNC <= '0';
					CLR_BAD_SYNC <= '0';
					TIME_OUT_STRB <= '0';
					STATE	<= LENGTH_WAIT;
--------------------------------------------------------------------------------	
				when LENGTH_WAIT =>
					if G_CMD_STATE /= 0 then
						TX_LENGTH <= (others=>'0');
					else
						TX_LENGTH <= xLENGTH;
					end if;
					STATE	<= INSERT_DATA;
--------------------------------------------------------------------------------	
				when INSERT_DATA =>
					SEND_PACKET	<= '0';
--					if	TOGGLE_ACK <= '1' then
--						TOGGLE_ACK <= '0';
--						G_CMD_STATE <= DOUBLE_ACK;
--					end if;
					TIME_OUT		<= (others=>'0');
					if xSEND_BUSY = '0' then
						STATE	<= WAIT_FOR_UPSTREAM_CONFIRMATION;
					end if;
--------------------------------------------------------------------------------	
				when WAIT_FOR_UPSTREAM_CONFIRMATION =>
					TIME_OUT <= TIME_OUT + 1;	--"watch dog"				
					if G_CMD_STATE = x"0004" and TOGGLE = '0' then
						CLR_GOOD_SYNC <= '1';
						STATE	<= IDLE;
					elsif G_CMD_STATE = x"0008" then
						CLR_BAD_SYNC <= '1';
						STATE	<= IDLE;
					elsif xRESEND_PACKET = '1' or TIME_OUT = 1000 then --error in the sent packet
						TIME_OUT_STRB <= '1';
						if xGOOD_SYNC = '1' then
							CLR_GOOD_SYNC <= '1';
							TOGGLE_ACK <= '1';
							DOUBLE_ACK <= G_CMD_STATE;	
							G_CMD_STATE <= x"0004";--PACKET_SENT
							SEND_PACKET	<= '1';
							STATE	<= STRT_HDR_WAIT;							
						else
							CLR_RESEND_PACKET	<= '1';
							SEND_PACKET	<= '1';
							STATE	<= STRT_HDR_WAIT;
						end if;
					elsif xPACKET_SENT = '1' then --good packet sent
						if G_CMD_STATE = x"0000" then --data packet sent
							CLR_RX_REQ 			<= '1';
							CLR_RX_ACK 			<= '1';
							CLR_START 			<= '1';
							if TOGGLE = '1' then
								CLR_PACKET_SENT <= '1';
								CLR_GOOD_SYNC <= '1';
								STATE	<= IDLE;
								TOGGLE <= not(TOGGLE);
							elsif TOGGLE = '0' then		
								G_CMD_STATE <= x"0004";--PACKET_SENT
								SEND_PACKET	<= '1';
								STATE	<= STRT_HDR_WAIT;
								TOGGLE <= not(TOGGLE);
							end if;
						elsif G_TOGGLE = x"0040" then--requesting for a xfer dump		
							if xUPSTREAM_BUSY = '1' then
								if TOGGLE = '1' then
									G_CMD_STATE <= x"0040";
									CLR_UPSTREAM_BUSY <= '1';
									CLR_PACKET_SENT <= '1';
									CLR_GOOD_SYNC <= '1';
									SEND_PACKET			<= '1';
									STATE	<= STRT_HDR_WAIT;--resend RX_REQ
									TOGGLE <= not(TOGGLE);
								elsif TOGGLE = '0' then		
									G_CMD_STATE <= x"0004";--PACKET_SENT
									SEND_PACKET	<= '1';
									STATE	<= STRT_HDR_WAIT;
									TOGGLE <= not(TOGGLE);
								end if;
							elsif xRX_ACK = '1' then
								if TOGGLE = '1' then
									CLR_RX_ACK 			<= '1';
									CLR_PACKET_SENT 	<= '1';
									CLR_GOOD_SYNC 		<= '1';
									SEND_PACKET			<= '1';
									G_CMD_STATE 		<= x"0000";
									G_TOGGLE		 		<= x"0000";
									STATE	<= STRT_HDR_WAIT;--ready to send data packet	
									TOGGLE <= not(TOGGLE);
								elsif TOGGLE = '0' then								
									G_CMD_STATE <= x"0004";--PACKET_SENT
									SEND_PACKET	<= '1';
									STATE	<= STRT_HDR_WAIT;
									TOGGLE <= not(TOGGLE);
								end if;
							end if;
						elsif G_CMD_STATE = x"0010" then
							CLR_PACKET_SENT <= '1';
							CLR_RX_REQ <= '1';
							STATE	<= IDLE;
						elsif G_CMD_STATE = x"0020" then
							CLR_PACKET_SENT <= '1';
							CLR_RX_REQ <= '1';
							STATE	<= IDLE;
						else
							CLR_PACKET_SENT <= '1';
							CLR_CLR <= G_CMD_STATE(0);
							CLR_TRIG <= G_CMD_STATE(1);
							STATE	<= IDLE;
						end if;
					end if;
--------------------------------------------------------------------------------	
				when others =>	STATE<=IDLE;																
			end case;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if CLR_START = '1' then
			START <= '0';
		elsif rising_edge(xCLK) then
			if xSTART = '1' then
				START <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if CLR_CLR = '1' then
			SEND_CLR <= '0';
		elsif rising_edge(xCLK) then
			if xSEND_CLR = '1' then
				SEND_CLR <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if CLR_TRIG = '1' then
			SEND_TRIG <= '0';
		elsif rising_edge(xCLK) then
			if xSEND_TRIG = '1' then
				SEND_TRIG <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
end Behavioral;