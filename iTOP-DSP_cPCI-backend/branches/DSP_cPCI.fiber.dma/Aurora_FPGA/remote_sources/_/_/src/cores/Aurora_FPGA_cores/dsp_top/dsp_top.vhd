----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Chester Lim
-- 
-- Create Date:    08:17:38 12/12/2011 
-- Design Name: 
-- Module Name:    dsp_top- Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: Top level of dsp cores
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity dsp_top is
	generic(
		BOOTMODE				: std_logic_vector(1 downto 0) := "11";	--DSP boot from SPI serial EEPROM
		ASYNC_RDY			: std_logic := '1';
		DSP0_BUS_RDY		: std_logic := '1';
		NON_MASKABLE		: std_logic_vector(1 downto 0) := "00"; 	--Enable/Disable Core A/B
		BYPASS				: std_logic := '1'
		);
	port(
		CLK0					: in std_logic;									--Input Clock USER_CLK_1
		CLK1					: in std_logic;									--Input Clock USER_CLK_2
		DSP_CLK0				: out std_logic;									--DSP0 Clock
		DSP_CLK1				: out std_logic;									--DSP1 Clock
		PPI0_CLK_0			: out std_logic;									--PPI0_0 Clock to pin
		PPI1_CLK_0			: out std_logic;									--PPI1_0 Clock to pin
		PPI0_CLK_1			: out std_logic;									--PPI0_1 Clock to pin
		PPI1_CLK_1			: out std_logic;									--PPI1_1 Clock to pin		
		PPI0_CLK_0r			: out std_logic;									--PPI0 Clock to use DSP0
		PPI1_CLK_0r			: out std_logic;									--PPI1 Clock to use DSP0
		PPI0_CLK_1r			: out std_logic;									--PPI0 Clock to use DSP1
		PPI1_CLK_1r			: out std_logic;									--PPI1 Clock to use DSP1
		
		DSP_CS				: in std_logic;									--Chip Select for DSP0/1
		
		--DSP JTAG
		TMS_A					: in std_logic;
		TCK_A					: in std_logic;
		TDI_A					: in std_logic;
		TDO_A					: out std_logic;
		EMU_A					: out std_logic;
		TRST_A				: in std_logic;
		DSP_EMU_A			: in std_logic;
		
		DSP_TMS_0			: out std_logic;
		DSP_TCK_0			: out std_logic;
		DSP_TDI_0			: out std_logic;
		DSP_TDO_0			: in std_logic;
		DSP_TRST_0			: out std_logic;
		DSP_RST0				: out std_logic;
		DSP_TMS_1			: out std_logic;
		DSP_TCK_1			: out std_logic;
		DSP_TDI_1			: out std_logic;
		DSP_TDO_1			: in std_logic;
		DSP_TRST_1			: out std_logic;
		DSP_RST1				: out std_logic;

		--Power-Up Config
		DSP0_BMODE			: out std_logic_vector(1 downto 0);
		ARDY0					: out std_logic;
		BR0					: out std_logic;
		NMI0					: out std_logic_vector(1 downto 0);
		BYPASS_0				: out std_logic;
		DSP1_BMODE			: out std_logic_vector(1 downto 0);
		ARDY1					: out std_logic;
		BR1					: out std_logic;
		NMI1					: out std_logic_vector(1 downto 0);
		BYPASS_1				: out std_logic
	);

end dsp_top;

architecture Behavioral of dsp_top is

	component pll_DSP
		port
		 (-- Clock in ports
		  USER_CLK           : in     std_logic;
		  -- Clock out ports
		  DSP_CLK				: out    std_logic;
		  PPI_CLK0				: out		std_logic;
		  PPI_CLK1				: out		std_logic;
		  -- Status and control signals
		  LOCKED					: out    std_logic
		 );
	end component;
	
	signal DSP_CLK_0			: std_logic;	--150 MHz
	signal DSP_CLK_1			: std_logic;	--150 MHz
	signal PPI_CLK0_0			: std_logic;	--75 MHz
	signal PPI_CLK1_0			: std_logic;	--75 MHz
	signal PPI_CLK0_1			: std_logic;	--75 MHz
	signal PPI_CLK1_1			: std_logic;	--75 MHz
	signal DSP_RESET			: std_logic := '0';
	signal PWR_INIT0			: std_logic := '1';
	signal PWR_INIT1			: std_logic := '1';
	signal LOCKED0				: std_logic;
	signal LOCKED1				: std_logic;
	
