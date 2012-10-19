--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : fo_io.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/fo_io.vhf -w D:/mza/FPGA/DSP_finesse/contrib/Aurora_interface/fo_io.sch
--Design Name: fo_io
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

entity fo_io is
   port ( MOD0       : in    std_logic; 
          MOD2       : in    std_logic; 
          RX_LOSS    : in    std_logic; 
          TX_FAULT   : in    std_logic; 
          MOD1       : out   std_logic; 
          TX_DIS     : out   std_logic; 
          xMOD0      : out   std_logic; 
          xMOD2      : out   std_logic; 
          xRX_LOSS_N : out   std_logic; 
          xTX_FAULT  : out   std_logic);
end fo_io;

architecture BEHAVIORAL of fo_io is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute BOX_TYPE    : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   signal XLXN_5     : std_logic;
   signal XLXN_11    : std_logic;
   signal XLXN_32    : std_logic;
   signal XLXN_33    : std_logic;
   signal XLXN_34    : std_logic;
   signal XLXN_35    : std_logic;
   signal XLXN_38    : std_logic;
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : IBUF
      port map (I=>TX_FAULT,
                O=>XLXN_35);
   
   XLXI_2 : OBUF
      port map (I=>XLXN_5,
                O=>TX_DIS);
   
   XLXI_3 : GND
      port map (G=>XLXN_5);
   
   XLXI_4 : IBUF
      port map (I=>RX_LOSS,
                O=>XLXN_38);
   
   XLXI_5 : IBUF
      port map (I=>MOD2,
                O=>XLXN_33);
   
   XLXI_6 : OBUF
      port map (I=>XLXN_11,
                O=>MOD1);
   
   XLXI_7 : GND
      port map (G=>XLXN_11);
   
   XLXI_8 : IBUF
      port map (I=>MOD0,
                O=>XLXN_32);
   
   XLXI_17 : BUF
      port map (I=>XLXN_32,
                O=>xMOD0);
   
   XLXI_18 : BUF
      port map (I=>XLXN_33,
                O=>xMOD2);
   
   XLXI_19 : BUF
      port map (I=>XLXN_34,
                O=>xRX_LOSS_N);
   
   XLXI_20 : BUF
      port map (I=>XLXN_35,
                O=>xTX_FAULT);
   
   XLXI_22 : INV
      port map (I=>XLXN_38,
                O=>XLXN_34);
   
end BEHAVIORAL;


