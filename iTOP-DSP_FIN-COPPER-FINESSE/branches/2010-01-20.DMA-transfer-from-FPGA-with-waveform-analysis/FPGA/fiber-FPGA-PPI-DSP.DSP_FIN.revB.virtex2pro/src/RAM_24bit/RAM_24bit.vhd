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
--	Description : 				 																	--
-- 	RAM_24bit firmware block																--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM_24bit is
	port (
		-- Write I/Os
		xWRITE_CLOCK     	: in  std_logic;
		xWRITE_ENABLE			: in  std_logic;
		xWRITE_ADDRESS		: in  std_logic_vector(13 downto 0);
		xWRITE_DATA		: in  std_logic_vector(23 downto 0);
		-- Read I/Os
		xREAD_CLOCK      : in  std_logic;
		xREAD_ADDRESS		: in  std_logic_vector(13 downto 0);
		xREAD_DATA			: out std_logic_vector(23 downto 0));
end RAM_24bit;

architecture Behavioral of RAM_24bit is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--   								components     		   						         --
--------------------------------------------------------------------------------
	component BLOCK_RAM_1bit
	port (
		-- Write I/Os
		xWRITE_CLOCK     	: in  std_logic;
		xWRITE_ENABLE			: in  std_logic;
		xWRITE_ADDRESS		: in  std_logic_vector(13 downto 0);
		xWRITE_DATA		: in  std_logic;
		-- Read I/Os
		xREAD_CLOCK      : in  std_logic;
		xREAD_ADDRESS		: in  std_logic_vector(13 downto 0);
		xREAD_DATA			: out std_logic);
	end component;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
	GEN: for I in 23 downto 0 generate
		xBLOCK_RAM_1bit : BLOCK_RAM_1bit
		port map (
			xWRITE_CLOCK 	=> xWRITE_CLOCK,
			xWRITE_ENABLE 	=> xWRITE_ENABLE,
			xWRITE_ADDRESS 	=> xWRITE_ADDRESS,
			xREAD_CLOCK 	=> xREAD_CLOCK,
			xREAD_ADDRESS 	=> xREAD_ADDRESS,
			xWRITE_DATA 	=> xWRITE_DATA(I),
			xREAD_DATA 	=> xREAD_DATA(I));  	
	end generate GEN;
--------------------------------------------------------------------------------
end Behavioral;