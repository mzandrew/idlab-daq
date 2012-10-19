--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : iobuf16.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:28
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/iobuf16.vhf -w D:/mza/FPGA/DSP_finesse/src/USB/iobuf16.sch
--Design Name: iobuf16
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

entity iobuf16 is
   port ( FDIN    : in    std_logic_vector (15 downto 0); 
          xTOGGLE : in    std_logic; 
          FDOUT   : out   std_logic_vector (15 downto 0); 
          FD      : inout std_logic_vector (15 downto 0));
end iobuf16;

architecture BEHAVIORAL of iobuf16 is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   attribute BOX_TYPE    : string ;
   signal TOGGLE  : std_logic;
   component IOBUF
      port ( I  : in    std_logic; 
             IO : inout std_logic; 
             O  : out   std_logic; 
             T  : in    std_logic);
   end component;
   attribute IOSTANDARD of IOBUF : component is "DEFAULT";
   attribute CAPACITANCE of IOBUF : component is "DONT_CARE";
   attribute SLEW of IOBUF : component is "SLOW";
   attribute DRIVE of IOBUF : component is "12";
   attribute BOX_TYPE of IOBUF : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_3611 : IOBUF
      port map (I=>FDIN(0),
                T=>TOGGLE,
                O=>FDOUT(0),
                IO=>FD(0));
   
   XLXI_3613 : IOBUF
      port map (I=>FDIN(1),
                T=>TOGGLE,
                O=>FDOUT(1),
                IO=>FD(1));
   
   XLXI_3614 : IOBUF
      port map (I=>FDIN(2),
                T=>TOGGLE,
                O=>FDOUT(2),
                IO=>FD(2));
   
   XLXI_3615 : IOBUF
      port map (I=>FDIN(3),
                T=>TOGGLE,
                O=>FDOUT(3),
                IO=>FD(3));
   
   XLXI_3620 : IOBUF
      port map (I=>FDIN(4),
                T=>TOGGLE,
                O=>FDOUT(4),
                IO=>FD(4));
   
   XLXI_3621 : IOBUF
      port map (I=>FDIN(5),
                T=>TOGGLE,
                O=>FDOUT(5),
                IO=>FD(5));
   
   XLXI_3622 : IOBUF
      port map (I=>FDIN(6),
                T=>TOGGLE,
                O=>FDOUT(6),
                IO=>FD(6));
   
   XLXI_3623 : IOBUF
      port map (I=>FDIN(7),
                T=>TOGGLE,
                O=>FDOUT(7),
                IO=>FD(7));
   
   XLXI_3624 : IOBUF
      port map (I=>FDIN(8),
                T=>TOGGLE,
                O=>FDOUT(8),
                IO=>FD(8));
   
   XLXI_3625 : IOBUF
      port map (I=>FDIN(9),
                T=>TOGGLE,
                O=>FDOUT(9),
                IO=>FD(9));
   
   XLXI_3626 : IOBUF
      port map (I=>FDIN(10),
                T=>TOGGLE,
                O=>FDOUT(10),
                IO=>FD(10));
   
   XLXI_3627 : IOBUF
      port map (I=>FDIN(11),
                T=>TOGGLE,
                O=>FDOUT(11),
                IO=>FD(11));
   
   XLXI_3628 : IOBUF
      port map (I=>FDIN(12),
                T=>TOGGLE,
                O=>FDOUT(12),
                IO=>FD(12));
   
   XLXI_3629 : IOBUF
      port map (I=>FDIN(13),
                T=>TOGGLE,
                O=>FDOUT(13),
                IO=>FD(13));
   
   XLXI_3630 : IOBUF
      port map (I=>FDIN(14),
                T=>TOGGLE,
                O=>FDOUT(14),
                IO=>FD(14));
   
   XLXI_3631 : IOBUF
      port map (I=>FDIN(15),
                T=>TOGGLE,
                O=>FDOUT(15),
                IO=>FD(15));
   
   XLXI_3632 : BUF
      port map (I=>xTOGGLE,
                O=>TOGGLE);
   
end BEHAVIORAL;


