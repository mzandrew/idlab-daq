--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : constant_15bit.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:26
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/constant_15bit.vhf -w D:/mza/FPGA/DSP_finesse/src/DSP/constant_15bit.sch
--Design Name: constant_15bit
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

entity constant_15bit is
   port ( o : out   std_logic_vector (14 downto 0));
end constant_15bit;

architecture BEHAVIORAL of constant_15bit is
   attribute BOX_TYPE   : string ;
   signal const : std_logic_vector (15 downto 0);
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   const(15 downto 0) <= x"0040";
   XLXI_3 : BUF
      port map (I=>const(0),
                O=>o(0));
   
   XLXI_4 : BUF
      port map (I=>const(1),
                O=>o(1));
   
   XLXI_5 : BUF
      port map (I=>const(2),
                O=>o(2));
   
   XLXI_6 : BUF
      port map (I=>const(3),
                O=>o(3));
   
   XLXI_9 : BUF
      port map (I=>const(4),
                O=>o(4));
   
   XLXI_10 : BUF
      port map (I=>const(5),
                O=>o(5));
   
   XLXI_11 : BUF
      port map (I=>const(6),
                O=>o(6));
   
   XLXI_12 : BUF
      port map (I=>const(7),
                O=>o(7));
   
   XLXI_13 : BUF
      port map (I=>const(8),
                O=>o(8));
   
   XLXI_14 : BUF
      port map (I=>const(9),
                O=>o(9));
   
   XLXI_15 : BUF
      port map (I=>const(10),
                O=>o(10));
   
   XLXI_16 : BUF
      port map (I=>const(11),
                O=>o(11));
   
   XLXI_17 : BUF
      port map (I=>const(12),
                O=>o(12));
   
   XLXI_18 : BUF
      port map (I=>const(13),
                O=>o(13));
   
   XLXI_19 : BUF
      port map (I=>const(14),
                O=>o(14));
   
   XLXI_20 : BUF
      port map (I=>const(15),
                O=>open);
   
end BEHAVIORAL;


