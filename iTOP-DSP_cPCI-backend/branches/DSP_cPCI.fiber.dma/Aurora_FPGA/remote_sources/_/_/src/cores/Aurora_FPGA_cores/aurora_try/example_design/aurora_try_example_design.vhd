-- (c) Copyright 2008 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- 
---------------------------------------------------------------------------------------------
--  AURORA_EXAMPLE
--
--  Aurora Generator
--
--
--
--  Description: Sample Instantiation of a 1 4-byte lane module.
--               Only tests initialization in hardware.
--
--         

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_MISC.all;
use WORK.AURORA_PKG.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
-- synthesis translate_on

entity aurora_try_example_design is
   generic(
           USE_CHIPSCOPE          : integer :=   0;
           SIM_GTPRESET_SPEEDUP   : integer :=   1      --Set to 1 to speed up sim reset
         );
    port (

    -- User I/O

            RESET             : in std_logic;
            HARD_ERR          : out std_logic;
            SOFT_ERR          : out std_logic;
            ERR_COUNT         : out std_logic_vector(0 to 7);
            LANE_UP           : out std_logic;
            CHANNEL_UP        : out std_logic;
           INIT_CLK           : in std_logic;
            GT_RESET_IN       : in  std_logic;

    -- Clocks

           GTPD0_P    : in  std_logic;
           GTPD0_N    : in  std_logic;

   -- GT I/O

            RXP               : in std_logic;
            RXN               : in std_logic;
            TXP               : out std_logic;
            TXN               : out std_logic

         );

end aurora_try_example_design;

architecture MAPPED of aurora_try_example_design is
  attribute core_generation_info           : string;
  attribute core_generation_info of MAPPED : architecture is "aurora_try,aurora_8b10b_v6_2,{user_interface=AXI_4_Streaming, backchannel_mode=Sidebands, c_aurora_lanes=1, c_column_used=None, c_gt_clock_1=GTPD0, c_gt_clock_2=None, c_gt_loc_1=1, c_gt_loc_10=X, c_gt_loc_11=X, c_gt_loc_12=X, c_gt_loc_13=X, c_gt_loc_14=X, c_gt_loc_15=X, c_gt_loc_16=X, c_gt_loc_17=X, c_gt_loc_18=X, c_gt_loc_19=X, c_gt_loc_2=X, c_gt_loc_20=X, c_gt_loc_21=X, c_gt_loc_22=X, c_gt_loc_23=X, c_gt_loc_24=X, c_gt_loc_25=X, c_gt_loc_26=X, c_gt_loc_27=X, c_gt_loc_28=X, c_gt_loc_29=X, c_gt_loc_3=X, c_gt_loc_30=X, c_gt_loc_31=X, c_gt_loc_32=X, c_gt_loc_33=X, c_gt_loc_34=X, c_gt_loc_35=X, c_gt_loc_36=X, c_gt_loc_37=X, c_gt_loc_38=X, c_gt_loc_39=X, c_gt_loc_4=X, c_gt_loc_40=X, c_gt_loc_41=X, c_gt_loc_42=X, c_gt_loc_43=X, c_gt_loc_44=X, c_gt_loc_45=X, c_gt_loc_46=X, c_gt_loc_47=X, c_gt_loc_48=X, c_gt_loc_5=X, c_gt_loc_6=X, c_gt_loc_7=X, c_gt_loc_8=X, c_gt_loc_9=X, c_lane_width=4, c_line_rate=3.0, c_nfc=false, c_nfc_mode=IMM, c_refclk_frequency=150.0, c_simplex=false, c_simplex_mode=TX, c_stream=true, c_ufc=false, flow_mode=None, interface_mode=Streaming, dataflow_config=Duplex}";

-- Parameter Declarations --

    constant DLY : time := 1 ns;

-- External Register Declarations --

    signal HARD_ERR_Buffer    : std_logic;
    signal SOFT_ERR_Buffer    : std_logic;
    signal LANE_UP_Buffer     : std_logic;
    signal CHANNEL_UP_Buffer  : std_logic;
    signal TXP_Buffer         : std_logic;
    signal TXN_Buffer         : std_logic;

