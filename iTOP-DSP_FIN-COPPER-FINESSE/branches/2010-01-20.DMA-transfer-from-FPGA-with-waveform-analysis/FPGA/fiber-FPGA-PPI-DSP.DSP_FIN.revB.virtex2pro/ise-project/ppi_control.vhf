--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : ppi_control.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:27
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/ppi_control.vhf -w D:/mza/FPGA/DSP_finesse/src/DSP/ppi_control.sch
--Design Name: ppi_control
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

entity ppi_control is
   port ( buffer_length  : in    std_logic_vector (14 downto 0); 
          data_in_buffer : in    std_logic; 
          enable         : in    std_logic; 
          ppi_clock      : in    std_logic; 
          reset          : in    std_logic; 
          address        : out   std_logic_vector (14 downto 0); 
          counting       : out   std_logic; 
          first          : out   std_logic; 
          last           : out   std_logic; 
          running        : out   std_logic);
end ppi_control;

architecture BEHAVIORAL of ppi_control is
   attribute BOX_TYPE   : string ;
   signal second_to_last : std_logic;
   signal XLXN_93        : std_logic;
   signal XLXN_115       : std_logic;
   signal XLXN_357       : std_logic;
   signal XLXN_525       : std_logic;
   signal counting_DUMMY : std_logic;
   signal running_DUMMY  : std_logic;
   signal address_DUMMY  : std_logic_vector (14 downto 0);
   component edge_to_pulse
      port ( i     : in    std_logic; 
             clock : in    std_logic; 
             o     : out   std_logic);
   end component;
   
   component synchronous_latch
      port ( slatch : in    std_logic; 
             clock  : in    std_logic; 
             clear  : in    std_logic; 
             Q      : out   std_logic);
   end component;
   
   component block_ram_counter
      port ( l         : in    std_logic_vector (14 downto 0); 
             load      : in    std_logic; 
             clk       : in    std_logic; 
             ce        : in    std_logic; 
             q_thresh0 : out   std_logic; 
             q         : out   std_logic_vector (14 downto 0));
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component FDC
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
   component address_comparator
      port ( a      : in    std_logic_vector (14 downto 0); 
             a_eq_b : out   std_logic);
   end component;
   
begin
   address(14 downto 0) <= address_DUMMY(14 downto 0);
   counting <= counting_DUMMY;
   running <= running_DUMMY;
   e2p_first : edge_to_pulse
      port map (clock=>ppi_clock,
                i=>running_DUMMY,
                o=>first);
   
   e2p_last : edge_to_pulse
      port map (clock=>ppi_clock,
                i=>XLXN_115,
                o=>second_to_last);
   
   e2p_loadcounter : edge_to_pulse
      port map (clock=>ppi_clock,
                i=>data_in_buffer,
                o=>XLXN_93);
   
   XLXI_1 : synchronous_latch
      port map (clear=>XLXN_525,
                clock=>ppi_clock,
                slatch=>data_in_buffer,
                Q=>running_DUMMY);
   
   XLXI_2 : block_ram_counter
      port map (ce=>counting_DUMMY,
                clk=>ppi_clock,
                l(14 downto 0)=>buffer_length(14 downto 0),
                load=>XLXN_93,
                q(14 downto 0)=>address_DUMMY(14 downto 0),
                q_thresh0=>open);
   
   XLXI_5 : OR2
      port map (I0=>second_to_last,
                I1=>reset,
                O=>XLXN_525);
   
   XLXI_15 : AND2
      port map (I0=>enable,
                I1=>running_DUMMY,
                O=>XLXN_357);
   
   XLXI_16 : FDC
      port map (C=>ppi_clock,
                CLR=>XLXN_525,
                D=>XLXN_357,
                Q=>counting_DUMMY);
   
   XLXI_17 : address_comparator
      port map (a(14 downto 0)=>address_DUMMY(14 downto 0),
                a_eq_b=>XLXN_115);
   
   XLXI_18 : edge_to_pulse
      port map (clock=>ppi_clock,
                i=>second_to_last,
                o=>last);
   
end BEHAVIORAL;


