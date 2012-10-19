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
-- DATE : 23 AUG 2009																			--
-- Project name: DSP_FIN firmware															--
--	Module name: Aurora_RX_1xlane				  												--
--	Description : 																					--
-- 	Aurora_RX_1xlane Top Level																--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Aurora_RX is
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
end Aurora_RX;

architecture Behavioral of Aurora_RX is
	type STATE_TYPE is ( IDLE,GET_LENGTH,DATA_PACKET,END_HEADER);
	signal STATE 			: STATE_TYPE;
	signal WRITE_DATA 	: std_logic_vector(23 downto 0);
	signal WADDR 			: std_logic_vector(13 downto 0);
	signal PARITY_CNT 	: std_logic_vector(7 downto 0);
	signal PACKET_LENGTH : std_logic_vector(13 downto 0);
	signal LOCK_LENGTH	: std_logic_vector(13 downto 0);
	signal W_EN				: std_logic;
	signal RECEIVE_BUSY  : std_logic;
	signal TX_SRC_READY 	: std_logic;
	signal TRIG	: std_logic;
	signal CLR 	: std_logic;
	signal G_CMD : std_logic_vector(15 downto 0);
	signal RX_REQ	: std_logic;
	signal RX_ACK 	: std_logic;
	signal UPSTREAM_BUSY : std_logic;
	signal RESEND_PACKET : std_logic;
	signal PACKET_SENT 	: std_logic;
	signal latch_G_CMD   : std_logic;
	signal G_CMD_STRB    : std_logic;
	signal Latch_RX_REQ    : std_logic;
	signal Latch_RX_ACK    : std_logic;	
	signal Latch_UPSTREAM_BUSY     : std_logic;			
	signal Latch_RESEND_PACKET     : std_logic;
	signal Latch_PACKET_SENT    : std_logic;
	signal GOOD_SYNC  : std_logic;
	signal BAD_SYNC  	: std_logic;
	signal FEEDBACK : std_logic;
	signal G_FEEDBACK : std_logic_vector(15 downto 0);
	signal Latch_FEEDBACK : std_logic;
	signal Latch_G_CMD_FEEDBACK : std_logic_vector(15 downto 0);
	signal PACKET_ERROR : std_logic;
	signal GOOD_PACKET : std_logic;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
	xWRITE 	<= WRITE_DATA;
	xWADDR 	<= WADDR;
	xW_EN		<= W_EN;
	xRECEIVE_BUSY <= RECEIVE_BUSY;
	xTRIG 	<= TRIG;
	xCLR 		<= CLR;
	xLENGTH 	<= LOCK_LENGTH;
	xG_CMD_STRB <= G_CMD_STRB;
	xGOOD_PACKET <= GOOD_PACKET;
--------------------------------------------------------------------------------
	process(xLINK_ACTIVE,xCLK,xRX_BUSY)
	begin
		if xLINK_ACTIVE = '0' then
			WRITE_DATA 	<= (others=>'0');
			WADDR			<= (others=>'1');
			PARITY_CNT	<= (others=>'0');
			W_EN			<= '0';
			PACKET_ERROR	<= '0';
			latch_G_CMD <= '0';
			GOOD_PACKET <= '0';
			STATE 		<= IDLE;
		elsif rising_edge(xCLK) and xRX_BUSY = '0' then
--------------------------------------------------------------------------------			
			case STATE is
--------------------------------------------------------------------------------	
				when IDLE =>			
					WRITE_DATA 	<= (others=>'0');
					WADDR			<= (others=>'1');
					PARITY_CNT	<= (others=>'0');
					W_EN			<= '0';
					RECEIVE_BUSY 	<= '0';
					PACKET_ERROR	<= '0';
					latch_G_CMD 	<= '0';
					GOOD_PACKET <= '0';
					if xRX_DATA(31 downto 16) = x"1234" then
						RECEIVE_BUSY  <= '1';
						G_CMD <= xRX_DATA(15 downto 0);
						STATE <= GET_LENGTH; 
					end if; 
--------------------------------------------------------------------------------						
				when GET_LENGTH =>			
					PACKET_LENGTH	<= xRX_DATA(13 downto 0);
					if xRX_DATA > x"00003FFF" then
						PACKET_ERROR	<= '1';
						STATE <= IDLE;
					elsif xRX_DATA = 0 then
						STATE <= END_HEADER;
					else
						STATE <= DATA_PACKET;
					end if;
--------------------------------------------------------------------------------						
				when DATA_PACKET =>	
					if xRX_DATA(31 downto 24) /= PARITY_CNT then
						PACKET_ERROR	<= '1';
						STATE <= IDLE;
					else
						PARITY_CNT <= PARITY_CNT + 1;
						W_EN <= '1';
						WADDR <= WADDR + 1;
						WRITE_DATA 	<= xRX_DATA(23 downto 0);
						if WADDR = (PACKET_LENGTH - 2) then
							LOCK_LENGTH <= PACKET_LENGTH;
							STATE <= END_HEADER;	
						end if;
					end if;