begin

	PPI0_CLK_0r <= PPI_CLK0_0;
	PPI1_CLK_0r <= PPI_CLK1_0;
	PPI0_CLK_1r <= PPI_CLK0_1;
	PPI1_CLK_1r <= PPI_CLK1_1;

	--DSP Configuration Pins
	DSP0_BMODE <= BOOTMODE;	--DSP0
	ARDY0 <= ASYNC_RDY;
	NMI0 <= NON_MASKABLE;
	BR0 <= DSP0_BUS_RDY;
	BYPASS_0 <= BYPASS;
--	DSP_RST0 <= DSP_RESET;
	DSP1_BMODE <= BOOTMODE;	--DSP1
	ARDY1 <= ASYNC_RDY;
	NMI1 <= NON_MASKABLE;
	BR1 <= DSP0_BUS_RDY;
	BYPASS_1 <= BYPASS;
--	DSP_RST1 <= DSP_RESET;
	
	--JTAG Control
	DSP_TMS_0 <= TMS_A when DSP_CS = '0' else '0';		--DSP0
	DSP_TCK_0 <= TCK_A when DSP_CS = '0' else '0';
	DSP_TDI_0 <= TDI_A when DSP_CS = '0' else '0';
	DSP_TRST_0 <= TRST_A when DSP_CS = '0' else '0';
	DSP_TMS_1 <= TMS_A when DSP_CS = '1' else '0';		--DSP1
	DSP_TCK_1 <= TCK_A when DSP_CS = '1' else '0';
	DSP_TDI_1 <= TDI_A when DSP_CS = '1' else '0';
	DSP_TRST_1 <= TRST_A when DSP_CS = '1' else '0';
	
	TDO_A <= DSP_TDO_0 when DSP_CS = '0' else DSP_TDO_1;
	EMU_A <= DSP_EMU_A;
	
	
	dsp_clk_0c : pll_DSP
	  port map
		(-- Clock in ports
		 USER_CLK => CLK0,
		 -- Clock out ports
		 DSP_CLK => DSP_CLK_0,
		 PPI_CLK0 => PPI_CLK0_0,
		 PPI_CLK1 => PPI_CLK1_0,
		 -- Status and control signals
		 LOCKED => LOCKED0);
		 
	dsp_clk_1c : pll_DSP
	  port map
		(-- Clock in ports
		 USER_CLK => CLK1,
--		  Clock out ports
		 DSP_CLK => DSP_CLK_1,
		 PPI_CLK0 => PPI_CLK0_1,
		 PPI_CLK1 => PPI_CLK1_1,
--		  Status and control signals
		 LOCKED => LOCKED1);
		 
	DSP0_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => DSP_CLK0, -- 1-bit output data
			C0 => DSP_CLK_0, -- 1-bit clock input
			C1 => not DSP_CLK_0, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);
	
	DSP1_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => DSP_CLK1, -- 1-bit output data
			C0 => DSP_CLK_1, -- 1-bit clock input
			C1 => not DSP_CLK_1, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);

	DSP0_PPI0_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => PPI0_CLK_0, -- 1-bit output data
			C0 => PPI_CLK0_0, -- 1-bit clock input
			C1 => not PPI_CLK0_0, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);

	DSP0_PPI1_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => PPI1_CLK_0, -- 1-bit output data
			C0 => PPI_CLK1_0, -- 1-bit clock input
			C1 => not PPI_CLK1_0, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);
	
	DSP1_PPI0_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => PPI0_CLK_1, -- 1-bit output data
			C0 => PPI_CLK0_1, -- 1-bit clock input
			C1 => not PPI_CLK0_1, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);

	DSP1_PPI1_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => PPI1_CLK_1, -- 1-bit output data
			C0 => PPI_CLK1_1, -- 1-bit clock input
			C1 => not PPI_CLK1_1, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);
	
	--Reset Logic; includes DSP power-up reset
	process(DSP_CLK_0)
		variable i	: integer range 0 to 3500 := 3500;
	begin
		if rising_edge(DSP_CLK_0) then
			if LOCKED0 = '0' or PWR_INIT0 = '1' then
				if i > 0 then
					DSP_RST0 <= '0';
					i := i - 1;
				else
					DSP_RST0 <= '1';
					PWR_INIT0 <= '0';
					i := 3500;
				end if;
			end if;
		end if;
	end process;
	
	process(DSP_CLK_1)
		variable i	: integer range 0 to 3500 := 3500;
	begin
		if rising_edge(DSP_CLK_1) then
			if LOCKED1 = '0' or PWR_INIT1 = '1' then
				if i > 0 then
					DSP_RST1 <= '0';
					i := i - 1;
				else
					DSP_RST1 <= '1';
					PWR_INIT1 <= '0';
					i := 3500;
				end if;
			end if;
		end if;
	end process;

end Behavioral;