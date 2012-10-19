-- written 2009-08-20 by mza

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity blackfin_reset is
	Port (
		clock : in	STD_LOGIC; -- whatever the dsp gets
		reset : out	STD_LOGIC := '1'; -- active low
		button : in STD_LOGIC; -- must be active high
		bypass : in STD_LOGIC -- tells dsp to bypass pll until software enables it explicitly
	);
end blackfin_reset;

architecture Behavioral of blackfin_reset is

begin
	process (clock,bypass,button)
	constant reset_timeout_without_pll: integer := 11;
	constant reset_timeout_with_pll: integer := 11+2000;
--	constant reset_timeout_without_pll: integer := 30000000;
--	constant reset_timeout_with_pll: integer := 60000000;
	constant initial_value_of_count: integer := reset_timeout_without_pll + reset_timeout_with_pll + 2;
	variable count : integer := initial_value_of_count;
	variable use_pll : integer := 1;
	begin
		if (rising_edge(clock)) then
			if (count=0) then
				reset <= '1';
			elsif (count<initial_value_of_count) then
				reset <= '0';
				count := count - 1;
			else
				reset <= '0';
				if (use_pll=0) then
					count := reset_timeout_without_pll;
				else
					count := reset_timeout_with_pll;
				end if;
			end if;
		end if;
--		use_pll <= not bypass
		if (bypass='1') then
			use_pll := 0;
		else
			use_pll := 1;
		end if;
--		if (button'event) then
		if (button='1') then
			reset <= '0';
			if (use_pll=1) then
				count := reset_timeout_with_pll;
			else
				count := reset_timeout_without_pll;
			end if;
		end if;
	end process;
end Behavioral;
