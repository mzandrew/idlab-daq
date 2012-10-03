<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="WB_CLK" />
        <signal name="WB_RST" />
        <signal name="WB_CLK_2x" />
        <signal name="fifo_data_valid_A1" />
        <signal name="fifo_data_A1(31:0)" />
        <signal name="fifo_prog_full_A1" />
        <signal name="fifo_length_A1(27:0)" />
        <signal name="down_fifo_rd_A1" />
        <signal name="down_fifo_empty_A1" />
        <signal name="down_fifo_rdat_A1(31:0)" />
        <signal name="fifo_data_valid_B1" />
        <signal name="fifo_data_B1(31:0)" />
        <signal name="fifo_prog_full_B1" />
        <signal name="fifo_length_B1(27:0)" />
        <signal name="down_fifo_rd_B1" />
        <signal name="down_fifo_empty_B1" />
        <signal name="down_fifo_rdat_B1(31:0)" />
        <signal name="down_fifo_almost_empty_A1" />
        <signal name="down_fifo_prog_empty_A1" />
        <signal name="fifo_data_valid_A2" />
        <signal name="fifo_data_A2(31:0)" />
        <signal name="fifo_prog_full_A2" />
        <signal name="fifo_length_A2(27:0)" />
        <signal name="down_fifo_rd_A2" />
        <signal name="down_fifo_empty_A2" />
        <signal name="down_fifo_rdat_A2(31:0)" />
        <signal name="fifo_data_valid_B2" />
        <signal name="fifo_data_B2(31:0)" />
        <signal name="fifo_prog_full_B2" />
        <signal name="fifo_length_B2(27:0)" />
        <signal name="down_fifo_rd_B2" />
        <signal name="down_fifo_empty_B2" />
        <signal name="down_fifo_rdat_B2(31:0)" />
        <signal name="down_fifo_almost_empty_A2" />
        <signal name="down_fifo_prog_empty_A2" />
        <signal name="down_fifo_almost_empty_B2" />
        <signal name="down_fifo_prog_empty_B2" />
        <signal name="down_fifo_almost_empty_B1" />
        <signal name="down_fifo_prog_empty_B1" />
        <signal name="DMA_fifo_rd_A2" />
        <signal name="DMA_fifo_dat_strobe_A2" />
        <signal name="DMA_fifo_dat_A2(31:0)" />
        <signal name="DMA_fifo_cnt_A2(27:0)" />
        <signal name="DMA_fifo_dat_strobe_current_A2" />
        <signal name="DMA_fifo_rd_B2" />
        <signal name="DMA_fifo_dat_strobe_B2" />
        <signal name="DMA_fifo_dat_B2(31:0)" />
        <signal name="DMA_fifo_cnt_B2(27:0)" />
        <signal name="DMA_fifo_dat_strobe_current_B2" />
        <signal name="DMA_merge_fifo_prog_full_A2" />
        <signal name="DMA_merge_fifo_prog_full_B2" />
        <signal name="DMA_merge_fifo_wr_en_A2" />
        <signal name="DMA_merge_fifo_wr_en_B2" />
        <signal name="DMA_merge_fifo_wr_dat_A2(31:0)" />
        <signal name="DMA_fifo_rd_B1" />
        <signal name="DMA_fifo_dat_strobe_B1" />
        <signal name="DMA_fifo_dat_B1(31:0)" />
        <signal name="DMA_fifo_cnt_B1(27:0)" />
        <signal name="DMA_fifo_dat_strobe_current_B1" />
        <signal name="DMA_merge_fifo_prog_full_B1" />
        <signal name="DMA_merge_fifo_wr_en_B1" />
        <signal name="DMA_merge_fifo_wr_dat_B1(31:0)" />
        <signal name="DMA_fifo_dat_strobe_current_A1" />
        <signal name="DMA_fifo_dat_A1(31:0)" />
        <signal name="DMA_fifo_dat_strobe_A1" />
        <signal name="DMA_fifo_rd_A1" />
        <signal name="DMA_fifo_cnt_A1(27:0)" />
        <signal name="DMA_merge_fifo_prog_full_A1" />
        <signal name="DMA_merge_fifo_wr_en_A1" />
        <signal name="DMA_merge_fifo_wr_dat_A1(31:0)" />
        <signal name="DMA_merge_fifo_wr_dat_B2(31:0)" />
        <signal name="rst_channel_0" />
        <signal name="rst_channel_1" />
        <signal name="rst_channel_2" />
        <signal name="rst_channel_3" />
        <signal name="rst_channel_0_in" />
        <signal name="rst_channel_1_in" />
        <signal name="rst_channel_2_in" />
        <signal name="rst_channel_3_in" />
        <port polarity="Input" name="WB_CLK" />
        <port polarity="Input" name="WB_RST" />
        <port polarity="Input" name="WB_CLK_2x" />
        <port polarity="Input" name="fifo_data_valid_A1" />
        <port polarity="Input" name="fifo_data_A1(31:0)" />
        <port polarity="Output" name="fifo_prog_full_A1" />
        <port polarity="Output" name="fifo_length_A1(27:0)" />
        <port polarity="Input" name="down_fifo_rd_A1" />
        <port polarity="Output" name="down_fifo_empty_A1" />
        <port polarity="Output" name="down_fifo_rdat_A1(31:0)" />
        <port polarity="Input" name="fifo_data_valid_B1" />
        <port polarity="Input" name="fifo_data_B1(31:0)" />
        <port polarity="Output" name="fifo_prog_full_B1" />
        <port polarity="Output" name="fifo_length_B1(27:0)" />
        <port polarity="Input" name="down_fifo_rd_B1" />
        <port polarity="Output" name="down_fifo_empty_B1" />
        <port polarity="Output" name="down_fifo_rdat_B1(31:0)" />
        <port polarity="Output" name="down_fifo_almost_empty_A1" />
        <port polarity="Output" name="down_fifo_prog_empty_A1" />
        <port polarity="Input" name="fifo_data_valid_A2" />
        <port polarity="Input" name="fifo_data_A2(31:0)" />
        <port polarity="Output" name="fifo_prog_full_A2" />
        <port polarity="Output" name="fifo_length_A2(27:0)" />
        <port polarity="Input" name="down_fifo_rd_A2" />
        <port polarity="Output" name="down_fifo_empty_A2" />
        <port polarity="Output" name="down_fifo_rdat_A2(31:0)" />
        <port polarity="Input" name="fifo_data_valid_B2" />
        <port polarity="Input" name="fifo_data_B2(31:0)" />
        <port polarity="Output" name="fifo_prog_full_B2" />
        <port polarity="Output" name="fifo_length_B2(27:0)" />
        <port polarity="Input" name="down_fifo_rd_B2" />
        <port polarity="Output" name="down_fifo_empty_B2" />
        <port polarity="Output" name="down_fifo_rdat_B2(31:0)" />
        <port polarity="Output" name="down_fifo_almost_empty_A2" />
        <port polarity="Output" name="down_fifo_prog_empty_A2" />
        <port polarity="Output" name="down_fifo_almost_empty_B2" />
        <port polarity="Output" name="down_fifo_prog_empty_B2" />
        <port polarity="Output" name="down_fifo_almost_empty_B1" />
        <port polarity="Output" name="down_fifo_prog_empty_B1" />
        <port polarity="Input" name="DMA_fifo_rd_A2" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_A2" />
        <port polarity="Output" name="DMA_fifo_dat_A2(31:0)" />
        <port polarity="Output" name="DMA_fifo_cnt_A2(27:0)" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_current_A2" />
        <port polarity="Input" name="DMA_fifo_rd_B2" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_B2" />
        <port polarity="Output" name="DMA_fifo_dat_B2(31:0)" />
        <port polarity="Output" name="DMA_fifo_cnt_B2(27:0)" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_current_B2" />
        <port polarity="Output" name="DMA_merge_fifo_prog_full_A2" />
        <port polarity="Output" name="DMA_merge_fifo_prog_full_B2" />
        <port polarity="Input" name="DMA_merge_fifo_wr_en_A2" />
        <port polarity="Input" name="DMA_merge_fifo_wr_en_B2" />
        <port polarity="Input" name="DMA_merge_fifo_wr_dat_A2(31:0)" />
        <port polarity="Input" name="DMA_fifo_rd_B1" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_B1" />
        <port polarity="Output" name="DMA_fifo_dat_B1(31:0)" />
        <port polarity="Output" name="DMA_fifo_cnt_B1(27:0)" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_current_B1" />
        <port polarity="Output" name="DMA_merge_fifo_prog_full_B1" />
        <port polarity="Input" name="DMA_merge_fifo_wr_en_B1" />
        <port polarity="Input" name="DMA_merge_fifo_wr_dat_B1(31:0)" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_current_A1" />
        <port polarity="Output" name="DMA_fifo_dat_A1(31:0)" />
        <port polarity="Output" name="DMA_fifo_dat_strobe_A1" />
        <port polarity="Input" name="DMA_fifo_rd_A1" />
        <port polarity="Output" name="DMA_fifo_cnt_A1(27:0)" />
        <port polarity="Output" name="DMA_merge_fifo_prog_full_A1" />
        <port polarity="Input" name="DMA_merge_fifo_wr_en_A1" />
        <port polarity="Input" name="DMA_merge_fifo_wr_dat_A1(31:0)" />
        <port polarity="Input" name="DMA_merge_fifo_wr_dat_B2(31:0)" />
        <port polarity="Input" name="rst_channel_0" />
        <port polarity="Input" name="rst_channel_1" />
        <port polarity="Input" name="rst_channel_2" />
        <port polarity="Input" name="rst_channel_3" />
        <blockdef name="fifo_interface">
            <timestamp>2011-6-8T5:23:33</timestamp>
            <rect width="256" x="64" y="-384" height="592" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="20" height="24" />
            <line x2="320" y1="32" y2="32" x1="384" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="320" y1="160" y2="160" x1="384" />
        </blockdef>
        <blockdef name="DMA_merge_fifo">
            <timestamp>2011-6-8T4:23:7</timestamp>
            <rect width="416" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-496" y2="-496" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="544" y1="-608" y2="-608" x1="480" />
            <line x2="544" y1="-544" y2="-544" x1="480" />
            <line x2="544" y1="-480" y2="-480" x1="480" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <line x2="544" y1="-352" y2="-352" x1="480" />
            <line x2="544" y1="-288" y2="-288" x1="480" />
            <line x2="544" y1="-224" y2="-224" x1="480" />
            <rect width="64" x="480" y="-172" height="24" />
            <line x2="544" y1="-160" y2="-160" x1="480" />
            <rect width="64" x="480" y="-108" height="24" />
            <line x2="544" y1="-96" y2="-96" x1="480" />
            <rect width="64" x="480" y="-44" height="24" />
            <line x2="544" y1="-32" y2="-32" x1="480" />
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
        <block symbolname="DMA_merge_fifo" name="u_fifo_A1">
            <blockpin signalname="rst_channel_0_in" name="reset_i" />
            <blockpin signalname="WB_CLK_2x" name="rd_clk_i" />
            <blockpin signalname="down_fifo_rd_A1" name="fifo_rd_i" />
            <blockpin signalname="WB_CLK" name="wr_clk_i" />
            <blockpin signalname="fifo_data_valid_A1" name="fifo_wr_i" />
            <blockpin signalname="fifo_data_A1(31:0)" name="fifo_wr_dat_i(31:0)" />
            <blockpin name="fifo_rd_dat_valid_o" />
            <blockpin name="fifo_full" />
            <blockpin name="fifo_almost_full" />
            <blockpin signalname="fifo_prog_full_A1" name="fifo_prog_full" />
            <blockpin signalname="down_fifo_empty_A1" name="fifo_empty" />
            <blockpin signalname="down_fifo_almost_empty_A1" name="fifo_almost_empty" />
            <blockpin signalname="down_fifo_prog_empty_A1" name="prog_empty" />
            <blockpin signalname="down_fifo_rdat_A1(31:0)" name="fifo_rd_dat_o(31:0)" />
            <blockpin signalname="fifo_length_A1(27:0)" name="wr_data_count(27:0)" />
            <blockpin name="rd_data_count(27:0)" />
        </block>
        <block symbolname="DMA_merge_fifo" name="u_fifo_B1">
            <blockpin signalname="rst_channel_2_in" name="reset_i" />
            <blockpin signalname="WB_CLK_2x" name="rd_clk_i" />
            <blockpin signalname="down_fifo_rd_B1" name="fifo_rd_i" />
            <blockpin signalname="WB_CLK" name="wr_clk_i" />
            <blockpin signalname="fifo_data_valid_B1" name="fifo_wr_i" />
            <blockpin signalname="fifo_data_B1(31:0)" name="fifo_wr_dat_i(31:0)" />
            <blockpin name="fifo_rd_dat_valid_o" />
            <blockpin name="fifo_full" />
            <blockpin name="fifo_almost_full" />
            <blockpin signalname="fifo_prog_full_B1" name="fifo_prog_full" />
            <blockpin signalname="down_fifo_empty_B1" name="fifo_empty" />
            <blockpin signalname="down_fifo_almost_empty_B1" name="fifo_almost_empty" />
            <blockpin signalname="down_fifo_prog_empty_B1" name="prog_empty" />
            <blockpin signalname="down_fifo_rdat_B1(31:0)" name="fifo_rd_dat_o(31:0)" />
            <blockpin signalname="fifo_length_B1(27:0)" name="wr_data_count(27:0)" />
            <blockpin name="rd_data_count(27:0)" />
        </block>
        <block symbolname="DMA_merge_fifo" name="u_fifo_A2">
            <blockpin signalname="rst_channel_1_in" name="reset_i" />
            <blockpin signalname="WB_CLK_2x" name="rd_clk_i" />
            <blockpin signalname="down_fifo_rd_A2" name="fifo_rd_i" />
            <blockpin signalname="WB_CLK" name="wr_clk_i" />
            <blockpin signalname="fifo_data_valid_A2" name="fifo_wr_i" />
            <blockpin signalname="fifo_data_A2(31:0)" name="fifo_wr_dat_i(31:0)" />
            <blockpin name="fifo_rd_dat_valid_o" />
            <blockpin name="fifo_full" />
            <blockpin name="fifo_almost_full" />
            <blockpin signalname="fifo_prog_full_A2" name="fifo_prog_full" />
            <blockpin signalname="down_fifo_empty_A2" name="fifo_empty" />
            <blockpin signalname="down_fifo_almost_empty_A2" name="fifo_almost_empty" />
            <blockpin signalname="down_fifo_prog_empty_A2" name="prog_empty" />
            <blockpin signalname="down_fifo_rdat_A2(31:0)" name="fifo_rd_dat_o(31:0)" />
            <blockpin signalname="fifo_length_A2(27:0)" name="wr_data_count(27:0)" />
            <blockpin name="rd_data_count(27:0)" />
        </block>
        <block symbolname="DMA_merge_fifo" name="u_fifo_B2">
            <blockpin signalname="rst_channel_3_in" name="reset_i" />
            <blockpin signalname="WB_CLK_2x" name="rd_clk_i" />
            <blockpin signalname="down_fifo_rd_B2" name="fifo_rd_i" />
            <blockpin signalname="WB_CLK" name="wr_clk_i" />
            <blockpin signalname="fifo_data_valid_B2" name="fifo_wr_i" />
            <blockpin signalname="fifo_data_B2(31:0)" name="fifo_wr_dat_i(31:0)" />
            <blockpin name="fifo_rd_dat_valid_o" />
            <blockpin name="fifo_full" />
            <blockpin name="fifo_almost_full" />
            <blockpin signalname="fifo_prog_full_B2" name="fifo_prog_full" />
            <blockpin signalname="down_fifo_empty_B2" name="fifo_empty" />
            <blockpin signalname="down_fifo_almost_empty_B2" name="fifo_almost_empty" />
            <blockpin signalname="down_fifo_prog_empty_B2" name="prog_empty" />
            <blockpin signalname="down_fifo_rdat_B2(31:0)" name="fifo_rd_dat_o(31:0)" />
            <blockpin signalname="fifo_length_B2(27:0)" name="wr_data_count(27:0)" />
            <blockpin name="rd_data_count(27:0)" />
        </block>
        <block symbolname="fifo_interface" name="u_DMA_fifo_A2">
            <blockpin signalname="WB_CLK_2x" name="wr_clk" />
            <blockpin signalname="WB_CLK" name="rd_clk" />
            <blockpin signalname="DMA_merge_fifo_wr_en_A2" name="wr_en" />
            <blockpin signalname="DMA_fifo_rd_A2" name="rd_en" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_A2(31:0)" name="din(31:0)" />
            <blockpin name="full" />
            <blockpin name="almost_full" />
            <blockpin name="empty" />
            <blockpin name="almost_empty" />
            <blockpin signalname="DMA_fifo_dat_strobe_A2" name="next_valid" />
            <blockpin signalname="DMA_fifo_dat_A2(31:0)" name="dout(31:0)" />
            <blockpin signalname="DMA_fifo_cnt_A2(27:0)" name="rd_data_count(27:0)" />
            <blockpin signalname="DMA_merge_fifo_prog_full_A2" name="prog_full" />
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A2" name="dout_valid" />
        </block>
        <block symbolname="fifo_interface" name="u_DMA_fifo_B2">
            <blockpin signalname="WB_CLK_2x" name="wr_clk" />
            <blockpin signalname="WB_CLK" name="rd_clk" />
            <blockpin signalname="DMA_merge_fifo_wr_en_B2" name="wr_en" />
            <blockpin signalname="DMA_fifo_rd_B2" name="rd_en" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_B2(31:0)" name="din(31:0)" />
            <blockpin name="full" />
            <blockpin name="almost_full" />
            <blockpin name="empty" />
            <blockpin name="almost_empty" />
            <blockpin signalname="DMA_fifo_dat_strobe_B2" name="next_valid" />
            <blockpin signalname="DMA_fifo_dat_B2(31:0)" name="dout(31:0)" />
            <blockpin signalname="DMA_fifo_cnt_B2(27:0)" name="rd_data_count(27:0)" />
            <blockpin signalname="DMA_merge_fifo_prog_full_B2" name="prog_full" />
            <blockpin signalname="rst_channel_3_in" name="rst" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B2" name="dout_valid" />
        </block>
        <block symbolname="fifo_interface" name="u_DMA_fifo_B1">
            <blockpin signalname="WB_CLK_2x" name="wr_clk" />
            <blockpin signalname="WB_CLK" name="rd_clk" />
            <blockpin signalname="DMA_merge_fifo_wr_en_B1" name="wr_en" />
            <blockpin signalname="DMA_fifo_rd_B1" name="rd_en" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_B1(31:0)" name="din(31:0)" />
            <blockpin name="full" />
            <blockpin name="almost_full" />
            <blockpin name="empty" />
            <blockpin name="almost_empty" />
            <blockpin signalname="DMA_fifo_dat_strobe_B1" name="next_valid" />
            <blockpin signalname="DMA_fifo_dat_B1(31:0)" name="dout(31:0)" />
            <blockpin signalname="DMA_fifo_cnt_B1(27:0)" name="rd_data_count(27:0)" />
            <blockpin signalname="DMA_merge_fifo_prog_full_B1" name="prog_full" />
            <blockpin signalname="rst_channel_2_in" name="rst" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_B1" name="dout_valid" />
        </block>
        <block symbolname="fifo_interface" name="u_DMA_fifo_A1">
            <blockpin signalname="WB_CLK_2x" name="wr_clk" />
            <blockpin signalname="WB_CLK" name="rd_clk" />
            <blockpin signalname="DMA_merge_fifo_wr_en_A1" name="wr_en" />
            <blockpin signalname="DMA_fifo_rd_A1" name="rd_en" />
            <blockpin signalname="DMA_merge_fifo_wr_dat_A1(31:0)" name="din(31:0)" />
            <blockpin name="full" />
            <blockpin name="almost_full" />
            <blockpin name="empty" />
            <blockpin name="almost_empty" />
            <blockpin signalname="DMA_fifo_dat_strobe_A1" name="next_valid" />
            <blockpin signalname="DMA_fifo_dat_A1(31:0)" name="dout(31:0)" />
            <blockpin signalname="DMA_fifo_cnt_A1(27:0)" name="rd_data_count(27:0)" />
            <blockpin signalname="DMA_merge_fifo_prog_full_A1" name="prog_full" />
            <blockpin signalname="rst_channel_0_in" name="rst" />
            <blockpin signalname="DMA_fifo_dat_strobe_current_A1" name="dout_valid" />
        </block>
        <block symbolname="or2" name="XLXI_6">
            <blockpin signalname="WB_RST" name="I0" />
            <blockpin signalname="rst_channel_1" name="I1" />
            <blockpin signalname="rst_channel_1_in" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_7">
            <blockpin signalname="WB_RST" name="I0" />
            <blockpin signalname="rst_channel_2" name="I1" />
            <blockpin signalname="rst_channel_2_in" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_8">
            <blockpin signalname="WB_RST" name="I0" />
            <blockpin signalname="rst_channel_3" name="I1" />
            <blockpin signalname="rst_channel_3_in" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="WB_RST" name="I0" />
            <blockpin signalname="rst_channel_0" name="I1" />
            <blockpin signalname="rst_channel_0_in" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2320" y="2384" name="u_fifo_A1" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2272" y="2112" type="branch" />
            <wire x2="2320" y1="2112" y2="2112" x1="2272" />
        </branch>
        <branch name="fifo_data_valid_A1">
            <wire x2="2320" y1="2224" y2="2224" x1="2272" />
        </branch>
        <branch name="fifo_data_A1(31:0)">
            <wire x2="2320" y1="2336" y2="2336" x1="2288" />
        </branch>
        <branch name="fifo_prog_full_A1">
            <wire x2="2912" y1="1968" y2="1968" x1="2864" />
        </branch>
        <branch name="fifo_length_A1(27:0)">
            <wire x2="2896" y1="2288" y2="2288" x1="2864" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2272" y="1888" type="branch" />
            <wire x2="2320" y1="1888" y2="1888" x1="2272" />
        </branch>
        <branch name="down_fifo_rd_A1">
            <wire x2="2320" y1="2000" y2="2000" x1="2288" />
        </branch>
        <branch name="down_fifo_empty_A1">
            <wire x2="2896" y1="2032" y2="2032" x1="2864" />
        </branch>
        <branch name="down_fifo_rdat_A1(31:0)">
            <wire x2="2880" y1="2224" y2="2224" x1="2864" />
        </branch>
        <instance x="2304" y="3264" name="u_fifo_B1" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="2992" type="branch" />
            <wire x2="2304" y1="2992" y2="2992" x1="2240" />
        </branch>
        <branch name="fifo_data_valid_B1">
            <wire x2="2304" y1="3104" y2="3104" x1="2256" />
        </branch>
        <branch name="fifo_data_B1(31:0)">
            <wire x2="2288" y1="3216" y2="3216" x1="2256" />
            <wire x2="2304" y1="3216" y2="3216" x1="2288" />
        </branch>
        <branch name="fifo_prog_full_B1">
            <wire x2="2880" y1="2848" y2="2848" x1="2848" />
        </branch>
        <branch name="fifo_length_B1(27:0)">
            <wire x2="2896" y1="3168" y2="3168" x1="2848" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2256" y="2768" type="branch" />
            <wire x2="2304" y1="2768" y2="2768" x1="2256" />
        </branch>
        <branch name="down_fifo_rd_B1">
            <wire x2="2304" y1="2880" y2="2880" x1="2272" />
        </branch>
        <branch name="down_fifo_empty_B1">
            <wire x2="2880" y1="2912" y2="2912" x1="2848" />
        </branch>
        <branch name="down_fifo_rdat_B1(31:0)">
            <wire x2="2864" y1="3104" y2="3104" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2272" y="2224" name="fifo_data_valid_A1" orien="R180" />
        <iomarker fontsize="28" x="2288" y="2336" name="fifo_data_A1(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2912" y="1968" name="fifo_prog_full_A1" orien="R0" />
        <iomarker fontsize="28" x="2896" y="2288" name="fifo_length_A1(27:0)" orien="R0" />
        <iomarker fontsize="28" x="2256" y="3104" name="fifo_data_valid_B1" orien="R180" />
        <iomarker fontsize="28" x="2256" y="3216" name="fifo_data_B1(31:0)" orien="R180" />
        <iomarker fontsize="28" x="2880" y="2848" name="fifo_prog_full_B1" orien="R0" />
        <iomarker fontsize="28" x="2896" y="3168" name="fifo_length_B1(27:0)" orien="R0" />
        <iomarker fontsize="28" x="2896" y="2032" name="down_fifo_empty_A1" orien="R0" />
        <branch name="down_fifo_almost_empty_A1">
            <wire x2="2880" y1="2096" y2="2096" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="2880" y="2096" name="down_fifo_almost_empty_A1" orien="R0" />
        <branch name="down_fifo_prog_empty_A1">
            <wire x2="2880" y1="2160" y2="2160" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="2880" y="2160" name="down_fifo_prog_empty_A1" orien="R0" />
        <instance x="3888" y="2384" name="u_fifo_A2" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3824" y="2112" type="branch" />
            <wire x2="3888" y1="2112" y2="2112" x1="3824" />
        </branch>
        <branch name="fifo_data_valid_A2">
            <wire x2="3888" y1="2224" y2="2224" x1="3840" />
        </branch>
        <branch name="fifo_data_A2(31:0)">
            <wire x2="3888" y1="2336" y2="2336" x1="3856" />
        </branch>
        <branch name="fifo_prog_full_A2">
            <wire x2="4480" y1="1968" y2="1968" x1="4432" />
        </branch>
        <branch name="fifo_length_A2(27:0)">
            <wire x2="4480" y1="2288" y2="2288" x1="4432" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3840" y="1888" type="branch" />
            <wire x2="3888" y1="1888" y2="1888" x1="3840" />
        </branch>
        <branch name="down_fifo_rd_A2">
            <wire x2="3888" y1="2000" y2="2000" x1="3840" />
        </branch>
        <branch name="down_fifo_empty_A2">
            <wire x2="4448" y1="2032" y2="2032" x1="4432" />
        </branch>
        <branch name="down_fifo_rdat_A2(31:0)">
            <wire x2="4448" y1="2224" y2="2224" x1="4432" />
        </branch>
        <iomarker fontsize="28" x="3840" y="2224" name="fifo_data_valid_A2" orien="R180" />
        <iomarker fontsize="28" x="3856" y="2336" name="fifo_data_A2(31:0)" orien="R180" />
        <iomarker fontsize="28" x="4480" y="1968" name="fifo_prog_full_A2" orien="R0" />
        <iomarker fontsize="28" x="4480" y="2288" name="fifo_length_A2(27:0)" orien="R0" />
        <iomarker fontsize="28" x="4448" y="2032" name="down_fifo_empty_A2" orien="R0" />
        <instance x="3888" y="3264" name="u_fifo_B2" orien="R0">
        </instance>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3840" y="2992" type="branch" />
            <wire x2="3888" y1="2992" y2="2992" x1="3840" />
        </branch>
        <branch name="fifo_data_valid_B2">
            <wire x2="3888" y1="3104" y2="3104" x1="3856" />
        </branch>
        <branch name="fifo_data_B2(31:0)">
            <wire x2="3888" y1="3216" y2="3216" x1="3856" />
        </branch>
        <branch name="fifo_prog_full_B2">
            <wire x2="4496" y1="2848" y2="2848" x1="4432" />
        </branch>
        <branch name="fifo_length_B2(27:0)">
            <wire x2="4480" y1="3168" y2="3168" x1="4432" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="2768" type="branch" />
            <wire x2="3888" y1="2768" y2="2768" x1="3856" />
        </branch>
        <branch name="down_fifo_rd_B2">
            <wire x2="3888" y1="2880" y2="2880" x1="3856" />
        </branch>
        <branch name="down_fifo_empty_B2">
            <wire x2="4480" y1="2912" y2="2912" x1="4432" />
        </branch>
        <branch name="down_fifo_rdat_B2(31:0)">
            <wire x2="4448" y1="3104" y2="3104" x1="4432" />
        </branch>
        <iomarker fontsize="28" x="3856" y="3104" name="fifo_data_valid_B2" orien="R180" />
        <iomarker fontsize="28" x="3856" y="3216" name="fifo_data_B2(31:0)" orien="R180" />
        <iomarker fontsize="28" x="4496" y="2848" name="fifo_prog_full_B2" orien="R0" />
        <iomarker fontsize="28" x="4480" y="3168" name="fifo_length_B2(27:0)" orien="R0" />
        <branch name="down_fifo_almost_empty_A2">
            <wire x2="4464" y1="2096" y2="2096" x1="4432" />
        </branch>
        <iomarker fontsize="28" x="4464" y="2096" name="down_fifo_almost_empty_A2" orien="R0" />
        <branch name="down_fifo_prog_empty_A2">
            <wire x2="4448" y1="2160" y2="2160" x1="4432" />
            <wire x2="4480" y1="2160" y2="2160" x1="4448" />
        </branch>
        <iomarker fontsize="28" x="4480" y="2160" name="down_fifo_prog_empty_A2" orien="R0" />
        <iomarker fontsize="28" x="4480" y="2912" name="down_fifo_empty_B2" orien="R0" />
        <branch name="down_fifo_almost_empty_B2">
            <wire x2="4464" y1="2976" y2="2976" x1="4432" />
        </branch>
        <iomarker fontsize="28" x="4464" y="2976" name="down_fifo_almost_empty_B2" orien="R0" />
        <branch name="down_fifo_prog_empty_B2">
            <wire x2="4464" y1="3040" y2="3040" x1="4432" />
        </branch>
        <iomarker fontsize="28" x="4464" y="3040" name="down_fifo_prog_empty_B2" orien="R0" />
        <iomarker fontsize="28" x="2880" y="2912" name="down_fifo_empty_B1" orien="R0" />
        <branch name="down_fifo_almost_empty_B1">
            <wire x2="2864" y1="2976" y2="2976" x1="2848" />
            <wire x2="2880" y1="2976" y2="2976" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="2880" y="2976" name="down_fifo_almost_empty_B1" orien="R0" />
        <branch name="down_fifo_prog_empty_B1">
            <wire x2="2864" y1="3040" y2="3040" x1="2848" />
            <wire x2="2880" y1="3040" y2="3040" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="2880" y="3040" name="down_fifo_prog_empty_B1" orien="R0" />
        <iomarker fontsize="28" x="2880" y="2224" name="down_fifo_rdat_A1(31:0)" orien="R0" />
        <iomarker fontsize="28" x="4448" y="2224" name="down_fifo_rdat_A2(31:0)" orien="R0" />
        <iomarker fontsize="28" x="4448" y="3104" name="down_fifo_rdat_B2(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2864" y="3104" name="down_fifo_rdat_B1(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2288" y="2000" name="down_fifo_rd_A1" orien="R180" />
        <iomarker fontsize="28" x="3840" y="2000" name="down_fifo_rd_A2" orien="R180" />
        <iomarker fontsize="28" x="2272" y="2880" name="down_fifo_rd_B1" orien="R180" />
        <iomarker fontsize="28" x="3856" y="2880" name="down_fifo_rd_B2" orien="R180" />
        <instance x="2784" y="1296" name="u_DMA_fifo_B2" orien="R0">
        </instance>
        <instance x="2768" y="544" name="u_DMA_fifo_A2" orien="R0">
        </instance>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2736" y="256" type="branch" />
            <wire x2="2768" y1="256" y2="256" x1="2736" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2752" y="320" type="branch" />
            <wire x2="2768" y1="320" y2="320" x1="2752" />
        </branch>
        <branch name="DMA_fifo_rd_A2">
            <wire x2="2768" y1="448" y2="448" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2736" y="448" name="DMA_fifo_rd_A2" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_A2">
            <wire x2="3168" y1="448" y2="448" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3168" y="448" name="DMA_fifo_dat_strobe_A2" orien="R0" />
        <branch name="DMA_fifo_dat_A2(31:0)">
            <wire x2="3168" y1="512" y2="512" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3168" y="512" name="DMA_fifo_dat_A2(31:0)" orien="R0" />
        <branch name="DMA_fifo_cnt_A2(27:0)">
            <wire x2="3184" y1="576" y2="576" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3184" y="576" name="DMA_fifo_cnt_A2(27:0)" orien="R0" />
        <branch name="DMA_fifo_dat_strobe_current_A2">
            <wire x2="3168" y1="704" y2="704" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3168" y="704" name="DMA_fifo_dat_strobe_current_A2" orien="R0" />
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2768" y="1008" type="branch" />
            <wire x2="2784" y1="1008" y2="1008" x1="2768" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2752" y="1072" type="branch" />
            <wire x2="2784" y1="1072" y2="1072" x1="2752" />
        </branch>
        <branch name="DMA_fifo_rd_B2">
            <wire x2="2784" y1="1200" y2="1200" x1="2752" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1200" name="DMA_fifo_rd_B2" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_B2">
            <wire x2="3200" y1="1200" y2="1200" x1="3168" />
        </branch>
        <iomarker fontsize="28" x="3200" y="1200" name="DMA_fifo_dat_strobe_B2" orien="R0" />
        <branch name="DMA_fifo_dat_B2(31:0)">
            <wire x2="3184" y1="1264" y2="1264" x1="3168" />
            <wire x2="3200" y1="1264" y2="1264" x1="3184" />
        </branch>
        <iomarker fontsize="28" x="3200" y="1264" name="DMA_fifo_dat_B2(31:0)" orien="R0" />
        <branch name="DMA_fifo_cnt_B2(27:0)">
            <wire x2="3200" y1="1328" y2="1328" x1="3168" />
        </branch>
        <iomarker fontsize="28" x="3200" y="1328" name="DMA_fifo_cnt_B2(27:0)" orien="R0" />
        <branch name="DMA_fifo_dat_strobe_current_B2">
            <wire x2="3184" y1="1456" y2="1456" x1="3168" />
        </branch>
        <iomarker fontsize="28" x="3184" y="1456" name="DMA_fifo_dat_strobe_current_B2" orien="R0" />
        <branch name="DMA_merge_fifo_prog_full_A2">
            <wire x2="3200" y1="640" y2="640" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3200" y="640" name="DMA_merge_fifo_prog_full_A2" orien="R0" />
        <branch name="DMA_merge_fifo_prog_full_B2">
            <wire x2="3184" y1="1392" y2="1392" x1="3168" />
        </branch>
        <iomarker fontsize="28" x="3184" y="1392" name="DMA_merge_fifo_prog_full_B2" orien="R0" />
        <branch name="DMA_merge_fifo_wr_en_A2">
            <wire x2="2768" y1="384" y2="384" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2736" y="384" name="DMA_merge_fifo_wr_en_A2" orien="R180" />
        <branch name="DMA_merge_fifo_wr_en_B2">
            <wire x2="2784" y1="1136" y2="1136" x1="2752" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1136" name="DMA_merge_fifo_wr_en_B2" orien="R180" />
        <branch name="DMA_merge_fifo_wr_dat_A2(31:0)">
            <wire x2="2768" y1="512" y2="512" x1="2752" />
        </branch>
        <iomarker fontsize="28" x="2752" y="512" name="DMA_merge_fifo_wr_dat_A2(31:0)" orien="R180" />
        <instance x="4304" y="1312" name="u_DMA_fifo_B1" orien="R0">
        </instance>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4256" y="1024" type="branch" />
            <wire x2="4304" y1="1024" y2="1024" x1="4256" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4256" y="1088" type="branch" />
            <wire x2="4304" y1="1088" y2="1088" x1="4256" />
        </branch>
        <branch name="DMA_fifo_rd_B1">
            <wire x2="4304" y1="1216" y2="1216" x1="4272" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_B1">
            <wire x2="4720" y1="1216" y2="1216" x1="4688" />
        </branch>
        <branch name="DMA_fifo_dat_B1(31:0)">
            <wire x2="4720" y1="1280" y2="1280" x1="4688" />
        </branch>
        <branch name="DMA_fifo_cnt_B1(27:0)">
            <wire x2="4720" y1="1344" y2="1344" x1="4688" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_current_B1">
            <wire x2="4720" y1="1472" y2="1472" x1="4688" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_B1">
            <wire x2="4704" y1="1408" y2="1408" x1="4688" />
            <wire x2="4736" y1="1408" y2="1408" x1="4704" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_B1">
            <wire x2="4288" y1="1152" y2="1152" x1="4272" />
            <wire x2="4304" y1="1152" y2="1152" x1="4288" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_B1(31:0)">
            <wire x2="4304" y1="1280" y2="1280" x1="4288" />
        </branch>
        <iomarker fontsize="28" x="4272" y="1216" name="DMA_fifo_rd_B1" orien="R180" />
        <iomarker fontsize="28" x="4720" y="1216" name="DMA_fifo_dat_strobe_B1" orien="R0" />
        <iomarker fontsize="28" x="4720" y="1280" name="DMA_fifo_dat_B1(31:0)" orien="R0" />
        <iomarker fontsize="28" x="4720" y="1344" name="DMA_fifo_cnt_B1(27:0)" orien="R0" />
        <iomarker fontsize="28" x="4720" y="1472" name="DMA_fifo_dat_strobe_current_B1" orien="R0" />
        <iomarker fontsize="28" x="4736" y="1408" name="DMA_merge_fifo_prog_full_B1" orien="R0" />
        <iomarker fontsize="28" x="4272" y="1152" name="DMA_merge_fifo_wr_en_B1" orien="R180" />
        <iomarker fontsize="28" x="4288" y="1280" name="DMA_merge_fifo_wr_dat_B1(31:0)" orien="R180" />
        <branch name="DMA_fifo_dat_strobe_current_A1">
            <wire x2="4704" y1="736" y2="736" x1="4656" />
        </branch>
        <branch name="DMA_fifo_dat_A1(31:0)">
            <wire x2="4720" y1="544" y2="544" x1="4656" />
        </branch>
        <branch name="DMA_fifo_dat_strobe_A1">
            <wire x2="4720" y1="480" y2="480" x1="4656" />
        </branch>
        <branch name="DMA_fifo_rd_A1">
            <wire x2="4272" y1="480" y2="480" x1="4224" />
        </branch>
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4224" y="352" type="branch" />
            <wire x2="4272" y1="352" y2="352" x1="4224" />
        </branch>
        <branch name="DMA_fifo_cnt_A1(27:0)">
            <wire x2="4672" y1="608" y2="608" x1="4656" />
            <wire x2="4720" y1="608" y2="608" x1="4672" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4224" y="288" type="branch" />
            <wire x2="4272" y1="288" y2="288" x1="4224" />
        </branch>
        <branch name="DMA_merge_fifo_prog_full_A1">
            <wire x2="4688" y1="672" y2="672" x1="4656" />
        </branch>
        <branch name="DMA_merge_fifo_wr_en_A1">
            <wire x2="4272" y1="416" y2="416" x1="4240" />
        </branch>
        <branch name="DMA_merge_fifo_wr_dat_A1(31:0)">
            <wire x2="4272" y1="544" y2="544" x1="4256" />
        </branch>
        <instance x="4272" y="576" name="u_DMA_fifo_A1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="4704" y="736" name="DMA_fifo_dat_strobe_current_A1" orien="R0" />
        <iomarker fontsize="28" x="4720" y="544" name="DMA_fifo_dat_A1(31:0)" orien="R0" />
        <iomarker fontsize="28" x="4720" y="480" name="DMA_fifo_dat_strobe_A1" orien="R0" />
        <iomarker fontsize="28" x="4224" y="480" name="DMA_fifo_rd_A1" orien="R180" />
        <iomarker fontsize="28" x="4720" y="608" name="DMA_fifo_cnt_A1(27:0)" orien="R0" />
        <iomarker fontsize="28" x="4688" y="672" name="DMA_merge_fifo_prog_full_A1" orien="R0" />
        <iomarker fontsize="28" x="4240" y="416" name="DMA_merge_fifo_wr_en_A1" orien="R180" />
        <iomarker fontsize="28" x="4256" y="544" name="DMA_merge_fifo_wr_dat_A1(31:0)" orien="R180" />
        <branch name="DMA_merge_fifo_wr_dat_B2(31:0)">
            <wire x2="2784" y1="1264" y2="1264" x1="2768" />
        </branch>
        <iomarker fontsize="28" x="2768" y="1264" name="DMA_merge_fifo_wr_dat_B2(31:0)" orien="R180" />
        <branch name="WB_CLK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="720" y="2240" type="branch" />
            <wire x2="816" y1="2240" y2="2240" x1="720" />
        </branch>
        <branch name="WB_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="720" y="2304" type="branch" />
            <wire x2="832" y1="2304" y2="2304" x1="720" />
        </branch>
        <branch name="WB_CLK_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="720" y="2384" type="branch" />
            <wire x2="816" y1="2384" y2="2384" x1="720" />
        </branch>
        <iomarker fontsize="28" x="816" y="2240" name="WB_CLK" orien="R0" />
        <iomarker fontsize="28" x="832" y="2304" name="WB_RST" orien="R0" />
        <iomarker fontsize="28" x="816" y="2384" name="WB_CLK_2x" orien="R0" />
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1168" y="400" type="branch" />
            <wire x2="1168" y1="400" y2="400" x1="1056" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1184" y="496" type="branch" />
            <wire x2="1184" y1="496" y2="496" x1="1056" />
        </branch>
        <branch name="rst_channel_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1200" y="576" type="branch" />
            <wire x2="1200" y1="576" y2="576" x1="1056" />
        </branch>
        <branch name="rst_channel_3">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1200" y="672" type="branch" />
            <wire x2="1200" y1="672" y2="672" x1="1056" />
        </branch>
        <iomarker fontsize="28" x="1056" y="400" name="rst_channel_0" orien="R180" />
        <iomarker fontsize="28" x="1056" y="496" name="rst_channel_1" orien="R180" />
        <iomarker fontsize="28" x="1056" y="576" name="rst_channel_2" orien="R180" />
        <iomarker fontsize="28" x="1056" y="672" name="rst_channel_3" orien="R180" />
        <instance x="3408" y="1760" name="XLXI_6" orien="R0" />
        <instance x="1696" y="2656" name="XLXI_7" orien="R0" />
        <branch name="rst_channel_0">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1792" y="1584" type="branch" />
            <wire x2="1872" y1="1584" y2="1584" x1="1792" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2176" y="1616" type="branch" />
            <wire x2="2176" y1="1616" y2="1616" x1="2128" />
        </branch>
        <instance x="1872" y="1712" name="XLXI_5" orien="R0" />
        <branch name="WB_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1824" y="1648" type="branch" />
            <wire x2="1872" y1="1648" y2="1648" x1="1824" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2272" y="1776" type="branch" />
            <wire x2="2320" y1="1776" y2="1776" x1="2272" />
        </branch>
        <branch name="rst_channel_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3360" y="1632" type="branch" />
            <wire x2="3408" y1="1632" y2="1632" x1="3360" />
        </branch>
        <branch name="WB_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="1696" type="branch" />
            <wire x2="3408" y1="1696" y2="1696" x1="3376" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3712" y="1664" type="branch" />
            <wire x2="3712" y1="1664" y2="1664" x1="3664" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3840" y="1776" type="branch" />
            <wire x2="3888" y1="1776" y2="1776" x1="3840" />
        </branch>
        <branch name="WB_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1648" y="2592" type="branch" />
            <wire x2="1696" y1="2592" y2="2592" x1="1648" />
        </branch>
        <branch name="rst_channel_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="2528" type="branch" />
            <wire x2="1696" y1="2528" y2="2528" x1="1664" />
        </branch>
        <branch name="rst_channel_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1984" y="2560" type="branch" />
            <wire x2="1984" y1="2560" y2="2560" x1="1952" />
        </branch>
        <branch name="rst_channel_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="2656" type="branch" />
            <wire x2="2304" y1="2656" y2="2656" x1="2240" />
        </branch>
        <instance x="3264" y="2640" name="XLXI_8" orien="R0" />
        <branch name="WB_RST">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3232" y="2576" type="branch" />
            <wire x2="3264" y1="2576" y2="2576" x1="3232" />
        </branch>
        <branch name="rst_channel_3">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3216" y="2512" type="branch" />
            <wire x2="3264" y1="2512" y2="2512" x1="3216" />
        </branch>
        <branch name="rst_channel_3_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3552" y="2544" type="branch" />
            <wire x2="3552" y1="2544" y2="2544" x1="3520" />
        </branch>
        <branch name="rst_channel_3_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3856" y="2656" type="branch" />
            <wire x2="3888" y1="2656" y2="2656" x1="3856" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2736" y="192" type="branch" />
            <wire x2="2768" y1="192" y2="192" x1="2736" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4240" y="224" type="branch" />
            <wire x2="4272" y1="224" y2="224" x1="4240" />
        </branch>
        <branch name="rst_channel_3_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2752" y="944" type="branch" />
            <wire x2="2784" y1="944" y2="944" x1="2752" />
        </branch>
        <branch name="rst_channel_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4272" y="960" type="branch" />
            <wire x2="4304" y1="960" y2="960" x1="4272" />
        </branch>
    </sheet>
</drawing>