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
-- DATE : 23 AUG 2009																			--
-- Project name: ICRR firmware																--
--	Module name: Aurora_TOP				  														--
--	Description : 																					--
-- 	Aurora Top Level																			--
--		  											    												--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.all;
-- synthesis translate_on

entity Aurora_user_clk is
	port(
		xUSER_CLK	: in std_logic;
      xCLK			: out std_logic);
end Aurora_user_clk;

architecture MAPPED of Aurora_user_clk is
--------------------------------------------------------------------------------
--   								signals		     		   						         --
--------------------------------------------------------------------------------
-- Wire Declarations --

    signal clk180_i  		: std_logic;
    signal not_connected_i : std_logic_vector(15 downto 0);
    signal clkfb_i         : std_logic;
    signal clk0_i          : std_logic;
    signal tied_to_ground_i : std_logic;

--------------------------------------------------------------------------------
--   								components     		   						         --
--------------------------------------------------------------------------------
	component DCM
	generic(
		CLKDV_DIVIDE            : real       := 2.0;
      CLKFX_DIVIDE            : integer    := 1;
      CLKFX_MULTIPLY          : integer    := 4;
      CLKIN_DIVIDE_BY_2       : boolean    := false;
      CLKIN_PERIOD            : real       := 13.333333;            --non-simulatable
      CLKOUT_PHASE_SHIFT      : string     := "NONE";
      CLK_FEEDBACK            : string     := "1X";
      DESKEW_ADJUST           : string     := "SYSTEM_SYNCHRONOUS"; --non-simulatable
      DFS_FREQUENCY_MODE      : string     := "LOW";
      DLL_FREQUENCY_MODE      : string     := "LOW";
      DSS_MODE                : string     := "NONE";               --non-simulatable
      DUTY_CYCLE_CORRECTION   : boolean    := true;
      FACTORY_JF              : bit_vector := X"C080";              --non-simulatable
      PHASE_SHIFT             : integer    := 0;
      STARTUP_WAIT            : boolean    := true);               --non-simulatable
	port(
		CLK0     : out std_ulogic                   := '0';
      CLK180   : out std_ulogic                   := '0';
      CLK270   : out std_ulogic                   := '0';
      CLK2X    : out std_ulogic                   := '0';
      CLK2X180 : out std_ulogic                   := '0';
      CLK90    : out std_ulogic                   := '0';
      CLKDV    : out std_ulogic                   := '0';
      CLKFX    : out std_ulogic                   := '0';
      CLKFX180 : out std_ulogic                   := '0';
      LOCKED   : out std_ulogic                   := '0';
      PSDONE   : out std_ulogic                   := '0';
      STATUS   : out std_logic_vector(7 downto 0) := "00000000";
      CLKFB    : in std_ulogic                    := '0';
      CLKIN    : in std_ulogic                    := '0';
      DSSEN    : in std_ulogic                    := '0';
      PSCLK    : in std_ulogic                    := '0';
      PSEN     : in std_ulogic                    := '0';
      PSINCDEC : in std_ulogic                    := '0';
      RST      : in std_ulogic                    := '0');
    end component;
--------------------------------------------------------------------------------
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
	xDCM : DCM
	port map(
		CLK0     => clk0_i,
      CLK180   => clk180_i,
      CLK270   => open,
      CLK2X    => open,
      CLK2X180 => open,
      CLK90    => open,
      CLKDV    => open,
      CLKFX    => open,
      CLKFX180 => open,
      LOCKED   => open,
      PSDONE   => open,
      STATUS   => open,
      CLKFB    => clkfb_i,
      CLKIN    => xUSER_CLK,
      DSSEN    => tied_to_ground_i,
      PSCLK    => tied_to_ground_i,
      PSEN     => tied_to_ground_i,
      PSINCDEC => tied_to_ground_i,
      RST      => tied_to_ground_i);
--------------------------------------------------------------------------------
	feedback_clock_net_i : BUFG
	port map(
		I => clk0_i,
      O => clkfb_i);
--------------------------------------------------------------------------------
	xBUFG_CLK : BUFG
	port map(
		I => clk180_i,
      O => xCLK); 
--------------------------------------------------------------------------------
	tied_to_ground_i <= '0';
--------------------------------------------------------------------------------
end MAPPED;