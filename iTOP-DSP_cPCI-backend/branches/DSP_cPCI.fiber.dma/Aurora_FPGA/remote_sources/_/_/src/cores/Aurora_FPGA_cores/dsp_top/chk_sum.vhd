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


entity chk_sum is
	port(
		-- Clocks
		CLK					: in std_logic;
		RD_EN					: in std_logic;
		FIFO_DATA_OUT		: in std_logic_vector(31 downto 0);
		
		CONTROL				: inout std_logic_vector(35 downto 0)
	);

end chk_sum;

architecture Behavioral of chk_sum is

	---------------------------------------ChipScope--------------------------------
	component chipscope_ila
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 TRIG0 : IN STD_LOGIC_VECTOR(193 DOWNTO 0));
	end component;

	signal TRIG_0				: std_logic_vector(193 downto 0);
	-------------------------------------End ChipScope------------------------------	

	type CHK_SUM_STATE_TYPE is(
			start_state,
			run_state,
			val_state,
			check_state
		);
	signal CHK_SUM_STATE			: CHK_SUM_STATE_TYPE := start_state;

	signal TRIGGER				: std_logic := '1';
	signal VAL_SUM				: std_logic_vector(31 downto 0) := x"10000000";	--Checksum value from packets
	signal SUM					: std_logic_vector(31 downto 0) := x"00000000";	--Temporary calculated checksum value of packet
	signal CHK_SUM				: std_logic_vector(31 downto 0) := x"00000000";	--Calculated checksum value of packet
	signal TOT_PACK			: std_logic_vector(31 downto 0) := x"00000000";	--Total # of packets received
	signal VAL_CNT				: std_logic_vector(31 downto 0) := x"00000000";	--Number of valid packets received
	signal temp_data			: std_logic_vector(31 downto 0);

begin

	--Check Sum
	process(CLK)
		variable toggle	: integer range 0 to 4 := 0;
		variable RD_EN_d	: std_logic := '0';
		variable RD_EN_dd	: std_logic := '0';
	begin
		if rising_edge(CLK) then
			if RD_EN_d = '1' then
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
	ILA : chipscope_ila
	  port map (
		 CONTROL => CONTROL,
		 CLK => CLK,
		 TRIG0 => TRIG_0
		);
	 TRIG_0 <= (RD_EN & TRIGGER &	SUM & VAL_SUM & CHK_SUM & TOT_PACK & VAL_CNT &
					FIFO_DATA_OUT(15 downto 0) & FIFO_DATA_OUT(31 downto 16));	--194 bits
	-------------------------------------End ChipScope------------------------------
	
end Behavioral;