-- Internal Register Declarations --

    signal gt_reset_i         : std_logic; 
    signal system_reset_i     : std_logic;
 
-- Wire Declarations --

    -- Stream TX Interface

    signal tx_d_i             : std_logic_vector(0 to 31);
    signal tx_src_rdy_n_i     : std_logic;

    signal tx_dst_rdy_n_i     : std_logic;

    -- Stream RX Interface

    signal rx_d_i             : std_logic_vector(0 to 31);
    signal rx_src_rdy_n_i     : std_logic;


    -- V5 Reference Clock Interface
    signal GTPD0_left_i      : std_logic;

    -- Error Detection Interface

    signal hard_err_i       : std_logic;
    signal soft_err_i       : std_logic;

    -- Status

    signal channel_up_i       : std_logic;
    signal lane_up_i          : std_logic;

    -- Clock Compensation Control Interface

    signal warn_cc_i          : std_logic;
    signal do_cc_i            : std_logic;

    -- System Interface

    signal pll_not_locked_i   : std_logic;
    signal user_clk_i         : std_logic;
    signal sync_clk_i         : std_logic;
    signal reset_i            : std_logic;
    signal power_down_i       : std_logic;
    signal loopback_i         : std_logic_vector(2 downto 0);
    signal tx_lock_i          : std_logic;
    signal gtpclkout_i        : std_logic;
    signal buf_gtpclkout_i    : std_logic;
    --Frame check signals
    signal err_count_i      : std_logic_vector(0 to 7);
    signal ERR_COUNT_Buffer : std_logic_vector(0 to 7);

-- VIO Signals
   signal icon_to_vio_i       : std_logic_vector (35 downto 0);
   signal sync_in_i           : std_logic_vector (63 downto 0);
   signal sync_out_i          : std_logic_vector (0 to 15);


   signal lane_up_i_i  	      : std_logic;
   signal tx_lock_i_i  	      : std_logic;
   signal lane_up_reduce_i    : std_logic;
   signal rst_cc_module_i     : std_logic;

   signal tied_to_ground_i    :   std_logic;   
   signal tied_to_gnd_vec_i   :   std_logic_vector(0 to 31);

   -- TX AXI PDU I/F signals
   signal tx_data_i           :   std_logic_vector(0 to 31);
   signal tx_tvalid_i         :   std_logic;
   signal tx_tready_i         :   std_logic;


   -- RX AXI PDU I/F signals
   signal rx_data_i           :   std_logic_vector(0 to 31);
   signal rx_tvalid_i         :   std_logic;
   attribute ASYNC_REG        : string;
   attribute ASYNC_REG of tx_lock_i  : signal is "TRUE";

