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
-- DATE : 10 SEPT 2007																			--
-- Project name: ICRR firmware																--
--	Module name: MESS	  																			--
--	Description : 																					--
-- 	Master Event Synchronous Sequencer (MESS) module								--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MESS is
   port ( 
			 xSLWR			: in   std_logic;
			 xSTART		 	: in   std_logic;
			 xDONE		 	: in   std_logic;
			 xCLR_ALL	 	: in   std_logic;
			 xREAD			: in   std_logic_vector (23 downto 0); -- used to be xADC
			 xFPGA_DATA    : out  std_logic_vector (15 downto 0);
			 xRADDR			: out  std_logic_vector (13 downto 0);
 			 active	 	: out   std_logic
);
end MESS; 

architecture Behavioral of MESS is
	type STATE_TYPE is ( HDR_START,ADC,HDR_END,GND_STATE);
	signal STATE 			: STATE_TYPE;
	signal RADDR			: std_logic_vector(14 downto 0);
	signal FPGA_DATA		: std_logic_vector(15 downto 0);
	signal TOGGLE 	: std_logic;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
	xFPGA_DATA <= FPGA_DATA;
	xRADDR <= RADDR(14 downto 1);
--------------------------------------------------------------------------------
	process(xSLWR,xSTART,xDONE,xCLR_ALL)
	begin
		if xCLR_ALL = '1' or xDONE = '1' then
			RADDR 		<= (others=>'0');
			FPGA_DATA 	<= (others=>'0');
			TOGGLE <= '0';
			STATE 		<= HDR_START;
			active <= '0';
		elsif falling_edge(xSLWR) and xSTART = '1' then
--------------------------------------------------------------------------------			
			case STATE is
--------------------------------------------------------------------------------	
				when HDR_START =>	
					active <= '0';
					FPGA_DATA <= x"1234";
					STATE <= ADC;	
--------------------------------------------------------------------------------					
				when ADC =>	
					active <= '1';
					if TOGGLE = '0' then
						FPGA_DATA <= x"0" & xREAD(11 downto 0);
						TOGGLE <= not(TOGGLE);
					else
						FPGA_DATA <= x"0" & xREAD(23 downto 12);
						TOGGLE <= not(TOGGLE);
					end if;
					RADDR <= RADDR + 1;
					if RADDR = 8193 then
						active <= '0';
						RADDR <= (others=>'0');
						STATE <= HDR_END;	
					end if;
--------------------------------------------------------------------------------	
				when HDR_END =>	
					active <= '0';
					FPGA_DATA <= x"4321";		
					STATE <= GND_STATE;	
--------------------------------------------------------------------------------	
				when GND_STATE =>			
					active <= '0';
					FPGA_DATA <= (others=>'0');
--------------------------------------------------------------------------------	
				when others =>	STATE<=HDR_START;																
			end case;
		end if;
	end process;		
--------------------------------------------------------------------------------		
end Behavioral;