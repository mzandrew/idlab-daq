<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="BUS_ACK_PAD" />
        <signal name="BUS_REQ_W_1_PAD" />
        <signal name="BUS_REQ_R_1_PAD" />
        <signal name="BUS_REQ_R_2_PAD" />
        <signal name="BUS_WE_PAD" />
        <signal name="BUS_STB_PAD" />
        <signal name="BUS_AD_PAD(31:0)" />
        <signal name="wb_rst_delay" />
        <signal name="wb_clk_2x" />
        <signal name="rd_fifo_empty_1" />
        <signal name="rd_fifo_dat_1(31:0)" />
        <signal name="wr_fifo_wr_en_1" />
        <signal name="wr_fifo_wr_dat_1(31:0)" />
        <signal name="rd_fifo_rd_en_1" />
        <signal name="rd_fifo_empty_2" />
        <signal name="rd_fifo_dat_2(31:0)" />
        <signal name="wr_fifo_wr_en_2" />
        <signal name="wr_fifo_wr_dat_2(31:0)" />
        <signal name="rd_fifo_rd_en_2" />
        <signal name="WB_CLK_2x_PAD" />
        <signal name="BUS_S_RDY" />
        <signal name="BUS_ABORT" />
        <signal name="BUS_M_RDY" />
        <signal name="BUS_REQ_W_2_PAD" />
        <signal name="GTPD1_P" />
        <signal name="GTPD1_N" />
        <signal name="RXP1" />
        <signal name="RXN1" />
        <signal name="TXP1" />
        <signal name="TXN1" />
        <signal name="wb_clk_divide" />
        <signal name="wb_rst" />
        <signal name="wr_fifo_full_1" />
        <signal name="wr_fifo_full_2" />
        <signal name="user_clk_1" />
        <signal name="user_clk_2" />
        <signal name="control3(35:0)" />
        <signal name="control4(35:0)" />
        <signal name="BCLK" />
        <signal name="MGTCLK1P" />
        <signal name="MGTCLK1N" />
        <signal name="MGTCLK2P" />
        <signal name="MGTCLK2N" />
        <signal name="BCLK_BUF" />
        <signal name="dr_rd_en_1" />
        <signal name="dr_rd_data_1(31:0)" />
        <signal name="dr_rd_empty_1" />
        <signal name="dr_rd_en_2" />
        <signal name="dr_rd_empty_2" />
        <signal name="dr_rd_data_2(31:0)" />
        <signal name="dr_wr_en_1" />
        <signal name="dr_wr_data_1(31:0)" />
        <signal name="dr_full_1" />
        <signal name="dr_full_2" />
        <signal name="dr_wr_en_2" />
        <signal name="dr_wr_data_2(31:0)" />
        <signal name="control5(35:0)" />
        <signal name="Aurora_ctrl_vio(7:0)" />
        <signal name="Aurora_ctrl_vio(7)" />
        <signal name="Aurora_rst" />
        <signal name="channel_up_1" />
        <signal name="channel_up_2" />
        <signal name="rst_channel_0_pad" />
        <signal name="rst_channel_1_pad" />
        <signal name="rst_channel_0" />
        <signal name="rst_channel_1" />
        <signal name="Aurora_rst_1" />
        <signal name="Aurora_rst_2" />
        <signal name="rst_dr_2" />
        <signal name="rst_dr_1" />
        <signal name="rst_pool_1" />
        <signal name="rst_pool_2" />
        <signal name="TX_FAULT_1" />
        <signal name="RX_LOSS_1" />
        <signal name="MOD2_1" />
        <signal name="MOD0_1" />
        <signal name="TX_DIS_1" />
        <signal name="MOD1_1" />
        <signal name="TX_FAULT_2" />
        <signal name="RX_LOSS_2" />
        <signal name="MOD2_2" />
        <signal name="MOD0_2" />
        <signal name="TX_DIS_2" />
        <signal name="MOD1_2" />
        <signal name="LED_GREEN_1" />
        <signal name="XLXN_93" />
        <signal name="XLXN_41" />
        <signal name="LED_RED_1" />
        <signal name="LED_GREEN_2" />
        <signal name="XLXN_149" />
        <signal name="XLXN_53" />
        <signal name="LED_RED_2" />
        <signal name="CHANNEL_UP_2_PAD" />
        <signal name="CHANNEL_UP_1_PAD" />
        <signal name="XLXN_152" />
        <signal name="GTPD2_P" />
        <signal name="GTPD2_N" />
        <signal name="RXP2" />
        <signal name="RXN2" />
        <signal name="TXP2" />
        <signal name="TXN2" />
        <signal name="rst_dr_1_in" />
        <signal name="rst_dr_2_in" />
        <signal name="rst_fifo_1" />
        <signal name="rst_fifo_2" />
        <signal name="XLXN_157" />
        <signal name="XLXN_158" />
        <signal name="hard_error_1" />
        <signal name="soft_error_1" />
        <signal name="hard_error_2" />
        <signal name="soft_error_2" />
        <signal name="XLXN_191" />
        <signal name="bc2" />
        <signal name="XLXN_193" />
        <signal name="bc1" />
        <signal name="trans_dis_1" />
        <signal name="trans_dis_2" />
        <signal name="XLXN_159" />
        <signal name="MON_IN" />
        <signal name="MON_OUT" />
        <signal name="start_pulse_in" />
        <signal name="XLXN_196" />
        <signal name="start_pulse_out" />
        <signal name="XLXN_223" />
        <signal name="start_pulse_in_led" />
        <signal name="end_pulse_in" />
        <signal name="XLXN_199" />
        <signal name="end_pulse_out" />
        <signal name="XLXN_233" />
        <signal name="end_pulse_in_led" />
        <port polarity="Input" name="BUS_ACK_PAD" />
        <port polarity="Input" name="BUS_REQ_W_1_PAD" />
        <port polarity="Input" name="BUS_REQ_R_1_PAD" />
        <port polarity="Input" name="BUS_REQ_R_2_PAD" />
        <port polarity="Output" name="BUS_WE_PAD" />
        <port polarity="Output" name="BUS_STB_PAD" />
        <port polarity="BiDirectional" name="BUS_AD_PAD(31:0)" />
        <port polarity="Input" name="WB_CLK_2x_PAD" />
        <port polarity="Input" name="BUS_S_RDY" />
        <port polarity="Input" name="BUS_ABORT" />
        <port polarity="Output" name="BUS_M_RDY" />
        <port polarity="Input" name="BUS_REQ_W_2_PAD" />
        <port polarity="Input" name="GTPD1_P" />
        <port polarity="Input" name="GTPD1_N" />
        <port polarity="Input" name="RXP1" />
        <port polarity="Input" name="RXN1" />
        <port polarity="Output" name="TXP1" />
        <port polarity="Output" name="TXN1" />
        <port polarity="Input" name="BCLK" />
        <port polarity="Output" name="MGTCLK1P" />
        <port polarity="Output" name="MGTCLK1N" />
        <port polarity="Output" name="MGTCLK2P" />
        <port polarity="Output" name="MGTCLK2N" />
        <port polarity="Input" name="rst_channel_0_pad" />
        <port polarity="Input" name="rst_channel_1_pad" />
        <port polarity="Input" name="TX_FAULT_1" />
        <port polarity="Input" name="RX_LOSS_1" />
        <port polarity="Input" name="MOD2_1" />
        <port polarity="Input" name="MOD0_1" />
        <port polarity="Output" name="TX_DIS_1" />
        <port polarity="Output" name="MOD1_1" />
        <port polarity="Input" name="TX_FAULT_2" />
        <port polarity="Input" name="RX_LOSS_2" />
        <port polarity="Input" name="MOD2_2" />
        <port polarity="Input" name="MOD0_2" />
        <port polarity="Output" name="TX_DIS_2" />
        <port polarity="Output" name="MOD1_2" />
        <port polarity="Output" name="LED_GREEN_1" />
        <port polarity="Output" name="LED_RED_1" />
        <port polarity="Output" name="LED_GREEN_2" />
        <port polarity="Output" name="LED_RED_2" />
        <port polarity="Output" name="CHANNEL_UP_2_PAD" />
        <port polarity="Output" name="CHANNEL_UP_1_PAD" />
        <port polarity="Input" name="GTPD2_P" />
        <port polarity="Input" name="GTPD2_N" />
        <port polarity="Input" name="RXP2" />
        <port polarity="Input" name="RXN2" />
        <port polarity="Output" name="TXP2" />
        <port polarity="Output" name="TXN2" />
        <port polarity="Output" name="bc2" />
        <port polarity="Output" name="bc1" />
        <port polarity="Input" name="MON_IN" />
        <port polarity="Output" name="MON_OUT" />
        <port polarity="Input" name="start_pulse_in" />
        <port polarity="Output" name="start_pulse_out" />
        <port polarity="Output" name="start_pulse_in_led" />
        <port polarity="Input" name="end_pulse_in" />
        <port polarity="Output" name="end_pulse_out" />
        <port polarity="Output" name="end_pulse_in_led" />
        <blockdef name="Aurora_FPGA_BUS">
            <timestamp>2011-6-29T3:15:19</timestamp>
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1280" y2="-1280" x1="64" />
            <rect width="64" x="0" y="-1196" height="24" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="832" y1="-1376" y2="-1376" x1="768" />
            <line x2="832" y1="-1312" y2="-1312" x1="768" />
            <line x2="832" y1="-1248" y2="-1248" x1="768" />
            <line x2="768" y1="-1140" y2="-1140" x1="64" />
            <line x2="832" y1="-1040" y2="-1040" x1="768" />
            <line x2="832" y1="-976" y2="-976" x1="768" />
            <line x2="832" y1="-912" y2="-912" x1="768" />
            <line x2="0" y1="-1040" y2="-1040" x1="64" />
            <line x2="0" y1="-944" y2="-944" x1="64" />
            <rect width="64" x="0" y="-860" height="24" />
            <line x2="0" y1="-848" y2="-848" x1="64" />
            <line x2="768" y1="-804" y2="-804" x1="64" />
            <line x2="832" y1="-688" y2="-688" x1="768" />
            <line x2="832" y1="-624" y2="-624" x1="768" />
            <line x2="832" y1="-560" y2="-560" x1="768" />
            <rect width="64" x="768" y="-508" height="24" />
            <line x2="832" y1="-496" y2="-496" x1="768" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="768" y1="-384" y2="-384" x1="64" />
            <line x2="832" y1="-288" y2="-288" x1="768" />
            <line x2="832" y1="-224" y2="-224" x1="768" />
            <line x2="832" y1="-160" y2="-160" x1="768" />
            <rect width="64" x="768" y="-108" height="24" />
            <line x2="832" y1="-96" y2="-96" x1="768" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <line x2="832" y1="96" y2="96" x1="768" />
            <line x2="832" y1="160" y2="160" x1="768" />
            <rect width="64" x="768" y="276" height="24" />
            <line x2="832" y1="288" y2="288" x1="768" />
            <line x2="0" y1="80" y2="80" x1="64" />
            <line x2="0" y1="176" y2="176" x1="64" />
            <line x2="0" y1="272" y2="272" x1="64" />
            <line x2="0" y1="368" y2="368" x1="64" />
            <line x2="768" y1="0" y2="0" x1="64" />
            <rect width="704" x="64" y="-1468" height="2448" />
            <line x2="0" y1="672" y2="672" x1="64" />
            <line x2="832" y1="672" y2="672" x1="768" />
            <line x2="832" y1="608" y2="608" x1="768" />
            <line x2="768" y1="384" y2="384" x1="836" />
            <line x2="64" y1="464" y2="464" x1="0" />
            <line x2="64" y1="544" y2="544" x1="0" />
            <line x2="64" y1="608" y2="608" x1="0" />
            <line x2="768" y1="544" y2="544" x1="832" />
            <line x2="768" y1="480" y2="480" x1="832" />
            <line x2="768" y1="716" y2="716" x1="64" />
            <rect width="64" x="768" y="772" height="24" />
            <line x2="832" y1="784" y2="784" x1="768" />
            <rect width="64" x="768" y="852" height="24" />
            <line x2="832" y1="864" y2="864" x1="768" />
            <rect width="64" x="768" y="932" height="24" />
            <line x2="832" y1="944" y2="944" x1="768" />
            <line x2="64" y1="896" y2="896" x1="0" />
            <line x2="64" y1="784" y2="784" x1="0" />
        </blockdef>
        <blockdef name="Aurora_unit_1">
            <timestamp>2011-12-5T3:28:33</timestamp>
            <rect width="368" x="64" y="-592" height="748" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="496" y1="-544" y2="-544" x1="432" />
            <line x2="496" y1="-480" y2="-480" x1="432" />
            <line x2="496" y1="-416" y2="-416" x1="432" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
            <line x2="432" y1="32" y2="32" x1="496" />
            <line x2="64" y1="32" y2="32" x1="0" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="-560" y2="-560" x1="64" />
            <line x2="64" y1="-464" y2="-464" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="436" y1="80" y2="80" x1="496" />
            <line x2="432" y1="128" y2="128" x1="496" />
        </blockdef>
        <blockdef name="Aurora_unit_2">
            <timestamp>2011-12-5T3:33:7</timestamp>
            <rect width="368" x="64" y="-624" height="768" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="496" y1="-544" y2="-544" x1="432" />
            <line x2="496" y1="-480" y2="-480" x1="432" />
            <line x2="496" y1="-416" y2="-416" x1="432" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
            <line x2="432" y1="32" y2="32" x1="496" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <line x2="64" y1="-480" y2="-480" x1="0" />
            <line x2="64" y1="-544" y2="-544" x1="0" />
            <line x2="432" y1="80" y2="80" x1="496" />
            <line x2="432" y1="128" y2="128" x1="496" />
        </blockdef>
        <blockdef name="obufds">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="116" y1="-16" y2="-16" x1="224" />
            <line x2="96" y1="-48" y2="-48" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="4" cx="104" cy="-16" />
            <line x2="116" y1="-16" y2="-16" x1="108" />
        </blockdef>
        <blockdef name="ibufg">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="fifo_pool">
            <timestamp>2011-6-25T7:51:42</timestamp>
            <rect width="384" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="512" y1="-352" y2="-352" x1="448" />
            <line x2="512" y1="-192" y2="-192" x1="448" />
            <rect width="64" x="448" y="-44" height="24" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
            <line x2="448" y1="-128" y2="-128" x1="512" />
        </blockdef>
        <blockdef name="data_repeater">
            <timestamp>2011-6-9T6:44:16</timestamp>
            <rect width="336" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="64" x="0" y="-92" height="24" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
        </blockdef>
        <blockdef name="vio_wrapper">
            <timestamp>2011-6-27T22:43:12</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
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
        <blockdef name="fo_io">
            <timestamp>2011-12-5T3:35:30</timestamp>
            <rect width="256" x="64" y="-384" height="424" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="64" y1="16" y2="16" x1="0" />
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
        <blockdef name="Aurora_FPGA_LED_driver">
            <timestamp>2011-6-30T5:31:48</timestamp>
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
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
        <blockdef name="delay_unit">
            <timestamp>2011-7-1T20:17:25</timestamp>
            <rect width="160" x="64" y="-112" height="96" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="288" y1="-96" y2="-96" x1="224" />
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
        <blockdef name="bad_ch_detect">
            <timestamp>2011-7-16T8:13:0</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <block symbolname="Aurora_FPGA_BUS" name="u_Aurora_FPGA_BUS">
            <blockpin signalname="user_clk_1" name="Aurora_wr_fifo_clk_1" />
            <blockpin signalname="dr_wr_en_1" name="Aurora_wr_fifo_wr_en_1" />
            <blockpin signalname="dr_wr_data_1(31:0)" name="Aurora_wr_fifo_din_1(31:0)" />
            <blockpin name="Aurora_wr_fifo_full_1" />
            <blockpin signalname="dr_full_1" name="Aurora_wr_fifo_almost_full_1" />
            <blockpin name="Aurora_wr_fifo_prog_full_1" />
            <blockpin name="Aurora_wr_fifo_full_2" />
            <blockpin signalname="dr_full_2" name="Aurora_wr_fifo_almost_full_2" />
            <blockpin name="Aurora_wr_fifo_prog_full_2" />
            <blockpin signalname="user_clk_2" name="Aurora_wr_fifo_clk_2" />
            <blockpin signalname="dr_wr_en_2" name="Aurora_wr_fifo_wr_en_2" />
            <blockpin signalname="dr_wr_data_2(31:0)" name="Aurora_wr_fifo_din_2(31:0)" />
            <blockpin signalname="rd_fifo_empty_1" name="Aurora_rd_fifo_empty_1" />
            <blockpin name="Aurora_rd_fifo_almost_empty_1" />
            <blockpin name="Aurora_rd_fifo_prog_empty_1" />
            <blockpin signalname="rd_fifo_dat_1(31:0)" name="Aurora_rd_fifo_dout_1(31:0)" />
            <blockpin signalname="user_clk_1" name="Aurora_rd_fifo_clk_1" />
            <blockpin signalname="rd_fifo_rd_en_1" name="Aurora_rd_fifo_rd_en_1" />
            <blockpin signalname="rd_fifo_empty_2" name="Aurora_rd_fifo_empty_2" />
            <blockpin name="Aurora_rd_fifo_almost_empty_2" />
            <blockpin name="Aurora_rd_fifo_prog_empty_2" />
            <blockpin signalname="rd_fifo_dat_2(31:0)" name="Aurora_rd_fifo_dout_2(31:0)" />
            <blockpin signalname="user_clk_2" name="Aurora_rd_fifo_clk_2" />
            <blockpin signalname="rd_fifo_rd_en_2" name="Aurora_rd_fifo_rd_en_2" />
            <blockpin signalname="BUS_WE_PAD" name="BUS_WE_PAD" />
            <blockpin signalname="BUS_STB_PAD" name="BUS_STB_PAD" />
            <blockpin signalname="BUS_AD_PAD(31:0)" name="BUS_AD_PAD(31:0)" />
            <blockpin signalname="BUS_ACK_PAD" name="BUS_ACK_PAD" />
            <blockpin signalname="BUS_REQ_W_1_PAD" name="BUS_REQ_W_1_PAD" />
            <blockpin signalname="BUS_REQ_R_1_PAD" name="BUS_REQ_R_1_PAD" />
            <blockpin signalname="BUS_REQ_R_2_PAD" name="BUS_REQ_R_2_PAD" />
            <blockpin signalname="WB_CLK_2x_PAD" name="WB_CLK_2x_PAD" />
            <blockpin signalname="wb_clk_2x" name="wb_clk_2x" />
            <blockpin signalname="wb_rst_delay" name="wb_rst_delay" />
            <blockpin signalname="BUS_M_RDY" name="BUS_M_RDY" />
            <blockpin signalname="BUS_S_RDY" name="BUS_S_RDY" />
            <blockpin signalname="BUS_ABORT" name="BUS_ABORT" />
            <blockpin signalname="BUS_REQ_W_2_PAD" name="BUS_REQ_W_2_PAD" />
            <blockpin signalname="wb_rst" name="wb_rst" />
            <blockpin signalname="wb_clk_divide" name="wb_clk_divide" />
            <blockpin signalname="control3(35:0)" name="control3(35:0)" />
            <blockpin signalname="control4(35:0)" name="control4(35:0)" />
            <blockpin signalname="control5(35:0)" name="control5(35:0)" />
            <blockpin signalname="rst_channel_0" name="rst_channel_0" />
            <blockpin signalname="rst_channel_1" name="rst_channel_1" />
        </block>
        <block symbolname="Aurora_unit_1" name="u_Aurora_unit_1">
            <blockpin signalname="GTPD1_P" name="GTPD1_P" />
            <blockpin signalname="GTPD1_N" name="GTPD1_N" />
            <blockpin signalname="RXP1" name="rxp" />
            <blockpin signalname="RXN1" name="rxn" />
            <blockpin signalname="rd_fifo_empty_1" name="fifo_empty_i" />
            <blockpin signalname="wr_fifo_full_1" name="fifo_full_i" />
            <blockpin signalname="rd_fifo_dat_1(31:0)" name="fifo_dat_i(31:0)" />
            <blockpin signalname="hard_error_1" name="HARD_ERR" />
            <blockpin signalname="soft_error_1" name="SOFT_ERR" />
            <blockpin signalname="channel_up_1" name="CHANNEL_UP" />
            <blockpin name="LANE_UP" />
            <blockpin signalname="TXP1" name="txp" />
            <blockpin signalname="TXN1" name="txn" />
            <blockpin signalname="rd_fifo_rd_en_1" name="fifo_rd_o" />
            <blockpin signalname="wr_fifo_wr_en_1" name="fifo_wr_o" />
            <blockpin signalname="wr_fifo_wr_dat_1(31:0)" name="fifo_wr_dat_o(31:0)" />
            <blockpin signalname="user_clk_1" name="user_clk" />
            <blockpin signalname="control3(35:0)" name="CONTROL(35:0)" />
            <blockpin signalname="Aurora_rst_1" name="user_reset" />
            <blockpin signalname="wb_rst" name="init_clk_not_lock" />
            <blockpin signalname="wb_clk_divide" name="init_clk" />
            <blockpin signalname="rst_fifo_1" name="rst_fifo" />
            <blockpin signalname="trans_dis_1" name="transceiver_dis_out" />
        </block>
        <block symbolname="obufds" name="XLXI_1">
            <blockpin signalname="BCLK_BUF" name="I" />
            <blockpin signalname="MGTCLK1P" name="O" />
            <blockpin signalname="MGTCLK1N" name="OB" />
        </block>
        <block symbolname="obufds" name="XLXI_2">
            <blockpin signalname="BCLK_BUF" name="I" />
            <blockpin signalname="MGTCLK2P" name="O" />
            <blockpin signalname="MGTCLK2N" name="OB" />
        </block>
        <block symbolname="ibufg" name="XLXI_3">
            <blockpin signalname="BCLK" name="I" />
            <blockpin signalname="BCLK_BUF" name="O" />
        </block>
        <block symbolname="fifo_pool" name="u_fifo_pool_2">
            <blockpin signalname="user_clk_2" name="clk" />
            <blockpin signalname="rst_pool_2" name="rst_fifo" />
            <blockpin signalname="wb_rst_delay" name="rst_logic" />
            <blockpin signalname="wr_fifo_wr_en_2" name="fifo_wr_en" />
            <blockpin signalname="dr_rd_en_2" name="fifo_rd_en" />
            <blockpin signalname="wr_fifo_wr_dat_2(31:0)" name="fifo_wr_data(31:0)" />
            <blockpin name="fifo_wr_full" />
            <blockpin signalname="dr_rd_empty_2" name="fifo_rd_empty" />
            <blockpin signalname="dr_rd_data_2(31:0)" name="fifo_rd_data(31:0)" />
            <blockpin signalname="wr_fifo_full_2" name="fifo_wr_almost_full" />
        </block>
        <block symbolname="fifo_pool" name="u_fifo_pool_1">
            <blockpin signalname="user_clk_1" name="clk" />
            <blockpin signalname="rst_pool_1" name="rst_fifo" />
            <blockpin signalname="wb_rst_delay" name="rst_logic" />
            <blockpin signalname="wr_fifo_wr_en_1" name="fifo_wr_en" />
            <blockpin signalname="dr_rd_en_1" name="fifo_rd_en" />
            <blockpin signalname="wr_fifo_wr_dat_1(31:0)" name="fifo_wr_data(31:0)" />
            <blockpin name="fifo_wr_full" />
            <blockpin signalname="dr_rd_empty_1" name="fifo_rd_empty" />
            <blockpin signalname="dr_rd_data_1(31:0)" name="fifo_rd_data(31:0)" />
            <blockpin signalname="wr_fifo_full_1" name="fifo_wr_almost_full" />
        </block>
        <block symbolname="data_repeater" name="data_repeater_1">
            <blockpin signalname="rst_dr_1_in" name="reset_i" />
            <blockpin signalname="user_clk_1" name="clk_i" />
            <blockpin signalname="dr_full_1" name="fifo_full_i" />
            <blockpin signalname="dr_rd_empty_1" name="fifo_empty_i" />
            <blockpin signalname="dr_wr_en_1" name="fifo_write_o" />
            <blockpin signalname="dr_rd_en_1" name="fifo_read_o" />
            <blockpin signalname="dr_wr_data_1(31:0)" name="fifo_dat_o(31:0)" />
            <blockpin signalname="dr_rd_data_1(31:0)" name="fifo_dat_i(31:0)" />
        </block>
        <block symbolname="data_repeater" name="data_repeater_2">
            <blockpin signalname="rst_dr_2_in" name="reset_i" />
            <blockpin signalname="user_clk_2" name="clk_i" />
            <blockpin signalname="dr_full_2" name="fifo_full_i" />
            <blockpin signalname="dr_rd_empty_2" name="fifo_empty_i" />
            <blockpin signalname="dr_wr_en_2" name="fifo_write_o" />
            <blockpin signalname="dr_rd_en_2" name="fifo_read_o" />
            <blockpin signalname="dr_wr_data_2(31:0)" name="fifo_dat_o(31:0)" />
            <blockpin signalname="dr_rd_data_2(31:0)" name="fifo_dat_i(31:0)" />
        </block>
        <block symbolname="vio_wrapper" name="XLXI_4">
            <blockpin signalname="control5(35:0)" name="control(35:0)" />
            <blockpin signalname="Aurora_ctrl_vio(7:0)" name="aurora_ctrl(7:0)" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="XLXN_152" name="I0" />
            <blockpin signalname="Aurora_ctrl_vio(7)" name="I1" />
            <blockpin signalname="Aurora_rst" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_26">
            <blockpin signalname="rst_channel_0_pad" name="I" />
            <blockpin signalname="rst_channel_0" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_27">
            <blockpin signalname="rst_channel_1_pad" name="I" />
            <blockpin signalname="rst_channel_1" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_34">
            <blockpin signalname="rst_fifo_1" name="I0" />
            <blockpin signalname="rst_channel_0" name="I1" />
            <blockpin signalname="rst_pool_1" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_35">
            <blockpin signalname="rst_channel_1" name="I0" />
            <blockpin signalname="rst_fifo_2" name="I1" />
            <blockpin signalname="rst_pool_2" name="O" />
        </block>
        <block symbolname="fo_io" name="XLXI_8">
            <blockpin signalname="TX_FAULT_1" name="TX_FAULT" />
            <blockpin signalname="RX_LOSS_1" name="RX_LOSS" />
            <blockpin signalname="MOD2_1" name="MOD2" />
            <blockpin signalname="MOD0_1" name="MOD0" />
            <blockpin name="xTX_FAULT" />
            <blockpin name="xMOD2" />
            <blockpin name="xMOD0" />
            <blockpin signalname="TX_DIS_1" name="TX_DIS" />
            <blockpin signalname="MOD1_1" name="MOD1" />
            <blockpin name="xRX_LOSS_N" />
            <blockpin signalname="trans_dis_1" name="TX_DIS_IN" />
        </block>
        <block symbolname="fo_io" name="XLXI_9">
            <blockpin signalname="TX_FAULT_2" name="TX_FAULT" />
            <blockpin signalname="RX_LOSS_2" name="RX_LOSS" />
            <blockpin signalname="MOD2_2" name="MOD2" />
            <blockpin signalname="MOD0_2" name="MOD0" />
            <blockpin name="xTX_FAULT" />
            <blockpin name="xMOD2" />
            <blockpin name="xMOD0" />
            <blockpin signalname="TX_DIS_2" name="TX_DIS" />
            <blockpin signalname="MOD1_2" name="MOD1" />
            <blockpin name="xRX_LOSS_N" />
            <blockpin signalname="trans_dis_2" name="TX_DIS_IN" />
        </block>
        <block symbolname="Aurora_FPGA_LED_driver" name="XLXI_47">
            <blockpin signalname="wb_clk_divide" name="clk" />
            <blockpin signalname="channel_up_1" name="rdy" />
            <blockpin signalname="wr_fifo_wr_en_1" name="wr_en" />
            <blockpin signalname="rd_fifo_rd_en_1" name="rd_en" />
            <blockpin signalname="XLXN_93" name="green" />
            <blockpin signalname="XLXN_41" name="red" />
        </block>
        <block symbolname="obuf" name="XLXI_10">
            <blockpin signalname="XLXN_93" name="I" />
            <blockpin signalname="LED_GREEN_1" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_14">
            <blockpin signalname="XLXN_41" name="I" />
            <blockpin signalname="LED_RED_1" name="O" />
        </block>
        <block symbolname="Aurora_FPGA_LED_driver" name="XLXI_50">
            <blockpin signalname="wb_clk_divide" name="clk" />
            <blockpin signalname="channel_up_2" name="rdy" />
            <blockpin signalname="wr_fifo_wr_en_2" name="wr_en" />
            <blockpin signalname="rd_fifo_rd_en_2" name="rd_en" />
            <blockpin signalname="XLXN_149" name="green" />
            <blockpin signalname="XLXN_53" name="red" />
        </block>
        <block symbolname="obuf" name="XLXI_23">
            <blockpin signalname="XLXN_149" name="I" />
            <blockpin signalname="LED_GREEN_2" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_25">
            <blockpin signalname="XLXN_53" name="I" />
            <blockpin signalname="LED_RED_2" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_59">
            <blockpin signalname="channel_up_2" name="I" />
            <blockpin signalname="CHANNEL_UP_2_PAD" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_60">
            <blockpin signalname="channel_up_1" name="I" />
            <blockpin signalname="CHANNEL_UP_1_PAD" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_61">
            <blockpin signalname="XLXN_152" name="G" />
        </block>
        <block symbolname="Aurora_unit_2" name="u_Aurora_unit_2">
            <blockpin signalname="GTPD2_P" name="GTPD0_P" />
            <blockpin signalname="GTPD2_N" name="GTPD0_N" />
            <blockpin signalname="RXP2" name="rxp" />
            <blockpin signalname="RXN2" name="rxn" />
            <blockpin signalname="rd_fifo_empty_2" name="fifo_empty_i" />
            <blockpin signalname="wr_fifo_full_2" name="fifo_full_i" />
            <blockpin signalname="rd_fifo_dat_2(31:0)" name="fifo_dat_i(31:0)" />
            <blockpin signalname="hard_error_2" name="HARD_ERR" />
            <blockpin signalname="soft_error_2" name="SOFT_ERR" />
            <blockpin signalname="channel_up_2" name="CHANNEL_UP" />
            <blockpin name="LANE_UP" />
            <blockpin signalname="TXP2" name="txp" />
            <blockpin signalname="TXN2" name="txn" />
            <blockpin signalname="rd_fifo_rd_en_2" name="fifo_rd_o" />
            <blockpin signalname="wr_fifo_wr_en_2" name="fifo_wr_o" />
            <blockpin signalname="wr_fifo_wr_dat_2(31:0)" name="fifo_wr_dat_o(31:0)" />
            <blockpin signalname="user_clk_2" name="user_clk" />
            <blockpin signalname="control4(35:0)" name="CONTROL(35:0)" />
            <blockpin signalname="Aurora_rst_2" name="user_reset" />
            <blockpin signalname="wb_rst" name="init_clk_not_lock" />
            <blockpin signalname="wb_clk_divide" name="init_clk" />
            <blockpin signalname="rst_fifo_2" name="rst_fifo" />
            <blockpin signalname="trans_dis_2" name="transceiver_dis_out" />
        </block>
        <block symbolname="or2" name="XLXI_33">
            <blockpin signalname="rst_fifo_1" name="I0" />
            <blockpin signalname="rst_channel_0" name="I1" />
            <blockpin signalname="rst_dr_1" name="O" />
        </block>
        <block symbolname="delay_unit" name="XLXI_67">
            <blockpin signalname="user_clk_1" name="clk" />
            <blockpin signalname="rst_dr_1" name="rst" />
            <blockpin signalname="rst_dr_1_in" name="delay_rst" />
        </block>
        <block symbolname="or2" name="XLXI_32">
            <blockpin signalname="rst_fifo_2" name="I0" />
            <blockpin signalname="rst_channel_1" name="I1" />
            <blockpin signalname="rst_dr_2" name="O" />
        </block>
        <block symbolname="delay_unit" name="XLXI_70">
            <blockpin signalname="user_clk_2" name="clk" />
            <blockpin signalname="rst_dr_2" name="rst" />
            <blockpin signalname="rst_dr_2_in" name="delay_rst" />
        </block>
        <block symbolname="or3" name="XLXI_71">
            <blockpin signalname="XLXN_157" name="I0" />
            <blockpin signalname="Aurora_rst" name="I1" />
            <blockpin signalname="rst_channel_0" name="I2" />
            <blockpin signalname="Aurora_rst_1" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_72">
            <blockpin signalname="XLXN_158" name="I0" />
            <blockpin signalname="Aurora_rst" name="I1" />
            <blockpin signalname="rst_channel_1" name="I2" />
            <blockpin signalname="Aurora_rst_2" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_73">
            <blockpin signalname="XLXN_157" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_74">
            <blockpin signalname="XLXN_158" name="G" />
        </block>
        <block symbolname="bad_ch_detect" name="bcd1">
            <blockpin signalname="Aurora_rst_1" name="rst" />
            <blockpin signalname="user_clk_1" name="clk" />
            <blockpin signalname="channel_up_1" name="channel_up" />
            <blockpin signalname="soft_error_1" name="soft_error" />
            <blockpin signalname="hard_error_1" name="hard_error" />
            <blockpin signalname="XLXN_193" name="bad_channel" />
        </block>
        <block symbolname="obuf" name="XLXI_79">
            <blockpin signalname="XLXN_193" name="I" />
            <blockpin signalname="bc1" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_80">
            <blockpin signalname="XLXN_191" name="I" />
            <blockpin signalname="bc2" name="O" />
        </block>
        <block symbolname="bad_ch_detect" name="bcd2">
            <blockpin signalname="Aurora_rst_2" name="rst" />
            <blockpin signalname="user_clk_2" name="clk" />
            <blockpin signalname="channel_up_2" name="channel_up" />
            <blockpin signalname="soft_error_2" name="soft_error" />
            <blockpin signalname="hard_error_2" name="hard_error" />
            <blockpin signalname="XLXN_191" name="bad_channel" />
        </block>
        <block symbolname="ibuf" name="XLXI_75">
            <blockpin signalname="MON_IN" name="I" />
            <blockpin signalname="XLXN_159" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_76">
            <blockpin signalname="XLXN_159" name="I" />
            <blockpin signalname="MON_OUT" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_81">
            <blockpin signalname="start_pulse_in" name="I" />
            <blockpin signalname="XLXN_223" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_82">
            <blockpin signalname="XLXN_223" name="I" />
            <blockpin signalname="start_pulse_out" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_99">
            <blockpin signalname="XLXN_223" name="I" />
            <blockpin signalname="start_pulse_in_led" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_83">
            <blockpin signalname="end_pulse_in" name="I" />
            <blockpin signalname="XLXN_233" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_84">
            <blockpin signalname="XLXN_233" name="I" />
            <blockpin signalname="end_pulse_out" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_106">
            <blockpin signalname="XLXN_233" name="I" />
            <blockpin signalname="end_pulse_in_led" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="704" y="1840" name="u_Aurora_FPGA_BUS" orien="R0">
        </instance>
        <branch name="BUS_ACK_PAD">
            <wire x2="704" y1="1920" y2="1920" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="1920" name="BUS_ACK_PAD" orien="R180" />
        <branch name="BUS_REQ_W_1_PAD">
            <wire x2="704" y1="2016" y2="2016" x1="656" />
        </branch>
        <iomarker fontsize="28" x="656" y="2016" name="BUS_REQ_W_1_PAD" orien="R180" />
        <branch name="BUS_REQ_R_1_PAD">
            <wire x2="704" y1="2112" y2="2112" x1="672" />
        </branch>
        <iomarker fontsize="28" x="672" y="2112" name="BUS_REQ_R_1_PAD" orien="R180" />
        <branch name="BUS_REQ_R_2_PAD">
            <wire x2="704" y1="2208" y2="2208" x1="656" />
        </branch>
        <iomarker fontsize="28" x="656" y="2208" name="BUS_REQ_R_2_PAD" orien="R180" />
        <branch name="BUS_WE_PAD">
            <wire x2="1584" y1="1936" y2="1936" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1584" y="1936" name="BUS_WE_PAD" orien="R0" />
        <branch name="BUS_STB_PAD">
            <wire x2="1584" y1="2000" y2="2000" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1584" y="2000" name="BUS_STB_PAD" orien="R0" />
        <branch name="BUS_AD_PAD(31:0)">
            <wire x2="1584" y1="2128" y2="2128" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1584" y="2128" name="BUS_AD_PAD(31:0)" orien="R0" />
        <branch name="rd_fifo_empty_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="1152" type="branch" />
            <wire x2="1568" y1="1152" y2="1152" x1="1536" />
        </branch>
        <branch name="rd_fifo_dat_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="1344" type="branch" />
            <wire x2="1568" y1="1344" y2="1344" x1="1536" />
        </branch>
        <branch name="rd_fifo_rd_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="1296" type="branch" />
            <wire x2="704" y1="1296" y2="1296" x1="672" />
        </branch>
        <branch name="rd_fifo_empty_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1552" y="1552" type="branch" />
            <wire x2="1552" y1="1552" y2="1552" x1="1536" />
        </branch>
        <branch name="rd_fifo_dat_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="1744" type="branch" />
            <wire x2="1568" y1="1744" y2="1744" x1="1536" />
        </branch>
        <branch name="rd_fifo_rd_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="1728" type="branch" />
            <wire x2="704" y1="1728" y2="1728" x1="672" />
        </branch>
        <branch name="WB_CLK_2x_PAD">
            <wire x2="704" y1="2512" y2="2512" x1="656" />
        </branch>
        <iomarker fontsize="28" x="656" y="2512" name="WB_CLK_2x_PAD" orien="R180" />
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1600" y="2448" type="branch" />
            <wire x2="1600" y1="2448" y2="2448" x1="1536" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1600" y="2512" type="branch" />
            <wire x2="1600" y1="2512" y2="2512" x1="1536" />
        </branch>
        <branch name="BUS_S_RDY">
            <wire x2="704" y1="2304" y2="2304" x1="656" />
        </branch>
        <iomarker fontsize="28" x="656" y="2304" name="BUS_S_RDY" orien="R180" />
        <branch name="BUS_ABORT">
            <wire x2="704" y1="2384" y2="2384" x1="672" />
        </branch>
        <iomarker fontsize="28" x="672" y="2384" name="BUS_ABORT" orien="R180" />
        <branch name="BUS_M_RDY">
            <wire x2="1600" y1="2224" y2="2224" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1600" y="2224" name="BUS_M_RDY" orien="R0" />
        <branch name="BUS_REQ_W_2_PAD">
            <wire x2="704" y1="2448" y2="2448" x1="672" />
        </branch>
        <iomarker fontsize="28" x="672" y="2448" name="BUS_REQ_W_2_PAD" orien="R180" />
        <branch name="GTPD1_P">
            <wire x2="3536" y1="544" y2="544" x1="3520" />
            <wire x2="3552" y1="544" y2="544" x1="3536" />
        </branch>
        <branch name="GTPD1_N">
            <wire x2="3536" y1="608" y2="608" x1="3520" />
            <wire x2="3552" y1="608" y2="608" x1="3536" />
        </branch>
        <iomarker fontsize="28" x="3520" y="544" name="GTPD1_P" orien="R180" />
        <iomarker fontsize="28" x="3520" y="608" name="GTPD1_N" orien="R180" />
        <branch name="RXP1">
            <wire x2="3536" y1="672" y2="672" x1="3520" />
            <wire x2="3552" y1="672" y2="672" x1="3536" />
        </branch>
        <iomarker fontsize="28" x="3520" y="672" name="RXP1" orien="R180" />
        <branch name="RXN1">
            <wire x2="3536" y1="736" y2="736" x1="3520" />
            <wire x2="3552" y1="736" y2="736" x1="3536" />
        </branch>
        <iomarker fontsize="28" x="3520" y="736" name="RXN1" orien="R180" />
        <branch name="TXP1">
            <wire x2="4080" y1="672" y2="672" x1="4048" />
            <wire x2="4096" y1="672" y2="672" x1="4080" />
        </branch>
        <iomarker fontsize="28" x="4096" y="672" name="TXP1" orien="R0" />
        <branch name="TXN1">
            <wire x2="4080" y1="736" y2="736" x1="4048" />
            <wire x2="4096" y1="736" y2="736" x1="4080" />
        </branch>
        <iomarker fontsize="28" x="4096" y="736" name="TXN1" orien="R0" />
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2320" type="branch" />
            <wire x2="1584" y1="2320" y2="2320" x1="1536" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2384" type="branch" />
            <wire x2="1584" y1="2384" y2="2384" x1="1536" />
        </branch>
        <branch name="rd_fifo_empty_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="800" type="branch" />
            <wire x2="3536" y1="800" y2="800" x1="3520" />
            <wire x2="3552" y1="800" y2="800" x1="3536" />
        </branch>
        <branch name="wr_fifo_full_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="864" type="branch" />
            <wire x2="3520" y1="864" y2="864" x1="3504" />
            <wire x2="3552" y1="864" y2="864" x1="3520" />
        </branch>
        <branch name="rd_fifo_dat_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="928" type="branch" />
            <wire x2="3536" y1="928" y2="928" x1="3520" />
            <wire x2="3552" y1="928" y2="928" x1="3536" />
        </branch>
        <branch name="rd_fifo_rd_en_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="800" type="branch" />
            <wire x2="4064" y1="800" y2="800" x1="4048" />
            <wire x2="4080" y1="800" y2="800" x1="4064" />
        </branch>
        <branch name="wr_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="864" type="branch" />
            <wire x2="4064" y1="864" y2="864" x1="4048" />
            <wire x2="4080" y1="864" y2="864" x1="4064" />
        </branch>
        <branch name="wr_fifo_wr_dat_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4096" y="928" type="branch" />
            <wire x2="4080" y1="928" y2="928" x1="4048" />
            <wire x2="4096" y1="928" y2="928" x1="4080" />
        </branch>
        <instance x="3552" y="960" name="u_Aurora_unit_1" orien="R0">
        </instance>
        <branch name="user_clk_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="992" type="branch" />
            <wire x2="4064" y1="992" y2="992" x1="4048" />
            <wire x2="4080" y1="992" y2="992" x1="4064" />
        </branch>
        <branch name="user_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="464" type="branch" />
            <wire x2="704" y1="464" y2="464" x1="672" />
        </branch>
        <branch name="user_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="800" type="branch" />
            <wire x2="704" y1="800" y2="800" x1="672" />
        </branch>
        <branch name="user_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="1200" type="branch" />
            <wire x2="704" y1="1200" y2="1200" x1="672" />
        </branch>
        <branch name="user_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="1632" type="branch" />
            <wire x2="704" y1="1632" y2="1632" x1="672" />
        </branch>
        <branch name="control3(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2624" type="branch" />
            <wire x2="1568" y1="2624" y2="2624" x1="1536" />
        </branch>
        <branch name="control4(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2704" type="branch" />
            <wire x2="1568" y1="2704" y2="2704" x1="1536" />
        </branch>
        <branch name="control3(35:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="992" type="branch" />
            <wire x2="3536" y1="992" y2="992" x1="3520" />
            <wire x2="3552" y1="992" y2="992" x1="3536" />
        </branch>
        <branch name="BCLK">
            <wire x2="3888" y1="1184" y2="1184" x1="3776" />
        </branch>
        <iomarker fontsize="28" x="3776" y="1184" name="BCLK" orien="R180" />
        <instance x="3760" y="1360" name="XLXI_1" orien="R0" />
        <instance x="3760" y="1488" name="XLXI_2" orien="R0" />
        <branch name="MGTCLK1P">
            <wire x2="4048" y1="1312" y2="1312" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4048" y="1312" name="MGTCLK1P" orien="R0" />
        <branch name="MGTCLK1N">
            <wire x2="4048" y1="1344" y2="1344" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4048" y="1344" name="MGTCLK1N" orien="R0" />
        <branch name="MGTCLK2P">
            <wire x2="4032" y1="1440" y2="1440" x1="3984" />
        </branch>
        <branch name="MGTCLK2N">
            <wire x2="4032" y1="1472" y2="1472" x1="3984" />
        </branch>
        <iomarker fontsize="28" x="4032" y="1440" name="MGTCLK2P" orien="R0" />
        <iomarker fontsize="28" x="4032" y="1472" name="MGTCLK2N" orien="R0" />
        <instance x="3888" y="1216" name="XLXI_3" orien="R0" />
        <branch name="BCLK_BUF">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4160" y="1184" type="branch" />
            <wire x2="4160" y1="1184" y2="1184" x1="4112" />
        </branch>
        <branch name="BCLK_BUF">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3712" y="1328" type="branch" />
            <wire x2="3760" y1="1328" y2="1328" x1="3712" />
        </branch>
        <branch name="BCLK_BUF">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3712" y="1456" type="branch" />
            <wire x2="3760" y1="1456" y2="1456" x1="3712" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="1168" type="branch" />
            <wire x2="2544" y1="1168" y2="1168" x1="2528" />
        </branch>
        <branch name="user_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="1040" type="branch" />
            <wire x2="2544" y1="1040" y2="1040" x1="2512" />
        </branch>
        <instance x="2544" y="1392" name="u_fifo_pool_2" orien="R0">
        </instance>
        <instance x="2544" y="768" name="u_fifo_pool_1" orien="R0">
        </instance>
        <branch name="user_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2496" y="416" type="branch" />
            <wire x2="2544" y1="416" y2="416" x1="2496" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="544" type="branch" />
            <wire x2="2544" y1="544" y2="544" x1="2528" />
        </branch>
        <branch name="wr_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="608" type="branch" />
            <wire x2="2544" y1="608" y2="608" x1="2512" />
        </branch>
        <instance x="2560" y="1920" name="data_repeater_1" orien="R0">
        </instance>
        <instance x="2560" y="2448" name="data_repeater_2" orien="R0">
        </instance>
        <branch name="dr_rd_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2496" y="672" type="branch" />
            <wire x2="2544" y1="672" y2="672" x1="2496" />
        </branch>
        <branch name="dr_rd_en_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3056" y="1728" type="branch" />
            <wire x2="3056" y1="1728" y2="1728" x1="3024" />
        </branch>
        <branch name="wr_fifo_wr_dat_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="736" type="branch" />
            <wire x2="2544" y1="736" y2="736" x1="2512" />
        </branch>
        <branch name="wr_fifo_full_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3104" y="640" type="branch" />
            <wire x2="3104" y1="640" y2="640" x1="3056" />
        </branch>
        <branch name="dr_rd_data_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3088" y="736" type="branch" />
            <wire x2="3088" y1="736" y2="736" x1="3056" />
        </branch>
        <branch name="dr_rd_data_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="1840" type="branch" />
            <wire x2="2560" y1="1840" y2="1840" x1="2528" />
        </branch>
        <branch name="dr_rd_empty_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3088" y="576" type="branch" />
            <wire x2="3088" y1="576" y2="576" x1="3056" />
        </branch>
        <branch name="dr_rd_empty_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="1760" type="branch" />
            <wire x2="2560" y1="1760" y2="1760" x1="2528" />
        </branch>
        <branch name="user_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="1632" type="branch" />
            <wire x2="2560" y1="1632" y2="1632" x1="2544" />
        </branch>
        <branch name="wr_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="1232" type="branch" />
            <wire x2="2544" y1="1232" y2="1232" x1="2512" />
        </branch>
        <branch name="dr_rd_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="1296" type="branch" />
            <wire x2="2544" y1="1296" y2="1296" x1="2528" />
        </branch>
        <branch name="dr_rd_en_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3040" y="2256" type="branch" />
            <wire x2="3040" y1="2256" y2="2256" x1="3024" />
        </branch>
        <branch name="wr_fifo_wr_dat_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="1360" type="branch" />
            <wire x2="2544" y1="1360" y2="1360" x1="2512" />
        </branch>
        <branch name="dr_rd_empty_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3088" y="1200" type="branch" />
            <wire x2="3088" y1="1200" y2="1200" x1="3056" />
        </branch>
        <branch name="dr_rd_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="2288" type="branch" />
            <wire x2="2560" y1="2288" y2="2288" x1="2528" />
        </branch>
        <branch name="wr_fifo_full_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="1264" type="branch" />
            <wire x2="3072" y1="1264" y2="1264" x1="3056" />
        </branch>
        <branch name="dr_rd_data_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3088" y="1360" type="branch" />
            <wire x2="3088" y1="1360" y2="1360" x1="3056" />
        </branch>
        <branch name="dr_rd_data_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2368" type="branch" />
            <wire x2="2560" y1="2368" y2="2368" x1="2544" />
        </branch>
        <branch name="user_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2160" type="branch" />
            <wire x2="2560" y1="2160" y2="2160" x1="2544" />
        </branch>
        <branch name="dr_wr_en_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3056" y="1568" type="branch" />
            <wire x2="3056" y1="1568" y2="1568" x1="3024" />
        </branch>
        <branch name="dr_wr_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="688" y="560" type="branch" />
            <wire x2="704" y1="560" y2="560" x1="688" />
        </branch>
        <branch name="dr_wr_data_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="1888" type="branch" />
            <wire x2="3072" y1="1888" y2="1888" x1="3024" />
        </branch>
        <branch name="dr_wr_data_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="688" y="656" type="branch" />
            <wire x2="704" y1="656" y2="656" x1="688" />
        </branch>
        <branch name="dr_full_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="1696" type="branch" />
            <wire x2="2560" y1="1696" y2="1696" x1="2512" />
        </branch>
        <branch name="dr_full_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="528" type="branch" />
            <wire x2="1568" y1="528" y2="528" x1="1536" />
        </branch>
        <branch name="dr_full_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2224" type="branch" />
            <wire x2="2560" y1="2224" y2="2224" x1="2544" />
        </branch>
        <branch name="dr_full_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="864" type="branch" />
            <wire x2="1568" y1="864" y2="864" x1="1536" />
        </branch>
        <branch name="dr_wr_en_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3040" y="2096" type="branch" />
            <wire x2="3040" y1="2096" y2="2096" x1="3024" />
        </branch>
        <branch name="dr_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="896" type="branch" />
            <wire x2="704" y1="896" y2="896" x1="672" />
        </branch>
        <branch name="dr_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="2416" type="branch" />
            <wire x2="3072" y1="2416" y2="2416" x1="3024" />
        </branch>
        <branch name="dr_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="688" y="992" type="branch" />
            <wire x2="704" y1="992" y2="992" x1="688" />
        </branch>
        <branch name="control5(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1552" y="2784" type="branch" />
            <wire x2="1552" y1="2784" y2="2784" x1="1536" />
        </branch>
        <instance x="2592" y="2784" name="XLXI_4" orien="R0">
        </instance>
        <branch name="control5(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3008" y="2752" type="branch" />
            <wire x2="3008" y1="2752" y2="2752" x1="2976" />
        </branch>
        <branch name="Aurora_ctrl_vio(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3024" y="2688" type="branch" />
            <wire x2="3024" y1="2688" y2="2688" x1="2976" />
        </branch>
        <instance x="2720" y="3024" name="XLXI_5" orien="R0" />
        <branch name="Aurora_ctrl_vio(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="2896" type="branch" />
            <wire x2="2720" y1="2896" y2="2896" x1="2640" />
        </branch>
        <branch name="Aurora_rst">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3024" y="2928" type="branch" />
            <wire x2="3024" y1="2928" y2="2928" x1="2976" />
        </branch>
        <branch name="channel_up_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="544" type="branch" />
            <wire x2="4064" y1="544" y2="544" x1="4048" />
            <wire x2="4080" y1="544" y2="544" x1="4064" />
        </branch>
        <branch name="rst_channel_0_pad">
            <wire x2="704" y1="3072" y2="3072" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="3072" name="rst_channel_0_pad" orien="R180" />
        <branch name="rst_channel_1_pad">
            <wire x2="688" y1="3216" y2="3216" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="3216" name="rst_channel_1_pad" orien="R180" />
        <instance x="704" y="3104" name="XLXI_26" orien="R0" />
        <instance x="688" y="3248" name="XLXI_27" orien="R0" />
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1008" y="3072" type="branch" />
            <wire x2="1008" y1="3072" y2="3072" x1="928" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="992" y="3216" type="branch" />
            <wire x2="992" y1="3216" y2="3216" x1="912" />
        </branch>
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="656" y="2624" type="branch" />
            <wire x2="704" y1="2624" y2="2624" x1="656" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="672" y="2736" type="branch" />
            <wire x2="704" y1="2736" y2="2736" x1="672" />
        </branch>
        <instance x="2240" y="912" name="XLXI_34" orien="R0" />
        <instance x="2240" y="1040" name="XLXI_35" orien="R0" />
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2208" y="784" type="branch" />
            <wire x2="2240" y1="784" y2="784" x1="2208" />
        </branch>
        <branch name="rst_pool_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2528" y="816" type="branch" />
            <wire x2="2528" y1="816" y2="816" x1="2496" />
        </branch>
        <branch name="rst_pool_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2528" y="944" type="branch" />
            <wire x2="2528" y1="944" y2="944" x1="2496" />
        </branch>
        <branch name="rst_pool_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="480" type="branch" />
            <wire x2="2544" y1="480" y2="480" x1="2512" />
        </branch>
        <branch name="rst_pool_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2512" y="1104" type="branch" />
            <wire x2="2544" y1="1104" y2="1104" x1="2512" />
        </branch>
        <instance x="4720" y="1232" name="XLXI_8" orien="R0">
        </instance>
        <branch name="TX_FAULT_1">
            <wire x2="4720" y1="880" y2="880" x1="4704" />
        </branch>
        <branch name="RX_LOSS_1">
            <wire x2="4720" y1="976" y2="976" x1="4688" />
        </branch>
        <branch name="MOD2_1">
            <wire x2="4720" y1="1072" y2="1072" x1="4672" />
        </branch>
        <branch name="MOD0_1">
            <wire x2="4720" y1="1168" y2="1168" x1="4688" />
        </branch>
        <branch name="TX_DIS_1">
            <wire x2="5136" y1="1072" y2="1072" x1="5104" />
        </branch>
        <branch name="MOD1_1">
            <wire x2="5136" y1="1136" y2="1136" x1="5104" />
        </branch>
        <instance x="4736" y="1776" name="XLXI_9" orien="R0">
        </instance>
        <branch name="TX_FAULT_2">
            <wire x2="4736" y1="1424" y2="1424" x1="4704" />
        </branch>
        <branch name="RX_LOSS_2">
            <wire x2="4736" y1="1520" y2="1520" x1="4704" />
        </branch>
        <branch name="MOD2_2">
            <wire x2="4736" y1="1616" y2="1616" x1="4704" />
        </branch>
        <branch name="MOD0_2">
            <wire x2="4736" y1="1712" y2="1712" x1="4720" />
        </branch>
        <branch name="TX_DIS_2">
            <wire x2="5168" y1="1616" y2="1616" x1="5120" />
        </branch>
        <branch name="MOD1_2">
            <wire x2="5152" y1="1680" y2="1680" x1="5120" />
        </branch>
        <iomarker fontsize="28" x="4704" y="880" name="TX_FAULT_1" orien="R180" />
        <iomarker fontsize="28" x="4688" y="976" name="RX_LOSS_1" orien="R180" />
        <iomarker fontsize="28" x="4672" y="1072" name="MOD2_1" orien="R180" />
        <iomarker fontsize="28" x="4688" y="1168" name="MOD0_1" orien="R180" />
        <iomarker fontsize="28" x="5136" y="1072" name="TX_DIS_1" orien="R0" />
        <iomarker fontsize="28" x="5136" y="1136" name="MOD1_1" orien="R0" />
        <iomarker fontsize="28" x="4704" y="1424" name="TX_FAULT_2" orien="R180" />
        <iomarker fontsize="28" x="4704" y="1520" name="RX_LOSS_2" orien="R180" />
        <iomarker fontsize="28" x="4704" y="1616" name="MOD2_2" orien="R180" />
        <iomarker fontsize="28" x="4720" y="1712" name="MOD0_2" orien="R180" />
        <iomarker fontsize="28" x="5168" y="1616" name="TX_DIS_2" orien="R0" />
        <iomarker fontsize="28" x="5152" y="1680" name="MOD1_2" orien="R0" />
        <instance x="4480" y="704" name="XLXI_47" orien="R0">
        </instance>
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4448" y="480" type="branch" />
            <wire x2="4480" y1="480" y2="480" x1="4448" />
        </branch>
        <branch name="channel_up_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4448" y="544" type="branch" />
            <wire x2="4480" y1="544" y2="544" x1="4448" />
        </branch>
        <branch name="wr_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4448" y="608" type="branch" />
            <wire x2="4480" y1="608" y2="608" x1="4448" />
        </branch>
        <branch name="rd_fifo_rd_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4464" y="672" type="branch" />
            <wire x2="4480" y1="672" y2="672" x1="4464" />
        </branch>
        <instance x="4896" y="512" name="XLXI_10" orien="R0" />
        <iomarker fontsize="28" x="5168" y="480" name="LED_GREEN_1" orien="R0" />
        <branch name="LED_GREEN_1">
            <wire x2="5136" y1="480" y2="480" x1="5120" />
            <wire x2="5168" y1="480" y2="480" x1="5136" />
        </branch>
        <branch name="XLXN_93">
            <wire x2="4896" y1="480" y2="480" x1="4864" />
        </branch>
        <branch name="XLXN_41">
            <wire x2="4896" y1="544" y2="544" x1="4864" />
        </branch>
        <instance x="4896" y="576" name="XLXI_14" orien="R0" />
        <branch name="LED_RED_1">
            <wire x2="5136" y1="544" y2="544" x1="5120" />
            <wire x2="5168" y1="544" y2="544" x1="5136" />
        </branch>
        <iomarker fontsize="28" x="5168" y="544" name="LED_RED_1" orien="R0" />
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4480" y="2240" type="branch" />
            <wire x2="4496" y1="2240" y2="2240" x1="4480" />
        </branch>
        <branch name="channel_up_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4480" y="2304" type="branch" />
            <wire x2="4496" y1="2304" y2="2304" x1="4480" />
        </branch>
        <branch name="wr_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4464" y="2368" type="branch" />
            <wire x2="4496" y1="2368" y2="2368" x1="4464" />
        </branch>
        <branch name="rd_fifo_rd_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4480" y="2432" type="branch" />
            <wire x2="4496" y1="2432" y2="2432" x1="4480" />
        </branch>
        <instance x="4496" y="2464" name="XLXI_50" orien="R0">
        </instance>
        <instance x="4912" y="2272" name="XLXI_23" orien="R0" />
        <branch name="LED_GREEN_2">
            <wire x2="5184" y1="2240" y2="2240" x1="5136" />
        </branch>
        <iomarker fontsize="28" x="5184" y="2240" name="LED_GREEN_2" orien="R0" />
        <branch name="XLXN_149">
            <wire x2="4912" y1="2240" y2="2240" x1="4880" />
        </branch>
        <instance x="4928" y="2336" name="XLXI_25" orien="R0" />
        <branch name="XLXN_53">
            <wire x2="4928" y1="2304" y2="2304" x1="4880" />
        </branch>
        <branch name="LED_RED_2">
            <wire x2="5168" y1="2304" y2="2304" x1="5152" />
        </branch>
        <iomarker fontsize="28" x="5168" y="2304" name="LED_RED_2" orien="R0" />
        <instance x="4640" y="2672" name="XLXI_59" orien="R0" />
        <branch name="CHANNEL_UP_2_PAD">
            <wire x2="4912" y1="2640" y2="2640" x1="4864" />
        </branch>
        <iomarker fontsize="28" x="4912" y="2640" name="CHANNEL_UP_2_PAD" orien="R0" />
        <branch name="channel_up_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4624" y="2640" type="branch" />
            <wire x2="4640" y1="2640" y2="2640" x1="4624" />
        </branch>
        <instance x="4560" y="224" name="XLXI_60" orien="R0" />
        <branch name="CHANNEL_UP_1_PAD">
            <wire x2="4800" y1="192" y2="192" x1="4784" />
            <wire x2="4848" y1="192" y2="192" x1="4800" />
        </branch>
        <iomarker fontsize="28" x="4848" y="192" name="CHANNEL_UP_1_PAD" orien="R0" />
        <branch name="channel_up_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4528" y="192" type="branch" />
            <wire x2="4560" y1="192" y2="192" x1="4528" />
        </branch>
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="448" type="branch" />
            <wire x2="3552" y1="448" y2="448" x1="3520" />
        </branch>
        <branch name="XLXN_152">
            <wire x2="2720" y1="2960" y2="2960" x1="2704" />
        </branch>
        <instance x="2576" y="2896" name="XLXI_61" orien="R90" />
        <branch name="Aurora_rst_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="400" type="branch" />
            <wire x2="3552" y1="400" y2="400" x1="3520" />
        </branch>
        <branch name="GTPD2_P">
            <wire x2="3504" y1="2416" y2="2416" x1="3488" />
            <wire x2="3536" y1="2416" y2="2416" x1="3504" />
        </branch>
        <branch name="GTPD2_N">
            <wire x2="3504" y1="2480" y2="2480" x1="3488" />
            <wire x2="3536" y1="2480" y2="2480" x1="3504" />
        </branch>
        <branch name="RXP2">
            <wire x2="3536" y1="2544" y2="2544" x1="3520" />
        </branch>
        <branch name="RXN2">
            <wire x2="3536" y1="2608" y2="2608" x1="3520" />
        </branch>
        <branch name="TXP2">
            <wire x2="4048" y1="2544" y2="2544" x1="4032" />
            <wire x2="4064" y1="2544" y2="2544" x1="4048" />
        </branch>
        <branch name="TXN2">
            <wire x2="4048" y1="2608" y2="2608" x1="4032" />
            <wire x2="4064" y1="2608" y2="2608" x1="4048" />
        </branch>
        <branch name="rd_fifo_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="2672" type="branch" />
            <wire x2="3520" y1="2672" y2="2672" x1="3504" />
            <wire x2="3536" y1="2672" y2="2672" x1="3520" />
        </branch>
        <branch name="wr_fifo_full_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="2736" type="branch" />
            <wire x2="3520" y1="2736" y2="2736" x1="3504" />
            <wire x2="3536" y1="2736" y2="2736" x1="3520" />
        </branch>
        <branch name="rd_fifo_dat_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3488" y="2800" type="branch" />
            <wire x2="3504" y1="2800" y2="2800" x1="3488" />
            <wire x2="3536" y1="2800" y2="2800" x1="3504" />
        </branch>
        <branch name="rd_fifo_rd_en_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="2672" type="branch" />
            <wire x2="4064" y1="2672" y2="2672" x1="4032" />
            <wire x2="4080" y1="2672" y2="2672" x1="4064" />
        </branch>
        <branch name="wr_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="2736" type="branch" />
            <wire x2="4064" y1="2736" y2="2736" x1="4032" />
            <wire x2="4080" y1="2736" y2="2736" x1="4064" />
        </branch>
        <branch name="wr_fifo_wr_dat_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="2800" type="branch" />
            <wire x2="4064" y1="2800" y2="2800" x1="4032" />
            <wire x2="4080" y1="2800" y2="2800" x1="4064" />
        </branch>
        <branch name="user_clk_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="2864" type="branch" />
            <wire x2="4064" y1="2864" y2="2864" x1="4032" />
            <wire x2="4080" y1="2864" y2="2864" x1="4064" />
        </branch>
        <branch name="control4(35:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3488" y="2864" type="branch" />
            <wire x2="3504" y1="2864" y2="2864" x1="3488" />
            <wire x2="3536" y1="2864" y2="2864" x1="3504" />
        </branch>
        <branch name="channel_up_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="2416" type="branch" />
            <wire x2="4064" y1="2416" y2="2416" x1="4032" />
            <wire x2="4080" y1="2416" y2="2416" x1="4064" />
        </branch>
        <instance x="3536" y="2832" name="u_Aurora_unit_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3488" y="2416" name="GTPD2_P" orien="R180" />
        <iomarker fontsize="28" x="3488" y="2480" name="GTPD2_N" orien="R180" />
        <iomarker fontsize="28" x="3520" y="2544" name="RXP2" orien="R180" />
        <iomarker fontsize="28" x="3520" y="2608" name="RXN2" orien="R180" />
        <iomarker fontsize="28" x="4064" y="2544" name="TXP2" orien="R0" />
        <iomarker fontsize="28" x="4064" y="2608" name="TXN2" orien="R0" />
        <branch name="Aurora_rst_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="2240" type="branch" />
            <wire x2="3520" y1="2240" y2="2240" x1="3504" />
            <wire x2="3536" y1="2240" y2="2240" x1="3520" />
        </branch>
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="2288" type="branch" />
            <wire x2="3520" y1="2288" y2="2288" x1="3504" />
            <wire x2="3536" y1="2288" y2="2288" x1="3520" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="2352" type="branch" />
            <wire x2="3536" y1="2352" y2="2352" x1="3520" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3536" y="496" type="branch" />
            <wire x2="3552" y1="496" y2="496" x1="3536" />
        </branch>
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2000" y="1456" type="branch" />
            <wire x2="2032" y1="1456" y2="1456" x1="2000" />
        </branch>
        <branch name="rst_dr_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2320" y="1488" type="branch" />
            <wire x2="2320" y1="1488" y2="1488" x1="2288" />
        </branch>
        <instance x="2032" y="1584" name="XLXI_33" orien="R0" />
        <instance x="1968" y="1760" name="XLXI_67" orien="R0">
        </instance>
        <branch name="user_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1936" y="1664" type="branch" />
            <wire x2="1968" y1="1664" y2="1664" x1="1936" />
        </branch>
        <branch name="rst_dr_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1936" y="1728" type="branch" />
            <wire x2="1968" y1="1728" y2="1728" x1="1936" />
        </branch>
        <branch name="rst_dr_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2288" y="1664" type="branch" />
            <wire x2="2288" y1="1664" y2="1664" x1="2256" />
        </branch>
        <branch name="rst_dr_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="1568" type="branch" />
            <wire x2="2560" y1="1568" y2="1568" x1="2544" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2048" y="1952" type="branch" />
            <wire x2="2064" y1="1952" y2="1952" x1="2048" />
        </branch>
        <branch name="rst_dr_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2352" y="1984" type="branch" />
            <wire x2="2352" y1="1984" y2="1984" x1="2320" />
        </branch>
        <instance x="2064" y="2080" name="XLXI_32" orien="R0" />
        <instance x="2032" y="2288" name="XLXI_70" orien="R0">
        </instance>
        <branch name="user_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2016" y="2192" type="branch" />
            <wire x2="2032" y1="2192" y2="2192" x1="2016" />
        </branch>
        <branch name="rst_dr_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2016" y="2256" type="branch" />
            <wire x2="2032" y1="2256" y2="2256" x1="2016" />
        </branch>
        <branch name="rst_dr_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2336" y="2192" type="branch" />
            <wire x2="2336" y1="2192" y2="2192" x1="2320" />
        </branch>
        <branch name="rst_dr_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2096" type="branch" />
            <wire x2="2560" y1="2096" y2="2096" x1="2544" />
        </branch>
        <branch name="rst_fifo_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="1040" type="branch" />
            <wire x2="4080" y1="1040" y2="1040" x1="4048" />
        </branch>
        <branch name="rst_fifo_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4064" y="2912" type="branch" />
            <wire x2="4064" y1="2912" y2="2912" x1="4032" />
        </branch>
        <instance x="3232" y="256" name="XLXI_71" orien="R0" />
        <branch name="Aurora_rst_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3520" y="128" type="branch" />
            <wire x2="3520" y1="128" y2="128" x1="3488" />
        </branch>
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3200" y="64" type="branch" />
            <wire x2="3232" y1="64" y2="64" x1="3200" />
        </branch>
        <branch name="Aurora_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3200" y="128" type="branch" />
            <wire x2="3232" y1="128" y2="128" x1="3200" />
        </branch>
        <instance x="3680" y="1936" name="XLXI_72" orien="R0" />
        <branch name="Aurora_rst_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="1808" type="branch" />
            <wire x2="3968" y1="1808" y2="1808" x1="3936" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3648" y="1744" type="branch" />
            <wire x2="3680" y1="1744" y2="1744" x1="3648" />
        </branch>
        <branch name="Aurora_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3632" y="1808" type="branch" />
            <wire x2="3680" y1="1808" y2="1808" x1="3632" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2208" y="976" type="branch" />
            <wire x2="2240" y1="976" y2="976" x1="2208" />
        </branch>
        <branch name="rst_fifo_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2208" y="848" type="branch" />
            <wire x2="2240" y1="848" y2="848" x1="2208" />
        </branch>
        <branch name="rst_fifo_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2208" y="912" type="branch" />
            <wire x2="2240" y1="912" y2="912" x1="2208" />
        </branch>
        <branch name="rst_fifo_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2000" y="1520" type="branch" />
            <wire x2="2032" y1="1520" y2="1520" x1="2000" />
        </branch>
        <branch name="rst_fifo_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2048" y="2016" type="branch" />
            <wire x2="2064" y1="2016" y2="2016" x1="2048" />
        </branch>
        <branch name="XLXN_157">
            <wire x2="3216" y1="192" y2="192" x1="3200" />
            <wire x2="3232" y1="192" y2="192" x1="3216" />
        </branch>
        <instance x="3136" y="320" name="XLXI_73" orien="R0" />
        <branch name="XLXN_158">
            <wire x2="3680" y1="1872" y2="1872" x1="3648" />
        </branch>
        <instance x="3584" y="2000" name="XLXI_74" orien="R0" />
        <branch name="hard_error_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="3376" type="branch" />
            <wire x2="3536" y1="3376" y2="3376" x1="3520" />
        </branch>
        <instance x="3536" y="3408" name="bcd1" orien="R0">
        </instance>
        <branch name="Aurora_rst_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="3120" type="branch" />
            <wire x2="3536" y1="3120" y2="3120" x1="3504" />
        </branch>
        <branch name="user_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3504" y="3184" type="branch" />
            <wire x2="3536" y1="3184" y2="3184" x1="3504" />
        </branch>
        <branch name="channel_up_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="3248" type="branch" />
            <wire x2="3536" y1="3248" y2="3248" x1="3520" />
        </branch>
        <branch name="soft_error_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3520" y="3312" type="branch" />
            <wire x2="3536" y1="3312" y2="3312" x1="3520" />
        </branch>
        <branch name="hard_error_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4064" y="416" type="branch" />
            <wire x2="4064" y1="416" y2="416" x1="4048" />
        </branch>
        <branch name="soft_error_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4064" y="480" type="branch" />
            <wire x2="4064" y1="480" y2="480" x1="4048" />
        </branch>
        <branch name="hard_error_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4048" y="2288" type="branch" />
            <wire x2="4048" y1="2288" y2="2288" x1="4032" />
        </branch>
        <branch name="soft_error_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4048" y="2352" type="branch" />
            <wire x2="4048" y1="2352" y2="2352" x1="4032" />
        </branch>
        <branch name="Aurora_rst_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4640" y="3136" type="branch" />
            <wire x2="4656" y1="3136" y2="3136" x1="4640" />
        </branch>
        <branch name="user_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4624" y="3200" type="branch" />
            <wire x2="4656" y1="3200" y2="3200" x1="4624" />
        </branch>
        <branch name="channel_up_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4640" y="3264" type="branch" />
            <wire x2="4656" y1="3264" y2="3264" x1="4640" />
        </branch>
        <branch name="soft_error_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4640" y="3328" type="branch" />
            <wire x2="4656" y1="3328" y2="3328" x1="4640" />
        </branch>
        <branch name="hard_error_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4640" y="3392" type="branch" />
            <wire x2="4656" y1="3392" y2="3392" x1="4640" />
        </branch>
        <instance x="5056" y="3168" name="XLXI_80" orien="R0" />
        <instance x="4656" y="3424" name="bcd2" orien="R0">
        </instance>
        <branch name="XLXN_191">
            <wire x2="5056" y1="3136" y2="3136" x1="5040" />
        </branch>
        <branch name="bc2">
            <wire x2="5296" y1="3136" y2="3136" x1="5280" />
        </branch>
        <iomarker fontsize="28" x="5296" y="3136" name="bc2" orien="R0" />
        <instance x="3952" y="3152" name="XLXI_79" orien="R0" />
        <branch name="XLXN_193">
            <wire x2="3952" y1="3120" y2="3120" x1="3920" />
        </branch>
        <branch name="bc1">
            <wire x2="4192" y1="3120" y2="3120" x1="4176" />
        </branch>
        <iomarker fontsize="28" x="4192" y="3120" name="bc1" orien="R0" />
        <branch name="trans_dis_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4688" y="1248" type="branch" />
            <wire x2="4720" y1="1248" y2="1248" x1="4688" />
        </branch>
        <branch name="trans_dis_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4080" y="1088" type="branch" />
            <wire x2="4080" y1="1088" y2="1088" x1="4048" />
        </branch>
        <branch name="trans_dis_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4688" y="1792" type="branch" />
            <wire x2="4736" y1="1792" y2="1792" x1="4688" />
        </branch>
        <branch name="trans_dis_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4064" y="2960" type="branch" />
            <wire x2="4064" y1="2960" y2="2960" x1="4032" />
        </branch>
        <instance x="1648" y="2976" name="XLXI_75" orien="R0" />
        <instance x="1936" y="2976" name="XLXI_76" orien="R0" />
        <branch name="XLXN_159">
            <wire x2="1936" y1="2944" y2="2944" x1="1872" />
        </branch>
        <branch name="MON_IN">
            <wire x2="1648" y1="2944" y2="2944" x1="1600" />
        </branch>
        <branch name="MON_OUT">
            <wire x2="2192" y1="2944" y2="2944" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="1600" y="2944" name="MON_IN" orien="R180" />
        <iomarker fontsize="28" x="2192" y="2944" name="MON_OUT" orien="R0" />
        <branch name="start_pulse_in">
            <wire x2="1696" y1="3088" y2="3088" x1="1664" />
        </branch>
        <instance x="1696" y="3120" name="XLXI_81" orien="R0" />
        <iomarker fontsize="28" x="1664" y="3088" name="start_pulse_in" orien="R180" />
        <instance x="2032" y="3120" name="XLXI_82" orien="R0" />
        <branch name="start_pulse_out">
            <wire x2="2272" y1="3088" y2="3088" x1="2256" />
        </branch>
        <iomarker fontsize="28" x="2272" y="3088" name="start_pulse_out" orien="R0" />
        <instance x="2032" y="3200" name="XLXI_99" orien="R0" />
        <branch name="start_pulse_in_led">
            <wire x2="2288" y1="3168" y2="3168" x1="2256" />
        </branch>
        <iomarker fontsize="28" x="2288" y="3168" name="start_pulse_in_led" orien="R0" />
        <branch name="XLXN_223">
            <wire x2="1968" y1="3088" y2="3088" x1="1920" />
            <wire x2="2032" y1="3088" y2="3088" x1="1968" />
            <wire x2="1968" y1="3088" y2="3168" x1="1968" />
            <wire x2="2032" y1="3168" y2="3168" x1="1968" />
        </branch>
        <branch name="end_pulse_in">
            <wire x2="1696" y1="3296" y2="3296" x1="1664" />
        </branch>
        <instance x="1696" y="3328" name="XLXI_83" orien="R0" />
        <iomarker fontsize="28" x="1664" y="3296" name="end_pulse_in" orien="R180" />
        <instance x="2032" y="3328" name="XLXI_84" orien="R0" />
        <branch name="end_pulse_out">
            <wire x2="2272" y1="3296" y2="3296" x1="2256" />
        </branch>
        <iomarker fontsize="28" x="2272" y="3296" name="end_pulse_out" orien="R0" />
        <instance x="2032" y="3424" name="XLXI_106" orien="R0" />
        <branch name="XLXN_233">
            <wire x2="1936" y1="3296" y2="3296" x1="1920" />
            <wire x2="1968" y1="3296" y2="3296" x1="1936" />
            <wire x2="2032" y1="3296" y2="3296" x1="1968" />
            <wire x2="1968" y1="3296" y2="3392" x1="1968" />
            <wire x2="2032" y1="3392" y2="3392" x1="1968" />
        </branch>
        <branch name="end_pulse_in_led">
            <wire x2="2272" y1="3392" y2="3392" x1="2256" />
        </branch>
        <iomarker fontsize="28" x="2272" y="3392" name="end_pulse_in_led" orien="R0" />
    </sheet>
</drawing>