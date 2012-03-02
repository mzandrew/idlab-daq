----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Chester Lim
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
library fiber;
use fiber.AURORA_PKG.all;

entity dsp_top is
	generic(
		BOOTMODE				: std_logic_vector(1 downto 0) := "11";	--DSP boot from SPI serial EEPROM
		ASYNC_RDY			: std_logic := '1';
		DSP0_BUS_RDY		: std_logic := '1';
		NON_MASKABLE		: std_logic_vector(1 downto 0) := "00"; --Enable/Disable Core A/B
		BYPASS				: std_logic := '1';
		PACKET_SIZE			: integer := 140; --140 32-bit
		PACKET_QEV			: integer := 1 --132 Packets Per Quarter Event
	);

	port(
		-- Clocks
		BCLK_A				: in std_logic;	--156.25MHz
		DSP_CLK0				: out std_logic;	--40MHz
		PPI0_CLK_0			: out std_logic;	--20MHz
		PPI1_CLK_0			: out std_logic;	--20MHz
		MGTCLK0_P			: out std_logic;
		MGTCLK0_N			: out std_logic;
		MGTCLK1_P			: out std_logic;
		MGTCLK1_N			: out std_logic;
		GTPD0_P				: in  std_logic;
		GTPD0_N				: in  std_logic;

		--RIO
		RXP               : in std_logic;
		RXN               : in std_logic;
		TXP               : out std_logic;
		TXN               : out std_logic;
		FIBER_TRANSCEIVER_0_DISABLE_MODULE		: out std_logic;
		FIBER_TRANSCEIVER_1_DISABLE_MODULE		: out std_logic;
		FIBER_TRANSCEIVER_1_LASER_FAULT_DETECTED_IN_TRANSMITTER : in std_logic;
		FIBER_TRANSCEIVER_1_LOSS_OF_SIGNAL_DETECTED_BY_RECEIVER : in std_logic;

		--PPI
		PPI0_SYNC1_0		: out std_logic;
		PPI1_SYNC1_0		: in std_logic;
		PPI1_SYNC2_0		: in std_logic;
		PF_0_0				: in std_logic;	--DMA TX on from DSP
		PF_0_1				: in std_logic;	--DSP ready for RX
		PF_0_2				: in std_logic;	--Global reset from DSP
		PPI0_0				: out std_logic_vector(15 downto 0); --Data bus from PPI0
		PPI1_0				: in std_logic_vector(15 downto 0); --Data bus from PPI1
		
		--DSP JTAG
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
		DSP_RST0				: out std_logic;
		
		--Power-Up Config
		DSP0_BMODE			: out std_logic_vector(1 downto 0);
		ARDY0					: out std_logic;
		BR0					: out std_logic;
		NMI0					: out std_logic_vector(1 downto 0);
		BYPASS_0				: out std_logic;
		
		--General I/O
		LEDS					: out std_logic_vector(3 downto 0);
		MON_A0				: out std_logic
		
	);

end dsp_top;

