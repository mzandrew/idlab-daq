--------------------------------------------------------------------------------
-- University of Hawaii at Manoa
-- Department of Physics
-- Instrumentation Development Lab
--
-- started 2010-04-09 by mza
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity finesse_interface_to_copper2_fifo is -- COPPER-2 32bit FIFO
--	generic (
--	);
	Port (
		data_bus                         : out STD_LOGIC_VECTOR (31 downto 0) := x"a5f078bc"; -- data bus                      (ff)
		write_enable_active_low          : out STD_LOGIC := '1';                              -- write enable                  (fwen)
		write_clock                      : out STD_LOGIC := '0';                              -- write clock                   (fwclk)
		fifo_is_full                     : in  STD_LOGIC;                                     -- fifo almost full              (fful)
		event_length_fifo_is_almost_full : in  STD_LOGIC;                                     -- event-length fifo almost full (nwff)
		clock                            : in  STD_LOGIC                                      -- clock input
	);
end finesse_interface_to_copper2_fifo;

architecture Behavioral of finesse_interface_to_copper2_fifo is
	type clock_divider_counter_type is range 0 to 7;
--	variable clock_divider_counter : std_logic_vector(3 downto 0);
begin
	put_a_value_on_the_data_bus : process(clock, fifo_is_full)
		variable clock_divider_counter : clock_divider_counter_type := 0;
	begin
		if rising_edge(clock) then
			write_clock <= '0';
			write_enable_active_low <= '0';
			data_bus <= (others => 'Z');
			clock_divider_counter := clock_divider_counter + 1;
			if (clock_divider_counter >= 1) and (clock_divider_counter < 5) then
				data_bus <= x"a500ff47";
			elsif (clock_divider_counter >= 2) and (clock_divider_counter < 4) then
				write_clock <= '1';
			elsif (clock_divider_counter > 5) then
				clock_divider_counter := 0;
			end if;
		end if;
	end process;
end Behavioral;
