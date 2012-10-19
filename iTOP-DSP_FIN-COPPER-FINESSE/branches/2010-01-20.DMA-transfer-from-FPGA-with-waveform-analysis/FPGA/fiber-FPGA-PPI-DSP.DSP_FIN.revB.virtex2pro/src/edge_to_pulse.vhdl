-- 2009-09-24 mza

library ieee;
--use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_1164.ALL;
entity edge_to_pulse is
port (
		i: in std_logic;
		clock: in std_logic;
		o: out std_logic:='0'
	);
end edge_to_pulse;

architecture Behavioral of edge_to_pulse is
	signal pulse_already_fired: std_logic:='0';
begin
	process(clock)
	begin
		if rising_edge(clock) then
			if i = '1' then
				if pulse_already_fired = '0' then
					o <= '1';
					pulse_already_fired <= '1';
				else
					o <= '0';
				end if;
			else
				o <= '0';
				pulse_already_fired <= '0';
			end if;
		end if;
	end process;
end Behavioral;
