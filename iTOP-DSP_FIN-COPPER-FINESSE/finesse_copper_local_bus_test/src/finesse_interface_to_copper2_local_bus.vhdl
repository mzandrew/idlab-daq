----------------------------------------------------------------------------------
-- University of Hawaii at Manoa
-- Department of Physics
-- Instrumentation Development Lab
--
-- started 2010-03-30 by mza
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity finesse_interface_to_copper2_local_bus is -- COPPER-2 7bit address / 8bit data "local bus"
	generic (
		constant VERSION             : integer :=   1; -- remember that this is in decimal
		constant SERIAL_LOW          : integer :=  35; -- remember that this is in decimal
		constant SERIAL_HIGH         : integer :=  53; -- remember that this is in decimal
		constant FINESSE_TYPE_LOW    : integer :=  67; -- remember that this is in decimal
		constant FINESSE_TYPE_HIGH   : integer :=  89; -- remember that this is in decimal
		constant number_of_addresses : integer := 256; -- remember that this is in decimal
		constant data_bus_width      : integer :=   8  -- remember that this is in decimal
	);
	Port (
		address_bus              : in     STD_LOGIC_VECTOR (6 downto 0); -- local address bus     (la)
		data_bus                 : inout  STD_LOGIC_VECTOR (7 downto 0); -- local data bus        (ld)
		finesse_writes_to_copper : in     STD_LOGIC;                     -- local bus write/read  (lwr)
		chip_select_active_low   : in     STD_LOGIC                      -- local bus chip select (lcs/csb)
	);
--	attribute loc                   : string;
--	attribute pullup                : string;
--	attribute iostandard            : string;
--	attribute clock_dedicated_route : string;
	--
--	attribute loc of address_bus              : signal is "w8,w9,w5,y5,ab9,aa9,aa3";       -- DSP_FIN revC
--	attribute loc of data_bus                 : signal is "aa4,ac8,ac9,w4,y3,ad8,ad9,ad5"; -- DSP_FIN revC
--	attribute loc of finesse_writes_to_copper : signal is "ac3";                           -- DSP_FIN revC
--	attribute loc of chip_select_active_low   : signal is "ac4";                           -- DSP_FIN revC
	--
--	attribute iostandard of address_bus              : signal is "lvttl";
--	attribute iostandard of data_bus                 : signal is "lvttl";
--	attribute iostandard of finesse_writes_to_copper : signal is "lvttl";
--	attribute iostandard of chip_select_active_low   : signal is "lvttl";
	--
--	attribute clock_dedicated_route of chip_select_active_low : signal is "false";
end finesse_interface_to_copper2_local_bus;

architecture Behavioral of finesse_interface_to_copper2_local_bus is
	type coppper_local_bus_ram_type is array (0 to number_of_addresses-1) of std_logic_vector(data_bus_width-1 downto 0);
	signal coppper_local_bus_ram : coppper_local_bus_ram_type;
	signal local_bus_register    : std_logic_vector(7 downto 0) := x"12";
	signal output_data_buffer    : std_logic_vector(7 downto 0) := x"34";
	signal address_buffer_8      : std_logic_vector(7 downto 0) := x"56";
begin
	store_contents_of_address_bus_and_data_bus : process(chip_select_active_low)
	begin
		if falling_edge(chip_select_active_low) then
			address_buffer_8 <= '0' & address_bus;
			if finesse_writes_to_copper = '0' then -- finesse_writes_to_copper=0 => COPPER writes, FINESSE reads
				local_bus_register <= data_bus;
				coppper_local_bus_ram(conv_integer(('0' & address_bus))) <= data_bus;
			end if;
		end if;
	end process;
--	store_cached_data_bus_contents_in_ram_array_at_desired_address : process (finesse_writes_to_copper, address_buffer_8, local_bus_register)
--	begin
--		if finesse_writes_to_copper = '0' then -- finesse_writes_to_copper=0 => COPPER writes, FINESSE reads
--			coppper_local_bus_ram(conv_integer(address_buffer_8)) <= local_bus_register;
--		end if;
--	end process;
	select_data_to_drive_bus_with_from_stored_address : process(address_buffer_8, local_bus_register, coppper_local_bus_ram)
	begin
		if    address_buffer_8 = x"57" then
			output_data_buffer <= x"f0";
		elsif address_buffer_8 = x"63" then
			output_data_buffer <= local_bus_register;
		elsif address_buffer_8 = x"7a" then
			output_data_buffer <= conv_std_logic_vector(VERSION, 8);
		elsif address_buffer_8 = x"7b" then
			output_data_buffer <= conv_std_logic_vector(SERIAL_LOW, 8);
		elsif address_buffer_8 = x"7c" then
			output_data_buffer <= conv_std_logic_vector(SERIAL_HIGH, 8);
		elsif address_buffer_8 = x"7d" then
			output_data_buffer <= conv_std_logic_vector(FINESSE_TYPE_LOW, 8);
		elsif address_buffer_8 = x"7e" then
			output_data_buffer <= conv_std_logic_vector(FINESSE_TYPE_HIGH, 8);
--		elsif address_buffer_8 = x"" then
		else
--			output_data_buffer <= address_buffer_8;
			output_data_buffer <= coppper_local_bus_ram(conv_integer(address_buffer_8));
--			output_data_buffer <= x"00";
		end if;
	end process;
	drive_data_bus_when_finesse_is_writing : process(chip_select_active_low, finesse_writes_to_copper, output_data_buffer)
	begin
		if finesse_writes_to_copper = '1' and chip_select_active_low = '0' then -- cs=active and finesse_writes_to_copper=1 => COPPER reads, FINESSE writes
--			data_bus <= x"78";
			data_bus <= output_data_buffer;
		else
			data_bus <= (others => 'Z');
		end if;
	end process;
end Behavioral;