-- Component Declarations --

   -- AXI Shim modules
   component aurora_try_LL_TO_AXI is
   generic
   (
    DATA_WIDTH  : integer :=   16;      -- DATA bus width
    USE_UFC_REM : integer :=   0;       -- UFC REM bus width identifier
    STRB_WIDTH  : integer :=   2;       -- STROBE bus width
    REM_WIDTH   : integer :=   1        -- REM bus width
   );   

   port
   (

    ----------------------  AXI4-S Interface -------------------------------
    AXI4_S_OP_TDATA                 : out   std_logic_vector (0 to DATA_WIDTH-1);
    AXI4_S_OP_TKEEP                 : out   std_logic_vector (0 to STRB_WIDTH-1);
    AXI4_S_OP_TVALID                : out   std_logic;
    AXI4_S_OP_TLAST                 : out   std_logic;
    AXI4_S_IP_TREADY                : in    std_logic;

    ----------------------  LocalLink Interface ----------------------------
    LL_IP_DATA                      : in    std_logic_vector (0 to DATA_WIDTH-1);
    LL_IP_REM                       : in    std_logic_vector (0 to REM_WIDTH-1);
    LL_IP_SRC_RDY_N                 : in    std_logic;
    LL_IP_SOF_N                     : in    std_logic;
    LL_IP_EOF_N                     : in    std_logic;
    LL_OP_DST_RDY_N                 : out   std_logic

   );
   end component;

   component aurora_try_AXI_TO_LL is
   generic
   (
    DATA_WIDTH  : integer :=   16;      -- DATA bus width
    STRB_WIDTH  : integer :=   2;       -- STROBE bus width
    REM_WIDTH   : integer :=   1;       -- REM bus width
    USE_UFC_REM : integer :=   0        -- UFC REM bus width identifier
   );   

   port
   (

     ----------------------  AXI4-S Interface -------------------------------
     AXI4_S_IP_TX_TDATA              : in    std_logic_vector (0 to DATA_WIDTH-1);
     AXI4_S_IP_TX_TKEEP              : in    std_logic_vector (0 to STRB_WIDTH-1);
     AXI4_S_IP_TX_TVALID             : in    std_logic;
     AXI4_S_IP_TX_TLAST              : in    std_logic;
     AXI4_S_OP_TX_TREADY             : out   std_logic;

     ----------------------  LocalLink Interface ----------------------------
     LL_OP_DATA                      : out   std_logic_vector (0 to DATA_WIDTH-1);
     LL_OP_REM                       : out   std_logic_vector (0 to REM_WIDTH -1);
     LL_OP_SRC_RDY_N                 : out   std_logic;
     LL_OP_SOF_N                     : out   std_logic;
     LL_OP_EOF_N                     : out   std_logic;
     LL_IP_DST_RDY_N                 : in    std_logic;

     ----------------------  System Interface ----------------------------
     USER_CLK                        : in    std_logic;
     RESET                           : in    std_logic;
     CHANNEL_UP                      : in    std_logic

   );
   end component;
    
    component IBUFDS
        port (

                O : out std_ulogic;
                I : in std_ulogic;
                IB : in std_ulogic);

    end component;

    component BUFIO2 

    generic(

      DIVIDE_BYPASS : boolean := TRUE;  -- TRUE, FALSE
      DIVIDE        : integer := 1;     -- {1..8}
      I_INVERT      : boolean := FALSE; -- TRUE, FALSE
      USE_DOUBLER   : boolean := FALSE  -- TRUE, FALSE
      );

    port(
      DIVCLK       : out std_ulogic;
      IOCLK        : out std_ulogic;
      SERDESSTROBE : out std_ulogic;

      I            : in  std_ulogic
    );
    end component;
    component IBUFG

        port (

                O : out std_ulogic;
                I : in  std_ulogic

             );
    
    end component;


    component aurora_try_CLOCK_MODULE
        port (
                GT_CLK                  : in std_logic;
                GT_CLK_LOCKED           : in std_logic;
                USER_CLK                : out std_logic;
                SYNC_CLK                : out std_logic;
                PLL_NOT_LOCKED          : out std_logic
             );
    end component;

    component aurora_try_RESET_LOGIC
        port (
                RESET                  : in std_logic;
                USER_CLK               : in std_logic;
                INIT_CLK               : in std_logic;
                GT_RESET_IN            : in std_logic;
                TX_LOCK_IN             : in std_logic;
                PLL_NOT_LOCKED         : in std_logic;

                SYSTEM_RESET           : out std_logic;
                GT_RESET_OUT           : out std_logic
             );
    end component;

    component aurora_try
        generic(
                 SIM_GTPRESET_SPEEDUP :integer := 1
               );
        port   (
         -- AXI TX Interface
                S_AXI_TX_TDATA         : in  std_logic_vector(0 to 31);
                S_AXI_TX_TVALID        : in  std_logic;
                S_AXI_TX_TREADY        : out std_logic;

                -- AXI RX Interface
                M_AXI_RX_TDATA         : out std_logic_vector(0 to 31);
                M_AXI_RX_TVALID        : out std_logic;
        -- GT Serial I/O

                RXP              : in std_logic;
                RXN              : in std_logic;

                TXP              : out std_logic;
                TXN              : out std_logic;

        -- GT Reference Clock Interface

                GTPD0    : in std_logic;
        -- Error Detection Interface

                HARD_ERR       : out std_logic;
                SOFT_ERR       : out std_logic;

        -- Status

                CHANNEL_UP       : out std_logic;
                LANE_UP          : out std_logic;

        -- Clock Compensation Control Interface

                WARN_CC          : in std_logic;
                DO_CC            : in std_logic;

        -- System Interface

                USER_CLK         : in std_logic;
                SYNC_CLK         : in std_logic;
                GT_RESET         : in std_logic;
                RESET            : in std_logic;
                POWER_DOWN       : in std_logic;
                LOOPBACK         : in std_logic_vector(2 downto 0);
                GTPCLKOUT        : out std_logic;
                TX_LOCK          : out std_logic
            );

    end component;


    component aurora_try_STANDARD_CC_MODULE

        port (

        -- Clock Compensation Control Interface

                WARN_CC        : out std_logic;
                DO_CC          : out std_logic;

        -- System Interface

                PLL_NOT_LOCKED : in std_logic;
                USER_CLK       : in std_logic;
                RESET          : in std_logic

             );

    end component;
    
 
    component aurora_try_FRAME_GEN
    port
    (
        -- User Interface
        TX_D            : out  std_logic_vector(0 to 31); 
        TX_SRC_RDY_N    : out  std_logic;
        TX_DST_RDY_N    : in   std_logic;  
  

        -- System Interface
        USER_CLK        : in  std_logic;   
        RESET           : in  std_logic;
        CHANNEL_UP      : in  std_logic
    ); 
    end component;
 
 
    component aurora_try_FRAME_CHECK
    port
    (
        -- User Interface
        RX_D            : in  std_logic_vector(0 to 31); 
        RX_SRC_RDY_N    : in  std_logic; 


        -- System Interface
        USER_CLK        : in  std_logic;   
        RESET           : in  std_logic;
        CHANNEL_UP      : in  std_logic;
        ERR_COUNT       : out std_logic_vector(0 to 7)
  
    );
    end component;

  -------------------------------------------------------------------
  --  ICON core component declaration
  -------------------------------------------------------------------
  component s6_icon
  
    port
    (
      control0    :   out std_logic_vector(35 downto 0)
    );
  end component;

  -------------------------------------------------------------------
  --  VIO core component declaration
  -------------------------------------------------------------------
  component s6_vio
  
    port
    (
      control     : in    std_logic_vector(35 downto 0);
      clk         : in    std_logic;
      sync_in     : in    std_logic_vector(63 downto 0);
      sync_out    : out   std_logic_vector(15 downto 0)
    );
  end component;

                                                                                
