----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:17:38 12/12/2011 
-- Design Name: 
-- Module Name:    dsp_rx_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
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

use work.data16_pkg.all;

entity dsp_top is
	generic(
		BOOTMODE				: std_logic_vector(1 downto 0) := "11";	--DSP boot from SPI serial EEPROM
		ASYNC_RDY			: std_logic := '1';
		DSP0_BUS_RDY		: std_logic := '1';
		NON_MASKABLE		: std_logic_vector(1 downto 0) := "00"; --Enable/Disable Core A/B
		BYPASS				: std_logic := '1';
		PACKET_SIZE			: integer := 140; --140 32-bit
		PACKET_QEV			: integer := 132; --132 Packets Per Quarter Event
		DATA16_IN			: ram_type := data16
	);

	port(
		BCLK_A				: in std_logic;	--156.25MHz
		DSP_CLK0				: out std_logic;	--40MHz
		PPI0_CLK_0			: out std_logic;	--20MHz
		PPI1_CLK_0			: out std_logic;	--20MHz
		DSP_RST0				: out std_logic;
		PPI0_SYNC1_0		: out std_logic;
		PPI1_SYNC1_0		: in std_logic;
		PPI1_SYNC2_0		: in std_logic;
		PF_0_0				: in std_logic;	--WR_EN for FIFO
		PF_0_1				: in std_logic;	--Start Counter
		PF_0_2				: in std_logic;	--FIFO Reset
		PPI0_0				: out std_logic_vector(15 downto 0); --Data bus from PPI0
		PPI1_0				: in std_logic_vector(15 downto 0); --Data bus from PPI1
		
		--JTAG
		TMS_A					: in std_logic;
		TCK_A					: in std_logic;
		TDI_A					: in std_logic;
		TDO_A					: out std_logic;
		EMU_A					: out std_logic;
		TRST_A				: in std_logic;
		DSP_TMS_0			: out std_logic;
		DSP_TCK_0			: out std_logic;
		DSP_TDI_0			: out std_logic;
		DSP_TDO_0			: in std_logic;
		DSP_EMU_A			: in std_logic;
		DSP_TRST_0			: out std_logic;
		
		--Power-Up Config
		DSP0_BMODE			: out std_logic_vector(1 downto 0);
		ARDY0					: out std_logic;
		BR0					: out std_logic;
		NMI0					: out std_logic_vector(1 downto 0);
		BYPASS_0				: out std_logic
	);

end dsp_top;

architecture Behavioral of dsp_top is

	component pll_DSP
	port
	 (-- Clock in ports
	  CLK_IN1           : in     std_logic;
	  -- Clock out ports
	  PPI_CLK          : out    std_logic;
	  DSP_CLK          : out    std_logic;
	  -- Status and control signals
	  LOCKED           : out    std_logic
	 );
	end component;

	COMPONENT rx_fifo
	  PORT (
		 rst : IN STD_LOGIC;
		 wr_clk : IN STD_LOGIC;
		 rd_clk : IN STD_LOGIC;
		 din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 wr_en : IN STD_LOGIC;
		 rd_en : IN STD_LOGIC;
		 dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 full : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC;
		 prog_full : OUT STD_LOGIC
	  );
	END COMPONENT;

	---------------------------------------ChipScope--------------------------------
	component chipscope_icon
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

	end component;

	-- Synplicity black box declaration
	attribute syn_black_box : boolean;
	attribute syn_black_box of chipscope_icon: component is true;

	component chipscope_ila
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 TRIG0 : IN STD_LOGIC_VECTOR(127 DOWNTO 0));

	end component;
	-------------------------------------End ChipScope------------------------------
	constant QEV_SIZE		: integer := PACKET_SIZE * PACKET_QEV;

	signal PPI_CLK			: std_logic;	--20MHz
	signal DSP_CLK			: std_logic;	--40MHz
	signal WR_EN			: std_logic := '0';
	signal WR_EN_r			: std_logic := '0';
	signal RD_EN			: std_logic := '0';
	signal LOCKED			: std_logic;

	signal DSP_RESET		: std_logic := '0';
	signal PWR_INIT		: std_logic := '1';
	
	type FIFO_WE_STATE_TYPE is(
			start_we_state,
			wait_we_state,
			stop_we_state,
			reset_we_state
		);
	signal FIFO_WE_STATE	: FIFO_WE_STATE_TYPE := start_we_state;
	signal FIFO_IN_DATA	: std_logic_vector(15 downto 0);
	signal FIFO_DATA_OUT	: std_logic_vector(31 downto 0);
	signal FIFO_FULL		: std_logic := '0';
	signal FIFO_EMPTY		: std_logic := '0';
	
	signal OUTDATA					: std_logic_vector(15 downto 0);
	signal SUM						: std_logic_vector(31 downto 0);
	signal CHIPSCOPE_CONTROL	: std_logic_vector(35 downto 0);
	
