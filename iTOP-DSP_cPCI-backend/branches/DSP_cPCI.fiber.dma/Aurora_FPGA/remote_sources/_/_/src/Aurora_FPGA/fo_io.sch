<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="TX_FAULT" />
        <signal name="TX_DIS_IN" />
        <signal name="RX_LOSS" />
        <signal name="MOD2" />
        <signal name="XLXN_11" />
        <signal name="MOD0" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_35" />
        <signal name="xTX_FAULT" />
        <signal name="xMOD2" />
        <signal name="xMOD0" />
        <signal name="TX_DIS" />
        <signal name="MOD1" />
        <signal name="XLXN_38" />
        <signal name="XLXN_34" />
        <signal name="xRX_LOSS_N" />
        <port polarity="Input" name="TX_FAULT" />
        <port polarity="Input" name="TX_DIS_IN" />
        <port polarity="Input" name="RX_LOSS" />
        <port polarity="Input" name="MOD2" />
        <port polarity="Input" name="MOD0" />
        <port polarity="Output" name="xTX_FAULT" />
        <port polarity="Output" name="xMOD2" />
        <port polarity="Output" name="xMOD0" />
        <port polarity="Output" name="TX_DIS" />
        <port polarity="Output" name="MOD1" />
        <port polarity="Output" name="xRX_LOSS_N" />
        <blockdef name="ibuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <block symbolname="ibuf" name="XLXI_1">
            <blockpin signalname="TX_FAULT" name="I" />
            <blockpin signalname="XLXN_35" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_2">
            <blockpin signalname="TX_DIS_IN" name="I" />
            <blockpin signalname="TX_DIS" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_4">
            <blockpin signalname="RX_LOSS" name="I" />
            <blockpin signalname="XLXN_38" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_5">
            <blockpin signalname="MOD2" name="I" />
            <blockpin signalname="XLXN_33" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_6">
            <blockpin signalname="XLXN_11" name="I" />
            <blockpin signalname="MOD1" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="XLXN_11" name="G" />
        </block>
        <block symbolname="ibuf" name="XLXI_8">
            <blockpin signalname="MOD0" name="I" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="XLXN_32" name="I" />
            <blockpin signalname="xMOD0" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="XLXN_33" name="I" />
            <blockpin signalname="xMOD2" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_20">
            <blockpin signalname="XLXN_35" name="I" />
            <blockpin signalname="xTX_FAULT" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_22">
            <blockpin signalname="XLXN_38" name="I" />
            <blockpin signalname="XLXN_34" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="XLXN_34" name="I" />
            <blockpin signalname="xRX_LOSS_N" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="496" y="528" name="XLXI_1" orien="R0" />
        <branch name="TX_FAULT">
            <wire x2="496" y1="496" y2="496" x1="464" />
        </branch>
        <instance x="496" y="592" name="XLXI_2" orien="R0" />
        <branch name="TX_DIS_IN">
            <wire x2="464" y1="560" y2="560" x1="400" />
            <wire x2="496" y1="560" y2="560" x1="464" />
        </branch>
        <branch name="RX_LOSS">
            <wire x2="496" y1="624" y2="624" x1="464" />
        </branch>
        <instance x="496" y="656" name="XLXI_4" orien="R0" />
        <instance x="496" y="720" name="XLXI_5" orien="R0" />
        <branch name="MOD2">
            <wire x2="496" y1="688" y2="688" x1="464" />
        </branch>
        <instance x="496" y="784" name="XLXI_6" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="496" y1="752" y2="752" x1="464" />
        </branch>
        <instance x="336" y="688" name="XLXI_7" orien="R90" />
        <branch name="MOD0">
            <wire x2="496" y1="816" y2="816" x1="464" />
        </branch>
        <instance x="496" y="848" name="XLXI_8" orien="R0" />
        <branch name="XLXN_32">
            <wire x2="752" y1="816" y2="816" x1="720" />
        </branch>
        <instance x="752" y="848" name="XLXI_17" orien="R0" />
        <branch name="XLXN_33">
            <wire x2="752" y1="688" y2="688" x1="720" />
        </branch>
        <instance x="752" y="720" name="XLXI_18" orien="R0" />
        <branch name="XLXN_35">
            <wire x2="752" y1="496" y2="496" x1="720" />
        </branch>
        <instance x="752" y="528" name="XLXI_20" orien="R0" />
        <branch name="xTX_FAULT">
            <wire x2="1008" y1="496" y2="496" x1="976" />
        </branch>
        <branch name="xMOD2">
            <wire x2="1008" y1="688" y2="688" x1="976" />
        </branch>
        <branch name="xMOD0">
            <wire x2="1008" y1="816" y2="816" x1="976" />
        </branch>
        <branch name="TX_DIS">
            <wire x2="752" y1="560" y2="560" x1="720" />
        </branch>
        <branch name="MOD1">
            <wire x2="752" y1="752" y2="752" x1="720" />
        </branch>
        <branch name="XLXN_38">
            <wire x2="752" y1="624" y2="624" x1="720" />
        </branch>
        <instance x="752" y="656" name="XLXI_22" orien="R0" />
        <branch name="XLXN_34">
            <wire x2="1008" y1="624" y2="624" x1="976" />
        </branch>
        <branch name="xRX_LOSS_N">
            <wire x2="1264" y1="624" y2="624" x1="1232" />
        </branch>
        <instance x="1008" y="656" name="XLXI_19" orien="R0" />
        <iomarker fontsize="28" x="464" y="496" name="TX_FAULT" orien="R180" />
        <iomarker fontsize="28" x="464" y="624" name="RX_LOSS" orien="R180" />
        <iomarker fontsize="28" x="464" y="688" name="MOD2" orien="R180" />
        <iomarker fontsize="28" x="464" y="816" name="MOD0" orien="R180" />
        <iomarker fontsize="28" x="1008" y="496" name="xTX_FAULT" orien="R0" />
        <iomarker fontsize="28" x="1008" y="688" name="xMOD2" orien="R0" />
        <iomarker fontsize="28" x="1008" y="816" name="xMOD0" orien="R0" />
        <iomarker fontsize="28" x="752" y="560" name="TX_DIS" orien="R0" />
        <iomarker fontsize="28" x="752" y="752" name="MOD1" orien="R0" />
        <iomarker fontsize="28" x="1264" y="624" name="xRX_LOSS_N" orien="R0" />
        <iomarker fontsize="28" x="400" y="560" name="TX_DIS_IN" orien="R180" />
    </sheet>
</drawing>