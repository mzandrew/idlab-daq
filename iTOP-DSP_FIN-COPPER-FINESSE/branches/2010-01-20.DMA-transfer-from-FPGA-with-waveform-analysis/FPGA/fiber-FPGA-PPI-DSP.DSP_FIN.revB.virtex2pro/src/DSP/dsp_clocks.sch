<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_602" />
        <signal name="dsp1_ppi1_clock" />
        <signal name="dsp1_ppi0_clock" />
        <signal name="dsp0_ppi1_clock" />
        <signal name="dsp0_ppi0_clock" />
        <signal name="dsp0_clock" />
        <signal name="dsp1_clock" />
        <signal name="xdsp_clock" />
        <signal name="xdsp_ppi_clock" />
        <signal name="XLXN_651" />
        <signal name="xBCLK" />
        <signal name="reset" />
        <port polarity="Output" name="dsp1_ppi1_clock" />
        <port polarity="Output" name="dsp1_ppi0_clock" />
        <port polarity="Output" name="dsp0_ppi1_clock" />
        <port polarity="Output" name="dsp0_ppi0_clock" />
        <port polarity="Output" name="dsp0_clock" />
        <port polarity="Output" name="dsp1_clock" />
        <port polarity="Output" name="xdsp_clock" />
        <port polarity="Output" name="xdsp_ppi_clock" />
        <port polarity="Input" name="xBCLK" />
        <port polarity="Input" name="reset" />
        <blockdef name="obuf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="dsp_dcm">
            <timestamp>2009-9-23T2:52:36</timestamp>
            <rect width="288" x="32" y="-192" height="192" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="-32" y1="-160" y2="-160" x1="32" />
            <line x2="-32" y1="-32" y2="-32" x1="32" />
        </blockdef>
        <block symbolname="obuf" name="XLXI_479">
            <blockpin signalname="xdsp_ppi_clock" name="I" />
            <blockpin signalname="dsp0_ppi0_clock" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_478">
            <blockpin signalname="xdsp_ppi_clock" name="I" />
            <blockpin signalname="dsp1_ppi0_clock" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_477">
            <blockpin signalname="xdsp_ppi_clock" name="I" />
            <blockpin signalname="dsp1_ppi1_clock" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_476">
            <blockpin signalname="xdsp_ppi_clock" name="I" />
            <blockpin signalname="dsp0_ppi1_clock" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_480">
            <blockpin signalname="xdsp_clock" name="I" />
            <blockpin signalname="dsp1_clock" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_481">
            <blockpin signalname="xdsp_clock" name="I" />
            <blockpin signalname="dsp0_clock" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_500">
            <blockpin signalname="XLXN_602" name="I" />
            <blockpin signalname="xdsp_clock" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_475">
            <blockpin signalname="XLXN_651" name="I" />
            <blockpin signalname="xdsp_ppi_clock" name="O" />
        </block>
        <block symbolname="dsp_dcm" name="dspdcm">
            <blockpin signalname="XLXN_651" name="CLKDV_OUT" />
            <blockpin signalname="XLXN_602" name="CLKFX_OUT" />
            <blockpin name="CLK0_OUT" />
            <blockpin signalname="xBCLK" name="CLKIN_IN" />
            <blockpin signalname="reset" name="RST_IN" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <branch name="dsp1_ppi1_clock">
            <wire x2="1424" y1="736" y2="736" x1="1392" />
        </branch>
        <branch name="dsp1_ppi0_clock">
            <wire x2="1424" y1="672" y2="672" x1="1392" />
        </branch>
        <branch name="dsp0_ppi1_clock">
            <wire x2="1424" y1="608" y2="608" x1="1392" />
        </branch>
        <branch name="dsp0_ppi0_clock">
            <wire x2="1424" y1="544" y2="544" x1="1392" />
        </branch>
        <branch name="dsp0_clock">
            <wire x2="1424" y1="800" y2="800" x1="1392" />
        </branch>
        <branch name="dsp1_clock">
            <wire x2="1424" y1="864" y2="864" x1="1392" />
        </branch>
        <branch name="xdsp_clock">
            <wire x2="1152" y1="832" y2="832" x1="1056" />
            <wire x2="1152" y1="832" y2="864" x1="1152" />
            <wire x2="1168" y1="864" y2="864" x1="1152" />
            <wire x2="1152" y1="864" y2="944" x1="1152" />
            <wire x2="1424" y1="944" y2="944" x1="1152" />
            <wire x2="1168" y1="800" y2="800" x1="1152" />
            <wire x2="1152" y1="800" y2="832" x1="1152" />
        </branch>
        <branch name="XLXN_602">
            <wire x2="832" y1="832" y2="832" x1="640" />
        </branch>
        <branch name="xdsp_ppi_clock">
            <wire x2="1008" y1="768" y2="768" x1="896" />
            <wire x2="1424" y1="464" y2="464" x1="1008" />
            <wire x2="1008" y1="464" y2="544" x1="1008" />
            <wire x2="1168" y1="544" y2="544" x1="1008" />
            <wire x2="1008" y1="544" y2="608" x1="1008" />
            <wire x2="1168" y1="608" y2="608" x1="1008" />
            <wire x2="1008" y1="608" y2="672" x1="1008" />
            <wire x2="1168" y1="672" y2="672" x1="1008" />
            <wire x2="1008" y1="672" y2="736" x1="1008" />
            <wire x2="1168" y1="736" y2="736" x1="1008" />
            <wire x2="1008" y1="736" y2="768" x1="1008" />
        </branch>
        <branch name="XLXN_651">
            <wire x2="672" y1="768" y2="768" x1="640" />
        </branch>
        <instance x="1168" y="576" name="XLXI_479" orien="R0" />
        <instance x="1168" y="704" name="XLXI_478" orien="R0" />
        <instance x="1168" y="768" name="XLXI_477" orien="R0" />
        <instance x="1168" y="640" name="XLXI_476" orien="R0" />
        <instance x="1168" y="896" name="XLXI_480" orien="R0" />
        <instance x="1168" y="832" name="XLXI_481" orien="R0" />
        <instance x="832" y="864" name="XLXI_500" orien="R0" />
        <iomarker fontsize="28" x="1424" y="736" name="dsp1_ppi1_clock" orien="R0" />
        <iomarker fontsize="28" x="1424" y="672" name="dsp1_ppi0_clock" orien="R0" />
        <iomarker fontsize="28" x="1424" y="608" name="dsp0_ppi1_clock" orien="R0" />
        <iomarker fontsize="28" x="1424" y="544" name="dsp0_ppi0_clock" orien="R0" />
        <iomarker fontsize="28" x="1424" y="800" name="dsp0_clock" orien="R0" />
        <iomarker fontsize="28" x="1424" y="864" name="dsp1_clock" orien="R0" />
        <branch name="xBCLK">
            <wire x2="224" y1="768" y2="768" x1="192" />
        </branch>
        <branch name="reset">
            <wire x2="224" y1="896" y2="896" x1="192" />
        </branch>
        <instance x="256" y="928" name="dspdcm" orien="R0">
        </instance>
        <iomarker fontsize="28" x="192" y="768" name="xBCLK" orien="R180" />
        <iomarker fontsize="28" x="192" y="896" name="reset" orien="R180" />
        <instance x="672" y="800" name="XLXI_475" orien="R0" />
        <iomarker fontsize="28" x="1424" y="944" name="xdsp_clock" orien="R0" />
        <iomarker fontsize="28" x="1424" y="464" name="xdsp_ppi_clock" orien="R0" />
        <text style="fontsize:20;fontname:Arial" x="104" y="720">150MHz</text>
        <text style="fontsize:20;fontname:Arial" x="868" y="716">75MHz</text>
        <text style="fontsize:20;fontname:Arial" x="1016" y="908">33.333MHz</text>
    </sheet>
</drawing>