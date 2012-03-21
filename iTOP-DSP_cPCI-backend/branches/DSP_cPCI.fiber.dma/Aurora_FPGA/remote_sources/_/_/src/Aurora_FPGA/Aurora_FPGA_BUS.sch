<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="rd_fifo_wr_en_2" />
        <signal name="wb_clk_2x" />
        <signal name="wb_rst_delay" />
        <signal name="BUS_ACK_PIPE" />
        <signal name="BUS_REQ_W_1_pipe" />
        <signal name="BUS_REQ_R_1_pipe" />
        <signal name="BUS_REQ_R_2_pipe" />
        <signal name="rd_fifo_prog_full_1" />
        <signal name="rd_fifo_prog_full_2" />
        <signal name="BUS_DAT_I_PIPE(31:0)" />
        <signal name="BUS_WE" />
        <signal name="BUS_STB" />
        <signal name="BUS_DAT_O_EN" />
        <signal name="BUS_DAT_O(31:0)" />
        <signal name="rd_fifo_wr_data_1(31:0)" />
        <signal name="rd_fifo_wr_data_2(31:0)" />
        <signal name="BUS_ACK" />
        <signal name="BUS_REQ_W_1" />
        <signal name="BUS_REQ_R_1" />
        <signal name="BUS_REQ_R_2" />
        <signal name="BUS_DAT_I(31:0)" />
        <signal name="m_rdy" />
        <signal name="abort" />
        <signal name="abort_pipe" />
        <signal name="s_rdy" />
        <signal name="s_rdy_pipe" />
        <signal name="wb_rst" />
        <signal name="XLXN_2" />
        <signal name="WB_CLK_2x_PAD" />
        <signal name="wr_fifo_empty_2" />
        <signal name="wr_fifo_rdat_2(31:0)" />
        <signal name="wr_fifo_rd_2" />
        <signal name="BUS_REQ_W_2_pipe" />
        <signal name="BUS_REQ_W_2" />
        <signal name="wb_clk_divide" />
        <signal name="rst_channel_0_in" />
        <signal name="rst_channel_1_in" />
        <signal name="wb_clk_master" />
        <signal name="Aurora_rd_fifo_rd_en_1" />
        <signal name="Aurora_rd_fifo_dout_1(31:0)" />
        <signal name="Aurora_rd_fifo_empty_1" />
        <signal name="wr_fifo_rdat_1(31:0)" />
        <signal name="wr_fifo_empty_1" />
        <signal name="wr_fifo_almost_empty_1" />
        <signal name="wr_fifo_almost_empty_2" />
        <signal name="wr_fifo_empty_1_in" />
        <signal name="Aurora_wr_fifo_clk_1" />
        <signal name="Aurora_wr_fifo_almost_full_1_in" />
        <signal name="Aurora_wr_fifo_almost_full_1" />
        <signal name="Aurora_wr_fifo_wr_en_1" />
        <signal name="Aurora_wr_fifo_din_1(15:0)" />
        <signal name="Aurora_wr_fifo_full_1" />
        <signal name="Aurora_wr_fifo_clk_2" />
        <signal name="Aurora_wr_fifo_almost_full_2" />
        <signal name="wr_fifo_empty_2_in" />
        <signal name="Aurora_wr_fifo_almost_full_2_in" />
        <signal name="BUS_DAT_O_EN_PIPE" />
        <signal name="BUS_STB_PIPE" />
        <signal name="BUS_WE_PIPE" />
        <signal name="m_rdy_pipe" />
        <signal name="BUS_DAT_O_PIPE(31:0)" />
        <signal name="BUS_ACK_PAD" />
        <signal name="BUS_REQ_W_1_PAD" />
        <signal name="BUS_REQ_R_1_PAD" />
        <signal name="BUS_REQ_R_2_PAD" />
        <signal name="BUS_WE_PAD" />
        <signal name="BUS_STB_PAD" />
        <signal name="BUS_AD_PAD(31:0)" />
        <signal name="BUS_S_RDY" />
        <signal name="BUS_ABORT" />
        <signal name="BUS_M_RDY" />
        <signal name="BUS_REQ_W_2_PAD" />
        <signal name="Aurora_wr_fifo_full_2" />
        <signal name="Aurora_wr_fifo_wr_en_2" />
        <signal name="Aurora_rd_fifo_rd_en_2" />
        <signal name="Aurora_wr_fifo_din_2(15:0)" />
        <signal name="Aurora_rd_fifo_dout_2(31:0)" />
        <signal name="Aurora_rd_fifo_empty_2" />
        <signal name="control2(35:0)" />
        <signal name="control1(35:0)" />
        <signal name="Aurora_rd_fifo_clk_1" />
        <signal name="Aurora_rd_fifo_almost_empty_1" />
        <signal name="Aurora_rd_fifo_prog_empty_1" />
        <signal name="Aurora_rd_fifo_empty_1_in" />
        <signal name="rd_fifo_prog_full_1_in" />
        <signal name="Aurora_rd_fifo_clk_2" />
        <signal name="Aurora_rd_fifo_almost_empty_2" />
        <signal name="Aurora_rd_fifo_prog_empty_2" />
        <signal name="Aurora_rd_fifo_empty_2_in" />
        <signal name="rd_fifo_prog_full_2_in" />
        <signal name="rst_channel_0" />
        <signal name="rst_channel_1" />
        <signal name="control4(35:0)" />
        <signal name="control3(35:0)" />
        <signal name="rd_fifo_wr_en_1" />
        <signal name="wr_fifo_prog_full_1" />
        <signal name="wr_fifo_rd_1" />
        <signal name="cPCI_RDY_1" />
        <signal name="fifo_read_override_1" />
        <signal name="XLXN_13" />
        <signal name="cPCI_RDY_2" />
        <signal name="fifo_read_override_2" />
        <signal name="XLXN_45" />
        <signal name="wr_fifo_prog_full_2" />
        <port polarity="Output" name="wb_clk_2x" />
        <port polarity="Output" name="wb_rst_delay" />
        <port polarity="Output" name="wb_rst" />
        <port polarity="Input" name="WB_CLK_2x_PAD" />
        <port polarity="Output" name="wb_clk_divide" />
        <port polarity="Input" name="Aurora_rd_fifo_rd_en_1" />
        <port polarity="Output" name="Aurora_rd_fifo_dout_1(31:0)" />
        <port polarity="Output" name="Aurora_rd_fifo_empty_1" />
        <port polarity="Input" name="Aurora_wr_fifo_clk_1" />
        <port polarity="Output" name="Aurora_wr_fifo_almost_full_1" />
        <port polarity="Input" name="Aurora_wr_fifo_wr_en_1" />
        <port polarity="Input" name="Aurora_wr_fifo_din_1(15:0)" />
        <port polarity="Output" name="Aurora_wr_fifo_full_1" />
        <port polarity="Input" name="Aurora_wr_fifo_clk_2" />
        <port polarity="Output" name="Aurora_wr_fifo_almost_full_2" />
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
        <port polarity="Input" name="BUS_REQ_W_2_PAD" />
        <port polarity="Output" name="Aurora_wr_fifo_full_2" />
        <port polarity="Input" name="Aurora_wr_fifo_wr_en_2" />
        <port polarity="Input" name="Aurora_rd_fifo_rd_en_2" />
        <port polarity="Input" name="Aurora_wr_fifo_din_2(15:0)" />
        <port polarity="Output" name="Aurora_rd_fifo_dout_2(31:0)" />
        <port polarity="Output" name="Aurora_rd_fifo_empty_2" />
        <port polarity="Input" name="Aurora_rd_fifo_clk_1" />
        <port polarity="Output" name="Aurora_rd_fifo_almost_empty_1" />
        <port polarity="Output" name="Aurora_rd_fifo_prog_empty_1" />
        <port polarity="Input" name="Aurora_rd_fifo_clk_2" />
        <port polarity="Output" name="Aurora_rd_fifo_almost_empty_2" />
        <port polarity="Output" name="Aurora_rd_fifo_prog_empty_2" />
        <port polarity="Input" name="rst_channel_0" />
        <port polarity="Input" name="rst_channel_1" />
        <port polarity="BiDirectional" name="control3(35:0)" />
        <port polarity="Output" name="cPCI_RDY_1" />
        <port polarity="Input" name="fifo_read_override_1" />
        <port polarity="Output" name="cPCI_RDY_2" />
        <port polarity="Input" name="fifo_read_override_2" />
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
            <timestamp>2012-3-20T2:1:52</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
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
            <rect width="256" x="64" y="-384" height="448" />
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
            <timestamp>2012-3-8T18:43:55</timestamp>
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
            <rect width="256" x="64" y="-768" height="1020" />
            <rect width="64" x="320" y="-620" height="24" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <rect width="64" x="320" y="-556" height="24" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
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
        <blockdef name="chk_sum">
            <timestamp>2012-3-8T1:38:53</timestamp>
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="464" x="64" y="-384" height="384" />
            <rect width="64" x="528" y="-364" height="24" />
            <line x2="592" y1="-352" y2="-352" x1="528" />
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
            <blockpin signalname="wr_fifo_prog_full_1" name="prog_full" />
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
        <block symbolname="Aurora_fifo_wr" name="Aurora_wr_fifo_2">
            <blockpin signalname="rst_channel_1_in" name="rst" />
            <blockpin signalname="Aurora_wr_fifo_clk_2" name="wr_clk" />
            <blockpin signalname="wb_clk_2x" name="rd_clk" />
            <blockpin signalname="Aurora_wr_fifo_wr_en_2" name="wr_en" />
            <blockpin signalname="wr_fifo_rd_2" name="rd_en" />
            <blockpin signalname="Aurora_wr_fifo_din_2(15:0)" name="din(15:0)" />
            <blockpin signalname="Aurora_wr_fifo_full_2" name="full" />
            <blockpin signalname="Aurora_wr_fifo_almost_full_2_in" name="almost_full" />
            <blockpin signalname="wr_fifo_empty_2_in" name="empty" />
            <blockpin signalname="wr_fifo_almost_empty_2" name="almost_empty" />
            <blockpin name="valid" />
            <blockpin signalname="wr_fifo_rdat_2(31:0)" name="dout(31:0)" />
            <blockpin signalname="wr_fifo_prog_full_2" name="prog_full" />
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
        <block symbolname="down_fifo_interface_debug_small" name="XLXI_70">
            <blockpin signalname="wb_clk_2x" name="clk_i" />
            <blockpin signalname="wb_rst_delay" name="reset_i" />
            <blockpin signalname="Aurora_wr_fifo_full_1" name="fifo_empty_1" />
            <blockpin signalname="Aurora_rd_fifo_empty_1" name="fifo_empty_2" />
            <blockpin signalname="Aurora_wr_fifo_wr_en_1" name="fifo_rd_1" />
            <blockpin signalname="Aurora_rd_fifo_rd_en_1" name="fifo_rd_2" />
            <blockpin signalname="Aurora_wr_fifo_din_1(15:0)" name="fifo_dat_1(15:0)" />
            <blockpin signalname="Aurora_rd_fifo_dout_1(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin signalname="control2(35:0)" name="control(35:0)" />
        </block>
        <block symbolname="down_fifo_interface_debug" name="XLXI_16">
            <blockpin signalname="wb_clk_2x" name="clk_i" />
            <blockpin signalname="wb_rst_delay" name="reset_i" />
            <blockpin signalname="rd_fifo_prog_full_1" name="fifo_empty_1" />
            <blockpin signalname="wr_fifo_empty_1" name="fifo_empty_2" />
            <blockpin signalname="rd_fifo_wr_en_1" name="fifo_rd_1" />
            <blockpin signalname="wr_fifo_rd_1" name="fifo_rd_2" />
            <blockpin signalname="rd_fifo_wr_data_1(31:0)" name="fifo_dat_1(31:0)" />
            <blockpin signalname="wr_fifo_rdat_1(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin signalname="control1(35:0)" name="control(35:0)" />
        </block>
        <block symbolname="down_fifo_interface_debug_small" name="XLXI_87">
            <blockpin signalname="wb_clk_2x" name="clk_i" />
            <blockpin signalname="wb_rst_delay" name="reset_i" />
            <blockpin signalname="Aurora_wr_fifo_full_2" name="fifo_empty_1" />
            <blockpin signalname="Aurora_rd_fifo_empty_2" name="fifo_empty_2" />
            <blockpin signalname="Aurora_wr_fifo_wr_en_2" name="fifo_rd_1" />
            <blockpin signalname="Aurora_rd_fifo_rd_en_2" name="fifo_rd_2" />
            <blockpin signalname="Aurora_wr_fifo_din_2(15:0)" name="fifo_dat_1(15:0)" />
            <blockpin signalname="Aurora_rd_fifo_dout_2(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin name="control(35:0)" />
        </block>
        <block symbolname="down_fifo_interface_debug" name="XLXI_86">
            <blockpin signalname="wb_clk_2x" name="clk_i" />
            <blockpin signalname="wb_rst_delay" name="reset_i" />
            <blockpin signalname="rd_fifo_prog_full_2" name="fifo_empty_1" />
            <blockpin signalname="wr_fifo_empty_2" name="fifo_empty_2" />
            <blockpin signalname="rd_fifo_wr_en_2" name="fifo_rd_1" />
            <blockpin signalname="wr_fifo_rd_2" name="fifo_rd_2" />
            <blockpin signalname="rd_fifo_wr_data_2(31:0)" name="fifo_dat_1(31:0)" />
            <blockpin signalname="wr_fifo_rdat_2(31:0)" name="fifo_dat_2(31:0)" />
            <blockpin name="control(35:0)" />
        </block>
        <block symbolname="chk_sum" name="CHK_SUM_1">
            <blockpin signalname="wb_clk_2x" name="CLK" />
            <blockpin signalname="wr_fifo_rd_1" name="RD_EN" />
            <blockpin signalname="wr_fifo_rdat_1(31:0)" name="FIFO_DATA_OUT(31:0)" />
            <blockpin signalname="control4(35:0)" name="CONTROL(35:0)" />
        </block>
        <block symbolname="or2" name="XLXI_88">
            <blockpin signalname="fifo_read_override_1" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="cPCI_RDY_1" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_98">
            <blockpin signalname="wr_fifo_prog_full_1" name="I" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_94">
            <blockpin signalname="fifo_read_override_2" name="I0" />
            <blockpin signalname="XLXN_45" name="I1" />
            <blockpin signalname="cPCI_RDY_2" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_112">
            <blockpin signalname="wr_fifo_prog_full_2" name="I" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="384" y="4800" name="u_gnd" orien="R0" />
        <instance x="448" y="4672" name="u_Aurora_FPGA_clk_gen_top" orien="R0">
        </instance>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="944" y="4640" type="branch" />
            <wire x2="944" y1="4640" y2="4640" x1="896" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="960" y="4448" type="branch" />
            <wire x2="960" y1="4448" y2="4448" x1="896" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="960" y="4384" type="branch" />
            <wire x2="960" y1="4384" y2="4384" x1="896" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="448" y1="4640" y2="4672" x1="448" />
        </branch>
        <branch name="WB_CLK_2x_PAD">
            <wire x2="448" y1="4192" y2="4192" x1="400" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="816" y="4896" type="branch" />
            <wire x2="928" y1="4896" y2="4896" x1="816" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="832" y="5072" type="branch" />
            <wire x2="928" y1="5072" y2="5072" x1="832" />
        </branch>
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="944" y="4576" type="branch" />
            <wire x2="944" y1="4576" y2="4576" x1="896" />
        </branch>
        <branch name="wb_clk_divide">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="848" y="5152" type="branch" />
            <wire x2="912" y1="5152" y2="5152" x1="848" />
        </branch>
        <branch name="wb_clk_master">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="976" y="4512" type="branch" />
            <wire x2="976" y1="4512" y2="4512" x1="896" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="848" y="4976" type="branch" />
            <wire x2="896" y1="4976" y2="4976" x1="848" />
        </branch>
        <iomarker fontsize="28" x="400" y="4192" name="WB_CLK_2x_PAD" orien="R180" />
        <iomarker fontsize="28" x="928" y="4896" name="wb_clk_2x" orien="R0" />
        <iomarker fontsize="28" x="928" y="5072" name="wb_rst" orien="R0" />
        <iomarker fontsize="28" x="912" y="5152" name="wb_clk_divide" orien="R0" />
        <iomarker fontsize="28" x="896" y="4976" name="wb_rst_delay" orien="R0" />
        <instance x="3360" y="2368" name="u_bus_master" orien="R0">
        </instance>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="1312" type="branch" />
            <wire x2="3360" y1="1312" y2="1312" x1="3312" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1376" type="branch" />
            <wire x2="3360" y1="1376" y2="1376" x1="3328" />
        </branch>
        <branch name="BUS_ACK_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1440" type="branch" />
            <wire x2="3360" y1="1440" y2="1440" x1="3328" />
        </branch>
        <branch name="BUS_REQ_W_1_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1504" type="branch" />
            <wire x2="3360" y1="1504" y2="1504" x1="3328" />
        </branch>
        <branch name="BUS_REQ_R_1_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1568" type="branch" />
            <wire x2="3360" y1="1568" y2="1568" x1="3328" />
        </branch>
        <branch name="BUS_REQ_R_2_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3344" y="1632" type="branch" />
            <wire x2="3360" y1="1632" y2="1632" x1="3344" />
        </branch>
        <branch name="rd_fifo_prog_full_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3296" y="2016" type="branch" />
            <wire x2="3360" y1="2016" y2="2016" x1="3296" />
        </branch>
        <branch name="rd_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="2208" type="branch" />
            <wire x2="3360" y1="2208" y2="2208" x1="3312" />
        </branch>
        <branch name="BUS_DAT_I_PIPE(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="2272" type="branch" />
            <wire x2="3360" y1="2272" y2="2272" x1="3312" />
        </branch>
        <branch name="wr_fifo_rdat_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="2336" type="branch" />
            <wire x2="3360" y1="2336" y2="2336" x1="3312" />
        </branch>
        <branch name="BUS_WE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="1312" type="branch" />
            <wire x2="3968" y1="1312" y2="1312" x1="3936" />
        </branch>
        <branch name="BUS_STB">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="1424" type="branch" />
            <wire x2="3968" y1="1424" y2="1424" x1="3936" />
        </branch>
        <branch name="wr_fifo_rd_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="1760" type="branch" />
            <wire x2="3968" y1="1760" y2="1760" x1="3936" />
        </branch>
        <branch name="BUS_DAT_O_EN">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="1536" type="branch" />
            <wire x2="3968" y1="1536" y2="1536" x1="3936" />
        </branch>
        <branch name="rd_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3952" y="1872" type="branch" />
            <wire x2="3952" y1="1872" y2="1872" x1="3936" />
        </branch>
        <branch name="rd_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3952" y="1984" type="branch" />
            <wire x2="3952" y1="1984" y2="1984" x1="3936" />
        </branch>
        <branch name="BUS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="2096" type="branch" />
            <wire x2="3968" y1="2096" y2="2096" x1="3936" />
        </branch>
        <branch name="rd_fifo_wr_data_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="2208" type="branch" />
            <wire x2="3968" y1="2208" y2="2208" x1="3936" />
        </branch>
        <branch name="rd_fifo_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="2320" type="branch" />
            <wire x2="3968" y1="2320" y2="2320" x1="3936" />
        </branch>
        <branch name="m_rdy">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="2416" type="branch" />
            <wire x2="3968" y1="2416" y2="2416" x1="3936" />
        </branch>
        <branch name="abort_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="2400" type="branch" />
            <wire x2="3360" y1="2400" y2="2400" x1="3312" />
        </branch>
        <branch name="s_rdy_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2464" type="branch" />
            <wire x2="3360" y1="2464" y2="2464" x1="3328" />
        </branch>
        <branch name="wr_fifo_empty_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3312" y="1696" type="branch" />
            <wire x2="3360" y1="1696" y2="1696" x1="3312" />
        </branch>
        <branch name="wr_fifo_almost_empty_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="1760" type="branch" />
            <wire x2="3360" y1="1760" y2="1760" x1="3328" />
        </branch>
        <branch name="wr_fifo_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2688" type="branch" />
            <wire x2="3360" y1="2688" y2="2688" x1="3328" />
        </branch>
        <branch name="wr_fifo_almost_empty_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2752" type="branch" />
            <wire x2="3360" y1="2752" y2="2752" x1="3328" />
        </branch>
        <branch name="wr_fifo_rdat_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3328" y="2624" type="branch" />
            <wire x2="3360" y1="2624" y2="2624" x1="3328" />
        </branch>
        <branch name="wr_fifo_rd_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3968" y="2624" type="branch" />
            <wire x2="3968" y1="2624" y2="2624" x1="3936" />
        </branch>
        <branch name="BUS_REQ_W_2_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3296" y="2560" type="branch" />
            <wire x2="3360" y1="2560" y2="2560" x1="3296" />
        </branch>
        <instance x="5472" y="1056" name="XLXI_24" orien="R0">
        </instance>
        <instance x="5472" y="800" name="XLXI_20" orien="R0">
        </instance>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5440" y="640" type="branch" />
            <wire x2="5472" y1="640" y2="640" x1="5440" />
        </branch>
        <branch name="wr_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5440" y="768" type="branch" />
            <wire x2="5472" y1="768" y2="768" x1="5440" />
        </branch>
        <branch name="wr_fifo_empty_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5808" y="640" type="branch" />
            <wire x2="5808" y1="640" y2="640" x1="5792" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5456" y="896" type="branch" />
            <wire x2="5472" y1="896" y2="896" x1="5456" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5456" y="1024" type="branch" />
            <wire x2="5472" y1="1024" y2="1024" x1="5456" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_1">
            <wire x2="5824" y1="896" y2="896" x1="5792" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5440" y="704" type="branch" />
            <wire x2="5472" y1="704" y2="704" x1="5440" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5440" y="960" type="branch" />
            <wire x2="5472" y1="960" y2="960" x1="5440" />
        </branch>
        <instance x="5456" y="1616" name="Aurora_wr_fifo_1" orien="R0">
        </instance>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5392" y="1264" type="branch" />
            <wire x2="5456" y1="1264" y2="1264" x1="5392" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_1">
            <wire x2="5456" y1="1328" y2="1328" x1="5392" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5424" y="1392" type="branch" />
            <wire x2="5456" y1="1392" y2="1392" x1="5424" />
        </branch>
        <branch name="Aurora_wr_fifo_wr_en_1">
            <wire x2="5456" y1="1456" y2="1456" x1="5392" />
        </branch>
        <branch name="Aurora_wr_fifo_din_1(15:0)">
            <wire x2="5456" y1="1584" y2="1584" x1="5376" />
        </branch>
        <branch name="wr_fifo_rdat_1(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5872" y="1584" type="branch" />
            <wire x2="5872" y1="1584" y2="1584" x1="5840" />
        </branch>
        <branch name="wr_fifo_almost_empty_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5872" y="1456" type="branch" />
            <wire x2="5872" y1="1456" y2="1456" x1="5840" />
        </branch>
        <branch name="wr_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5856" y="1392" type="branch" />
            <wire x2="5856" y1="1392" y2="1392" x1="5840" />
        </branch>
        <branch name="Aurora_wr_fifo_full_1">
            <wire x2="5888" y1="1264" y2="1264" x1="5840" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5888" y="1328" type="branch" />
            <wire x2="5888" y1="1328" y2="1328" x1="5840" />
        </branch>
        <instance x="5424" y="2272" name="XLXI_27" orien="R0">
        </instance>
        <instance x="5424" y="2016" name="XLXI_28" orien="R0">
        </instance>
        <branch name="wr_fifo_empty_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5760" y="1856" type="branch" />
            <wire x2="5760" y1="1856" y2="1856" x1="5744" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5408" y="2112" type="branch" />
            <wire x2="5424" y1="2112" y2="2112" x1="5408" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5408" y="2176" type="branch" />
            <wire x2="5424" y1="2176" y2="2176" x1="5408" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_2">
            <wire x2="5776" y1="2112" y2="2112" x1="5744" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5392" y="1856" type="branch" />
            <wire x2="5424" y1="1856" y2="1856" x1="5392" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5392" y="1920" type="branch" />
            <wire x2="5424" y1="1920" y2="1920" x1="5392" />
        </branch>
        <branch name="wr_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5408" y="1984" type="branch" />
            <wire x2="5424" y1="1984" y2="1984" x1="5408" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5392" y="2240" type="branch" />
            <wire x2="5424" y1="2240" y2="2240" x1="5392" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5392" y="2576" type="branch" />
            <wire x2="5408" y1="2576" y2="2576" x1="5392" />
        </branch>
        <branch name="Aurora_wr_fifo_full_2">
            <wire x2="5840" y1="2576" y2="2576" x1="5792" />
        </branch>
        <branch name="wr_fifo_almost_empty_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5840" y="2768" type="branch" />
            <wire x2="5840" y1="2768" y2="2768" x1="5792" />
        </branch>
        <branch name="wr_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5824" y="2704" type="branch" />
            <wire x2="5824" y1="2704" y2="2704" x1="5792" />
        </branch>
        <branch name="Aurora_wr_fifo_almost_full_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5840" y="2640" type="branch" />
            <wire x2="5840" y1="2640" y2="2640" x1="5792" />
        </branch>
        <branch name="wr_fifo_rdat_2(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5824" y="2896" type="branch" />
            <wire x2="5824" y1="2896" y2="2896" x1="5792" />
        </branch>
        <branch name="Aurora_wr_fifo_clk_2">
            <wire x2="5408" y1="2640" y2="2640" x1="5360" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5392" y="2704" type="branch" />
            <wire x2="5408" y1="2704" y2="2704" x1="5392" />
        </branch>
        <branch name="wr_fifo_rd_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5392" y="2832" type="branch" />
            <wire x2="5408" y1="2832" y2="2832" x1="5392" />
        </branch>
        <instance x="5408" y="2928" name="Aurora_wr_fifo_2" orien="R0">
        </instance>
        <branch name="Aurora_wr_fifo_din_2(15:0)">
            <wire x2="5408" y1="2896" y2="2896" x1="5392" />
        </branch>
        <branch name="Aurora_wr_fifo_wr_en_2">
            <wire x2="5408" y1="2768" y2="2768" x1="5376" />
        </branch>
        <iomarker fontsize="28" x="5824" y="896" name="Aurora_wr_fifo_almost_full_1" orien="R0" />
        <iomarker fontsize="28" x="5392" y="1328" name="Aurora_wr_fifo_clk_1" orien="R180" />
        <iomarker fontsize="28" x="5392" y="1456" name="Aurora_wr_fifo_wr_en_1" orien="R180" />
        <iomarker fontsize="28" x="5376" y="1584" name="Aurora_wr_fifo_din_1(15:0)" orien="R180" />
        <iomarker fontsize="28" x="5888" y="1264" name="Aurora_wr_fifo_full_1" orien="R0" />
        <iomarker fontsize="28" x="5776" y="2112" name="Aurora_wr_fifo_almost_full_2" orien="R0" />
        <iomarker fontsize="28" x="5840" y="2576" name="Aurora_wr_fifo_full_2" orien="R0" />
        <iomarker fontsize="28" x="5360" y="2640" name="Aurora_wr_fifo_clk_2" orien="R180" />
        <iomarker fontsize="28" x="5392" y="2896" name="Aurora_wr_fifo_din_2(15:0)" orien="R180" />
        <iomarker fontsize="28" x="5376" y="2768" name="Aurora_wr_fifo_wr_en_2" orien="R180" />
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4288" type="branch" />
            <wire x2="1456" y1="4288" y2="4288" x1="1392" />
        </branch>
        <branch name="BUS_STB">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4352" type="branch" />
            <wire x2="1456" y1="4352" y2="4352" x1="1392" />
        </branch>
        <branch name="BUS_WE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4416" type="branch" />
            <wire x2="1456" y1="4416" y2="4416" x1="1392" />
        </branch>
        <branch name="BUS_ACK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4480" type="branch" />
            <wire x2="1456" y1="4480" y2="4480" x1="1392" />
        </branch>
        <branch name="m_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4544" type="branch" />
            <wire x2="1456" y1="4544" y2="4544" x1="1392" />
        </branch>
        <branch name="abort">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1376" y="4672" type="branch" />
            <wire x2="1456" y1="4672" y2="4672" x1="1376" />
        </branch>
        <branch name="BUS_REQ_W_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4736" type="branch" />
            <wire x2="1456" y1="4736" y2="4736" x1="1392" />
        </branch>
        <branch name="BUS_REQ_R_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4800" type="branch" />
            <wire x2="1456" y1="4800" y2="4800" x1="1392" />
        </branch>
        <branch name="BUS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1376" y="4928" type="branch" />
            <wire x2="1456" y1="4928" y2="4928" x1="1376" />
        </branch>
        <branch name="BUS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1376" y="4992" type="branch" />
            <wire x2="1456" y1="4992" y2="4992" x1="1376" />
        </branch>
        <branch name="BUS_REQ_W_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="5056" type="branch" />
            <wire x2="1456" y1="5056" y2="5056" x1="1392" />
        </branch>
        <branch name="BUS_REQ_R_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1392" y="4864" type="branch" />
            <wire x2="1456" y1="4864" y2="4864" x1="1392" />
        </branch>
        <branch name="s_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1408" y="4608" type="branch" />
            <wire x2="1456" y1="4608" y2="4608" x1="1408" />
        </branch>
        <instance x="1456" y="5024" name="u_Aurora_FPGA_debug" orien="R0">
        </instance>
        <instance x="2976" y="4816" name="u_Aurora_FPGA_iobuf" orien="R0">
        </instance>
        <branch name="BUS_ACK_PAD">
            <wire x2="2976" y1="4272" y2="4272" x1="2928" />
        </branch>
        <branch name="BUS_REQ_W_1_PAD">
            <wire x2="2976" y1="4336" y2="4336" x1="2928" />
        </branch>
        <branch name="BUS_REQ_R_1_PAD">
            <wire x2="2976" y1="4400" y2="4400" x1="2944" />
        </branch>
        <branch name="BUS_REQ_R_2_PAD">
            <wire x2="2976" y1="4464" y2="4464" x1="2944" />
        </branch>
        <branch name="BUS_DAT_O_EN_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2944" y="4528" type="branch" />
            <wire x2="2976" y1="4528" y2="4528" x1="2944" />
        </branch>
        <branch name="BUS_WE_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2944" y="4592" type="branch" />
            <wire x2="2976" y1="4592" y2="4592" x1="2944" />
        </branch>
        <branch name="BUS_STB_PIPE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2944" y="4656" type="branch" />
            <wire x2="2976" y1="4656" y2="4656" x1="2944" />
        </branch>
        <branch name="BUS_DAT_O_PIPE(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2928" y="4784" type="branch" />
            <wire x2="2976" y1="4784" y2="4784" x1="2928" />
        </branch>
        <branch name="BUS_ACK">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="4272" type="branch" />
            <wire x2="3472" y1="4272" y2="4272" x1="3440" />
        </branch>
        <branch name="BUS_REQ_W_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="4336" type="branch" />
            <wire x2="3472" y1="4336" y2="4336" x1="3440" />
        </branch>
        <branch name="BUS_REQ_R_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="4400" type="branch" />
            <wire x2="3472" y1="4400" y2="4400" x1="3440" />
        </branch>
        <branch name="BUS_REQ_R_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="4464" type="branch" />
            <wire x2="3472" y1="4464" y2="4464" x1="3440" />
        </branch>
        <branch name="BUS_WE_PAD">
            <wire x2="3472" y1="4528" y2="4528" x1="3440" />
        </branch>
        <branch name="BUS_STB_PAD">
            <wire x2="3472" y1="4592" y2="4592" x1="3440" />
        </branch>
        <branch name="BUS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="4720" type="branch" />
            <wire x2="3472" y1="4720" y2="4720" x1="3440" />
        </branch>
        <branch name="BUS_AD_PAD(31:0)">
            <wire x2="3472" y1="4784" y2="4784" x1="3440" />
        </branch>
        <branch name="m_rdy_pipe">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2928" y="4848" type="branch" />
            <wire x2="2976" y1="4848" y2="4848" x1="2928" />
        </branch>
        <branch name="BUS_S_RDY">
            <wire x2="2976" y1="4912" y2="4912" x1="2928" />
        </branch>
        <branch name="BUS_ABORT">
            <wire x2="2976" y1="4976" y2="4976" x1="2944" />
        </branch>
        <branch name="abort">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="4912" type="branch" />
            <wire x2="3472" y1="4912" y2="4912" x1="3440" />
        </branch>
        <branch name="s_rdy">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="4976" type="branch" />
            <wire x2="3472" y1="4976" y2="4976" x1="3440" />
        </branch>
        <branch name="BUS_M_RDY">
            <wire x2="3472" y1="5040" y2="5040" x1="3440" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2944" y="5104" type="branch" />
            <wire x2="2976" y1="5104" y2="5104" x1="2944" />
        </branch>
        <branch name="BUS_REQ_W_2_PAD">
            <wire x2="2976" y1="5184" y2="5184" x1="2944" />
        </branch>
        <branch name="BUS_REQ_W_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3472" y="5104" type="branch" />
            <wire x2="3472" y1="5104" y2="5104" x1="3440" />
        </branch>
        <iomarker fontsize="28" x="2928" y="4272" name="BUS_ACK_PAD" orien="R180" />
        <iomarker fontsize="28" x="2928" y="4336" name="BUS_REQ_W_1_PAD" orien="R180" />
        <iomarker fontsize="28" x="2944" y="4400" name="BUS_REQ_R_1_PAD" orien="R180" />
        <iomarker fontsize="28" x="2944" y="4464" name="BUS_REQ_R_2_PAD" orien="R180" />
        <iomarker fontsize="28" x="3472" y="4528" name="BUS_WE_PAD" orien="R0" />
        <iomarker fontsize="28" x="3472" y="4592" name="BUS_STB_PAD" orien="R0" />
        <iomarker fontsize="28" x="3472" y="4784" name="BUS_AD_PAD(31:0)" orien="R0" />
        <iomarker fontsize="28" x="2928" y="4912" name="BUS_S_RDY" orien="R180" />
        <iomarker fontsize="28" x="2944" y="4976" name="BUS_ABORT" orien="R180" />
        <iomarker fontsize="28" x="3472" y="5040" name="BUS_M_RDY" orien="R0" />
        <iomarker fontsize="28" x="2944" y="5184" name="BUS_REQ_W_2_PAD" orien="R180" />
        <branch name="control2(35:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1856" y="4352" type="branch" />
            <wire x2="1856" y1="4352" y2="4352" x1="1840" />
        </branch>
        <branch name="control1(35:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1856" y="4288" type="branch" />
            <wire x2="1856" y1="4288" y2="4288" x1="1840" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3072" type="branch" />
            <wire x2="3408" y1="3072" y2="3072" x1="3376" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3136" type="branch" />
            <wire x2="3408" y1="3136" y2="3136" x1="3376" />
        </branch>
        <branch name="BUS_ACK">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3360" y="3200" type="branch" />
            <wire x2="3408" y1="3200" y2="3200" x1="3360" />
        </branch>
        <branch name="BUS_REQ_W_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3360" y="3264" type="branch" />
            <wire x2="3408" y1="3264" y2="3264" x1="3360" />
        </branch>
        <branch name="BUS_REQ_W_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3328" type="branch" />
            <wire x2="3408" y1="3328" y2="3328" x1="3376" />
        </branch>
        <branch name="BUS_REQ_R_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3392" type="branch" />
            <wire x2="3408" y1="3392" y2="3392" x1="3376" />
        </branch>
        <branch name="BUS_REQ_R_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3392" y="3456" type="branch" />
            <wire x2="3408" y1="3456" y2="3456" x1="3392" />
        </branch>
        <branch name="s_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3520" type="branch" />
            <wire x2="3408" y1="3520" y2="3520" x1="3376" />
        </branch>
        <branch name="abort">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3584" type="branch" />
            <wire x2="3408" y1="3584" y2="3584" x1="3376" />
        </branch>
        <branch name="BUS_DAT_I(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3648" type="branch" />
            <wire x2="3408" y1="3648" y2="3648" x1="3376" />
        </branch>
        <branch name="BUS_ACK_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3904" y="3072" type="branch" />
            <wire x2="3904" y1="3072" y2="3072" x1="3856" />
        </branch>
        <branch name="BUS_REQ_W_1_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="3168" type="branch" />
            <wire x2="3888" y1="3168" y2="3168" x1="3856" />
        </branch>
        <branch name="BUS_REQ_W_2_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="3264" type="branch" />
            <wire x2="3888" y1="3264" y2="3264" x1="3856" />
        </branch>
        <branch name="BUS_REQ_R_1_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="3360" type="branch" />
            <wire x2="3888" y1="3360" y2="3360" x1="3856" />
        </branch>
        <branch name="BUS_REQ_R_2_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="3456" type="branch" />
            <wire x2="3888" y1="3456" y2="3456" x1="3856" />
        </branch>
        <branch name="s_rdy_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3872" y="3552" type="branch" />
            <wire x2="3872" y1="3552" y2="3552" x1="3856" />
        </branch>
        <branch name="BUS_DAT_I_PIPE(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3904" y="3648" type="branch" />
            <wire x2="3904" y1="3648" y2="3648" x1="3856" />
        </branch>
        <instance x="3408" y="3680" name="u_bus_master_pipeline" orien="R0">
        </instance>
        <branch name="abort_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="3712" type="branch" />
            <wire x2="3888" y1="3712" y2="3712" x1="3856" />
        </branch>
        <branch name="BUS_DAT_O_EN">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3392" y="3712" type="branch" />
            <wire x2="3408" y1="3712" y2="3712" x1="3392" />
        </branch>
        <branch name="BUS_STB">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3776" type="branch" />
            <wire x2="3408" y1="3776" y2="3776" x1="3376" />
        </branch>
        <branch name="BUS_WE">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3392" y="3840" type="branch" />
            <wire x2="3408" y1="3840" y2="3840" x1="3392" />
        </branch>
        <branch name="m_rdy">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3360" y="3904" type="branch" />
            <wire x2="3408" y1="3904" y2="3904" x1="3360" />
        </branch>
        <branch name="BUS_DAT_O(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="3376" y="3968" type="branch" />
            <wire x2="3408" y1="3968" y2="3968" x1="3376" />
        </branch>
        <branch name="BUS_DAT_O_EN_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3872" y="3776" type="branch" />
            <wire x2="3872" y1="3776" y2="3776" x1="3856" />
        </branch>
        <branch name="BUS_STB_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3872" y="3840" type="branch" />
            <wire x2="3872" y1="3840" y2="3840" x1="3856" />
        </branch>
        <branch name="BUS_WE_PIPE">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="3904" type="branch" />
            <wire x2="3888" y1="3904" y2="3904" x1="3856" />
        </branch>
        <branch name="m_rdy_pipe">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="3968" type="branch" />
            <wire x2="3888" y1="3968" y2="3968" x1="3856" />
        </branch>
        <branch name="BUS_DAT_O_PIPE(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="3888" y="4032" type="branch" />
            <wire x2="3888" y1="4032" y2="4032" x1="3856" />
        </branch>
        <instance x="4656" y="3840" name="Aurora_rd_fifo_1" orien="R0">
        </instance>
        <branch name="rd_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4624" y="3568" type="branch" />
            <wire x2="4656" y1="3568" y2="3568" x1="4624" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4608" y="3344" type="branch" />
            <wire x2="4656" y1="3344" y2="3344" x1="4608" />
        </branch>
        <branch name="Aurora_rd_fifo_clk_1">
            <wire x2="4656" y1="3456" y2="3456" x1="4640" />
        </branch>
        <branch name="Aurora_rd_fifo_rd_en_1">
            <wire x2="4656" y1="3680" y2="3680" x1="4640" />
        </branch>
        <branch name="Aurora_rd_fifo_almost_empty_1">
            <wire x2="5136" y1="3424" y2="3424" x1="5104" />
        </branch>
        <branch name="Aurora_rd_fifo_prog_empty_1">
            <wire x2="5136" y1="3616" y2="3616" x1="5104" />
        </branch>
        <branch name="Aurora_rd_fifo_dout_1(31:0)">
            <wire x2="5136" y1="3680" y2="3680" x1="5104" />
        </branch>
        <branch name="rd_fifo_wr_data_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4592" y="3792" type="branch" />
            <wire x2="4656" y1="3792" y2="3792" x1="4592" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4624" y="3232" type="branch" />
            <wire x2="4656" y1="3232" y2="3232" x1="4624" />
        </branch>
        <instance x="4720" y="4128" name="XLXI_31" orien="R0">
        </instance>
        <instance x="4720" y="4368" name="XLXI_32" orien="R0">
        </instance>
        <branch name="Aurora_rd_fifo_clk_1">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4688" y="3968" type="branch" />
            <wire x2="4720" y1="3968" y2="3968" x1="4688" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4688" y="4032" type="branch" />
            <wire x2="4720" y1="4032" y2="4032" x1="4688" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4688" y="4208" type="branch" />
            <wire x2="4720" y1="4208" y2="4208" x1="4688" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4704" y="4272" type="branch" />
            <wire x2="4720" y1="4272" y2="4272" x1="4704" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4688" y="4096" type="branch" />
            <wire x2="4720" y1="4096" y2="4096" x1="4688" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5120" y="3360" type="branch" />
            <wire x2="5120" y1="3360" y2="3360" x1="5104" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_1">
            <wire x2="5072" y1="3968" y2="3968" x1="5040" />
        </branch>
        <branch name="rd_fifo_prog_full_1">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5072" y="4208" type="branch" />
            <wire x2="5072" y1="4208" y2="4208" x1="5040" />
        </branch>
        <branch name="rd_fifo_prog_full_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4704" y="4336" type="branch" />
            <wire x2="4720" y1="4336" y2="4336" x1="4704" />
        </branch>
        <branch name="rd_fifo_prog_full_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="5136" y="3552" type="branch" />
            <wire x2="5136" y1="3552" y2="3552" x1="5104" />
        </branch>
        <iomarker fontsize="28" x="4640" y="3456" name="Aurora_rd_fifo_clk_1" orien="R180" />
        <iomarker fontsize="28" x="4640" y="3680" name="Aurora_rd_fifo_rd_en_1" orien="R180" />
        <iomarker fontsize="28" x="5136" y="3424" name="Aurora_rd_fifo_almost_empty_1" orien="R0" />
        <iomarker fontsize="28" x="5136" y="3616" name="Aurora_rd_fifo_prog_empty_1" orien="R0" />
        <iomarker fontsize="28" x="5136" y="3680" name="Aurora_rd_fifo_dout_1(31:0)" orien="R0" />
        <iomarker fontsize="28" x="5072" y="3968" name="Aurora_rd_fifo_empty_1" orien="R0" />
        <branch name="rd_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5968" y="3568" type="branch" />
            <wire x2="6016" y1="3568" y2="3568" x1="5968" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5984" y="3344" type="branch" />
            <wire x2="6016" y1="3344" y2="3344" x1="5984" />
        </branch>
        <branch name="Aurora_rd_fifo_clk_2">
            <wire x2="6016" y1="3456" y2="3456" x1="6000" />
        </branch>
        <branch name="Aurora_rd_fifo_rd_en_2">
            <wire x2="6016" y1="3680" y2="3680" x1="5968" />
        </branch>
        <branch name="Aurora_rd_fifo_almost_empty_2">
            <wire x2="6512" y1="3424" y2="3424" x1="6464" />
        </branch>
        <branch name="Aurora_rd_fifo_prog_empty_2">
            <wire x2="6496" y1="3616" y2="3616" x1="6464" />
        </branch>
        <branch name="Aurora_rd_fifo_dout_2(31:0)">
            <wire x2="6496" y1="3680" y2="3680" x1="6464" />
        </branch>
        <branch name="rd_fifo_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5968" y="3792" type="branch" />
            <wire x2="6016" y1="3792" y2="3792" x1="5968" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="5984" y="3232" type="branch" />
            <wire x2="6016" y1="3232" y2="3232" x1="5984" />
        </branch>
        <instance x="6064" y="4176" name="XLXI_33" orien="R0">
        </instance>
        <instance x="6064" y="4416" name="XLXI_34" orien="R0">
        </instance>
        <branch name="Aurora_rd_fifo_clk_2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6032" y="4016" type="branch" />
            <wire x2="6064" y1="4016" y2="4016" x1="6032" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6032" y="4080" type="branch" />
            <wire x2="6064" y1="4080" y2="4080" x1="6032" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6032" y="4320" type="branch" />
            <wire x2="6064" y1="4320" y2="4320" x1="6032" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6032" y="4256" type="branch" />
            <wire x2="6064" y1="4256" y2="4256" x1="6032" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6032" y="4144" type="branch" />
            <wire x2="6064" y1="4144" y2="4144" x1="6032" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6512" y="3360" type="branch" />
            <wire x2="6512" y1="3360" y2="3360" x1="6464" />
        </branch>
        <branch name="rd_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6416" y="4256" type="branch" />
            <wire x2="6416" y1="4256" y2="4256" x1="6384" />
        </branch>
        <branch name="rd_fifo_prog_full_2_in">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="6032" y="4384" type="branch" />
            <wire x2="6064" y1="4384" y2="4384" x1="6032" />
        </branch>
        <branch name="rd_fifo_prog_full_2_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="6496" y="3552" type="branch" />
            <wire x2="6496" y1="3552" y2="3552" x1="6464" />
        </branch>
        <instance x="6016" y="3840" name="Aurora_rd_fifo_2" orien="R0">
        </instance>
        <branch name="Aurora_rd_fifo_empty_2">
            <wire x2="6416" y1="4016" y2="4016" x1="6384" />
        </branch>
        <iomarker fontsize="28" x="6000" y="3456" name="Aurora_rd_fifo_clk_2" orien="R180" />
        <iomarker fontsize="28" x="5968" y="3680" name="Aurora_rd_fifo_rd_en_2" orien="R180" />
        <iomarker fontsize="28" x="6512" y="3424" name="Aurora_rd_fifo_almost_empty_2" orien="R0" />
        <iomarker fontsize="28" x="6496" y="3616" name="Aurora_rd_fifo_prog_empty_2" orien="R0" />
        <iomarker fontsize="28" x="6496" y="3680" name="Aurora_rd_fifo_dout_2(31:0)" orien="R0" />
        <iomarker fontsize="28" x="6416" y="4016" name="Aurora_rd_fifo_empty_2" orien="R0" />
        <instance x="4432" y="4832" name="XLXI_18" orien="R0" />
        <instance x="4432" y="5184" name="XLXI_19" orien="R0" />
        <branch name="rst_channel_0">
            <wire x2="4432" y1="4704" y2="4704" x1="4400" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4384" y="4768" type="branch" />
            <wire x2="4432" y1="4768" y2="4768" x1="4384" />
        </branch>
        <branch name="rst_channel_0_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4720" y="4736" type="branch" />
            <wire x2="4720" y1="4736" y2="4736" x1="4688" />
        </branch>
        <branch name="rst_channel_1">
            <wire x2="4432" y1="5056" y2="5056" x1="4384" />
        </branch>
        <branch name="wb_rst">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="4400" y="5120" type="branch" />
            <wire x2="4432" y1="5120" y2="5120" x1="4400" />
        </branch>
        <branch name="rst_channel_1_in">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="4736" y="5088" type="branch" />
            <wire x2="4736" y1="5088" y2="5088" x1="4688" />
        </branch>
        <iomarker fontsize="28" x="4400" y="4704" name="rst_channel_0" orien="R180" />
        <iomarker fontsize="28" x="4384" y="5056" name="rst_channel_1" orien="R180" />
        <instance x="400" y="784" name="XLXI_70" orien="R0">
        </instance>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="384" y="304" type="branch" />
            <wire x2="400" y1="304" y2="304" x1="384" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="368" y="368" type="branch" />
            <wire x2="400" y1="368" y2="368" x1="368" />
        </branch>
        <branch name="Aurora_wr_fifo_full_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="432" type="branch" />
            <wire x2="400" y1="432" y2="432" x1="384" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="496" type="branch" />
            <wire x2="400" y1="496" y2="496" x1="384" />
        </branch>
        <branch name="Aurora_wr_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="560" type="branch" />
            <wire x2="400" y1="560" y2="560" x1="384" />
        </branch>
        <branch name="Aurora_rd_fifo_rd_en_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="624" type="branch" />
            <wire x2="400" y1="624" y2="624" x1="384" />
        </branch>
        <branch name="Aurora_wr_fifo_din_1(15:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="688" type="branch" />
            <wire x2="400" y1="688" y2="688" x1="384" />
        </branch>
        <branch name="Aurora_rd_fifo_dout_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="752" type="branch" />
            <wire x2="400" y1="752" y2="752" x1="384" />
        </branch>
        <instance x="1472" y="768" name="XLXI_16" orien="R0">
        </instance>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1456" y="352" type="branch" />
            <wire x2="1472" y1="352" y2="352" x1="1456" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1424" y="288" type="branch" />
            <wire x2="1472" y1="288" y2="288" x1="1424" />
        </branch>
        <branch name="rd_fifo_prog_full_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="416" type="branch" />
            <wire x2="1472" y1="416" y2="416" x1="1456" />
        </branch>
        <branch name="wr_fifo_empty_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="480" type="branch" />
            <wire x2="1472" y1="480" y2="480" x1="1456" />
        </branch>
        <branch name="wr_fifo_rd_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="608" type="branch" />
            <wire x2="1472" y1="608" y2="608" x1="1456" />
        </branch>
        <branch name="rd_fifo_wr_data_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="672" type="branch" />
            <wire x2="1472" y1="672" y2="672" x1="1456" />
        </branch>
        <branch name="wr_fifo_rdat_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="736" type="branch" />
            <wire x2="1472" y1="736" y2="736" x1="1456" />
        </branch>
        <instance x="400" y="1600" name="XLXI_87" orien="R0">
        </instance>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="384" y="1120" type="branch" />
            <wire x2="400" y1="1120" y2="1120" x1="384" />
        </branch>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="368" y="1184" type="branch" />
            <wire x2="400" y1="1184" y2="1184" x1="368" />
        </branch>
        <branch name="Aurora_wr_fifo_full_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="1248" type="branch" />
            <wire x2="400" y1="1248" y2="1248" x1="384" />
        </branch>
        <branch name="Aurora_rd_fifo_empty_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="1312" type="branch" />
            <wire x2="400" y1="1312" y2="1312" x1="384" />
        </branch>
        <branch name="Aurora_wr_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="1376" type="branch" />
            <wire x2="400" y1="1376" y2="1376" x1="384" />
        </branch>
        <branch name="Aurora_rd_fifo_rd_en_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="1440" type="branch" />
            <wire x2="400" y1="1440" y2="1440" x1="384" />
        </branch>
        <branch name="Aurora_wr_fifo_din_2(15:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="1504" type="branch" />
            <wire x2="400" y1="1504" y2="1504" x1="384" />
        </branch>
        <branch name="Aurora_rd_fifo_dout_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="384" y="1568" type="branch" />
            <wire x2="400" y1="1568" y2="1568" x1="384" />
        </branch>
        <instance x="1472" y="1616" name="XLXI_86" orien="R0">
        </instance>
        <branch name="wb_rst_delay">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1456" y="1200" type="branch" />
            <wire x2="1472" y1="1200" y2="1200" x1="1456" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1424" y="1136" type="branch" />
            <wire x2="1472" y1="1136" y2="1136" x1="1424" />
        </branch>
        <branch name="rd_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1264" type="branch" />
            <wire x2="1472" y1="1264" y2="1264" x1="1456" />
        </branch>
        <branch name="wr_fifo_empty_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1328" type="branch" />
            <wire x2="1472" y1="1328" y2="1328" x1="1456" />
        </branch>
        <branch name="rd_fifo_wr_en_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1392" type="branch" />
            <wire x2="1472" y1="1392" y2="1392" x1="1456" />
        </branch>
        <branch name="wr_fifo_rd_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1456" type="branch" />
            <wire x2="1472" y1="1456" y2="1456" x1="1456" />
        </branch>
        <branch name="rd_fifo_wr_data_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1520" type="branch" />
            <wire x2="1472" y1="1520" y2="1520" x1="1456" />
        </branch>
        <branch name="wr_fifo_rdat_2(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="1584" type="branch" />
            <wire x2="1472" y1="1584" y2="1584" x1="1456" />
        </branch>
        <text x="2128" y="1136">Control1</text>
        <text x="1056" y="1124">Control2</text>
        <text x="872" y="336">Control2</text>
        <text x="1936" y="316">Control1</text>
        <instance x="320" y="2272" name="CHK_SUM_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="64" y="16" type="instance" />
        </instance>
        <branch name="control4(35:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="928" y="1920" type="branch" />
            <wire x2="928" y1="1920" y2="1920" x1="912" />
        </branch>
        <branch name="wb_clk_2x">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="304" y="1920" type="branch" />
            <wire x2="320" y1="1920" y2="1920" x1="304" />
        </branch>
        <branch name="wr_fifo_rd_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="304" y="2080" type="branch" />
            <wire x2="320" y1="2080" y2="2080" x1="304" />
        </branch>
        <branch name="wr_fifo_rdat_1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="304" y="2240" type="branch" />
            <wire x2="320" y1="2240" y2="2240" x1="304" />
        </branch>
        <branch name="control3(35:0)">
            <wire x2="1872" y1="4416" y2="4416" x1="1840" />
        </branch>
        <branch name="control4(35:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1856" y="4480" type="branch" />
            <wire x2="1856" y1="4480" y2="4480" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="1872" y="4416" name="control3(35:0)" orien="R0" />
        <branch name="wr_fifo_rd_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="5440" y="1520" type="branch" />
            <wire x2="5456" y1="1520" y2="1520" x1="5440" />
        </branch>
        <branch name="rd_fifo_wr_en_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1456" y="544" type="branch" />
            <wire x2="1472" y1="544" y2="544" x1="1456" />
        </branch>
        <branch name="wr_fifo_prog_full_1">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="5856" y="1648" type="branch" />
            <wire x2="5856" y1="1648" y2="1648" x1="5840" />
        </branch>
        <instance x="4656" y="2288" name="XLXI_88" orien="R0" />
        <branch name="cPCI_RDY_1">
            <wire x2="4928" y1="2192" y2="2192" x1="4912" />
        </branch>
        <branch name="fifo_read_override_1">
            <wire x2="4656" y1="2224" y2="2224" x1="4624" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="4656" y1="2160" y2="2160" x1="4624" />
        </branch>
        <instance x="4400" y="2192" name="XLXI_98" orien="R0" />
        <branch name="wr_fifo_prog_full_1">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="4384" y="2160" type="branch" />
            <wire x2="4400" y1="2160" y2="2160" x1="4384" />
        </branch>
        <iomarker fontsize="28" x="4928" y="2192" name="cPCI_RDY_1" orien="R0" />
        <iomarker fontsize="28" x="4624" y="2224" name="fifo_read_override_1" orien="R180" />
        <branch name="cPCI_RDY_2">
            <wire x2="4928" y1="2368" y2="2368" x1="4912" />
        </branch>
        <instance x="4656" y="2464" name="XLXI_94" orien="R0" />
        <branch name="fifo_read_override_2">
            <wire x2="4656" y1="2400" y2="2400" x1="4624" />
        </branch>
        <iomarker fontsize="28" x="4928" y="2368" name="cPCI_RDY_2" orien="R0" />
        <iomarker fontsize="28" x="4624" y="2400" name="fifo_read_override_2" orien="R180" />
        <branch name="XLXN_45">
            <wire x2="4656" y1="2336" y2="2336" x1="4624" />
        </branch>
        <instance x="4400" y="2368" name="XLXI_112" orien="R0" />
        <branch name="wr_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="4384" y="2336" type="branch" />
            <wire x2="4400" y1="2336" y2="2336" x1="4384" />
        </branch>
        <branch name="wr_fifo_prog_full_2">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="5808" y="2960" type="branch" />
            <wire x2="5808" y1="2960" y2="2960" x1="5792" />
        </branch>
        <branch name="control2(35:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="864" y="304" type="branch" />
            <wire x2="864" y1="304" y2="304" x1="848" />
        </branch>
        <branch name="control1(35:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="288" type="branch" />
            <wire x2="1936" y1="288" y2="288" x1="1920" />
        </branch>
    </sheet>
</drawing>