architecture Behavioral of dsp_top is

    component IBUFDS
    port (
                O : out std_ulogic;
                I : in std_ulogic;
                IB : in std_ulogic);
    end component;

    component IBUFGDS
    port (
                O  :  out STD_ULOGIC;
                I  : in STD_ULOGIC;
                IB : in STD_ULOGIC);
    end component;

    component OBUFDS
    port (
                I  : in  STD_ULOGIC;
                O  : out STD_ULOGIC;
                OB : out STD_ULOGIC);
    end component;

    component BUFIO2 
    generic(
      DIVIDE_BYPASS : boolean := TRUE;  -- TRUE, FALSE
      DIVIDE        : integer := 1;     -- {1..8}
      I_INVERT      : boolean := FALSE; -- TRUE, FALSE
      USE_DOUBLER   : boolean := FALSE  -- TRUE, FALSE
      );
    port(
      DIVCLK       : out std_ulogic;
      IOCLK        : out std_ulogic;
      SERDESSTROBE : out std_ulogic;
      I            : in  std_ulogic
    );
    end component;
	 
    component IBUFG
        port (
                O : out std_ulogic;
                I : in  std_ulogic
             );
    
    end component;

	component pll_DSP
		port
		 (-- Clock in ports
		  CLK_IN1           : in     std_logic;
		  -- Clock out ports
		  PPI_CLK0          : out    std_logic;
		  PPI_CLK1          : out    std_logic;
		  DSP_CLK          : out    std_logic;
		  -- Status and control signals
		  LOCKED            : out    std_logic
		 );
	end component;


	COMPONENT aurora_fifo_132
	  PORT (
		 rst : IN STD_LOGIC;
		 wr_clk : IN STD_LOGIC;
		 rd_clk : IN STD_LOGIC;
		 din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 wr_en : IN STD_LOGIC;
		 rd_en : IN STD_LOGIC;
		 prog_full_thresh : IN STD_LOGIC_VECTOR(14 DOWNTO 0);		 
		 dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 full : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC;
		 prog_full : OUT STD_LOGIC
	  );
	END COMPONENT;

	COMPONENT rx_fifo_132
	  PORT (
		 rst : IN STD_LOGIC;
		 wr_clk : IN STD_LOGIC;
		 rd_clk : IN STD_LOGIC;
		 din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 wr_en : IN STD_LOGIC;
		 rd_en : IN STD_LOGIC;
		 prog_full_thresh : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
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
		 TRIG0 : IN STD_LOGIC_VECTOR(118 DOWNTO 0));

	end component;
	-------------------------------------End ChipScope------------------------------
	constant QEV_SIZE		: integer := PACKET_SIZE * PACKET_QEV;
	constant DSP_FIFO		: integer := QEV_SIZE * 2 * 3200 / 3696;

	signal INTERNAL_BCLK_A	: std_logic;
	signal INTERNAL_COUNTER	: std_logic_vector(31 downto 0);
	signal INIT_CLK			: std_logic;
	signal PPI_CLK0			: std_logic;	--20MHz
	signal PPI_CLK1			: std_logic;	--20MHz
	signal DSP_CLK				: std_logic;	--40MHz
	signal GTPD0_LEFT_i     : std_logic;
	signal GTPCLKOUT_i      : std_logic;
   signal BUF_GTPCLKOUT_i  : std_logic;
	signal USER_CLK_i			: std_logic;
	signal SYNC_CLK_i			: std_logic;
	
	signal LOCKED				: std_logic;
	signal TX_LOCK_i			: std_logic;
	signal PLL_NOT_LOCKED_i	: std_logic;
		
	signal SYSTEM_RESET		: std_logic;
	signal DSP_RESET			: std_logic := '0';
	signal PWR_INIT			: std_logic := '1';
	signal RESET				: std_logic := '1';
	signal GT_RESET_IN		: std_logic := '1';
	signal GT_RESET			: std_logic;
	signal AUR_RESET			: std_logic;
	
	type FIFO_RD_STATE_TYPE is(
			stage0,
			stage1,
			stage2,
			stage3
		);
	signal FIFO_RD_STATE		: FIFO_RD_STATE_TYPE := stage0;
		
	type FIFO_WE_STATE_TYPE is(
			start_we_state,
			wait_we_state,
			stop_we_state,
			reset_we_state
		);
	signal FIFO_WE_STATE		: FIFO_WE_STATE_TYPE := start_we_state;
	signal FIFO_IN_DATA		: std_logic_vector(15 downto 0);		--RX Input Data
	signal FIFO_DATA_OUT		: std_logic_vector(31 downto 0);		--RX Output Data
	signal temp_data			: std_logic_vector(31 downto 0);
	signal FIFO_FULL			: std_logic := '0';
	signal FIFO_EMPTY			: std_logic := '0';
	signal WR_EN				: std_logic := '0';
	signal WR_EN_r				: std_logic := '0';
	signal RD_EN				: std_logic := '0';

	signal AUR_FIFO_RE		: std_logic;								--Aurora FIFO RD_EN
	signal AUR_FIFO_EMPTY	: std_logic;
	signal AUR_FIFO_FULL		: std_logic;
	signal AUR_TX_DATA		: std_logic_vector(31 downto 0);
	signal AUR_TX_WE			: std_logic;						--Aurora FIFO WR_EN
	signal AUR_TX_VAL			: std_logic;
	signal AUR_RX_DATA		: std_logic_vector(31 downto 0);
	signal AUR_RX_DATA_r		: std_logic_vector(31 downto 0);
	signal AUR_RX_DATA_rr	: std_logic_vector(31 downto 0);
	signal OUTDATA				: std_logic_vector(15 downto 0);
	signal AUR_RX_RE			: std_logic;								--RX RD_EN
	signal AUR_RX_RE_r		: std_logic;
	signal AUR_RX_RE_rr		: std_logic;
	signal HARD_ERR			: std_logic;
	signal SOFT_ERR			: std_logic;
	signal CHANNEL_UP			: std_logic;
	signal LANE_UP				: std_logic;
	signal WARN_CC				: std_logic;
	signal DO_CC				: std_logic;
	
	type CHK_SUM_STATE_TYPE is(
			start_state,
			run_state,
			val_state,
			check_state
		);
	signal CHK_SUM_STATE			: CHK_SUM_STATE_TYPE := start_state;
	signal SUM						: std_logic_vector(31 downto 0) := x"00000000";		--Temporary sum of packet
	signal CHK_SUM					: std_logic_vector(31 downto 0) := x"00000000";		--Calculated check sum value of packet
	signal VAL_SUM 				: std_logic_vector(31 downto 0) := x"10000000";		--Check sum value from packet
	signal VAL_CNT					: std_logic_vector(31 downto 0) := x"00000000";		--Number of valid packets
	signal TOT_PACK				: std_logic_vector(31 downto 0) := x"00000000";		--Total # of packets received
	signal TRIGGER					: std_logic := '1';
	
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
	
	--Fiber
	LEDS(0) <= CHANNEL_UP;
	LEDS(1) <= HARD_ERR or SOFT_ERR;
	LEDS(2) <= INTERNAL_COUNTER(27);
	LEDS(3) <= FIBER_TRANSCEIVER_1_LASER_FAULT_DETECTED_IN_TRANSMITTER or FIBER_TRANSCEIVER_1_LOSS_OF_SIGNAL_DETECTED_BY_RECEIVER;
	FIBER_TRANSCEIVER_0_DISABLE_MODULE <= '1';
	FIBER_TRANSCEIVER_1_DISABLE_MODULE <= AUR_RESET;
	
	--Clock Generation
	IBUFG_i :  IBUFG port map (I  => BCLK_A, O  => INTERNAL_BCLK_A);
	OBUFDS_0i :  OBUFDS port map (I  => INTERNAL_BCLK_A, O => MGTCLK0_P, OB  => MGTCLK0_N);
	OBUFDS_1i :  OBUFDS port map (I  => INTERNAL_BCLK_A, O => MGTCLK1_P, OB  => MGTCLK1_N);
   IBUFDS_i :  IBUFDS port map (I  => GTPD0_P, IB => GTPD0_N, O  => GTPD0_LEFT_i);

    BUFIO2_i : BUFIO2 generic map (
        DIVIDE                          =>      1,
        DIVIDE_BYPASS                   =>      TRUE
    ) port map (
        I                               =>      GTPCLKOUT_i,
        DIVCLK                          =>      BUF_GTPCLKOUT_i,
        IOCLK                           =>      open,
        SERDESSTROBE                    =>      open
    );

	clock_module_i: entity fiber.Aurora_IP_Core_A_CLOCK_MODULE
		port map(
		  GT_CLK              => BUF_GTPCLKOUT_i,
		  GT_CLK_LOCKED       => TX_LOCK_i,
		  USER_CLK            => USER_CLK_i,
		  SYNC_CLK            => SYNC_CLK_i,
		  PLL_NOT_LOCKED      => PLL_NOT_LOCKED_i
	  );

	process(INTERNAL_BCLK_A) begin
	if rising_edge(INTERNAL_BCLK_A) then
		INTERNAL_COUNTER <= std_logic_vector(unsigned(INTERNAL_COUNTER) + 1);
	end if;
	end process;
	process(INTERNAL_COUNTER(27)) begin
	if rising_edge(INTERNAL_COUNTER(27)) then
		RESET <= '0';
		GT_RESET_IN <= '0';
	end if;
	end process;
	INIT_CLK <= INTERNAL_COUNTER(2);

	dsp_clk_c : pll_DSP
	  port map
		(-- Clock in ports
		 CLK_IN1 => INTERNAL_BCLK_A,
		 -- Clock out ports
		 PPI_CLK0 => PPI_CLK0,
		 PPI_CLK1 => PPI_CLK1,
		 DSP_CLK => DSP_CLK,
		 -- Status and control signals
		 LOCKED => LOCKED);

	PPI0_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => PPI0_CLK_0, -- 1-bit output data
			C0 => PPI_CLK0, -- 1-bit clock input
			C1 => not PPI_CLK0, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);

	PPI1_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => PPI1_CLK_0, -- 1-bit output data
			C0 => PPI_CLK1, -- 1-bit clock input
			C1 => not PPI_CLK1, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);
	
	DSP0_CLK : ODDR2
		generic map(
			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
		port map (
			Q => DSP_CLK0, -- 1-bit output data
			C0 => DSP_CLK, -- 1-bit clock input
			C1 => not DSP_CLK, -- 1-bit clock input
			CE => '1', -- 1-bit clock enable input
			D0 => '1', -- 1-bit data input (associated with C0)
			D1 => '0', -- 1-bit data input (associated with C1)
			R => '0', -- 1-bit reset input
			S => '0' -- 1-bit set input
	);

	--Reset Logic; includes DSP power-up reset
	process(DSP_CLK)
		variable i	: integer range 0 to 3500 := 3500;
	begin
		if rising_edge(DSP_CLK) then
			if LOCKED = '0' or PWR_INIT = '1' then
--			if PWR_INIT = '1' then
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
	
	reset_logic_i : entity fiber.Aurora_IP_Core_A_RESET_LOGIC
		port map (
			RESET            => RESET,
			USER_CLK         => USER_CLK_i,
			INIT_CLK         => INIT_CLK,
			GT_RESET_IN      => GT_RESET_IN,
			TX_LOCK_IN       => TX_LOCK_i,
			PLL_NOT_LOCKED   => PLL_NOT_LOCKED_i,

			SYSTEM_RESET     => SYSTEM_RESET,
			GT_RESET_OUT     => GT_RESET
		);

	--RX AURORA
	aurora_module_i : entity fiber.Aurora_IP_Core_A
		generic map(
			SIM_GTPRESET_SPEEDUP => 1
		)
		port map   (
			-- LocalLink TX Interface
			TX_D					=> AUR_TX_DATA,
			TX_SRC_RDY_N		=> AUR_TX_WE,
			TX_DST_RDY_N		=> AUR_TX_VAL,
			-- LocalLink RX Interface
			RX_D					=> AUR_RX_DATA,
			RX_SRC_RDY_N		=> AUR_RX_RE,
			-- V5 Serial I/O
			RXP					=> RXP,
			RXN					=> RXN,
			TXP					=> TXP,
			TXN					=> TXN,
			-- V5 Reference Clock Interface
			GTPD2					=> GTPD0_LEFT_i,
			-- Error Detection Interface
			HARD_ERR				=> HARD_ERR,
			SOFT_ERR				=> SOFT_ERR,
			-- Status
			CHANNEL_UP			=> CHANNEL_UP,
			LANE_UP				=> LANE_UP,
			-- Clock Compensation Control Interface
			WARN_CC				=> WARN_CC,
			DO_CC					=> DO_CC,
			-- System Interface
			USER_CLK				=> USER_CLK_i,
			SYNC_CLK				=> SYNC_CLK_i,
			RESET					=> AUR_RESET,
			POWER_DOWN			=> '0',
			LOOPBACK				=> "000",
			GT_RESET				=> GT_RESET,
			GTPCLKOUT			=> GTPCLKOUT_i,
			TX_LOCK				=> TX_LOCK_i
		);

	standard_cc_module_i : entity fiber.Aurora_IP_Core_A_STANDARD_CC_MODULE
		port map (
			-- Clock Compensation Control Interface
			WARN_CC        => WARN_CC,
			DO_CC          => DO_CC,
			-- System Interface
			PLL_NOT_LOCKED => PLL_NOT_LOCKED_i,
			USER_CLK       => USER_CLK_i,
			RESET          => not(LANE_UP)
		);

	--AURORA RX FIFO
	process(USER_CLK_i)
	begin
		if rising_edge(USER_CLK_i) then
			AUR_RX_DATA_rr <= AUR_RX_DATA_r;
			AUR_RX_DATA_r <= AUR_RX_DATA;
			AUR_RX_RE_rr <= AUR_RX_RE_r;
			AUR_RX_RE_r <= AUR_RX_RE;
		end if;
	end process;

	aurora_rx_fifo : aurora_fifo_132
	  PORT MAP (
		 rst => PF_0_2,
		 wr_clk => USER_CLK_i,
		 rd_clk => PPI_CLK0,
		 din => AUR_RX_DATA_rr(15 downto 0) & AUR_RX_DATA_rr(31 downto 16),	--Byte Swap
		 wr_en => (not AUR_RX_RE_rr and LANE_UP),
		 rd_en => AUR_FIFO_RE,
		 prog_full_thresh => ("000" & x"08B"),--std_logic_vector(to_unsigned(QEV_SIZE,15)),
		 dout => OUTDATA,
		 full => open,
		 empty => AUR_FIFO_EMPTY,
		 prog_full => AUR_FIFO_FULL
	  );
	  
	--Aurora FIFO RD_EN Logic	
--	process(PPI_CLK0)
--		variable wait0	: std_logic := '0';
--	begin
--		if rising_edge(PPI_CLK0) then
--			if AUR_FIFO_EMPTY = '1' then
--				AUR_FIFO_RE <= '0';
--			elsif AUR_FIFO_FULL = '1' then
--				AUR_FIFO_RE <= '1';
--			else
--				AUR_FIFO_RE <= AUR_FIFO_RE;
--			end if;
--			PPI0_0 <= OUTDATA;
--			PPI0_SYNC1_0 <= wait0;
--			wait0 := AUR_FIFO_RE and PF_0_1;
--		end if;
--	end process;
	process(PPI_CLK0)
		variable sync		: std_logic := '0';
		variable wait0		: std_logic	:= '0';
		variable wait1		: std_logic := '0';
		variable wait2		: std_logic	:= '0';
		variable count		: integer range 0 to 2*PACKET_SIZE := 0;
	begin
		if rising_edge(PPI_CLK0) then
--			if PF_0_1 = '1' then
				case FIFO_RD_STATE is
					when stage0 =>
						if PF_0_1 = '1' and AUR_FIFO_FULL = '1' then
							FIFO_RD_STATE <= stage1;
						else
							FIFO_RD_STATE <= stage0;
						end if;
						AUR_FIFO_RE <= '0';
						sync := '0';
					when stage1 =>
						if count < 2*PACKET_SIZE then
							FIFO_RD_STATE <= stage2;
							AUR_FIFO_RE <= '1';
							sync := '1';
							count := count + 1;
						else
							FIFO_RD_STATE <= stage0;
							AUR_FIFO_RE <= '0';
							sync := '0';
							count := 0;
						end if;
					when stage2 =>
						FIFO_RD_STATE <= stage1;
						AUR_FIFO_RE <= '0';
						sync := '0';
					when others => FIFO_RD_STATE <= stage0;
				end case;
--			else
--				FIFO_RD_STATE <= stage0;
--				AUR_FIFO_RE <= '0';
--				sync := '0';
--				count := 0;
--			end if;
			PPI0_0 <= OUTDATA;
			PPI0_SYNC1_0 <= wait2;
			wait2 := wait1;
			wait1 := wait0;
			wait0 := sync;
		end if;
	end process;


	--DSP Loopback FIFO
	dsp_loopback_fifo : rx_fifo_132
	  PORT MAP (
		 rst => PF_0_2,
		 wr_clk => PPI_CLK1,
		 rd_clk => USER_CLK_i,
		 din => FIFO_IN_DATA,
		 wr_en => WR_EN,
		 rd_en => RD_EN,
		 prog_full_thresh => ('0' & x"02"),--std_logic_vector(to_unsigned(DSP_FIFO,15)),
		 dout => FIFO_DATA_OUT,
		 full => open,--FIFO_FULL,
		 empty => FIFO_EMPTY,
		 prog_full => FIFO_FULL
	  );	
	
	--WR_EN Logic
	process(PPI_CLK1)
	begin
		if rising_edge(PPI_CLK1) then
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
	process(USER_CLK_i)
	begin
		if rising_edge(USER_CLK_i) then
			if FIFO_EMPTY = '1' then
				RD_EN <= '0';
			elsif FIFO_FULL = '1' then
				RD_EN <= '1';
			else
				RD_EN <= RD_EN;
			end if;
		end if;
	end process;
	
	--Check Sum
	process(USER_CLK_i)
		variable toggle	: std_logic := '0';
		variable RD_EN_d	: std_logic := '0';
		variable RD_EN_dd	: std_logic := '0';
	begin
		if rising_edge(USER_CLK_i) then
			if RD_EN_d = '1' then
				if toggle = '0' then
					case CHK_SUM_STATE is
						when start_state =>									--Look for header word BE11E2 to start check sum
							if temp_data = x"00BE11E2" then
								SUM <= std_logic_vector(unsigned(SUM) + unsigned(temp_data));
								CHK_SUM_STATE <= run_state;
							else
								SUM <= x"00000000";
								CHK_SUM_STATE <= start_state;
							end if;
							CHK_SUM <= x"00000000";
							VAL_SUM <= x"10000000";
						when run_state =>										--Accumulate sum until sync word 000A0004
							if temp_data = x"000A0004" then
								CHK_SUM_STATE <= val_state;
							else
								CHK_SUM_STATE <= run_state;
							end if;
							SUM <= std_logic_vector(unsigned(SUM) + unsigned(temp_data));
						when val_state =>										--Obtain check sum embedded in packet
							VAL_SUM <= temp_data;
							CHK_SUM_STATE <= check_state;
							TOT_PACK <= std_logic_vector(unsigned(TOT_PACK) + 1);
						when check_state =>									--Compare accumulated with embedded check sum
							if temp_data = x"62504944" then
								CHK_SUM <= std_logic_vector(unsigned(SUM) + unsigned(temp_data));
								SUM <= x"00000000";
								CHK_SUM_STATE <= start_state;
							else
								SUM <= std_logic_vector(unsigned(SUM) + unsigned(temp_data));
								CHK_SUM_STATE <= check_state;
							end if;
						when others =>
							CHK_SUM_STATE <= start_state;
					end case;
					toggle := '1';
				else
					toggle := '0';
				end if; --toggle = '0'
			else
--				SUM <= x"00000000";
--				CHK_SUM <= x"00000000";
--				VAL_SUM <= x"10000000";
--				VAL_CNT <= x"00";
--				CHK_SUM_STATE <= start_state;
			end if;	--RD_EN = '1'
			
			if std_logic_vector(unsigned(SUM) + unsigned(temp_data)) = VAL_SUM then
				VAL_CNT <= std_logic_vector(unsigned(VAL_CNT) + 1);
				TRIGGER <= '1';
			else
				TRIGGER <= '0';
			end if;

			RD_EN_d := RD_EN;

		end if;	--rising_edge(PPI_CLK1)
		temp_data <= FIFO_DATA_OUT(15 downto 0) & FIFO_DATA_OUT(31 downto 16);	--Byte Swap
	end process;
						

	---------------------------------------ChipScope--------------------------------
	ICON : chipscope_icon
	  port map (
		 CONTROL0 => CHIPSCOPE_CONTROL
		);
	
	ILA : chipscope_ila
	  port map (
		 CONTROL => CHIPSCOPE_CONTROL,
		 CLK => USER_CLK_i,
--		 TRIG0 => (AUR_RX_RE_rr & AUR_FIFO_RE & AUR_FIFO_FULL & AUR_FIFO_EMPTY & PF_0_1 & AUR_RX_DATA_rr
--						& OUTDATA) --53 bits
		 TRIG0 => (PPI1_SYNC2_0 & WR_EN & RD_EN & FIFO_FULL & FIFO_EMPTY & PF_0_0 & TRIGGER & FIFO_IN_DATA 
						& FIFO_DATA_OUT(15 downto 0) & FIFO_DATA_OUT(31 downto 16) & SUM & CHK_SUM) --119 bits
--		 TRIG0 => (WR_EN & RD_EN & FIFO_FULL & FIFO_EMPTY & PF_0_0 & PF_0_1 & TRIGGER & PPI1_SYNC1_0 &
--						PPI1_SYNC2_0 & PPI1_0 & FIFO_DATA_OUT(15 downto 0) & FIFO_DATA_OUT(31 downto 16) &
--						OUTDATA & FIFO_IN_DATA & VAL_CNT & AUR_TX_VAL & AUR_TX_WE & AUR_RX_RE & AUR_FIFO_RE & 
--						AUR_FIFO_FULL & AUR_FIFO_EMPTY & AUR_RX_DATA & CHK_SUM & TOT_PACK & SUM(7 downto 0)) --231 bits
		);
	-------------------------------------End ChipScope------------------------------


end Behavioral;