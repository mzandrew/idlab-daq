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

entity top is
	Port (
		-- finesse_interface_to_copper2_local_bus
		copper2_localbus_address_bus              : in     STD_LOGIC_VECTOR (6 downto 0); -- local address bus     (la)
		copper2_localbus_data_bus                 : inout  STD_LOGIC_VECTOR (7 downto 0); -- local data bus        (ld)
		copper2_localbus_finesse_writes_to_copper : in     STD_LOGIC;                     -- local bus write/read  (lwr)
		copper2_localbus_chip_select_active_low   : in     STD_LOGIC;                     -- local bus chip select (cs)
		-- finesse_interface_to_copper2_fifo
		copper2_fifo_data_bus                         : out STD_LOGIC_VECTOR (31 downto 0); -- data bus     (ff)
		copper2_fifo_write_enable_active_low          : out STD_LOGIC;                      -- write enable (fwen)
		copper2_fifo_write_clock                      : out STD_LOGIC;                      -- write clock  (fwclk)
		copper2_fifo_is_full                          : in  STD_LOGIC;                      -- fifo full    (fful)
		copper2_fifo_event_length_fifo_is_almost_full : in  STD_LOGIC;                      -- event-length fifo almost full (nwff)
		clock_150_p                                   : in  STD_LOGIC;                      -- clock input
		clock_150_m                                   : in  STD_LOGIC                       -- clock input
	);
	attribute loc                   : string;
--	attribute pullup                : string;
	attribute iostandard            : string;
	attribute clock_dedicated_route : string;
	attribute box_type              : string;
	-- finesse_interface_to_copper2_local_bus
	attribute loc of copper2_localbus_address_bus              : signal is "w8,w9,w5,y5,ab9,aa9,aa3";       -- DSP_FIN revC
	attribute loc of copper2_localbus_data_bus                 : signal is "aa4,ac8,ac9,w4,y3,ad8,ad9,ad5"; -- DSP_FIN revC
	attribute loc of copper2_localbus_finesse_writes_to_copper : signal is "ac3";                           -- DSP_FIN revC
	attribute loc of copper2_localbus_chip_select_active_low   : signal is "ac4";                           -- DSP_FIN revC
--	attribute iostandard of address_bus              : signal is "lvttl";
--	attribute iostandard of data_bus                 : signal is "lvttl";
--	attribute iostandard of finesse_writes_to_copper : signal is "lvttl";
--	attribute iostandard of chip_select_active_low   : signal is "lvttl";
	attribute clock_dedicated_route of copper2_localbus_chip_select_active_low : signal is "false";
	-- finesse_interface_to_copper2_fifo
	attribute loc of copper2_fifo_data_bus                         : signal is "g4,h4,a10,b10,j5,k6,d10,e10,f3,e3,f10,g10,d3,c3,a9,b9,e6,d6,c8,d8,c7,b7,e7,e8,h6,g7,f7,f8,a7,a8,h7,h8"; -- DSP_FIN revC
	attribute loc of copper2_fifo_write_enable_active_low          : signal is "k10"; -- DSP_FIN revC
	attribute loc of copper2_fifo_write_clock                      : signal is "g9";  -- DSP_FIN revC
	attribute loc of copper2_fifo_is_full                          : signal is "b6";  -- DSP_FIN revC
	attribute loc of copper2_fifo_event_length_fifo_is_almost_full : signal is "d5";  -- DSP_FIN revC
	--
	attribute loc of clock_150_p : signal is "af14";  -- DSP_FIN revC
	attribute loc of clock_150_m : signal is "af13";  -- DSP_FIN revC
	--
--	attribute iostandard of ibufgds : component is "LVDS_25";
--	attribute box_type of ibufgds : component is "BLACK_BOX";
end top;

architecture top_arch of top is
	signal clock_150 : std_logic;
	component ibufgds is
		port (
			O  : out STD_LOGIC;
			I  : in  STD_LOGIC;
			IB : in  STD_LOGIC
		);
	end component;
	component finesse_interface_to_copper2_local_bus is
		Port (
			address_bus              : in     STD_LOGIC_VECTOR (6 downto 0); -- local address bus
			data_bus                 : inout  STD_LOGIC_VECTOR (7 downto 0); -- local data bus
			finesse_writes_to_copper : in     STD_LOGIC;                     -- local bus write/read
			chip_select_active_low   : in     STD_LOGIC                      -- local bus chip select
		);
	end component;
	component finesse_interface_to_copper2_fifo is
		Port (
			data_bus                         : out STD_LOGIC_VECTOR (31 downto 0); -- data bus     (ff)
			write_enable_active_low          : out STD_LOGIC;                      -- write enable (fwen)
			write_clock                      : out STD_LOGIC;                      -- write clock  (fwclk)
			fifo_is_full                     : in  STD_LOGIC;                      -- fifo full    (fful)
			event_length_fifo_is_almost_full : in  STD_LOGIC;                      -- event-length fifo almost full (nwff)
			clock                            : in  STD_LOGIC                       -- clock input
		);
	end component;
begin
	--
	ibufgds_clock_150 : ibufgds port map (
		I  => clock_150_p,
		IB => clock_150_m,
		O  => clock_150
	);
	--
	finesse_interface_to_copper2_local_bus_instance : finesse_interface_to_copper2_local_bus port map (
		address_bus              => copper2_localbus_address_bus,
		data_bus                 => copper2_localbus_data_bus,
		finesse_writes_to_copper => copper2_localbus_finesse_writes_to_copper,
		chip_select_active_low   => copper2_localbus_chip_select_active_low
	);
	finesse_interface_to_copper2_fifo_instance : finesse_interface_to_copper2_fifo port map (
		data_bus                         => copper2_fifo_data_bus,
		write_enable_active_low          => copper2_fifo_write_enable_active_low,
		write_clock                      => copper2_fifo_write_clock,
		fifo_is_full                     => copper2_fifo_is_full,
		event_length_fifo_is_almost_full => copper2_fifo_event_length_fifo_is_almost_full,
		clock                            => clock_150
	);
end top_arch;
