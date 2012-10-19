--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : ppi.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:26
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/ppi.vhf -w D:/mza/FPGA/DSP_finesse/src/DSP/ppi.sch
--Design Name: ppi
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

entity constant_15bit_MUSER_ppi is
   port ( o : out   std_logic_vector (14 downto 0));
end constant_15bit_MUSER_ppi;

architecture BEHAVIORAL of constant_15bit_MUSER_ppi is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ppi_control_MUSER_ppi is
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
end ppi_control_MUSER_ppi;

architecture BEHAVIORAL of ppi_control_MUSER_ppi is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ppi is
   port ( data_pending       : in    std_logic; 
          ppi_clock          : in    std_logic; 
          reset              : in    std_logic; 
          fifo_address       : out   std_logic_vector (14 downto 0); 
          last               : out   std_logic; 
          sync               : out   std_logic; 
          xppi_fifo_counting : out   std_logic);
end ppi;

architecture BEHAVIORAL of ppi is
   attribute BOX_TYPE    : string ;
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   signal XLXN_2083          : std_logic;
   signal XLXN_2088          : std_logic;
   signal XLXN_2600          : std_logic;
   signal XLXN_2601          : std_logic_vector (14 downto 0);
   signal last_DUMMY         : std_logic;
   component ppi_control_MUSER_ppi
      port ( data_in_buffer : in    std_logic; 
             ppi_clock      : in    std_logic; 
             buffer_length  : in    std_logic_vector (14 downto 0); 
             enable         : in    std_logic; 
             reset          : in    std_logic; 
             last           : out   std_logic; 
             address        : out   std_logic_vector (14 downto 0); 
             first          : out   std_logic; 
             counting       : out   std_logic; 
             running        : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component synchronous_latch
      port ( slatch : in    std_logic; 
             clock  : in    std_logic; 
             clear  : in    std_logic; 
             Q      : out   std_logic);
   end component;
   
   component constant_15bit_MUSER_ppi
      port ( o : out   std_logic_vector (14 downto 0));
   end component;
   
begin
   last <= last_DUMMY;
   ppicontrol : ppi_control_MUSER_ppi
      port map (buffer_length(14 downto 0)=>XLXN_2601(14 downto 0),
                data_in_buffer=>XLXN_2088,
                enable=>XLXN_2083,
                ppi_clock=>ppi_clock,
                reset=>reset,
                address(14 downto 0)=>fifo_address(14 downto 0),
                counting=>xppi_fifo_counting,
                first=>XLXN_2600,
                last=>last_DUMMY,
                running=>open);
   
   XLXI_736 : VCC
      port map (P=>XLXN_2083);
   
   XLXI_797 : OBUF
      port map (I=>XLXN_2600,
                O=>sync);
   
   XLXI_865 : synchronous_latch
      port map (clear=>last_DUMMY,
                clock=>ppi_clock,
                slatch=>data_pending,
                Q=>XLXN_2088);
   
   XLXI_866 : constant_15bit_MUSER_ppi
      port map (o(14 downto 0)=>XLXN_2601(14 downto 0));
   
end BEHAVIORAL;


