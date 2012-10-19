--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : TOP.vhf
-- /___/   /\     Timestamp : 09/06/2011 21:03:25
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath D:/mza/FPGA/DSP_finesse/contrib/address_comparator -sympath D:/mza/FPGA/DSP_finesse/contrib/block_ram_counter -sympath D:/mza/FPGA/DSP_finesse/contrib/ram16384x24 -intstyle ise -family virtex4 -flat -suppress -vhdl D:/mza/FPGA/DSP_finesse/ise-project/TOP.vhf -w D:/mza/FPGA/DSP_finesse/src/TOP.sch
--Design Name: TOP
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

entity obuf12to16_MUSER_TOP is
   port ( i : in    std_logic_vector (11 downto 0); 
          o : out   std_logic_vector (15 downto 0));
end obuf12to16_MUSER_TOP;

architecture BEHAVIORAL of obuf12to16_MUSER_TOP is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FJKC_MXILINX_TOP is
   generic( INIT : bit :=  '0');
   port ( C   : in    std_logic; 
          CLR : in    std_logic; 
          J   : in    std_logic; 
          K   : in    std_logic; 
          Q   : out   std_logic);
end FJKC_MXILINX_TOP;

architecture BEHAVIORAL of FJKC_MXILINX_TOP is
   attribute BOX_TYPE   : string ;
   attribute RLOC       : string ;
   signal AD      : std_logic;
   signal A0      : std_logic;
   signal A1      : std_logic;
   signal A2      : std_logic;
   signal Q_DUMMY : std_logic;
   component FDC
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   attribute RLOC of I_36_32 : label is "X0Y0";
begin
   Q <= Q_DUMMY;
   I_36_32 : FDC
   generic map( INIT => INIT)
      port map (C=>C,
                CLR=>CLR,
                D=>AD,
                Q=>Q_DUMMY);
   
   I_36_37 : AND3B2
      port map (I0=>J,
                I1=>K,
                I2=>Q_DUMMY,
                O=>A0);
   
   I_36_40 : AND3B1
      port map (I0=>Q_DUMMY,
                I1=>K,
                I2=>J,
                O=>A1);
   
   I_36_41 : OR3
      port map (I0=>A2,
                I1=>A1,
                I2=>A0,
                O=>AD);
   
   I_36_43 : AND2B1
      port map (I0=>K,
                I1=>J,
                O=>A2);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity synchronous_latch_MUSER_TOP is
   port ( clear  : in    std_logic; 
          clock  : in    std_logic; 
          slatch : in    std_logic; 
          Q      : out   std_logic);
end synchronous_latch_MUSER_TOP;

architecture BEHAVIORAL of synchronous_latch_MUSER_TOP is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_5  : std_logic;
   signal XLXN_10 : std_logic;
   component FJKC_MXILINX_TOP
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             J   : in    std_logic; 
             K   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
begin
   XLXI_1 : FJKC_MXILINX_TOP
      port map (C=>clock,
                CLR=>clear,
                J=>slatch,
                K=>XLXN_5,
                Q=>XLXN_10);
   
   XLXI_2 : GND
      port map (G=>XLXN_5);
   
   XLXI_3 : BUF
      port map (I=>XLXN_10,
                O=>Q);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity TOP is
   port ( BCLK             : in    std_logic; 
          CLKOUT           : in    std_logic; 
          CTL0             : in    std_logic; 
          CTL1             : in    std_logic; 
          CTL2             : in    std_logic; 
          DSP_EMU          : in    std_logic; 
          DSP_TDO_0        : in    std_logic; 
          DSP_TDO_1        : in    std_logic; 
          dsp0_pf0         : in    std_logic; 
          dsp0_pf1         : in    std_logic; 
          dsp0_pf2         : in    std_logic; 
          dsp0_pf3         : in    std_logic; 
          dsp0_pf4         : in    std_logic; 
          dsp0_pf5         : in    std_logic; 
          dsp0_pf6         : in    std_logic; 
          IFCLK            : in    std_logic; 
          LOSS             : in    std_logic_vector (3 downto 0); 
          MOD0             : in    std_logic_vector (3 downto 0); 
          MOD2             : in    std_logic_vector (3 downto 0); 
          PA0              : in    std_logic; 
          PA1              : in    std_logic; 
          PA3              : in    std_logic; 
          PA7              : in    std_logic; 
          RXN              : in    std_logic_vector (3 downto 0); 
          RXP              : in    std_logic_vector (3 downto 0); 
          TCK_JTAG         : in    std_logic; 
          TDI_JTAG         : in    std_logic; 
          TMS_JTAG         : in    std_logic; 
          TRST_JTAG        : in    std_logic; 
          TX_FAULT         : in    std_logic_vector (3 downto 0); 
          WAKEUP           : in    std_logic; 
          DSP_TCK_0        : out   std_logic; 
          DSP_TCK_1        : out   std_logic; 
          DSP_TDI_0        : out   std_logic; 
          DSP_TDI_1        : out   std_logic; 
          DSP_TMS_0        : out   std_logic; 
          DSP_TMS_1        : out   std_logic; 
          DSP_TRST_0       : out   std_logic; 
          DSP_TRST_1       : out   std_logic; 
          dsp0_async_ready : out   std_logic; 
          dsp0_bmode0      : out   std_logic; 
          dsp0_bmode1      : out   std_logic; 
          dsp0_bus_ready   : out   std_logic; 
          dsp0_bypass      : out   std_logic; 
          dsp0_clock       : out   std_logic; 
          dsp0_nmi0        : out   std_logic; 
          dsp0_nmi1        : out   std_logic; 
          dsp0_ppi0        : out   std_logic_vector (15 downto 0); 
          dsp0_ppi0_clock  : out   std_logic; 
          dsp0_ppi0_sync1  : out   std_logic; 
          dsp0_ppi1_clock  : out   std_logic; 
          dsp0_reset       : out   std_logic; 
          dsp1_async_ready : out   std_logic; 
          dsp1_bmode0      : out   std_logic; 
          dsp1_bmode1      : out   std_logic; 
          dsp1_bus_ready   : out   std_logic; 
          dsp1_bypass      : out   std_logic; 
          dsp1_clock       : out   std_logic; 
          dsp1_nmi0        : out   std_logic; 
          dsp1_nmi1        : out   std_logic; 
          dsp1_ppi0_clock  : out   std_logic; 
          dsp1_ppi1_clock  : out   std_logic; 
          dsp1_reset       : out   std_logic; 
          EMU_JTAG         : out   std_logic; 
          led_green        : out   std_logic; 
          MOD1             : out   std_logic_vector (3 downto 0); 
          mon0             : out   std_logic; 
          mon1             : out   std_logic; 
          mon2             : out   std_logic; 
          mon3             : out   std_logic; 
          mon4             : out   std_logic; 
          mon5             : out   std_logic; 
          mon6             : out   std_logic; 
          mon7             : out   std_logic; 
          PA2              : out   std_logic; 
          PA4              : out   std_logic; 
          PA5              : out   std_logic; 
          PA6              : out   std_logic; 
          RDY0             : out   std_logic; 
          RDY1             : out   std_logic; 
          TDO_JTAG         : out   std_logic; 
          TXN              : out   std_logic_vector (3 downto 0); 
          TXP              : out   std_logic_vector (3 downto 0); 
          TX_DIS           : out   std_logic_vector (3 downto 0); 
          FD               : inout std_logic_vector (15 downto 0));
