<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="wb_rst_delay" />
        <signal name="wb_rst" />
        <signal name="wb_clk_2x" />
        <signal name="wr_fifo_empty_1" />
        <signal name="wr_fifo_empty_2" />
        <signal name="wr_fifo_rdat_1(31:0)" />
        <signal name="wr_fifo_rdat_2(31:0)" />
        <signal name="wr_fifo_rd_1" />
        <signal name="wr_fifo_rd_2" />
        <signal name="Aurora_wr_fifo_clk_1" />
        <signal name="Aurora_wr_fifo_wr_en_1" />
        <signal name="Aurora_wr_fifo_full_1" />
        <signal name="Aurora_wr_fifo_almost_full_1" />
        <signal name="Aurora_wr_fifo_clk_2" />
        <signal name="Aurora_wr_fifo_almost_full_2" />
        <signal name="rd_fifo_prog_full_1" />
        <signal name="rd_fifo_prog_full_2" />
        <signal name="rd_fifo_wr_en_1" />
        <signal name="rd_fifo_wr_en_2" />
        <signal name="Aurora_rd_fifo_clk_1" />
        <signal name="Aurora_rd_fifo_rd_en_1" />
        <signal name="Aurora_rd_fifo_empty_1" />
        <signal name="Aurora_rd_fifo_almost_empty_1" />
        <signal name="Aurora_rd_fifo_prog_empty_1" />
        <signal name="Aurora_rd_fifo_clk_2" />
        <signal name="Aurora_rd_fifo_rd_en_2" />
        <signal name="Aurora_rd_fifo_empty_2" />
        <signal name="Aurora_rd_fifo_almost_empty_2" />
        <signal name="Aurora_rd_fifo_prog_empty_2" />
        <signal name="BUS_ACK" />
        <signal name="BUS_REQ_W_1" />
        <signal name="BUS_REQ_R_1" />
        <signal name="BUS_REQ_R_2" />
        <signal name="BUS_DAT_I(31:0)" />
        <signal name="BUS_WE" />
        <signal name="BUS_STB" />
        <signal name="BUS_DAT_O_EN" />
        <signal name="BUS_DAT_O(31:0)" />
        <signal name="BUS_ACK_PAD" />
        <signal name="BUS_REQ_W_1_PAD" />
        <signal name="BUS_REQ_R_1_PAD" />
        <signal name="BUS_REQ_R_2_PAD" />
        <signal name="BUS_WE_PAD" />
        <signal name="BUS_STB_PAD" />
        <signal name="BUS_AD_PAD(31:0)" />
        <signal name="m_rdy" />
        <signal name="BUS_S_RDY" />
        <signal name="BUS_ABORT" />
        <signal name="abort" />
        <signal name="s_rdy" />
        <signal name="BUS_M_RDY" />
        <signal name="XLXN_2" />
        <signal name="WB_CLK_2x_PAD" />
        <signal name="wr_fifo_almost_empty_1" />
        <signal name="wr_fifo_almost_empty_2" />
        <signal name="BUS_REQ_W_2" />
        <signal name="BUS_REQ_W_2_PAD" />
        <signal name="rd_fifo_wr_data_1(31:0)" />
        <signal name="rd_fifo_wr_data_2(31:0)" />
        <signal name="Aurora_wr_fifo_din_1(15:0)" />
        <signal name="Aurora_rd_fifo_dout_1(31:0)" />
        <signal name="BUS_ACK_PIPE" />
        <signal name="BUS_REQ_W_1_pipe" />
        <signal name="BUS_REQ_W_2_pipe" />
        <signal name="BUS_REQ_R_2_pipe" />
        <signal name="s_rdy_pipe" />
        <signal name="BUS_DAT_I_PIPE(31:0)" />
        <signal name="abort_pipe" />
        <signal name="BUS_DAT_O_EN_PIPE" />
        <signal name="BUS_STB_PIPE" />
        <signal name="BUS_WE_PIPE" />
        <signal name="m_rdy_pipe" />
        <signal name="BUS_DAT_O_PIPE(31:0)" />
        <signal name="BUS_REQ_R_1_pipe" />
        <signal name="control1(35:0)" />
        <signal name="control2(35:0)" />
        <signal name="wb_clk_divide" />
        <signal name="control3(35:0)" />
        <signal name="control4(35:0)" />
        <signal name="Aurora_rd_fifo_dout_2(31:0)" />
        <signal name="control5(35:0)" />
        <signal name="rst_channel_0" />
        <signal name="rst_channel_0_in" />
        <signal name="rst_channel_1" />
        <signal name="rst_channel_1_in" />
        <signal name="wr_fifo_empty_1_in" />
        <signal name="Aurora_wr_fifo_almost_full_1_in" />
        <signal name="wr_fifo_empty_2_in" />
        <signal name="Aurora_wr_fifo_almost_full_2_in" />
        <signal name="Aurora_rd_fifo_empty_1_in" />
        <signal name="rd_fifo_prog_full_1_in" />
        <signal name="Aurora_rd_fifo_empty_2_in" />
        <signal name="rd_fifo_prog_full_2_in" />
        <signal name="wb_clk_master" />
        <signal name="control6(35:0)" />
        <signal name="fifo_read_override" />
        <signal name="wr_fifo_rd_en_2" />
        <signal name="Aurora_wr_fifo_full_2" />
        <signal name="cPCI_rdy_override" />
        <signal name="Aurora_wr_fifo_din_2(15:0)" />
        <signal name="Aurora_wr_fifo_wr_en_2" />
        <signal name="cPCI_RDY_2" />
        <port polarity="Output" name="wb_rst_delay" />
        <port polarity="Output" name="wb_rst" />
        <port polarity="Output" name="wb_clk_2x" />
        <port polarity="Input" name="Aurora_wr_fifo_clk_1" />
        <port polarity="Input" name="Aurora_wr_fifo_wr_en_1" />
        <port polarity="Output" name="Aurora_wr_fifo_full_1" />
        <port polarity="Output" name="Aurora_wr_fifo_almost_full_1" />
        <port polarity="Input" name="Aurora_wr_fifo_clk_2" />
        <port polarity="Output" name="Aurora_wr_fifo_almost_full_2" />
        <port polarity="Input" name="Aurora_rd_fifo_clk_1" />
        <port polarity="Input" name="Aurora_rd_fifo_rd_en_1" />
        <port polarity="Output" name="Aurora_rd_fifo_empty_1" />
        <port polarity="Output" name="Aurora_rd_fifo_almost_empty_1" />
        <port polarity="Output" name="Aurora_rd_fifo_prog_empty_1" />
        <port polarity="Input" name="Aurora_rd_fifo_clk_2" />
        <port polarity="Input" name="Aurora_rd_fifo_rd_en_2" />
        <port polarity="Output" name="Aurora_rd_fifo_empty_2" />
        <port polarity="Output" name="Aurora_rd_fifo_almost_empty_2" />
        <port polarity="Output" name="Aurora_rd_fifo_prog_empty_2" />
        <port polarity="Input" name="BUS_ACK_PAD" />
        <port polarity="Input" name="BUS_REQ_W_1_PAD" />
        <port polarity="Input" name="BUS_REQ_R_1_PAD" />
        <port polarity="Input" name="BUS_REQ_R_2_PAD" />
        <port polarity="Output" name="BUS_WE_PAD" />
        <port polarity="Output" name="BUS_STB_PAD" />
        <port polarity="BiDirectional" name="BUS_AD_PAD(31:0)" />
        <port polarity="Input" name="BUS_S_RDY" />
        <port polarity="Input" name="BUS_ABORT" />
        <port polarity="Output" name="BUS_M_RDY" />
        <port polarity="Input" name="WB_CLK_2x_PAD" />
        <port polarity="Input" name="BUS_REQ_W_2_PAD" />
        <port polarity="Input" name="Aurora_wr_fifo_din_1(15:0)" />
        <port polarity="Output" name="Aurora_rd_fifo_dout_1(31:0)" />
        <port polarity="Output" name="wb_clk_divide" />
        <port polarity="BiDirectional" name="control3(35:0)" />
        <port polarity="BiDirectional" name="control4(35:0)" />
        <port polarity="Output" name="Aurora_rd_fifo_dout_2(31:0)" />
        <port polarity="BiDirectional" name="control5(35:0)" />
        <port polarity="Input" name="rst_channel_0" />
        <port polarity="Input" name="rst_channel_1" />
        <port polarity="BiDirectional" name="control6(35:0)" />
        <port polarity="Input" name="fifo_read_override" />
        <port polarity="Output" name="Aurora_wr_fifo_full_2" />
        <port polarity="Input" name="cPCI_rdy_override" />
        <port polarity="Input" name="Aurora_wr_fifo_din_2(15:0)" />
        <port polarity="Input" name="Aurora_wr_fifo_wr_en_2" />
        <port polarity="Output" name="cPCI_RDY_2" />
        <blockdef name="Aurora_clk_gen_top">
            <timestamp>2011-6-7T6:58:49</timestamp>
            <rect width="320" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
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
        <blockdef name="Aurora_fifo_rd">
            <timestamp>2012-2-23T22:48:3</timestamp>
            <rect width="320" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-496" y2="-496" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="448" y1="-608" y2="-608" x1="384" />
            <line x2="448" y1="-544" y2="-544" x1="384" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="384" y="-172" height="24" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="Aurora_fifo_wr">
            <timestamp>2012-2-23T21:50:1</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
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
        </blockdef>
        <blockdef name="bus_master">
            <timestamp>2011-6-14T6:43:21</timestamp>
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
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
            <line x2="576" y1="-1056" y2="-1056" x1="512" />
            <line x2="576" y1="-944" y2="-944" x1="512" />
            <line x2="576" y1="-832" y2="-832" x1="512" />
            <line x2="576" y1="-608" y2="-608" x1="512" />
            <line x2="576" y1="-496" y2="-496" x1="512" />
            <line x2="576" y1="-384" y2="-384" x1="512" />
            <rect width="64" x="512" y="-284" height="24" />
            <line x2="576" y1="-272" y2="-272" x1="512" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-60" height="24" />
            <line x2="576" y1="-48" y2="-48" x1="512" />
            <line x2="64" y1="32" y2="32" x1="0" />
            <line x2="64" y1="96" y2="96" x1="0" />
            <line x2="512" y1="48" y2="48" x1="576" />
            <rect width="448" x="64" y="-1088" height="1572" />
            <line x2="64" y1="192" y2="192" x1="0" />
            <line x2="64" y1="256" y2="256" x1="0" />
            <line x2="64" y1="320" y2="320" x1="0" />
            <rect width="64" x="0" y="244" height="24" />
            <line x2="0" y1="256" y2="256" x1="64" />
            <line x2="64" y1="384" y2="384" x1="0" />
            <line x2="64" y1="448" y2="448" x1="0" />
            <line x2="512" y1="256" y2="256" x1="576" />
        </blockdef>
        <blockdef name="Aurora_FPGA_iobuf">
            <timestamp>2011-6-14T6:9:20</timestamp>
            <rect width="336" x="64" y="-576" height="988" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <line x2="64" y1="32" y2="32" x1="0" />
            <line x2="64" y1="96" y2="96" x1="0" />
            <line x2="64" y1="160" y2="160" x1="0" />
            <line x2="400" y1="96" y2="96" x1="464" />
            <line x2="404" y1="160" y2="160" x1="464" />
            <line x2="400" y1="224" y2="224" x1="464" />
            <line x2="64" y1="288" y2="288" x1="0" />
            <line x2="64" y1="368" y2="368" x1="0" />
            <line x2="400" y1="288" y2="288" x1="464" />
        </blockdef>
        <blockdef name="Aurora_FPGA_debug">
            <timestamp>2012-2-21T22:14:48</timestamp>
            <rect width="64" x="320" y="84" height="24" />
            <line x2="384" y1="96" y2="96" x1="320" />
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
            <line x2="64" y1="32" y2="32" x1="0" />
            <rect width="64" x="320" y="-748" height="24" />
            <line x2="320" y1="-736" y2="-736" x1="384" />
            <rect width="64" x="320" y="-684" height="24" />
            <line x2="320" y1="-672" y2="-672" x1="384" />
            <line x2="320" y1="-608" y2="-608" x1="384" />
            <rect width="64" x="320" y="-620" height="24" />
            <line x2="320" y1="-544" y2="-544" x1="384" />
            <rect width="64" x="320" y="-556" height="24" />
            <rect width="64" x="320" y="-460" height="24" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <rect width="256" x="64" y="-768" height="892" />
        </blockdef>
        <blockdef name="bus_master_pipeline">
            <timestamp>2011-6-21T0:6:21</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="0" y="276" height="24" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="448" y1="96" y2="96" x1="384" />
            <line x2="448" y1="160" y2="160" x1="384" />
            <line x2="448" y1="224" y2="224" x1="384" />
            <line x2="448" y1="288" y2="288" x1="384" />
            <rect width="64" x="384" y="340" height="24" />
            <line x2="448" y1="352" y2="352" x1="384" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-608" y2="-608" x1="384" />
            <line x2="448" y1="-512" y2="-512" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="448" y1="-320" y2="-320" x1="384" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <line x2="448" y1="-128" y2="-128" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <rect width="320" x="64" y="-640" height="1024" />
        </blockdef>
        <blockdef name="down_fifo_interface_debug">
            <timestamp>2012-2-24T0:51:14</timestamp>
            <rect width="320" x="64" y="-512" height="512" />
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
            <rect width="64" x="384" y="-492" height="24" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
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
        <blockdef name="rst_flag_delay">
            <timestamp>2011-6-29T3:32:36</timestamp>
            <rect width="192" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="320" y1="-160" y2="-160" x1="256" />
        </blockdef>
        <blockdef name="down_fifo_interface_debug_small">
            <timestamp>2012-2-24T0:52:55</timestamp>
            <rect width="320" x="64" y="-512" height="512" />
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
            <rect width="64" x="384" y="-492" height="24" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
        </blockdef>
        <block symbolname="Aurora_fifo_rd" name="Aurora_rd_fifo_1">
            <blockpin signalname="rst_channel_0_in" name="rst" />
            <blockpin signalname="wb_clk_2x" name="wr_clk" />
            <blockpin signalname="Aurora_rd_fifo_clk_1" name="rd_clk" />
            <blockpin signalname="rd_fifo_wr_en_1" name="wr_en" />
            <blockpin signalname="Aurora_rd_fifo_rd_en_1" name="rd_en" />
            <blockpin signalname="rd_fifo_wr_data_1(31:0)" name="din(31:0)" />
            <blockpin name="full" />
            <blockpin name="almost_full" />
            <blockpin signalname="Aurora_rd_fifo_empty_1_in" name="empty" />
            <blockpin signalname="Aurora_rd_fifo_almost_empty_1" name="almost_empty" />
            <blockpin name="valid" />
            <blockpin signalname="rd_fifo_prog_full_1_in" name="prog_full" />
            <blockpin signalname="Aurora_rd_fifo_prog_empty_1" name="prog_empty" />
            <blockpin signalname="Aurora_rd_fifo_dout_1(31:0)" name="dout(31:0)" />
            <blockpin name="rd_data_count(7:0)" />
            <blockpin name="wr_data_count(7:0)" />
        </block>
        <block symbolname="Aurora_fifo_rd" name="Aurora_rd_fifo_2">
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="wb_clk_2x" name="wr_clk" />
            <blockpin signalname="Aurora_rd_fifo_clk_2" name="rd_clk" />
            <blockpin signalname="rd_fifo_wr_en_2" name="wr_en" />
            <blockpin signalname="Aurora_rd_fifo_rd_en_2" name="rd_en" />
            <blockpin signalname="rd_fifo_wr_data_2(31:0)" name="din(31:0)" />
            <blockpin name="full" />
            <blockpin name="almost_full" />
            <blockpin signalname="Aurora_rd_fifo_empty_2_in" name="empty" />
            <blockpin signalname="Aurora_rd_fifo_almost_empty_2" name="almost_empty" />
            <blockpin name="valid" />
            <blockpin signalname="rd_fifo_prog_full_2_in" name="prog_full" />
            <blockpin signalname="Aurora_rd_fifo_prog_empty_2" name="prog_empty" />
            <blockpin signalname="Aurora_rd_fifo_dout_2(31:0)" name="dout(31:0)" />
            <blockpin name="rd_data_count(7:0)" />
            <blockpin name="wr_data_count(7:0)" />
        </block>
        <block symbolname="bus_master" name="u_bus_master">
            <blockpin signalname="wb_clk_2x" name="clk_i" />
            <blockpin signalname="wb_rst_delay" name="reset_i" />
            <blockpin signalname="BUS_ACK_PIPE" name="ack_i" />
            <blockpin signalname="BUS_REQ_W_1_pipe" name="req_w_1" />
            <blockpin signalname="BUS_REQ_R_1_pipe" name="req_r_1" />
            <blockpin signalname="BUS_REQ_R_2_pipe" name="req_r_2" />
            <blockpin signalname="wr_fifo_empty_1" name="r_fifo_empty_i_1" />
            <blockpin signalname="wr_fifo_almost_empty_1" name="r_fifo_almost_empty_i_1" />
            <blockpin name="r_fifo_prog_empty_i_1" />
            <blockpin name="w_fifo_full_i_1" />
            <blockpin name="w_fifo_almost_full_i_1" />
            <blockpin signalname="rd_fifo_prog_full_1" name="w_fifo_prog_full_i_1" />
            <blockpin name="w_fifo_full_i_2" />
            <blockpin name="w_fifo_almost_full_i_2" />
            <blockpin signalname="rd_fifo_prog_full_2" name="w_fifo_prog_full_i_2" />
            <blockpin signalname="BUS_DAT_I_PIPE(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="wr_fifo_rdat_1(31:0)" name="r_fifo_dat_i_1(31:0)" />
            <blockpin signalname="BUS_WE" name="we_o" />
            <blockpin signalname="BUS_STB" name="stb_o" />
            <blockpin signalname="BUS_DAT_O_EN" name="dat_o_enable_o" />
            <blockpin signalname="wr_fifo_rd_1" name="r_fifo_rd_o_1" />
            <blockpin signalname="rd_fifo_wr_en_1" name="w_fifo_dat_valid_o_1" />
            <blockpin signalname="rd_fifo_wr_en_2" name="w_fifo_dat_valid_o_2" />
            <blockpin signalname="BUS_DAT_O(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="rd_fifo_wr_data_1(31:0)" name="w_fifo_dat_o_1(31:0)" />
            <blockpin signalname="rd_fifo_wr_data_2(31:0)" name="w_fifo_dat_o_2(31:0)" />
            <blockpin signalname="abort_pipe" name="abort_i" />
            <blockpin signalname="s_rdy_pipe" name="s_rdy_i" />
            <blockpin signalname="m_rdy" name="m_rdy_o" />
            <blockpin signalname="wr_fifo_rdat_2(31:0)" name="r_fifo_dat_i_2(31:0)" />
            <blockpin signalname="wr_fifo_empty_2" name="r_fifo_empty_i_2" />
            <blockpin signalname="wr_fifo_almost_empty_2" name="r_fifo_almost_empty_i_2" />
            <blockpin name="r_fifo_prog_empty_i_2" />
            <blockpin signalname="wr_fifo_rd_2" name="r_fifo_rd_o_2" />
            <blockpin signalname="BUS_REQ_W_2_pipe" name="req_w_2" />
        </block>
        <block symbolname="Aurora_FPGA_iobuf" name="u_Aurora_FPGA_iobuf">
            <blockpin signalname="BUS_ACK_PAD" name="BUS_ACK" />
            <blockpin signalname="BUS_REQ_W_1_PAD" name="BUS_REQ_W_1" />
            <blockpin signalname="BUS_REQ_R_1_PAD" name="BUS_REQ_R_1" />
            <blockpin signalname="BUS_REQ_R_2_PAD" name="BUS_REQ_R_2" />
            <blockpin signalname="BUS_DAT_O_EN_PIPE" name="ad_enable_in" />
            <blockpin signalname="BUS_WE_PIPE" name="we_in" />
            <blockpin signalname="BUS_STB_PIPE" name="stb_in" />
            <blockpin signalname="BUS_DAT_O_PIPE(31:0)" name="ado_in(31:0)" />
            <blockpin signalname="BUS_ACK" name="ack_in" />
            <blockpin signalname="BUS_REQ_W_1" name="req_w_in_1" />
            <blockpin signalname="BUS_REQ_R_1" name="req_r_in_1" />
            <blockpin signalname="BUS_REQ_R_2" name="req_r_in_2" />
            <blockpin signalname="BUS_WE_PAD" name="BUS_WE" />
            <blockpin signalname="BUS_STB_PAD" name="BUS_STB" />
            <blockpin signalname="BUS_DAT_I(31:0)" name="adi_in(31:0)" />
            <blockpin signalname="BUS_AD_PAD(31:0)" name="BUS_AD(31:0)" />
            <blockpin signalname="m_rdy_pipe" name="m_rdy_in" />
            <blockpin signalname="BUS_S_RDY" name="BUS_S_RDY" />
            <blockpin signalname="BUS_ABORT" name="BUS_ABORT" />
            <blockpin signalname="abort" name="abort_in" />
            <blockpin signalname="s_rdy" name="s_rdy_in" />
            <blockpin signalname="BUS_M_RDY" name="BUS_M_RDY" />
            <blockpin signalname="wb_clk_2x" name="clk_in" />
            <blockpin signalname="BUS_REQ_W_2_PAD" name="BUS_REQ_W_2" />
            <blockpin signalname="BUS_REQ_W_2" name="req_w_in_2" />
        </block>
        <block symbolname="Aurora_FPGA_debug" name="u_Aurora_FPGA_debug">
            <blockpin signalname="wb_clk_2x" name="clk" />
            <blockpin signalname="BUS_STB" name="stb" />
            <blockpin signalname="BUS_WE" name="we" />
            <blockpin signalname="BUS_ACK" name="ack" />
            <blockpin signalname="m_rdy" name="m_rdy" />
            <blockpin signalname="s_rdy" name="s_rdy" />
            <blockpin signalname="abort" name="abort" />
            <blockpin signalname="BUS_REQ_W_1" name="req_w_1" />
            <blockpin signalname="BUS_REQ_W_2" name="req_w_2" />
            <blockpin signalname="BUS_REQ_R_1" name="req_r_1" />
            <blockpin signalname="BUS_REQ_R_2" name="req_r_2" />
            <blockpin signalname="BUS_DAT_I(31:0)" name="dat_i(31:0)" />
            <blockpin signalname="BUS_DAT_O(31:0)" name="dat_o(31:0)" />
            <blockpin signalname="control1(35:0)" name="control1(35:0)" />
            <blockpin signalname="control2(35:0)" name="control2(35:0)" />
            <blockpin signalname="control3(35:0)" name="control3(35:0)" />
            <blockpin signalname="control4(35:0)" name="control4(35:0)" />
            <blockpin signalname="control5(35:0)" name="control5(35:0)" />
            <blockpin signalname="control6(35:0)" name="control6(35:0)" />
        </block>
        <block symbolname="gnd" name="u_gnd">
            <blockpin signalname="XLXN_2" name="G" />
        </block>
        <block symbolname="Aurora_clk_gen_top" name="u_Aurora_FPGA_clk_gen_top">
            <blockpin signalname="WB_CLK_2x_PAD" name="CLK_IN1" />
            <blockpin signalname="XLXN_2" name="RESET" />
            <blockpin name="CLK_OUT1" />
            <blockpin name="CLK_OUT2" />
            <blockpin name="LOCKED" />
            <blockpin signalname="wb_clk_2x" name="WB_CLK_SLAVE" />
            <blockpin signalname="wb_rst" name="WB_RST" />
            <blockpin signalname="wb_clk_master" name="WB_CLK_MASTER" />
            <blockpin signalname="wb_clk_divide" name="WB_CLK_DIVIDE" />
            <blockpin signalname="wb_rst_delay" name="WB_RST_DELAY" />
        </block>
        <block symbolname="bus_master_pipeline" name="u_bus_master_pipeline">
            <blockpin signalname="wb_rst_delay" name="reset" />
            <blockpin signalname="wb_clk_2x" name="clk" />
            <blockpin signalname="BUS_ACK" name="ack" />
            <blockpin signalname="BUS_REQ_W_1" name="req_w_1" />
            <blockpin signalname="BUS_REQ_W_2" name="req_w_2" />
            <blockpin signalname="BUS_REQ_R_1" name="req_r_1" />
            <blockpin signalname="BUS_REQ_R_2" name="req_r_2" />
            <blockpin signalname="s_rdy" name="s_rdy" />
            <blockpin signalname="abort" name="abort" />
            <blockpin signalname="BUS_DAT_I(31:0)" name="ad_in(31:0)" />
            <blockpin signalname="BUS_ACK_PIPE" name="ack_pipe" />
            <blockpin signalname="BUS_REQ_W_1_pipe" name="req_w_1_pipe" />
            <blockpin signalname="BUS_REQ_W_2_pipe" name="req_w_2_pipe" />
            <blockpin signalname="BUS_REQ_R_1_pipe" name="req_r_1_pipe" />
            <blockpin signalname="BUS_REQ_R_2_pipe" name="req_r_2_pipe" />
            <blockpin signalname="s_rdy_pipe" name="s_rdy_pipe" />
            <blockpin signalname="BUS_DAT_I_PIPE(31:0)" name="ad_in_pipe(31:0)" />
            <blockpin signalname="BUS_DAT_O_EN" name="ad_o_enable" />
            <blockpin signalname="BUS_STB" name="stb" />
            <blockpin signalname="BUS_WE" name="we" />
            <blockpin signalname="m_rdy" name="m_rdy" />
            <blockpin signalname="BUS_DAT_O(31:0)" name="ad_o(31:0)" />
            <blockpin signalname="abort_pipe" name="abort_pipe" />
            <blockpin signalname="BUS_DAT_O_EN_PIPE" name="ad_o_enable_pipe" />
            <blockpin signalname="BUS_STB_PIPE" name="stb_pipe" />
            <blockpin signalname="BUS_WE_PIPE" name="we_pipe" />
            <blockpin signalname="m_rdy_pipe" name="m_rdy_pipe" />
            <blockpin signalname="BUS_DAT_O_PIPE(31:0)" name="ad_o_pipe(31:0)" />
        </block>
        <block symbolname="down_fifo_interface_debug" name="XLXI_16">
            <blockpin signalname="wb_clk_2x" name="clk_i" />
            <blockpin signalname="wb_rst_delay" name="reset_i" />
            <blockpin signalname="rd_fifo_prog_full_2" name="fifo_empty_1" />
            <blockpin signalname="wr_fifo_empty_2" name="fifo_empty_2" />
            <blockpin signalname="rd_fifo_wr_en_2" name="fifo_rd_1" />
            <blockpin signalname="wr_fifo_rd_2" name="fifo_rd_2" />
            <blockpin signalname="rd_fifo_wr_data_2(31:0)" name="fifo_dat_1(31:0)" />
            <blockpin signalname="wr_fifo_rdat_2(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin signalname="control1(35:0)" name="control(35:0)" />
        </block>
        <block symbolname="or2" name="XLXI_18">
            <blockpin signalname="wb_rst" name="I0" />
            <blockpin signalname="rst_channel_0" name="I1" />
            <blockpin signalname="rst_channel_0_in" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_19">
            <blockpin signalname="wb_rst" name="I0" />
            <blockpin signalname="rst_channel_1" name="I1" />
            <blockpin signalname="rst_channel_1_in" name="O" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_24">
            <blockpin signalname="Aurora_wr_fifo_clk_1" name="clk" />
            <blockpin signalname="rst_channel_0_in" name="rst" />
            <blockpin signalname="Aurora_wr_fifo_almost_full_1_in" name="flag" />
            <blockpin signalname="Aurora_wr_fifo_almost_full_1" name="flag_delay" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_20">
            <blockpin signalname="wb_clk_2x" name="clk" />
            <blockpin signalname="rst_channel_0_in" name="rst" />
            <blockpin signalname="wr_fifo_empty_1_in" name="flag" />
            <blockpin signalname="wr_fifo_empty_1" name="flag_delay" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_27">
            <blockpin signalname="Aurora_wr_fifo_clk_2" name="clk" />
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="Aurora_wr_fifo_almost_full_2_in" name="flag" />
            <blockpin signalname="Aurora_wr_fifo_almost_full_2" name="flag_delay" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_28">
            <blockpin signalname="wb_clk_2x" name="clk" />
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="wr_fifo_empty_2_in" name="flag" />
            <blockpin signalname="wr_fifo_empty_2" name="flag_delay" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_31">
            <blockpin signalname="Aurora_rd_fifo_clk_1" name="clk" />
            <blockpin signalname="rst_channel_0_in" name="rst" />
            <blockpin signalname="Aurora_rd_fifo_empty_1_in" name="flag" />
            <blockpin signalname="Aurora_rd_fifo_empty_1" name="flag_delay" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_32">
            <blockpin signalname="wb_clk_2x" name="clk" />
            <blockpin signalname="rst_channel_0_in" name="rst" />
            <blockpin signalname="rd_fifo_prog_full_1_in" name="flag" />
            <blockpin signalname="rd_fifo_prog_full_1" name="flag_delay" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_33">
            <blockpin signalname="Aurora_rd_fifo_clk_2" name="clk" />
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="Aurora_rd_fifo_empty_2_in" name="flag" />
            <blockpin signalname="Aurora_rd_fifo_empty_2" name="flag_delay" />
        </block>
        <block symbolname="rst_flag_delay" name="XLXI_34">
            <blockpin signalname="wb_clk_2x" name="clk" />
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="rd_fifo_prog_full_2_in" name="flag" />
            <blockpin signalname="rd_fifo_prog_full_2" name="flag_delay" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="fifo_read_override" name="I0" />
            <blockpin signalname="wr_fifo_rd_2" name="I1" />
            <blockpin signalname="wr_fifo_rd_en_2" name="O" />
        </block>
        <block symbolname="Aurora_fifo_wr" name="Aurora_wr_fifo_1">
            <blockpin signalname="rst_channel_0_in" name="rst" />
            <blockpin signalname="Aurora_wr_fifo_clk_1" name="wr_clk" />
            <blockpin signalname="wb_clk_2x" name="rd_clk" />
            <blockpin signalname="Aurora_wr_fifo_wr_en_1" name="wr_en" />
            <blockpin signalname="wr_fifo_rd_1" name="rd_en" />
            <blockpin signalname="Aurora_wr_fifo_din_1(15:0)" name="din(15:0)" />
            <blockpin signalname="Aurora_wr_fifo_full_1" name="full" />
            <blockpin signalname="Aurora_wr_fifo_almost_full_1_in" name="almost_full" />
            <blockpin signalname="wr_fifo_empty_1_in" name="empty" />
            <blockpin signalname="wr_fifo_almost_empty_1" name="almost_empty" />
            <blockpin name="valid" />
            <blockpin signalname="wr_fifo_rdat_1(31:0)" name="dout(31:0)" />
        </block>
        <block symbolname="Aurora_fifo_wr" name="Aurora_wr_fifo_2">
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="Aurora_wr_fifo_clk_2" name="wr_clk" />
            <blockpin signalname="wb_clk_2x" name="rd_clk" />
            <blockpin signalname="Aurora_wr_fifo_wr_en_2" name="wr_en" />
            <blockpin signalname="wr_fifo_rd_en_2" name="rd_en" />
            <blockpin signalname="Aurora_wr_fifo_din_2(15:0)" name="din(15:0)" />
            <blockpin signalname="Aurora_wr_fifo_full_2" name="full" />
            <blockpin signalname="Aurora_wr_fifo_almost_full_2_in" name="almost_full" />
            <blockpin signalname="wr_fifo_empty_2_in" name="empty" />
            <blockpin signalname="wr_fifo_almost_empty_2" name="almost_empty" />
            <blockpin name="valid" />
            <blockpin signalname="wr_fifo_rdat_2(31:0)" name="dout(31:0)" />
        </block>
        <block symbolname="or2" name="XLXI_66">
            <blockpin signalname="cPCI_rdy_override" name="I0" />
            <blockpin signalname="BUS_ACK_PIPE" name="I1" />
            <blockpin signalname="cPCI_RDY_2" name="O" />
        </block>
        <block symbolname="down_fifo_interface_debug_small" name="XLXI_70">
            <blockpin signalname="wb_clk_2x" name="clk_i" />
            <blockpin signalname="wb_rst_delay" name="reset_i" />
            <blockpin signalname="Aurora_wr_fifo_full_2" name="fifo_empty_1" />
            <blockpin signalname="Aurora_rd_fifo_empty_2" name="fifo_empty_2" />
            <blockpin signalname="Aurora_wr_fifo_wr_en_2" name="fifo_rd_1" />
            <blockpin signalname="Aurora_rd_fifo_rd_en_2" name="fifo_rd_2" />
            <blockpin signalname="Aurora_wr_fifo_din_2(15:0)" name="fifo_dat_1(15:0)" />
            <blockpin signalname="Aurora_rd_fifo_dout_2(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin signalname="control2(35:0)" name="control(35:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="5808" y="2064" name="Aurora_rd_fifo_1" orien="R0">
        </instance>
        <instance x="5936" y="4704" name="Aurora_rd_fifo_2" orien="R0">
        </instance>
        <branch name="rd_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5776" y="1792" type="branch" />
            <wire x2="5808" y1="1792" y2="1792" x1="5776" />
        </branch>
        <branch name="rd_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5888" y="4432" type="branch" />
            <wire x2="5936" y1="4432" y2="4432" x1="5888" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5760" y="1568" type="branch" />
            <wire x2="5808" y1="1568" y2="1568" x1="5760" />
        </branch>
        <branch name="Aurora_rd_fifo_clk_1">
            <wire x2="5808" y1="1680" y2="1680" x1="5792" />
        </branch>
        <iomarker fontsize="28" x="5792" y="1680" name="Aurora_rd_fifo_clk_1" orien="R180" />
        <branch name="Aurora_rd_fifo_rd_en_1">
            <wire x2="5808" y1="1904" y2="1904" x1="5792" />
        </branch>
        <iomarker fontsize="28" x="5792" y="1904" name="Aurora_rd_fifo_rd_en_1" orien="R180" />
        <branch name="Aurora_rd_fifo_almost_empty_1">
            <wire x2="6288" y1="1648" y2="1648" x1="6256" />
        </branch>
        <iomarker fontsize="28" x="6288" y="1648" name="Aurora_rd_fifo_almost_empty_1" orien="R0" />
        <branch name="Aurora_rd_fifo_prog_empty_1">
            <wire x2="6288" y1="1840" y2="1840" x1="6256" />
        </branch>
        <iomarker fontsize="28" x="6288" y="1840" name="Aurora_rd_fifo_prog_empty_1" orien="R0" />
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5904" y="4208" type="branch" />
            <wire x2="5936" y1="4208" y2="4208" x1="5904" />
        </branch>
        <branch name="Aurora_rd_fifo_clk_2">
            <wire x2="5936" y1="4320" y2="4320" x1="5920" />
        </branch>
        <iomarker fontsize="28" x="5920" y="4320" name="Aurora_rd_fifo_clk_2" orien="R180" />
        <branch name="Aurora_rd_fifo_rd_en_2">
            <wire x2="5936" y1="4544" y2="4544" x1="5888" />
        </branch>
        <iomarker fontsize="28" x="5888" y="4544" name="Aurora_rd_fifo_rd_en_2" orien="R180" />
        <branch name="Aurora_rd_fifo_almost_empty_2">
            <wire x2="6432" y1="4288" y2="4288" x1="6384" />
        </branch>
        <iomarker fontsize="28" x="6432" y="4288" name="Aurora_rd_fifo_almost_empty_2" orien="R0" />
        <branch name="Aurora_rd_fifo_prog_empty_2">
            <wire x2="6416" y1="4480" y2="4480" x1="6384" />
        </branch>
        <iomarker fontsize="28" x="6416" y="4480" name="Aurora_rd_fifo_prog_empty_2" orien="R0" />
        <instance x="3984" y="3200" name="u_bus_master" orien="R0">
        </instance>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="2144" type="branch" />
            <wire x2="3984" y1="2144" y2="2144" x1="3936" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="2208" type="branch" />
            <wire x2="3984" y1="2208" y2="2208" x1="3952" />
        </branch>
        <branch name="BUS_ACK_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="2272" type="branch" />
            <wire x2="3984" y1="2272" y2="2272" x1="3952" />
        </branch>
        <branch name="BUS_REQ_W_1_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="2336" type="branch" />
            <wire x2="3984" y1="2336" y2="2336" x1="3952" />
        </branch>
        <branch name="BUS_REQ_R_1_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="2400" type="branch" />
            <wire x2="3984" y1="2400" y2="2400" x1="3952" />
        </branch>
        <branch name="BUS_REQ_R_2_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3968" y="2464" type="branch" />
            <wire x2="3984" y1="2464" y2="2464" x1="3968" />
        </branch>
        <branch name="rd_fifo_prog_full_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3920" y="2848" type="branch" />
            <wire x2="3984" y1="2848" y2="2848" x1="3920" />
        </branch>
        <branch name="rd_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="3040" type="branch" />
            <wire x2="3984" y1="3040" y2="3040" x1="3936" />
        </branch>
        <branch name="BUS_DAT_I_PIPE(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="3104" type="branch" />
            <wire x2="3984" y1="3104" y2="3104" x1="3936" />
        </branch>
        <branch name="wr_fifo_rdat_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="3168" type="branch" />
            <wire x2="3984" y1="3168" y2="3168" x1="3936" />
        </branch>
        <branch name="BUS_WE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="2144" type="branch" />
            <wire x2="4592" y1="2144" y2="2144" x1="4560" />
        </branch>
        <branch name="BUS_STB">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="2256" type="branch" />
            <wire x2="4592" y1="2256" y2="2256" x1="4560" />
        </branch>
        <branch name="wr_fifo_rd_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="2592" type="branch" />
            <wire x2="4592" y1="2592" y2="2592" x1="4560" />
        </branch>
        <branch name="BUS_DAT_O_EN">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="2368" type="branch" />
            <wire x2="4592" y1="2368" y2="2368" x1="4560" />
        </branch>
        <branch name="rd_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4608" y="2704" type="branch" />
            <wire x2="4608" y1="2704" y2="2704" x1="4560" />
        </branch>
        <branch name="rd_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4576" y="2816" type="branch" />
            <wire x2="4576" y1="2816" y2="2816" x1="4560" />
        </branch>
        <branch name="BUS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="2928" type="branch" />
            <wire x2="4592" y1="2928" y2="2928" x1="4560" />
        </branch>
        <branch name="rd_fifo_wr_data_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="3040" type="branch" />
            <wire x2="4592" y1="3040" y2="3040" x1="4560" />
        </branch>
        <branch name="rd_fifo_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="3152" type="branch" />
            <wire x2="4592" y1="3152" y2="3152" x1="4560" />
        </branch>
        <instance x="2576" y="3088" name="u_Aurora_FPGA_iobuf" orien="R0">
        </instance>
        <branch name="BUS_ACK_PAD">
            <wire x2="2576" y1="2544" y2="2544" x1="2528" />
        </branch>
        <branch name="BUS_REQ_W_1_PAD">
            <wire x2="2576" y1="2608" y2="2608" x1="2528" />
        </branch>
        <branch name="BUS_REQ_R_1_PAD">
            <wire x2="2576" y1="2672" y2="2672" x1="2544" />
        </branch>
        <branch name="BUS_REQ_R_2_PAD">
            <wire x2="2576" y1="2736" y2="2736" x1="2544" />
        </branch>
        <branch name="BUS_DAT_O_EN_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2800" type="branch" />
            <wire x2="2576" y1="2800" y2="2800" x1="2544" />
        </branch>
        <branch name="BUS_WE_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2864" type="branch" />
            <wire x2="2576" y1="2864" y2="2864" x1="2544" />
        </branch>
        <branch name="BUS_STB_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="2928" type="branch" />
            <wire x2="2576" y1="2928" y2="2928" x1="2544" />
        </branch>
        <branch name="BUS_DAT_O_PIPE(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="3056" type="branch" />
            <wire x2="2576" y1="3056" y2="3056" x1="2528" />
        </branch>
        <branch name="BUS_ACK">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="2544" type="branch" />
            <wire x2="3072" y1="2544" y2="2544" x1="3040" />
        </branch>
        <branch name="BUS_REQ_W_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="2608" type="branch" />
            <wire x2="3072" y1="2608" y2="2608" x1="3040" />
        </branch>
        <branch name="BUS_REQ_R_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="2672" type="branch" />
            <wire x2="3072" y1="2672" y2="2672" x1="3040" />
        </branch>
        <branch name="BUS_REQ_R_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="2736" type="branch" />
            <wire x2="3072" y1="2736" y2="2736" x1="3040" />
        </branch>
        <branch name="BUS_WE_PAD">
            <wire x2="3072" y1="2800" y2="2800" x1="3040" />
        </branch>
        <branch name="BUS_STB_PAD">
            <wire x2="3072" y1="2864" y2="2864" x1="3040" />
        </branch>
        <branch name="BUS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="2992" type="branch" />
            <wire x2="3072" y1="2992" y2="2992" x1="3040" />
        </branch>
        <branch name="BUS_AD_PAD(31:0)">
            <wire x2="3072" y1="3056" y2="3056" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="2528" y="2544" name="BUS_ACK_PAD" orien="R180" />
        <iomarker fontsize="28" x="2528" y="2608" name="BUS_REQ_W_1_PAD" orien="R180" />
        <iomarker fontsize="28" x="2544" y="2672" name="BUS_REQ_R_1_PAD" orien="R180" />
        <iomarker fontsize="28" x="2544" y="2736" name="BUS_REQ_R_2_PAD" orien="R180" />
        <iomarker fontsize="28" x="3072" y="2800" name="BUS_WE_PAD" orien="R0" />
        <iomarker fontsize="28" x="3072" y="2864" name="BUS_STB_PAD" orien="R0" />
        <iomarker fontsize="28" x="3072" y="3056" name="BUS_AD_PAD(31:0)" orien="R0" />
        <branch name="m_rdy_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2528" y="3120" type="branch" />
            <wire x2="2576" y1="3120" y2="3120" x1="2528" />
        </branch>
        <branch name="m_rdy">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="3248" type="branch" />
            <wire x2="4592" y1="3248" y2="3248" x1="4560" />
        </branch>
        <branch name="BUS_S_RDY">
            <wire x2="2576" y1="3184" y2="3184" x1="2528" />
        </branch>
        <iomarker fontsize="28" x="2528" y="3184" name="BUS_S_RDY" orien="R180" />
        <branch name="BUS_ABORT">
            <wire x2="2576" y1="3248" y2="3248" x1="2544" />
        </branch>
        <iomarker fontsize="28" x="2544" y="3248" name="BUS_ABORT" orien="R180" />
        <branch name="abort">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="3184" type="branch" />
            <wire x2="3072" y1="3184" y2="3184" x1="3040" />
        </branch>
        <branch name="abort_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="3232" type="branch" />
            <wire x2="3984" y1="3232" y2="3232" x1="3936" />
        </branch>
        <branch name="s_rdy">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="3248" type="branch" />
            <wire x2="3072" y1="3248" y2="3248" x1="3040" />
        </branch>
        <branch name="s_rdy_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="3296" type="branch" />
            <wire x2="3984" y1="3296" y2="3296" x1="3952" />
        </branch>
        <branch name="BUS_M_RDY">
            <wire x2="3072" y1="3312" y2="3312" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="3072" y="3312" name="BUS_M_RDY" orien="R0" />
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2544" y="3376" type="branch" />
            <wire x2="2576" y1="3376" y2="3376" x1="2544" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="3696" type="branch" />
            <wire x2="2720" y1="3696" y2="3696" x1="2656" />
        </branch>
        <branch name="BUS_STB">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="3760" type="branch" />
            <wire x2="2720" y1="3760" y2="3760" x1="2656" />
        </branch>
        <branch name="BUS_WE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="3824" type="branch" />
            <wire x2="2720" y1="3824" y2="3824" x1="2656" />
        </branch>
        <branch name="BUS_ACK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="3888" type="branch" />
            <wire x2="2720" y1="3888" y2="3888" x1="2656" />
        </branch>
        <branch name="m_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="3952" type="branch" />
            <wire x2="2720" y1="3952" y2="3952" x1="2656" />
        </branch>
        <branch name="abort">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="4080" type="branch" />
            <wire x2="2720" y1="4080" y2="4080" x1="2640" />
        </branch>
        <branch name="BUS_REQ_W_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="4144" type="branch" />
            <wire x2="2720" y1="4144" y2="4144" x1="2656" />
        </branch>
        <branch name="BUS_REQ_R_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="4208" type="branch" />
            <wire x2="2720" y1="4208" y2="4208" x1="2656" />
        </branch>
        <branch name="BUS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="4336" type="branch" />
            <wire x2="2720" y1="4336" y2="4336" x1="2640" />
        </branch>
        <branch name="BUS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2640" y="4400" type="branch" />
            <wire x2="2720" y1="4400" y2="4400" x1="2640" />
        </branch>
        <instance x="1072" y="4720" name="u_gnd" orien="R0" />
        <instance x="1136" y="4592" name="u_Aurora_FPGA_clk_gen_top" orien="R0">
        </instance>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1632" y="4560" type="branch" />
            <wire x2="1632" y1="4560" y2="4560" x1="1584" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1648" y="4368" type="branch" />
            <wire x2="1648" y1="4368" y2="4368" x1="1584" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1648" y="4304" type="branch" />
            <wire x2="1648" y1="4304" y2="4304" x1="1584" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1136" y1="4560" y2="4592" x1="1136" />
        </branch>
        <branch name="WB_CLK_2x_PAD">
            <wire x2="1136" y1="4112" y2="4112" x1="1088" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1504" y="4816" type="branch" />
            <wire x2="1616" y1="4816" y2="4816" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="1088" y="4112" name="WB_CLK_2x_PAD" orien="R180" />
        <iomarker fontsize="28" x="1616" y="4816" name="wb_clk_2x" orien="R0" />
        <branch name="wr_fifo_empty_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3936" y="2528" type="branch" />
            <wire x2="3984" y1="2528" y2="2528" x1="3936" />
        </branch>
        <branch name="wr_fifo_almost_empty_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="2592" type="branch" />
            <wire x2="3984" y1="2592" y2="2592" x1="3952" />
        </branch>
        <branch name="wr_fifo_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="3520" type="branch" />
            <wire x2="3984" y1="3520" y2="3520" x1="3952" />
        </branch>
        <branch name="wr_fifo_almost_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="3584" type="branch" />
            <wire x2="3984" y1="3584" y2="3584" x1="3952" />
        </branch>
        <branch name="wr_fifo_rdat_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3952" y="3456" type="branch" />
            <wire x2="3984" y1="3456" y2="3456" x1="3952" />
        </branch>
        <branch name="wr_fifo_rd_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4592" y="3456" type="branch" />
            <wire x2="4592" y1="3456" y2="3456" x1="4560" />
        </branch>
        <branch name="BUS_REQ_W_2_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3920" y="3392" type="branch" />
            <wire x2="3984" y1="3392" y2="3392" x1="3920" />
        </branch>
        <branch name="BUS_REQ_W_2_PAD">
            <wire x2="2576" y1="3456" y2="3456" x1="2544" />
        </branch>
        <iomarker fontsize="28" x="2544" y="3456" name="BUS_REQ_W_2_PAD" orien="R180" />
        <branch name="BUS_REQ_W_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3072" y="3376" type="branch" />
            <wire x2="3072" y1="3376" y2="3376" x1="3040" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1200" type="branch" />
            <wire x2="2480" y1="1200" y2="1200" x1="2448" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1264" type="branch" />
            <wire x2="2480" y1="1264" y2="1264" x1="2448" />
        </branch>
        <branch name="BUS_ACK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2432" y="1328" type="branch" />
            <wire x2="2480" y1="1328" y2="1328" x1="2432" />
        </branch>
        <branch name="BUS_REQ_W_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2432" y="1392" type="branch" />
            <wire x2="2480" y1="1392" y2="1392" x1="2432" />
        </branch>
        <branch name="BUS_REQ_W_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1456" type="branch" />
            <wire x2="2480" y1="1456" y2="1456" x1="2448" />
        </branch>
        <branch name="BUS_REQ_R_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1520" type="branch" />
            <wire x2="2480" y1="1520" y2="1520" x1="2448" />
        </branch>
        <branch name="BUS_REQ_R_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2464" y="1584" type="branch" />
            <wire x2="2480" y1="1584" y2="1584" x1="2464" />
        </branch>
        <branch name="s_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1648" type="branch" />
            <wire x2="2480" y1="1648" y2="1648" x1="2448" />
        </branch>
        <branch name="abort">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1712" type="branch" />
            <wire x2="2480" y1="1712" y2="1712" x1="2448" />
        </branch>
        <branch name="BUS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1776" type="branch" />
            <wire x2="2480" y1="1776" y2="1776" x1="2448" />
        </branch>
        <branch name="BUS_ACK_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2976" y="1200" type="branch" />
            <wire x2="2976" y1="1200" y2="1200" x1="2928" />
        </branch>
        <branch name="BUS_REQ_W_1_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="1296" type="branch" />
            <wire x2="2960" y1="1296" y2="1296" x1="2928" />
        </branch>
        <branch name="BUS_REQ_W_2_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="1392" type="branch" />
            <wire x2="2960" y1="1392" y2="1392" x1="2928" />
        </branch>
        <branch name="BUS_REQ_R_1_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="1488" type="branch" />
            <wire x2="2960" y1="1488" y2="1488" x1="2928" />
        </branch>
        <branch name="BUS_REQ_R_2_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="1584" type="branch" />
            <wire x2="2960" y1="1584" y2="1584" x1="2928" />
        </branch>
        <branch name="s_rdy_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1680" type="branch" />
            <wire x2="2944" y1="1680" y2="1680" x1="2928" />
        </branch>
        <branch name="BUS_DAT_I_PIPE(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2976" y="1776" type="branch" />
            <wire x2="2976" y1="1776" y2="1776" x1="2928" />
        </branch>
        <instance x="2480" y="1808" name="u_bus_master_pipeline" orien="R0">
        </instance>
        <branch name="abort_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="1840" type="branch" />
            <wire x2="2960" y1="1840" y2="1840" x1="2928" />
        </branch>
        <branch name="BUS_DAT_O_EN">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2464" y="1840" type="branch" />
            <wire x2="2480" y1="1840" y2="1840" x1="2464" />
        </branch>
        <branch name="BUS_STB">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="1904" type="branch" />
            <wire x2="2480" y1="1904" y2="1904" x1="2448" />
        </branch>
        <branch name="BUS_WE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2464" y="1968" type="branch" />
            <wire x2="2480" y1="1968" y2="1968" x1="2464" />
        </branch>
        <branch name="m_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2432" y="2032" type="branch" />
            <wire x2="2480" y1="2032" y2="2032" x1="2432" />
        </branch>
        <branch name="BUS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2448" y="2096" type="branch" />
            <wire x2="2480" y1="2096" y2="2096" x1="2448" />
        </branch>
        <branch name="BUS_DAT_O_EN_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1904" type="branch" />
            <wire x2="2944" y1="1904" y2="1904" x1="2928" />
        </branch>
        <branch name="BUS_STB_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1968" type="branch" />
            <wire x2="2944" y1="1968" y2="1968" x1="2928" />
        </branch>
        <branch name="BUS_WE_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="2032" type="branch" />
            <wire x2="2960" y1="2032" y2="2032" x1="2928" />
        </branch>
        <branch name="m_rdy_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="2096" type="branch" />
            <wire x2="2960" y1="2096" y2="2096" x1="2928" />
        </branch>
        <branch name="BUS_DAT_O_PIPE(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="2160" type="branch" />
            <wire x2="2960" y1="2160" y2="2160" x1="2928" />
        </branch>
        <instance x="1040" y="1968" name="XLXI_16" orien="R0">
        </instance>
        <branch name="control1(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1536" y="1488" type="branch" />
            <wire x2="1536" y1="1488" y2="1488" x1="1488" />
        </branch>
        <branch name="control2(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1504" y="2304" type="branch" />
            <wire x2="1504" y1="2304" y2="2304" x1="1472" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1024" y="1552" type="branch" />
            <wire x2="1040" y1="1552" y2="1552" x1="1024" />
        </branch>
        <branch name="rd_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1024" y="1744" type="branch" />
            <wire x2="1040" y1="1744" y2="1744" x1="1024" />
        </branch>
        <branch name="wr_fifo_rd_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="1808" type="branch" />
            <wire x2="1040" y1="1808" y2="1808" x1="1008" />
        </branch>
        <branch name="rd_fifo_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="1872" type="branch" />
            <wire x2="1040" y1="1872" y2="1872" x1="1008" />
        </branch>
        <branch name="wr_fifo_rdat_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="1936" type="branch" />
            <wire x2="1040" y1="1936" y2="1936" x1="1008" />
        </branch>
        <branch name="rd_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="1616" type="branch" />
            <wire x2="1040" y1="1616" y2="1616" x1="1008" />
        </branch>
        <branch name="wr_fifo_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="1680" type="branch" />
            <wire x2="1040" y1="1680" y2="1680" x1="1008" />
        </branch>
        <branch name="control1(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3120" y="3696" type="branch" />
            <wire x2="3120" y1="3696" y2="3696" x1="3104" />
        </branch>
        <branch name="control2(35:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3120" y="3760" type="branch" />
            <wire x2="3120" y1="3760" y2="3760" x1="3104" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1520" y="4992" type="branch" />
            <wire x2="1616" y1="4992" y2="4992" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1616" y="4992" name="wb_rst" orien="R0" />
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1632" y="4496" type="branch" />
            <wire x2="1632" y1="4496" y2="4496" x1="1584" />
        </branch>
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1536" y="5072" type="branch" />
            <wire x2="1600" y1="5072" y2="5072" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1600" y="5072" name="wb_clk_divide" orien="R0" />
        <branch name="BUS_REQ_W_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="4464" type="branch" />
            <wire x2="2720" y1="4464" y2="4464" x1="2656" />
        </branch>
        <branch name="BUS_REQ_R_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2656" y="4272" type="branch" />
            <wire x2="2720" y1="4272" y2="4272" x1="2656" />
        </branch>
        <branch name="s_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2672" y="4016" type="branch" />
            <wire x2="2720" y1="4016" y2="4016" x1="2672" />
        </branch>
        <instance x="2720" y="4432" name="u_Aurora_FPGA_debug" orien="R0">
        </instance>
        <branch name="control3(35:0)">
            <wire x2="3120" y1="3824" y2="3824" x1="3104" />
        </branch>
        <branch name="control4(35:0)">
            <wire x2="3120" y1="3888" y2="3888" x1="3104" />
        </branch>
        <iomarker fontsize="28" x="3120" y="3824" name="control3(35:0)" orien="R0" />
        <iomarker fontsize="28" x="3120" y="3888" name="control4(35:0)" orien="R0" />
        <branch name="Aurora_rd_fifo_dout_1(31:0)">
            <wire x2="6288" y1="1904" y2="1904" x1="6256" />
        </branch>
        <iomarker fontsize="28" x="6288" y="1904" name="Aurora_rd_fifo_dout_1(31:0)" orien="R0" />
        <branch name="Aurora_rd_fifo_dout_2(31:0)">
            <wire x2="6416" y1="4544" y2="4544" x1="6384" />
        </branch>
        <iomarker fontsize="28" x="6416" y="4544" name="Aurora_rd_fifo_dout_2(31:0)" orien="R0" />
        <branch name="rd_fifo_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5888" y="4656" type="branch" />
            <wire x2="5936" y1="4656" y2="4656" x1="5888" />
        </branch>
        <branch name="rd_fifo_wr_data_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5744" y="2016" type="branch" />
            <wire x2="5808" y1="2016" y2="2016" x1="5744" />
        </branch>
        <branch name="control5(35:0)">
            <wire x2="3136" y1="3984" y2="3984" x1="3104" />
        </branch>
        <iomarker fontsize="28" x="3136" y="3984" name="control5(35:0)" orien="R0" />
        <instance x="4656" y="592" name="XLXI_18" orien="R0" />
        <instance x="4656" y="944" name="XLXI_19" orien="R0" />
        <branch name="rst_channel_0">
            <wire x2="4656" y1="464" y2="464" x1="4624" />
        </branch>
        <iomarker fontsize="28" x="4624" y="464" name="rst_channel_0" orien="R180" />
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4608" y="528" type="branch" />
            <wire x2="4656" y1="528" y2="528" x1="4608" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4944" y="496" type="branch" />
            <wire x2="4944" y1="496" y2="496" x1="4912" />
        </branch>
        <branch name="rst_channel_1">
            <wire x2="4656" y1="816" y2="816" x1="4608" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4624" y="880" type="branch" />
            <wire x2="4656" y1="880" y2="880" x1="4624" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4960" y="848" type="branch" />
            <wire x2="4960" y1="848" y2="848" x1="4912" />
        </branch>
        <iomarker fontsize="28" x="4608" y="816" name="rst_channel_1" orien="R180" />
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5776" y="1456" type="branch" />
            <wire x2="5808" y1="1456" y2="1456" x1="5776" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5904" y="4096" type="branch" />
            <wire x2="5936" y1="4096" y2="4096" x1="5904" />
        </branch>
        <instance x="5856" y="528" name="XLXI_24" orien="R0">
        </instance>
        <instance x="5856" y="272" name="XLXI_20" orien="R0">
        </instance>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5824" y="112" type="branch" />
            <wire x2="5856" y1="112" y2="112" x1="5824" />
        </branch>
        <branch name="wr_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5824" y="240" type="branch" />
            <wire x2="5856" y1="240" y2="240" x1="5824" />
        </branch>
        <branch name="wr_fifo_empty_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6192" y="112" type="branch" />
            <wire x2="6192" y1="112" y2="112" x1="6176" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5840" y="368" type="branch" />
            <wire x2="5856" y1="368" y2="368" x1="5840" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5840" y="496" type="branch" />
            <wire x2="5856" y1="496" y2="496" x1="5840" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_1">
            <wire x2="6208" y1="368" y2="368" x1="6176" />
        </branch>
        <iomarker fontsize="28" x="6208" y="368" name="Aurora_wr_fifo_almost_full_1" orien="R0" />
        <instance x="5968" y="3184" name="XLXI_27" orien="R0">
        </instance>
        <instance x="5968" y="2928" name="XLXI_28" orien="R0">
        </instance>
        <branch name="wr_fifo_empty_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6304" y="2768" type="branch" />
            <wire x2="6304" y1="2768" y2="2768" x1="6288" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="3024" type="branch" />
            <wire x2="5968" y1="3024" y2="3024" x1="5952" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="3088" type="branch" />
            <wire x2="5968" y1="3088" y2="3088" x1="5952" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_2">
            <wire x2="6320" y1="3024" y2="3024" x1="6288" />
        </branch>
        <iomarker fontsize="28" x="6320" y="3024" name="Aurora_wr_fifo_almost_full_2" orien="R0" />
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5936" y="2768" type="branch" />
            <wire x2="5968" y1="2768" y2="2768" x1="5936" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5936" y="2832" type="branch" />
            <wire x2="5968" y1="2832" y2="2832" x1="5936" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5824" y="176" type="branch" />
            <wire x2="5856" y1="176" y2="176" x1="5824" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5824" y="432" type="branch" />
            <wire x2="5856" y1="432" y2="432" x1="5824" />
        </branch>
        <branch name="wr_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="2896" type="branch" />
            <wire x2="5968" y1="2896" y2="2896" x1="5952" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5936" y="3152" type="branch" />
            <wire x2="5968" y1="3152" y2="3152" x1="5936" />
        </branch>
        <instance x="5872" y="2352" name="XLXI_31" orien="R0">
        </instance>
        <instance x="5872" y="2592" name="XLXI_32" orien="R0">
        </instance>
        <branch name="Aurora_rd_fifo_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5840" y="2192" type="branch" />
            <wire x2="5872" y1="2192" y2="2192" x1="5840" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5840" y="2256" type="branch" />
            <wire x2="5872" y1="2256" y2="2256" x1="5840" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5840" y="2432" type="branch" />
            <wire x2="5872" y1="2432" y2="2432" x1="5840" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5856" y="2496" type="branch" />
            <wire x2="5872" y1="2496" y2="2496" x1="5856" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5840" y="2320" type="branch" />
            <wire x2="5872" y1="2320" y2="2320" x1="5840" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6272" y="1584" type="branch" />
            <wire x2="6272" y1="1584" y2="1584" x1="6256" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_1">
            <wire x2="6224" y1="2192" y2="2192" x1="6192" />
        </branch>
        <iomarker fontsize="28" x="6224" y="2192" name="Aurora_rd_fifo_empty_1" orien="R0" />
        <branch name="rd_fifo_prog_full_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6224" y="2432" type="branch" />
            <wire x2="6224" y1="2432" y2="2432" x1="6192" />
        </branch>
        <branch name="rd_fifo_prog_full_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5856" y="2560" type="branch" />
            <wire x2="5872" y1="2560" y2="2560" x1="5856" />
        </branch>
        <branch name="rd_fifo_prog_full_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6288" y="1776" type="branch" />
            <wire x2="6288" y1="1776" y2="1776" x1="6256" />
        </branch>
        <instance x="5984" y="5040" name="XLXI_33" orien="R0">
        </instance>
        <instance x="5984" y="5280" name="XLXI_34" orien="R0">
        </instance>
        <branch name="Aurora_rd_fifo_empty_2">
            <wire x2="6336" y1="4880" y2="4880" x1="6304" />
        </branch>
        <iomarker fontsize="28" x="6336" y="4880" name="Aurora_rd_fifo_empty_2" orien="R0" />
        <branch name="Aurora_rd_fifo_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="4880" type="branch" />
            <wire x2="5984" y1="4880" y2="4880" x1="5952" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="4944" type="branch" />
            <wire x2="5984" y1="4944" y2="4944" x1="5952" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="5184" type="branch" />
            <wire x2="5984" y1="5184" y2="5184" x1="5952" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="5120" type="branch" />
            <wire x2="5984" y1="5120" y2="5120" x1="5952" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="5008" type="branch" />
            <wire x2="5984" y1="5008" y2="5008" x1="5952" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6432" y="4224" type="branch" />
            <wire x2="6432" y1="4224" y2="4224" x1="6384" />
        </branch>
        <branch name="rd_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6336" y="5120" type="branch" />
            <wire x2="6336" y1="5120" y2="5120" x1="6304" />
        </branch>
        <branch name="rd_fifo_prog_full_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5952" y="5248" type="branch" />
            <wire x2="5984" y1="5248" y2="5248" x1="5952" />
        </branch>
        <branch name="rd_fifo_prog_full_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6416" y="4416" type="branch" />
            <wire x2="6416" y1="4416" y2="4416" x1="6384" />
        </branch>
        <branch name="wb_clk_master">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1664" y="4432" type="branch" />
            <wire x2="1664" y1="4432" y2="4432" x1="1584" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="992" y="1488" type="branch" />
            <wire x2="1040" y1="1488" y2="1488" x1="992" />
        </branch>
        <branch name="control6(35:0)">
            <wire x2="3136" y1="4528" y2="4528" x1="3104" />
        </branch>
        <iomarker fontsize="28" x="3136" y="4528" name="control6(35:0)" orien="R0" />
        <instance x="4912" y="3584" name="XLXI_5" orien="R0" />
        <branch name="wr_fifo_rd_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4896" y="3456" type="branch" />
            <wire x2="4912" y1="3456" y2="3456" x1="4896" />
        </branch>
        <branch name="fifo_read_override">
            <wire x2="4912" y1="3520" y2="3520" x1="4896" />
        </branch>
        <branch name="wr_fifo_rd_en_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5184" y="3488" type="branch" />
            <wire x2="5184" y1="3488" y2="3488" x1="5168" />
        </branch>
        <iomarker fontsize="28" x="4896" y="3520" name="fifo_read_override" orien="R180" />
        <instance x="5840" y="1088" name="Aurora_wr_fifo_1" orien="R0">
        </instance>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5776" y="736" type="branch" />
            <wire x2="5840" y1="736" y2="736" x1="5776" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_1">
            <wire x2="5840" y1="800" y2="800" x1="5776" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5808" y="864" type="branch" />
            <wire x2="5840" y1="864" y2="864" x1="5808" />
        </branch>
        <branch name="Aurora_wr_fifo_wr_en_1">
            <wire x2="5840" y1="928" y2="928" x1="5776" />
        </branch>
        <branch name="Aurora_wr_fifo_din_1(15:0)">
            <wire x2="5840" y1="1056" y2="1056" x1="5760" />
        </branch>
        <branch name="wr_fifo_rd_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5824" y="992" type="branch" />
            <wire x2="5840" y1="992" y2="992" x1="5824" />
        </branch>
        <branch name="wr_fifo_rdat_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6256" y="1056" type="branch" />
            <wire x2="6256" y1="1056" y2="1056" x1="6224" />
        </branch>
        <branch name="wr_fifo_almost_empty_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6256" y="928" type="branch" />
            <wire x2="6256" y1="928" y2="928" x1="6224" />
        </branch>
        <branch name="wr_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6240" y="864" type="branch" />
            <wire x2="6240" y1="864" y2="864" x1="6224" />
        </branch>
        <branch name="Aurora_wr_fifo_full_1">
            <wire x2="6272" y1="736" y2="736" x1="6224" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6272" y="800" type="branch" />
            <wire x2="6272" y1="800" y2="800" x1="6224" />
        </branch>
        <iomarker fontsize="28" x="5776" y="800" name="Aurora_wr_fifo_clk_1" orien="R180" />
        <iomarker fontsize="28" x="5776" y="928" name="Aurora_wr_fifo_wr_en_1" orien="R180" />
        <iomarker fontsize="28" x="5760" y="1056" name="Aurora_wr_fifo_din_1(15:0)" orien="R180" />
        <iomarker fontsize="28" x="6272" y="736" name="Aurora_wr_fifo_full_1" orien="R0" />
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5936" y="3488" type="branch" />
            <wire x2="5952" y1="3488" y2="3488" x1="5936" />
        </branch>
        <branch name="Aurora_wr_fifo_full_2">
            <wire x2="6384" y1="3488" y2="3488" x1="6336" />
        </branch>
        <branch name="wr_fifo_almost_empty_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6384" y="3680" type="branch" />
            <wire x2="6384" y1="3680" y2="3680" x1="6336" />
        </branch>
        <branch name="wr_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6368" y="3616" type="branch" />
            <wire x2="6368" y1="3616" y2="3616" x1="6336" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6384" y="3552" type="branch" />
            <wire x2="6384" y1="3552" y2="3552" x1="6336" />
        </branch>
        <branch name="wr_fifo_rdat_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6368" y="3808" type="branch" />
            <wire x2="6368" y1="3808" y2="3808" x1="6336" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_2">
            <wire x2="5952" y1="3552" y2="3552" x1="5904" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5936" y="3616" type="branch" />
            <wire x2="5952" y1="3616" y2="3616" x1="5936" />
        </branch>
        <branch name="wr_fifo_rd_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5936" y="3744" type="branch" />
            <wire x2="5952" y1="3744" y2="3744" x1="5936" />
        </branch>
        <instance x="5952" y="3840" name="Aurora_wr_fifo_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="6384" y="3488" name="Aurora_wr_fifo_full_2" orien="R0" />
        <iomarker fontsize="28" x="5904" y="3552" name="Aurora_wr_fifo_clk_2" orien="R180" />
        <branch name="BUS_ACK_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4928" y="3648" type="branch" />
            <wire x2="4944" y1="3648" y2="3648" x1="4928" />
        </branch>
        <instance x="4944" y="3776" name="XLXI_66" orien="R0" />
        <branch name="cPCI_rdy_override">
            <wire x2="4944" y1="3712" y2="3712" x1="4912" />
        </branch>
        <iomarker fontsize="28" x="4912" y="3712" name="cPCI_rdy_override" orien="R180" />
        <instance x="1024" y="2784" name="XLXI_70" orien="R0">
        </instance>
        <branch name="Aurora_wr_fifo_din_2(15:0)">
            <wire x2="5952" y1="3808" y2="3808" x1="5936" />
        </branch>
        <iomarker fontsize="28" x="5936" y="3808" name="Aurora_wr_fifo_din_2(15:0)" orien="R180" />
        <branch name="Aurora_wr_fifo_wr_en_2">
            <wire x2="5952" y1="3680" y2="3680" x1="5920" />
        </branch>
        <iomarker fontsize="28" x="5920" y="3680" name="Aurora_wr_fifo_wr_en_2" orien="R180" />
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="2304" type="branch" />
            <wire x2="1024" y1="2304" y2="2304" x1="1008" />
        </branch>
        <branch name="Aurora_wr_fifo_full_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="2432" type="branch" />
            <wire x2="1024" y1="2432" y2="2432" x1="1008" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="2496" type="branch" />
            <wire x2="1024" y1="2496" y2="2496" x1="1008" />
        </branch>
        <branch name="Aurora_wr_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="2560" type="branch" />
            <wire x2="1024" y1="2560" y2="2560" x1="1008" />
        </branch>
        <branch name="Aurora_rd_fifo_rd_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="2624" type="branch" />
            <wire x2="1024" y1="2624" y2="2624" x1="1008" />
        </branch>
        <branch name="Aurora_wr_fifo_din_2(15:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="2688" type="branch" />
            <wire x2="1024" y1="2688" y2="2688" x1="1008" />
        </branch>
        <branch name="Aurora_rd_fifo_dout_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1008" y="2752" type="branch" />
            <wire x2="1024" y1="2752" y2="2752" x1="1008" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="992" y="2368" type="branch" />
            <wire x2="1024" y1="2368" y2="2368" x1="992" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1536" y="4896" type="branch" />
            <wire x2="1584" y1="4896" y2="4896" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1584" y="4896" name="wb_rst_delay" orien="R0" />
        <branch name="cPCI_RDY_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4992" y="3824" type="branch" />
            <wire x2="5008" y1="3824" y2="3824" x1="4992" />
            <wire x2="5072" y1="3824" y2="3824" x1="5008" />
        </branch>
        <branch name="cPCI_RDY_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5216" y="3680" type="branch" />
            <wire x2="5216" y1="3680" y2="3680" x1="5200" />
        </branch>
        <iomarker fontsize="28" x="5072" y="3824" name="cPCI_RDY_2" orien="R0" />
    </sheet>
</drawing>