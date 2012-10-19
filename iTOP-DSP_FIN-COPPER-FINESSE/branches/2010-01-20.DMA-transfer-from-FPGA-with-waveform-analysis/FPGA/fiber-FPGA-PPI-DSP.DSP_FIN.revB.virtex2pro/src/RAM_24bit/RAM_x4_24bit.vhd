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
--	Module name: RAM_24bit		  																--
--	Description : 																					--
-- 	RAM_24bit firmware block																--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM_x4_24bit is
	port (
		-- Write I/Os
		xWRITE_CLOCK     	: in  std_logic;
		xWRITE_ENABLE		: in  std_logic_vector(3 downto 0);
		xWRITE_ADDRESS_0	: in  std_logic_vector(13 downto 0);
		xWRITE_ADDRESS_1	: in  std_logic_vector(13 downto 0);
		xWRITE_ADDRESS_2	: in  std_logic_vector(13 downto 0);
		xWRITE_ADDRESS_3	: in  std_logic_vector(13 downto 0);
		xWRITE_DATA_0		: in  std_logic_vector(23 downto 0);
		xWRITE_DATA_1		: in  std_logic_vector(23 downto 0);
		xWRITE_DATA_2		: in  std_logic_vector(23 downto 0);
		xWRITE_DATA_3		: in  std_logic_vector(23 downto 0);
		-- Read I/Os
		xREAD_CLOCK      : in  std_logic;
		xREAD_ADDRESS_0	: in  std_logic_vector(13 downto 0);
		xREAD_ADDRESS_1	: in  std_logic_vector(13 downto 0);
		xREAD_ADDRESS_2	: in  std_logic_vector(13 downto 0);
		xREAD_ADDRESS_3	: in  std_logic_vector(13 downto 0);
		xREAD_DATA_0		: out std_logic_vector(23 downto 0);
		xREAD_DATA_1		: out std_logic_vector(23 downto 0);
		xREAD_DATA_2		: out std_logic_vector(23 downto 0);
		xREAD_DATA_3		: out std_logic_vector(23 downto 0));
end RAM_x4_24bit;

architecture Behavioral of RAM_x4_24bit is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--   								components     		   						         --
--------------------------------------------------------------------------------
	component RAM_24bit
	port (
		-- Write I/Os
		xWRITE_CLOCK     	: in  std_logic;
		xWRITE_ENABLE			: in  std_logic;
		xWRITE_ADDRESS		: in  std_logic_vector(13 downto 0);
		xWRITE_DATA		: in  std_logic_vector(23 downto 0);
		-- Read I/Os
		xREAD_CLOCK    	 : in  std_logic;
		xREAD_ADDRESS		: in  std_logic_vector(13 downto 0);
		xREAD_DATA			: out std_logic_vector(23 downto 0));
	end component;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
	xRAM_24bit_0 : RAM_24bit
	port map (
		xWRITE_CLOCK 	=> xWRITE_CLOCK,
		xWRITE_ENABLE 	=> xWRITE_ENABLE(0),
		xWRITE_ADDRESS 	=> xWRITE_ADDRESS_0,
		xWRITE_DATA 	=> xWRITE_DATA_0,
		xREAD_CLOCK 	=> xREAD_CLOCK,
		xREAD_ADDRESS 	=> xREAD_ADDRESS_0,
		xREAD_DATA 	=> xREAD_DATA_0);  
--------------------------------------------------------------------------------
	xRAM_24bit_1 : RAM_24bit
	port map (
		xWRITE_CLOCK 	=> xWRITE_CLOCK,
		xWRITE_ENABLE 	=> xWRITE_ENABLE(1),
		xWRITE_ADDRESS 	=> xWRITE_ADDRESS_1,
		xWRITE_DATA 	=> xWRITE_DATA_1,
		xREAD_CLOCK 	=> xREAD_CLOCK,
		xREAD_ADDRESS 	=> xREAD_ADDRESS_1,
		xREAD_DATA 	=> xREAD_DATA_1);  
--------------------------------------------------------------------------------
	xRAM_24bit_2 : RAM_24bit
	port map (
		xWRITE_CLOCK 	=> xWRITE_CLOCK,
		xWRITE_ENABLE 	=> xWRITE_ENABLE(2),
		xWRITE_ADDRESS 	=> xWRITE_ADDRESS_2,
		xWRITE_DATA 	=> xWRITE_DATA_2,
		xREAD_CLOCK 	=> xREAD_CLOCK,
		xREAD_ADDRESS 	=> xREAD_ADDRESS_2,
		xREAD_DATA 	=> xREAD_DATA_2);  
--------------------------------------------------------------------------------
	xRAM_24bit_3 : RAM_24bit
	port map (
		xWRITE_CLOCK 	=> xWRITE_CLOCK,
		xWRITE_ENABLE 	=> xWRITE_ENABLE(3),
		xWRITE_ADDRESS 	=> xWRITE_ADDRESS_3,
		xWRITE_DATA 	=> xWRITE_DATA_3,
		xREAD_CLOCK 	=> xREAD_CLOCK,
		xREAD_ADDRESS 	=> xREAD_ADDRESS_3,
		xREAD_DATA 	=> xREAD_DATA_3);  		
--------------------------------------------------------------------------------
end Behavioral;