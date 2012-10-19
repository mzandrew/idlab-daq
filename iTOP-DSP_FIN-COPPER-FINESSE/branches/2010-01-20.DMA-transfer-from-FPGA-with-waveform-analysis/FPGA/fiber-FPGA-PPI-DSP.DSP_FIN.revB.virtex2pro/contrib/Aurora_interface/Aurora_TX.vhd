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

entity Aurora_TX is
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
end Aurora_TX;

architecture Behavioral of Aurora_TX is
	type STATE_TYPE is ( IDLE,START_HEADER,
								PACKET_LENGTH,DATA_PACKET,END_HEADER);
	signal STATE 			: STATE_TYPE;
	signal SEND_DATA 		: std_logic_vector(23 downto 0);
	signal SEND_CNT 		: std_logic_vector(13 downto 0);
	signal TX_DATA 		: std_logic_vector(31 downto 0);
	signal SEND_BUSY   	: std_logic;
	signal TX_EN   		: std_logic;
	signal TX_XFER_EN  	: std_logic;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
	xSEND_BUSY 	<= SEND_BUSY;
	xTX_DATA 	<= TX_DATA;
	xTX_ADDR 	<= SEND_CNT;
	xTX_XFER_EN <= TX_XFER_EN;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if rising_edge(xCLK) then
			if xTX_BUSY = '0' then
				TX_XFER_EN <= TX_EN;
			else
				TX_XFER_EN <= '0';
			end if;
		end if;
	end process;				
--------------------------------------------------------------------------------
	process(xLINK_ACTIVE,xCLK,xTX_BUSY)
	begin
		if xLINK_ACTIVE = '0' then
			TX_DATA 		<= (others=>'0');
			SEND_CNT		<= (others=>'0');
			SEND_BUSY	<= '0';
			TX_EN			<= '0';
			STATE 		<= IDLE;
		elsif rising_edge(xCLK) and xTX_BUSY = '0' then
--------------------------------------------------------------------------------			
			case STATE is
--------------------------------------------------------------------------------	
				when IDLE =>			
					TX_DATA   	<= (others=>'0');
					SEND_CNT		<= (others=>'0');
					SEND_BUSY  	<= '0';
					TX_EN  		<= '0';
					if xSEND_PACKET = '1' then
						SEND_BUSY  <= '1';
						STATE <= START_HEADER; 
					end if;
--------------------------------------------------------------------------------						
				when START_HEADER =>			
					TX_DATA	<= x"1234" & xG_CMD;
					STATE 	<= PACKET_LENGTH;		
--------------------------------------------------------------------------------					
				when PACKET_LENGTH =>			
					TX_DATA	<= x"0000" & "00" & xLENGTH;
					if xLENGTH /= 0 then
						TX_EN  	<= '1';
						STATE 	<= DATA_PACKET;	
					else
						STATE 	<= END_HEADER;
					end if;
--------------------------------------------------------------------------------						
				when DATA_PACKET =>			
					TX_DATA	<= SEND_CNT(7 downto 0) & xSEND_DATA;
					SEND_CNT <= SEND_CNT + 1;
					if SEND_CNT = (xLENGTH - 1) then
						TX_EN <= '0';
						STATE <= END_HEADER;	
					end if;			
--------------------------------------------------------------------------------						
				when END_HEADER =>			
					TX_DATA	<= x"43214321";
					STATE 	<= IDLE;	
--------------------------------------------------------------------------------					
				when others =>	STATE<=IDLE;																
			end case;
		end if;
	end process;
--------------------------------------------------------------------------------
end Behavioral;