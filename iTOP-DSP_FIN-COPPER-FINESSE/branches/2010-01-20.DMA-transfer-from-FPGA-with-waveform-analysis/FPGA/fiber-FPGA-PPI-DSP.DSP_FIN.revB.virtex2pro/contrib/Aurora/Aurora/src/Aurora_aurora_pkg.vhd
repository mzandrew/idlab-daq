--
--      Project:  Aurora Module Generator version 3.0
--
--         Date:  $Date: 2008/07/21 10:19:45 $
--          Tag:  $Name: i+IP+144966 $
--         File:  $RCSfile: aurora_pkg_vhd.ejava,v $
--          Rev:  $Revision: 1.1.2.2 $
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
--  AURORA
--
--
--  Description: Aurora Package Definition
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package AURORA_PKG is

    function std_bool (EXP_IN : in boolean) return std_logic;

end;

package body AURORA_PKG is

    function std_bool (EXP_IN : in boolean) return std_logic is

    begin

        if (EXP_IN) then

            return('1');

        else

            return('0');

        end if;

    end std_bool;

end;
