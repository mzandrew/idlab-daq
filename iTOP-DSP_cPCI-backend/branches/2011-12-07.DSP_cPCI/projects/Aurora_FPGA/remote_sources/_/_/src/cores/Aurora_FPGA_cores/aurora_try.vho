
-- VHDL Instantiation Created from source file aurora_try.vhd -- 14:08:46 06/28/2011
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
	COMPONENT aurora_try
	PORT(
		S_AXI_TX_TDATA : IN std_logic_vector(0 to 31);
		S_AXI_TX_TVALID : IN std_logic;
		DO_CC : IN std_logic;
		WARN_CC : IN std_logic;
		RXP : IN std_logic;
		RXN : IN std_logic;
		GTPD0 : IN std_logic;
		USER_CLK : IN std_logic;
		SYNC_CLK : IN std_logic;
		RESET : IN std_logic;
		POWER_DOWN : IN std_logic;
		LOOPBACK : IN std_logic_vector(2 downto 0);
		GT_RESET : IN std_logic;          
		S_AXI_TX_TREADY : OUT std_logic;
		M_AXI_RX_TDATA : OUT std_logic_vector(0 to 31);
		M_AXI_RX_TVALID : OUT std_logic;
		TXP : OUT std_logic;
		TXN : OUT std_logic;
		HARD_ERR : OUT std_logic;
		SOFT_ERR : OUT std_logic;
		CHANNEL_UP : OUT std_logic;
		LANE_UP : OUT std_logic;
		GTPCLKOUT : OUT std_logic;
		TX_LOCK : OUT std_logic
		);
	END COMPONENT;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
	Inst_aurora_try: aurora_try PORT MAP(
		S_AXI_TX_TDATA => ,
		S_AXI_TX_TVALID => ,
		S_AXI_TX_TREADY => ,
		M_AXI_RX_TDATA => ,
		M_AXI_RX_TVALID => ,
		DO_CC => ,
		WARN_CC => ,
		RXP => ,
		RXN => ,
		TXP => ,
		TXN => ,
		GTPD0 => ,
		HARD_ERR => ,
		SOFT_ERR => ,
		CHANNEL_UP => ,
		LANE_UP => ,
		USER_CLK => ,
		SYNC_CLK => ,
		RESET => ,
		POWER_DOWN => ,
		LOOPBACK => ,
		GT_RESET => ,
		GTPCLKOUT => ,
		TX_LOCK => 
	);



-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- You must compile the wrapper file aurora_try.vhd when simulating
-- the core, aurora_try. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".
