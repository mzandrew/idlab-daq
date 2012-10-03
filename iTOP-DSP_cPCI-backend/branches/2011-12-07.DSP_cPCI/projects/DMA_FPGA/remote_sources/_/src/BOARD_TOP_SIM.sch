<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="PCI_SERR" />
        <signal name="bus_we_A" />
        <signal name="bus_stb_A" />
        <signal name="bus_ad_A(31:0)" />
        <signal name="bus_ack_A" />
        <signal name="bus_req_w_A" />
        <signal name="bus_req_r_1_A" />
        <signal name="bus_req_r_2_A" />
        <signal name="bus_clk_A" />
        <signal name="bus_we_B" />
        <signal name="bus_stb_B" />
        <signal name="bus_ad_B(31:0)" />
        <signal name="bus_ack_B" />
        <signal name="bus_req_w_B" />
        <signal name="bus_req_r_1_B" />
        <signal name="bus_req_r_2_B" />
        <signal name="bus_clk_B" />
        <signal name="BOARD_IDENT(5)" />
        <signal name="BOARD_IDENT(4)" />
        <signal name="BOARD_IDENT(3)" />
        <signal name="BOARD_IDENT(2)" />
        <signal name="BOARD_IDENT(1)" />
        <signal name="BOARD_IDENT(0)" />
        <signal name="bus_m_rdy_pad_A" />
        <signal name="bus_m_rdy_pad_B" />
        <signal name="bus_s_rdy_pad_A" />
        <signal name="bus_s_rdy_pad_B" />
        <signal name="bus_abort_pad_A" />
        <signal name="bus_abort_pad_B" />
        <signal name="PCI_REQ" />
        <signal name="PCI_INTA" />
        <signal name="PCLK" />
        <signal name="BOARD_IDENT(5:0)" />
        <signal name="PCI_IDSEL" />
        <signal name="PCI_GNT" />
        <signal name="PCI_RST" />
        <signal name="PCI_FRAME" />
        <signal name="PCI_IRDY" />
        <signal name="PCI_DEVSEL" />
        <signal name="PCI_TRDY" />
        <signal name="PCI_STOP" />
        <signal name="PCI_PAR" />
        <signal name="PCI_PERR" />
        <signal name="PCI_AD(31:0)" />
        <signal name="PCI_CBE(3:0)" />
        <port polarity="Output" name="PCI_SERR" />
        <port polarity="Output" name="PCI_REQ" />
        <port polarity="Output" name="PCI_INTA" />
        <port polarity="Input" name="PCLK" />
        <port polarity="Input" name="PCI_IDSEL" />
        <port polarity="Input" name="PCI_GNT" />
        <port polarity="Input" name="PCI_RST" />
        <port polarity="BiDirectional" name="PCI_FRAME" />
        <port polarity="BiDirectional" name="PCI_IRDY" />
        <port polarity="BiDirectional" name="PCI_DEVSEL" />
        <port polarity="BiDirectional" name="PCI_TRDY" />
        <port polarity="BiDirectional" name="PCI_STOP" />
        <port polarity="BiDirectional" name="PCI_PAR" />
        <port polarity="BiDirectional" name="PCI_PERR" />
        <port polarity="BiDirectional" name="PCI_AD(31:0)" />
        <port polarity="BiDirectional" name="PCI_CBE(3:0)" />
        <blockdef name="DMA_FPGA">
            <timestamp>2011-6-12T7:25:0</timestamp>
            <rect width="480" x="64" y="-1792" height="1792" />
            <line x2="0" y1="-1760" y2="-1760" x1="64" />
            <line x2="0" y1="-1600" y2="-1600" x1="64" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <rect width="64" x="0" y="-1292" height="24" />
            <line x2="0" y1="-1280" y2="-1280" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-960" y2="-960" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="608" y1="-1760" y2="-1760" x1="544" />
            <line x2="608" y1="-1696" y2="-1696" x1="544" />
            <line x2="608" y1="-1632" y2="-1632" x1="544" />
            <line x2="608" y1="-1568" y2="-1568" x1="544" />
            <line x2="608" y1="-1504" y2="-1504" x1="544" />
            <line x2="608" y1="-1440" y2="-1440" x1="544" />
            <line x2="608" y1="-1376" y2="-1376" x1="544" />
            <line x2="608" y1="-1248" y2="-1248" x1="544" />
            <line x2="608" y1="-1184" y2="-1184" x1="544" />
            <line x2="608" y1="-1120" y2="-1120" x1="544" />
            <line x2="608" y1="-1056" y2="-1056" x1="544" />
            <line x2="608" y1="-992" y2="-992" x1="544" />
            <line x2="608" y1="-928" y2="-928" x1="544" />
            <line x2="608" y1="-864" y2="-864" x1="544" />
            <line x2="608" y1="-800" y2="-800" x1="544" />
            <line x2="608" y1="-736" y2="-736" x1="544" />
            <line x2="608" y1="-672" y2="-672" x1="544" />
            <line x2="608" y1="-608" y2="-608" x1="544" />
            <line x2="608" y1="-544" y2="-544" x1="544" />
            <line x2="608" y1="-480" y2="-480" x1="544" />
            <line x2="608" y1="-416" y2="-416" x1="544" />
            <line x2="608" y1="-352" y2="-352" x1="544" />
            <line x2="608" y1="-288" y2="-288" x1="544" />
            <rect width="64" x="544" y="-236" height="24" />
            <line x2="608" y1="-224" y2="-224" x1="544" />
            <rect width="64" x="544" y="-172" height="24" />
            <line x2="608" y1="-160" y2="-160" x1="544" />
            <rect width="64" x="544" y="-108" height="24" />
            <line x2="608" y1="-96" y2="-96" x1="544" />
            <rect width="64" x="544" y="-44" height="24" />
            <line x2="608" y1="-32" y2="-32" x1="544" />
            <line x2="608" y1="-1312" y2="-1312" x1="544" />
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
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="Aurora_FPGA">
            <timestamp>2011-6-12T7:6:32</timestamp>
            <rect width="448" x="64" y="-320" height="512" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="576" y1="-288" y2="-288" x1="512" />
            <line x2="576" y1="-208" y2="-208" x1="512" />
            <rect width="64" x="512" y="-60" height="24" />
            <line x2="576" y1="-48" y2="-48" x1="512" />
            <line x2="64" y1="32" y2="32" x1="0" />
            <line x2="64" y1="96" y2="96" x1="0" />
            <line x2="512" y1="32" y2="32" x1="576" />
        </blockdef>
        <block symbolname="Aurora_FPGA" name="u_Aurora_FPGA_B">
            <blockpin signalname="bus_ack_B" name="BUS_ACK_PAD" />
            <blockpin signalname="bus_req_w_B" name="BUS_REQ_W_PAD" />
            <blockpin signalname="bus_req_r_1_B" name="BUS_REQ_R_1_PAD" />
            <blockpin signalname="bus_req_r_2_B" name="BUS_REQ_R_2_PAD" />
            <blockpin signalname="bus_clk_B" name="WB_CLK_2x_PAD" />
            <blockpin signalname="bus_we_B" name="BUS_WE_PAD" />
            <blockpin signalname="bus_stb_B" name="BUS_STB_PAD" />
            <blockpin signalname="bus_ad_B(31:0)" name="BUS_AD_PAD(31:0)" />
            <blockpin signalname="bus_s_rdy_pad_B" name="BUS_S_RDY" />
            <blockpin signalname="bus_abort_pad_B" name="BUS_ABORT" />
            <blockpin signalname="bus_m_rdy_pad_B" name="BUS_M_RDY" />
        </block>
        <block symbolname="Aurora_FPGA" name="u_Aurora_FPGA_A">
            <blockpin signalname="bus_ack_A" name="BUS_ACK_PAD" />
            <blockpin signalname="bus_req_w_A" name="BUS_REQ_W_PAD" />
            <blockpin signalname="bus_req_r_1_A" name="BUS_REQ_R_1_PAD" />
            <blockpin signalname="bus_req_r_2_A" name="BUS_REQ_R_2_PAD" />
            <blockpin signalname="bus_clk_A" name="WB_CLK_2x_PAD" />
            <blockpin signalname="bus_we_A" name="BUS_WE_PAD" />
            <blockpin signalname="bus_stb_A" name="BUS_STB_PAD" />
            <blockpin signalname="bus_ad_A(31:0)" name="BUS_AD_PAD(31:0)" />
            <blockpin signalname="bus_s_rdy_pad_A" name="BUS_S_RDY" />
            <blockpin signalname="bus_abort_pad_A" name="BUS_ABORT" />
            <blockpin signalname="bus_m_rdy_pad_A" name="BUS_M_RDY" />
        </block>
        <block symbolname="vcc" name="XLXI_3">
            <blockpin signalname="BOARD_IDENT(4)" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_4">
            <blockpin signalname="BOARD_IDENT(2)" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_5">
            <blockpin signalname="BOARD_IDENT(0)" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="BOARD_IDENT(3)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="BOARD_IDENT(1)" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_2">
            <blockpin signalname="BOARD_IDENT(5)" name="G" />
        </block>
        <block symbolname="DMA_FPGA" name="u_DMA_FPGA">
            <blockpin signalname="PCI_RST" name="PCI_RST" />
            <blockpin signalname="PCI_GNT" name="PCI_GNT" />
            <blockpin signalname="PCI_IDSEL" name="PCI_IDSEL" />
            <blockpin signalname="BOARD_IDENT(5:0)" name="BOARD_IDENT(5:0)" />
            <blockpin signalname="PCLK" name="PCLK" />
            <blockpin signalname="bus_stb_B" name="BUS_STB_PAD_B" />
            <blockpin signalname="bus_we_B" name="BUS_WE_PAD_B" />
            <blockpin signalname="bus_m_rdy_pad_B" name="BUS_M_RDY_PAD_B" />
            <blockpin signalname="bus_stb_A" name="BUS_STB_PAD_A" />
            <blockpin signalname="bus_we_A" name="BUS_WE_PAD_A" />
            <blockpin signalname="bus_m_rdy_pad_A" name="BUS_M_RDY_PAD_A" />
            <blockpin signalname="PCI_INTA" name="PCI_INTA" />
            <blockpin signalname="PCI_REQ" name="PCI_REQ" />
            <blockpin signalname="PCI_SERR" name="PCI_SERR" />
            <blockpin signalname="bus_ack_B" name="BUS_ACK_PAD_B" />
            <blockpin signalname="bus_req_w_B" name="BUS_REQ_W_PAD_B" />
            <blockpin signalname="bus_clk_B" name="CLOCK_PAD_B" />
            <blockpin signalname="bus_req_r_1_B" name="BUS_REQ_R_1_PAD_B" />
            <blockpin signalname="bus_s_rdy_pad_B" name="BUS_S_RDY_PAD_B" />
            <blockpin signalname="bus_abort_pad_B" name="BUS_ABORT_PAD_B" />
            <blockpin signalname="bus_ack_A" name="BUS_ACK_PAD_A" />
            <blockpin signalname="bus_req_w_A" name="BUS_REQ_W_PAD_A" />
            <blockpin signalname="bus_clk_A" name="CLOCK_PAD_A" />
            <blockpin signalname="bus_req_r_1_A" name="BUS_REQ_R_1_PAD_A" />
            <blockpin signalname="bus_req_r_2_A" name="BUS_REQ_R_2_PAD_A" />
            <blockpin signalname="bus_s_rdy_pad_A" name="BUS_S_RDY_PAD_A" />
            <blockpin signalname="bus_abort_pad_A" name="BUS_ABORT_PAD_A" />
            <blockpin signalname="PCI_FRAME" name="PCI_FRAME" />
            <blockpin signalname="PCI_IRDY" name="PCI_IRDY" />
            <blockpin signalname="PCI_DEVSEL" name="PCI_DEVSEL" />
            <blockpin signalname="PCI_TRDY" name="PCI_TRDY" />
            <blockpin signalname="PCI_STOP" name="PCI_STOP" />
            <blockpin signalname="PCI_PAR" name="PCI_PAR" />
            <blockpin signalname="PCI_PERR" name="PCI_PERR" />
            <blockpin signalname="PCI_AD(31:0)" name="PCI_AD(31:0)" />
            <blockpin signalname="PCI_CBE(3:0)" name="PCI_CBE(3:0)" />
            <blockpin signalname="bus_ad_B(31:0)" name="BUS_AD_PAD_B(31:0)" />
            <blockpin signalname="bus_ad_A(31:0)" name="BUS_AD_PAD_A(31:0)" />
            <blockpin signalname="bus_req_r_2_B" name="BUS_REQ_R_2_PAD_B" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="512" y="1888" name="u_Aurora_FPGA_B" orien="R0">
        </instance>
        <branch name="bus_we_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1104" y="1600" type="branch" />
            <wire x2="1104" y1="1600" y2="1600" x1="1088" />
        </branch>
        <branch name="bus_stb_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1104" y="1680" type="branch" />
            <wire x2="1104" y1="1680" y2="1680" x1="1088" />
        </branch>
        <branch name="bus_ad_B(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1120" y="1840" type="branch" />
            <wire x2="1120" y1="1840" y2="1840" x1="1088" />
        </branch>
        <branch name="bus_ack_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="480" y="1600" type="branch" />
            <wire x2="512" y1="1600" y2="1600" x1="480" />
        </branch>
        <branch name="bus_req_w_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="1664" type="branch" />
            <wire x2="512" y1="1664" y2="1664" x1="496" />
        </branch>
        <branch name="bus_req_r_1_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="1728" type="branch" />
            <wire x2="512" y1="1728" y2="1728" x1="496" />
        </branch>
        <branch name="bus_req_r_2_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="1792" type="branch" />
            <wire x2="512" y1="1792" y2="1792" x1="496" />
        </branch>
        <branch name="bus_clk_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="1856" type="branch" />
            <wire x2="512" y1="1856" y2="1856" x1="496" />
        </branch>
        <instance x="528" y="896" name="u_Aurora_FPGA_A" orien="R0">
        </instance>
        <branch name="bus_we_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1136" y="608" type="branch" />
            <wire x2="1136" y1="608" y2="608" x1="1104" />
        </branch>
        <branch name="bus_stb_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1136" y="688" type="branch" />
            <wire x2="1136" y1="688" y2="688" x1="1104" />
        </branch>
        <branch name="bus_ad_A(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1136" y="848" type="branch" />
            <wire x2="1136" y1="848" y2="848" x1="1104" />
        </branch>
        <branch name="bus_ack_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="608" type="branch" />
            <wire x2="528" y1="608" y2="608" x1="496" />
        </branch>
        <branch name="bus_req_w_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="672" type="branch" />
            <wire x2="528" y1="672" y2="672" x1="496" />
        </branch>
        <branch name="bus_req_r_1_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="512" y="736" type="branch" />
            <wire x2="528" y1="736" y2="736" x1="512" />
        </branch>
        <branch name="bus_req_r_2_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="512" y="800" type="branch" />
            <wire x2="528" y1="800" y2="800" x1="512" />
        </branch>
        <branch name="bus_clk_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="512" y="864" type="branch" />
            <wire x2="528" y1="864" y2="864" x1="512" />
        </branch>
        <branch name="BOARD_IDENT(5)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1568" y="2304" type="branch" />
            <wire x2="1568" y1="2304" y2="2304" x1="1440" />
        </branch>
        <instance x="1520" y="2432" name="XLXI_3" orien="R270" />
        <instance x="1520" y="2544" name="XLXI_4" orien="R270" />
        <instance x="1520" y="2656" name="XLXI_5" orien="R270" />
        <instance x="1312" y="2368" name="XLXI_6" orien="R90" />
        <instance x="1312" y="2480" name="XLXI_7" orien="R90" />
        <instance x="1312" y="2240" name="XLXI_2" orien="R90" />
        <branch name="BOARD_IDENT(4)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2368" type="branch" />
            <wire x2="1584" y1="2368" y2="2368" x1="1520" />
        </branch>
        <branch name="BOARD_IDENT(3)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2432" type="branch" />
            <wire x2="1584" y1="2432" y2="2432" x1="1440" />
        </branch>
        <branch name="BOARD_IDENT(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2480" type="branch" />
            <wire x2="1584" y1="2480" y2="2480" x1="1520" />
        </branch>
        <branch name="BOARD_IDENT(1)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2544" type="branch" />
            <wire x2="1584" y1="2544" y2="2544" x1="1440" />
        </branch>
        <branch name="BOARD_IDENT(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2592" type="branch" />
            <wire x2="1584" y1="2592" y2="2592" x1="1520" />
        </branch>
        <branch name="bus_m_rdy_pad_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1120" y="928" type="branch" />
            <wire x2="1120" y1="928" y2="928" x1="1104" />
        </branch>
        <branch name="bus_m_rdy_pad_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1120" y="1920" type="branch" />
            <wire x2="1120" y1="1920" y2="1920" x1="1088" />
        </branch>
        <branch name="bus_s_rdy_pad_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="928" type="branch" />
            <wire x2="528" y1="928" y2="928" x1="496" />
        </branch>
        <branch name="bus_s_rdy_pad_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="480" y="1920" type="branch" />
            <wire x2="512" y1="1920" y2="1920" x1="480" />
        </branch>
        <branch name="bus_abort_pad_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="496" y="992" type="branch" />
            <wire x2="528" y1="992" y2="992" x1="496" />
        </branch>
        <branch name="bus_abort_pad_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="480" y="1984" type="branch" />
            <wire x2="512" y1="1984" y2="1984" x1="480" />
        </branch>
        <iomarker fontsize="28" x="2944" y="208" name="PCI_INTA" orien="R0" />
        <iomarker fontsize="28" x="2272" y="848" name="PCLK" orien="R180" />
        <iomarker fontsize="28" x="2272" y="528" name="PCI_IDSEL" orien="R180" />
        <iomarker fontsize="28" x="2272" y="368" name="PCI_GNT" orien="R180" />
        <iomarker fontsize="28" x="2272" y="208" name="PCI_RST" orien="R180" />
        <instance x="2304" y="1968" name="u_DMA_FPGA" orien="R0">
        </instance>
        <branch name="PCI_INTA">
            <wire x2="2928" y1="208" y2="208" x1="2912" />
            <wire x2="2944" y1="208" y2="208" x1="2928" />
        </branch>
        <branch name="bus_m_rdy_pad_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2240" y="1808" type="branch" />
            <wire x2="2256" y1="1808" y2="1808" x1="2240" />
            <wire x2="2304" y1="1808" y2="1808" x1="2256" />
        </branch>
        <branch name="bus_we_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2272" y="1648" type="branch" />
            <wire x2="2288" y1="1648" y2="1648" x1="2272" />
            <wire x2="2304" y1="1648" y2="1648" x1="2288" />
        </branch>
        <branch name="bus_stb_A">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2256" y="1488" type="branch" />
            <wire x2="2272" y1="1488" y2="1488" x1="2256" />
            <wire x2="2304" y1="1488" y2="1488" x1="2272" />
        </branch>
        <branch name="bus_m_rdy_pad_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2256" y="1328" type="branch" />
            <wire x2="2272" y1="1328" y2="1328" x1="2256" />
            <wire x2="2304" y1="1328" y2="1328" x1="2272" />
        </branch>
        <branch name="bus_we_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2272" y="1168" type="branch" />
            <wire x2="2288" y1="1168" y2="1168" x1="2272" />
            <wire x2="2304" y1="1168" y2="1168" x1="2288" />
        </branch>
        <branch name="bus_stb_B">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2272" y="1008" type="branch" />
            <wire x2="2288" y1="1008" y2="1008" x1="2272" />
            <wire x2="2304" y1="1008" y2="1008" x1="2288" />
        </branch>
        <branch name="PCLK">
            <wire x2="2288" y1="848" y2="848" x1="2272" />
            <wire x2="2304" y1="848" y2="848" x1="2288" />
        </branch>
        <branch name="BOARD_IDENT(5:0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="2224" y="688" type="branch" />
            <wire x2="2240" y1="688" y2="688" x1="2224" />
            <wire x2="2304" y1="688" y2="688" x1="2240" />
        </branch>
        <branch name="PCI_IDSEL">
            <wire x2="2288" y1="528" y2="528" x1="2272" />
            <wire x2="2304" y1="528" y2="528" x1="2288" />
        </branch>
        <branch name="PCI_GNT">
            <wire x2="2288" y1="368" y2="368" x1="2272" />
            <wire x2="2304" y1="368" y2="368" x1="2288" />
        </branch>
        <branch name="PCI_RST">
            <wire x2="2288" y1="208" y2="208" x1="2272" />
            <wire x2="2304" y1="208" y2="208" x1="2288" />
        </branch>
        <branch name="PCI_REQ">
            <wire x2="2928" y1="272" y2="272" x1="2912" />
            <wire x2="2944" y1="272" y2="272" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2944" y="272" name="PCI_REQ" orien="R0" />
        <branch name="PCI_SERR">
            <wire x2="2928" y1="336" y2="336" x1="2912" />
            <wire x2="2944" y1="336" y2="336" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2944" y="336" name="PCI_SERR" orien="R0" />
        <branch name="bus_ack_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="400" type="branch" />
            <wire x2="2960" y1="400" y2="400" x1="2912" />
        </branch>
        <branch name="bus_req_w_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="464" type="branch" />
            <wire x2="2928" y1="464" y2="464" x1="2912" />
            <wire x2="2944" y1="464" y2="464" x1="2928" />
        </branch>
        <branch name="bus_clk_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="528" type="branch" />
            <wire x2="2928" y1="528" y2="528" x1="2912" />
            <wire x2="2944" y1="528" y2="528" x1="2928" />
        </branch>
        <branch name="bus_req_r_1_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="592" type="branch" />
            <wire x2="2928" y1="592" y2="592" x1="2912" />
            <wire x2="2944" y1="592" y2="592" x1="2928" />
        </branch>
        <branch name="bus_req_r_2_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="656" type="branch" />
            <wire x2="2944" y1="656" y2="656" x1="2912" />
        </branch>
        <branch name="bus_abort_pad_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="784" type="branch" />
            <wire x2="2944" y1="784" y2="784" x1="2912" />
            <wire x2="2960" y1="784" y2="784" x1="2944" />
        </branch>
        <branch name="bus_s_rdy_pad_B">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="720" type="branch" />
            <wire x2="2960" y1="720" y2="720" x1="2912" />
        </branch>
        <branch name="bus_ack_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="848" type="branch" />
            <wire x2="2944" y1="848" y2="848" x1="2912" />
        </branch>
        <branch name="bus_req_w_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2960" y="912" type="branch" />
            <wire x2="2960" y1="912" y2="912" x1="2912" />
        </branch>
        <branch name="bus_clk_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="976" type="branch" />
            <wire x2="2944" y1="976" y2="976" x1="2912" />
        </branch>
        <branch name="bus_req_r_1_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2928" y="1040" type="branch" />
            <wire x2="2928" y1="1040" y2="1040" x1="2912" />
        </branch>
        <branch name="bus_req_r_2_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1104" type="branch" />
            <wire x2="2935" y1="1104" y2="1104" x1="2912" />
            <wire x2="2944" y1="1104" y2="1104" x1="2935" />
        </branch>
        <branch name="bus_s_rdy_pad_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1168" type="branch" />
            <wire x2="2944" y1="1168" y2="1168" x1="2912" />
        </branch>
        <branch name="bus_abort_pad_A">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1232" type="branch" />
            <wire x2="2944" y1="1232" y2="1232" x1="2912" />
        </branch>
        <branch name="PCI_FRAME">
            <wire x2="2960" y1="1296" y2="1296" x1="2912" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1296" name="PCI_FRAME" orien="R0" />
        <branch name="PCI_IRDY">
            <wire x2="2928" y1="1360" y2="1360" x1="2912" />
            <wire x2="2960" y1="1360" y2="1360" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1360" name="PCI_IRDY" orien="R0" />
        <branch name="PCI_DEVSEL">
            <wire x2="2928" y1="1424" y2="1424" x1="2912" />
            <wire x2="2960" y1="1424" y2="1424" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1424" name="PCI_DEVSEL" orien="R0" />
        <branch name="PCI_TRDY">
            <wire x2="2928" y1="1488" y2="1488" x1="2912" />
            <wire x2="2960" y1="1488" y2="1488" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1488" name="PCI_TRDY" orien="R0" />
        <branch name="PCI_STOP">
            <wire x2="2928" y1="1552" y2="1552" x1="2912" />
            <wire x2="2960" y1="1552" y2="1552" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1552" name="PCI_STOP" orien="R0" />
        <branch name="PCI_PAR">
            <wire x2="2944" y1="1616" y2="1616" x1="2912" />
        </branch>
        <iomarker fontsize="28" x="2944" y="1616" name="PCI_PAR" orien="R0" />
        <branch name="PCI_PERR">
            <wire x2="2944" y1="1680" y2="1680" x1="2912" />
        </branch>
        <iomarker fontsize="28" x="2944" y="1680" name="PCI_PERR" orien="R0" />
        <branch name="PCI_AD(31:0)">
            <wire x2="2928" y1="1744" y2="1744" x1="2912" />
            <wire x2="2960" y1="1744" y2="1744" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1744" name="PCI_AD(31:0)" orien="R0" />
        <branch name="PCI_CBE(3:0)">
            <wire x2="2928" y1="1808" y2="1808" x1="2912" />
            <wire x2="2976" y1="1808" y2="1808" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2976" y="1808" name="PCI_CBE(3:0)" orien="R0" />
        <branch name="bus_ad_B(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1872" type="branch" />
            <wire x2="2944" y1="1872" y2="1872" x1="2912" />
        </branch>
        <branch name="bus_ad_A(31:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2944" y="1936" type="branch" />
            <wire x2="2944" y1="1936" y2="1936" x1="2912" />
        </branch>
    </sheet>
</drawing>