end TOP;

architecture BEHAVIORAL of TOP is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   attribute BOX_TYPE    : string ;
   signal buffered_BCLK    : std_logic;
   signal clear_lam        : std_logic;
   signal xbypass          : std_logic;
   signal xCLK             : std_logic;
   signal xCLR_ALL         : std_logic;
   signal xCLR_LAM         : std_logic_vector (3 downto 0);
   signal xDONE            : std_logic;
   signal xDONE_TX_XFER    : std_logic_vector (3 downto 0);
   signal xDOWNSTREAM_CLR  : std_logic_vector (3 downto 0);
   signal xDOWNSTREAM_TRIG : std_logic_vector (3 downto 0);
   signal xdsp_clock       : std_logic;
   signal xdsp_ppi_clock   : std_logic;
   signal xFIFOADR         : std_logic_vector (1 downto 0);
   signal xFLAGA           : std_logic;
   signal xFLAGB           : std_logic;
   signal xFLAGC           : std_logic;
   signal xFPGA_DATA       : std_logic_vector (15 downto 0);
   signal xIFCLK           : std_logic;
   signal xLAM             : std_logic_vector (3 downto 0);
   signal xLINK_ACTIVE     : std_logic_vector (3 downto 0);
   signal XLXN_1754        : std_logic;
   signal XLXN_2010        : std_logic;
   signal XLXN_2623        : std_logic;
   signal XLXN_2624        : std_logic;
   signal XLXN_2625        : std_logic;
   signal XLXN_2626        : std_logic;
   signal XLXN_2627        : std_logic;
   signal XLXN_2628        : std_logic;
   signal XLXN_2629        : std_logic;
   signal XLXN_2633        : std_logic;
   signal XLXN_2953        : std_logic;
   signal XLXN_2956        : std_logic;
   signal XLXN_2961        : std_logic_vector (0 downto 0);
   signal XLXN_2962        : std_logic;
   signal XLXN_2964        : std_logic;
   signal XLXN_2965        : std_logic;
   signal XLXN_2966        : std_logic_vector (11 downto 0);
   signal xPKTEND          : std_logic;
   signal xRADDR0          : std_logic_vector (14 downto 0);
   signal xRBUSY           : std_logic;
   signal xREAD0           : std_logic_vector (23 downto 0);
   signal xRESET           : std_logic;
   signal xRX_ADDR0        : std_logic_vector (13 downto 0);
   signal xRX_ADDR1        : std_logic_vector (13 downto 0);
   signal xRX_ADDR2        : std_logic_vector (13 downto 0);
   signal xRX_ADDR3        : std_logic_vector (13 downto 0);
   signal xRX_DATA0        : std_logic_vector (23 downto 0);
   signal xRX_DATA1        : std_logic_vector (23 downto 0);
   signal xRX_DATA2        : std_logic_vector (23 downto 0);
   signal xRX_DATA3        : std_logic_vector (23 downto 0);
   signal xRX_LENGTH0      : std_logic_vector (13 downto 0);
   signal xRX_LENGTH1      : std_logic_vector (13 downto 0);
   signal xRX_LENGTH2      : std_logic_vector (13 downto 0);
   signal xRX_LENGTH3      : std_logic_vector (13 downto 0);
   signal xRX_XFER_EN      : std_logic_vector (3 downto 0);
   signal xSLOE            : std_logic;
   signal xSLRD            : std_logic;
   signal xSLWR            : std_logic;
   signal xSOFT_TRIG       : std_logic;
   signal xSTART           : std_logic;
   signal xSTART_TX_XFER   : std_logic_vector (3 downto 0);
   signal xSYNC_USB        : std_logic;
   signal xTOGGLE          : std_logic;
   signal xTX_ADDR0        : std_logic_vector (13 downto 0);
   signal xTX_ADDR1        : std_logic_vector (13 downto 0);
   signal xTX_ADDR2        : std_logic_vector (13 downto 0);
   signal xTX_ADDR3        : std_logic_vector (13 downto 0);
   signal xTX_DATA0        : std_logic_vector (23 downto 0);
   signal xTX_DATA1        : std_logic_vector (23 downto 0);
   signal xTX_DATA2        : std_logic_vector (23 downto 0);
   signal xTX_DATA3        : std_logic_vector (23 downto 0);
   signal xTX_LENGTH0      : std_logic_vector (13 downto 0);
   signal xTX_LENGTH1      : std_logic_vector (13 downto 0);
   signal xTX_LENGTH2      : std_logic_vector (13 downto 0);
   signal xTX_LENGTH3      : std_logic_vector (13 downto 0);
   signal xTX_XFER_EN      : std_logic_vector (3 downto 0);
   signal xUPSTREAM_CLR    : std_logic_vector (3 downto 0);
   signal xUPSTREAM_TRIG   : std_logic_vector (3 downto 0);
   signal xUSB_DATA        : std_logic_vector (15 downto 0);
   signal xWAKEUP          : std_logic;
   signal xWBUSY           : std_logic;
   component Aurora_TOP
      port ( BCLK             : in    std_logic; 
             xCLK             : out   std_logic; 
             MOD0             : in    std_logic_vector (3 downto 0); 
             MOD2             : in    std_logic_vector (3 downto 0); 
             RX_LOSS          : in    std_logic_vector (3 downto 0); 
             TX_FAULT         : in    std_logic_vector (3 downto 0); 
             RXP              : in    std_logic_vector (3 downto 0); 
             RXN              : in    std_logic_vector (3 downto 0); 
             xSTART_TX_XFER   : in    std_logic_vector (3 downto 0); 
             xTX_DATA1        : in    std_logic_vector (23 downto 0); 
             xTX_DATA0        : in    std_logic_vector (23 downto 0); 
             xTX_DATA2        : in    std_logic_vector (23 downto 0); 
             xTX_DATA3        : in    std_logic_vector (23 downto 0); 
             xTX_LENGTH0      : in    std_logic_vector (13 downto 0); 
             xTX_LENGTH1      : in    std_logic_vector (13 downto 0); 
             xTX_LENGTH2      : in    std_logic_vector (13 downto 0); 
             xTX_LENGTH3      : in    std_logic_vector (13 downto 0); 
             xDOWNSTREAM_TRIG : in    std_logic_vector (3 downto 0); 
             xDOWNSTREAM_CLR  : in    std_logic_vector (3 downto 0); 
             xCLR_LAM         : in    std_logic_vector (3 downto 0); 
             MOD1             : out   std_logic_vector (3 downto 0); 
             TX_DIS           : out   std_logic_vector (3 downto 0); 
             TXP              : out   std_logic_vector (3 downto 0); 
             TXN              : out   std_logic_vector (3 downto 0); 
             xDONE_TX_XFER    : out   std_logic_vector (3 downto 0); 
             xTX_ADDR0        : out   std_logic_vector (13 downto 0); 
             xTX_ADDR1        : out   std_logic_vector (13 downto 0); 
             xTX_ADDR2        : out   std_logic_vector (13 downto 0); 
             xTX_ADDR3        : out   std_logic_vector (13 downto 0); 
             xTX_XFER_EN      : out   std_logic_vector (3 downto 0); 
             xLAM             : out   std_logic_vector (3 downto 0); 
             xRX_DATA0        : out   std_logic_vector (23 downto 0); 
             xRX_DATA2        : out   std_logic_vector (23 downto 0); 
             xRX_DATA1        : out   std_logic_vector (23 downto 0); 
             xRX_DATA3        : out   std_logic_vector (23 downto 0); 
             xRX_LENGTH0      : out   std_logic_vector (13 downto 0); 
             xRX_LENGTH1      : out   std_logic_vector (13 downto 0); 
             xRX_LENGTH2      : out   std_logic_vector (13 downto 0); 
             xRX_LENGTH3      : out   std_logic_vector (13 downto 0); 
             xRX_ADDR0        : out   std_logic_vector (13 downto 0); 
             xRX_ADDR1        : out   std_logic_vector (13 downto 0); 
             xRX_ADDR2        : out   std_logic_vector (13 downto 0); 
             xRX_ADDR3        : out   std_logic_vector (13 downto 0); 
             xRX_XFER_EN      : out   std_logic_vector (3 downto 0); 
             xUPSTREAM_TRIG   : out   std_logic_vector (3 downto 0); 
             xUPSTREAM_CLR    : out   std_logic_vector (3 downto 0); 
             xLINK_ACTIVE     : out   std_logic_vector (3 downto 0));
   end component;
   
   component TEST_BLOCK
      port ( xCLK             : in    std_logic; 
             xSTART_TX_XFER   : out   std_logic_vector (3 downto 0); 
             xDONE_TX_XFER    : in    std_logic_vector (3 downto 0); 
             xTX_ADDR0        : in    std_logic_vector (13 downto 0); 
             xTX_ADDR1        : in    std_logic_vector (13 downto 0); 
             xTX_ADDR2        : in    std_logic_vector (13 downto 0); 
             xTX_ADDR3        : in    std_logic_vector (13 downto 0); 
             xTX_XFER_EN      : in    std_logic_vector (3 downto 0); 
             xLAM             : in    std_logic_vector (3 downto 0); 
             xRX_DATA0        : in    std_logic_vector (23 downto 0); 
             xRX_LENGTH3      : in    std_logic_vector (13 downto 0); 
             xRX_LENGTH2      : in    std_logic_vector (13 downto 0); 
             xRX_LENGTH1      : in    std_logic_vector (13 downto 0); 
             xRX_LENGTH0      : in    std_logic_vector (13 downto 0); 
             xRX_DATA3        : in    std_logic_vector (23 downto 0); 
             xRX_DATA2        : in    std_logic_vector (23 downto 0); 
             xRX_DATA1        : in    std_logic_vector (23 downto 0); 
             xRX_ADDR0        : in    std_logic_vector (13 downto 0); 
             xRX_ADDR1        : in    std_logic_vector (13 downto 0); 
             xRX_ADDR2        : in    std_logic_vector (13 downto 0); 
             xRX_ADDR3        : in    std_logic_vector (13 downto 0); 
             xRX_XFER_EN      : in    std_logic_vector (3 downto 0); 
             xUPSTREAM_TRIG   : in    std_logic_vector (3 downto 0); 
             xUPSTREAM_CLR    : in    std_logic_vector (3 downto 0); 
             xTX_DATA0        : out   std_logic_vector (23 downto 0); 
             xTX_DATA1        : out   std_logic_vector (23 downto 0); 
             xTX_DATA2        : out   std_logic_vector (23 downto 0); 
             xTX_DATA3        : out   std_logic_vector (23 downto 0); 
             xTX_LENGTH0      : out   std_logic_vector (13 downto 0); 
             xTX_LENGTH1      : out   std_logic_vector (13 downto 0); 
             xTX_LENGTH2      : out   std_logic_vector (13 downto 0); 
             xTX_LENGTH3      : out   std_logic_vector (13 downto 0); 
             xDOWNSTREAM_TRIG : out   std_logic_vector (3 downto 0); 
             xDOWNSTREAM_CLR  : out   std_logic_vector (3 downto 0); 
             xCLR_LAM         : out   std_logic_vector (3 downto 0); 
             xCLEAR_LAM       : in    std_logic);
   end component;
   
   component dsp_clocks
      port ( xdsp_ppi_clock  : out   std_logic; 
             xBCLK           : in    std_logic; 
             dsp0_ppi0_clock : out   std_logic; 
             dsp0_ppi1_clock : out   std_logic; 
             dsp1_ppi0_clock : out   std_logic; 
             dsp1_ppi1_clock : out   std_logic; 
             dsp1_clock      : out   std_logic; 
             reset           : in    std_logic; 
             xdsp_clock      : out   std_logic; 
             dsp0_clock      : out   std_logic);
   end component;
   
   component dsp_control
      port ( xbmode0          : out   std_logic; 
             dsp1_bmode0      : out   std_logic; 
             dsp0_bmode0      : out   std_logic; 
             dsp1_bmode1      : out   std_logic; 
             dsp0_bmode1      : out   std_logic; 
             xbmode1          : out   std_logic; 
             dsp0_nmi1        : out   std_logic; 
             dsp0_nmi0        : out   std_logic; 
             dsp1_nmi0        : out   std_logic; 
             dsp1_nmi1        : out   std_logic; 
             dsp1_bus_ready   : out   std_logic; 
             dsp0_bus_ready   : out   std_logic; 
             dsp1_async_ready : out   std_logic; 
             dsp0_async_ready : out   std_logic; 
             dsp0_bypass      : out   std_logic; 
             xbypass          : out   std_logic; 
             dsp1_bypass      : out   std_logic);
   end component;
   
   component dsp_jtag
      port ( TDI_JTAG  : in    std_logic; 
             TRST_JTAG : in    std_logic; 
             TCK_JTAG  : in    std_logic; 
             TMS_JTAG  : in    std_logic; 
             DSP_EMU   : in    std_logic; 
             TDO_JTAG  : out   std_logic; 
             EMU_JTAG  : out   std_logic; 
             dsp0_tdo  : in    std_logic; 
             dsp1_tdo  : in    std_logic; 
             dsp0_trst : out   std_logic; 
             dsp1_trst : out   std_logic; 
             dsp0_tck  : out   std_logic; 
             dsp1_tck  : out   std_logic; 
             dsp1_tms  : out   std_logic; 
             dsp0_tms  : out   std_logic; 
             dsp1_tdi  : out   std_logic; 
             dsp0_tdi  : out   std_logic);
   end component;
   
   component dsp_reset
      port ( dsp_clock        : in    std_logic; 
             dsp_pll_bypass   : in    std_logic; 
             dsp_reset_button : in    std_logic; 
             dsp0_reset       : out   std_logic; 
             dsp1_reset       : out   std_logic; 
             xdsp_reset       : out   std_logic);
   end component;
   
   component obuf12to16_MUSER_TOP
      port ( i : in    std_logic_vector (11 downto 0); 
             o : out   std_logic_vector (15 downto 0));
   end component;
   
   component ppi
      port ( data_pending       : in    std_logic; 
             ppi_clock          : in    std_logic; 
             reset              : in    std_logic; 
             sync               : out   std_logic; 
             fifo_address       : out   std_logic_vector (14 downto 0); 
             xppi_fifo_counting : out   std_logic; 
             last               : out   std_logic);
   end component;
   
   component PROGRESET
      port ( CLK     : in    std_logic; 
             GLRST   : out   std_logic; 
             WAKEUP  : in    std_logic; 
             Clr_all : out   std_logic);
   end component;
   
   component USB_IO
      port ( IFCLK     : in    std_logic; 
             xSLOE     : in    std_logic; 
             xFIFOADR0 : in    std_logic; 
             xFIFOADR1 : in    std_logic; 
             xPKTEND   : in    std_logic; 
             xSLWR     : in    std_logic; 
             xSLRD     : in    std_logic; 
             WAKEUP    : in    std_logic; 
             CTL2      : in    std_logic; 
             CTL1      : in    std_logic; 
             CTL0      : in    std_logic; 
             PA7       : in    std_logic; 
             PA3       : in    std_logic; 
             PA1       : in    std_logic; 
             PA0       : in    std_logic; 
             CLKOUT    : in    std_logic; 
             xTOGGLE   : in    std_logic; 
             xDATA_OUT : in    std_logic_vector (15 downto 0); 
             xIFCLK    : out   std_logic; 
             PA2       : out   std_logic; 
             PA4       : out   std_logic; 
             PA5       : out   std_logic; 
             PA6       : out   std_logic; 
             RDY1      : out   std_logic; 
             RDY0      : out   std_logic; 
             xFLAGA    : out   std_logic; 
             xFLAGB    : out   std_logic; 
             xFLAGC    : out   std_logic; 
             xWAKEUP   : out   std_logic; 
             xUSB_DATA : out   std_logic_vector (15 downto 0); 
             FD        : inout std_logic_vector (15 downto 0));
   end component;
   
   component MESS
      port ( xSLWR      : in    std_logic; 
             xSTART     : in    std_logic; 
             xDONE      : in    std_logic; 
             xCLR_ALL   : in    std_logic; 
             xREAD      : in    std_logic_vector (23 downto 0); 
             xFPGA_DATA : out   std_logic_vector (15 downto 0); 
             xRADDR     : out   std_logic_vector (13 downto 0); 
             active     : out   std_logic);
   end component;
   
   component USBread
      port ( xIFCLK     : in    std_logic; 
             xFLAGA     : in    std_logic; 
             xRESET     : in    std_logic; 
             xWBUSY     : in    std_logic; 
             xUSB_DATA  : in    std_logic_vector (15 downto 0); 
             xRBUSY     : out   std_logic; 
             xSLOE      : out   std_logic; 
             xSLRD      : out   std_logic; 
             xSYNC_USB  : out   std_logic; 
             xSOFT_TRIG : out   std_logic; 
             xTOGGLE    : out   std_logic; 
             xFIFOADR   : out   std_logic_vector (1 downto 0); 
             xWRITE     : out   std_logic_vector (23 downto 0); 
             xWADDR     : out   std_logic_vector (13 downto 0); 
             xTX_LENGTH : out   std_logic_vector (13 downto 0); 
             xW_EN      : out   std_logic_vector (3 downto 0); 
             xW_STRB    : out   std_logic);
   end component;
   
   component USBwrite
      port ( xIFCLK    : in    std_logic; 
             xFLAGB    : in    std_logic; 
             xFLAGC    : in    std_logic; 
             xRBUSY    : in    std_logic; 
             xRESET    : in    std_logic; 
             xSTART    : in    std_logic; 
             xSYNC_USB : in    std_logic; 
             xDONE     : out   std_logic; 
             xPKTEND   : out   std_logic; 
             xSLWR     : out   std_logic; 
             xWBUSY    : out   std_logic; 
             xactive   : out   std_logic);
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
   
   component IBUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUFG : component is "DEFAULT";
   attribute CAPACITANCE of IBUFG : component is "DONT_CARE";
   attribute BOX_TYPE of IBUFG : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component synchronous_latch_MUSER_TOP
      port ( slatch : in    std_logic; 
             clock  : in    std_logic; 
             clear  : in    std_logic; 
             Q      : out   std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component ram16384x24
      port ( addra : in    std_logic_vector (13 downto 0); 
             wea   : in    std_logic_vector (0 downto 0); 
             dina  : in    std_logic_vector (23 downto 0); 
             clka  : in    std_logic; 
             addrb : in    std_logic_vector (14 downto 0); 
             clkb  : in    std_logic; 
             doutb : out   std_logic_vector (11 downto 0));
   end component;
   
begin
   auroratop : Aurora_TOP
      port map (BCLK=>buffered_BCLK,
                MOD0(3 downto 0)=>MOD0(3 downto 0),
                MOD2(3 downto 0)=>MOD2(3 downto 0),
                RXN(3 downto 0)=>RXN(3 downto 0),
                RXP(3 downto 0)=>RXP(3 downto 0),
                RX_LOSS(3 downto 0)=>LOSS(3 downto 0),
                TX_FAULT(3 downto 0)=>TX_FAULT(3 downto 0),
                xCLR_LAM(3 downto 0)=>xCLR_LAM(3 downto 0),
                xDOWNSTREAM_CLR(3 downto 0)=>xDOWNSTREAM_CLR(3 downto 0),
                xDOWNSTREAM_TRIG(3 downto 0)=>xDOWNSTREAM_TRIG(3 downto 0),
                xSTART_TX_XFER(3 downto 0)=>xSTART_TX_XFER(3 downto 0),
                xTX_DATA0(23 downto 0)=>xTX_DATA0(23 downto 0),
                xTX_DATA1(23 downto 0)=>xTX_DATA1(23 downto 0),
                xTX_DATA2(23 downto 0)=>xTX_DATA2(23 downto 0),
                xTX_DATA3(23 downto 0)=>xTX_DATA3(23 downto 0),
                xTX_LENGTH0(13 downto 0)=>xTX_LENGTH0(13 downto 0),
                xTX_LENGTH1(13 downto 0)=>xTX_LENGTH1(13 downto 0),
                xTX_LENGTH2(13 downto 0)=>xTX_LENGTH2(13 downto 0),
                xTX_LENGTH3(13 downto 0)=>xTX_LENGTH3(13 downto 0),
                MOD1(3 downto 0)=>MOD1(3 downto 0),
                TXN(3 downto 0)=>TXN(3 downto 0),
                TXP(3 downto 0)=>TXP(3 downto 0),
                TX_DIS(3 downto 0)=>TX_DIS(3 downto 0),
                xCLK=>xCLK,
                xDONE_TX_XFER(3 downto 0)=>xDONE_TX_XFER(3 downto 0),
                xLAM(3 downto 0)=>xLAM(3 downto 0),
                xLINK_ACTIVE(3 downto 0)=>xLINK_ACTIVE(3 downto 0),
                xRX_ADDR0(13 downto 0)=>xRX_ADDR0(13 downto 0),
                xRX_ADDR1(13 downto 0)=>xRX_ADDR1(13 downto 0),
                xRX_ADDR2(13 downto 0)=>xRX_ADDR2(13 downto 0),
                xRX_ADDR3(13 downto 0)=>xRX_ADDR3(13 downto 0),
                xRX_DATA0(23 downto 0)=>xRX_DATA0(23 downto 0),
                xRX_DATA1(23 downto 0)=>xRX_DATA1(23 downto 0),
                xRX_DATA2(23 downto 0)=>xRX_DATA2(23 downto 0),
                xRX_DATA3(23 downto 0)=>xRX_DATA3(23 downto 0),
                xRX_LENGTH0(13 downto 0)=>xRX_LENGTH0(13 downto 0),
                xRX_LENGTH1(13 downto 0)=>xRX_LENGTH1(13 downto 0),
                xRX_LENGTH2(13 downto 0)=>xRX_LENGTH2(13 downto 0),
                xRX_LENGTH3(13 downto 0)=>xRX_LENGTH3(13 downto 0),
                xRX_XFER_EN(3 downto 0)=>xRX_XFER_EN(3 downto 0),
                xTX_ADDR0(13 downto 0)=>xTX_ADDR0(13 downto 0),
                xTX_ADDR1(13 downto 0)=>xTX_ADDR1(13 downto 0),
                xTX_ADDR2(13 downto 0)=>xTX_ADDR2(13 downto 0),
                xTX_ADDR3(13 downto 0)=>xTX_ADDR3(13 downto 0),
                xTX_XFER_EN(3 downto 0)=>xTX_XFER_EN(3 downto 0),
                xUPSTREAM_CLR(3 downto 0)=>xUPSTREAM_CLR(3 downto 0),
                xUPSTREAM_TRIG(3 downto 0)=>xUPSTREAM_TRIG(3 downto 0));
   
   aurora_testblock : TEST_BLOCK
      port map (xCLEAR_LAM=>XLXN_2962,
                xCLK=>xCLK,
                xDONE_TX_XFER(3 downto 0)=>xDONE_TX_XFER(3 downto 0),
                xLAM(3 downto 0)=>xLAM(3 downto 0),
                xRX_ADDR0(13 downto 0)=>xRX_ADDR0(13 downto 0),
                xRX_ADDR1(13 downto 0)=>xRX_ADDR1(13 downto 0),
                xRX_ADDR2(13 downto 0)=>xRX_ADDR2(13 downto 0),
                xRX_ADDR3(13 downto 0)=>xRX_ADDR3(13 downto 0),
                xRX_DATA0(23 downto 0)=>xRX_DATA0(23 downto 0),
                xRX_DATA1(23 downto 0)=>xRX_DATA1(23 downto 0),
                xRX_DATA2(23 downto 0)=>xRX_DATA2(23 downto 0),
                xRX_DATA3(23 downto 0)=>xRX_DATA3(23 downto 0),
                xRX_LENGTH0(13 downto 0)=>xRX_LENGTH0(13 downto 0),
                xRX_LENGTH1(13 downto 0)=>xRX_LENGTH1(13 downto 0),
                xRX_LENGTH2(13 downto 0)=>xRX_LENGTH2(13 downto 0),
                xRX_LENGTH3(13 downto 0)=>xRX_LENGTH3(13 downto 0),
                xRX_XFER_EN(3 downto 0)=>xRX_XFER_EN(3 downto 0),
                xTX_ADDR0(13 downto 0)=>xTX_ADDR0(13 downto 0),
                xTX_ADDR1(13 downto 0)=>xTX_ADDR1(13 downto 0),
                xTX_ADDR2(13 downto 0)=>xTX_ADDR2(13 downto 0),
                xTX_ADDR3(13 downto 0)=>xTX_ADDR3(13 downto 0),
                xTX_XFER_EN(3 downto 0)=>xTX_XFER_EN(3 downto 0),
                xUPSTREAM_CLR(3 downto 0)=>xUPSTREAM_CLR(3 downto 0),
                xUPSTREAM_TRIG(3 downto 0)=>xUPSTREAM_TRIG(3 downto 0),
                xCLR_LAM(3 downto 0)=>xCLR_LAM(3 downto 0),
                xDOWNSTREAM_CLR(3 downto 0)=>xDOWNSTREAM_CLR(3 downto 0),
                xDOWNSTREAM_TRIG(3 downto 0)=>xDOWNSTREAM_TRIG(3 downto 0),
                xSTART_TX_XFER(3 downto 0)=>xSTART_TX_XFER(3 downto 0),
                xTX_DATA0(23 downto 0)=>xTX_DATA0(23 downto 0),
                xTX_DATA1(23 downto 0)=>xTX_DATA1(23 downto 0),
                xTX_DATA2(23 downto 0)=>xTX_DATA2(23 downto 0),
                xTX_DATA3(23 downto 0)=>xTX_DATA3(23 downto 0),
                xTX_LENGTH0(13 downto 0)=>xTX_LENGTH0(13 downto 0),
                xTX_LENGTH1(13 downto 0)=>xTX_LENGTH1(13 downto 0),
                xTX_LENGTH2(13 downto 0)=>xTX_LENGTH2(13 downto 0),
                xTX_LENGTH3(13 downto 0)=>xTX_LENGTH3(13 downto 0));
   
   dspclocks : dsp_clocks
      port map (reset=>xCLR_ALL,
                xBCLK=>buffered_BCLK,
                dsp0_clock=>dsp0_clock,
                dsp0_ppi0_clock=>dsp0_ppi0_clock,
                dsp0_ppi1_clock=>dsp0_ppi1_clock,
                dsp1_clock=>dsp1_clock,
                dsp1_ppi0_clock=>dsp1_ppi0_clock,
                dsp1_ppi1_clock=>dsp1_ppi1_clock,
                xdsp_clock=>xdsp_clock,
                xdsp_ppi_clock=>xdsp_ppi_clock);
   
   dspcontrol : dsp_control
      port map (dsp0_async_ready=>dsp0_async_ready,
                dsp0_bmode0=>dsp0_bmode0,
                dsp0_bmode1=>dsp0_bmode1,
                dsp0_bus_ready=>dsp0_bus_ready,
                dsp0_bypass=>dsp0_bypass,
                dsp0_nmi0=>dsp0_nmi0,
                dsp0_nmi1=>dsp0_nmi1,
                dsp1_async_ready=>dsp1_async_ready,
                dsp1_bmode0=>dsp1_bmode0,
                dsp1_bmode1=>dsp1_bmode1,
                dsp1_bus_ready=>dsp1_bus_ready,
                dsp1_bypass=>dsp1_bypass,
                dsp1_nmi0=>dsp1_nmi0,
                dsp1_nmi1=>dsp1_nmi1,
                xbmode0=>open,
                xbmode1=>open,
                xbypass=>xbypass);
   
   dspjtag : dsp_jtag
      port map (DSP_EMU=>DSP_EMU,
                dsp0_tdo=>DSP_TDO_0,
                dsp1_tdo=>DSP_TDO_1,
                TCK_JTAG=>TCK_JTAG,
                TDI_JTAG=>TDI_JTAG,
                TMS_JTAG=>TMS_JTAG,
                TRST_JTAG=>TRST_JTAG,
                dsp0_tck=>DSP_TCK_0,
                dsp0_tdi=>DSP_TDI_0,
                dsp0_tms=>DSP_TMS_0,
                dsp0_trst=>DSP_TRST_0,
                dsp1_tck=>DSP_TCK_1,
                dsp1_tdi=>DSP_TDI_1,
                dsp1_tms=>DSP_TMS_1,
                dsp1_trst=>DSP_TRST_1,
                EMU_JTAG=>EMU_JTAG,
                TDO_JTAG=>TDO_JTAG);
   
   dspreset : dsp_reset
      port map (dsp_clock=>xdsp_clock,
                dsp_pll_bypass=>xbypass,
                dsp_reset_button=>XLXN_1754,
                dsp0_reset=>dsp0_reset,
                dsp1_reset=>dsp1_reset,
                xdsp_reset=>open);
   
   obuf12_to_16 : obuf12to16_MUSER_TOP
      port map (i(11 downto 0)=>XLXN_2966(11 downto 0),
                o(15 downto 0)=>dsp0_ppi0(15 downto 0));
   
   ppi_block : ppi
      port map (data_pending=>XLXN_2629,
                ppi_clock=>xdsp_ppi_clock,
                reset=>xCLR_ALL,
                fifo_address(14 downto 0)=>xRADDR0(14 downto 0),
                last=>clear_lam,
                sync=>dsp0_ppi0_sync1,
                xppi_fifo_counting=>XLXN_2633);
   
   RESET_CTRL : PROGRESET
      port map (CLK=>xIFCLK,
                WAKEUP=>xWAKEUP,
                Clr_all=>xCLR_ALL,
                GLRST=>xRESET);
   
   USBio : USB_IO
      port map (CLKOUT=>CLKOUT,
                CTL0=>CTL0,
                CTL1=>CTL1,
                CTL2=>CTL2,
                IFCLK=>IFCLK,
                PA0=>PA0,
                PA1=>PA1,
                PA3=>PA3,
                PA7=>PA7,
                WAKEUP=>WAKEUP,
                xDATA_OUT(15 downto 0)=>xFPGA_DATA(15 downto 0),
                xFIFOADR0=>xFIFOADR(0),
                xFIFOADR1=>xFIFOADR(1),
                xPKTEND=>xPKTEND,
                xSLOE=>xSLOE,
                xSLRD=>xSLRD,
                xSLWR=>xSLWR,
                xTOGGLE=>xTOGGLE,
                PA2=>PA2,
                PA4=>PA4,
                PA5=>PA5,
                PA6=>PA6,
                RDY0=>RDY0,
                RDY1=>RDY1,
                xFLAGA=>xFLAGA,
                xFLAGB=>xFLAGB,
                xFLAGC=>xFLAGC,
                xIFCLK=>xIFCLK,
                xUSB_DATA(15 downto 0)=>xUSB_DATA(15 downto 0),
                xWAKEUP=>xWAKEUP,
                FD(15 downto 0)=>FD(15 downto 0));
   
   usbmess : MESS
      port map (xCLR_ALL=>xCLR_ALL,
                xDONE=>xDONE,
                xREAD(23 downto 0)=>xREAD0(23 downto 0),
                xSLWR=>xSLWR,
                xSTART=>xSTART,
                active=>open,
                xFPGA_DATA(15 downto 0)=>xFPGA_DATA(15 downto 0),
                xRADDR=>open);
   
   USB_read : USBread
      port map (xFLAGA=>xFLAGA,
                xIFCLK=>xIFCLK,
                xRESET=>xRESET,
                xUSB_DATA(15 downto 0)=>xUSB_DATA(15 downto 0),
                xWBUSY=>xWBUSY,
                xFIFOADR(1 downto 0)=>xFIFOADR(1 downto 0),
                xRBUSY=>xRBUSY,
                xSLOE=>xSLOE,
                xSLRD=>xSLRD,
                xSOFT_TRIG=>xSOFT_TRIG,
                xSYNC_USB=>xSYNC_USB,
                xTOGGLE=>xTOGGLE,
                xTX_LENGTH=>open,
                xWADDR=>open,
                xWRITE=>open,
                xW_EN=>open,
                xW_STRB=>open);
   
   USB_write : USBwrite
      port map (xFLAGB=>xFLAGB,
                xFLAGC=>xFLAGC,
                xIFCLK=>xIFCLK,
                xRBUSY=>xRBUSY,
                xRESET=>xRESET,
                xSTART=>xSTART,
                xSYNC_USB=>xSYNC_USB,
                xactive=>open,
                xDONE=>xDONE,
                xPKTEND=>xPKTEND,
                xSLWR=>xSLWR,
                xWBUSY=>xWBUSY);
   
   XLXI_209 : OBUF
      port map (I=>XLXN_2628,
                O=>mon1);
   
   XLXI_229 : OBUF
      port map (I=>XLXN_2627,
                O=>mon2);
   
   XLXI_230 : IBUFG
      port map (I=>BCLK,
                O=>XLXN_2010);
   
   XLXI_679 : IBUF
      port map (I=>dsp0_pf0,
                O=>XLXN_2629);
   
   XLXI_705 : BUFG
      port map (I=>XLXN_2010,
                O=>buffered_BCLK);
   
   XLXI_823 : OBUF
      port map (I=>XLXN_2625,
                O=>mon4);
   
   XLXI_824 : IBUF
      port map (I=>dsp0_pf1,
                O=>XLXN_2628);
   
   XLXI_825 : OBUF
      port map (I=>XLXN_2624,
                O=>mon5);
   
   XLXI_826 : IBUF
      port map (I=>dsp0_pf2,
                O=>XLXN_2627);
   
   XLXI_827 : OBUF
      port map (I=>XLXN_2623,
                O=>mon6);
   
   XLXI_828 : IBUF
      port map (I=>dsp0_pf3,
                O=>XLXN_2626);
   
   XLXI_866 : GND
      port map (G=>XLXN_1754);
   
   XLXI_894 : OBUF
      port map (I=>XLXN_2626,
                O=>mon3);
   
   XLXI_895 : IBUF
      port map (I=>dsp0_pf4,
                O=>XLXN_2625);
   
   XLXI_896 : IBUF
      port map (I=>dsp0_pf5,
                O=>XLXN_2624);
   
   XLXI_897 : IBUF
      port map (I=>dsp0_pf6,
                O=>XLXN_2623);
   
   XLXI_915 : OBUF
      port map (I=>XLXN_2629,
                O=>mon0);
   
   XLXI_917 : OBUF
      port map (I=>XLXN_2633,
                O=>mon7);
   
   XLXI_918 : BUF
      port map (I=>XLXN_2953,
                O=>xSTART);
   
   XLXI_954 : synchronous_latch_MUSER_TOP
      port map (clear=>XLXN_2956,
                clock=>xCLK,
                slatch=>xSOFT_TRIG,
                Q=>XLXN_2953);
   
   XLXI_955 : OR2
      port map (I0=>xCLR_ALL,
                I1=>xDONE,
                O=>XLXN_2956);
   
   XLXI_956 : BUF
      port map (I=>xRX_XFER_EN(0),
                O=>XLXN_2961(0));
   
   XLXI_957 : OR2
      port map (I0=>clear_lam,
                I1=>xCLR_ALL,
                O=>XLXN_2962);
   
   XLXI_958 : OBUF
      port map (I=>XLXN_2964,
                O=>led_green);
   
   XLXI_959 : synchronous_latch_MUSER_TOP
      port map (clear=>xCLR_ALL,
                clock=>xCLK,
                slatch=>xLAM(0),
                Q=>XLXN_2964);
   
   XLXI_960 : INV
      port map (I=>xdsp_ppi_clock,
                O=>XLXN_2965);
   
   XLXI_961 : ram16384x24
      port map (addra(13 downto 0)=>xRX_ADDR0(13 downto 0),
                addrb(14 downto 0)=>xRADDR0(14 downto 0),
                clka=>xCLK,
                clkb=>XLXN_2965,
                dina(23 downto 0)=>xRX_DATA0(23 downto 0),
                wea(0)=>XLXN_2961(0),
                doutb(11 downto 0)=>XLXN_2966(11 downto 0));
   
end BEHAVIORAL;


