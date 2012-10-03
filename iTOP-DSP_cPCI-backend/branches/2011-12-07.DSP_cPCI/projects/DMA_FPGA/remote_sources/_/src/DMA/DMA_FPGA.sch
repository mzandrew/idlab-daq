<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DMA_fifo_rd_A1" />
        <signal name="fifo_data_valid_A1" />
        <signal name="fifo_data_valid_A2" />
        <signal name="fifo_data_valid_A3" />
        <signal name="fifo_data_valid_A4" />
        <signal name="fifo_data_A1(31:0)" />
        <signal name="fifo_data_A2(31:0)" />
        <signal name="fifo_data_A3(31:0)" />
        <signal name="fifo_data_A4(31:0)" />
        <signal name="PCI_CLK" />
        <signal name="WB_CLK" />
        <signal name="WB_RST_DELAY" />
        <signal name="DMA_fifo_cnt_A1(27:0)" />
        <signal name="fifo_length_A1(27:0)" />
        <signal name="fifo_length_A2(27:0)" />
        <signal name="fifo_length_B1(27:0)" />
        <signal name="fifo_length_B2(27:0)" />
        <signal name="DMA_fifo_dat_strobe_A1" />
        <signal name="fifo_prog_full_A1" />
        <signal name="fifo_prog_full_A2" />
        <signal name="fifo_prog_full_A3" />
        <signal name="fifo_prog_full_A4" />
        <signal name="DMA_fifo_dat_A1(31:0)" />
        <signal name="DMA_fifo_dat_strobe_current_A1" />
        <signal name="WB_RST" />
        <signal name="WB_CLK_2x" />
        <signal name="slave_we_A" />
        <signal name="slave_stb_A" />
        <signal name="DMA_merge_fifo_prog_full_A1" />
        <signal name="slave_dat_i_A(31:0)" />
        <signal name="slave_ack_A" />
        <signal name="slave_dat_en_A" />
        <signal name="slave_req_w_A1" />
        <signal name="DMA_merge_fifo_wr_en_A1" />
        <signal name="DMA_merge_fifo_wr_dat_A1(31:0)" />
        <signal name="slave_dat_o_A(31:0)" />
        <signal name="DMA_merge_fifo_prog_full_B1" />
        <signal name="DMA_merge_fifo_wr_en_B1" />
        <signal name="DMA_merge_fifo_wr_dat_B1(31:0)" />
        <signal name="WB_PCI_RST" />
        <signal name="slave_we_B" />
        <signal name="slave_stb_B" />
        <signal name="slave_dat_i_B(31:0)" />
        <signal name="slave_ack_B" />
        <signal name="slave_req_w_B1" />
        <signal name="slave_dat_o_B(31:0)" />
        <signal name="down_fifo_empty_A1" />
        <signal name="down_fifo_empty_A2" />
        <signal name="down_fifo_empty_B1" />
        <signal name="down_fifo_empty_B2" />
        <signal name="down_fifo_almost_empty_A1" />
        <signal name="down_fifo_almost_empty_A2" />
        <signal name="down_fifo_almost_empty_B1" />
        <signal name="down_fifo_almost_empty_B2" />
        <signal name="down_fifo_rdat_A1(31:0)" />
        <signal name="down_fifo_rdat_A2(31:0)" />
        <signal name="down_fifo_rdat_B1(31:0)" />
        <signal name="down_fifo_rdat_B2(31:0)" />
        <signal name="down_fifo_rd_A1" />
        <signal name="down_fifo_rd_A2" />
        <signal name="down_fifo_rd_B1" />
        <signal name="down_fifo_rd_B2" />
        <signal name="slave_req_r_1_A" />
        <signal name="slave_req_r_2_A" />
        <signal name="slave_req_r_1_B" />
        <signal name="slave_req_r_2_B" />
        <signal name="bus_s_rdy_A" />
        <signal name="bus_abort_A" />
        <signal name="bus_m_rdy_A" />
        <signal name="bus_s_rdy_B" />
        <signal name="bus_abort_B" />
        <signal name="bus_m_rdy_B" />
        <signal name="BUS_STB_PAD_A" />
        <signal name="BUS_WE_PAD_A" />
        <signal name="BUS_ACK_PAD_A" />
        <signal name="BUS_REQ_W_1_PAD_A" />
        <signal name="CLOCK_PAD_A" />
        <signal name="BUS_AD_PAD_A(31:0)" />
        <signal name="BUS_REQ_R_1_PAD_A" />
        <signal name="BUS_REQ_R_2_PAD_A" />
        <signal name="BUS_M_RDY_PAD_A" />
        <signal name="BUS_S_RDY_PAD_A" />
        <signal name="BUS_ABORT_PAD_A" />
        <signal name="CONTROL0(35:0)" />
        <signal name="CONTROL1(35:0)" />
        <signal name="CONTROL3(35:0)" />
        <signal name="BUS_STB_PAD_B" />
        <signal name="BUS_WE_PAD_B" />
        <signal name="BUS_ACK_PAD_B" />
        <signal name="BUS_REQ_W_1_PAD_B" />
        <signal name="CLOCK_PAD_B" />
        <signal name="BUS_AD_PAD_B(31:0)" />
        <signal name="BUS_REQ_R_1_PAD_B" />
        <signal name="BUS_REQ_R_2_PAD_B" />
        <signal name="BUS_M_RDY_PAD_B" />
        <signal name="BUS_S_RDY_PAD_B" />
        <signal name="BUS_ABORT_PAD_B" />
        <signal name="slave_dat_en_B" />
        <signal name="DMA_fifo_dat_strobe_A2" />
        <signal name="DMA_fifo_dat_strobe_B1" />
        <signal name="DMA_fifo_dat_strobe_B2" />
        <signal name="DMA_fifo_dat_strobe_current_A2" />
        <signal name="DMA_fifo_dat_strobe_current_B1" />
        <signal name="DMA_fifo_dat_strobe_current_B2" />
        <signal name="DMA_fifo_dat_A2(31:0)" />
        <signal name="DMA_fifo_dat_B1(31:0)" />
        <signal name="DMA_fifo_dat_B2(31:0)" />
        <signal name="DMA_fifo_cnt_A2(27:0)" />
        <signal name="DMA_fifo_cnt_B1(27:0)" />
        <signal name="DMA_fifo_cnt_B2(27:0)" />
        <signal name="DMA_fifo_rd_A2" />
        <signal name="DMA_fifo_rd_B1" />
        <signal name="DMA_fifo_rd_B2" />
        <signal name="DMA_merge_fifo_prog_full_A2" />
        <signal name="slave_req_w_A2" />
        <signal name="DMA_merge_fifo_wr_en_A2" />
        <signal name="DMA_merge_fifo_wr_dat_A2(31:0)" />
        <signal name="DMA_merge_fifo_prog_full_B2" />
        <signal name="slave_req_w_B2" />
        <signal name="DMA_merge_fifo_wr_en_B2" />
        <signal name="DMA_merge_fifo_wr_dat_B2(31:0)" />
        <signal name="BUS_REQ_W_2_PAD_A" />
        <signal name="BUS_REQ_W_2_PAD_B" />
        <signal name="CONTROL2(35:0)" />
        <signal name="CONTROL4(35:0)" />
        <signal name="CONTROL5(35:0)" />
        <signal name="rst_channel_0" />
        <signal name="rst_channel_1" />
        <signal name="rst_channel_2" />
        <signal name="rst_channel_3" />
        <signal name="channel_0_up" />
        <signal name="channel_1_up" />
        <signal name="channel_2_up" />
        <signal name="channel_3_up" />
        <signal name="dma_in_use" />
        <signal name="PCI_INTA" />
        <signal name="PCI_REQ" />
        <signal name="PCI_SERR" />
        <signal name="PCI_FRAME" />
        <signal name="PCI_IRDY" />
        <signal name="PCI_DEVSEL" />
        <signal name="PCI_TRDY" />
        <signal name="PCI_STOP" />
        <signal name="PCI_PAR" />
        <signal name="PCI_PERR" />
        <signal name="PCI_AD(31:0)" />
        <signal name="PCI_CBE(3:0)" />
        <signal name="PCI_RST" />
        <signal name="PCI_GNT" />
        <signal name="PCI_IDSEL" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="pulse_A" />
        <signal name="pulse_B" />
        <signal name="BOARD_IDENT_IN(5:0)" />
        <signal name="bc0_in" />
        <signal name="bc1_in" />
        <signal name="bc2_in" />
        <signal name="bc3_in" />
        <signal name="rst_channel_0_pad" />
        <signal name="rst_channel_1_pad" />
        <signal name="rst_channel_2_pad" />
        <signal name="rst_channel_3_pad" />
        <signal name="channel_0_up_pad" />
        <signal name="channel_1_up_pad" />
        <signal name="channel_2_up_pad" />
        <signal name="channel_3_up_pad" />
        <signal name="BOARD_IDENT(5)" />
        <signal name="BOARD_IDENT(4)" />
        <signal name="BOARD_IDENT(3)" />
        <signal name="BOARD_IDENT(2)" />
        <signal name="BOARD_IDENT(1)" />
        <signal name="BOARD_IDENT(0)" />
        <signal name="BOARD_IDENT(5:0)" />
        <signal name="BOARD_IDENT_IN(5)" />
        <signal name="BOARD_IDENT_IN(4)" />
        <signal name="BOARD_IDENT_IN(3)" />
        <signal name="BOARD_IDENT_IN(2)" />
        <signal name="BOARD_IDENT_IN(1)" />
        <signal name="BOARD_IDENT_IN(0)" />
        <signal name="bc0" />
        <signal name="bc1" />
        <signal name="bc2" />
        <signal name="bc3" />
        <signal name="PCLK" />
        <signal name="XLXN_7" />
        <signal name="LED_GREENX" />
        <signal name="XLXN_11" />
        <signal name="LED_GREEN" />
        <signal name="LED_RED" />
        <signal name="XLXN_21" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="start_pulse_A" />
        <signal name="end_pulse_A" />
        <signal name="start_pulse_B" />
        <signal name="end_pulse_B" />
        <signal name="start_pulse_A_in" />
        <signal name="end_pulse_A_in" />
        <signal name="start_end_pulse_A_in" />
        <signal name="start_pulse_B_in" />
        <signal name="end_pulse_B_in" />
        <signal name="start_end_pulse_B_in" />
        <port polarity="Input" name="BUS_STB_PAD_A" />
        <port polarity="Input" name="BUS_WE_PAD_A" />
        <port polarity="Output" name="BUS_ACK_PAD_A" />
        <port polarity="Output" name="BUS_REQ_W_1_PAD_A" />
        <port polarity="Output" name="CLOCK_PAD_A" />
        <port polarity="BiDirectional" name="BUS_AD_PAD_A(31:0)" />
        <port polarity="Output" name="BUS_REQ_R_1_PAD_A" />
        <port polarity="Output" name="BUS_REQ_R_2_PAD_A" />
        <port polarity="Input" name="BUS_M_RDY_PAD_A" />
        <port polarity="Output" name="BUS_S_RDY_PAD_A" />
        <port polarity="Output" name="BUS_ABORT_PAD_A" />
        <port polarity="Input" name="BUS_STB_PAD_B" />
        <port polarity="Input" name="BUS_WE_PAD_B" />
        <port polarity="Output" name="BUS_ACK_PAD_B" />
        <port polarity="Output" name="BUS_REQ_W_1_PAD_B" />
        <port polarity="Output" name="CLOCK_PAD_B" />
        <port polarity="BiDirectional" name="BUS_AD_PAD_B(31:0)" />
        <port polarity="Output" name="BUS_REQ_R_1_PAD_B" />
        <port polarity="Output" name="BUS_REQ_R_2_PAD_B" />
        <port polarity="Input" name="BUS_M_RDY_PAD_B" />
        <port polarity="Output" name="BUS_S_RDY_PAD_B" />
        <port polarity="Output" name="BUS_ABORT_PAD_B" />
        <port polarity="Output" name="BUS_REQ_W_2_PAD_A" />
        <port polarity="Output" name="BUS_REQ_W_2_PAD_B" />
        <port polarity="Output" name="PCI_INTA" />
        <port polarity="Output" name="PCI_REQ" />
        <port polarity="Output" name="PCI_SERR" />
        <port polarity="BiDirectional" name="PCI_FRAME" />
        <port polarity="BiDirectional" name="PCI_IRDY" />
        <port polarity="BiDirectional" name="PCI_DEVSEL" />
        <port polarity="BiDirectional" name="PCI_TRDY" />
        <port polarity="BiDirectional" name="PCI_STOP" />
        <port polarity="BiDirectional" name="PCI_PAR" />
        <port polarity="BiDirectional" name="PCI_PERR" />
        <port polarity="BiDirectional" name="PCI_AD(31:0)" />
        <port polarity="BiDirectional" name="PCI_CBE(3:0)" />
        <port polarity="Input" name="PCI_RST" />
        <port polarity="Input" name="PCI_GNT" />
        <port polarity="Input" name="PCI_IDSEL" />
        <port polarity="Output" name="pulse_A" />
        <port polarity="Output" name="pulse_B" />
        <port polarity="Output" name="rst_channel_0_pad" />
        <port polarity="Output" name="rst_channel_1_pad" />
        <port polarity="Output" name="rst_channel_2_pad" />
        <port polarity="Output" name="rst_channel_3_pad" />
        <port polarity="Input" name="channel_0_up_pad" />
        <port polarity="Input" name="channel_1_up_pad" />
        <port polarity="Input" name="channel_2_up_pad" />
        <port polarity="Input" name="channel_3_up_pad" />
        <port polarity="Input" name="BOARD_IDENT(5:0)" />
        <port polarity="Input" name="bc0" />
        <port polarity="Input" name="bc1" />
        <port polarity="Input" name="bc2" />
        <port polarity="Input" name="bc3" />
        <port polarity="Input" name="PCLK" />
        <port polarity="Output" name="LED_GREEN" />
        <port polarity="Output" name="LED_RED" />
        <port polarity="Input" name="start_pulse_A" />
        <port polarity="Input" name="end_pulse_A" />
        <port polarity="Input" name="start_pulse_B" />
        <port polarity="Input" name="end_pulse_B" />
        <blockdef name="DMA_FIFOs">
            <timestamp>2011-6-29T3:1:48</timestamp>
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="672" x="64" y="-1344" height="3648" />
            <line x2="800" y1="-928" y2="-928" x1="736" />
            <rect width="64" x="736" y="-876" height="24" />
            <line x2="800" y1="-864" y2="-864" x1="736" />
            <line x2="800" y1="-800" y2="-800" x1="736" />
            <rect width="64" x="736" y="-748" height="24" />
            <line x2="800" y1="-736" y2="-736" x1="736" />
            <line x2="800" y1="-672" y2="-672" x1="736" />
            <rect width="64" x="736" y="-620" height="24" />
            <line x2="800" y1="-608" y2="-608" x1="736" />
            <line x2="800" y1="-544" y2="-544" x1="736" />
            <rect width="64" x="736" y="-492" height="24" />
            <line x2="800" y1="-480" y2="-480" x1="736" />
            <line x2="800" y1="-416" y2="-416" x1="736" />
            <line x2="800" y1="-352" y2="-352" x1="736" />
            <line x2="800" y1="-288" y2="-288" x1="736" />
            <rect width="64" x="736" y="-236" height="24" />
            <line x2="800" y1="-224" y2="-224" x1="736" />
            <line x2="800" y1="-160" y2="-160" x1="736" />
            <rect width="64" x="736" y="-108" height="24" />
            <line x2="800" y1="-96" y2="-96" x1="736" />
            <line x2="800" y1="48" y2="48" x1="736" />
            <line x2="800" y1="112" y2="112" x1="736" />
            <line x2="800" y1="176" y2="176" x1="736" />
            <line x2="800" y1="240" y2="240" x1="736" />
            <line x2="800" y1="320" y2="320" x1="736" />
            <line x2="800" y1="384" y2="384" x1="736" />
            <line x2="800" y1="448" y2="448" x1="736" />
            <line x2="800" y1="512" y2="512" x1="736" />
            <line x2="800" y1="592" y2="592" x1="736" />
            <line x2="800" y1="656" y2="656" x1="736" />
            <line x2="800" y1="720" y2="720" x1="736" />
            <line x2="800" y1="784" y2="784" x1="736" />
            <rect width="64" x="736" y="868" height="24" />
            <line x2="800" y1="880" y2="880" x1="736" />
            <rect width="64" x="736" y="948" height="24" />
            <line x2="800" y1="960" y2="960" x1="736" />
            <rect width="64" x="736" y="1028" height="24" />
            <line x2="800" y1="1040" y2="1040" x1="736" />
            <rect width="64" x="736" y="1108" height="24" />
            <line x2="800" y1="1120" y2="1120" x1="736" />
            <line x2="64" y1="48" y2="48" x1="0" />
            <line x2="64" y1="112" y2="112" x1="0" />
            <line x2="64" y1="176" y2="176" x1="0" />
            <line x2="64" y1="240" y2="240" x1="0" />
            <line x2="800" y1="1248" y2="1248" x1="736" />
            <line x2="736" y1="1312" y2="1312" x1="800" />
            <line x2="736" y1="1376" y2="1376" x1="800" />
            <line x2="736" y1="1472" y2="1472" x1="800" />
            <line x2="736" y1="1536" y2="1536" x1="800" />
            <line x2="736" y1="1600" y2="1600" x1="800" />
            <line x2="736" y1="1696" y2="1696" x1="800" />
            <line x2="736" y1="1760" y2="1760" x1="800" />
            <line x2="736" y1="1824" y2="1824" x1="800" />
            <line x2="736" y1="1920" y2="1920" x1="800" />
            <line x2="736" y1="1984" y2="1984" x1="800" />
            <line x2="736" y1="2048" y2="2048" x1="800" />
            <line x2="64" y1="1248" y2="1248" x1="0" />
            <line x2="64" y1="1312" y2="1312" x1="0" />
            <line x2="64" y1="1376" y2="1376" x1="0" />
            <rect width="64" x="736" y="1460" height="24" />
            <line x2="800" y1="1472" y2="1472" x1="736" />
            <rect width="64" x="736" y="1524" height="24" />
            <line x2="800" y1="1536" y2="1536" x1="736" />
            <rect width="64" x="736" y="1588" height="24" />
            <line x2="800" y1="1600" y2="1600" x1="736" />
            <rect width="64" x="736" y="1684" height="24" />
            <line x2="800" y1="1696" y2="1696" x1="736" />
            <rect width="64" x="736" y="1748" height="24" />
            <line x2="800" y1="1760" y2="1760" x1="736" />
            <rect width="64" x="736" y="1812" height="24" />
            <line x2="800" y1="1824" y2="1824" x1="736" />
            <line x2="68" y1="592" y2="592" x1="0" />
            <line x2="64" y1="656" y2="656" x1="0" />
            <line x2="64" y1="736" y2="736" x1="0" />
            <line x2="64" y1="816" y2="816" x1="0" />
            <line x2="736" y1="2128" y2="2128" x1="800" />
            <line x2="800" y1="2208" y2="2208" x1="736" />
            <rect width="64" x="0" y="724" height="24" />
            <line x2="64" y1="736" y2="736" x1="0" />
            <rect width="64" x="0" y="804" height="24" />
            <line x2="64" y1="816" y2="816" x1="0" />
            <line x2="64" y1="1472" y2="1472" x1="0" />
            <line x2="64" y1="1552" y2="1552" x1="0" />
            <line x2="64" y1="1632" y2="1632" x1="0" />
            <line x2="64" y1="1712" y2="1712" x1="0" />
        </blockdef>
        <blockdef name="DMA_INTERFACE">
            <timestamp>2011-12-4T21:3:59</timestamp>
            <rect width="496" x="64" y="-1536" height="2592" />
            <line x2="0" y1="-1504" y2="-1504" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="624" y1="-1504" y2="-1504" x1="560" />
            <line x2="624" y1="-1440" y2="-1440" x1="560" />
            <line x2="624" y1="-1376" y2="-1376" x1="560" />
            <line x2="624" y1="-1312" y2="-1312" x1="560" />
            <line x2="624" y1="-1184" y2="-1184" x1="560" />
            <line x2="624" y1="-1120" y2="-1120" x1="560" />
            <line x2="624" y1="-1056" y2="-1056" x1="560" />
            <line x2="624" y1="-992" y2="-992" x1="560" />
            <line x2="624" y1="-928" y2="-928" x1="560" />
            <rect width="64" x="560" y="-876" height="24" />
            <line x2="624" y1="-864" y2="-864" x1="560" />
            <rect width="64" x="560" y="-812" height="24" />
            <line x2="624" y1="-800" y2="-800" x1="560" />
            <rect width="64" x="560" y="-748" height="24" />
            <line x2="624" y1="-736" y2="-736" x1="560" />
            <rect width="64" x="560" y="-684" height="24" />
            <line x2="624" y1="-672" y2="-672" x1="560" />
            <line x2="624" y1="-608" y2="-608" x1="560" />
            <line x2="624" y1="-544" y2="-544" x1="560" />
            <line x2="624" y1="-480" y2="-480" x1="560" />
            <line x2="624" y1="-416" y2="-416" x1="560" />
            <line x2="624" y1="-352" y2="-352" x1="560" />
            <line x2="624" y1="-288" y2="-288" x1="560" />
            <line x2="624" y1="-224" y2="-224" x1="560" />
            <rect width="64" x="560" y="-172" height="24" />
            <line x2="624" y1="-160" y2="-160" x1="560" />
            <rect width="64" x="560" y="-108" height="24" />
            <line x2="624" y1="-96" y2="-96" x1="560" />
            <line x2="624" y1="32" y2="32" x1="560" />
            <rect width="64" x="560" y="20" height="24" />
            <line x2="624" y1="96" y2="96" x1="560" />
            <rect width="64" x="560" y="84" height="24" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="64" y1="144" y2="144" x1="0" />
            <line x2="64" y1="192" y2="192" x1="0" />
            <line x2="64" y1="240" y2="240" x1="0" />
            <line x2="64" y1="304" y2="304" x1="0" />
            <line x2="64" y1="352" y2="352" x1="0" />
            <line x2="64" y1="400" y2="400" x1="0" />
            <rect width="64" x="0" y="452" height="24" />
            <line x2="0" y1="464" y2="464" x1="64" />
            <rect width="64" x="0" y="500" height="24" />
            <line x2="0" y1="512" y2="512" x1="64" />
            <rect width="64" x="0" y="548" height="24" />
            <line x2="0" y1="560" y2="560" x1="64" />
            <line x2="560" y1="608" y2="608" x1="624" />
            <line x2="560" y1="656" y2="656" x1="624" />
            <line x2="560" y1="704" y2="704" x1="624" />
            <line x2="560" y1="160" y2="160" x1="624" />
            <line x2="560" y1="432" y2="432" x1="628" />
            <line x2="560" y1="480" y2="480" x1="624" />
            <line x2="560" y1="528" y2="528" x1="624" />
            <line x2="0" y1="608" y2="608" x1="64" />
            <line x2="64" y1="656" y2="656" x1="0" />
            <line x2="64" y1="704" y2="704" x1="0" />
            <line x2="64" y1="752" y2="752" x1="0" />
            <line x2="564" y1="768" y2="768" x1="624" />
            <line x2="560" y1="224" y2="224" x1="628" />
            <line x2="560" y1="272" y2="272" x1="624" />
            <line x2="64" y1="-1120" y2="-1120" x1="0" />
            <line x2="64" y1="-816" y2="-816" x1="0" />
            <line x2="64" y1="16" y2="16" x1="0" />
            <line x2="64" y1="64" y2="64" x1="0" />
            <line x2="64" y1="800" y2="800" x1="0" />
            <line x2="64" y1="848" y2="848" x1="0" />
            <line x2="64" y1="896" y2="896" x1="0" />
            <line x2="64" y1="944" y2="944" x1="0" />
            <line x2="64" y1="992" y2="992" x1="0" />
            <line x2="64" y1="1040" y2="1040" x1="0" />
        </blockdef>
        <blockdef name="bus_slave">
            <timestamp>2011-6-14T3:48:3</timestamp>
            <rect width="432" x="64" y="-832" height="1476" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="560" y1="-800" y2="-800" x1="496" />
            <line x2="560" y1="-608" y2="-608" x1="496" />
            <line x2="560" y1="-512" y2="-512" x1="496" />
            <line x2="560" y1="-224" y2="-224" x1="496" />
            <rect width="64" x="496" y="-140" height="24" />
            <line x2="560" y1="-128" y2="-128" x1="496" />
            <rect width="64" x="496" y="-44" height="24" />
            <line x2="560" y1="-32" y2="-32" x1="496" />
            <line x2="560" y1="-448" y2="-448" x1="496" />
            <line x2="496" y1="-384" y2="-384" x1="560" />
            <line x2="560" y1="-304" y2="-304" x1="496" />
            <line x2="496" y1="48" y2="48" x1="560" />
            <line x2="64" y1="96" y2="96" x1="0" />
            <line x2="64" y1="160" y2="160" x1="0" />
            <line x2="64" y1="224" y2="224" x1="0" />
            <rect width="64" x="0" y="276" height="24" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="496" y1="112" y2="112" x1="560" />
            <line x2="496" y1="176" y2="176" x1="560" />
            <line x2="64" y1="352" y2="352" x1="0" />
            <line x2="64" y1="416" y2="416" x1="0" />
            <line x2="64" y1="512" y2="512" x1="0" />
            <line x2="64" y1="608" y2="608" x1="0" />
            <line x2="496" y1="464" y2="464" x1="560" />
            <rect width="64" x="496" y="564" height="24" />
            <line x2="560" y1="576" y2="576" x1="496" />
            <line x2="496" y1="400" y2="400" x1="560" />
        </blockdef>
        <blockdef name="clk_gen_top">
            <timestamp>2011-6-8T20:40:7</timestamp>
            <rect width="304" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="DMA_FPGA_IOBUF">
            <timestamp>2011-6-21T4:0:26</timestamp>
            <rect width="400" x="64" y="-640" height="1032" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="528" y1="-544" y2="-544" x1="464" />
            <line x2="528" y1="-480" y2="-480" x1="464" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="64" y1="-416" y2="-416" x1="0" />
            <line x2="64" y1="96" y2="96" x1="0" />
            <line x2="64" y1="160" y2="160" x1="0" />
            <line x2="64" y1="224" y2="224" x1="0" />
            <line x2="64" y1="288" y2="288" x1="0" />
            <line x2="464" y1="144" y2="144" x1="528" />
            <line x2="464" y1="224" y2="224" x1="528" />
            <line x2="464" y1="288" y2="288" x1="528" />
            <line x2="464" y1="64" y2="64" x1="528" />
            <line x2="64" y1="352" y2="352" x1="0" />
        </blockdef>
        <blockdef name="DMA_FPGA_icon_wrapper">
            <timestamp>2011-6-18T6:26:37</timestamp>
            <rect width="256" x="64" y="-256" height="356" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <rect width="64" x="320" y="68" height="24" />
            <line x2="384" y1="80" y2="80" x1="320" />
        </blockdef>
        <blockdef name="bus_slave_debug">
            <timestamp>2011-6-14T6:23:57</timestamp>
            <rect width="256" x="64" y="-768" height="836" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-748" height="24" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <line x2="64" y1="32" y2="32" x1="0" />
        </blockdef>
        <blockdef name="down_fifo_interface_debug">
            <timestamp>2011-6-21T5:16:59</timestamp>
            <rect width="320" x="64" y="-448" height="508" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-428" height="24" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="0" y1="32" y2="32" x1="64" />
        </blockdef>
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="ibuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="DMA_LED_driver">
            <timestamp>2011-6-30T7:20:37</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="monitor_pulse_start_end">
            <timestamp>2011-12-4T22:2:14</timestamp>
            <rect width="336" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <block symbolname="bus_slave" name="u_bus_slave_A">
            <blockpin signalname="WB_CLK_2x" name="clk_i" />
            <blockpin signalname="WB_RST_DELAY" name="reset_i" />
            <blockpin signalname="slave_we_A" name="we_i" />
            <blockpin signalname="slave_stb_A" name="stb_i" />
            <blockpin signalname="down_fifo_empty_A1" name="r_fifo_empty_i_1" />
            <blockpin signalname="down_fifo_almost_empty_A1" name="r_fifo_almost_empty_i_1" />
            <blockpin name="r_fifo_prog_empty_i_1" />
            <blockpin name="w_fifo_full_i_1" />
            <blockpin name="w_fifo_almost_full_i_1" />
            <blockpin signalname="DMA_merge_fifo_prog_full_A1" name="w_fifo_prog_full_i_1" />
            <blockpin signalname="slave_dat_i_A(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="down_fifo_rdat_A1(31:0)" name="r_fifo_dat_i_1(31:0)" />
            <blockpin signalname="slave_ack_A" name="ack_o" />
            <blockpin signalname="slave_dat_en_A" name="dat_o_enable_o" />
            <blockpin signalname="slave_req_w_A1" name="req_w_o_1" />
            <blockpin signalname="DMA_merge_fifo_wr_en_A1" name="w_fifo_dat_valid_o_1" />
            <blockpin signalname="slave_dat_o_A(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_A1(31:0)" name="w_fifo_dat_o_1(31:0)" />
            <blockpin signalname="slave_req_r_1_A" name="req_r_o_1" />
            <blockpin signalname="slave_req_r_2_A" name="req_r_o_2" />
            <blockpin signalname="down_fifo_rd_A1" name="r_fifo_rd_o_1" />
            <blockpin signalname="down_fifo_rd_A2" name="r_fifo_rd_o_2" />
            <blockpin signalname="down_fifo_empty_A2" name="r_fifo_empty_i_2" />
            <blockpin signalname="down_fifo_almost_empty_A2" name="r_fifo_almost_empty_i_2" />
            <blockpin name="r_fifo_prog_empty_i_2" />
            <blockpin signalname="down_fifo_rdat_A2(31:0)" name="r_fifo_dat_i_2(31:0)" />
            <blockpin signalname="bus_abort_A" name="abort_o" />
            <blockpin signalname="bus_s_rdy_A" name="s_rdy_o" />
            <blockpin signalname="bus_m_rdy_A" name="m_rdy_i" />
            <blockpin name="w_fifo_full_i_2" />
            <blockpin name="w_fifo_almost_full_i_2" />
            <blockpin signalname="DMA_merge_fifo_prog_full_A2" name="w_fifo_prog_full_i_2" />
            <blockpin signalname="DMA_merge_fifo_wr_en_A2" name="w_fifo_dat_valid_o_2" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_A2(31:0)" name="w_fifo_dat_o_2(31:0)" />
            <blockpin signalname="slave_req_w_A2" name="req_w_o_2" />
        </block>
        <block symbolname="DMA_FPGA_IOBUF" name="u_DMA_FPGA_IOBUF_A">
            <blockpin signalname="slave_dat_en_A" name="bus_ad_out_en" />
            <blockpin signalname="slave_ack_A" name="bus_ack" />
            <blockpin signalname="slave_req_w_A1" name="bus_req_w_1" />
            <blockpin signalname="WB_CLK_2x" name="clock" />
            <blockpin signalname="BUS_STB_PAD_A" name="BUS_STB_PAD" />
            <blockpin signalname="BUS_WE_PAD_A" name="BUS_WE_PAD" />
            <blockpin signalname="slave_dat_o_A(31:0)" name="bus_ad_out(31:0)" />
            <blockpin signalname="slave_stb_A" name="bus_stb" />
            <blockpin signalname="slave_we_A" name="bus_we" />
            <blockpin signalname="BUS_ACK_PAD_A" name="BUS_ACK_PAD" />
            <blockpin signalname="BUS_REQ_R_1_PAD_A" name="BUS_REQ_R_1_PAD" />
            <blockpin signalname="BUS_REQ_W_1_PAD_A" name="BUS_REQ_W_1_PAD" />
            <blockpin signalname="CLOCK_PAD_A" name="CLOCK_PAD" />
            <blockpin signalname="slave_dat_i_A(31:0)" name="bus_ad_in(31:0)" />
            <blockpin signalname="BUS_REQ_R_2_PAD_A" name="BUS_REQ_R_2_PAD" />
            <blockpin signalname="BUS_AD_PAD_A(31:0)" name="BUS_AD_PAD(31:0)" />
            <blockpin signalname="slave_req_r_1_A" name="bus_req_r_1" />
            <blockpin signalname="slave_req_r_2_A" name="bus_req_r_2" />
            <blockpin signalname="WB_CLK_2x" name="clk_i" />
            <blockpin signalname="BUS_M_RDY_PAD_A" name="BUS_M_RDY_PAD" />
            <blockpin signalname="bus_s_rdy_A" name="bus_s_rdy" />
            <blockpin signalname="bus_abort_A" name="bus_abort" />
            <blockpin signalname="bus_m_rdy_A" name="bus_m_rdy" />
            <blockpin signalname="BUS_S_RDY_PAD_A" name="BUS_S_RDY_PAD" />
            <blockpin signalname="BUS_ABORT_PAD_A" name="BUS_ABORT_PAD" />
            <blockpin signalname="BUS_REQ_W_2_PAD_A" name="BUS_REQ_W_2_PAD" />
            <blockpin signalname="slave_req_w_A2" name="bus_req_w_2" />
        </block>
        <block symbolname="bus_slave_debug" name="u_slave_debug_A">
            <blockpin signalname="WB_CLK_2x" name="wb_clk_2x" />
            <blockpin signalname="slave_stb_A" name="stb" />
            <blockpin signalname="slave_we_A" name="we" />
            <blockpin signalname="slave_ack_A" name="ack" />
            <blockpin signalname="bus_m_rdy_A" name="m_rdy" />
            <blockpin signalname="bus_s_rdy_A" name="s_rdy" />
            <blockpin signalname="bus_abort_A" name="abort" />
            <blockpin signalname="slave_req_w_A1" name="req_w_1" />
            <blockpin signalname="slave_req_r_1_A" name="req_r_1" />
            <blockpin signalname="slave_req_r_2_A" name="req_r_2" />
            <blockpin signalname="slave_dat_i_A(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="slave_dat_o_A(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="CONTROL3(35:0)" name="control(35:0)" />
            <blockpin signalname="slave_req_w_A2" name="req_w_2" />
        </block>
        <block symbolname="DMA_FIFOs" name="u_DMA_FIFOs">
            <blockpin signalname="WB_CLK" name="WB_CLK" />
            <blockpin signalname="WB_RST" name="WB_RST" />
            <blockpin signalname="WB_CLK_2x" name="WB_CLK_2x" />
            <blockpin signalname="fifo_data_valid_A2" name="fifo_data_valid_A2" />
            <blockpin signalname="fifo_data_A2(31:0)" name="fifo_data_A2(31:0)" />
            <blockpin signalname="fifo_data_valid_A1" name="fifo_data_valid_A1" />
            <blockpin signalname="fifo_data_A1(31:0)" name="fifo_data_A1(31:0)" />
            <blockpin signalname="fifo_data_valid_A4" name="fifo_data_valid_B2" />
            <blockpin signalname="fifo_data_A4(31:0)" name="fifo_data_B2(31:0)" />
            <blockpin signalname="fifo_data_valid_A3" name="fifo_data_valid_B1" />
            <blockpin signalname="fifo_data_A3(31:0)" name="fifo_data_B1(31:0)" />
            <blockpin signalname="DMA_merge_fifo_wr_en_A1" name="DMA_merge_fifo_wr_en_A1" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_A1(31:0)" name="DMA_merge_fifo_wr_dat_A1(31:0)" />
            <blockpin signalname="DMA_merge_fifo_wr_en_B1" name="DMA_merge_fifo_wr_en_B1" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_B1(31:0)" name="DMA_merge_fifo_wr_dat_B1(31:0)" />
            <blockpin signalname="DMA_fifo_rd_A1" name="DMA_fifo_rd_A1" />
            <blockpin signalname="fifo_prog_full_A2" name="fifo_prog_full_A2" />
            <blockpin signalname="fifo_length_A2(27:0)" name="fifo_length_A2(27:0)" />
            <blockpin signalname="fifo_prog_full_A1" name="fifo_prog_full_A1" />
            <blockpin signalname="fifo_length_A1(27:0)" name="fifo_length_A1(27:0)" />
            <blockpin signalname="fifo_prog_full_A4" name="fifo_prog_full_B2" />
            <blockpin signalname="fifo_length_B2(27:0)" name="fifo_length_B2(27:0)" />
            <blockpin signalname="fifo_prog_full_A3" name="fifo_prog_full_B1" />
            <blockpin signalname="fifo_length_B1(27:0)" name="fifo_length_B1(27:0)" />
            <blockpin signalname="DMA_merge_fifo_prog_full_A1" name="DMA_merge_fifo_prog_full_A1" />
            <blockpin signalname="DMA_merge_fifo_prog_full_B1" name="DMA_merge_fifo_prog_full_B1" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A1" name="DMA_fifo_dat_strobe_current_A1" />
            <blockpin signalname="DMA_fifo_dat_A1(31:0)" name="DMA_fifo_dat_A1(31:0)" />
            <blockpin signalname="DMA_fifo_dat_strobe_A1" name="DMA_fifo_dat_strobe_A1" />
            <blockpin signalname="DMA_fifo_cnt_A1(27:0)" name="DMA_fifo_cnt_A1(27:0)" />
            <blockpin signalname="down_fifo_empty_A1" name="down_fifo_empty_A1" />
            <blockpin signalname="down_fifo_empty_A2" name="down_fifo_empty_A2" />
            <blockpin signalname="down_fifo_empty_B2" name="down_fifo_empty_B2" />
            <blockpin signalname="down_fifo_almost_empty_A1" name="down_fifo_almost_empty_A1" />
            <blockpin signalname="down_fifo_almost_empty_A2" name="down_fifo_almost_empty_A2" />
            <blockpin signalname="down_fifo_almost_empty_B1" name="down_fifo_almost_empty_B1" />
            <blockpin signalname="down_fifo_almost_empty_B2" name="down_fifo_almost_empty_B2" />
            <blockpin name="down_fifo_prog_empty_A1" />
            <blockpin name="down_fifo_prog_empty_A2" />
            <blockpin name="down_fifo_prog_empty_B1" />
            <blockpin name="down_fifo_prog_empty_B2" />
            <blockpin signalname="down_fifo_empty_B1" name="down_fifo_empty_B1" />
            <blockpin signalname="down_fifo_rdat_A1(31:0)" name="down_fifo_rdat_A1(31:0)" />
            <blockpin signalname="down_fifo_rdat_A2(31:0)" name="down_fifo_rdat_A2(31:0)" />
            <blockpin signalname="down_fifo_rdat_B1(31:0)" name="down_fifo_rdat_B1(31:0)" />
            <blockpin signalname="down_fifo_rdat_B2(31:0)" name="down_fifo_rdat_B2(31:0)" />
            <blockpin signalname="down_fifo_rd_A1" name="down_fifo_rd_A1" />
            <blockpin signalname="down_fifo_rd_A2" name="down_fifo_rd_A2" />
            <blockpin signalname="down_fifo_rd_B1" name="down_fifo_rd_B1" />
            <blockpin signalname="down_fifo_rd_B2" name="down_fifo_rd_B2" />
            <blockpin signalname="DMA_fifo_dat_strobe_A2" name="DMA_fifo_dat_strobe_A2" />
            <blockpin signalname="DMA_fifo_dat_strobe_B1" name="DMA_fifo_dat_strobe_B1" />
            <blockpin signalname="DMA_fifo_dat_strobe_B2" name="DMA_fifo_dat_strobe_B2" />
            <blockpin signalname="DMA_fifo_dat_A2(31:0)" name="DMA_fifo_dat_A2(31:0)" />
            <blockpin signalname="DMA_fifo_dat_B1(31:0)" name="DMA_fifo_dat_B1(31:0)" />
            <blockpin signalname="DMA_fifo_dat_B2(31:0)" name="DMA_fifo_dat_B2(31:0)" />
            <blockpin signalname="DMA_fifo_cnt_A2(27:0)" name="DMA_fifo_cnt_A2(27:0)" />
            <blockpin signalname="DMA_fifo_cnt_B1(27:0)" name="DMA_fifo_cnt_B1(27:0)" />
            <blockpin signalname="DMA_fifo_cnt_B2(27:0)" name="DMA_fifo_cnt_B2(27:0)" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A2" name="DMA_fifo_dat_strobe_current_A2" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B1" name="DMA_fifo_dat_strobe_current_B1" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B2" name="DMA_fifo_dat_strobe_current_B2" />
            <blockpin signalname="DMA_fifo_rd_A2" name="DMA_fifo_rd_A2" />
            <blockpin signalname="DMA_fifo_rd_B1" name="DMA_fifo_rd_B1" />
            <blockpin signalname="DMA_fifo_rd_B2" name="DMA_fifo_rd_B2" />
            <blockpin signalname="DMA_merge_fifo_wr_en_A2" name="DMA_merge_fifo_wr_en_A2" />
            <blockpin signalname="DMA_merge_fifo_wr_en_B2" name="DMA_merge_fifo_wr_en_B2" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_A2(31:0)" name="DMA_merge_fifo_wr_dat_A2(31:0)" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_B2(31:0)" name="DMA_merge_fifo_wr_dat_B2(31:0)" />
            <blockpin signalname="DMA_merge_fifo_prog_full_A2" name="DMA_merge_fifo_prog_full_A2" />
            <blockpin signalname="DMA_merge_fifo_prog_full_B2" name="DMA_merge_fifo_prog_full_B2" />
            <blockpin signalname="rst_channel_0" name="rst_channel_0" />
            <blockpin signalname="rst_channel_1" name="rst_channel_1" />
            <blockpin signalname="rst_channel_2" name="rst_channel_2" />
            <blockpin signalname="rst_channel_3" name="rst_channel_3" />
        </block>
        <block symbolname="DMA_FPGA_IOBUF" name="u_DMA_FPGA_IOBUF_B">
            <blockpin signalname="slave_dat_en_B" name="bus_ad_out_en" />
            <blockpin signalname="slave_ack_B" name="bus_ack" />
            <blockpin signalname="slave_req_w_B1" name="bus_req_w_1" />
            <blockpin signalname="WB_CLK_2x" name="clock" />
            <blockpin signalname="BUS_STB_PAD_B" name="BUS_STB_PAD" />
            <blockpin signalname="BUS_WE_PAD_B" name="BUS_WE_PAD" />
            <blockpin signalname="slave_dat_o_B(31:0)" name="bus_ad_out(31:0)" />
            <blockpin signalname="slave_stb_B" name="bus_stb" />
            <blockpin signalname="slave_we_B" name="bus_we" />
            <blockpin signalname="BUS_ACK_PAD_B" name="BUS_ACK_PAD" />
            <blockpin signalname="BUS_REQ_R_1_PAD_B" name="BUS_REQ_R_1_PAD" />
            <blockpin signalname="BUS_REQ_W_1_PAD_B" name="BUS_REQ_W_1_PAD" />
            <blockpin signalname="CLOCK_PAD_B" name="CLOCK_PAD" />
            <blockpin signalname="slave_dat_i_B(31:0)" name="bus_ad_in(31:0)" />
            <blockpin signalname="BUS_REQ_R_2_PAD_B" name="BUS_REQ_R_2_PAD" />
            <blockpin signalname="BUS_AD_PAD_B(31:0)" name="BUS_AD_PAD(31:0)" />
            <blockpin signalname="slave_req_r_1_B" name="bus_req_r_1" />
            <blockpin signalname="slave_req_r_2_B" name="bus_req_r_2" />
            <blockpin signalname="WB_CLK_2x" name="clk_i" />
            <blockpin signalname="BUS_M_RDY_PAD_B" name="BUS_M_RDY_PAD" />
            <blockpin signalname="bus_s_rdy_B" name="bus_s_rdy" />
            <blockpin signalname="bus_abort_B" name="bus_abort" />
            <blockpin signalname="bus_m_rdy_B" name="bus_m_rdy" />
            <blockpin signalname="BUS_S_RDY_PAD_B" name="BUS_S_RDY_PAD" />
            <blockpin signalname="BUS_ABORT_PAD_B" name="BUS_ABORT_PAD" />
            <blockpin signalname="BUS_REQ_W_2_PAD_B" name="BUS_REQ_W_2_PAD" />
            <blockpin signalname="slave_req_w_B2" name="bus_req_w_2" />
        </block>
        <block symbolname="bus_slave" name="u_bus_slave_B">
            <blockpin signalname="WB_CLK_2x" name="clk_i" />
            <blockpin signalname="WB_RST_DELAY" name="reset_i" />
            <blockpin signalname="slave_we_B" name="we_i" />
            <blockpin signalname="slave_stb_B" name="stb_i" />
            <blockpin signalname="down_fifo_empty_B1" name="r_fifo_empty_i_1" />
            <blockpin signalname="down_fifo_almost_empty_B1" name="r_fifo_almost_empty_i_1" />
            <blockpin name="r_fifo_prog_empty_i_1" />
            <blockpin name="w_fifo_full_i_1" />
            <blockpin name="w_fifo_almost_full_i_1" />
            <blockpin signalname="DMA_merge_fifo_prog_full_B1" name="w_fifo_prog_full_i_1" />
            <blockpin signalname="slave_dat_i_B(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="down_fifo_rdat_B1(31:0)" name="r_fifo_dat_i_1(31:0)" />
            <blockpin signalname="slave_ack_B" name="ack_o" />
            <blockpin signalname="slave_dat_en_B" name="dat_o_enable_o" />
            <blockpin signalname="slave_req_w_B1" name="req_w_o_1" />
            <blockpin signalname="DMA_merge_fifo_wr_en_B1" name="w_fifo_dat_valid_o_1" />
            <blockpin signalname="slave_dat_o_B(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_B1(31:0)" name="w_fifo_dat_o_1(31:0)" />
            <blockpin signalname="slave_req_r_1_B" name="req_r_o_1" />
            <blockpin signalname="slave_req_r_2_B" name="req_r_o_2" />
            <blockpin signalname="down_fifo_rd_B1" name="r_fifo_rd_o_1" />
            <blockpin signalname="down_fifo_rd_B2" name="r_fifo_rd_o_2" />
            <blockpin signalname="down_fifo_empty_B2" name="r_fifo_empty_i_2" />
            <blockpin signalname="down_fifo_almost_empty_B2" name="r_fifo_almost_empty_i_2" />
            <blockpin name="r_fifo_prog_empty_i_2" />
            <blockpin signalname="down_fifo_rdat_B2(31:0)" name="r_fifo_dat_i_2(31:0)" />
            <blockpin signalname="bus_abort_B" name="abort_o" />
            <blockpin signalname="bus_s_rdy_B" name="s_rdy_o" />
            <blockpin signalname="bus_m_rdy_B" name="m_rdy_i" />
            <blockpin name="w_fifo_full_i_2" />
            <blockpin name="w_fifo_almost_full_i_2" />
            <blockpin signalname="DMA_merge_fifo_prog_full_B2" name="w_fifo_prog_full_i_2" />
            <blockpin signalname="DMA_merge_fifo_wr_en_B2" name="w_fifo_dat_valid_o_2" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_B2(31:0)" name="w_fifo_dat_o_2(31:0)" />
            <blockpin signalname="slave_req_w_B2" name="req_w_o_2" />
        </block>
        <block symbolname="down_fifo_interface_debug" name="down_fifo_bus_A_debug">
            <blockpin signalname="WB_CLK_2x" name="clk_i" />
            <blockpin signalname="DMA_merge_fifo_prog_full_A1" name="fifo_empty_1" />
            <blockpin signalname="down_fifo_empty_A1" name="fifo_empty_2" />
            <blockpin signalname="DMA_merge_fifo_wr_en_A1" name="fifo_rd_1" />
            <blockpin signalname="down_fifo_rd_A1" name="fifo_rd_2" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_A1(31:0)" name="fifo_dat_1(31:0)" />
            <blockpin signalname="down_fifo_rdat_A1(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin signalname="CONTROL4(35:0)" name="control(35:0)" />
            <blockpin signalname="WB_RST_DELAY" name="reset_i" />
        </block>
        <block symbolname="bus_slave_debug" name="u_slave_debug_B">
            <blockpin signalname="WB_CLK_2x" name="wb_clk_2x" />
            <blockpin signalname="slave_stb_B" name="stb" />
            <blockpin signalname="slave_we_B" name="we" />
            <blockpin signalname="slave_ack_B" name="ack" />
            <blockpin signalname="bus_m_rdy_B" name="m_rdy" />
            <blockpin signalname="bus_s_rdy_B" name="s_rdy" />
            <blockpin signalname="bus_abort_B" name="abort" />
            <blockpin signalname="slave_req_w_B1" name="req_w_1" />
            <blockpin signalname="slave_req_r_1_B" name="req_r_1" />
            <blockpin signalname="slave_req_r_2_B" name="req_r_2" />
            <blockpin signalname="slave_dat_i_B(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="slave_dat_o_B(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="CONTROL2(35:0)" name="control(35:0)" />
            <blockpin signalname="slave_req_w_B2" name="req_w_2" />
        </block>
        <block symbolname="DMA_FPGA_icon_wrapper" name="u_icon">
            <blockpin signalname="CONTROL0(35:0)" name="CONTROL0(35:0)" />
            <blockpin signalname="CONTROL1(35:0)" name="CONTROL1(35:0)" />
            <blockpin signalname="CONTROL2(35:0)" name="CONTROL2(35:0)" />
            <blockpin signalname="CONTROL3(35:0)" name="CONTROL3(35:0)" />
            <blockpin signalname="CONTROL5(35:0)" name="CONTROL5(35:0)" />
            <blockpin signalname="CONTROL4(35:0)" name="CONTROL4(35:0)" />
        </block>
        <block symbolname="DMA_INTERFACE" name="u_DMA_INTERFACE">
            <blockpin signalname="PCI_CLK" name="PCI_CLK" />
            <blockpin signalname="PCI_RST" name="PCI_RST" />
            <blockpin signalname="PCI_GNT" name="PCI_GNT" />
            <blockpin signalname="PCI_IDSEL" name="PCI_IDSEL" />
            <blockpin signalname="WB_CLK" name="WB_CLK" />
            <blockpin signalname="WB_RST_DELAY" name="WB_RST_DELAY" />
            <blockpin signalname="DMA_fifo_cnt_A1(27:0)" name="DMA_fifo_cnt_A1(27:0)" />
            <blockpin signalname="BOARD_IDENT_IN(5:0)" name="BOARD_IDENT(5:0)" />
            <blockpin signalname="fifo_length_A1(27:0)" name="fifo_length_A1(27:0)" />
            <blockpin signalname="fifo_length_A2(27:0)" name="fifo_length_A2(27:0)" />
            <blockpin signalname="fifo_length_B1(27:0)" name="fifo_length_B1(27:0)" />
            <blockpin signalname="fifo_length_B2(27:0)" name="fifo_length_B2(27:0)" />
            <blockpin signalname="DMA_fifo_dat_strobe_A1" name="DMA_fifo_dat_strobe_A1" />
            <blockpin signalname="fifo_prog_full_A1" name="fifo_prog_full_A1" />
            <blockpin signalname="fifo_prog_full_A2" name="fifo_prog_full_A2" />
            <blockpin signalname="fifo_prog_full_A3" name="fifo_prog_full_A3" />
            <blockpin signalname="fifo_prog_full_A4" name="fifo_prog_full_A4" />
            <blockpin signalname="DMA_fifo_dat_A1(31:0)" name="DMA_fifo_dat_A1(31:0)" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A1" name="DMA_fifo_dat_strobe_current_A1" />
            <blockpin signalname="PCI_FRAME" name="PCI_FRAME" />
            <blockpin signalname="PCI_IRDY" name="PCI_IRDY" />
            <blockpin signalname="PCI_DEVSEL" name="PCI_DEVSEL" />
            <blockpin signalname="PCI_TRDY" name="PCI_TRDY" />
            <blockpin signalname="PCI_STOP" name="PCI_STOP" />
            <blockpin signalname="PCI_PAR" name="PCI_PAR" />
            <blockpin signalname="PCI_PERR" name="PCI_PERR" />
            <blockpin signalname="PCI_AD(31:0)" name="PCI_AD(31:0)" />
            <blockpin signalname="PCI_CBE(3:0)" name="PCI_CBE(3:0)" />
            <blockpin signalname="PCI_INTA" name="PCI_INTA" />
            <blockpin signalname="PCI_REQ" name="PCI_REQ" />
            <blockpin signalname="PCI_SERR" name="PCI_SERR" />
            <blockpin signalname="WB_PCI_RST" name="WB_PCI_RST" />
            <blockpin signalname="DMA_fifo_rd_A1" name="DMA_fifo_rd_A1" />
            <blockpin signalname="fifo_data_valid_A1" name="fifo_data_valid_A1" />
            <blockpin signalname="fifo_data_valid_A2" name="fifo_data_valid_A2" />
            <blockpin signalname="fifo_data_valid_A3" name="fifo_data_valid_A3" />
            <blockpin signalname="fifo_data_valid_A4" name="fifo_data_valid_A4" />
            <blockpin signalname="fifo_data_A1(31:0)" name="fifo_data_A1(31:0)" />
            <blockpin signalname="fifo_data_A2(31:0)" name="fifo_data_A2(31:0)" />
            <blockpin signalname="fifo_data_A3(31:0)" name="fifo_data_A3(31:0)" />
            <blockpin signalname="fifo_data_A4(31:0)" name="fifo_data_A4(31:0)" />
            <blockpin signalname="CONTROL0(35:0)" name="CONTROL0(35:0)" />
            <blockpin signalname="CONTROL1(35:0)" name="CONTROL1(35:0)" />
            <blockpin signalname="DMA_fifo_cnt_A2(27:0)" name="DMA_fifo_cnt_A2(27:0)" />
            <blockpin signalname="DMA_fifo_cnt_B1(27:0)" name="DMA_fifo_cnt_B1(27:0)" />
            <blockpin signalname="DMA_fifo_cnt_B2(27:0)" name="DMA_fifo_cnt_B2(27:0)" />
            <blockpin signalname="DMA_fifo_dat_strobe_A2" name="DMA_fifo_dat_strobe_A2" />
            <blockpin signalname="DMA_fifo_dat_strobe_B1" name="DMA_fifo_dat_strobe_B1" />
            <blockpin signalname="DMA_fifo_dat_strobe_B2" name="DMA_fifo_dat_strobe_B2" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A2" name="DMA_fifo_dat_strobe_current_A2" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B1" name="DMA_fifo_dat_strobe_current_B1" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B2" name="DMA_fifo_dat_strobe_current_B2" />
            <blockpin signalname="DMA_fifo_dat_A2(31:0)" name="DMA_fifo_dat_A2(31:0)" />
            <blockpin signalname="DMA_fifo_dat_B1(31:0)" name="DMA_fifo_dat_B1(31:0)" />
            <blockpin signalname="DMA_fifo_dat_B2(31:0)" name="DMA_fifo_dat_B2(31:0)" />
            <blockpin signalname="DMA_fifo_rd_A2" name="DMA_fifo_rd_A2" />
            <blockpin signalname="DMA_fifo_rd_B1" name="DMA_fifo_rd_B1" />
            <blockpin signalname="DMA_fifo_rd_B2" name="DMA_fifo_rd_B2" />
            <blockpin signalname="rst_channel_0" name="rst_channel_0" />
            <blockpin signalname="rst_channel_1" name="rst_channel_1" />
            <blockpin signalname="rst_channel_2" name="rst_channel_2" />
            <blockpin signalname="rst_channel_3" name="rst_channel_3" />
            <blockpin signalname="channel_0_up" name="channel_0_up" />
            <blockpin signalname="channel_1_up" name="channel_1_up" />
            <blockpin signalname="channel_2_up" name="channel_2_up" />
            <blockpin signalname="channel_3_up" name="channel_3_up" />
            <blockpin signalname="dma_in_use" name="WBS_CYC_I" />
            <blockpin signalname="XLXN_14" name="pulse_A" />
            <blockpin signalname="XLXN_15" name="pulse_B" />
            <blockpin signalname="bc0_in" name="bc0" />
            <blockpin signalname="bc1_in" name="bc1" />
            <blockpin signalname="bc2_in" name="bc2" />
            <blockpin signalname="bc3_in" name="bc3" />
            <blockpin signalname="start_pulse_A_in" name="start_pulse_A" />
            <blockpin signalname="end_pulse_A_in" name="end_pulse_A" />
            <blockpin signalname="start_end_pulse_A_in" name="start_end_pulse_A" />
            <blockpin signalname="start_pulse_B_in" name="start_pulse_B" />
            <blockpin signalname="end_pulse_B_in" name="end_pulse_B" />
            <blockpin signalname="start_end_pulse_B_in" name="start_end_pulse_B" />
        </block>
        <block symbolname="obuf" name="XLXI_17">
            <blockpin signalname="XLXN_15" name="I" />
            <blockpin signalname="pulse_B" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_16">
            <blockpin signalname="XLXN_14" name="I" />
            <blockpin signalname="pulse_A" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_1">
            <blockpin signalname="rst_channel_0" name="I" />
            <blockpin signalname="rst_channel_0_pad" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_2">
            <blockpin signalname="rst_channel_1" name="I" />
            <blockpin signalname="rst_channel_1_pad" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_3">
            <blockpin signalname="rst_channel_2" name="I" />
            <blockpin signalname="rst_channel_2_pad" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_4">
            <blockpin signalname="rst_channel_3" name="I" />
            <blockpin signalname="rst_channel_3_pad" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_8">
            <blockpin signalname="channel_1_up_pad" name="I" />
            <blockpin signalname="channel_1_up" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_9">
            <blockpin signalname="channel_2_up_pad" name="I" />
            <blockpin signalname="channel_2_up" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_10">
            <blockpin signalname="channel_3_up_pad" name="I" />
            <blockpin signalname="channel_3_up" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_7">
            <blockpin signalname="channel_0_up_pad" name="I" />
            <blockpin signalname="channel_0_up" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_18">
            <blockpin signalname="BOARD_IDENT(5)" name="I" />
            <blockpin signalname="BOARD_IDENT_IN(5)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_19">
            <blockpin signalname="BOARD_IDENT(4)" name="I" />
            <blockpin signalname="BOARD_IDENT_IN(4)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_20">
            <blockpin signalname="BOARD_IDENT(3)" name="I" />
            <blockpin signalname="BOARD_IDENT_IN(3)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_21">
            <blockpin signalname="BOARD_IDENT(2)" name="I" />
            <blockpin signalname="BOARD_IDENT_IN(2)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_22">
            <blockpin signalname="BOARD_IDENT(1)" name="I" />
            <blockpin signalname="BOARD_IDENT_IN(1)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_23">
            <blockpin signalname="BOARD_IDENT(0)" name="I" />
            <blockpin signalname="BOARD_IDENT_IN(0)" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_24">
            <blockpin signalname="bc0" name="I" />
            <blockpin signalname="bc0_in" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_25">
            <blockpin signalname="bc1" name="I" />
            <blockpin signalname="bc1_in" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_26">
            <blockpin signalname="bc2" name="I" />
            <blockpin signalname="bc2_in" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_27">
            <blockpin signalname="bc3" name="I" />
            <blockpin signalname="bc3_in" name="O" />
        </block>
        <block symbolname="down_fifo_interface_debug" name="down_fifo_dma_A_debug">
            <blockpin signalname="WB_CLK" name="clk_i" />
            <blockpin signalname="fifo_prog_full_A1" name="fifo_empty_1" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A1" name="fifo_empty_2" />
            <blockpin signalname="fifo_data_valid_A1" name="fifo_rd_1" />
            <blockpin signalname="DMA_fifo_rd_A1" name="fifo_rd_2" />
            <blockpin signalname="fifo_data_A1(31:0)" name="fifo_dat_1(31:0)" />
            <blockpin signalname="DMA_fifo_dat_A1(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin signalname="CONTROL5(35:0)" name="control(35:0)" />
            <blockpin signalname="WB_RST_DELAY" name="reset_i" />
        </block>
        <block symbolname="clk_gen_top" name="u_clk_gen_top">
            <blockpin signalname="PCLK" name="CLK_IN1" />
            <blockpin signalname="WB_PCI_RST" name="RESET" />
            <blockpin name="CLK_OUT1" />
            <blockpin name="CLK_OUT2" />
            <blockpin name="LOCKED" />
            <blockpin signalname="WB_CLK" name="WB_CLK" />
            <blockpin signalname="WB_RST" name="WB_RST" />
            <blockpin signalname="PCI_CLK" name="PCI_CLK" />
            <blockpin signalname="WB_CLK_2x" name="WB_CLK_2x" />
            <blockpin signalname="WB_RST_DELAY" name="WB_RST_DELAY" />
        </block>
        <block symbolname="DMA_LED_driver" name="XLXI_11">
            <blockpin signalname="WB_CLK" name="clk" />
            <blockpin signalname="XLXN_7" name="rdy" />
            <blockpin signalname="dma_in_use" name="dma_in_use" />
            <blockpin signalname="LED_GREENX" name="green" />
            <blockpin signalname="XLXN_11" name="red" />
        </block>
        <block symbolname="inv" name="XLXI_12">
            <blockpin signalname="WB_RST_DELAY" name="I" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_13">
            <blockpin signalname="LED_GREENX" name="I" />
            <blockpin signalname="LED_GREEN" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_14">
            <blockpin signalname="XLXN_11" name="I" />
            <blockpin signalname="LED_RED" name="O" />
        </block>
        <block symbolname="monitor_pulse_start_end" name="u_monitor_pulse_start_end_A">
            <blockpin signalname="WB_CLK_2x" name="clk_i" />
            <blockpin signalname="WB_RST_DELAY" name="reset_i" />
            <blockpin signalname="XLXN_21" name="start_pulse_i" />
            <blockpin signalname="XLXN_23" name="end_pulse_i" />
            <blockpin signalname="start_pulse_A_in" name="start_pulse_o" />
            <blockpin signalname="end_pulse_A_in" name="end_pulse_o" />
            <blockpin signalname="start_end_pulse_A_in" name="start_end_pulse_o" />
        </block>
        <block symbolname="monitor_pulse_start_end" name="u_monitor_pulse_start_end_B">
            <blockpin signalname="WB_CLK_2x" name="clk_i" />
            <blockpin signalname="WB_RST_DELAY" name="reset_i" />
            <blockpin signalname="XLXN_24" name="start_pulse_i" />
            <blockpin signalname="XLXN_25" name="end_pulse_i" />
            <blockpin signalname="start_pulse_B_in" name="start_pulse_o" />
            <blockpin signalname="end_pulse_B_in" name="end_pulse_o" />
            <blockpin signalname="start_end_pulse_B_in" name="start_end_pulse_o" />
        </block>
        <block symbolname="ibuf" name="XLXI_31">
            <blockpin signalname="start_pulse_A" name="I" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_32">
            <blockpin signalname="end_pulse_A" name="I" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_33">
            <blockpin signalname="start_pulse_B" name="I" />
            <blockpin signalname="XLXN_24" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_34">
            <blockpin signalname="end_pulse_B" name="I" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="976" y="2144" name="u_bus_slave_A" orien="R0">
        </instance>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="912" y="1344" type="branch" />
            <wire x2="928" y1="1344" y2="1344" x1="912" />
            <wire x2="976" y1="1344" y2="1344" x1="928" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="944" y="1408" type="branch" />
            <wire x2="960" y1="1408" y2="1408" x1="944" />
            <wire x2="976" y1="1408" y2="1408" x1="960" />
        </branch>
        <branch name="slave_we_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="960" y="1472" type="branch" />
            <wire x2="976" y1="1472" y2="1472" x1="960" />
        </branch>
        <branch name="slave_stb_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="960" y="1536" type="branch" />
            <wire x2="976" y1="1536" y2="1536" x1="960" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="944" y="1984" type="branch" />
            <wire x2="960" y1="1984" y2="1984" x1="944" />
            <wire x2="976" y1="1984" y2="1984" x1="960" />
        </branch>
        <branch name="slave_dat_i_A(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="944" y="2048" type="branch" />
            <wire x2="960" y1="2048" y2="2048" x1="944" />
            <wire x2="976" y1="2048" y2="2048" x1="960" />
        </branch>
        <branch name="slave_dat_en_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1552" y="1536" type="branch" />
            <wire x2="1552" y1="1536" y2="1536" x1="1536" />
        </branch>
        <branch name="slave_req_w_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1552" y="1632" type="branch" />
            <wire x2="1552" y1="1632" y2="1632" x1="1536" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="1920" type="branch" />
            <wire x2="1552" y1="1920" y2="1920" x1="1536" />
            <wire x2="1568" y1="1920" y2="1920" x1="1552" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_A1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2112" type="branch" />
            <wire x2="1552" y1="2112" y2="2112" x1="1536" />
            <wire x2="1568" y1="2112" y2="2112" x1="1552" />
        </branch>
        <branch name="slave_dat_o_A(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2016" type="branch" />
            <wire x2="1552" y1="2016" y2="2016" x1="1536" />
            <wire x2="1568" y1="2016" y2="2016" x1="1552" />
        </branch>
        <branch name="down_fifo_empty_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="928" y="1664" type="branch" />
            <wire x2="944" y1="1664" y2="1664" x1="928" />
            <wire x2="976" y1="1664" y2="1664" x1="944" />
        </branch>
        <branch name="down_fifo_empty_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="944" y="2240" type="branch" />
            <wire x2="960" y1="2240" y2="2240" x1="944" />
            <wire x2="976" y1="2240" y2="2240" x1="960" />
        </branch>
        <branch name="down_fifo_almost_empty_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="944" y="1728" type="branch" />
            <wire x2="960" y1="1728" y2="1728" x1="944" />
            <wire x2="976" y1="1728" y2="1728" x1="960" />
        </branch>
        <branch name="down_fifo_almost_empty_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="944" y="2304" type="branch" />
            <wire x2="960" y1="2304" y2="2304" x1="944" />
            <wire x2="976" y1="2304" y2="2304" x1="960" />
        </branch>
        <branch name="down_fifo_rdat_A1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="928" y="2112" type="branch" />
            <wire x2="944" y1="2112" y2="2112" x1="928" />
            <wire x2="976" y1="2112" y2="2112" x1="944" />
        </branch>
        <branch name="down_fifo_rdat_A2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="944" y="2432" type="branch" />
            <wire x2="960" y1="2432" y2="2432" x1="944" />
            <wire x2="976" y1="2432" y2="2432" x1="960" />
        </branch>
        <branch name="down_fifo_rd_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="1840" type="branch" />
            <wire x2="1568" y1="1840" y2="1840" x1="1536" />
            <wire x2="1584" y1="1840" y2="1840" x1="1568" />
        </branch>
        <branch name="down_fifo_rd_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1552" y="2192" type="branch" />
            <wire x2="1552" y1="2192" y2="2192" x1="1536" />
        </branch>
        <branch name="slave_req_r_1_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="1696" type="branch" />
            <wire x2="1552" y1="1696" y2="1696" x1="1536" />
            <wire x2="1568" y1="1696" y2="1696" x1="1552" />
        </branch>
        <branch name="slave_req_r_2_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1552" y="1760" type="branch" />
            <wire x2="1552" y1="1760" y2="1760" x1="1536" />
        </branch>
        <branch name="slave_ack_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="1344" type="branch" />
            <wire x2="1552" y1="1344" y2="1344" x1="1536" />
            <wire x2="1568" y1="1344" y2="1344" x1="1552" />
        </branch>
        <branch name="bus_m_rdy_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="960" y="2496" type="branch" />
            <wire x2="976" y1="2496" y2="2496" x1="960" />
        </branch>
        <branch name="bus_abort_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2256" type="branch" />
            <wire x2="1568" y1="2256" y2="2256" x1="1536" />
        </branch>
        <branch name="bus_s_rdy_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2320" type="branch" />
            <wire x2="1568" y1="2320" y2="2320" x1="1536" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1584" y="544" type="branch" />
            <wire x2="1600" y1="544" y2="544" x1="1584" />
            <wire x2="1632" y1="544" y2="544" x1="1600" />
        </branch>
        <branch name="slave_dat_en_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="224" type="branch" />
            <wire x2="1616" y1="224" y2="224" x1="1600" />
            <wire x2="1632" y1="224" y2="224" x1="1616" />
        </branch>
        <branch name="slave_ack_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1616" y="352" type="branch" />
            <wire x2="1632" y1="352" y2="352" x1="1616" />
        </branch>
        <branch name="slave_req_w_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1616" y="480" type="branch" />
            <wire x2="1632" y1="480" y2="480" x1="1616" />
        </branch>
        <branch name="BUS_STB_PAD_A">
            <wire x2="1616" y1="608" y2="608" x1="1600" />
            <wire x2="1632" y1="608" y2="608" x1="1616" />
        </branch>
        <branch name="BUS_WE_PAD_A">
            <wire x2="1616" y1="672" y2="672" x1="1600" />
            <wire x2="1632" y1="672" y2="672" x1="1616" />
        </branch>
        <branch name="slave_dat_o_A(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1616" y="736" type="branch" />
            <wire x2="1632" y1="736" y2="736" x1="1616" />
        </branch>
        <branch name="slave_stb_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2176" y="288" type="branch" />
            <wire x2="2176" y1="288" y2="288" x1="2160" />
        </branch>
        <branch name="slave_we_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2176" y="352" type="branch" />
            <wire x2="2176" y1="352" y2="352" x1="2160" />
        </branch>
        <branch name="BUS_ACK_PAD_A">
            <wire x2="2176" y1="416" y2="416" x1="2160" />
        </branch>
        <branch name="BUS_REQ_W_1_PAD_A">
            <wire x2="2176" y1="544" y2="544" x1="2160" />
        </branch>
        <branch name="CLOCK_PAD_A">
            <wire x2="2176" y1="608" y2="608" x1="2160" />
            <wire x2="2192" y1="608" y2="608" x1="2176" />
        </branch>
        <branch name="slave_dat_i_A(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2192" y="672" type="branch" />
            <wire x2="2176" y1="672" y2="672" x1="2160" />
            <wire x2="2192" y1="672" y2="672" x1="2176" />
        </branch>
        <branch name="BUS_AD_PAD_A(31:0)">
            <wire x2="2176" y1="800" y2="800" x1="2160" />
            <wire x2="2192" y1="800" y2="800" x1="2176" />
        </branch>
        <branch name="slave_req_r_1_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="288" type="branch" />
            <wire x2="1616" y1="288" y2="288" x1="1600" />
            <wire x2="1632" y1="288" y2="288" x1="1616" />
        </branch>
        <branch name="slave_req_r_2_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1584" y="416" type="branch" />
            <wire x2="1600" y1="416" y2="416" x1="1584" />
            <wire x2="1632" y1="416" y2="416" x1="1600" />
        </branch>
        <branch name="BUS_REQ_R_1_PAD_A">
            <wire x2="2176" y1="480" y2="480" x1="2160" />
            <wire x2="2192" y1="480" y2="480" x1="2176" />
        </branch>
        <branch name="BUS_REQ_R_2_PAD_A">
            <wire x2="2176" y1="736" y2="736" x1="2160" />
            <wire x2="2192" y1="736" y2="736" x1="2176" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1568" y="928" type="branch" />
            <wire x2="1584" y1="928" y2="928" x1="1568" />
            <wire x2="1632" y1="928" y2="928" x1="1584" />
        </branch>
        <branch name="BUS_M_RDY_PAD_A">
            <wire x2="1600" y1="992" y2="992" x1="1584" />
            <wire x2="1632" y1="992" y2="992" x1="1600" />
        </branch>
        <branch name="bus_s_rdy_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1056" type="branch" />
            <wire x2="1616" y1="1056" y2="1056" x1="1600" />
            <wire x2="1632" y1="1056" y2="1056" x1="1616" />
        </branch>
        <branch name="bus_abort_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1120" type="branch" />
            <wire x2="1616" y1="1120" y2="1120" x1="1600" />
            <wire x2="1632" y1="1120" y2="1120" x1="1616" />
        </branch>
        <branch name="bus_m_rdy_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2192" y="976" type="branch" />
            <wire x2="2176" y1="976" y2="976" x1="2160" />
            <wire x2="2192" y1="976" y2="976" x1="2176" />
        </branch>
        <branch name="BUS_S_RDY_PAD_A">
            <wire x2="2176" y1="1056" y2="1056" x1="2160" />
        </branch>
        <branch name="BUS_ABORT_PAD_A">
            <wire x2="2176" y1="1120" y2="1120" x1="2160" />
            <wire x2="2192" y1="1120" y2="1120" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="1600" y="608" name="BUS_STB_PAD_A" orien="R180" />
        <iomarker fontsize="28" x="1600" y="672" name="BUS_WE_PAD_A" orien="R180" />
        <iomarker fontsize="28" x="2176" y="416" name="BUS_ACK_PAD_A" orien="R0" />
        <iomarker fontsize="28" x="2176" y="544" name="BUS_REQ_W_1_PAD_A" orien="R0" />
        <iomarker fontsize="28" x="2192" y="608" name="CLOCK_PAD_A" orien="R0" />
        <iomarker fontsize="28" x="2192" y="800" name="BUS_AD_PAD_A(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2192" y="480" name="BUS_REQ_R_1_PAD_A" orien="R0" />
        <iomarker fontsize="28" x="2192" y="736" name="BUS_REQ_R_2_PAD_A" orien="R0" />
        <iomarker fontsize="28" x="1584" y="992" name="BUS_M_RDY_PAD_A" orien="R180" />
        <iomarker fontsize="28" x="2176" y="1056" name="BUS_S_RDY_PAD_A" orien="R0" />
        <iomarker fontsize="28" x="2192" y="1120" name="BUS_ABORT_PAD_A" orien="R0" />
        <instance x="352" y="992" name="u_slave_debug_A" orien="R0">
        </instance>
        <branch name="CONTROL3(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="784" y="256" type="branch" />
            <wire x2="784" y1="256" y2="256" x1="736" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="256" type="branch" />
            <wire x2="352" y1="256" y2="256" x1="304" />
        </branch>
        <branch name="slave_stb_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="320" type="branch" />
            <wire x2="352" y1="320" y2="320" x1="320" />
        </branch>
        <branch name="slave_we_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="384" type="branch" />
            <wire x2="352" y1="384" y2="384" x1="320" />
        </branch>
        <branch name="slave_ack_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="448" type="branch" />
            <wire x2="352" y1="448" y2="448" x1="304" />
        </branch>
        <branch name="bus_m_rdy_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="512" type="branch" />
            <wire x2="352" y1="512" y2="512" x1="320" />
        </branch>
        <branch name="bus_s_rdy_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="576" type="branch" />
            <wire x2="352" y1="576" y2="576" x1="304" />
        </branch>
        <branch name="bus_abort_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="640" type="branch" />
            <wire x2="352" y1="640" y2="640" x1="320" />
        </branch>
        <branch name="slave_req_w_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="704" type="branch" />
            <wire x2="352" y1="704" y2="704" x1="320" />
        </branch>
        <branch name="slave_req_r_1_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="768" type="branch" />
            <wire x2="352" y1="768" y2="768" x1="304" />
        </branch>
        <branch name="slave_req_r_2_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="832" type="branch" />
            <wire x2="352" y1="832" y2="832" x1="320" />
        </branch>
        <branch name="slave_dat_i_A(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="896" type="branch" />
            <wire x2="352" y1="896" y2="896" x1="320" />
        </branch>
        <branch name="slave_dat_o_A(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="320" y="960" type="branch" />
            <wire x2="352" y1="960" y2="960" x1="320" />
        </branch>
        <branch name="fifo_prog_full_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="672" type="branch" />
            <wire x2="4192" y1="672" y2="672" x1="4160" />
        </branch>
        <branch name="fifo_length_A2(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="736" type="branch" />
            <wire x2="4176" y1="736" y2="736" x1="4160" />
        </branch>
        <branch name="fifo_prog_full_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="800" type="branch" />
            <wire x2="4176" y1="800" y2="800" x1="4160" />
        </branch>
        <branch name="fifo_length_A1(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="864" type="branch" />
            <wire x2="4192" y1="864" y2="864" x1="4160" />
        </branch>
        <branch name="fifo_length_B2(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="992" type="branch" />
            <wire x2="4192" y1="992" y2="992" x1="4160" />
        </branch>
        <branch name="fifo_prog_full_A4">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="928" type="branch" />
            <wire x2="4176" y1="928" y2="928" x1="4160" />
            <wire x2="4192" y1="928" y2="928" x1="4176" />
        </branch>
        <branch name="fifo_prog_full_A3">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1056" type="branch" />
            <wire x2="4176" y1="1056" y2="1056" x1="4160" />
        </branch>
        <branch name="fifo_length_B1(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1120" type="branch" />
            <wire x2="4176" y1="1120" y2="1120" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="1312" type="branch" />
            <wire x2="4192" y1="1312" y2="1312" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_A1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="1376" type="branch" />
            <wire x2="4192" y1="1376" y2="1376" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1440" type="branch" />
            <wire x2="4176" y1="1440" y2="1440" x1="4160" />
        </branch>
        <branch name="DMA_fifo_cnt_A1(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="1504" type="branch" />
            <wire x2="4192" y1="1504" y2="1504" x1="4160" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="288" type="branch" />
            <wire x2="3360" y1="288" y2="288" x1="3312" />
        </branch>
        <branch name="WB_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="352" type="branch" />
            <wire x2="3360" y1="352" y2="352" x1="3344" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="416" type="branch" />
            <wire x2="3360" y1="416" y2="416" x1="3328" />
        </branch>
        <branch name="fifo_data_valid_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="672" type="branch" />
            <wire x2="3360" y1="672" y2="672" x1="3328" />
        </branch>
        <branch name="fifo_data_A2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="736" type="branch" />
            <wire x2="3360" y1="736" y2="736" x1="3328" />
        </branch>
        <branch name="fifo_data_valid_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="800" type="branch" />
            <wire x2="3360" y1="800" y2="800" x1="3344" />
        </branch>
        <branch name="fifo_data_A1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="864" type="branch" />
            <wire x2="3360" y1="864" y2="864" x1="3344" />
        </branch>
        <branch name="fifo_data_valid_A4">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="928" type="branch" />
            <wire x2="3360" y1="928" y2="928" x1="3344" />
        </branch>
        <branch name="fifo_data_A4(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="992" type="branch" />
            <wire x2="3360" y1="992" y2="992" x1="3328" />
        </branch>
        <branch name="fifo_data_valid_A3">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="1056" type="branch" />
            <wire x2="3360" y1="1056" y2="1056" x1="3344" />
        </branch>
        <branch name="fifo_data_A3(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="1120" type="branch" />
            <wire x2="3360" y1="1120" y2="1120" x1="3344" />
        </branch>
        <branch name="DMA_fifo_rd_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="1568" type="branch" />
            <wire x2="3360" y1="1568" y2="1568" x1="3344" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1184" type="branch" />
            <wire x2="4176" y1="1184" y2="1184" x1="4160" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1184" type="branch" />
            <wire x2="3360" y1="1184" y2="1184" x1="3328" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_A1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1312" type="branch" />
            <wire x2="3360" y1="1312" y2="1312" x1="3328" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="1376" type="branch" />
            <wire x2="3360" y1="1376" y2="1376" x1="3344" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_B1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="1504" type="branch" />
            <wire x2="3360" y1="1504" y2="1504" x1="3344" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1248" type="branch" />
            <wire x2="4176" y1="1248" y2="1248" x1="4160" />
        </branch>
        <instance x="3360" y="1600" name="u_DMA_FIFOs" orien="R0">
        </instance>
        <branch name="down_fifo_empty_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="1648" type="branch" />
            <wire x2="4192" y1="1648" y2="1648" x1="4160" />
        </branch>
        <branch name="down_fifo_empty_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1712" type="branch" />
            <wire x2="4176" y1="1712" y2="1712" x1="4160" />
        </branch>
        <branch name="down_fifo_empty_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="1776" type="branch" />
            <wire x2="4192" y1="1776" y2="1776" x1="4160" />
        </branch>
        <branch name="down_fifo_empty_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="1840" type="branch" />
            <wire x2="4192" y1="1840" y2="1840" x1="4160" />
        </branch>
        <branch name="down_fifo_almost_empty_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1920" type="branch" />
            <wire x2="4176" y1="1920" y2="1920" x1="4160" />
        </branch>
        <branch name="down_fifo_almost_empty_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="1984" type="branch" />
            <wire x2="4176" y1="1984" y2="1984" x1="4160" />
        </branch>
        <branch name="down_fifo_almost_empty_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="2048" type="branch" />
            <wire x2="4176" y1="2048" y2="2048" x1="4160" />
        </branch>
        <branch name="down_fifo_almost_empty_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="2112" type="branch" />
            <wire x2="4176" y1="2112" y2="2112" x1="4160" />
        </branch>
        <branch name="down_fifo_rdat_A1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="2480" type="branch" />
            <wire x2="4192" y1="2480" y2="2480" x1="4160" />
        </branch>
        <branch name="down_fifo_rdat_A2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="2560" type="branch" />
            <wire x2="4176" y1="2560" y2="2560" x1="4160" />
        </branch>
        <branch name="down_fifo_rdat_B1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="2640" type="branch" />
            <wire x2="4176" y1="2640" y2="2640" x1="4160" />
        </branch>
        <branch name="down_fifo_rdat_B2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="2720" type="branch" />
            <wire x2="4176" y1="2720" y2="2720" x1="4160" />
        </branch>
        <branch name="down_fifo_rd_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1648" type="branch" />
            <wire x2="3360" y1="1648" y2="1648" x1="3328" />
        </branch>
        <branch name="down_fifo_rd_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1712" type="branch" />
            <wire x2="3360" y1="1712" y2="1712" x1="3328" />
        </branch>
        <branch name="down_fifo_rd_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1776" type="branch" />
            <wire x2="3360" y1="1776" y2="1776" x1="3328" />
        </branch>
        <branch name="down_fifo_rd_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1840" type="branch" />
            <wire x2="3360" y1="1840" y2="1840" x1="3328" />
        </branch>
        <instance x="2192" y="4720" name="u_DMA_FPGA_IOBUF_B" orien="R0">
        </instance>
        <branch name="slave_req_w_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2176" y="4368" type="branch" />
            <wire x2="2192" y1="4368" y2="4368" x1="2176" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="4432" type="branch" />
            <wire x2="2192" y1="4432" y2="4432" x1="2160" />
        </branch>
        <branch name="BUS_STB_PAD_B">
            <wire x2="2192" y1="4496" y2="4496" x1="2160" />
        </branch>
        <branch name="BUS_WE_PAD_B">
            <wire x2="2176" y1="4560" y2="4560" x1="2160" />
            <wire x2="2192" y1="4560" y2="4560" x1="2176" />
        </branch>
        <branch name="slave_dat_o_B(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="4624" type="branch" />
            <wire x2="2192" y1="4624" y2="4624" x1="2160" />
        </branch>
        <branch name="slave_stb_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2752" y="4176" type="branch" />
            <wire x2="2752" y1="4176" y2="4176" x1="2720" />
        </branch>
        <branch name="slave_we_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2752" y="4240" type="branch" />
            <wire x2="2752" y1="4240" y2="4240" x1="2720" />
        </branch>
        <branch name="BUS_ACK_PAD_B">
            <wire x2="2752" y1="4304" y2="4304" x1="2720" />
        </branch>
        <branch name="BUS_REQ_W_1_PAD_B">
            <wire x2="2736" y1="4432" y2="4432" x1="2720" />
            <wire x2="2752" y1="4432" y2="4432" x1="2736" />
        </branch>
        <branch name="CLOCK_PAD_B">
            <wire x2="2736" y1="4496" y2="4496" x1="2720" />
        </branch>
        <branch name="slave_dat_i_B(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2736" y="4560" type="branch" />
            <wire x2="2736" y1="4560" y2="4560" x1="2720" />
        </branch>
        <branch name="BUS_AD_PAD_B(31:0)">
            <wire x2="2752" y1="4688" y2="4688" x1="2720" />
        </branch>
        <branch name="BUS_REQ_R_1_PAD_B">
            <wire x2="2752" y1="4368" y2="4368" x1="2720" />
        </branch>
        <branch name="BUS_REQ_R_2_PAD_B">
            <wire x2="2736" y1="4624" y2="4624" x1="2720" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="4816" type="branch" />
            <wire x2="2192" y1="4816" y2="4816" x1="2160" />
        </branch>
        <branch name="BUS_M_RDY_PAD_B">
            <wire x2="2192" y1="4880" y2="4880" x1="2176" />
        </branch>
        <branch name="bus_s_rdy_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="4944" type="branch" />
            <wire x2="2192" y1="4944" y2="4944" x1="2160" />
        </branch>
        <branch name="bus_abort_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="5008" type="branch" />
            <wire x2="2192" y1="5008" y2="5008" x1="2160" />
        </branch>
        <branch name="bus_m_rdy_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2736" y="4864" type="branch" />
            <wire x2="2736" y1="4864" y2="4864" x1="2720" />
        </branch>
        <branch name="BUS_S_RDY_PAD_B">
            <wire x2="2752" y1="4944" y2="4944" x1="2720" />
        </branch>
        <branch name="BUS_ABORT_PAD_B">
            <wire x2="2736" y1="5008" y2="5008" x1="2720" />
            <wire x2="2752" y1="5008" y2="5008" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2160" y="4496" name="BUS_STB_PAD_B" orien="R180" />
        <iomarker fontsize="28" x="2160" y="4560" name="BUS_WE_PAD_B" orien="R180" />
        <iomarker fontsize="28" x="2752" y="4304" name="BUS_ACK_PAD_B" orien="R0" />
        <iomarker fontsize="28" x="2752" y="4432" name="BUS_REQ_W_1_PAD_B" orien="R0" />
        <iomarker fontsize="28" x="2736" y="4496" name="CLOCK_PAD_B" orien="R0" />
        <iomarker fontsize="28" x="2752" y="4688" name="BUS_AD_PAD_B(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2752" y="4368" name="BUS_REQ_R_1_PAD_B" orien="R0" />
        <iomarker fontsize="28" x="2736" y="4624" name="BUS_REQ_R_2_PAD_B" orien="R0" />
        <iomarker fontsize="28" x="2176" y="4880" name="BUS_M_RDY_PAD_B" orien="R180" />
        <iomarker fontsize="28" x="2752" y="4944" name="BUS_S_RDY_PAD_B" orien="R0" />
        <iomarker fontsize="28" x="2752" y="5008" name="BUS_ABORT_PAD_B" orien="R0" />
        <branch name="slave_req_r_2_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="4304" type="branch" />
            <wire x2="2192" y1="4304" y2="4304" x1="2160" />
        </branch>
        <branch name="slave_req_r_1_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="4176" type="branch" />
            <wire x2="2192" y1="4176" y2="4176" x1="2160" />
        </branch>
        <branch name="slave_ack_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2176" y="4240" type="branch" />
            <wire x2="2192" y1="4240" y2="4240" x1="2176" />
        </branch>
        <branch name="slave_dat_en_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2160" y="4112" type="branch" />
            <wire x2="2192" y1="4112" y2="4112" x1="2160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="2848" type="branch" />
            <wire x2="4192" y1="2848" y2="2848" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="2912" type="branch" />
            <wire x2="4176" y1="2912" y2="2912" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="2976" type="branch" />
            <wire x2="4192" y1="2976" y2="2976" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3520" type="branch" />
            <wire x2="4192" y1="3520" y2="3520" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3584" type="branch" />
            <wire x2="4192" y1="3584" y2="3584" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3648" type="branch" />
            <wire x2="4192" y1="3648" y2="3648" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_A2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3072" type="branch" />
            <wire x2="4192" y1="3072" y2="3072" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_B1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3136" type="branch" />
            <wire x2="4192" y1="3136" y2="3136" x1="4160" />
        </branch>
        <branch name="DMA_fifo_dat_B2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3200" type="branch" />
            <wire x2="4192" y1="3200" y2="3200" x1="4160" />
        </branch>
        <branch name="DMA_fifo_cnt_A2(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3296" type="branch" />
            <wire x2="4192" y1="3296" y2="3296" x1="4160" />
        </branch>
        <branch name="DMA_fifo_cnt_B1(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3360" type="branch" />
            <wire x2="4192" y1="3360" y2="3360" x1="4160" />
        </branch>
        <branch name="DMA_fifo_cnt_B2(27:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4176" y="3424" type="branch" />
            <wire x2="4176" y1="3424" y2="3424" x1="4160" />
        </branch>
        <branch name="DMA_fifo_rd_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2848" type="branch" />
            <wire x2="3360" y1="2848" y2="2848" x1="3328" />
        </branch>
        <branch name="DMA_fifo_rd_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2912" type="branch" />
            <wire x2="3360" y1="2912" y2="2912" x1="3328" />
        </branch>
        <branch name="DMA_fifo_rd_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2976" type="branch" />
            <wire x2="3360" y1="2976" y2="2976" x1="3328" />
        </branch>
        <instance x="688" y="4256" name="u_bus_slave_B" orien="R0">
        </instance>
        <branch name="bus_s_rdy_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1264" y="4432" type="branch" />
            <wire x2="1264" y1="4432" y2="4432" x1="1248" />
        </branch>
        <branch name="bus_abort_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="4368" type="branch" />
            <wire x2="1280" y1="4368" y2="4368" x1="1248" />
        </branch>
        <branch name="bus_m_rdy_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="4608" type="branch" />
            <wire x2="688" y1="4608" y2="4608" x1="672" />
        </branch>
        <branch name="slave_req_r_2_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1264" y="3872" type="branch" />
            <wire x2="1264" y1="3872" y2="3872" x1="1248" />
        </branch>
        <branch name="slave_req_r_1_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1264" y="3808" type="branch" />
            <wire x2="1264" y1="3808" y2="3808" x1="1248" />
        </branch>
        <branch name="down_fifo_rd_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="4304" type="branch" />
            <wire x2="1280" y1="4304" y2="4304" x1="1248" />
        </branch>
        <branch name="down_fifo_rd_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="3952" type="branch" />
            <wire x2="1280" y1="3952" y2="3952" x1="1248" />
        </branch>
        <branch name="down_fifo_rdat_B2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="656" y="4544" type="branch" />
            <wire x2="688" y1="4544" y2="4544" x1="656" />
        </branch>
        <branch name="down_fifo_rdat_B1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="4224" type="branch" />
            <wire x2="688" y1="4224" y2="4224" x1="672" />
        </branch>
        <branch name="down_fifo_almost_empty_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="656" y="4416" type="branch" />
            <wire x2="688" y1="4416" y2="4416" x1="656" />
        </branch>
        <branch name="down_fifo_almost_empty_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="656" y="3840" type="branch" />
            <wire x2="688" y1="3840" y2="3840" x1="656" />
        </branch>
        <branch name="down_fifo_empty_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="640" y="4352" type="branch" />
            <wire x2="688" y1="4352" y2="4352" x1="640" />
        </branch>
        <branch name="down_fifo_empty_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="640" y="3776" type="branch" />
            <wire x2="688" y1="3776" y2="3776" x1="640" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_B1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="4224" type="branch" />
            <wire x2="1280" y1="4224" y2="4224" x1="1248" />
        </branch>
        <branch name="slave_dat_o_B(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="4128" type="branch" />
            <wire x2="1280" y1="4128" y2="4128" x1="1248" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="4032" type="branch" />
            <wire x2="1280" y1="4032" y2="4032" x1="1248" />
        </branch>
        <branch name="slave_req_w_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1264" y="3744" type="branch" />
            <wire x2="1264" y1="3744" y2="3744" x1="1248" />
        </branch>
        <branch name="slave_dat_en_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1264" y="3648" type="branch" />
            <wire x2="1264" y1="3648" y2="3648" x1="1248" />
        </branch>
        <branch name="slave_ack_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1264" y="3456" type="branch" />
            <wire x2="1264" y1="3456" y2="3456" x1="1248" />
        </branch>
        <branch name="slave_dat_i_B(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="4160" type="branch" />
            <wire x2="688" y1="4160" y2="4160" x1="672" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="4096" type="branch" />
            <wire x2="688" y1="4096" y2="4096" x1="672" />
        </branch>
        <branch name="slave_stb_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="3648" type="branch" />
            <wire x2="688" y1="3648" y2="3648" x1="672" />
        </branch>
        <branch name="slave_we_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="3584" type="branch" />
            <wire x2="688" y1="3584" y2="3584" x1="672" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="3520" type="branch" />
            <wire x2="688" y1="3520" y2="3520" x1="672" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="640" y="3456" type="branch" />
            <wire x2="688" y1="3456" y2="3456" x1="640" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="928" y="2752" type="branch" />
            <wire x2="976" y1="2752" y2="2752" x1="928" />
        </branch>
        <branch name="slave_req_w_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2544" type="branch" />
            <wire x2="1584" y1="2544" y2="2544" x1="1536" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2608" type="branch" />
            <wire x2="1584" y1="2608" y2="2608" x1="1536" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_A2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2720" type="branch" />
            <wire x2="1568" y1="2720" y2="2720" x1="1536" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="640" y="4864" type="branch" />
            <wire x2="688" y1="4864" y2="4864" x1="640" />
        </branch>
        <branch name="slave_req_w_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="4656" type="branch" />
            <wire x2="1280" y1="4656" y2="4656" x1="1248" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1280" y="4720" type="branch" />
            <wire x2="1280" y1="4720" y2="4720" x1="1248" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_B2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1296" y="4832" type="branch" />
            <wire x2="1296" y1="4832" y2="4832" x1="1248" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="2192" type="branch" />
            <wire x2="3360" y1="2192" y2="2192" x1="3312" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2256" type="branch" />
            <wire x2="3360" y1="2256" y2="2256" x1="3328" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_A2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2336" type="branch" />
            <wire x2="3360" y1="2336" y2="2336" x1="3328" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_B2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2416" type="branch" />
            <wire x2="3360" y1="2416" y2="2416" x1="3328" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4208" y="3728" type="branch" />
            <wire x2="4208" y1="3728" y2="3728" x1="4160" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4192" y="3808" type="branch" />
            <wire x2="4192" y1="3808" y2="3808" x1="4160" />
        </branch>
        <branch name="BUS_REQ_W_2_PAD_A">
            <wire x2="2176" y1="896" y2="896" x1="2160" />
            <wire x2="2192" y1="896" y2="896" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2192" y="896" name="BUS_REQ_W_2_PAD_A" orien="R0" />
        <branch name="BUS_REQ_W_2_PAD_B">
            <wire x2="2768" y1="4784" y2="4784" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2768" y="4784" name="BUS_REQ_W_2_PAD_B" orien="R0" />
        <branch name="slave_req_w_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="1024" type="branch" />
            <wire x2="320" y1="1024" y2="1024" x1="304" />
            <wire x2="352" y1="1024" y2="1024" x1="320" />
        </branch>
        <branch name="slave_req_w_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1184" type="branch" />
            <wire x2="1616" y1="1184" y2="1184" x1="1600" />
            <wire x2="1632" y1="1184" y2="1184" x1="1616" />
        </branch>
        <branch name="slave_req_w_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2144" y="5072" type="branch" />
            <wire x2="2192" y1="5072" y2="5072" x1="2144" />
        </branch>
        <instance x="2224" y="2144" name="down_fifo_bus_A_debug" orien="R0">
        </instance>
        <instance x="6160" y="5216" name="u_slave_debug_B" orien="R0">
        </instance>
        <branch name="CONTROL2(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6592" y="4480" type="branch" />
            <wire x2="6592" y1="4480" y2="4480" x1="6544" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6112" y="4480" type="branch" />
            <wire x2="6160" y1="4480" y2="4480" x1="6112" />
        </branch>
        <branch name="slave_stb_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6096" y="4544" type="branch" />
            <wire x2="6160" y1="4544" y2="4544" x1="6096" />
        </branch>
        <branch name="slave_we_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6112" y="4608" type="branch" />
            <wire x2="6160" y1="4608" y2="4608" x1="6112" />
        </branch>
        <branch name="slave_ack_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6112" y="4672" type="branch" />
            <wire x2="6160" y1="4672" y2="4672" x1="6112" />
        </branch>
        <branch name="bus_m_rdy_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6112" y="4736" type="branch" />
            <wire x2="6160" y1="4736" y2="4736" x1="6112" />
        </branch>
        <branch name="bus_s_rdy_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6112" y="4800" type="branch" />
            <wire x2="6160" y1="4800" y2="4800" x1="6112" />
        </branch>
        <branch name="bus_abort_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6112" y="4864" type="branch" />
            <wire x2="6160" y1="4864" y2="4864" x1="6112" />
        </branch>
        <branch name="slave_req_w_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6128" y="4928" type="branch" />
            <wire x2="6160" y1="4928" y2="4928" x1="6128" />
        </branch>
        <branch name="slave_req_r_1_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6128" y="4992" type="branch" />
            <wire x2="6160" y1="4992" y2="4992" x1="6128" />
        </branch>
        <branch name="slave_req_r_2_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6112" y="5056" type="branch" />
            <wire x2="6160" y1="5056" y2="5056" x1="6112" />
        </branch>
        <branch name="slave_dat_i_B(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6128" y="5120" type="branch" />
            <wire x2="6160" y1="5120" y2="5120" x1="6128" />
        </branch>
        <branch name="slave_dat_o_B(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6128" y="5184" type="branch" />
            <wire x2="6160" y1="5184" y2="5184" x1="6128" />
        </branch>
        <branch name="slave_req_w_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6128" y="5248" type="branch" />
            <wire x2="6160" y1="5248" y2="5248" x1="6128" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2176" y="1728" type="branch" />
            <wire x2="2224" y1="1728" y2="1728" x1="2176" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2176" y="1792" type="branch" />
            <wire x2="2224" y1="1792" y2="1792" x1="2176" />
        </branch>
        <branch name="down_fifo_empty_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2192" y="1856" type="branch" />
            <wire x2="2224" y1="1856" y2="1856" x1="2192" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2192" y="1920" type="branch" />
            <wire x2="2224" y1="1920" y2="1920" x1="2192" />
        </branch>
        <branch name="down_fifo_rd_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2208" y="1984" type="branch" />
            <wire x2="2224" y1="1984" y2="1984" x1="2208" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_A1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2208" y="2048" type="branch" />
            <wire x2="2224" y1="2048" y2="2048" x1="2208" />
        </branch>
        <branch name="down_fifo_rdat_A1(31:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2176" y="2112" type="branch" />
            <wire x2="2224" y1="2112" y2="2112" x1="2176" />
            <wire x2="2176" y1="2112" y2="2144" x1="2176" />
        </branch>
        <instance x="6048" y="4160" name="u_icon" orien="R0">
        </instance>
        <branch name="CONTROL0(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6480" y="3936" type="branch" />
            <wire x2="6480" y1="3936" y2="3936" x1="6432" />
        </branch>
        <branch name="CONTROL1(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6480" y="4000" type="branch" />
            <wire x2="6480" y1="4000" y2="4000" x1="6432" />
        </branch>
        <branch name="CONTROL2(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6480" y="4064" type="branch" />
            <wire x2="6480" y1="4064" y2="4064" x1="6432" />
        </branch>
        <branch name="CONTROL3(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6480" y="4128" type="branch" />
            <wire x2="6480" y1="4128" y2="4128" x1="6432" />
        </branch>
        <branch name="CONTROL4(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6496" y="4192" type="branch" />
            <wire x2="6496" y1="4192" y2="4192" x1="6432" />
        </branch>
        <branch name="CONTROL5(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6480" y="4240" type="branch" />
            <wire x2="6480" y1="4240" y2="4240" x1="6432" />
        </branch>
        <branch name="CONTROL4(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2704" y="1728" type="branch" />
            <wire x2="2704" y1="1728" y2="1728" x1="2672" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2192" y="2176" type="branch" />
            <wire x2="2224" y1="2176" y2="2176" x1="2192" />
        </branch>
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="3072" type="branch" />
            <wire x2="3360" y1="3072" y2="3072" x1="3328" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="3152" type="branch" />
            <wire x2="3360" y1="3152" y2="3152" x1="3344" />
        </branch>
        <branch name="rst_channel_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="3232" type="branch" />
            <wire x2="3360" y1="3232" y2="3232" x1="3328" />
        </branch>
        <branch name="rst_channel_3">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="3312" type="branch" />
            <wire x2="3360" y1="3312" y2="3312" x1="3328" />
        </branch>
        <instance x="5328" y="1840" name="u_DMA_INTERFACE" orien="R0">
        </instance>
        <iomarker fontsize="28" x="5984" y="336" name="PCI_INTA" orien="R0" />
        <iomarker fontsize="28" x="5984" y="400" name="PCI_REQ" orien="R0" />
        <iomarker fontsize="28" x="5984" y="464" name="PCI_SERR" orien="R0" />
        <iomarker fontsize="28" x="5968" y="1232" name="PCI_FRAME" orien="R0" />
        <iomarker fontsize="28" x="5984" y="1296" name="PCI_IRDY" orien="R0" />
        <iomarker fontsize="28" x="5984" y="1360" name="PCI_DEVSEL" orien="R0" />
        <iomarker fontsize="28" x="5984" y="1424" name="PCI_TRDY" orien="R0" />
        <iomarker fontsize="28" x="5984" y="1488" name="PCI_STOP" orien="R0" />
        <iomarker fontsize="28" x="5968" y="1552" name="PCI_PAR" orien="R0" />
        <iomarker fontsize="28" x="5968" y="1616" name="PCI_PERR" orien="R0" />
        <iomarker fontsize="28" x="5984" y="1680" name="PCI_AD(31:0)" orien="R0" />
        <iomarker fontsize="28" x="6000" y="1744" name="PCI_CBE(3:0)" orien="R0" />
        <iomarker fontsize="28" x="5296" y="400" name="PCI_RST" orien="R180" />
        <iomarker fontsize="28" x="5296" y="464" name="PCI_GNT" orien="R180" />
        <iomarker fontsize="28" x="5312" y="528" name="PCI_IDSEL" orien="R180" />
        <branch name="PCI_INTA">
            <wire x2="5968" y1="336" y2="336" x1="5952" />
            <wire x2="5984" y1="336" y2="336" x1="5968" />
        </branch>
        <branch name="PCI_REQ">
            <wire x2="5968" y1="400" y2="400" x1="5952" />
            <wire x2="5984" y1="400" y2="400" x1="5968" />
        </branch>
        <branch name="PCI_SERR">
            <wire x2="5968" y1="464" y2="464" x1="5952" />
            <wire x2="5984" y1="464" y2="464" x1="5968" />
        </branch>
        <branch name="WB_PCI_RST">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="528" type="branch" />
            <wire x2="5968" y1="528" y2="528" x1="5952" />
            <wire x2="5984" y1="528" y2="528" x1="5968" />
        </branch>
        <branch name="DMA_fifo_rd_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5968" y="656" type="branch" />
            <wire x2="5968" y1="656" y2="656" x1="5952" />
        </branch>
        <branch name="fifo_data_valid_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="720" type="branch" />
            <wire x2="5968" y1="720" y2="720" x1="5952" />
            <wire x2="5984" y1="720" y2="720" x1="5968" />
        </branch>
        <branch name="fifo_data_valid_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="784" type="branch" />
            <wire x2="5968" y1="784" y2="784" x1="5952" />
            <wire x2="5984" y1="784" y2="784" x1="5968" />
        </branch>
        <branch name="fifo_data_valid_A3">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="848" type="branch" />
            <wire x2="5968" y1="848" y2="848" x1="5952" />
            <wire x2="5984" y1="848" y2="848" x1="5968" />
        </branch>
        <branch name="fifo_data_valid_A4">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="912" type="branch" />
            <wire x2="5968" y1="912" y2="912" x1="5952" />
            <wire x2="5984" y1="912" y2="912" x1="5968" />
        </branch>
        <branch name="fifo_data_A1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5968" y="976" type="branch" />
            <wire x2="5968" y1="976" y2="976" x1="5952" />
        </branch>
        <branch name="fifo_data_A2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5968" y="1040" type="branch" />
            <wire x2="5968" y1="1040" y2="1040" x1="5952" />
        </branch>
        <branch name="fifo_data_A3(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5968" y="1104" type="branch" />
            <wire x2="5968" y1="1104" y2="1104" x1="5952" />
        </branch>
        <branch name="fifo_data_A4(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5968" y="1168" type="branch" />
            <wire x2="5968" y1="1168" y2="1168" x1="5952" />
        </branch>
        <branch name="PCI_FRAME">
            <wire x2="5968" y1="1232" y2="1232" x1="5952" />
        </branch>
        <branch name="PCI_IRDY">
            <wire x2="5968" y1="1296" y2="1296" x1="5952" />
            <wire x2="5984" y1="1296" y2="1296" x1="5968" />
        </branch>
        <branch name="PCI_DEVSEL">
            <wire x2="5968" y1="1360" y2="1360" x1="5952" />
            <wire x2="5984" y1="1360" y2="1360" x1="5968" />
        </branch>
        <branch name="PCI_TRDY">
            <wire x2="5968" y1="1424" y2="1424" x1="5952" />
            <wire x2="5984" y1="1424" y2="1424" x1="5968" />
        </branch>
        <branch name="PCI_STOP">
            <wire x2="5968" y1="1488" y2="1488" x1="5952" />
            <wire x2="5984" y1="1488" y2="1488" x1="5968" />
        </branch>
        <branch name="PCI_PAR">
            <wire x2="5968" y1="1552" y2="1552" x1="5952" />
        </branch>
        <branch name="PCI_PERR">
            <wire x2="5968" y1="1616" y2="1616" x1="5952" />
        </branch>
        <branch name="PCI_AD(31:0)">
            <wire x2="5968" y1="1680" y2="1680" x1="5952" />
            <wire x2="5984" y1="1680" y2="1680" x1="5968" />
        </branch>
        <branch name="PCI_CBE(3:0)">
            <wire x2="5968" y1="1744" y2="1744" x1="5952" />
            <wire x2="5984" y1="1744" y2="1744" x1="5968" />
            <wire x2="6000" y1="1744" y2="1744" x1="5984" />
        </branch>
        <branch name="PCI_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="336" type="branch" />
            <wire x2="5312" y1="336" y2="336" x1="5296" />
            <wire x2="5328" y1="336" y2="336" x1="5312" />
        </branch>
        <branch name="PCI_RST">
            <wire x2="5312" y1="400" y2="400" x1="5296" />
            <wire x2="5328" y1="400" y2="400" x1="5312" />
        </branch>
        <branch name="PCI_GNT">
            <wire x2="5312" y1="464" y2="464" x1="5296" />
            <wire x2="5328" y1="464" y2="464" x1="5312" />
        </branch>
        <branch name="PCI_IDSEL">
            <wire x2="5328" y1="528" y2="528" x1="5312" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="592" type="branch" />
            <wire x2="5312" y1="592" y2="592" x1="5296" />
            <wire x2="5328" y1="592" y2="592" x1="5312" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="656" type="branch" />
            <wire x2="5312" y1="656" y2="656" x1="5296" />
            <wire x2="5328" y1="656" y2="656" x1="5312" />
        </branch>
        <branch name="DMA_fifo_cnt_A1(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="784" type="branch" />
            <wire x2="5312" y1="784" y2="784" x1="5296" />
            <wire x2="5328" y1="784" y2="784" x1="5312" />
        </branch>
        <branch name="fifo_length_A1(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1168" type="branch" />
            <wire x2="5312" y1="1168" y2="1168" x1="5296" />
            <wire x2="5328" y1="1168" y2="1168" x1="5312" />
        </branch>
        <branch name="fifo_length_A2(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="1232" type="branch" />
            <wire x2="5328" y1="1232" y2="1232" x1="5312" />
        </branch>
        <branch name="fifo_length_B1(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1296" type="branch" />
            <wire x2="5312" y1="1296" y2="1296" x1="5296" />
            <wire x2="5328" y1="1296" y2="1296" x1="5312" />
        </branch>
        <branch name="fifo_length_B2(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1360" type="branch" />
            <wire x2="5312" y1="1360" y2="1360" x1="5296" />
            <wire x2="5328" y1="1360" y2="1360" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1424" type="branch" />
            <wire x2="5312" y1="1424" y2="1424" x1="5296" />
            <wire x2="5328" y1="1424" y2="1424" x1="5312" />
        </branch>
        <branch name="fifo_prog_full_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1488" type="branch" />
            <wire x2="5312" y1="1488" y2="1488" x1="5296" />
            <wire x2="5328" y1="1488" y2="1488" x1="5312" />
        </branch>
        <branch name="fifo_prog_full_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="1552" type="branch" />
            <wire x2="5328" y1="1552" y2="1552" x1="5312" />
        </branch>
        <branch name="fifo_prog_full_A3">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="1616" type="branch" />
            <wire x2="5328" y1="1616" y2="1616" x1="5312" />
        </branch>
        <branch name="fifo_prog_full_A4">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1680" type="branch" />
            <wire x2="5312" y1="1680" y2="1680" x1="5296" />
            <wire x2="5328" y1="1680" y2="1680" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_A1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="1744" type="branch" />
            <wire x2="5328" y1="1744" y2="1744" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="1808" type="branch" />
            <wire x2="5328" y1="1808" y2="1808" x1="5312" />
        </branch>
        <branch name="CONTROL0(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6016" y="1872" type="branch" />
            <wire x2="6000" y1="1872" y2="1872" x1="5952" />
            <wire x2="6016" y1="1872" y2="1872" x1="6000" />
        </branch>
        <branch name="CONTROL1(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6016" y="1936" type="branch" />
            <wire x2="6000" y1="1936" y2="1936" x1="5952" />
            <wire x2="6016" y1="1936" y2="1936" x1="6000" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1984" type="branch" />
            <wire x2="5312" y1="1984" y2="1984" x1="5296" />
            <wire x2="5328" y1="1984" y2="1984" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2032" type="branch" />
            <wire x2="5312" y1="2032" y2="2032" x1="5296" />
            <wire x2="5328" y1="2032" y2="2032" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2080" type="branch" />
            <wire x2="5312" y1="2080" y2="2080" x1="5296" />
            <wire x2="5328" y1="2080" y2="2080" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="2144" type="branch" />
            <wire x2="5328" y1="2144" y2="2144" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="2192" type="branch" />
            <wire x2="5328" y1="2192" y2="2192" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="2240" type="branch" />
            <wire x2="5328" y1="2240" y2="2240" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_A2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="2304" type="branch" />
            <wire x2="5328" y1="2304" y2="2304" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_B1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="2352" type="branch" />
            <wire x2="5328" y1="2352" y2="2352" x1="5312" />
        </branch>
        <branch name="DMA_fifo_dat_B2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="2400" type="branch" />
            <wire x2="5328" y1="2400" y2="2400" x1="5312" />
        </branch>
        <branch name="DMA_fifo_cnt_A2(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="848" type="branch" />
            <wire x2="5312" y1="848" y2="848" x1="5296" />
            <wire x2="5328" y1="848" y2="848" x1="5312" />
        </branch>
        <branch name="DMA_fifo_cnt_B1(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="912" type="branch" />
            <wire x2="5312" y1="912" y2="912" x1="5296" />
            <wire x2="5328" y1="912" y2="912" x1="5312" />
        </branch>
        <branch name="DMA_fifo_cnt_B2(27:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="976" type="branch" />
            <wire x2="5312" y1="976" y2="976" x1="5296" />
            <wire x2="5328" y1="976" y2="976" x1="5312" />
        </branch>
        <branch name="DMA_fifo_rd_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="2448" type="branch" />
            <wire x2="5968" y1="2448" y2="2448" x1="5952" />
            <wire x2="5984" y1="2448" y2="2448" x1="5968" />
        </branch>
        <branch name="DMA_fifo_rd_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="2496" type="branch" />
            <wire x2="5968" y1="2496" y2="2496" x1="5952" />
            <wire x2="5984" y1="2496" y2="2496" x1="5968" />
        </branch>
        <branch name="DMA_fifo_rd_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="2544" type="branch" />
            <wire x2="5968" y1="2544" y2="2544" x1="5952" />
            <wire x2="5984" y1="2544" y2="2544" x1="5968" />
        </branch>
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6000" y="2272" type="branch" />
            <wire x2="5984" y1="2272" y2="2272" x1="5952" />
            <wire x2="6000" y1="2272" y2="2272" x1="5984" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="2320" type="branch" />
            <wire x2="5968" y1="2320" y2="2320" x1="5952" />
            <wire x2="5984" y1="2320" y2="2320" x1="5968" />
        </branch>
        <branch name="rst_channel_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="2368" type="branch" />
            <wire x2="5968" y1="2368" y2="2368" x1="5952" />
            <wire x2="5984" y1="2368" y2="2368" x1="5968" />
        </branch>
        <branch name="rst_channel_3">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="2000" type="branch" />
            <wire x2="5968" y1="2000" y2="2000" x1="5952" />
            <wire x2="5984" y1="2000" y2="2000" x1="5968" />
        </branch>
        <branch name="channel_0_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2448" type="branch" />
            <wire x2="5312" y1="2448" y2="2448" x1="5296" />
            <wire x2="5328" y1="2448" y2="2448" x1="5312" />
        </branch>
        <branch name="channel_1_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2496" type="branch" />
            <wire x2="5312" y1="2496" y2="2496" x1="5296" />
            <wire x2="5328" y1="2496" y2="2496" x1="5312" />
        </branch>
        <branch name="channel_2_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2544" type="branch" />
            <wire x2="5312" y1="2544" y2="2544" x1="5296" />
            <wire x2="5328" y1="2544" y2="2544" x1="5312" />
        </branch>
        <branch name="channel_3_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2592" type="branch" />
            <wire x2="5312" y1="2592" y2="2592" x1="5296" />
            <wire x2="5328" y1="2592" y2="2592" x1="5312" />
        </branch>
        <branch name="dma_in_use">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5984" y="2608" type="branch" />
            <wire x2="5968" y1="2608" y2="2608" x1="5952" />
            <wire x2="5984" y1="2608" y2="2608" x1="5968" />
        </branch>
        <instance x="6000" y="2176" name="XLXI_17" orien="R0" />
        <instance x="6000" y="2096" name="XLXI_16" orien="R0" />
        <branch name="XLXN_14">
            <wire x2="6000" y1="2064" y2="2064" x1="5952" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="5968" y1="2112" y2="2112" x1="5952" />
            <wire x2="5968" y1="2112" y2="2144" x1="5968" />
            <wire x2="6000" y1="2144" y2="2144" x1="5968" />
        </branch>
        <branch name="pulse_A">
            <wire x2="6240" y1="2064" y2="2064" x1="6224" />
        </branch>
        <branch name="pulse_B">
            <wire x2="6240" y1="2144" y2="2144" x1="6224" />
        </branch>
        <iomarker fontsize="28" x="6240" y="2064" name="pulse_A" orien="R0" />
        <iomarker fontsize="28" x="6240" y="2144" name="pulse_B" orien="R0" />
        <branch name="BOARD_IDENT_IN(5:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1104" type="branch" />
            <wire x2="5328" y1="1104" y2="1104" x1="5296" />
        </branch>
        <branch name="bc0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1856" type="branch" />
            <wire x2="5328" y1="1856" y2="1856" x1="5296" />
        </branch>
        <branch name="bc1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1904" type="branch" />
            <wire x2="5328" y1="1904" y2="1904" x1="5296" />
        </branch>
        <branch name="bc2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="1024" type="branch" />
            <wire x2="5328" y1="1024" y2="1024" x1="5296" />
        </branch>
        <branch name="bc3_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="720" type="branch" />
            <wire x2="5328" y1="720" y2="720" x1="5312" />
        </branch>
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4224" y="4512" type="branch" />
            <wire x2="4320" y1="4512" y2="4512" x1="4224" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4224" y="4592" type="branch" />
            <wire x2="4336" y1="4592" y2="4592" x1="4224" />
        </branch>
        <branch name="rst_channel_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4240" y="4672" type="branch" />
            <wire x2="4336" y1="4672" y2="4672" x1="4240" />
        </branch>
        <branch name="rst_channel_3">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4240" y="4752" type="branch" />
            <wire x2="4336" y1="4752" y2="4752" x1="4240" />
        </branch>
        <instance x="4320" y="4544" name="XLXI_1" orien="R0" />
        <instance x="4336" y="4624" name="XLXI_2" orien="R0" />
        <instance x="4336" y="4704" name="XLXI_3" orien="R0" />
        <instance x="4336" y="4784" name="XLXI_4" orien="R0" />
        <branch name="rst_channel_0_pad">
            <wire x2="4592" y1="4512" y2="4512" x1="4544" />
        </branch>
        <branch name="rst_channel_1_pad">
            <wire x2="4592" y1="4592" y2="4592" x1="4560" />
        </branch>
        <branch name="rst_channel_2_pad">
            <wire x2="4592" y1="4672" y2="4672" x1="4560" />
        </branch>
        <branch name="rst_channel_3_pad">
            <wire x2="4592" y1="4752" y2="4752" x1="4560" />
        </branch>
        <instance x="4368" y="5072" name="XLXI_8" orien="R0" />
        <instance x="4368" y="5152" name="XLXI_9" orien="R0" />
        <instance x="4368" y="5232" name="XLXI_10" orien="R0" />
        <instance x="4368" y="4992" name="XLXI_7" orien="R0" />
        <branch name="channel_0_up_pad">
            <wire x2="4368" y1="4960" y2="4960" x1="4320" />
        </branch>
        <branch name="channel_1_up_pad">
            <wire x2="4352" y1="5040" y2="5040" x1="4320" />
            <wire x2="4368" y1="5040" y2="5040" x1="4352" />
        </branch>
        <branch name="channel_2_up_pad">
            <wire x2="4352" y1="5120" y2="5120" x1="4320" />
            <wire x2="4368" y1="5120" y2="5120" x1="4352" />
        </branch>
        <branch name="channel_3_up_pad">
            <wire x2="4352" y1="5200" y2="5200" x1="4320" />
            <wire x2="4368" y1="5200" y2="5200" x1="4352" />
        </branch>
        <branch name="channel_0_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4656" y="4960" type="branch" />
            <wire x2="4640" y1="4960" y2="4960" x1="4592" />
            <wire x2="4656" y1="4960" y2="4960" x1="4640" />
        </branch>
        <branch name="channel_1_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4640" y="5040" type="branch" />
            <wire x2="4640" y1="5040" y2="5040" x1="4592" />
        </branch>
        <branch name="channel_2_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4656" y="5120" type="branch" />
            <wire x2="4656" y1="5120" y2="5120" x1="4592" />
        </branch>
        <branch name="channel_3_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4656" y="5200" type="branch" />
            <wire x2="4656" y1="5200" y2="5200" x1="4592" />
        </branch>
        <instance x="5312" y="4528" name="XLXI_18" orien="R0" />
        <instance x="5312" y="4592" name="XLXI_19" orien="R0" />
        <instance x="5312" y="4656" name="XLXI_20" orien="R0" />
        <instance x="5312" y="4720" name="XLXI_21" orien="R0" />
        <instance x="5312" y="4784" name="XLXI_22" orien="R0" />
        <instance x="5312" y="4848" name="XLXI_23" orien="R0" />
        <branch name="BOARD_IDENT(5)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5280" y="4496" type="branch" />
            <wire x2="5312" y1="4496" y2="4496" x1="5280" />
        </branch>
        <branch name="BOARD_IDENT(4)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5280" y="4560" type="branch" />
            <wire x2="5312" y1="4560" y2="4560" x1="5280" />
        </branch>
        <branch name="BOARD_IDENT(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5280" y="4624" type="branch" />
            <wire x2="5312" y1="4624" y2="4624" x1="5280" />
        </branch>
        <branch name="BOARD_IDENT(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5280" y="4688" type="branch" />
            <wire x2="5312" y1="4688" y2="4688" x1="5280" />
        </branch>
        <branch name="BOARD_IDENT(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5280" y="4752" type="branch" />
            <wire x2="5312" y1="4752" y2="4752" x1="5280" />
        </branch>
        <branch name="BOARD_IDENT(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5280" y="4816" type="branch" />
            <wire x2="5312" y1="4816" y2="4816" x1="5280" />
        </branch>
        <branch name="BOARD_IDENT(5:0)">
            <wire x2="5232" y1="4944" y2="4944" x1="5200" />
        </branch>
        <branch name="BOARD_IDENT_IN(5)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5568" y="4496" type="branch" />
            <wire x2="5568" y1="4496" y2="4496" x1="5536" />
        </branch>
        <branch name="BOARD_IDENT_IN(4)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5552" y="4560" type="branch" />
            <wire x2="5552" y1="4560" y2="4560" x1="5536" />
        </branch>
        <branch name="BOARD_IDENT_IN(3)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5552" y="4624" type="branch" />
            <wire x2="5552" y1="4624" y2="4624" x1="5536" />
        </branch>
        <branch name="BOARD_IDENT_IN(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5552" y="4688" type="branch" />
            <wire x2="5552" y1="4688" y2="4688" x1="5536" />
        </branch>
        <branch name="BOARD_IDENT_IN(1)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5568" y="4752" type="branch" />
            <wire x2="5568" y1="4752" y2="4752" x1="5536" />
        </branch>
        <branch name="BOARD_IDENT_IN(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5552" y="4816" type="branch" />
            <wire x2="5552" y1="4816" y2="4816" x1="5536" />
        </branch>
        <branch name="bc0">
            <wire x2="5072" y1="5104" y2="5104" x1="5024" />
        </branch>
        <branch name="bc1">
            <wire x2="5072" y1="5168" y2="5168" x1="5024" />
        </branch>
        <branch name="bc2">
            <wire x2="5072" y1="5232" y2="5232" x1="5024" />
        </branch>
        <branch name="bc3">
            <wire x2="5072" y1="5296" y2="5296" x1="5024" />
        </branch>
        <instance x="5072" y="5136" name="XLXI_24" orien="R0" />
        <instance x="5072" y="5200" name="XLXI_25" orien="R0" />
        <instance x="5072" y="5264" name="XLXI_26" orien="R0" />
        <instance x="5072" y="5328" name="XLXI_27" orien="R0" />
        <branch name="bc0_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5328" y="5104" type="branch" />
            <wire x2="5328" y1="5104" y2="5104" x1="5296" />
        </branch>
        <branch name="bc1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5328" y="5168" type="branch" />
            <wire x2="5328" y1="5168" y2="5168" x1="5296" />
        </branch>
        <branch name="bc2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5328" y="5232" type="branch" />
            <wire x2="5328" y1="5232" y2="5232" x1="5296" />
        </branch>
        <branch name="bc3_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5328" y="5296" type="branch" />
            <wire x2="5328" y1="5296" y2="5296" x1="5296" />
        </branch>
        <iomarker fontsize="28" x="4592" y="4512" name="rst_channel_0_pad" orien="R0" />
        <iomarker fontsize="28" x="4592" y="4592" name="rst_channel_1_pad" orien="R0" />
        <iomarker fontsize="28" x="4592" y="4672" name="rst_channel_2_pad" orien="R0" />
        <iomarker fontsize="28" x="4592" y="4752" name="rst_channel_3_pad" orien="R0" />
        <iomarker fontsize="28" x="4320" y="4960" name="channel_0_up_pad" orien="R180" />
        <iomarker fontsize="28" x="4320" y="5040" name="channel_1_up_pad" orien="R180" />
        <iomarker fontsize="28" x="4320" y="5120" name="channel_2_up_pad" orien="R180" />
        <iomarker fontsize="28" x="4320" y="5200" name="channel_3_up_pad" orien="R180" />
        <iomarker fontsize="28" x="5200" y="4944" name="BOARD_IDENT(5:0)" orien="R180" />
        <iomarker fontsize="28" x="5024" y="5104" name="bc0" orien="R180" />
        <iomarker fontsize="28" x="5024" y="5168" name="bc1" orien="R180" />
        <iomarker fontsize="28" x="5024" y="5232" name="bc2" orien="R180" />
        <iomarker fontsize="28" x="5024" y="5296" name="bc3" orien="R180" />
        <instance x="4976" y="4256" name="down_fifo_dma_A_debug" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4960" y="3840" type="branch" />
            <wire x2="4976" y1="3840" y2="3840" x1="4960" />
        </branch>
        <branch name="fifo_prog_full_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4960" y="3904" type="branch" />
            <wire x2="4976" y1="3904" y2="3904" x1="4960" />
        </branch>
        <branch name="fifo_data_valid_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="4032" type="branch" />
            <wire x2="4976" y1="4032" y2="4032" x1="4944" />
        </branch>
        <branch name="fifo_data_A1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="4160" type="branch" />
            <wire x2="4976" y1="4160" y2="4160" x1="4944" />
        </branch>
        <branch name="CONTROL5(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5456" y="3840" type="branch" />
            <wire x2="5456" y1="3840" y2="3840" x1="5424" />
        </branch>
        <branch name="DMA_fifo_dat_A1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="4224" type="branch" />
            <wire x2="4976" y1="4224" y2="4224" x1="4944" />
        </branch>
        <branch name="DMA_fifo_rd_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="4096" type="branch" />
            <wire x2="4976" y1="4096" y2="4096" x1="4944" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="3968" type="branch" />
            <wire x2="4976" y1="3968" y2="3968" x1="4944" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4944" y="4288" type="branch" />
            <wire x2="4976" y1="4288" y2="4288" x1="4944" />
        </branch>
        <instance x="6368" y="3616" name="u_clk_gen_top" orien="R0">
        </instance>
        <branch name="PCLK">
            <wire x2="6368" y1="3136" y2="3136" x1="6352" />
        </branch>
        <branch name="WB_PCI_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6336" y="3584" type="branch" />
            <wire x2="6368" y1="3584" y2="3584" x1="6336" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6848" y="3328" type="branch" />
            <wire x2="6848" y1="3328" y2="3328" x1="6800" />
        </branch>
        <branch name="WB_RST">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6832" y="3392" type="branch" />
            <wire x2="6832" y1="3392" y2="3392" x1="6800" />
        </branch>
        <branch name="PCI_CLK">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6816" y="3456" type="branch" />
            <wire x2="6816" y1="3456" y2="3456" x1="6800" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6816" y="3520" type="branch" />
            <wire x2="6816" y1="3520" y2="3520" x1="6800" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6816" y="3584" type="branch" />
            <wire x2="6816" y1="3584" y2="3584" x1="6800" />
        </branch>
        <iomarker fontsize="28" x="6352" y="3136" name="PCLK" orien="R180" />
        <instance x="5072" y="3568" name="XLXI_11" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5040" y="3408" type="branch" />
            <wire x2="5072" y1="3408" y2="3408" x1="5040" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="5072" y1="3472" y2="3472" x1="5056" />
        </branch>
        <instance x="4832" y="3504" name="XLXI_12" orien="R0" />
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4800" y="3472" type="branch" />
            <wire x2="4832" y1="3472" y2="3472" x1="4800" />
        </branch>
        <branch name="dma_in_use">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5040" y="3536" type="branch" />
            <wire x2="5072" y1="3536" y2="3536" x1="5040" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="5488" y1="3536" y2="3536" x1="5456" />
        </branch>
        <instance x="5488" y="3568" name="XLXI_14" orien="R0" />
        <branch name="LED_GREEN">
            <wire x2="5728" y1="3408" y2="3408" x1="5712" />
            <wire x2="5744" y1="3408" y2="3408" x1="5728" />
        </branch>
        <branch name="LED_RED">
            <wire x2="5728" y1="3536" y2="3536" x1="5712" />
            <wire x2="5760" y1="3536" y2="3536" x1="5728" />
        </branch>
        <iomarker fontsize="28" x="5744" y="3408" name="LED_GREEN" orien="R0" />
        <iomarker fontsize="28" x="5760" y="3536" name="LED_RED" orien="R0" />
        <instance x="1984" y="3344" name="u_monitor_pulse_start_end_A" orien="R0">
        </instance>
        <instance x="1984" y="3760" name="u_monitor_pulse_start_end_B" orien="R0">
        </instance>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1920" y="3120" type="branch" />
            <wire x2="1984" y1="3120" y2="3120" x1="1920" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1936" y="3536" type="branch" />
            <wire x2="1984" y1="3536" y2="3536" x1="1936" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1952" y="3184" type="branch" />
            <wire x2="1984" y1="3184" y2="3184" x1="1952" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1936" y="3600" type="branch" />
            <wire x2="1984" y1="3600" y2="3600" x1="1936" />
        </branch>
        <instance x="1632" y="832" name="u_DMA_FPGA_IOBUF_A" orien="R0">
        </instance>
        <branch name="XLXN_21">
            <wire x2="1984" y1="3248" y2="3248" x1="1952" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="1984" y1="3312" y2="3312" x1="1952" />
        </branch>
        <instance x="1728" y="3344" name="XLXI_32" orien="R0" />
        <branch name="XLXN_24">
            <wire x2="1984" y1="3664" y2="3664" x1="1968" />
        </branch>
        <branch name="XLXN_25">
            <wire x2="1984" y1="3728" y2="3728" x1="1968" />
        </branch>
        <instance x="1728" y="3280" name="XLXI_31" orien="R0" />
        <instance x="1744" y="3696" name="XLXI_33" orien="R0" />
        <instance x="1744" y="3760" name="XLXI_34" orien="R0" />
        <branch name="start_pulse_A">
            <wire x2="1728" y1="3248" y2="3248" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1712" y="3248" name="start_pulse_A" orien="R180" />
        <branch name="end_pulse_A">
            <wire x2="1728" y1="3312" y2="3312" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1712" y="3312" name="end_pulse_A" orien="R180" />
        <branch name="start_pulse_B">
            <wire x2="1744" y1="3664" y2="3664" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1728" y="3664" name="start_pulse_B" orien="R180" />
        <branch name="end_pulse_B">
            <wire x2="1744" y1="3728" y2="3728" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1728" y="3728" name="end_pulse_B" orien="R180" />
        <branch name="start_pulse_A_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2496" y="3120" type="branch" />
            <wire x2="2496" y1="3120" y2="3120" x1="2448" />
        </branch>
        <branch name="end_pulse_A_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2480" y="3216" type="branch" />
            <wire x2="2480" y1="3216" y2="3216" x1="2448" />
        </branch>
        <branch name="start_end_pulse_A_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2480" y="3312" type="branch" />
            <wire x2="2480" y1="3312" y2="3312" x1="2448" />
        </branch>
        <branch name="start_pulse_B_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2480" y="3536" type="branch" />
            <wire x2="2480" y1="3536" y2="3536" x1="2448" />
        </branch>
        <branch name="end_pulse_B_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2480" y="3632" type="branch" />
            <wire x2="2480" y1="3632" y2="3632" x1="2448" />
        </branch>
        <branch name="start_end_pulse_B_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2480" y="3728" type="branch" />
            <wire x2="2480" y1="3728" y2="3728" x1="2448" />
        </branch>
        <branch name="start_pulse_A_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2640" type="branch" />
            <wire x2="5328" y1="2640" y2="2640" x1="5296" />
        </branch>
        <branch name="end_pulse_A_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2688" type="branch" />
            <wire x2="5328" y1="2688" y2="2688" x1="5296" />
        </branch>
        <branch name="start_end_pulse_A_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5312" y="2736" type="branch" />
            <wire x2="5328" y1="2736" y2="2736" x1="5312" />
        </branch>
        <branch name="start_pulse_B_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2784" type="branch" />
            <wire x2="5328" y1="2784" y2="2784" x1="5296" />
        </branch>
        <branch name="end_pulse_B_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2832" type="branch" />
            <wire x2="5328" y1="2832" y2="2832" x1="5296" />
        </branch>
        <branch name="start_end_pulse_B_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5296" y="2880" type="branch" />
            <wire x2="5328" y1="2880" y2="2880" x1="5296" />
        </branch>
        <branch name="LED_GREENX">
            <wire x2="5472" y1="3408" y2="3408" x1="5456" />
            <wire x2="5488" y1="3408" y2="3408" x1="5472" />
        </branch>
        <instance x="5488" y="3440" name="XLXI_13" orien="R0" />
    </sheet>
</drawing>