--------------------------------------------------------------------------------						
				when END_HEADER =>	
					W_EN <= '0';
					if xRX_DATA = x"43214321" then
						if PACKET_LENGTH /= 0 then
							GOOD_PACKET <= '1';
						end if;
						latch_G_CMD <= '1';	
					else 
						PACKET_ERROR	<= '1';
					end if;	
					STATE	<= IDLE;						
--------------------------------------------------------------------------------					
				when others =>	STATE<=IDLE;																
			end case;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xLINK_ACTIVE,xCLK)
	begin
		if xLINK_ACTIVE = '0' then
			Latch_UPSTREAM_BUSY 	<= '0';	
			Latch_RX_ACK 			<= '0';	
			Latch_RX_REQ 			<= '0';			
			Latch_RESEND_PACKET 	<= '0';
			Latch_PACKET_SENT 	<= '0';
			TRIG 				<= '0';
			CLR 				<= '0';
			G_CMD_STRB 		<= '0';
			Latch_FEEDBACK <= '0';
			Latch_G_CMD_FEEDBACK <= x"0000";
		elsif falling_edge(xCLK) then
			Latch_UPSTREAM_BUSY 	<= '0';	
			Latch_RX_ACK 			<= '0';	
			Latch_RX_REQ 			<= '0';			
			Latch_RESEND_PACKET 	<= '0';
			Latch_PACKET_SENT 	<= '0';
			TRIG 				<= '0';
			CLR 				<= '0';
			G_CMD_STRB 		<= '0';
			Latch_FEEDBACK <= '0';
			Latch_G_CMD_FEEDBACK <= x"0000";
			if latch_G_CMD = '1' then
				Latch_RX_REQ 	<= G_CMD(6);	
				Latch_RX_ACK 	<= G_CMD(5);		
				Latch_UPSTREAM_BUSY 	<= G_CMD(4);				
				Latch_RESEND_PACKET 	<= G_CMD(3);
				Latch_PACKET_SENT 	<= G_CMD(2);
				TRIG 		<= G_CMD(1);
				CLR 		<= G_CMD(0);
				G_CMD_STRB 		<= '1';
			end if;
			if G_CMD(15) = '1' then
				Latch_FEEDBACK <= '1';
				Latch_G_CMD_FEEDBACK(15 downto 0) <= '0' & G_CMD(14 downto 0);
			end if;			
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_PACKET_SENT = '1' then
			PACKET_SENT <= '0';
		elsif rising_edge(xCLK) then
			if Latch_PACKET_SENT = '1' then
				PACKET_SENT <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_RESEND_PACKET = '1' then
			RESEND_PACKET <= '0';
		elsif rising_edge(xCLK) then
			if Latch_RESEND_PACKET = '1' then
				RESEND_PACKET <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_RX_REQ = '1' then
			RX_REQ <= '0';
		elsif rising_edge(xCLK) then
			if Latch_RX_REQ = '1' then
				RX_REQ <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_RX_ACK = '1' then
			RX_ACK <= '0';
		elsif rising_edge(xCLK) then
			if Latch_RX_ACK = '1' then
				RX_ACK <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_UPSTREAM_BUSY = '1' then
			UPSTREAM_BUSY <= '0';
		elsif rising_edge(xCLK) then
			if Latch_UPSTREAM_BUSY = '1' then
				UPSTREAM_BUSY <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_GOOD_SYNC = '1' then
			GOOD_SYNC <= '0';
		elsif rising_edge(xCLK) then
			if G_CMD_STRB = '1' and Latch_PACKET_SENT = '0' then
				GOOD_SYNC <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_BAD_SYNC = '1' then
			BAD_SYNC <= '0';
		elsif rising_edge(xCLK) then
			if PACKET_ERROR = '1' then
				BAD_SYNC <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xCLK)
	begin
		if xCLR_FEEDBACK = '1' then
			FEEDBACK <= '0';
			G_FEEDBACK <= x"0000";
		elsif rising_edge(xCLK) then
			if Latch_FEEDBACK = '1' then
				FEEDBACK <= '1';
				G_FEEDBACK <= Latch_G_CMD_FEEDBACK;
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
	--feed back
	xFEEDBACK <= FEEDBACK;
	xG_FEEDBACK <= G_FEEDBACK;
	-- response downstream
	xPACKET_SENT <= PACKET_SENT;
	xRESEND_PACKET <= RESEND_PACKET;
	-- REQ checks
	xRX_REQ <= RX_REQ;
	xRX_ACK <= RX_ACK;
	xUPSTREAM_BUSY <= UPSTREAM_BUSY;
	-- SYNC handshakes
	xGOOD_SYNC <= GOOD_SYNC;
	xBAD_SYNC <= BAD_SYNC;
--------------------------------------------------------------------------------
end Behavioral;