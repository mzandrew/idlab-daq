--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : dsp_jtag.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/dsp_jtag.vhf -w D:/mza/FPGA/DSP_finesse/src/DSP/dsp_jtag.sch
--Design Name: dsp_jtag
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

entity dsp_jtag is
   port ( DSP_EMU   : in    std_logic; 
          dsp0_tdo  : in    std_logic; 
          dsp1_tdo  : in    std_logic; 
          TCK_JTAG  : in    std_logic; 
          TDI_JTAG  : in    std_logic; 
          TMS_JTAG  : in    std_logic; 
          TRST_JTAG : in    std_logic; 
          dsp0_tck  : out   std_logic; 
          dsp0_tdi  : out   std_logic; 
          dsp0_tms  : out   std_logic; 
          dsp0_trst : out   std_logic; 
          dsp1_tck  : out   std_logic; 
          dsp1_tdi  : out   std_logic; 
          dsp1_tms  : out   std_logic; 
          dsp1_trst : out   std_logic; 
          EMU_JTAG  : out   std_logic; 
          TDO_JTAG  : out   std_logic);
end dsp_jtag;

architecture BEHAVIORAL of dsp_jtag is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute BOX_TYPE    : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   signal XLXN_61   : std_logic;
   signal XLXN_77   : std_logic;
   signal XLXN_93   : std_logic;
   signal XLXN_376  : std_logic;
   signal XLXN_408  : std_logic;
   signal XLXN_409  : std_logic;
   signal XLXN_410  : std_logic;
   signal xTCK      : std_logic;
   signal xTMS      : std_logic;
   signal xTRST     : std_logic;
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_34 : IBUF
      port map (I=>TDI_JTAG,
                O=>XLXN_408);
   
   XLXI_35 : IBUF
      port map (I=>dsp0_tdo,
                O=>XLXN_410);
   
   XLXI_37 : OBUF
      port map (I=>XLXN_409,
                O=>dsp0_tdi);
   
   XLXI_38 : OBUF
      port map (I=>XLXN_408,
                O=>dsp1_tdi);
   
   XLXI_46 : IBUF
      port map (I=>TRST_JTAG,
                O=>XLXN_61);
   
   XLXI_47 : BUF
      port map (I=>XLXN_61,
                O=>xTRST);
   
   XLXI_48 : OBUF
      port map (I=>xTRST,
                O=>dsp0_trst);
   
   XLXI_55 : OBUF
      port map (I=>XLXN_376,
                O=>EMU_JTAG);
   
   XLXI_60 : IBUF
      port map (I=>TCK_JTAG,
                O=>XLXN_77);
   
   XLXI_61 : BUF
      port map (I=>XLXN_77,
                O=>xTCK);
   
   XLXI_62 : OBUF
      port map (I=>xTCK,
                O=>dsp0_tck);
   
   XLXI_68 : IBUF
      port map (I=>TMS_JTAG,
                O=>XLXN_93);
   
   XLXI_69 : BUF
      port map (I=>XLXN_93,
                O=>xTMS);
   
   XLXI_70 : OBUF
      port map (I=>xTMS,
                O=>dsp0_tms);
   
   XLXI_306 : OBUF
      port map (I=>xTMS,
                O=>dsp1_tms);
   
   XLXI_307 : OBUF
      port map (I=>xTCK,
                O=>dsp1_tck);
   
   XLXI_308 : OBUF
      port map (I=>xTRST,
                O=>dsp1_trst);
   
   XLXI_321 : IBUF
      port map (I=>DSP_EMU,
                O=>XLXN_376);
   
   XLXI_335 : IBUF
      port map (I=>dsp1_tdo,
                O=>XLXN_409);
   
   XLXI_336 : OBUF
      port map (I=>XLXN_410,
                O=>TDO_JTAG);
   
end BEHAVIORAL;


