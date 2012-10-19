--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : dsp_reset.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/dsp_reset.vhf -w D:/mza/FPGA/DSP_finesse/src/DSP/dsp_reset.sch
--Design Name: dsp_reset
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

entity dsp_reset is
   port ( dsp_clock        : in    std_logic; 
          dsp_pll_bypass   : in    std_logic; 
          dsp_reset_button : in    std_logic; 
          dsp0_reset       : out   std_logic; 
          dsp1_reset       : out   std_logic; 
          xdsp_reset       : out   std_logic);
end dsp_reset;

architecture BEHAVIORAL of dsp_reset is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   attribute BOX_TYPE    : string ;
   signal xdsp_reset_DUMMY : std_logic;
   component blackfin_reset
      port ( clock  : in    std_logic; 
             reset  : out   std_logic; 
             bypass : in    std_logic; 
             button : in    std_logic);
   end component;
   
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
   xdsp_reset <= xdsp_reset_DUMMY;
   blackfinreset : blackfin_reset
      port map (button=>dsp_reset_button,
                bypass=>dsp_pll_bypass,
                clock=>dsp_clock,
                reset=>xdsp_reset_DUMMY);
   
   XLXI_2 : OBUF
      port map (I=>xdsp_reset_DUMMY,
                O=>dsp0_reset);
   
   XLXI_3 : OBUF
      port map (I=>xdsp_reset_DUMMY,
                O=>dsp1_reset);
   
end BEHAVIORAL;


