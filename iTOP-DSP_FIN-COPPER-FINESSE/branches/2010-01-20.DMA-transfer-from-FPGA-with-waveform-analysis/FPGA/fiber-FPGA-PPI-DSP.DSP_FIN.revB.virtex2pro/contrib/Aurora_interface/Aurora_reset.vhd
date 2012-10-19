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
-- DATE : 10 March 2007																			--
-- Project name: FDIRC_CAMAC firmware														--
-- FPGA chip :	Xilinx's SPARTAN3	xc3s200-208											   --
-- USB chip : CYPRESS CY7C68013  															--
--	Module name: PROGRESET        															--
--	Description : 																					--
-- 	progreset will be reset other module                        				--
--																										--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--------------------------------------------------------------------------------
--   								I/O Definitions		   						         --
--------------------------------------------------------------------------------

entity Aurora_reset is
    Port ( 	CLK     : 	in std_logic; 		-- CLOCK	48MHz
          	WAKEUP  : 	in std_logic; 		-- Active High Powered up USB
				Clr_all : 	out std_logic; 	-- Active High Clr_all
           	GLRST   : 	out std_logic); 	-- RESET low-active
end Aurora_reset;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

architecture Behavioral of Aurora_reset is
	type State_type is(RESETD, NORMAL);
	signal state: State_type;	
	
	begin xRESET : process(WAKEUP, CLK) 
		variable i: integer range 0 to 144000000 :=0;
	begin	
		if WAKEUP = '0' then -- asynchronous reset
			GLRST 	<= '0';
			Clr_all 	<= '1';		 				
			state <= RESETD;		
		elsif CLK = '1' and CLK'event then		
			case	state is
--------------------------------------------------------------------------------				
				when RESETD =>
					GLRST 	<= '0';
					Clr_all 	<= '1';
						if i = 144000000 then
							i:=0;
							state <= NORMAL;
						else
							if WAKEUP = '1' then
								i := i + 1;
								state <= RESETD;
							else
								state <= RESETD;
							end if;
						end if;
--------------------------------------------------------------------------------
				when NORMAL =>
					if WAKEUP = '1' then
						GLRST 	<= '1';
						Clr_all 	<= '0';
						state <=NORMAL;
					else
						state <= RESETD;
					end if;
--------------------------------------------------------------------------------
				when others =>
					state <= RESETD;
			end case;	
--------------------------------------------------------------------------------	
		end if;
	end process xRESET;
end Behavioral;

--------------------------------------------------------------------------------
--   			                 	The End        						   	         --
--------------------------------------------------------------------------------