begin
	--DSP Configuration Pins
	DSP0_BMODE <= BOOTMODE;
	ARDY0 <= ASYNC_RDY;
	NMI0 <= NON_MASKABLE;
	BR0 <= DSP0_BUS_RDY;
	BYPASS_0 <= BYPASS;
	DSP_RST0 <= DSP_RESET;

	--JTAG Control
	DSP_TMS_0 <= TMS_A;
	DSP_TCK_0 <= TCK_A;
	DSP_TDI_0 <= TDI_A;
	TDO_A <= DSP_TDO_0;
	EMU_A <= DSP_EMU_A;
	DSP_TRST_0 <= TRST_A;
	
	--Clock Generation
	PPI0_CLK_0 <= PPI_CLK;
	PPI1_CLK_0 <= PPI_CLK;
	DSP_CLK0 <= DSP_CLK;
	
	clk_gen : pll_DSP
	  port map(-- Clock in ports
		 CLK_IN1 => BCLK_A,
		 -- Clock out ports
		 PPI_CLK => PPI_CLK,	--20MHz
		 DSP_CLK => DSP_CLK,		--40MHz
		 -- Status and control signals
		 LOCKED => LOCKED
		);

	--Reset Logic; includes DSP power-up reset
	process(DSP_CLK)
		variable i	: integer range 0 to 3500 := 3500;
	begin
		if rising_edge(DSP_CLK) then
			if LOCKED = '0' or PWR_INIT = '1' then
				if i > 0 then
					DSP_RESET <= '0';
					i := i - 1;
				else
					DSP_RESET <= '1';
					PWR_INIT <= '0';
					i := 3500;
				end if;
			end if;
		end if;
	end process;

	--Send Data
	process(PPI_CLK,OUTDATA)
		variable rd_addr	: integer range 0 to 2*QEV_SIZE := 0;
		variable wait0 : std_logic := '0';
	begin
		if rising_edge(PPI_CLK) then
			if wait0 = '1' then
				PPI0_SYNC1_0 <= '1';
				if rd_addr < 2*QEV_SIZE then
					rd_addr := rd_addr + 1;
				end if;
			else
				PPI0_SYNC1_0 <= '0';
				rd_addr := 0;
			end if;
			wait0 := PF_0_1;
		end if;
		OUTDATA <= DATA16_IN(rd_addr);
		PPI0_0 <= OUTDATA;
	end process;
	
	--Simple FIFO
	example_fifo : rx_fifo			--IN: 16-bit x 256, OUT: 32-bit x 128
	  PORT MAP (
		 rst => PF_0_2,
		 wr_clk => PPI_CLK,
		 rd_clk => PPI_CLK,
		 din => FIFO_IN_DATA,
		 wr_en => WR_EN,
		 rd_en => RD_EN,
		 dout => FIFO_DATA_OUT,
		 full => open,--FIFO_FULL,
		 empty => FIFO_EMPTY,
		 prog_full => FIFO_FULL
	  );	
	
	--WR_EN Logic
	process(PPI_CLK)
	begin
		if rising_edge(PPI_CLK) then
			FIFO_IN_DATA <= PPI1_0;
			WR_EN <= WR_EN_r;
			case FIFO_WE_STATE is
				when start_we_state =>		--Wait for PF[0] to be asserted
					if PF_0_0 = '1' then
						FIFO_WE_STATE <= wait_we_state;
					else
						FIFO_WE_STATE <= start_we_state;
					end if;
					WR_EN_r <= '0';
				when wait_we_state =>		--Once PF[0] is asserted, wait for PPI_FS2
					if PPI1_SYNC2_0 = '1' then
						FIFO_WE_STATE <= stop_we_state;
						WR_EN_r <= '1';
					else
						FIFO_WE_STATE <= wait_we_state;
						WR_EN_r <= '0';
					end if;
				when stop_we_state =>		--While PPI_FS2 is asserted take data
					if PPI1_SYNC2_0 = '0' then
						FIFO_WE_STATE <= reset_we_state;
					else
						FIFO_WE_STATE <= stop_we_state;
					end if;
					WR_EN_r <= PPI1_SYNC2_0;
				when reset_we_state =>		--Take data only for the first PPI_FS2 assertion 
					if PF_0_0 = '0' then		--then wait till PF[0] is deasserted
						FIFO_WE_STATE <= start_we_state;
					else
						FIFO_WE_STATE <= reset_we_state;
					end if;
					WR_EN_r <= '0';
				when others => FIFO_WE_STATE <= reset_we_state;
			end case;
		end if;
	end process;

	--RD_EN Logic
	process(PPI_CLK)
	begin
		if rising_edge(PPI_CLK) then
				if FIFO_FULL = '1' then
					RD_EN <= '1';
				elsif FIFO_EMPTY = '1' then
					RD_EN <= '0';
				else
					RD_EN <= RD_EN;
				end if;
		end if;
	end process;
	
	--Check Sum
	process(PPI_CLK,FIFO_DATA_OUT)
		variable temp_data	: std_logic_vector(31 downto 0);
		variable count			: integer range 0 to QEV_SIZE := 0;
	begin
		if rising_edge(PPI_CLK) then
			if PF_0_2 = '1' then
				SUM <= x"00000000";
			end if;
			if RD_EN = '1' then
				if count < QEV_SIZE + 1 then
					SUM <= std_logic_vector(unsigned(SUM) + unsigned(temp_data));
					count := count + 1;
				end if;
			else
				SUM <= X"00000000";
				count := 0;
			end if;
		end if;
		temp_data := FIFO_DATA_OUT(15 downto 0) & FIFO_DATA_OUT(31 downto 16);	--Byte Swap
	end process;

	---------------------------------------ChipScope--------------------------------
	ICON : chipscope_icon
	  port map (
		 CONTROL0 => CHIPSCOPE_CONTROL
		);
	
	ILA : chipscope_ila
	  port map (
		 CONTROL => CHIPSCOPE_CONTROL,
		 CLK => PPI_CLK,
		 TRIG0 => (WR_EN & RD_EN & FIFO_FULL & FIFO_EMPTY & PF_0_0 & PF_0_1 & PF_0_2 & PPI1_SYNC1_0 &
						PPI1_SYNC2_0 & PPI1_0 & FIFO_DATA_OUT(15 downto 0) & FIFO_DATA_OUT(31 downto 16) &
						OUTDATA & FIFO_IN_DATA & SUM & (6 downto 0 => '0'))
		);
	-------------------------------------End ChipScope------------------------------


end Behavioral;