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
-- DATE : 16 JUNE 2007																			--
-- Project name: ICRR firmware																--
--	Module name: USBwrite   																	--
--	Description : 																					--
-- 	USB 2.0 writing data to PC module													--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity USBwrite is
   port ( xIFCLK    : in    std_logic;
          xFLAGB    : in    std_logic;	
          xFLAGC    : in    std_logic;	
          xRBUSY    : in    std_logic;	
          xRESET    : in    std_logic;	
          xSTART    : in    std_logic;	
          xSYNC_USB : in    std_logic; 
          xDONE     : out   std_logic; 	
          xPKTEND   : out   std_logic;	
          xSLWR     : out   std_logic;	
          xWBUSY    : out   std_logic;
			 xactive   : out   std_logic);	
end USBwrite;

architecture BEHAVIORAL of USBwrite is
	type STATE_TYPE is ( IDLE, RCHECK, STATE1, STATE2, STATE3, 
								RD_DONE, SYNC1, SYNC2, SYNC3);
	signal STATE 		: STATE_TYPE;
	signal NEXT_STATE : STATE_TYPE;
	signal column 		: std_logic_vector(20 downto 0);
	constant DELAY_HI : integer:= 5;
	constant DELAY_LO : integer:= 5;
	signal sync			: std_logic;
	signal STARTRD		: std_logic;
	signal STARTSNC	: std_logic;
	signal LoHi			: std_logic;
	signal SLWR			: std_logic;
	signal DONE			: std_logic;
	signal WBUSY		: std_logic;
	signal PKTEND		: std_logic;
	signal LRAD 		: std_logic_vector(20 downto 0);
	signal act        : std_logic;
--------------------------------------------------------------------------------	
begin
--------------------------------------------------------------------------------
	xDONE <= DONE;
	xSLWR <= SLWR;
	xWBUSY <= WBUSY;
	xPKTEND <= PKTEND;
	xactive <= act;
--------------------------------------------------------------------------------	
	process(xIFCLK, xRESET, STARTSNC, STARTRD)
	variable j: integer range 0 to 15 :=0;	-- Integer for delay	
	begin
		if xRESET = '0' then
			DONE			<= '0';
			sync			<= '0';
			LRAD 			<= (others=>'0');
			LoHi 			<= '0';
         SLWR 			<=	'1';
         PKTEND 		<=	'1';
			WBUSY 		<=	'0';
			STATE 		<= IDLE;
			NEXT_STATE	<= IDLE;	
			act         <= '0';
		elsif rising_edge(xIFCLK) then
			DONE			<= '0';
			WBUSY 		<=	'1';
			SLWR 		   <=	'1';
         PKTEND 		<=	'1';
--------------------------------------------------------------------------------
			case STATE is
--------------------------------------------------------------------------------
				when IDLE =>
					WBUSY <=	'0';
						if STARTRD = '1' then  	
							STATE  	<= RCHECK;
							column 	<= (others=>'0');
							LRAD	 	<= (others=>'0');
						end if;
						if xSYNC_USB = '1' then
							if STARTSNC = '1'  then
								sync 			<= '1';
								STATE 		<= SYNC1;
								NEXT_STATE 	<= IDLE;		 
							end if;
						end if;						
--------------------------------------------------------------------------------										
				when RCHECK	=>					  		-- Check if READ module is readin data from USB			
					if xRBUSY = '0' then		  		-- If not, send sync packet first
						WBUSY <= '1';  
						STATE <= STATE1;
					else							 		-- Else wait here and allow reading
						WBUSY <= '0';
					end if;
--------------------------------------------------------------------------------										
				when STATE1 =>										-- Check Full flag	
					WBUSY <= '0';
					if xFLAGC = '1' and xRBUSY = '0' then	 	-- 1 = Empty
						WBUSY <= '1';
						STATE <= STATE2;
					end if;
--------------------------------------------------------------------------------
				when STATE2 =>				
					j := j + 1;					
					if j = (DELAY_LO + DELAY_HI) then
						j 		:= 0;
						SLWR 	<= '1';
						STATE <= STATE3;
					elsif j <= DELAY_LO then 
						SLWR 	<= '0';
					elsif j > DELAY_LO and j <= (DELAY_LO + DELAY_HI) then
						SLWR 	<= '1';
					end if;
--------------------------------------------------------------------------------
				when STATE3 =>									  	
					if column = 8199 then -- 8195
						column 	<= (others=>'0');
						LRAD	 	<= (others=>'0');
						DONE 		<= '1';
						STATE		<= RD_DONE;			
					else 
						STATE 	<= STATE1;
						LRAD		<= column;
						column 	<= column + 1;		
					end if;
					if column >= 4 and column < (8192+4) then
						act <= '1';
					else
						act <= '0';
					end if;
--------------------------------------------------------------------------------
				when RD_DONE =>	
					DONE 		<= '1';
					if j = 3 then
						j := 0;
						STATE 	<= SYNC3;
						NEXT_STATE <= IDLE;
					else
						j:= j + 1;
					end if;	
--------------------------------------------------------------------------------
				when SYNC1 =>
					sync 	<= '1';
					if xFLAGC = '1' and xRBUSY ='0' then	 
						if j = DELAY_LO + DELAY_HI then
							j 		:= 0;
							SLWR 	<= '1';
							STATE <= SYNC2;
						elsif j <= DELAY_LO then 
							SLWR 	<= '0';
						elsif j > DELAY_LO and j <= (DELAY_LO + DELAY_HI) then
							SLWR 	<= '1';
						end if;
					j := j + 1;
					else
						WBUSY <= '0';
					end if;
--------------------------------------------------------------------------------
				when SYNC2 =>
					if LoHi = '0' then		-- LoHi = 0
						LoHi 	<= '1';			--> LoHi = '1'
						STATE <= SYNC1;
					elsif LoHi = '1' then	-- LoHi = 1
						LoHi 	<= '0';			--> LoHi = '1'
						STATE <= SYNC3;
					end if;
--------------------------------------------------------------------------------	
				when SYNC3 =>	-- PKTEND
					if xRBUSY ='0' then
						WBUSY <='1';
						if j = 7 then
							PKTEND <= '1';
							j := 0;
							sync	<= '0';
							STATE <= NEXT_STATE;						
						elsif j > 3 then
							PKTEND <= '1';
							j := j + 1;
						else
							PKTEND <= '0';
							j := j + 1;
						end if;
					else
						WBUSY <='0';
					end if;
				when others =>	STATE<=IDLE;																
			end case;
		end if;
	end process;
--------------------------------------------------------------------------------	
	process(xIFCLK, xRESET, STARTRD)
	variable i: integer range 0 to 131071 :=0;	
	begin
		if xRESET = '0' then
			i := 0;
		elsif rising_edge(xIFCLK) then
			i := i + 1;			
			if i > 131063 and STARTRD = '0' then
				STARTSNC <= '1';
			else
			 	STARTSNC <= '0';
			end if;	
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xIFCLK, xRESET, xSTART)
	begin
		if xRESET ='0' then
			STARTRD <= '0';	
		elsif rising_edge(xIFCLK) then
			if xSTART = '1' then
				STARTRD <= '1';
			else 
				STARTRD <= '0';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------	
end Behavioral;