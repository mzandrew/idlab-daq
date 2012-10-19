--------------------------------------------------------------------------------
--
--      Project:  Aurora Module Generator version 3.0
--
--         Date:  $Date: 2008/07/21 10:19:46 $
--          Tag:  $Name: i+IP+144966 $
--         File:  $RCSfile: phase_align_vhd.ejava,v $
--          Rev:  $Revision: 1.1.2.3 $
--
--      Company:  Xilinx
--
--   Disclaimer:  XILINX IS PROVIDING THIS DESIGN, CODE, OR
--                INFORMATION "AS IS" SOLELY FOR USE IN DEVELOPING
--                PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY
--                PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
--                ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
--                APPLICATION OR STANDARD, XILINX IS MAKING NO
--                REPRESENTATION THAT THIS IMPLEMENTATION IS FREE
--                FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE
--                RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY
--                REQUIRE FOR YOUR IMPLEMENTATION.  XILINX
--                EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH
--                RESPECT TO THE ADEQUACY OF THE IMPLEMENTATION,
--                INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
--                REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
--                FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES
--                OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
--                PURPOSE.
--
--                (c) Copyright 2008 Xilinx, Inc.
--                All rights reserved.
--

--
--  PHASE_ALIGN
--
--
--
--  Description: Phase alignment circuit for the comma alignment signal.  Ensures
--               that the enable comma align signal is syncronous with the MGT
--               recovered clock.
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.all;
-- synthesis translate_on

entity Aurora_PHASE_ALIGN is

    port (

        -- Aurora Lane Interface

            ENA_COMMA_ALIGN : in std_logic ;

        -- MGT Interface

            RX_REC_CLK      : in std_logic ;
            ENA_CALIGN_REC  : out std_logic

         );

end Aurora_PHASE_ALIGN;

architecture RTL of Aurora_PHASE_ALIGN is

-- Parameter Declarations --

    constant DLY : time := 1 ns;

-- External Register Declarations --

    signal ENA_CALIGN_REC_Buffer : std_logic;

-- Internal Register Declarations --

    signal phase_align_flops_r : std_logic_vector(0 to 1);

    component FD
        port (

                Q : out std_ulogic;
                C : in  std_ulogic;
                D : in  std_ulogic

             );
     end component;

begin

    ENA_CALIGN_REC <= ENA_CALIGN_REC_Buffer;

-- Main Body of Code --

    -- To phase align the signal, we sample it using a flop clocked with the recovered
    -- clock.  We then sample the output of the first flop and pass it to the output.
    -- This ensures that the signal is not metastable, and prevents transitions from
    -- occuring except at the clock edge.  The comma alignment circuit cannot tolerate
    -- transitions except at the recovered clock edge.


phase_align_flops_0 : FD
   port map(
            D   => ENA_COMMA_ALIGN,
            C   => RX_REC_CLK,
            Q   => phase_align_flops_r(0)
           );

phase_align_flops_1 : FD
   port map(
            D   => phase_align_flops_r(0),
            C   => RX_REC_CLK,
            Q   => phase_align_flops_r(1)
           );

    ENA_CALIGN_REC_Buffer <= phase_align_flops_r(1);

end RTL;
