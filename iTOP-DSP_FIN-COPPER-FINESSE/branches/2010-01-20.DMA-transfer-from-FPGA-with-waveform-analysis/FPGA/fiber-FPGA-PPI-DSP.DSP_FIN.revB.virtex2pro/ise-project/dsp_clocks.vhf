--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : dsp_clocks.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/dsp_clocks.vhf -w D:/mza/FPGA/DSP_finesse/src/DSP/dsp_clocks.sch
--Design Name: dsp_clocks
--Device: virtex4
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity dsp_clocks is
   port ( reset           : in    std_logic; 
          xBCLK           : in    std_logic; 
          dsp0_clock      : out   std_logic; 
          dsp0_ppi0_clock : out   std_logic; 
          dsp0_ppi1_clock : out   std_logic; 
          dsp1_clock      : out   std_logic; 
          dsp1_ppi0_clock : out   std_logic; 
          dsp1_ppi1_clock : out   std_logic; 
          xdsp_clock      : out   std_logic; 
          xdsp_ppi_clock  : out   std_logic);
end dsp_clocks;

architecture BEHAVIORAL of dsp_clocks is
   attribute BOX_TYPE    : string ;
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   signal XLXN_602             : std_logic;
   signal XLXN_651             : std_logic;
   signal xdsp_clock_DUMMY     : std_logic;
   signal xdsp_ppi_clock_DUMMY : std_logic;
   component dsp_dcm
      port ( CLKDV_OUT : out   std_logic; 
             CLKFX_OUT : out   std_logic; 
             CLK0_OUT  : out   std_logic; 
             CLKIN_IN  : in    std_logic; 
             RST_IN    : in    std_logic);
   end component;
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
begin
   xdsp_clock <= xdsp_clock_DUMMY;
   xdsp_ppi_clock <= xdsp_ppi_clock_DUMMY;
   dspdcm : dsp_dcm
      port map (CLKIN_IN=>xBCLK,
                RST_IN=>reset,
                CLKDV_OUT=>XLXN_651,
                CLKFX_OUT=>XLXN_602,
                CLK0_OUT=>open);
   
   XLXI_475 : BUFG
      port map (I=>XLXN_651,
                O=>xdsp_ppi_clock_DUMMY);
   
   XLXI_476 : OBUF
      port map (I=>xdsp_ppi_clock_DUMMY,
                O=>dsp0_ppi1_clock);
   
   XLXI_477 : OBUF
      port map (I=>xdsp_ppi_clock_DUMMY,
                O=>dsp1_ppi1_clock);
   
   XLXI_478 : OBUF
      port map (I=>xdsp_ppi_clock_DUMMY,
                O=>dsp1_ppi0_clock);
   
   XLXI_479 : OBUF
      port map (I=>xdsp_ppi_clock_DUMMY,
                O=>dsp0_ppi0_clock);
   
   XLXI_480 : OBUF
      port map (I=>xdsp_clock_DUMMY,
                O=>dsp1_clock);
   
   XLXI_481 : OBUF
      port map (I=>xdsp_clock_DUMMY,
                O=>dsp0_clock);
   
   XLXI_500 : BUFG
      port map (I=>XLXN_602,
                O=>xdsp_clock_DUMMY);
   
end BEHAVIORAL;


