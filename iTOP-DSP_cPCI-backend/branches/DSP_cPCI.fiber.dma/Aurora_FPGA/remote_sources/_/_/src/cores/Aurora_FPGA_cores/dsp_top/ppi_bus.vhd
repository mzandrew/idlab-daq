----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Chester Lim
-- 
-- Create Date:    08:17:38 12/12/2011 
-- Design Name: 
-- Module Name:    ppi_bus- Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: Top level of PPI bus
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

entity ppi_bus is
	port(
		CLK					: in std_logic;									--Input Clock
		PPI_CLK0				: in std_logic;									--PPI0 Clock to pin
		PPI_CLK1				: in std_logic;									--PPI1 Clock
		DSP_RX_RDY			: in std_logic;									--PF[1]
		DSP_RX_VAL			: out std_logic;									--PPI0_FSYNC1
		PPI0_BUS				: out std_logic_vector(15 downto 0);		--PPI0 Bus
		DSP_RESET_FIFO		: in std_logic;									--PF[2] = new transaction, clear buffers
		FIFO_RD_EN			: out std_logic;									--Read from FIFO pool
		FIFO_FULL			: in std_logic;									--FIFO pool full
		FIFO_EMPTY			: in std_logic;									--FIFO pool empty
		FIFO_IN_DATA		: in std_logic_vector(15 downto 0);			--FIFO pool data
		FIFO_RESET			: out std_logic;									--FIFO reset from DSP
		
		DSP_TX_RDY			: in std_logic;									--PF[0]
		DSP_TX_VAL			: in std_logic;									--PPI1_FSYNC2
		cPCI_RDY				: in std_logic;									--cPCI FPGA ready to receive data
		cPCI_RX_RDY			: out std_logic;									--PF[4]
		PPI1_BUS				: in std_logic_vector(15 downto 0);			--PPI1 Bus
		cPCI_WR_EN			: out std_logic;									--WR_EN for cPCI FIFO
		cPCI_DATA			: out std_logic_vector(15 downto 0);		--Data for cPCI
		
		CONTROL				: inout std_logic_vector(35 downto 0)
	);

end ppi_bus;

architecture Behavioral of ppi_bus is

	---------------------------------------ChipScope--------------------------------
	component chipscope_ila
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 TRIG0 : IN STD_LOGIC_VECTOR(21 DOWNTO 0));
	end component;

	signal TRIG_0				: std_logic_vector(21 downto 0);
	-------------------------------------End ChipScope------------------------------	

	signal RD_EN				: std_logic := '0';
	signal RX_VAL				: std_logic := '0';
	
begin

	FIFO_RESET <= DSP_RESET_FIFO;

	--PPI0 Logic
	process(PPI_CLK0)
		variable wait0	: std_logic := '0';
	begin
		if rising_edge(PPI_CLK0) then
			if DSP_RX_RDY = '1' then
				if FIFO_FULL = '1' then
					RD_EN <= '1';--RD_EN <= '1';
				elsif FIFO_EMPTY = '1' then
					RD_EN <= '0';
				else
					RD_EN <= RD_EN;
				end if;
			else
				RD_EN <= '0';
			end if;
			PPI0_BUS <= FIFO_IN_DATA;
			DSP_RX_VAL <= RX_VAL;
			RX_VAL <= wait0;
			wait0 := RD_EN and DSP_RX_RDY;
		end if;
	end process;
	FIFO_RD_EN <= RD_EN;
	
	
	--PPI1 Logic
	process(PPI_CLK1)
		variable PPI1_BUS_r		: std_logic_vector(15 downto 0);
		variable DSP_TX_VAL_r	: std_logic;
		variable DSP_TX_VAL_rr	: std_logic;
		variable cPCI_RDY_r		: std_logic;
		variable DSP_TX_RDY_r	: std_logic;
	begin
		if rising_edge(PPI_CLK1) then
			if cPCI_RDY_r = '1' and DSP_TX_RDY_r = '1' then
				cPCI_WR_EN <= DSP_TX_VAL_rr;
				cPCI_DATA <= PPI1_BUS_r;
			else
				cPCI_WR_EN <= '0';
				cPCI_DATA <= X"C0DE";
			end if;
			PPI1_BUS_r := PPI1_BUS;
			DSP_TX_VAL_rr := DSP_TX_VAL_r;
			DSP_TX_VAL_r := DSP_TX_VAL;
			cPCI_RDY_r := cPCI_RDY;
			DSP_TX_RDY_r := DSP_TX_RDY;
		end if;
	end process;
	cPCI_RX_RDY <= cPCI_RDY;
	
	---------------------------------------ChipScope--------------------------------
	ILA : chipscope_ila
	  port map (
		 CONTROL => CONTROL,
		 CLK => CLK,
		 TRIG0 => TRIG_0
		);
	 TRIG_0 <= (DSP_RX_RDY & RX_VAL & FIFO_FULL & FIFO_EMPTY & RD_EN & cPCI_RDY & DSP_TX_RDY & DSP_TX_VAL & (13 downto 0 => '0'));
	-------------------------------------End ChipScope------------------------------

end Behavioral;