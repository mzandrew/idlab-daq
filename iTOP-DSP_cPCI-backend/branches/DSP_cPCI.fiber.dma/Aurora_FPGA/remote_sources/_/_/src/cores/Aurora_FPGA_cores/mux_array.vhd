----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Chester Lim
-- 
-- Create Date:    08:17:38 12/12/2011 
-- Design Name: 
-- Module Name:    mux_array- Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: Logic to design which signals to look at based on 
-- 				   which DSP chip is selected
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

entity mux_array is
	port(
		SEL				: in std_logic;

		CH1_fifo_empty_1	: in std_logic;
		CH2_fifo_empty_1	: in std_logic;
		CH1_fifo_empty_2	: in std_logic;
		CH2_fifo_empty_2	: in std_logic;
		CH1_fifo_rd_1		: in std_logic;
		CH2_fifo_rd_1		: in std_logic;
		CH1_fifo_rd_2		: in std_logic;
		CH2_fifo_rd_2		: in std_logic;
		CH1_fifo_dat_1		: in std_logic_vector(31 downto 0);
		CH2_fifo_dat_1		: in std_logic_vector(31 downto 0);
		CH1_fifo_dat_2		: in std_logic_vector(31 downto 0);
		CH2_fifo_dat_2		: in std_logic_vector(31 downto 0);

		fifo_empty_1		: out std_logic;
		fifo_empty_2		: out std_logic;
		fifo_rd_1			: out std_logic;
		fifo_rd_2			: out std_logic;
		fifo_dat_1			: out std_logic_vector(31 downto 0);
		fifo_dat_2			: out std_logic_vector(31 downto 0)
	);

end mux_array;

architecture Behavioral of mux_array is
begin

	fifo_empty_1 <= CH1_fifo_empty_1 when SEL = '0' else CH2_fifo_empty_1;
	fifo_empty_2 <= CH1_fifo_empty_2 when SEL = '0' else CH2_fifo_empty_2;
	fifo_rd_1 <= CH1_fifo_rd_1 when SEL = '0' else CH2_fifo_rd_1;
	fifo_rd_2 <= CH1_fifo_rd_2 when SEL = '0' else CH2_fifo_rd_2;
	fifo_dat_1 <= CH1_fifo_dat_1 when SEL = '0' else CH2_fifo_dat_1;
	fifo_dat_2 <= CH1_fifo_dat_2 when SEL = '0' else CH2_fifo_dat_2;

end Behavioral;