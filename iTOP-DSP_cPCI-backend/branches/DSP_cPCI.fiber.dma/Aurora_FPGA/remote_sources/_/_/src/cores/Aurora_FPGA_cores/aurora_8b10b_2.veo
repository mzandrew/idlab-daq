


//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
// Instantiate the module
aurora_8b10b_2 instance_name (
    .S_AXI_TX_TDATA(S_AXI_TX_TDATA), 
    .S_AXI_TX_TVALID(S_AXI_TX_TVALID), 
    .S_AXI_TX_TREADY(S_AXI_TX_TREADY), 
    .M_AXI_RX_TDATA(M_AXI_RX_TDATA), 
    .M_AXI_RX_TVALID(M_AXI_RX_TVALID), 
    .DO_CC(DO_CC), 
    .WARN_CC(WARN_CC), 
    .RXP(RXP), 
    .RXN(RXN), 
    .TXP(TXP), 
    .TXN(TXN), 
    .GTPD0(GTPD0), 
    .HARD_ERR(HARD_ERR), 
    .SOFT_ERR(SOFT_ERR), 
    .CHANNEL_UP(CHANNEL_UP), 
    .LANE_UP(LANE_UP), 
    .USER_CLK(USER_CLK), 
    .SYNC_CLK(SYNC_CLK), 
    .RESET(RESET), 
    .POWER_DOWN(POWER_DOWN), 
    .LOOPBACK(LOOPBACK), 
    .GT_RESET(GT_RESET), 
    .GTPCLKOUT(GTPCLKOUT), 
    .TX_LOCK(TX_LOCK)
    );


// INST_TAG_END ------ End INSTANTIATION Template ---------