--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : obuf12to16.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:26
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/obuf12to16.vhf -w D:/mza/FPGA/DSP_finesse/src/obuf12to16.sch
--Design Name: obuf12to16
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

entity obuf12to16 is
   port ( i : in    std_logic_vector (11 downto 0); 
          o : out   std_logic_vector (15 downto 0));
end obuf12to16;

architecture BEHAVIORAL of obuf12to16 is
   attribute BOX_TYPE   : string ;
   signal XLXN_12 : std_logic;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>i(0),
                O=>o(0));
   
   XLXI_2 : BUF
      port map (I=>i(1),
                O=>o(1));
   
   XLXI_3 : BUF
      port map (I=>i(2),
                O=>o(2));
   
   XLXI_4 : BUF
      port map (I=>i(3),
                O=>o(3));
   
   XLXI_5 : BUF
      port map (I=>i(4),
                O=>o(4));
   
   XLXI_6 : BUF
      port map (I=>i(5),
                O=>o(5));
   
   XLXI_7 : BUF
      port map (I=>i(6),
                O=>o(6));
   
   XLXI_8 : BUF
      port map (I=>i(7),
                O=>o(7));
   
   XLXI_9 : BUF
      port map (I=>i(8),
                O=>o(8));
   
   XLXI_10 : BUF
      port map (I=>i(9),
                O=>o(9));
   
   XLXI_11 : BUF
      port map (I=>i(10),
                O=>o(10));
   
   XLXI_12 : BUF
      port map (I=>i(11),
                O=>o(11));
   
   XLXI_13 : BUF
      port map (I=>XLXN_12,
                O=>o(12));
   
   XLXI_14 : BUF
      port map (I=>XLXN_12,
                O=>o(13));
   
   XLXI_15 : BUF
      port map (I=>XLXN_12,
                O=>o(14));
   
   XLXI_16 : BUF
      port map (I=>XLXN_12,
                O=>o(15));
   
   XLXI_17 : GND
      port map (G=>XLXN_12);
   
end BEHAVIORAL;


