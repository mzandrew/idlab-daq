--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--								University of Hawaii at Manoa						         --
--						Instrumentation Development Lab / GARY S. VARNER				--
--   								Watanabe Hall Room 214								      --
--  								  2505 Correa Road										   --
--  								 Honolulu, HI 96822											--
--  								Lab: (808) 956-2920											--
--	 								Fax: (808) 956-2930										   --
--  						E-mail: idlab@phys.hawaii.edu									   --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------	
-- Design by: Larry L. Ruckman Jr.															--
-- DATE : 23 JUNE 2009																			--
-- Project name: DSP_FIN firmware															--
--	Module name: RAM_24bit		  																--
--	Description : 																					--
-- 	RAM_24bit firmware block																--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TEST_BLOCK is
	port ( 
		---------------
		-- User I/O  --
		---------------
		-- TX related
		xSTART_TX_XFER	: out std_logic_vector(3 downto 0);		
		xDONE_TX_XFER	: in  std_logic_vector(3 downto 0);		
		xTX_DATA0		: out  std_logic_vector(23 downto 0);	
		xTX_DATA1		: out  std_logic_vector(23 downto 0);	
		xTX_DATA2		: out  std_logic_vector(23 downto 0);	
		xTX_DATA3		: out  std_logic_vector(23 downto 0);	
		xTX_LENGTH0		: out  std_logic_vector(13 downto 0);	
		xTX_LENGTH1		: out  std_logic_vector(13 downto 0);	
		xTX_LENGTH2		: out  std_logic_vector(13 downto 0);	
		xTX_LENGTH3		: out  std_logic_vector(13 downto 0);	
		xTX_ADDR0		: in std_logic_vector(13 downto 0);
		xTX_ADDR1		: in std_logic_vector(13 downto 0);
		xTX_ADDR2		: in std_logic_vector(13 downto 0);
		xTX_ADDR3		: in std_logic_vector(13 downto 0);		
		xTX_XFER_EN		: in std_logic_vector(3 downto 0);	
		xDOWNSTREAM_TRIG	: out std_logic_vector(3 downto 0);
		xDOWNSTREAM_CLR	: out std_logic_vector(3 downto 0);			
		-- RX related
		xCLR_LAM		: out  std_logic_vector(3 downto 0);
		xLAM			: in std_logic_vector(3 downto 0);
		xRX_DATA0	: in std_logic_vector(23 downto 0);
		xRX_DATA1	: in std_logic_vector(23 downto 0);
		xRX_DATA2	: in std_logic_vector(23 downto 0);
		xRX_DATA3	: in std_logic_vector(23 downto 0);		
		xRX_LENGTH0	: in std_logic_vector(13 downto 0);
		xRX_LENGTH1	: in std_logic_vector(13 downto 0);
		xRX_LENGTH2	: in std_logic_vector(13 downto 0);
		xRX_LENGTH3	: in std_logic_vector(13 downto 0);		
		xRX_ADDR0	: in std_logic_vector(13 downto 0);	
		xRX_ADDR1	: in std_logic_vector(13 downto 0);	
		xRX_ADDR2	: in std_logic_vector(13 downto 0);	
		xRX_ADDR3	: in std_logic_vector(13 downto 0);	
		xRX_XFER_EN	: in std_logic_vector(3 downto 0);
		xCLEAR_LAM	: in std_logic;
		xUPSTREAM_TRIG	: in std_logic_vector(3 downto 0);
		xUPSTREAM_CLR	: in std_logic_vector(3 downto 0);
		-- MISC I/O		
		xCLK		: in std_logic);
end TEST_BLOCK;

architecture Behavioral of TEST_BLOCK is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------
	signal CLR_LAM : std_logic_vector(3 downto 0);
	signal TX_DATA0 : std_logic_vector(23 downto 0);
	signal TX_DATA1 : std_logic_vector(23 downto 0);
	signal TX_DATA2 : std_logic_vector(23 downto 0);
	signal TX_DATA3 : std_logic_vector(23 downto 0);
	signal WAIT_CNT0 : std_logic_vector(15 downto 0);
	signal CLR_LATCH : std_logic_vector(3 downto 0);
	signal Latched : std_logic_vector(3 downto 0);
	signal L_CNT0 : std_logic_vector(15 downto 0) := x"0000";
	signal L_CNT1 : std_logic_vector(15 downto 0) := x"0000";
	signal L_CNT2 : std_logic_vector(15 downto 0) := x"0000";
	signal L_CNT3 : std_logic_vector(15 downto 0) := x"0000";
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
	xSTART_TX_XFER <= "0000";
