--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : dsp_control.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:26
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/dsp_control.vhf -w D:/mza/FPGA/DSP_finesse/src/DSP/dsp_control.sch
--Design Name: dsp_control
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

entity dsp_control is
   port ( dsp0_async_ready : out   std_logic; 
          dsp0_bmode0      : out   std_logic; 
          dsp0_bmode1      : out   std_logic; 
          dsp0_bus_ready   : out   std_logic; 
          dsp0_bypass      : out   std_logic; 
          dsp0_nmi0        : out   std_logic; 
          dsp0_nmi1        : out   std_logic; 
          dsp1_async_ready : out   std_logic; 
          dsp1_bmode0      : out   std_logic; 
          dsp1_bmode1      : out   std_logic; 
          dsp1_bus_ready   : out   std_logic; 
          dsp1_bypass      : out   std_logic; 
          dsp1_nmi0        : out   std_logic; 
          dsp1_nmi1        : out   std_logic; 
          xbmode0          : out   std_logic; 
          xbmode1          : out   std_logic; 
          xbypass          : out   std_logic);
end dsp_control;

architecture BEHAVIORAL of dsp_control is
   attribute BOX_TYPE    : string ;
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   signal XLXN_234         : std_logic;
   signal XLXN_254         : std_logic;
   signal XLXN_267         : std_logic;
   signal xbmode0_DUMMY    : std_logic;
   signal xbmode1_DUMMY    : std_logic;
   signal xbypass_DUMMY    : std_logic;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
begin
   xbmode0 <= xbmode0_DUMMY;
   xbmode1 <= xbmode1_DUMMY;
   xbypass <= xbypass_DUMMY;
   XLXI_1 : GND
      port map (G=>open);
   
   XLXI_162 : OBUF
      port map (I=>XLXN_234,
                O=>dsp0_bus_ready);
   
   XLXI_163 : VCC
      port map (P=>XLXN_234);
   
   XLXI_182 : OBUF
      port map (I=>XLXN_254,
                O=>dsp0_async_ready);
   
   XLXI_231 : OBUF
      port map (I=>XLXN_267,
                O=>dsp0_nmi0);
   
   XLXI_234 : OBUF
      port map (I=>XLXN_267,
                O=>dsp0_nmi1);
   
   XLXI_297 : OBUF
      port map (I=>XLXN_234,
                O=>dsp1_bus_ready);
   
   XLXI_301 : OBUF
      port map (I=>XLXN_254,
                O=>dsp1_async_ready);
   
   XLXI_309 : OBUF
      port map (I=>XLXN_267,
                O=>dsp1_nmi0);
   
   XLXI_311 : GND
      port map (G=>XLXN_267);
   
   XLXI_312 : OBUF
      port map (I=>XLXN_267,
                O=>dsp1_nmi1);
   
   XLXI_449 : OBUF
      port map (I=>xbmode0_DUMMY,
                O=>dsp0_bmode0);
   
   XLXI_451 : OBUF
      port map (I=>xbmode1_DUMMY,
                O=>dsp0_bmode1);
   
   XLXI_460 : OBUF
      port map (I=>xbmode0_DUMMY,
                O=>dsp1_bmode0);
   
   XLXI_461 : OBUF
      port map (I=>xbmode1_DUMMY,
                O=>dsp1_bmode1);
   
   XLXI_513 : OBUF
      port map (I=>xbypass_DUMMY,
                O=>dsp1_bypass);
   
   XLXI_514 : OBUF
      port map (I=>xbypass_DUMMY,
                O=>dsp0_bypass);
   
   XLXI_558 : VCC
      port map (P=>XLXN_254);
   
   XLXI_573 : GND
      port map (G=>xbmode1_DUMMY);
   
   XLXI_574 : VCC
      port map (P=>xbmode0_DUMMY);
   
   XLXI_584 : GND
      port map (G=>open);
   
   XLXI_598 : VCC
      port map (P=>open);
   
   XLXI_625 : VCC
      port map (P=>xbypass_DUMMY);
   
end BEHAVIORAL;


