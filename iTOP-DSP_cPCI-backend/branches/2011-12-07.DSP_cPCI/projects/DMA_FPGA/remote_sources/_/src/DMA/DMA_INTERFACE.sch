<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="WB_PCI_RST" />
        <signal name="WBS_ACK_O" />
        <signal name="WBS_RTY_O" />
        <signal name="WBS_ERR_O" />
        <signal name="WBM_CYC_O" />
        <signal name="WBM_STB_O" />
        <signal name="WBM_WE_O" />
        <signal name="WBS_DAT_O(31:0)" />
        <signal name="WBM_ADR_O(31:0)" />
        <signal name="WBM_DAT_O(31:0)" />
        <signal name="WBM_SEL_O(3:0)" />
        <signal name="WBM_CTI_O(2:0)" />
        <signal name="WBM_BTE_O(1:0)" />
        <signal name="PCI_CLK" />
        <signal name="WB_CLK" />
        <signal name="WB_INT" />
        <signal name="WBS_CYC_I" />
        <signal name="WBS_STB_I" />
        <signal name="WBS_WE_I" />
        <signal name="WBM_ACK_I" />
        <signal name="WBM_RTY_I" />
        <signal name="WBM_ERR_I" />
        <signal name="WBS_ADR_I(31:0)" />
        <signal name="WBS_DAT_I(31:0)" />
        <signal name="WBS_SEL_I(3:0)" />
        <signal name="WBS_CTI_I(2:0)" />
        <signal name="WBS_BTE_I(1:0)" />
        <signal name="WBM_DAT_I(31:0)" />
        <signal name="WB_RST_DELAY" />
        <signal name="DMA_IN_USE" />
        <signal name="TRANSFER_SIZE_VALID" />
        <signal name="STAT_VALID" />
        <signal name="TRANSFER_SIZE(31:0)" />
        <signal name="STAT(7:0)" />
        <signal name="fifo_prog_empty_int_A1" />
        <signal name="fifo_prog_empty_int_A2" />
        <signal name="fifo_prog_empty_int_B1" />
        <signal name="fifo_prog_empty_int_B2" />
        <signal name="CTRL(15:0)" />
        <signal name="WATCH_DOG_CNT(15:0)" />
        <signal name="DMAADR(31:0)" />
        <signal name="DMALEN(31:0)" />
        <signal name="DMA_int" />
        <signal name="DMA_fifo_prog_full_int_A2" />
        <signal name="DMA_fifo_prog_full_int_B1" />
        <signal name="DMA_fifo_prog_full_int_B2" />
        <signal name="DMA_fifo_prog_full_int_A1" />
        <signal name="XLXN_106" />
        <signal name="XLXN_120" />
        <signal name="PCI_INTA" />
        <signal name="PCI_REQ" />
        <signal name="PCI_SERR" />
        <signal name="WBM_CAB_O" />
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
        <signal name="XLXN_36" />
        <signal name="DMA_fifo_cnt_A1(27:0)" />
        <signal name="BOARD_IDENT(5:0)" />
        <signal name="fifo_length_A1(27:0)" />
        <signal name="fifo_length_A2(27:0)" />
        <signal name="fifo_length_B1(27:0)" />
        <signal name="fifo_length_B2(27:0)" />
        <signal name="DMA_fifo_cnt_A2(27:0)" />
        <signal name="DMA_fifo_cnt_B1(27:0)" />
        <signal name="DMA_fifo_cnt_B2(27:0)" />
        <signal name="DMA_fifo_dat_strobe_A1" />
        <signal name="fifo_prog_full_A1" />
        <signal name="fifo_prog_full_A2" />
        <signal name="fifo_prog_full_A3" />
        <signal name="fifo_prog_full_A4" />
        <signal name="DMA_fifo_dat_A1(31:0)" />
        <signal name="DMA_fifo_rd_A1" />
        <signal name="fifo_data_valid_A1" />
        <signal name="fifo_data_valid_A2" />
        <signal name="fifo_data_valid_A3" />
        <signal name="fifo_data_valid_A4" />
        <signal name="fifo_data_A1(31:0)" />
        <signal name="fifo_data_A2(31:0)" />
        <signal name="fifo_data_A3(31:0)" />
        <signal name="fifo_data_A4(31:0)" />
        <signal name="DMA_fifo_dat_strobe_current_A1" />
        <signal name="DMA_fifo_dat_strobe_A2" />
        <signal name="DMA_fifo_dat_strobe_B1" />
        <signal name="DMA_fifo_dat_strobe_B2" />
        <signal name="DMA_fifo_dat_strobe_current_A2" />
        <signal name="DMA_fifo_dat_strobe_current_B1" />
        <signal name="DMA_fifo_dat_strobe_current_B2" />
        <signal name="DMA_fifo_dat_A2(31:0)" />
        <signal name="DMA_fifo_dat_B1(31:0)" />
        <signal name="DMA_fifo_dat_B2(31:0)" />
        <signal name="DMA_fifo_rd_A2" />
        <signal name="DMA_fifo_rd_B1" />
        <signal name="DMA_fifo_rd_B2" />
        <signal name="CONTROL0(35:0)" />
        <signal name="CONTROL1(35:0)" />
        <signal name="rst_channel_0" />
        <signal name="rst_channel_1" />
        <signal name="rst_channel_2" />
        <signal name="rst_channel_3" />
        <signal name="rst_wb_dma_in" />
        <signal name="rst_wb_dma" />
        <signal name="channel_0_up" />
        <signal name="channel_1_up" />
        <signal name="channel_2_up" />
        <signal name="channel_3_up" />
        <signal name="pulse_A_trig" />
        <signal name="pulse_B_trig" />
        <signal name="pulse_A_width(5:0)" />
        <signal name="pulse_B_width(5:0)" />
        <signal name="bc3" />
        <signal name="bc2" />
        <signal name="bc1" />
        <signal name="bc0" />
        <signal name="pulse_A" />
        <signal name="pulse_B" />
        <signal name="start_pulse_A" />
        <signal name="end_pulse_A" />
        <signal name="start_end_pulse_A" />
        <signal name="start_pulse_B" />
        <signal name="end_pulse_B" />
        <signal name="start_end_pulse_B" />
        <port polarity="Output" name="WB_PCI_RST" />
        <port polarity="Input" name="PCI_CLK" />
        <port polarity="Input" name="WB_CLK" />
        <port polarity="Output" name="WBS_CYC_I" />
        <port polarity="Input" name="WB_RST_DELAY" />
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
        <port polarity="Input" name="DMA_fifo_cnt_A1(27:0)" />
        <port polarity="Input" name="BOARD_IDENT(5:0)" />
        <port polarity="Input" name="fifo_length_A1(27:0)" />
        <port polarity="Input" name="fifo_length_A2(27:0)" />
        <port polarity="Input" name="fifo_length_B1(27:0)" />
        <port polarity="Input" name="fifo_length_B2(27:0)" />
        <port polarity="Input" name="DMA_fifo_cnt_A2(27:0)" />
        <port polarity="Input" name="DMA_fifo_cnt_B1(27:0)" />
        <port polarity="Input" name="DMA_fifo_cnt_B2(27:0)" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_A1" />
        <port polarity="Input" name="fifo_prog_full_A1" />
        <port polarity="Input" name="fifo_prog_full_A2" />
        <port polarity="Input" name="fifo_prog_full_A3" />
        <port polarity="Input" name="fifo_prog_full_A4" />
        <port polarity="Input" name="DMA_fifo_dat_A1(31:0)" />
        <port polarity="Output" name="DMA_fifo_rd_A1" />
        <port polarity="Output" name="fifo_data_valid_A1" />
        <port polarity="Output" name="fifo_data_valid_A2" />
        <port polarity="Output" name="fifo_data_valid_A3" />
        <port polarity="Output" name="fifo_data_valid_A4" />
        <port polarity="Output" name="fifo_data_A1(31:0)" />
        <port polarity="Output" name="fifo_data_A2(31:0)" />
        <port polarity="Output" name="fifo_data_A3(31:0)" />
        <port polarity="Output" name="fifo_data_A4(31:0)" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_current_A1" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_A2" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_B1" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_B2" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_current_A2" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_current_B1" />
        <port polarity="Input" name="DMA_fifo_dat_strobe_current_B2" />
        <port polarity="Input" name="DMA_fifo_dat_A2(31:0)" />
        <port polarity="Input" name="DMA_fifo_dat_B1(31:0)" />
        <port polarity="Input" name="DMA_fifo_dat_B2(31:0)" />
        <port polarity="Output" name="DMA_fifo_rd_A2" />
        <port polarity="Output" name="DMA_fifo_rd_B1" />
        <port polarity="Output" name="DMA_fifo_rd_B2" />
        <port polarity="BiDirectional" name="CONTROL0(35:0)" />
        <port polarity="BiDirectional" name="CONTROL1(35:0)" />
        <port polarity="Output" name="rst_channel_0" />
        <port polarity="Output" name="rst_channel_1" />
        <port polarity="Output" name="rst_channel_2" />
        <port polarity="Output" name="rst_channel_3" />
        <port polarity="Input" name="channel_0_up" />
        <port polarity="Input" name="channel_1_up" />
        <port polarity="Input" name="channel_2_up" />
        <port polarity="Input" name="channel_3_up" />
        <port polarity="Input" name="bc3" />
        <port polarity="Input" name="bc2" />
        <port polarity="Input" name="bc1" />
        <port polarity="Input" name="bc0" />
        <port polarity="Output" name="pulse_A" />
        <port polarity="Output" name="pulse_B" />
        <port polarity="Input" name="start_pulse_A" />
        <port polarity="Input" name="end_pulse_A" />
        <port polarity="Input" name="start_end_pulse_A" />
        <port polarity="Input" name="start_pulse_B" />
        <port polarity="Input" name="end_pulse_B" />
        <port polarity="Input" name="start_end_pulse_B" />
        <blockdef name="PCI_GUEST">
            <timestamp>2011-7-16T10:43:17</timestamp>
            <rect width="416" x="64" y="-1664" height="1664" />
            <line x2="0" y1="-1632" y2="-1632" x1="64" />
            <line x2="0" y1="-1552" y2="-1552" x1="64" />
            <line x2="0" y1="-1472" y2="-1472" x1="64" />
            <line x2="0" y1="-1392" y2="-1392" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1232" y2="-1232" x1="64" />
            <line x2="0" y1="-1152" y2="-1152" x1="64" />
            <line x2="0" y1="-1072" y2="-1072" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-912" y2="-912" x1="64" />
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <line x2="0" y1="-752" y2="-752" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-604" height="24" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <rect width="64" x="0" y="-524" height="24" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <rect width="64" x="0" y="-444" height="24" />
            <line x2="0" y1="-432" y2="-432" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-204" height="24" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="544" y1="-1632" y2="-1632" x1="480" />
            <line x2="544" y1="-1568" y2="-1568" x1="480" />
            <line x2="544" y1="-1504" y2="-1504" x1="480" />
            <line x2="544" y1="-1440" y2="-1440" x1="480" />
            <line x2="544" y1="-1376" y2="-1376" x1="480" />
            <line x2="544" y1="-1312" y2="-1312" x1="480" />
            <line x2="544" y1="-1248" y2="-1248" x1="480" />
            <line x2="544" y1="-1184" y2="-1184" x1="480" />
            <line x2="544" y1="-1120" y2="-1120" x1="480" />
            <line x2="544" y1="-1056" y2="-1056" x1="480" />
            <line x2="544" y1="-992" y2="-992" x1="480" />
            <rect width="64" x="480" y="-940" height="24" />
            <line x2="544" y1="-928" y2="-928" x1="480" />
            <rect width="64" x="480" y="-876" height="24" />
            <line x2="544" y1="-864" y2="-864" x1="480" />
            <rect width="64" x="480" y="-812" height="24" />
            <line x2="544" y1="-800" y2="-800" x1="480" />
            <rect width="64" x="480" y="-748" height="24" />
            <line x2="544" y1="-736" y2="-736" x1="480" />
            <rect width="64" x="480" y="-684" height="24" />
            <line x2="544" y1="-672" y2="-672" x1="480" />
            <rect width="64" x="480" y="-620" height="24" />
            <line x2="544" y1="-608" y2="-608" x1="480" />
            <line x2="544" y1="-544" y2="-544" x1="480" />
            <line x2="544" y1="-480" y2="-480" x1="480" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <line x2="544" y1="-352" y2="-352" x1="480" />
            <line x2="544" y1="-288" y2="-288" x1="480" />
            <line x2="544" y1="-224" y2="-224" x1="480" />
            <line x2="544" y1="-160" y2="-160" x1="480" />
            <rect width="64" x="480" y="-108" height="24" />
            <line x2="544" y1="-96" y2="-96" x1="480" />
            <rect width="64" x="480" y="-44" height="24" />
            <line x2="544" y1="-32" y2="-32" x1="480" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="dma_wb_slave">
            <timestamp>2011-12-4T20:54:22</timestamp>
            <rect width="512" x="64" y="-1664" height="2844" />
            <line x2="0" y1="-1632" y2="-1632" x1="64" />
            <line x2="0" y1="-1568" y2="-1568" x1="64" />
            <line x2="0" y1="-1504" y2="-1504" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
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
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="640" y1="-1632" y2="-1632" x1="576" />
            <line x2="640" y1="-1504" y2="-1504" x1="576" />
            <line x2="640" y1="-1376" y2="-1376" x1="576" />
            <line x2="640" y1="-1248" y2="-1248" x1="576" />
            <line x2="640" y1="-1120" y2="-1120" x1="576" />
            <line x2="640" y1="-992" y2="-992" x1="576" />
            <line x2="640" y1="-864" y2="-864" x1="576" />
            <line x2="640" y1="-736" y2="-736" x1="576" />
            <rect width="64" x="576" y="-620" height="24" />
            <line x2="640" y1="-608" y2="-608" x1="576" />
            <rect width="64" x="576" y="-492" height="24" />
            <line x2="640" y1="-480" y2="-480" x1="576" />
            <rect width="64" x="576" y="-364" height="24" />
            <line x2="640" y1="-352" y2="-352" x1="576" />
            <rect width="64" x="576" y="-236" height="24" />
            <line x2="640" y1="-224" y2="-224" x1="576" />
            <rect width="64" x="576" y="-108" height="24" />
            <line x2="640" y1="-96" y2="-96" x1="576" />
            <line x2="64" y1="32" y2="32" x1="0" />
            <line x2="64" y1="160" y2="160" x1="0" />
            <line x2="64" y1="288" y2="288" x1="0" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="0" y="212" height="24" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <rect width="64" x="0" y="340" height="24" />
            <line x2="576" y1="64" y2="64" x1="640" />
            <line x2="576" y1="192" y2="192" x1="640" />
            <line x2="576" y1="320" y2="320" x1="640" />
            <line x2="640" y1="400" y2="400" x1="576" />
            <line x2="576" y1="464" y2="464" x1="640" />
            <line x2="576" y1="528" y2="528" x1="640" />
            <line x2="576" y1="592" y2="592" x1="640" />
            <line x2="576" y1="656" y2="656" x1="640" />
            <line x2="64" y1="432" y2="432" x1="0" />
            <line x2="64" y1="480" y2="480" x1="0" />
            <line x2="64" y1="528" y2="528" x1="0" />
            <line x2="64" y1="576" y2="576" x1="0" />
            <line x2="576" y1="720" y2="720" x1="640" />
            <line x2="576" y1="784" y2="784" x1="640" />
            <line x2="576" y1="848" y2="848" x1="640" />
            <line x2="576" y1="912" y2="912" x1="640" />
            <rect width="64" x="576" y="836" height="24" />
            <rect width="64" x="576" y="900" height="24" />
            <line x2="64" y1="640" y2="640" x1="0" />
            <line x2="64" y1="704" y2="704" x1="0" />
            <line x2="64" y1="768" y2="768" x1="0" />
            <line x2="64" y1="832" y2="832" x1="0" />
            <line x2="64" y1="896" y2="896" x1="0" />
            <line x2="64" y1="944" y2="944" x1="0" />
            <line x2="64" y1="992" y2="992" x1="0" />
            <line x2="64" y1="1056" y2="1056" x1="0" />
            <line x2="64" y1="1104" y2="1104" x1="0" />
            <line x2="64" y1="1152" y2="1152" x1="0" />
        </blockdef>
        <blockdef name="dma_wb_engine">
            <timestamp>2011-6-14T1:47:56</timestamp>
            <rect width="464" x="64" y="-1472" height="2068" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1360" y2="-1360" x1="64" />
            <line x2="0" y1="-1280" y2="-1280" x1="64" />
            <line x2="0" y1="-1200" y2="-1200" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-1040" y2="-1040" x1="64" />
            <line x2="0" y1="-960" y2="-960" x1="64" />
            <line x2="0" y1="-880" y2="-880" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-720" y2="-720" x1="64" />
            <rect width="64" x="0" y="-652" height="24" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <rect width="64" x="0" y="-572" height="24" />
            <line x2="0" y1="-560" y2="-560" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-412" height="24" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-252" height="24" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="592" y1="-1440" y2="-1440" x1="528" />
            <line x2="592" y1="-1376" y2="-1376" x1="528" />
            <line x2="592" y1="-1312" y2="-1312" x1="528" />
            <line x2="592" y1="-1248" y2="-1248" x1="528" />
            <line x2="592" y1="-1184" y2="-1184" x1="528" />
            <line x2="592" y1="-1120" y2="-1120" x1="528" />
            <line x2="592" y1="-1056" y2="-1056" x1="528" />
            <line x2="592" y1="-992" y2="-992" x1="528" />
            <line x2="592" y1="-928" y2="-928" x1="528" />
            <line x2="592" y1="-864" y2="-864" x1="528" />
            <line x2="592" y1="-800" y2="-800" x1="528" />
            <line x2="592" y1="-736" y2="-736" x1="528" />
            <rect width="64" x="528" y="-684" height="24" />
            <line x2="592" y1="-672" y2="-672" x1="528" />
            <rect width="64" x="528" y="-620" height="24" />
            <line x2="592" y1="-608" y2="-608" x1="528" />
            <rect width="64" x="528" y="-556" height="24" />
            <line x2="592" y1="-544" y2="-544" x1="528" />
            <rect width="64" x="528" y="-492" height="24" />
            <line x2="592" y1="-480" y2="-480" x1="528" />
            <rect width="64" x="528" y="-428" height="24" />
            <line x2="592" y1="-416" y2="-416" x1="528" />
            <rect width="64" x="528" y="-364" height="24" />
            <line x2="592" y1="-352" y2="-352" x1="528" />
            <rect width="64" x="528" y="-300" height="24" />
            <line x2="592" y1="-288" y2="-288" x1="528" />
            <rect width="64" x="528" y="-236" height="24" />
            <line x2="592" y1="-224" y2="-224" x1="528" />
            <rect width="64" x="528" y="-172" height="24" />
            <line x2="592" y1="-160" y2="-160" x1="528" />
            <rect width="64" x="528" y="-108" height="24" />
            <line x2="592" y1="-96" y2="-96" x1="528" />
            <rect width="64" x="528" y="-44" height="24" />
            <line x2="592" y1="-32" y2="-32" x1="528" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="32" y2="32" x1="0" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="64" y1="80" y2="80" x1="0" />
            <rect width="64" x="0" y="68" height="24" />
            <line x2="64" y1="128" y2="128" x1="0" />
            <rect width="64" x="0" y="116" height="24" />
            <line x2="64" y1="176" y2="176" x1="0" />
            <line x2="64" y1="224" y2="224" x1="0" />
            <line x2="64" y1="272" y2="272" x1="0" />
            <line x2="64" y1="320" y2="320" x1="0" />
            <line x2="64" y1="368" y2="368" x1="0" />
            <line x2="64" y1="416" y2="416" x1="0" />
            <line x2="528" y1="464" y2="464" x1="592" />
            <line x2="528" y1="512" y2="512" x1="592" />
            <line x2="528" y1="560" y2="560" x1="592" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="debug">
            <timestamp>2011-6-12T21:24:19</timestamp>
            <rect width="400" x="64" y="-1664" height="1664" />
            <line x2="0" y1="-1632" y2="-1632" x1="64" />
            <line x2="0" y1="-1568" y2="-1568" x1="64" />
            <line x2="0" y1="-1504" y2="-1504" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
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
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-1644" height="24" />
            <line x2="528" y1="-1632" y2="-1632" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="pulse_gen">
            <timestamp>2011-7-16T6:12:35</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <block symbolname="or4" name="int2_or">
            <blockpin signalname="fifo_prog_empty_int_B2" name="I0" />
            <blockpin signalname="fifo_prog_empty_int_B1" name="I1" />
            <blockpin signalname="fifo_prog_empty_int_A2" name="I2" />
            <blockpin signalname="fifo_prog_empty_int_A1" name="I3" />
            <blockpin signalname="XLXN_106" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_18">
            <blockpin signalname="XLXN_106" name="I0" />
            <blockpin signalname="DMA_int" name="I1" />
            <blockpin signalname="XLXN_120" name="I2" />
            <blockpin signalname="WB_INT" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_16">
            <blockpin signalname="DMA_fifo_prog_full_int_B2" name="I0" />
            <blockpin signalname="DMA_fifo_prog_full_int_B1" name="I1" />
            <blockpin signalname="DMA_fifo_prog_full_int_A2" name="I2" />
            <blockpin signalname="DMA_fifo_prog_full_int_A1" name="I3" />
            <blockpin signalname="XLXN_120" name="O" />
        </block>
        <block symbolname="PCI_GUEST" name="u_PCI_GUEST">
            <blockpin signalname="PCI_CLK" name="PCI_CLK" />
            <blockpin signalname="PCI_RST" name="PCI_RST" />
            <blockpin signalname="PCI_GNT" name="PCI_GNT" />
            <blockpin signalname="PCI_IDSEL" name="PCI_IDSEL" />
            <blockpin signalname="WB_CLK" name="WB_CLK" />
            <blockpin signalname="WB_INT" name="WB_INT" />
            <blockpin signalname="WBS_CYC_I" name="WBS_CYC_I" />
            <blockpin signalname="WBS_STB_I" name="WBS_STB_I" />
            <blockpin signalname="WBS_WE_I" name="WBS_WE_I" />
            <blockpin signalname="XLXN_36" name="WBS_CAB_I" />
            <blockpin signalname="WBM_ACK_I" name="WBM_ACK_I" />
            <blockpin signalname="WBM_RTY_I" name="WBM_RTY_I" />
            <blockpin signalname="WBM_ERR_I" name="WBM_ERR_I" />
            <blockpin signalname="WBS_ADR_I(31:0)" name="WBS_ADR_I(31:0)" />
            <blockpin signalname="WBS_DAT_I(31:0)" name="WBS_DAT_I(31:0)" />
            <blockpin signalname="WBS_SEL_I(3:0)" name="WBS_SEL_I(3:0)" />
            <blockpin signalname="WBS_CTI_I(2:0)" name="WBS_CTI_I(2:0)" />
            <blockpin signalname="WBS_BTE_I(1:0)" name="WBS_BTE_I(1:0)" />
            <blockpin signalname="WBM_DAT_I(31:0)" name="WBM_DAT_I(31:0)" />
            <blockpin signalname="PCI_INTA" name="PCI_INTA" />
            <blockpin signalname="PCI_REQ" name="PCI_REQ" />
            <blockpin signalname="PCI_SERR" name="PCI_SERR" />
            <blockpin signalname="WB_PCI_RST" name="WB_RST" />
            <blockpin signalname="WBS_ACK_O" name="WBS_ACK_O" />
            <blockpin signalname="WBS_RTY_O" name="WBS_RTY_O" />
            <blockpin signalname="WBS_ERR_O" name="WBS_ERR_O" />
            <blockpin signalname="WBM_CYC_O" name="WBM_CYC_O" />
            <blockpin signalname="WBM_STB_O" name="WBM_STB_O" />
            <blockpin signalname="WBM_WE_O" name="WBM_WE_O" />
            <blockpin signalname="WBM_CAB_O" name="WBM_CAB_O" />
            <blockpin signalname="WBS_DAT_O(31:0)" name="WBS_DAT_O(31:0)" />
            <blockpin signalname="WBM_ADR_O(31:0)" name="WBM_ADR_O(31:0)" />
            <blockpin signalname="WBM_DAT_O(31:0)" name="WBM_DAT_O(31:0)" />
            <blockpin signalname="WBM_SEL_O(3:0)" name="WBM_SEL_O(3:0)" />
            <blockpin signalname="WBM_CTI_O(2:0)" name="WBM_CTI_O(2:0)" />
            <blockpin signalname="WBM_BTE_O(1:0)" name="WBM_BTE_O(1:0)" />
            <blockpin signalname="PCI_FRAME" name="PCI_FRAME" />
            <blockpin signalname="PCI_IRDY" name="PCI_IRDY" />
            <blockpin signalname="PCI_DEVSEL" name="PCI_DEVSEL" />
            <blockpin signalname="PCI_TRDY" name="PCI_TRDY" />
            <blockpin signalname="PCI_STOP" name="PCI_STOP" />
            <blockpin signalname="PCI_PAR" name="PCI_PAR" />
            <blockpin signalname="PCI_PERR" name="PCI_PERR" />
            <blockpin signalname="PCI_AD(31:0)" name="PCI_AD(31:0)" />
            <blockpin signalname="PCI_CBE(3:0)" name="PCI_CBE(3:0)" />
        </block>
        <block symbolname="gnd" name="wbs_cab_gnd">
            <blockpin signalname="XLXN_36" name="G" />
        </block>
        <block symbolname="dma_wb_slave" name="u_wb_slave">
            <blockpin signalname="WB_CLK" name="clk_i" />
            <blockpin signalname="WB_RST_DELAY" name="reset_i" />
            <blockpin signalname="WBM_CYC_O" name="cyc_i" />
            <blockpin signalname="WBM_STB_O" name="stb_i" />
            <blockpin signalname="WBM_WE_O" name="we_i" />
            <blockpin signalname="DMA_IN_USE" name="dma_in_use" />
            <blockpin signalname="TRANSFER_SIZE_VALID" name="tranfer_size_valid_i" />
            <blockpin signalname="STAT_VALID" name="stat_valid_i" />
            <blockpin name="DMA_fifo_prog_full_A1" />
            <blockpin name="fifo_prog_empty_A1" />
            <blockpin name="fifo_prog_empty_A2" />
            <blockpin name="fifo_prog_empty_B1" />
            <blockpin name="fifo_prog_empty_B2" />
            <blockpin signalname="WBM_DAT_O(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="WBM_ADR_O(31:0)" name="adr_i(31:0)" />
            <blockpin signalname="WBM_CTI_O(2:0)" name="cti_i(2:0)" />
            <blockpin signalname="WBM_BTE_O(1:0)" name="bte_i(1:0)" />
            <blockpin signalname="WBM_SEL_O(3:0)" name="sel_i(3:0)" />
            <blockpin signalname="TRANSFER_SIZE(31:0)" name="transfer_size_i(31:0)" />
            <blockpin signalname="STAT(7:0)" name="stat_i(7:0)" />
            <blockpin signalname="DMA_fifo_cnt_A1(27:0)" name="DMA_fifo_cnt_A1(27:0)" />
            <blockpin signalname="BOARD_IDENT(5:0)" name="board_ident(5:0)" />
            <blockpin signalname="fifo_length_A1(27:0)" name="fifo_length_A1(27:0)" />
            <blockpin signalname="fifo_length_A2(27:0)" name="fifo_length_A2(27:0)" />
            <blockpin signalname="fifo_length_B1(27:0)" name="fifo_length_B1(27:0)" />
            <blockpin signalname="fifo_length_B2(27:0)" name="fifo_length_B2(27:0)" />
            <blockpin signalname="WBM_ERR_I" name="err_o" />
            <blockpin signalname="WBM_RTY_I" name="rty_o" />
            <blockpin signalname="WBM_ACK_I" name="ack_o" />
            <blockpin signalname="DMA_fifo_prog_full_int_A1" name="DMA_fifo_prog_full_int_A1" />
            <blockpin signalname="fifo_prog_empty_int_A1" name="fifo_prog_empty_int_A1" />
            <blockpin signalname="fifo_prog_empty_int_A2" name="fifo_prog_empty_int_A2" />
            <blockpin signalname="fifo_prog_empty_int_B1" name="fifo_prog_empty_int_B1" />
            <blockpin signalname="fifo_prog_empty_int_B2" name="fifo_prog_empty_int_B2" />
            <blockpin signalname="WBM_DAT_I(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="CTRL(15:0)" name="ctrl_o(15:0)" />
            <blockpin signalname="WATCH_DOG_CNT(15:0)" name="watch_dog_cnt_o(15:0)" />
            <blockpin signalname="DMAADR(31:0)" name="dmaadr_o(31:0)" />
            <blockpin signalname="DMALEN(31:0)" name="dmalen_o(31:0)" />
            <blockpin name="DMA_fifo_prog_full_A2" />
            <blockpin signalname="DMA_fifo_cnt_A2(27:0)" name="DMA_fifo_cnt_A2(27:0)" />
            <blockpin name="DMA_fifo_prog_full_B1" />
            <blockpin signalname="DMA_fifo_cnt_B1(27:0)" name="DMA_fifo_cnt_B1(27:0)" />
            <blockpin name="DMA_fifo_prog_full_B2" />
            <blockpin signalname="DMA_fifo_cnt_B2(27:0)" name="DMA_fifo_cnt_B2(27:0)" />
            <blockpin signalname="DMA_fifo_prog_full_int_A2" name="DMA_fifo_prog_full_int_A2" />
            <blockpin signalname="DMA_fifo_prog_full_int_B1" name="DMA_fifo_prog_full_int_B1" />
            <blockpin signalname="DMA_fifo_prog_full_int_B2" name="DMA_fifo_prog_full_int_B2" />
            <blockpin signalname="rst_channel_0" name="reset_channel_0" />
            <blockpin signalname="rst_channel_1" name="reset_channel_1" />
            <blockpin signalname="rst_channel_2" name="reset_channel_2" />
            <blockpin signalname="rst_channel_3" name="reset_channel_3" />
            <blockpin signalname="rst_wb_dma" name="reset_wb_dma" />
            <blockpin signalname="channel_0_up" name="channel_0_up" />
            <blockpin signalname="channel_1_up" name="channel_1_up" />
            <blockpin signalname="channel_2_up" name="channel_2_up" />
            <blockpin signalname="channel_3_up" name="channel_3_up" />
            <blockpin signalname="pulse_A_trig" name="pulse_A" />
            <blockpin signalname="pulse_B_trig" name="pulse_B" />
            <blockpin signalname="pulse_A_width(5:0)" name="pulse_A_width(5:0)" />
            <blockpin signalname="pulse_B_width(5:0)" name="pulse_B_width(5:0)" />
            <blockpin signalname="bc3" name="bc3" />
            <blockpin signalname="bc2" name="bc2" />
            <blockpin signalname="bc1" name="bc1" />
            <blockpin signalname="bc0" name="bc0" />
            <blockpin signalname="start_pulse_A" name="start_pulse_A" />
            <blockpin signalname="end_pulse_A" name="end_pulse_A" />
            <blockpin signalname="start_end_pulse_A" name="start_end_pulse_A" />
            <blockpin signalname="start_pulse_B" name="start_pulse_B" />
            <blockpin signalname="end_pulse_B" name="end_pulse_B" />
            <blockpin signalname="start_end_pulse_B" name="start_end_pulse_B" />
        </block>
        <block symbolname="dma_wb_engine" name="u_wb_engine">
            <blockpin signalname="WB_CLK" name="clk_i" />
            <blockpin signalname="rst_wb_dma_in" name="reset_i" />
            <blockpin signalname="WBS_ERR_O" name="err_i" />
            <blockpin signalname="WBS_RTY_O" name="rty_i" />
            <blockpin signalname="WBS_ACK_O" name="ack_i" />
            <blockpin signalname="DMA_fifo_dat_strobe_A1" name="DMA_fifo_dat_strobe_i_A1" />
            <blockpin signalname="fifo_prog_full_A1" name="fifo_full_A1" />
            <blockpin signalname="fifo_prog_full_A2" name="fifo_full_A2" />
            <blockpin signalname="fifo_prog_full_A3" name="fifo_full_A3" />
            <blockpin signalname="fifo_prog_full_A4" name="fifo_full_A4" />
            <blockpin signalname="WBS_DAT_O(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="DMA_fifo_dat_A1(31:0)" name="DMA_fifo_dat_i_A1(31:0)" />
            <blockpin signalname="CTRL(15:0)" name="ctrl_i(15:0)" />
            <blockpin signalname="WATCH_DOG_CNT(15:0)" name="watch_dog_cnt_i(15:0)" />
            <blockpin signalname="DMAADR(31:0)" name="dmaadr_i(31:0)" />
            <blockpin signalname="DMALEN(31:0)" name="dmalen_i(31:0)" />
            <blockpin signalname="WBS_CYC_I" name="cyc_o" />
            <blockpin signalname="WBS_STB_I" name="stb_o" />
            <blockpin signalname="WBS_WE_I" name="we_o" />
            <blockpin signalname="DMA_fifo_rd_A1" name="DMA_fifo_rd_o_A1" />
            <blockpin signalname="fifo_data_valid_A1" name="fifo_data_valid_A1" />
            <blockpin signalname="fifo_data_valid_A2" name="fifo_data_valid_A2" />
            <blockpin signalname="fifo_data_valid_A3" name="fifo_data_valid_A3" />
            <blockpin signalname="fifo_data_valid_A4" name="fifo_data_valid_A4" />
            <blockpin signalname="TRANSFER_SIZE_VALID" name="transfer_size_valid" />
            <blockpin signalname="DMA_IN_USE" name="dma_in_use" />
            <blockpin signalname="STAT_VALID" name="stat_valid" />
            <blockpin signalname="DMA_int" name="fin_o" />
            <blockpin signalname="WBS_DAT_I(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="WBS_ADR_I(31:0)" name="adr_o(31:0)" />
            <blockpin signalname="WBS_CTI_I(2:0)" name="cti_o(2:0)" />
            <blockpin signalname="WBS_BTE_I(1:0)" name="bte_o(1:0)" />
            <blockpin signalname="WBS_SEL_I(3:0)" name="sel_o(3:0)" />
            <blockpin signalname="fifo_data_A1(31:0)" name="fifo_data_A1(31:0)" />
            <blockpin signalname="fifo_data_A2(31:0)" name="fifo_data_A2(31:0)" />
            <blockpin signalname="fifo_data_A3(31:0)" name="fifo_data_A3(31:0)" />
            <blockpin signalname="fifo_data_A4(31:0)" name="fifo_data_A4(31:0)" />
            <blockpin signalname="TRANSFER_SIZE(31:0)" name="transfer_size_o(31:0)" />
            <blockpin signalname="STAT(7:0)" name="stat_o(7:0)" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A1" name="DMA_fifo_data_strobe_current_i_A1" />
            <blockpin signalname="DMA_fifo_dat_A2(31:0)" name="DMA_fifo_dat_i_A2(31:0)" />
            <blockpin signalname="DMA_fifo_dat_B2(31:0)" name="DMA_fifo_dat_i_B2(31:0)" />
            <blockpin signalname="DMA_fifo_dat_strobe_A2" name="DMA_fifo_dat_strobe_i_A2" />
            <blockpin signalname="DMA_fifo_dat_strobe_B1" name="DMA_fifo_dat_strobe_i_B1" />
            <blockpin signalname="DMA_fifo_dat_strobe_B2" name="DMA_fifo_dat_strobe_i_B2" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A2" name="DMA_fifo_data_strobe_current_i_A2" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B1" name="DMA_fifo_data_strobe_current_i_B1" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B2" name="DMA_fifo_data_strobe_current_i_B2" />
            <blockpin signalname="DMA_fifo_rd_A2" name="DMA_fifo_rd_o_A2" />
            <blockpin signalname="DMA_fifo_rd_B1" name="DMA_fifo_rd_o_B1" />
            <blockpin signalname="DMA_fifo_rd_B2" name="DMA_fifo_rd_o_B2" />
            <blockpin signalname="DMA_fifo_dat_B1(31:0)" name="DMA_fifo_dat_i_B1(31:0)" />
        </block>
        <block symbolname="debug" name="u_debug">
            <blockpin signalname="WB_CLK" name="wb_clk" />
            <blockpin signalname="WBM_CYC_O" name="slave_cyc_i" />
            <blockpin signalname="WBM_STB_O" name="slave_stb_i" />
            <blockpin signalname="WBM_WE_O" name="slave_we_i" />
            <blockpin signalname="WBM_ERR_I" name="slave_err_i" />
            <blockpin signalname="WBM_RTY_I" name="slave_rty_i" />
            <blockpin signalname="WBM_ACK_I" name="slave_ack_i" />
            <blockpin signalname="WBS_CYC_I" name="engine_cyc_i" />
            <blockpin signalname="WBS_STB_I" name="engine_stb_i" />
            <blockpin signalname="WBS_WE_I" name="engine_we_i" />
            <blockpin signalname="WBS_ERR_O" name="engine_err_i" />
            <blockpin signalname="WBS_RTY_O" name="engine_rty_i" />
            <blockpin signalname="WBS_ACK_O" name="engine_ack_i" />
            <blockpin signalname="WB_INT" name="wb_int" />
            <blockpin signalname="WBM_DAT_O(31:0)" name="slave_dat_i(31:0)" />
            <blockpin signalname="WBM_ADR_O(31:0)" name="slave_adr_i(31:0)" />
            <blockpin signalname="WBM_CTI_O(2:0)" name="slave_cti_i(2:0)" />
            <blockpin signalname="WBM_BTE_O(1:0)" name="slave_bte_i(1:0)" />
            <blockpin signalname="WBM_SEL_O(3:0)" name="slave_sel_i(3:0)" />
            <blockpin signalname="WBM_DAT_I(31:0)" name="slave_dat_o(31:0)" />
            <blockpin signalname="WBS_DAT_I(31:0)" name="engine_dat_i(31:0)" />
            <blockpin signalname="WBS_ADR_I(31:0)" name="engine_adr_i(31:0)" />
            <blockpin signalname="WBS_CTI_I(2:0)" name="engine_cti_i(2:0)" />
            <blockpin signalname="WBS_BTE_I(1:0)" name="engine_bte_i(1:0)" />
            <blockpin signalname="WBS_SEL_I(3:0)" name="engine_sel_i(3:0)" />
            <blockpin signalname="WBS_DAT_O(31:0)" name="engine_dat_o(31:0)" />
            <blockpin signalname="CONTROL0(35:0)" name="CONTROL0(35:0)" />
            <blockpin signalname="CONTROL1(35:0)" name="CONTROL1(35:0)" />
        </block>
        <block symbolname="or2" name="XLXI_19">
            <blockpin signalname="rst_wb_dma" name="I0" />
            <blockpin signalname="WB_RST_DELAY" name="I1" />
            <blockpin signalname="rst_wb_dma_in" name="O" />
        </block>
        <block symbolname="pulse_gen" name="pulse_gen_B">
            <blockpin signalname="WB_CLK" name="clk" />
            <blockpin signalname="WB_RST_DELAY" name="rst" />
            <blockpin signalname="pulse_B_trig" name="trig" />
            <blockpin signalname="pulse_B_width(5:0)" name="interval(5:0)" />
            <blockpin signalname="pulse_B" name="pulse" />
        </block>
        <block symbolname="pulse_gen" name="pulse_gen_A">
            <blockpin signalname="WB_CLK" name="clk" />
            <blockpin signalname="WB_RST_DELAY" name="rst" />
            <blockpin signalname="pulse_A_trig" name="trig" />
            <blockpin signalname="pulse_A_width(5:0)" name="interval(5:0)" />
            <blockpin signalname="pulse_A" name="pulse" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="4512" y="3456" name="int2_or" orien="R0" />
        <branch name="fifo_prog_empty_int_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4480" y="3200" type="branch" />
            <wire x2="4512" y1="3200" y2="3200" x1="4480" />
        </branch>
        <branch name="fifo_prog_empty_int_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4480" y="3264" type="branch" />
            <wire x2="4512" y1="3264" y2="3264" x1="4480" />
        </branch>
        <branch name="fifo_prog_empty_int_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4496" y="3328" type="branch" />
            <wire x2="4512" y1="3328" y2="3328" x1="4496" />
        </branch>
        <branch name="fifo_prog_empty_int_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4496" y="3392" type="branch" />
            <wire x2="4512" y1="3392" y2="3392" x1="4496" />
        </branch>
        <instance x="4848" y="3280" name="XLXI_18" orien="R0" />
        <branch name="WB_INT">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5136" y="3152" type="branch" />
            <wire x2="5120" y1="3152" y2="3152" x1="5104" />
            <wire x2="5136" y1="3152" y2="3152" x1="5120" />
        </branch>
        <branch name="XLXN_106">
            <wire x2="4848" y1="3296" y2="3296" x1="4768" />
            <wire x2="4848" y1="3216" y2="3296" x1="4848" />
        </branch>
        <branch name="DMA_int">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4784" y="3152" type="branch" />
            <wire x2="4848" y1="3152" y2="3152" x1="4784" />
        </branch>
        <instance x="4512" y="3088" name="XLXI_16" orien="R0" />
        <branch name="DMA_fifo_prog_full_int_B2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4448" y="3024" type="branch" />
            <wire x2="4512" y1="3024" y2="3024" x1="4448" />
        </branch>
        <branch name="DMA_fifo_prog_full_int_B1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4448" y="2960" type="branch" />
            <wire x2="4512" y1="2960" y2="2960" x1="4448" />
        </branch>
        <branch name="DMA_fifo_prog_full_int_A2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4448" y="2896" type="branch" />
            <wire x2="4512" y1="2896" y2="2896" x1="4448" />
        </branch>
        <branch name="DMA_fifo_prog_full_int_A1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4464" y="2832" type="branch" />
            <wire x2="4512" y1="2832" y2="2832" x1="4464" />
        </branch>
        <branch name="XLXN_120">
            <wire x2="4848" y1="2928" y2="2928" x1="4768" />
            <wire x2="4848" y1="2928" y2="3088" x1="4848" />
        </branch>
        <instance x="4464" y="1856" name="u_PCI_GUEST" orien="R0">
        </instance>
        <branch name="PCI_INTA">
            <wire x2="5040" y1="224" y2="224" x1="5008" />
        </branch>
        <branch name="PCI_REQ">
            <wire x2="5040" y1="288" y2="288" x1="5008" />
        </branch>
        <branch name="PCI_SERR">
            <wire x2="5040" y1="352" y2="352" x1="5008" />
        </branch>
        <branch name="WB_PCI_RST">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="416" type="branch" />
            <wire x2="5040" y1="416" y2="416" x1="5008" />
        </branch>
        <branch name="WBS_ACK_O">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="480" type="branch" />
            <wire x2="5040" y1="480" y2="480" x1="5008" />
        </branch>
        <branch name="WBS_RTY_O">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="544" type="branch" />
            <wire x2="5040" y1="544" y2="544" x1="5008" />
        </branch>
        <branch name="WBS_ERR_O">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="608" type="branch" />
            <wire x2="5040" y1="608" y2="608" x1="5008" />
        </branch>
        <branch name="WBM_CYC_O">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="672" type="branch" />
            <wire x2="5040" y1="672" y2="672" x1="5008" />
        </branch>
        <branch name="WBM_STB_O">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="736" type="branch" />
            <wire x2="5040" y1="736" y2="736" x1="5008" />
        </branch>
        <branch name="WBM_WE_O">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="800" type="branch" />
            <wire x2="5040" y1="800" y2="800" x1="5008" />
        </branch>
        <branch name="WBM_CAB_O">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="864" type="branch" />
            <wire x2="5040" y1="864" y2="864" x1="5008" />
        </branch>
        <branch name="WBS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="928" type="branch" />
            <wire x2="5040" y1="928" y2="928" x1="5008" />
        </branch>
        <branch name="WBM_ADR_O(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="992" type="branch" />
            <wire x2="5040" y1="992" y2="992" x1="5008" />
        </branch>
        <branch name="WBM_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="1056" type="branch" />
            <wire x2="5040" y1="1056" y2="1056" x1="5008" />
        </branch>
        <branch name="WBM_SEL_O(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="1120" type="branch" />
            <wire x2="5040" y1="1120" y2="1120" x1="5008" />
        </branch>
        <branch name="WBM_CTI_O(2:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="1184" type="branch" />
            <wire x2="5040" y1="1184" y2="1184" x1="5008" />
        </branch>
        <branch name="WBM_BTE_O(1:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5040" y="1248" type="branch" />
            <wire x2="5040" y1="1248" y2="1248" x1="5008" />
        </branch>
        <branch name="PCI_FRAME">
            <wire x2="5040" y1="1312" y2="1312" x1="5008" />
        </branch>
        <branch name="PCI_IRDY">
            <wire x2="5040" y1="1376" y2="1376" x1="5008" />
        </branch>
        <branch name="PCI_DEVSEL">
            <wire x2="5040" y1="1440" y2="1440" x1="5008" />
        </branch>
        <branch name="PCI_TRDY">
            <wire x2="5040" y1="1504" y2="1504" x1="5008" />
        </branch>
        <branch name="PCI_STOP">
            <wire x2="5040" y1="1568" y2="1568" x1="5008" />
        </branch>
        <branch name="PCI_PAR">
            <wire x2="5040" y1="1632" y2="1632" x1="5008" />
        </branch>
        <branch name="PCI_PERR">
            <wire x2="5040" y1="1696" y2="1696" x1="5008" />
        </branch>
        <branch name="PCI_AD(31:0)">
            <wire x2="5040" y1="1760" y2="1760" x1="5008" />
        </branch>
        <branch name="PCI_CBE(3:0)">
            <wire x2="5040" y1="1824" y2="1824" x1="5008" />
        </branch>
        <branch name="PCI_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4384" y="224" type="branch" />
            <wire x2="4464" y1="224" y2="224" x1="4384" />
        </branch>
        <branch name="PCI_RST">
            <wire x2="4464" y1="304" y2="304" x1="4400" />
        </branch>
        <branch name="PCI_GNT">
            <wire x2="4464" y1="384" y2="384" x1="4416" />
        </branch>
        <branch name="PCI_IDSEL">
            <wire x2="4464" y1="464" y2="464" x1="4432" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="544" type="branch" />
            <wire x2="4464" y1="544" y2="544" x1="4416" />
        </branch>
        <branch name="WB_INT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4432" y="624" type="branch" />
            <wire x2="4464" y1="624" y2="624" x1="4432" />
        </branch>
        <branch name="WBS_CYC_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4432" y="704" type="branch" />
            <wire x2="4464" y1="704" y2="704" x1="4432" />
        </branch>
        <branch name="WBS_STB_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="784" type="branch" />
            <wire x2="4464" y1="784" y2="784" x1="4416" />
        </branch>
        <branch name="WBS_WE_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="864" type="branch" />
            <wire x2="4464" y1="864" y2="864" x1="4416" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="4464" y1="944" y2="944" x1="4432" />
        </branch>
        <instance x="4304" y="880" name="wbs_cab_gnd" orien="R90" />
        <branch name="WBM_ACK_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="1024" type="branch" />
            <wire x2="4464" y1="1024" y2="1024" x1="4416" />
        </branch>
        <branch name="WBM_RTY_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="1104" type="branch" />
            <wire x2="4464" y1="1104" y2="1104" x1="4416" />
        </branch>
        <branch name="WBM_ERR_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="1184" type="branch" />
            <wire x2="4464" y1="1184" y2="1184" x1="4416" />
        </branch>
        <branch name="WBS_ADR_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="1264" type="branch" />
            <wire x2="4464" y1="1264" y2="1264" x1="4416" />
        </branch>
        <branch name="WBS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="1344" type="branch" />
            <wire x2="4464" y1="1344" y2="1344" x1="4416" />
        </branch>
        <branch name="WBS_SEL_I(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4416" y="1424" type="branch" />
            <wire x2="4464" y1="1424" y2="1424" x1="4416" />
        </branch>
        <branch name="WBS_CTI_I(2:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4400" y="1504" type="branch" />
            <wire x2="4464" y1="1504" y2="1504" x1="4400" />
        </branch>
        <branch name="WBS_BTE_I(1:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4400" y="1584" type="branch" />
            <wire x2="4464" y1="1584" y2="1584" x1="4400" />
        </branch>
        <branch name="WBM_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4400" y="1664" type="branch" />
            <wire x2="4464" y1="1664" y2="1664" x1="4400" />
        </branch>
        <iomarker fontsize="28" x="5040" y="224" name="PCI_INTA" orien="R0" />
        <iomarker fontsize="28" x="5040" y="288" name="PCI_REQ" orien="R0" />
        <iomarker fontsize="28" x="5040" y="352" name="PCI_SERR" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1312" name="PCI_FRAME" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1376" name="PCI_IRDY" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1440" name="PCI_DEVSEL" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1504" name="PCI_TRDY" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1568" name="PCI_STOP" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1632" name="PCI_PAR" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1696" name="PCI_PERR" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1760" name="PCI_AD(31:0)" orien="R0" />
        <iomarker fontsize="28" x="5040" y="1824" name="PCI_CBE(3:0)" orien="R0" />
        <iomarker fontsize="28" x="4400" y="304" name="PCI_RST" orien="R180" />
        <iomarker fontsize="28" x="4416" y="384" name="PCI_GNT" orien="R180" />
        <iomarker fontsize="28" x="4432" y="464" name="PCI_IDSEL" orien="R180" />
        <instance x="3072" y="1808" name="u_wb_slave" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="176" type="branch" />
            <wire x2="3072" y1="176" y2="176" x1="3024" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="240" type="branch" />
            <wire x2="3072" y1="240" y2="240" x1="3024" />
        </branch>
        <branch name="WBM_CYC_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="304" type="branch" />
            <wire x2="3072" y1="304" y2="304" x1="3024" />
        </branch>
        <branch name="WBM_STB_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="368" type="branch" />
            <wire x2="3072" y1="368" y2="368" x1="3024" />
        </branch>
        <branch name="WBM_WE_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="432" type="branch" />
            <wire x2="3072" y1="432" y2="432" x1="3024" />
        </branch>
        <branch name="DMA_IN_USE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="496" type="branch" />
            <wire x2="3072" y1="496" y2="496" x1="3024" />
        </branch>
        <branch name="TRANSFER_SIZE_VALID">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="560" type="branch" />
            <wire x2="3072" y1="560" y2="560" x1="3024" />
        </branch>
        <branch name="STAT_VALID">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="624" type="branch" />
            <wire x2="3072" y1="624" y2="624" x1="3024" />
        </branch>
        <branch name="WBM_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="1008" type="branch" />
            <wire x2="3072" y1="1008" y2="1008" x1="3024" />
        </branch>
        <branch name="WBM_ADR_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="1072" type="branch" />
            <wire x2="3072" y1="1072" y2="1072" x1="3024" />
        </branch>
        <branch name="WBM_CTI_O(2:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="1136" type="branch" />
            <wire x2="3072" y1="1136" y2="1136" x1="3024" />
        </branch>
        <branch name="WBM_BTE_O(1:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="1200" type="branch" />
            <wire x2="3072" y1="1200" y2="1200" x1="3024" />
        </branch>
        <branch name="WBM_SEL_O(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="1264" type="branch" />
            <wire x2="3072" y1="1264" y2="1264" x1="3024" />
        </branch>
        <branch name="TRANSFER_SIZE(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="1328" type="branch" />
            <wire x2="3072" y1="1328" y2="1328" x1="3024" />
        </branch>
        <branch name="STAT(7:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3040" y="1392" type="branch" />
            <wire x2="3072" y1="1392" y2="1392" x1="3040" />
        </branch>
        <branch name="DMA_fifo_cnt_A1(27:0)">
            <wire x2="3072" y1="1456" y2="1456" x1="3024" />
        </branch>
        <branch name="BOARD_IDENT(5:0)">
            <wire x2="3072" y1="1520" y2="1520" x1="3040" />
        </branch>
        <branch name="fifo_length_A1(27:0)">
            <wire x2="3072" y1="1584" y2="1584" x1="3040" />
        </branch>
        <branch name="fifo_length_A2(27:0)">
            <wire x2="3072" y1="1648" y2="1648" x1="3040" />
        </branch>
        <branch name="fifo_length_B1(27:0)">
            <wire x2="3072" y1="1712" y2="1712" x1="3040" />
        </branch>
        <branch name="fifo_length_B2(27:0)">
            <wire x2="3072" y1="1776" y2="1776" x1="3040" />
        </branch>
        <branch name="WBM_ERR_I">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="176" type="branch" />
            <wire x2="3744" y1="176" y2="176" x1="3712" />
        </branch>
        <branch name="WBM_RTY_I">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="304" type="branch" />
            <wire x2="3744" y1="304" y2="304" x1="3712" />
        </branch>
        <branch name="WBM_ACK_I">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="432" type="branch" />
            <wire x2="3760" y1="432" y2="432" x1="3712" />
        </branch>
        <branch name="fifo_prog_empty_int_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="688" type="branch" />
            <wire x2="3744" y1="688" y2="688" x1="3712" />
        </branch>
        <branch name="fifo_prog_empty_int_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="816" type="branch" />
            <wire x2="3744" y1="816" y2="816" x1="3712" />
        </branch>
        <branch name="fifo_prog_empty_int_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="944" type="branch" />
            <wire x2="3744" y1="944" y2="944" x1="3712" />
        </branch>
        <branch name="fifo_prog_empty_int_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="1072" type="branch" />
            <wire x2="3744" y1="1072" y2="1072" x1="3712" />
        </branch>
        <branch name="WBM_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="1200" type="branch" />
            <wire x2="3744" y1="1200" y2="1200" x1="3712" />
        </branch>
        <branch name="CTRL(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="1328" type="branch" />
            <wire x2="3744" y1="1328" y2="1328" x1="3712" />
        </branch>
        <branch name="WATCH_DOG_CNT(15:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="1456" type="branch" />
            <wire x2="3760" y1="1456" y2="1456" x1="3712" />
        </branch>
        <branch name="DMAADR(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="1584" type="branch" />
            <wire x2="3760" y1="1584" y2="1584" x1="3712" />
        </branch>
        <branch name="DMALEN(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="1712" type="branch" />
            <wire x2="3744" y1="1712" y2="1712" x1="3712" />
        </branch>
        <branch name="DMA_fifo_cnt_A2(27:0)">
            <wire x2="3072" y1="1904" y2="1904" x1="3024" />
        </branch>
        <branch name="DMA_fifo_cnt_B1(27:0)">
            <wire x2="3056" y1="2032" y2="2032" x1="3008" />
            <wire x2="3072" y1="2032" y2="2032" x1="3056" />
        </branch>
        <branch name="DMA_fifo_cnt_B2(27:0)">
            <wire x2="3056" y1="2160" y2="2160" x1="3008" />
            <wire x2="3072" y1="2160" y2="2160" x1="3056" />
        </branch>
        <branch name="DMA_fifo_prog_full_int_A2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="1872" type="branch" />
            <wire x2="3760" y1="1872" y2="1872" x1="3712" />
        </branch>
        <branch name="DMA_fifo_prog_full_int_B1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="2000" type="branch" />
            <wire x2="3760" y1="2000" y2="2000" x1="3712" />
        </branch>
        <branch name="DMA_fifo_prog_full_int_B2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="2128" type="branch" />
            <wire x2="3760" y1="2128" y2="2128" x1="3712" />
        </branch>
        <branch name="DMA_fifo_prog_full_int_A1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="560" type="branch" />
            <wire x2="3744" y1="560" y2="560" x1="3712" />
        </branch>
        <iomarker fontsize="28" x="3040" y="1520" name="BOARD_IDENT(5:0)" orien="R180" />
        <iomarker fontsize="28" x="3040" y="1584" name="fifo_length_A1(27:0)" orien="R180" />
        <iomarker fontsize="28" x="3040" y="1648" name="fifo_length_A2(27:0)" orien="R180" />
        <iomarker fontsize="28" x="3040" y="1712" name="fifo_length_B1(27:0)" orien="R180" />
        <iomarker fontsize="28" x="3040" y="1776" name="fifo_length_B2(27:0)" orien="R180" />
        <iomarker fontsize="28" x="3024" y="1904" name="DMA_fifo_cnt_A2(27:0)" orien="R180" />
        <iomarker fontsize="28" x="3008" y="2032" name="DMA_fifo_cnt_B1(27:0)" orien="R180" />
        <iomarker fontsize="28" x="3008" y="2160" name="DMA_fifo_cnt_B2(27:0)" orien="R180" />
        <iomarker fontsize="28" x="3024" y="1456" name="DMA_fifo_cnt_A1(27:0)" orien="R180" />
        <instance x="1632" y="1600" name="u_wb_engine" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1584" y="160" type="branch" />
            <wire x2="1632" y1="160" y2="160" x1="1584" />
        </branch>
        <branch name="WBS_ERR_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="320" type="branch" />
            <wire x2="1632" y1="320" y2="320" x1="1600" />
        </branch>
        <branch name="WBS_RTY_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="400" type="branch" />
            <wire x2="1632" y1="400" y2="400" x1="1600" />
        </branch>
        <branch name="WBS_ACK_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1584" y="480" type="branch" />
            <wire x2="1632" y1="480" y2="480" x1="1584" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_A1">
            <wire x2="1632" y1="560" y2="560" x1="1600" />
        </branch>
        <branch name="fifo_prog_full_A1">
            <wire x2="1632" y1="640" y2="640" x1="1600" />
        </branch>
        <branch name="fifo_prog_full_A2">
            <wire x2="1632" y1="720" y2="720" x1="1600" />
        </branch>
        <branch name="fifo_prog_full_A3">
            <wire x2="1632" y1="800" y2="800" x1="1600" />
        </branch>
        <branch name="fifo_prog_full_A4">
            <wire x2="1632" y1="880" y2="880" x1="1600" />
        </branch>
        <branch name="WBS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1568" y="960" type="branch" />
            <wire x2="1632" y1="960" y2="960" x1="1568" />
        </branch>
        <branch name="DMA_fifo_dat_A1(31:0)">
            <wire x2="1632" y1="1040" y2="1040" x1="1584" />
        </branch>
        <branch name="CTRL(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1120" type="branch" />
            <wire x2="1632" y1="1120" y2="1120" x1="1600" />
        </branch>
        <branch name="WATCH_DOG_CNT(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1200" type="branch" />
            <wire x2="1632" y1="1200" y2="1200" x1="1600" />
        </branch>
        <branch name="DMAADR(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1280" type="branch" />
            <wire x2="1632" y1="1280" y2="1280" x1="1600" />
        </branch>
        <branch name="DMALEN(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1600" y="1360" type="branch" />
            <wire x2="1632" y1="1360" y2="1360" x1="1600" />
        </branch>
        <branch name="WBS_CYC_I">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="160" type="branch" />
            <wire x2="2272" y1="160" y2="160" x1="2224" />
        </branch>
        <branch name="WBS_STB_I">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2256" y="224" type="branch" />
            <wire x2="2256" y1="224" y2="224" x1="2224" />
        </branch>
        <branch name="WBS_WE_I">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2256" y="288" type="branch" />
            <wire x2="2256" y1="288" y2="288" x1="2224" />
        </branch>
        <branch name="DMA_fifo_rd_A1">
            <wire x2="2256" y1="352" y2="352" x1="2224" />
        </branch>
        <branch name="fifo_data_valid_A1">
            <wire x2="2256" y1="416" y2="416" x1="2224" />
        </branch>
        <branch name="fifo_data_valid_A2">
            <wire x2="2272" y1="480" y2="480" x1="2224" />
        </branch>
        <branch name="fifo_data_valid_A3">
            <wire x2="2256" y1="544" y2="544" x1="2224" />
        </branch>
        <branch name="fifo_data_valid_A4">
            <wire x2="2256" y1="608" y2="608" x1="2224" />
        </branch>
        <branch name="TRANSFER_SIZE_VALID">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2256" y="672" type="branch" />
            <wire x2="2256" y1="672" y2="672" x1="2224" />
        </branch>
        <branch name="DMA_IN_USE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="736" type="branch" />
            <wire x2="2272" y1="736" y2="736" x1="2224" />
        </branch>
        <branch name="STAT_VALID">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2256" y="800" type="branch" />
            <wire x2="2256" y1="800" y2="800" x1="2224" />
        </branch>
        <branch name="DMA_int">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="864" type="branch" />
            <wire x2="2272" y1="864" y2="864" x1="2224" />
        </branch>
        <branch name="WBS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="928" type="branch" />
            <wire x2="2272" y1="928" y2="928" x1="2224" />
        </branch>
        <branch name="WBS_ADR_I(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="992" type="branch" />
            <wire x2="2272" y1="992" y2="992" x1="2224" />
        </branch>
        <branch name="WBS_CTI_I(2:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="1056" type="branch" />
            <wire x2="2272" y1="1056" y2="1056" x1="2224" />
        </branch>
        <branch name="WBS_BTE_I(1:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="1120" type="branch" />
            <wire x2="2272" y1="1120" y2="1120" x1="2224" />
        </branch>
        <branch name="WBS_SEL_I(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="1184" type="branch" />
            <wire x2="2272" y1="1184" y2="1184" x1="2224" />
        </branch>
        <branch name="fifo_data_A1(31:0)">
            <wire x2="2272" y1="1248" y2="1248" x1="2224" />
        </branch>
        <branch name="fifo_data_A2(31:0)">
            <wire x2="2272" y1="1312" y2="1312" x1="2224" />
        </branch>
        <branch name="fifo_data_A3(31:0)">
            <wire x2="2256" y1="1376" y2="1376" x1="2224" />
        </branch>
        <branch name="fifo_data_A4(31:0)">
            <wire x2="2256" y1="1440" y2="1440" x1="2224" />
        </branch>
        <branch name="TRANSFER_SIZE(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2272" y="1504" type="branch" />
            <wire x2="2272" y1="1504" y2="1504" x1="2224" />
        </branch>
        <branch name="STAT(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2256" y="1568" type="branch" />
            <wire x2="2256" y1="1568" y2="1568" x1="2224" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_A1">
            <wire x2="1632" y1="1568" y2="1568" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1600" y="560" name="DMA_fifo_dat_strobe_A1" orien="R180" />
        <iomarker fontsize="28" x="1600" y="640" name="fifo_prog_full_A1" orien="R180" />
        <iomarker fontsize="28" x="1600" y="720" name="fifo_prog_full_A2" orien="R180" />
        <iomarker fontsize="28" x="1600" y="800" name="fifo_prog_full_A3" orien="R180" />
        <iomarker fontsize="28" x="1600" y="880" name="fifo_prog_full_A4" orien="R180" />
        <iomarker fontsize="28" x="1584" y="1040" name="DMA_fifo_dat_A1(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2256" y="352" name="DMA_fifo_rd_A1" orien="R0" />
        <iomarker fontsize="28" x="2256" y="416" name="fifo_data_valid_A1" orien="R0" />
        <iomarker fontsize="28" x="2272" y="480" name="fifo_data_valid_A2" orien="R0" />
        <iomarker fontsize="28" x="2256" y="544" name="fifo_data_valid_A3" orien="R0" />
        <iomarker fontsize="28" x="2256" y="608" name="fifo_data_valid_A4" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1248" name="fifo_data_A1(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1312" name="fifo_data_A2(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2256" y="1376" name="fifo_data_A3(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2256" y="1440" name="fifo_data_A4(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1600" y="1568" name="DMA_fifo_dat_strobe_current_A1" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_A2">
            <wire x2="1632" y1="1776" y2="1776" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1776" name="DMA_fifo_dat_strobe_A2" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_B1">
            <wire x2="1632" y1="1824" y2="1824" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1824" name="DMA_fifo_dat_strobe_B1" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_B2">
            <wire x2="1632" y1="1872" y2="1872" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1872" name="DMA_fifo_dat_strobe_B2" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_current_A2">
            <wire x2="1632" y1="1920" y2="1920" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1920" name="DMA_fifo_dat_strobe_current_A2" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_current_B1">
            <wire x2="1632" y1="1968" y2="1968" x1="1616" />
        </branch>
        <iomarker fontsize="28" x="1616" y="1968" name="DMA_fifo_dat_strobe_current_B1" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_current_B2">
            <wire x2="1632" y1="2016" y2="2016" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1600" y="2016" name="DMA_fifo_dat_strobe_current_B2" orien="R180" />
        <branch name="DMA_fifo_dat_A2(31:0)">
            <wire x2="1632" y1="1632" y2="1632" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1600" y="1632" name="DMA_fifo_dat_A2(31:0)" orien="R180" />
        <branch name="DMA_fifo_dat_B1(31:0)">
            <wire x2="1632" y1="1680" y2="1680" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1600" y="1680" name="DMA_fifo_dat_B1(31:0)" orien="R180" />
        <branch name="DMA_fifo_dat_B2(31:0)">
            <wire x2="1632" y1="1728" y2="1728" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1600" y="1728" name="DMA_fifo_dat_B2(31:0)" orien="R180" />
        <branch name="DMA_fifo_rd_A2">
            <wire x2="2240" y1="2064" y2="2064" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2240" y="2064" name="DMA_fifo_rd_A2" orien="R0" />
        <branch name="DMA_fifo_rd_B1">
            <wire x2="2240" y1="2112" y2="2112" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2240" y="2112" name="DMA_fifo_rd_B1" orien="R0" />
        <branch name="DMA_fifo_rd_B2">
            <wire x2="2240" y1="2160" y2="2160" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="2240" y="2160" name="DMA_fifo_rd_B2" orien="R0" />
        <instance x="336" y="3424" name="u_debug" orien="R0">
        </instance>
        <branch name="CONTROL0(35:0)">
            <wire x2="912" y1="1792" y2="1792" x1="864" />
            <wire x2="928" y1="1792" y2="1792" x1="912" />
        </branch>
        <branch name="CONTROL1(35:0)">
            <wire x2="896" y1="3392" y2="3392" x1="864" />
            <wire x2="912" y1="3392" y2="3392" x1="896" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="272" y="1792" type="branch" />
            <wire x2="288" y1="1792" y2="1792" x1="272" />
            <wire x2="336" y1="1792" y2="1792" x1="288" />
        </branch>
        <branch name="WBM_CYC_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="1856" type="branch" />
            <wire x2="304" y1="1856" y2="1856" x1="288" />
            <wire x2="336" y1="1856" y2="1856" x1="304" />
        </branch>
        <branch name="WBM_STB_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="1920" type="branch" />
            <wire x2="304" y1="1920" y2="1920" x1="288" />
            <wire x2="336" y1="1920" y2="1920" x1="304" />
        </branch>
        <branch name="WBM_WE_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="1984" type="branch" />
            <wire x2="304" y1="1984" y2="1984" x1="288" />
            <wire x2="336" y1="1984" y2="1984" x1="304" />
        </branch>
        <branch name="WBM_ERR_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2048" type="branch" />
            <wire x2="304" y1="2048" y2="2048" x1="288" />
            <wire x2="336" y1="2048" y2="2048" x1="304" />
        </branch>
        <branch name="WBM_RTY_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2112" type="branch" />
            <wire x2="304" y1="2112" y2="2112" x1="288" />
            <wire x2="336" y1="2112" y2="2112" x1="304" />
        </branch>
        <branch name="WBM_ACK_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="2176" type="branch" />
            <wire x2="320" y1="2176" y2="2176" x1="304" />
            <wire x2="336" y1="2176" y2="2176" x1="320" />
        </branch>
        <branch name="WBS_CYC_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="2240" type="branch" />
            <wire x2="320" y1="2240" y2="2240" x1="304" />
            <wire x2="336" y1="2240" y2="2240" x1="320" />
        </branch>
        <branch name="WBS_STB_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="2304" type="branch" />
            <wire x2="320" y1="2304" y2="2304" x1="304" />
            <wire x2="336" y1="2304" y2="2304" x1="320" />
        </branch>
        <branch name="WBS_WE_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="2368" type="branch" />
            <wire x2="320" y1="2368" y2="2368" x1="304" />
            <wire x2="336" y1="2368" y2="2368" x1="320" />
        </branch>
        <branch name="WBS_ERR_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2432" type="branch" />
            <wire x2="304" y1="2432" y2="2432" x1="288" />
            <wire x2="336" y1="2432" y2="2432" x1="304" />
        </branch>
        <branch name="WBS_RTY_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="2496" type="branch" />
            <wire x2="320" y1="2496" y2="2496" x1="304" />
            <wire x2="336" y1="2496" y2="2496" x1="320" />
        </branch>
        <branch name="WBS_ACK_O">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2560" type="branch" />
            <wire x2="304" y1="2560" y2="2560" x1="288" />
            <wire x2="336" y1="2560" y2="2560" x1="304" />
        </branch>
        <branch name="WB_INT">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="2624" type="branch" />
            <wire x2="320" y1="2624" y2="2624" x1="304" />
            <wire x2="336" y1="2624" y2="2624" x1="320" />
        </branch>
        <branch name="WBM_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2688" type="branch" />
            <wire x2="304" y1="2688" y2="2688" x1="288" />
            <wire x2="336" y1="2688" y2="2688" x1="304" />
        </branch>
        <branch name="WBM_ADR_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2752" type="branch" />
            <wire x2="304" y1="2752" y2="2752" x1="288" />
            <wire x2="336" y1="2752" y2="2752" x1="304" />
        </branch>
        <branch name="WBM_CTI_O(2:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="2816" type="branch" />
            <wire x2="320" y1="2816" y2="2816" x1="304" />
            <wire x2="336" y1="2816" y2="2816" x1="320" />
        </branch>
        <branch name="WBM_BTE_O(1:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2880" type="branch" />
            <wire x2="304" y1="2880" y2="2880" x1="288" />
            <wire x2="336" y1="2880" y2="2880" x1="304" />
        </branch>
        <branch name="WBM_SEL_O(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="2944" type="branch" />
            <wire x2="304" y1="2944" y2="2944" x1="288" />
            <wire x2="336" y1="2944" y2="2944" x1="304" />
        </branch>
        <branch name="WBM_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="3008" type="branch" />
            <wire x2="336" y1="3008" y2="3008" x1="304" />
        </branch>
        <branch name="WBS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="3072" type="branch" />
            <wire x2="336" y1="3072" y2="3072" x1="288" />
        </branch>
        <branch name="WBS_ADR_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="3136" type="branch" />
            <wire x2="336" y1="3136" y2="3136" x1="304" />
        </branch>
        <branch name="WBS_CTI_I(2:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="3200" type="branch" />
            <wire x2="336" y1="3200" y2="3200" x1="288" />
        </branch>
        <branch name="WBS_BTE_I(1:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="304" y="3264" type="branch" />
            <wire x2="336" y1="3264" y2="3264" x1="304" />
        </branch>
        <branch name="WBS_SEL_I(3:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="3328" type="branch" />
            <wire x2="336" y1="3328" y2="3328" x1="288" />
        </branch>
        <branch name="WBS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="288" y="3392" type="branch" />
            <wire x2="336" y1="3392" y2="3392" x1="288" />
        </branch>
        <iomarker fontsize="28" x="928" y="1792" name="CONTROL0(35:0)" orien="R0" />
        <iomarker fontsize="28" x="912" y="3392" name="CONTROL1(35:0)" orien="R0" />
        <branch name="rst_channel_0">
            <wire x2="3760" y1="2208" y2="2208" x1="3712" />
        </branch>
        <branch name="rst_channel_1">
            <wire x2="3760" y1="2272" y2="2272" x1="3712" />
        </branch>
        <branch name="rst_channel_2">
            <wire x2="3760" y1="2336" y2="2336" x1="3712" />
        </branch>
        <branch name="rst_channel_3">
            <wire x2="3760" y1="2400" y2="2400" x1="3712" />
        </branch>
        <iomarker fontsize="28" x="3760" y="2208" name="rst_channel_0" orien="R0" />
        <iomarker fontsize="28" x="3760" y="2272" name="rst_channel_1" orien="R0" />
        <iomarker fontsize="28" x="3760" y="2336" name="rst_channel_2" orien="R0" />
        <iomarker fontsize="28" x="3760" y="2400" name="rst_channel_3" orien="R0" />
        <instance x="800" y="256" name="XLXI_19" orien="R0" />
        <branch name="rst_wb_dma_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1088" y="160" type="branch" />
            <wire x2="1088" y1="160" y2="160" x1="1056" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="752" y="128" type="branch" />
            <wire x2="800" y1="128" y2="128" x1="752" />
        </branch>
        <branch name="rst_wb_dma">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="752" y="192" type="branch" />
            <wire x2="800" y1="192" y2="192" x1="752" />
        </branch>
        <branch name="rst_wb_dma_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1584" y="240" type="branch" />
            <wire x2="1632" y1="240" y2="240" x1="1584" />
        </branch>
        <branch name="rst_wb_dma">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="2464" type="branch" />
            <wire x2="3744" y1="2464" y2="2464" x1="3712" />
        </branch>
        <branch name="channel_0_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="2240" type="branch" />
            <wire x2="3072" y1="2240" y2="2240" x1="3024" />
        </branch>
        <branch name="channel_1_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3040" y="2288" type="branch" />
            <wire x2="3072" y1="2288" y2="2288" x1="3040" />
        </branch>
        <branch name="channel_2_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3040" y="2336" type="branch" />
            <wire x2="3072" y1="2336" y2="2336" x1="3040" />
        </branch>
        <branch name="channel_3_up">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3024" y="2384" type="branch" />
            <wire x2="3072" y1="2384" y2="2384" x1="3024" />
        </branch>
        <branch name="PCI_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4560" y="2432" type="branch" />
            <wire x2="4656" y1="2432" y2="2432" x1="4560" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4560" y="2496" type="branch" />
            <wire x2="4656" y1="2496" y2="2496" x1="4560" />
        </branch>
        <branch name="WB_PCI_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4560" y="2560" type="branch" />
            <wire x2="4656" y1="2560" y2="2560" x1="4560" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4560" y="2624" type="branch" />
            <wire x2="4640" y1="2624" y2="2624" x1="4560" />
        </branch>
        <branch name="WBS_CYC_I">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4544" y="2336" type="branch" />
            <wire x2="4560" y1="2336" y2="2336" x1="4544" />
            <wire x2="4656" y1="2336" y2="2336" x1="4560" />
        </branch>
        <iomarker fontsize="28" x="4656" y="2432" name="PCI_CLK" orien="R0" />
        <iomarker fontsize="28" x="4656" y="2496" name="WB_CLK" orien="R0" />
        <iomarker fontsize="28" x="4656" y="2560" name="WB_PCI_RST" orien="R0" />
        <iomarker fontsize="28" x="4640" y="2624" name="WB_RST_DELAY" orien="R0" />
        <iomarker fontsize="28" x="4656" y="2336" name="WBS_CYC_I" orien="R0" />
        <branch name="pulse_A_trig">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="2528" type="branch" />
            <wire x2="3760" y1="2528" y2="2528" x1="3712" />
        </branch>
        <branch name="pulse_B_trig">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="2592" type="branch" />
            <wire x2="3760" y1="2592" y2="2592" x1="3712" />
        </branch>
        <branch name="pulse_A_width(5:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3744" y="2656" type="branch" />
            <wire x2="3744" y1="2656" y2="2656" x1="3712" />
        </branch>
        <branch name="pulse_B_width(5:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3760" y="2720" type="branch" />
            <wire x2="3760" y1="2720" y2="2720" x1="3712" />
        </branch>
        <branch name="bc3">
            <wire x2="3072" y1="2448" y2="2448" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="3040" y="2448" name="bc3" orien="R180" />
        <branch name="bc2">
            <wire x2="3072" y1="2512" y2="2512" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="3040" y="2512" name="bc2" orien="R180" />
        <branch name="bc1">
            <wire x2="3072" y1="2576" y2="2576" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="3040" y="2576" name="bc1" orien="R180" />
        <branch name="bc0">
            <wire x2="3072" y1="2640" y2="2640" x1="3024" />
        </branch>
        <iomarker fontsize="28" x="3024" y="2640" name="bc0" orien="R180" />
        <branch name="channel_0_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1984" y="2368" type="branch" />
            <wire x2="1984" y1="2368" y2="2368" x1="1808" />
        </branch>
        <branch name="channel_1_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1984" y="2432" type="branch" />
            <wire x2="1968" y1="2432" y2="2432" x1="1808" />
            <wire x2="1984" y1="2432" y2="2432" x1="1968" />
        </branch>
        <branch name="channel_2_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2000" y="2496" type="branch" />
            <wire x2="1984" y1="2496" y2="2496" x1="1808" />
            <wire x2="2000" y1="2496" y2="2496" x1="1984" />
        </branch>
        <branch name="channel_3_up">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2000" y="2560" type="branch" />
            <wire x2="1984" y1="2560" y2="2560" x1="1808" />
            <wire x2="2000" y1="2560" y2="2560" x1="1984" />
        </branch>
        <iomarker fontsize="28" x="1808" y="2368" name="channel_0_up" orien="R180" />
        <iomarker fontsize="28" x="1808" y="2432" name="channel_1_up" orien="R180" />
        <iomarker fontsize="28" x="1808" y="2496" name="channel_2_up" orien="R180" />
        <iomarker fontsize="28" x="1808" y="2560" name="channel_3_up" orien="R180" />
        <instance x="1744" y="3360" name="pulse_gen_B" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1696" y="2768" type="branch" />
            <wire x2="1744" y1="2768" y2="2768" x1="1696" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1696" y="3136" type="branch" />
            <wire x2="1744" y1="3136" y2="3136" x1="1696" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1712" y="2832" type="branch" />
            <wire x2="1744" y1="2832" y2="2832" x1="1712" />
        </branch>
        <branch name="WB_RST_DELAY">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1712" y="3200" type="branch" />
            <wire x2="1744" y1="3200" y2="3200" x1="1712" />
        </branch>
        <branch name="pulse_A_trig">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1712" y="2896" type="branch" />
            <wire x2="1744" y1="2896" y2="2896" x1="1712" />
        </branch>
        <branch name="pulse_B_trig">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1712" y="3264" type="branch" />
            <wire x2="1744" y1="3264" y2="3264" x1="1712" />
        </branch>
        <branch name="pulse_A_width(5:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1712" y="2960" type="branch" />
            <wire x2="1744" y1="2960" y2="2960" x1="1712" />
        </branch>
        <branch name="pulse_B_width(5:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1712" y="3328" type="branch" />
            <wire x2="1744" y1="3328" y2="3328" x1="1712" />
        </branch>
        <branch name="pulse_A">
            <wire x2="2160" y1="2768" y2="2768" x1="2128" />
        </branch>
        <branch name="pulse_B">
            <wire x2="2160" y1="3136" y2="3136" x1="2128" />
        </branch>
        <instance x="1744" y="2992" name="pulse_gen_A" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2160" y="2768" name="pulse_A" orien="R0" />
        <iomarker fontsize="28" x="2160" y="3136" name="pulse_B" orien="R0" />
        <branch name="start_pulse_A">
            <wire x2="3072" y1="2704" y2="2704" x1="3056" />
        </branch>
        <branch name="end_pulse_A">
            <wire x2="3072" y1="2752" y2="2752" x1="3056" />
        </branch>
        <branch name="start_end_pulse_A">
            <wire x2="3072" y1="2800" y2="2800" x1="3056" />
        </branch>
        <branch name="start_pulse_B">
            <wire x2="3072" y1="2864" y2="2864" x1="3056" />
        </branch>
        <branch name="end_pulse_B">
            <wire x2="3072" y1="2912" y2="2912" x1="3056" />
        </branch>
        <branch name="start_end_pulse_B">
            <wire x2="3072" y1="2960" y2="2960" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3056" y="2704" name="start_pulse_A" orien="R180" />
        <iomarker fontsize="28" x="3056" y="2752" name="end_pulse_A" orien="R180" />
        <iomarker fontsize="28" x="3056" y="2800" name="start_end_pulse_A" orien="R180" />
        <iomarker fontsize="28" x="3056" y="2864" name="start_pulse_B" orien="R180" />
        <iomarker fontsize="28" x="3056" y="2912" name="end_pulse_B" orien="R180" />
        <iomarker fontsize="28" x="3056" y="2960" name="start_end_pulse_B" orien="R180" />
    </sheet>
</drawing>