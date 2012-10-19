--
--      Project:  Aurora Module Generator version 3.0
--
--         Date:  $Date: 2008/07/21 10:19:46 $
--          Tag:  $Name: i+IP+144966 $
--         File:  $RCSfile: clock_module_vhd.ejava,v $
--          Rev:  $Revision: 1.1.2.2 $
--
--      Company:  Xilinx
--
--   Disclaimer:  XILINX IS PROVIDING THIS DESIGN, CODE, OR
--                INFORMATION "AS IS" SOLELY FOR USE IN DEVELOPING
--                PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY
--                PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
--                ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
--                APPLICATION OR STANDARD, XILINX IS MAKING NO
--                REPRESENTATION THAT THIS IMPLEMENTATION IS FREE
--                FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE
--                RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY
--                REQUIRE FOR YOUR IMPLEMENTATION.  XILINX
--                EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH
--                RESPECT TO THE ADEQUACY OF THE IMPLEMENTATION,
--                INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
--                REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
--                FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES
--                OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
--                PURPOSE.
--
--                (c) Copyright 2008 Xilinx, Inc.
--                All rights reserved.
--

--
--  CLOCK_MODULE
--
--
--
--  Description: A module provided as a convenience for desingners using 4-byte
--               lane Aurora Modules. This module takes the MGT reference clock as
--               input, and produces a divided clock on a global clock net suitable
--               for driving application logic connected to the Aurora User Interface.
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.all;
-- synthesis translate_on

entity Aurora_CLOCK_MODULE is

    port (

            MGT_REFERENCE_CLOCK : in std_logic;
            USER_CLK            : out std_logic;
            USER_CLK_2X_N       : out std_logic;
			xCLK                : out std_logic;
            DCM_NOT_LOCKED      : out std_logic

         );

end Aurora_CLOCK_MODULE;

architecture MAPPED of Aurora_CLOCK_MODULE is

-- External Register Declarations --

    signal USER_CLK_Buffer       : std_logic;
    signal USER_CLK_2X_N_Buffer  : std_logic;
    signal xCLK_Buffer           : std_logic;
    signal DCM_NOT_LOCKED_Buffer : std_logic;

-- Wire Declarations --

    signal not_connected_i : std_logic_vector(15 downto 0);
    signal clkfx_i         : std_logic;
    signal clkfx180_i      : std_logic;
    signal clkfb_i         : std_logic;
    signal clkdv_i         : std_logic;
    signal clk0_i          : std_logic;
--    signal clk180_i        : std_logic;
    signal locked_i        : std_logic;

    signal tied_to_ground_i : std_logic;

-- Component Declarations --

    component DCM

        generic (CLKDV_DIVIDE            : real       := 2.0;
                 CLKFX_DIVIDE            : integer    := 4;
                 CLKFX_MULTIPLY          : integer    := 2;
                 CLKIN_DIVIDE_BY_2       : boolean    := false;
                 CLKIN_PERIOD            : real       := 6.666667;            --non-simulatable
                 CLKOUT_PHASE_SHIFT      : string     := "NONE";
                 CLK_FEEDBACK            : string     := "1X";
                 DESKEW_ADJUST           : string     := "SYSTEM_SYNCHRONOUS"; --non-simulatable
                 DFS_FREQUENCY_MODE      : string     := "LOW";
                 DLL_FREQUENCY_MODE      : string     := "LOW";
                 DSS_MODE                : string     := "NONE";               --non-simulatable
                 DUTY_CYCLE_CORRECTION   : boolean    := true;
                 FACTORY_JF              : bit_vector := X"C080";              --non-simulatable
                 PHASE_SHIFT             : integer    := 0;
                 STARTUP_WAIT            : boolean    := false);               --non-simulatable

        port (
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
                RST      : in std_ulogic                    := '0'
             );

    end component;


    component BUFG

        port (

                O : out std_ulogic;
                I : in  std_ulogic

             );

    end component;


    component INV

        port (

                O : out std_ulogic;
                I : in  std_ulogic
             );

    end component;

begin

    USER_CLK       <= USER_CLK_Buffer;
    xCLK           <= xCLK_Buffer;
    USER_CLK_2X_N  <= USER_CLK_2X_N_Buffer;
    DCM_NOT_LOCKED <= DCM_NOT_LOCKED_Buffer;

    tied_to_ground_i <= '0';

-- Main Body of Code --

    -- Instantiate a DCM module to divide the reference clock.

    clock_divider_i : DCM

        port map (

                    CLK0     => clk0_i,
                    CLK180   => open,
--                    CLK180   => clk180_i,
                    CLK270   => open,
                    CLK2X    => open,
                    CLK2X180 => open,
                    CLK90    => open,
                    CLKDV    => clkdv_i,
                    CLKFX    => clkfx_i,
                    CLKFX180 => clkfx180_i,
                    LOCKED   => locked_i,
                    PSDONE   => open,
                    STATUS   => open,
                    CLKFB    => clkfb_i,
                    CLKIN    => MGT_REFERENCE_CLOCK,
                    DSSEN    => tied_to_ground_i,
                    PSCLK    => tied_to_ground_i,
                    PSEN     => tied_to_ground_i,
                    PSINCDEC => tied_to_ground_i,
                    RST      => tied_to_ground_i

                 );


    -- BUFG for the feedback clock.  The feedback signal is phase aligned to the input
    -- and must come from the CLK0 or CLK2X output of the DCM.  In this case, we use
    -- the CLK0 output.

--    out_of_phase_2x_clock_i : BUFG
--        port map (
--                    I => clk180_i,
--                    O => USER_CLK_2X_N_Buffer
--                 );

    feedback_clock_net_i : BUFG

        port map (

                    I => clk0_i,
                    O => clkfb_i

                 );

    xclk_global_clock_buffer_i : BUFG
        port map (
                    I => clkfx180_i,
                    O => xCLK_Buffer
                 );

    -- We invert the feedback clock to get USER_CLK_2X_N.

    user_clk_2x_inverter_i : INV

        port map (

                    I => clkfb_i,
                    O => USER_CLK_2X_N_Buffer

                 );


    -- The User Clock is distributed on a global clock net.

    user_clk_net_i : BUFG

        port map (

--                    I => clkdv_i,
                    I => clkfx_i,
                    O => USER_CLK_Buffer

                 );


    -- The DCM_NOT_LOCKED signal is created by inverting the DCM's locked signal.

    DCM_NOT_LOCKED_Buffer <= not locked_i;


end MAPPED;
