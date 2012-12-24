--------------------------------------------------------------------------------
-- University of Hawaii at Manoa
-- Department of Physics
-- Instrumentation Development Lab
--
-- started 2010-04-09 by mza
-- updated 2012-12-24 for DSP_FIN revD by mza
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
		clock_150                                     : in  STD_LOGIC                       -- clock input
	);
	attribute loc                   : string;
--	attribute pullup                : string;
	attribute iostandard            : string;
	attribute clock_dedicated_route : string;
	attribute box_type              : string;
	-- finesse_interface_to_copper2_local_bus
	attribute loc of copper2_localbus_address_bus              : signal is "g6,f5,h8,j7,g7,h6,e4";    -- DSP_FIN revD "LA"
	attribute loc of copper2_localbus_data_bus                 : signal is "f3,d1,d2,g4,h4,k8,k7,h5"; -- DSP_FIN revD "LD"
	attribute loc of copper2_localbus_finesse_writes_to_copper : signal is "b1";                      -- DSP_FIN revD "LRW"
	attribute loc of copper2_localbus_chip_select_active_low   : signal is "c1";                      -- DSP_FIN revD "LCS"
--	attribute iostandard of address_bus              : signal is "lvttl";
--	attribute iostandard of data_bus                 : signal is "lvttl";
--	attribute iostandard of finesse_writes_to_copper : signal is "lvttl";
--	attribute iostandard of chip_select_active_low   : signal is "lvttl";
	attribute clock_dedicated_route of copper2_localbus_chip_select_active_low : signal is "false";
	-- finesse_interface_to_copper2_fifo
	attribute loc of copper2_fifo_data_bus                         : signal is "h22,h21,l17,k17,g22,g20,k18,k19,h20,j19,e22,e20,f22,f21,h19,h18,f20,g19,d22,d21,k16,l15,c22,c20,j17,j16,b22,b21,h17,h16,f19,f18"; -- DSP_FIN revD "FF"
	attribute loc of copper2_fifo_write_enable_active_low          : signal is "l19"; -- DSP_FIN revD "FWEN"
	attribute loc of copper2_fifo_write_clock                      : signal is "m19"; -- DSP_FIN revD "WCLK"
	attribute loc of copper2_fifo_is_full                          : signal is "j20"; -- DSP_FIN revD "FFUL"
	attribute loc of copper2_fifo_event_length_fifo_is_almost_full : signal is "k21"; -- DSP_FIN revD "NWFF"
	--
	attribute loc of clock_150 : signal is "f14"; -- DSP_FIN revD "BCLK"
	--
--	attribute iostandard of ibufgds : component is "LVDS_25";
--	attribute box_type of ibufgds : component is "BLACK_BOX";
end top;

architecture top_arch of top is
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