begin

    tied_to_ground_i    <= '0';

    lane_up_reduce_i    <=  lane_up_i;
    rst_cc_module_i     <=  not lane_up_reduce_i;  

    HARD_ERR  <= HARD_ERR_Buffer;
    SOFT_ERR  <= SOFT_ERR_Buffer;
    ERR_COUNT   <= ERR_COUNT_Buffer;
    LANE_UP     <= LANE_UP_Buffer;
    CHANNEL_UP  <= CHANNEL_UP_Buffer;
    TXP         <= TXP_Buffer;
    TXN         <= TXN_Buffer;

    -- ___________________________Clock Buffers________________________
      IBUFDS_i :  IBUFDS
      port map (
           I  => GTPD0_P ,
           IB => GTPD0_N ,
           O  => GTPD0_left_i
               );

    BUFIO2_i : BUFIO2
    generic map
    (
        DIVIDE                          =>      1,
        DIVIDE_BYPASS                   =>      TRUE
    )
    port map
    (
        I                               =>      gtpclkout_i,
        DIVCLK                          =>      buf_gtpclkout_i,
        IOCLK                           =>      open,
        SERDESSTROBE                    =>      open
    );
    -- Instantiate a clock module for clock division

    clock_module_i : aurora_try_CLOCK_MODULE
        port map (

                    GT_CLK              => buf_gtpclkout_i,
                    GT_CLK_LOCKED       => tx_lock_i,
                    USER_CLK            => user_clk_i,
                    SYNC_CLK            => sync_clk_i,
                    PLL_NOT_LOCKED      => pll_not_locked_i
                 );

    -- Register User I/O --

    -- Register User Outputs from core.

    process (user_clk_i)

    begin

        if (user_clk_i 'event and user_clk_i = '1') then

            HARD_ERR_Buffer  <= hard_err_i;
            SOFT_ERR_Buffer  <= soft_err_i;
            ERR_COUNT_Buffer <= err_count_i;
            LANE_UP_Buffer     <= lane_up_i;
            CHANNEL_UP_Buffer  <= channel_up_i;

        end if;

    end process;

    -- System Interface

    power_down_i     <= '0';
    loopback_i       <= "000";


    -- _______________________________ Module Instantiations ________________________--

    --_____________________________ RX AXI SHIM _______________________________
    frame_chk_axi_to_ll_pdu_i : aurora_try_AXI_TO_LL
    generic map
    (
       DATA_WIDTH           => 32,
       STRB_WIDTH           => 4,
       REM_WIDTH            => 2,
       USE_UFC_REM          => 0
    )
    port map
    (
      -- AXI4-S input signals
      AXI4_S_IP_TX_TVALID  => rx_tvalid_i,
      AXI4_S_OP_TX_TREADY  => OPEN,
      AXI4_S_IP_TX_TDATA   => rx_data_i,
      AXI4_S_IP_TX_TKEEP   => "0000",
      AXI4_S_IP_TX_TLAST   => tied_to_ground_i,

      -- LocalLink output Interface
      LL_OP_DATA           => rx_d_i,
      LL_OP_SOF_N          => OPEN,
      LL_OP_EOF_N          => OPEN,
      LL_OP_REM            => OPEN,
      LL_OP_SRC_RDY_N      => rx_src_rdy_n_i,
      LL_IP_DST_RDY_N      => tied_to_ground_i,

      -- System Interface
      USER_CLK              => user_clk_i,       
      RESET                 => reset_i,
      CHANNEL_UP            => channel_up_i
     );


    --Connect a frame checker to the user interface
    frame_check_i : aurora_try_FRAME_CHECK
    port map
    (
        -- User Interface
        RX_D            =>  rx_d_i, 
        RX_SRC_RDY_N    =>  rx_src_rdy_n_i,  

        -- System Interface
        USER_CLK        =>  user_clk_i,   
        RESET           =>  reset_i,
        CHANNEL_UP      =>  channel_up_i,
        ERR_COUNT       =>  err_count_i
  
    );

    --_____________________________ TX AXI SHIM _______________________________
    frame_gen_ll_to_axi_pdu_i : aurora_try_LL_TO_AXI 
    generic map 
    (
       DATA_WIDTH           => 32,
       STRB_WIDTH           => 4,
       REM_WIDTH            => 2
    )

    port map 
    (
      LL_IP_DATA            => tx_d_i,
      LL_IP_SOF_N           => tied_to_ground_i,
      LL_IP_EOF_N           => tied_to_ground_i,
      LL_IP_REM             => "00",
      LL_IP_SRC_RDY_N       => tx_src_rdy_n_i,
      LL_OP_DST_RDY_N       => tx_dst_rdy_n_i,

      AXI4_S_OP_TVALID      => tx_tvalid_i,
      AXI4_S_OP_TDATA       => tx_data_i,
      AXI4_S_OP_TKEEP       => OPEN,
      AXI4_S_OP_TLAST       => OPEN,
      AXI4_S_IP_TREADY      => tx_tready_i

    );

    --Connect a frame generator to the user interface
    frame_gen_i : aurora_try_FRAME_GEN
    port map
    (
        -- User Interface
        TX_D            =>  tx_d_i,
            TX_SRC_RDY_N    =>  tx_src_rdy_n_i,
        TX_DST_RDY_N    =>  tx_dst_rdy_n_i,    


        -- System Interface
        USER_CLK        =>  user_clk_i,
        RESET           =>  reset_i,
        CHANNEL_UP      =>  channel_up_i
    ); 




    -- Module Instantiations --

    aurora_module_i : aurora_try
        generic map(
                    SIM_GTPRESET_SPEEDUP => SIM_GTPRESET_SPEEDUP
                   )
        port map   (
        -- AXI TX Interface

                    S_AXI_TX_TDATA         => tx_data_i,
                    S_AXI_TX_TVALID        => tx_tvalid_i,

                    S_AXI_TX_TREADY        => tx_tready_i,

        --  AXI RX Interface

                    M_AXI_RX_TDATA        => rx_data_i,
                    M_AXI_RX_TVALID       => rx_tvalid_i,

        -- GT Serial I/O

                    RXP              => RXP,
                    RXN              => RXN,
                    TXP              => TXP_Buffer,
                    TXN              => TXN_Buffer,

        -- GT Reference Clock Interface
                   GTPD0    => GTPD0_left_i,

        -- Error Detection Interface

                    HARD_ERR       => hard_err_i,
                    SOFT_ERR       => soft_err_i,

        -- Status

                    CHANNEL_UP       => channel_up_i,
                    LANE_UP          => lane_up_i,

        -- Clock Compensation Control Interface

                    WARN_CC          => warn_cc_i,
                    DO_CC            => do_cc_i,

        -- System Interface

                    USER_CLK         => user_clk_i,
                    SYNC_CLK         => sync_clk_i,
                    RESET            => reset_i,
                    POWER_DOWN       => power_down_i,
                    LOOPBACK         => loopback_i,
                    GT_RESET         => gt_reset_i,
                    GTPCLKOUT        => gtpclkout_i,
                    TX_LOCK          => tx_lock_i
                 );

    standard_cc_module_i : aurora_try_STANDARD_CC_MODULE

        port map (

        -- Clock Compensation Control Interface

                    WARN_CC        => warn_cc_i,
                    DO_CC          => do_cc_i,

        -- System Interface

                    PLL_NOT_LOCKED => pll_not_locked_i,
                    USER_CLK       => user_clk_i,
                    RESET          => rst_cc_module_i 

                 );

    reset_logic_i : aurora_try_RESET_LOGIC
        port map (
                    RESET            => RESET,
                    USER_CLK         => user_clk_i,
                    INIT_CLK         => INIT_CLK,
                    GT_RESET_IN      => GT_RESET_IN,
                    TX_LOCK_IN       => tx_lock_i,
                    PLL_NOT_LOCKED   => pll_not_locked_i,

                    SYSTEM_RESET     => system_reset_i,
                    GT_RESET_OUT     => gt_reset_i
                 );


 chipscope1 : if USE_CHIPSCOPE = 1 generate

   lane_up_i_i    <=  lane_up_i;
   tx_lock_i_i    <= '1'  and tx_lock_i;

  --Shared VIO Inputs
   sync_in_i(15 downto 0)  <= tx_d_i(0 to 15);
   sync_in_i(31 downto 16) <= rx_d_i(0 to 15);
   sync_in_i(39 downto 32) <= err_count_i;
   sync_in_i(58)           <= soft_err_i;
   sync_in_i(59)           <= hard_err_i;
   sync_in_i(60)           <= tx_lock_i_i;
   sync_in_i(61)           <= pll_not_locked_i;
   sync_in_i(62)           <= lane_up_i_i;
   sync_in_i(63)           <= channel_up_i;

 

  -------------------------------------------------------------------
  --  ICON core instance
  -------------------------------------------------------------------
  i_icon : s6_icon
  
    port map
    (
      control0    => icon_to_vio_i
    );

 
  -------------------------------------------------------------------
  --  VIO core instance
  -------------------------------------------------------------------
  i_vio : s6_vio
  
    port map
    (
      control   => icon_to_vio_i,
      clk       => user_clk_i,
      sync_in   => sync_in_i,
      sync_out  => sync_out_i
    );
end generate chipscope1;

no_chipscope1 : if USE_CHIPSCOPE = 0 generate
   sync_in_i  <= (others=>'0');
end generate no_chipscope1;

chipscope2 : if USE_CHIPSCOPE = 1 generate
 -- Shared VIO Outputs
    reset_i <= system_reset_i or sync_out_i(0);
end generate chipscope2;

no_chipscope2 : if USE_CHIPSCOPE = 0 generate
 -- Shared VIO Outputs
    reset_i <= system_reset_i;
end generate no_chipscope2;

end MAPPED;