--	xTX_LENGTH0 <= "00" & x"010";
--	xTX_LENGTH1 <= "00" & x"010";
--	xTX_LENGTH2 <= "00" & x"010";
--	xTX_LENGTH3 <= "00" & x"010";

	xTX_LENGTH0 <= "01" & x"001";
	xTX_LENGTH1 <= "01" & x"001";
	xTX_LENGTH2 <= "01" & x"001";
	xTX_LENGTH3 <= "01" & x"001";
	
--	xTX_LENGTH0 <= (others=>'1');
--	xTX_LENGTH1 <= (others=>'1');
--	xTX_LENGTH2 <= (others=>'1');
--	xTX_LENGTH3 <= (others=>'1');
	
	xDOWNSTREAM_TRIG <= "0000";
	xDOWNSTREAM_CLR <= "0000";
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if xDONE_TX_XFER(0) = '1' then
			TX_DATA0 <= (others=>'0');
		elsif rising_edge(xCLK) and xTX_XFER_EN(0) = '1' then
			TX_DATA0 <= x"00" & "00" & xTX_ADDR0;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if xDONE_TX_XFER(1) = '1' then
			TX_DATA1 <= (others=>'0');
		elsif rising_edge(xCLK) and xTX_XFER_EN(1) = '1' then
			TX_DATA1 <= x"00" & "00" & xTX_ADDR1;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if xDONE_TX_XFER(2) = '1' then
			TX_DATA2 <= (others=>'0');
		elsif rising_edge(xCLK) and xTX_XFER_EN(2) = '1' then
			TX_DATA2 <= x"00" & "00" & xTX_ADDR2;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if xDONE_TX_XFER(3) = '1' then
			TX_DATA3 <= (others=>'0');
		elsif rising_edge(xCLK) and xTX_XFER_EN(3) = '1' then
			TX_DATA3 <= x"00" & "00" & xTX_ADDR3;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if CLR_LATCH(0) = '1' then
			Latched(0) <= '0';
		elsif rising_edge(xCLK)  then
			if xLAM(0) = '1' then
				Latched(0) <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if CLR_LATCH(1) = '1' then
			Latched(1) <= '0';
		elsif rising_edge(xCLK)  then
			if xLAM(1) = '1' then
				Latched(1) <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if CLR_LATCH(2) = '1' then
			Latched(2) <= '0';
		elsif rising_edge(xCLK)  then
			if xLAM(2) = '1' then
				Latched(2) <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if CLR_LATCH(3) = '1' then
			Latched(3) <= '0';
		elsif rising_edge(xCLK)  then
			if xLAM(3) = '1' then
				Latched(3) <= '1';
			end if;
		end if;
	end process;
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if rising_edge(xCLK)  then
			CLR_LATCH(0) <= '0';
			if Latched(0) = '1' then
				L_CNT0 <= L_CNT0 + 1;
				if L_CNT0 = 200 then	
					L_CNT0 <= x"0000";
					CLR_LATCH(0) <= '1';
				end if;
			end if;
		end if;
	end process;	
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if rising_edge(xCLK)  then
			CLR_LATCH(1) <= '0';
			if Latched(1) = '1' then
				L_CNT1 <= L_CNT1 + 1;
				if L_CNT1 = 200 then	
					L_CNT1 <= x"0000";
					CLR_LATCH(1) <= '1';
				end if;
			end if;
		end if;
	end process;	
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if rising_edge(xCLK)  then
			CLR_LATCH(2) <= '0';
			if Latched(2) = '1' then
				L_CNT2 <= L_CNT2 + 1;
				if L_CNT2 = 200 then	
					L_CNT2 <= x"0000";
					CLR_LATCH(2) <= '1';
				end if;
			end if;
		end if;
	end process;	
--------------------------------------------------------------------------------
	process(xCLK)
	begin
		if rising_edge(xCLK)  then
			CLR_LATCH(3) <= '0';
			if Latched(3) = '1' then
				L_CNT3 <= L_CNT3 + 1;
				if L_CNT3 = 200 then	
					L_CNT3 <= x"0000";
					CLR_LATCH(3) <= '1';
				end if;
			end if;
		end if;
	end process;	
--------------------------------------------------------------------------------
	xCLR_LAM <= CLR_LATCH(3 downto 1) & xCLEAR_LAM;
	xTX_DATA0 <= TX_DATA0;
	xTX_DATA1 <= TX_DATA1;
	xTX_DATA2 <= TX_DATA2;
	xTX_DATA3 <= TX_DATA3;
--------------------------------------------------------------------------------
end Behavioral;