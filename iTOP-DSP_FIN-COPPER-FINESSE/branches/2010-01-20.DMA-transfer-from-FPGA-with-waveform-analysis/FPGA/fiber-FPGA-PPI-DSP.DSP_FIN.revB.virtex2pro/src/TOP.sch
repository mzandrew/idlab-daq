VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL xSLWR
        SIGNAL xCLR_ALL
        SIGNAL xREAD0(23:0)
        SIGNAL xdsp_ppi_clock
        SIGNAL PA0
        SIGNAL PA1
        SIGNAL xFIFOADR(0)
        SIGNAL xFIFOADR(1)
        SIGNAL xPKTEND
        SIGNAL xSLRD
        SIGNAL WAKEUP
        SIGNAL CTL2
        SIGNAL CTL1
        SIGNAL CTL0
        SIGNAL PA7
        SIGNAL PA3
        SIGNAL CLKOUT
        SIGNAL xTOGGLE
        SIGNAL xFPGA_DATA(15:0)
        SIGNAL xSLOE
        SIGNAL IFCLK
        SIGNAL xFLAGB
        SIGNAL xFLAGC
        SIGNAL xRBUSY
        SIGNAL xRESET
        SIGNAL xSYNC_USB
        SIGNAL xWBUSY
        SIGNAL xIFCLK
        SIGNAL xSTART
        SIGNAL xFIFOADR(1:0)
        SIGNAL xDONE
        SIGNAL PA2
        SIGNAL PA4
        SIGNAL PA5
        SIGNAL PA6
        SIGNAL RDY1
        SIGNAL xFLAGA
        SIGNAL xWAKEUP
        SIGNAL FD(15:0)
        SIGNAL RDY0
        SIGNAL xUSB_DATA(15:0)
        SIGNAL xSOFT_TRIG
        SIGNAL xRADDR0(14:0)
        SIGNAL buffered_BCLK
        SIGNAL XLXN_2010
        SIGNAL BCLK
        SIGNAL DSP_TDO_0
        SIGNAL DSP_TDO_1
        SIGNAL DSP_EMU
        SIGNAL TRST_JTAG
        SIGNAL TCK_JTAG
        SIGNAL TMS_JTAG
        SIGNAL TDI_JTAG
        SIGNAL TDO_JTAG
        SIGNAL EMU_JTAG
        SIGNAL DSP_TDI_0
        SIGNAL DSP_TDI_1
        SIGNAL DSP_TCK_0
        SIGNAL DSP_TCK_1
        SIGNAL DSP_TMS_1
        SIGNAL DSP_TMS_0
        SIGNAL DSP_TRST_0
        SIGNAL DSP_TRST_1
        SIGNAL xbypass
        SIGNAL dsp0_bmode0
        SIGNAL dsp1_bmode0
        SIGNAL dsp0_bmode1
        SIGNAL dsp1_bmode1
        SIGNAL dsp0_bypass
        SIGNAL dsp1_bypass
        SIGNAL dsp0_nmi0
        SIGNAL dsp1_nmi0
        SIGNAL dsp0_nmi1
        SIGNAL dsp1_nmi1
        SIGNAL dsp0_bus_ready
        SIGNAL dsp1_bus_ready
        SIGNAL dsp0_async_ready
        SIGNAL dsp1_async_ready
        SIGNAL dsp0_ppi0_clock
        SIGNAL dsp0_ppi1_clock
        SIGNAL dsp1_ppi0_clock
        SIGNAL dsp1_ppi1_clock
        SIGNAL dsp0_clock
        SIGNAL dsp1_clock
        SIGNAL xdsp_clock
        SIGNAL dsp0_reset
        SIGNAL dsp1_reset
        SIGNAL XLXN_1754
        SIGNAL dsp0_pf1
        SIGNAL dsp0_pf2
        SIGNAL dsp0_pf3
        SIGNAL dsp0_pf0
        SIGNAL dsp0_pf4
        SIGNAL dsp0_pf5
        SIGNAL dsp0_pf6
        SIGNAL mon4
        SIGNAL mon5
        SIGNAL mon6
        SIGNAL mon1
        SIGNAL mon2
        SIGNAL mon3
        SIGNAL mon0
        SIGNAL XLXN_2623
        SIGNAL XLXN_2624
        SIGNAL XLXN_2625
        SIGNAL XLXN_2626
        SIGNAL XLXN_2627
        SIGNAL XLXN_2628
        SIGNAL XLXN_2633
        SIGNAL dsp0_ppi0_sync1
        SIGNAL XLXN_2629
        SIGNAL xRX_LENGTH0(13:0)
        SIGNAL xCLR_LAM(3:0)
        SIGNAL xDOWNSTREAM_CLR(3:0)
        SIGNAL xDOWNSTREAM_TRIG(3:0)
        SIGNAL xTX_LENGTH3(13:0)
        SIGNAL xTX_LENGTH2(13:0)
        SIGNAL xTX_LENGTH1(13:0)
        SIGNAL xTX_LENGTH0(13:0)
        SIGNAL xTX_DATA3(23:0)
        SIGNAL xTX_DATA2(23:0)
        SIGNAL xTX_DATA1(23:0)
        SIGNAL xTX_DATA0(23:0)
        SIGNAL xSTART_TX_XFER(3:0)
        SIGNAL xUPSTREAM_CLR(3:0)
        SIGNAL xUPSTREAM_TRIG(3:0)
        SIGNAL xRX_XFER_EN(3:0)
        SIGNAL xRX_ADDR3(13:0)
        SIGNAL xRX_ADDR2(13:0)
        SIGNAL xRX_ADDR1(13:0)
        SIGNAL xRX_ADDR0(13:0)
        SIGNAL xRX_DATA1(23:0)
        SIGNAL xRX_DATA2(23:0)
        SIGNAL xRX_DATA3(23:0)
        SIGNAL xRX_LENGTH1(13:0)
        SIGNAL xRX_LENGTH2(13:0)
        SIGNAL xRX_LENGTH3(13:0)
        SIGNAL xRX_DATA0(23:0)
        SIGNAL xLAM(3:0)
        SIGNAL xTX_XFER_EN(3:0)
        SIGNAL xTX_ADDR3(13:0)
        SIGNAL xTX_ADDR2(13:0)
        SIGNAL xTX_ADDR1(13:0)
        SIGNAL xTX_ADDR0(13:0)
        SIGNAL xDONE_TX_XFER(3:0)
        SIGNAL xLINK_ACTIVE(3:0)
        SIGNAL TX_DIS(3:0)
        SIGNAL MOD1(3:0)
        SIGNAL TXN(3:0)
        SIGNAL TXP(3:0)
        SIGNAL xCLK
        SIGNAL RXN(3:0)
        SIGNAL RXP(3:0)
        SIGNAL MOD0(3:0)
        SIGNAL MOD2(3:0)
        SIGNAL LOSS(3:0)
        SIGNAL TX_FAULT(3:0)
        SIGNAL XLXN_2953
        SIGNAL XLXN_2956
        SIGNAL XLXN_2961(0:0)
        SIGNAL xRX_XFER_EN(0)
        SIGNAL XLXN_2962
        SIGNAL clear_lam
        SIGNAL led_green
        SIGNAL XLXN_2964
        SIGNAL xLAM(0)
        SIGNAL mon7
        SIGNAL XLXN_2965
        SIGNAL dsp0_ppi0(15:0)
        SIGNAL XLXN_2966(11:0)
        PORT Input PA0
        PORT Input PA1
        PORT Input WAKEUP
        PORT Input CTL2
        PORT Input CTL1
        PORT Input CTL0
        PORT Input PA7
        PORT Input PA3
        PORT Input CLKOUT
        PORT Input IFCLK
        PORT Output PA2
        PORT Output PA4
        PORT Output PA5
        PORT Output PA6
        PORT Output RDY1
        PORT BiDirectional FD(15:0)
        PORT Output RDY0
        PORT Input BCLK
        PORT Input DSP_TDO_0
        PORT Input DSP_TDO_1
        PORT Input DSP_EMU
        PORT Input TRST_JTAG
        PORT Input TCK_JTAG
        PORT Input TMS_JTAG
        PORT Input TDI_JTAG
        PORT Output TDO_JTAG
        PORT Output EMU_JTAG
        PORT Output DSP_TDI_0
        PORT Output DSP_TDI_1
        PORT Output DSP_TCK_0
        PORT Output DSP_TCK_1
        PORT Output DSP_TMS_1
        PORT Output DSP_TMS_0
        PORT Output DSP_TRST_0
        PORT Output DSP_TRST_1
        PORT Output dsp0_bmode0
        PORT Output dsp1_bmode0
        PORT Output dsp0_bmode1
        PORT Output dsp1_bmode1
        PORT Output dsp0_bypass
        PORT Output dsp1_bypass
        PORT Output dsp0_nmi0
        PORT Output dsp1_nmi0
        PORT Output dsp0_nmi1
        PORT Output dsp1_nmi1
        PORT Output dsp0_bus_ready
        PORT Output dsp1_bus_ready
        PORT Output dsp0_async_ready
        PORT Output dsp1_async_ready
        PORT Output dsp0_ppi0_clock
        PORT Output dsp0_ppi1_clock
        PORT Output dsp1_ppi0_clock
        PORT Output dsp1_ppi1_clock
        PORT Output dsp0_clock
        PORT Output dsp1_clock
        PORT Output dsp0_reset
        PORT Output dsp1_reset
        PORT Input dsp0_pf1
        PORT Input dsp0_pf2
        PORT Input dsp0_pf3
        PORT Input dsp0_pf0
        PORT Input dsp0_pf4
        PORT Input dsp0_pf5
        PORT Input dsp0_pf6
        PORT Output mon4
        PORT Output mon5
        PORT Output mon6
        PORT Output mon1
        PORT Output mon2
        PORT Output mon3
        PORT Output mon0
        PORT Output dsp0_ppi0_sync1
        PORT Output TX_DIS(3:0)
        PORT Output MOD1(3:0)
        PORT Output TXN(3:0)
        PORT Output TXP(3:0)
        PORT Input RXN(3:0)
        PORT Input RXP(3:0)
        PORT Input MOD0(3:0)
        PORT Input MOD2(3:0)
        PORT Input LOSS(3:0)
        PORT Input TX_FAULT(3:0)
        PORT Output led_green
        PORT Output mon7
        PORT Output dsp0_ppi0(15:0)
        BEGIN BLOCKDEF USB_IO
            TIMESTAMP 2009 8 15 22 40 48
            RECTANGLE N 0 -608 368 0 
            LINE N 0 -576 -64 -576 
            LINE N 0 -544 -64 -544 
            LINE N 0 -512 -64 -512 
            LINE N 0 -480 -64 -480 
            LINE N 0 -448 -64 -448 
            LINE N 0 -416 -64 -416 
            LINE N 0 -384 -64 -384 
            LINE N 0 -352 -64 -352 
            LINE N 0 -320 -64 -320 
            LINE N 0 -288 -64 -288 
            LINE N 0 -256 -64 -256 
            LINE N 0 -224 -64 -224 
            LINE N 0 -192 -64 -192 
            LINE N 0 -160 -64 -160 
            LINE N 0 -128 -64 -128 
            LINE N 0 -96 -64 -96 
            LINE N 0 -64 -64 -64 
            RECTANGLE N -64 -44 0 -20 
            LINE N 0 -32 -64 -32 
            LINE N 368 -576 432 -576 
            LINE N 368 -544 432 -544 
            LINE N 368 -512 432 -512 
            LINE N 368 -480 432 -480 
            LINE N 368 -448 432 -448 
            LINE N 368 -416 432 -416 
            LINE N 368 -384 432 -384 
            LINE N 368 -352 432 -352 
            LINE N 368 -320 432 -320 
            LINE N 368 -288 432 -288 
            LINE N 368 -256 432 -256 
            RECTANGLE N 368 -236 432 -212 
            LINE N 368 -224 432 -224 
            RECTANGLE N 368 -204 432 -180 
            LINE N 368 -192 432 -192 
        END BLOCKDEF
        BEGIN BLOCKDEF USBread
            TIMESTAMP 2009 8 17 3 9 27
            LINE N 0 -352 -64 -352 
            LINE N 0 -320 -64 -320 
            LINE N 0 -288 -64 -288 
            LINE N 0 -256 -64 -256 
            RECTANGLE N -64 -236 0 -212 
            LINE N 0 -224 -64 -224 
            RECTANGLE N 0 -384 368 32 
            RECTANGLE N 368 -364 432 -340 
            LINE N 368 -352 432 -352 
            LINE N 368 -320 432 -320 
            LINE N 368 -288 432 -288 
            LINE N 368 -256 432 -256 
            LINE N 368 -224 432 -224 
            LINE N 368 -192 432 -192 
            LINE N 368 -160 432 -160 
            RECTANGLE N 368 -140 432 -116 
            LINE N 368 -128 432 -128 
            RECTANGLE N 368 -108 432 -84 
            LINE N 368 -96 432 -96 
            LINE N 368 -64 432 -64 
            RECTANGLE N 368 -76 432 -52 
            LINE N 368 -32 432 -32 
            RECTANGLE N 368 -44 432 -20 
            LINE N 368 0 432 0 
        END BLOCKDEF
        BEGIN BLOCKDEF PROGRESET
            TIMESTAMP 2008 9 2 20 12 30
            RECTANGLE N 64 -64 320 32 
            LINE N 64 -32 0 -32 
            LINE N 320 -32 384 -32 
            LINE N 320 0 384 0 
            LINE N 64 0 0 0 
        END BLOCKDEF
        BEGIN BLOCKDEF USBwrite
            TIMESTAMP 2009 9 17 22 48 13
            LINE N 64 -224 0 -224 
            LINE N 64 -192 0 -192 
            LINE N 64 -160 0 -160 
            LINE N 64 -128 0 -128 
            LINE N 64 -96 0 -96 
            LINE N 64 -64 0 -64 
            LINE N 64 -32 0 -32 
            LINE N 432 -224 496 -224 
            LINE N 432 -192 496 -192 
            LINE N 432 -160 496 -160 
            LINE N 432 -128 496 -128 
            RECTANGLE N 64 -256 432 0 
            LINE N 496 -32 432 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MESS
            TIMESTAMP 2009 9 16 0 7 53
            RECTANGLE N 64 -320 432 -128 
            LINE N 64 -288 0 -288 
            LINE N 64 -256 0 -256 
            LINE N 64 -224 0 -224 
            LINE N 64 -192 0 -192 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 432 -300 496 -276 
            LINE N 432 -288 496 -288 
            RECTANGLE N 432 -268 496 -244 
            LINE N 432 -256 496 -256 
            LINE N 432 -160 496 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF dsp_clocks
            TIMESTAMP 2009 9 23 3 59 26
            RECTANGLE N 32 -448 320 -112 
            LINE N 320 -416 384 -416 
            LINE N 32 -416 -32 -416 
            LINE N 320 -368 384 -368 
            LINE N 320 -336 384 -336 
            LINE N 320 -304 384 -304 
            LINE N 320 -272 384 -272 
            LINE N 320 -192 384 -192 
            LINE N 32 -192 -32 -192 
            LINE N 384 -144 320 -144 
            LINE N 320 -224 384 -224 
        END BLOCKDEF
        BEGIN BLOCKDEF ibufg
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF dsp_jtag
            TIMESTAMP 2009 9 23 4 26 39
            RECTANGLE N 64 -640 384 -272 
            LINE N 64 -608 0 -608 
            LINE N 64 -576 0 -576 
            LINE N 64 -544 0 -544 
            LINE N 64 -512 0 -512 
            LINE N 64 -480 0 -480 
            LINE N 384 -608 448 -608 
            LINE N 384 -576 448 -576 
            LINE N 64 -400 0 -400 
            LINE N 64 -368 0 -368 
            LINE N 384 -528 448 -528 
            LINE N 384 -496 448 -496 
            LINE N 384 -464 448 -464 
            LINE N 384 -432 448 -432 
            LINE N 384 -368 448 -368 
            LINE N 384 -400 448 -400 
            LINE N 384 -304 448 -304 
            LINE N 384 -336 448 -336 
        END BLOCKDEF
        BEGIN BLOCKDEF dsp_control
            TIMESTAMP 2009 9 23 4 29 32
            RECTANGLE N 64 -1088 320 -416 
            LINE N 320 -1056 384 -1056 
            LINE N 320 -992 384 -992 
            LINE N 320 -1024 384 -1024 
            LINE N 320 -880 384 -880 
            LINE N 320 -912 384 -912 
            LINE N 320 -944 384 -944 
            LINE N 320 -640 384 -640 
            LINE N 320 -720 384 -720 
            LINE N 320 -688 384 -688 
            LINE N 320 -608 384 -608 
            LINE N 320 -528 384 -528 
            LINE N 320 -560 384 -560 
            LINE N 320 -448 384 -448 
            LINE N 320 -480 384 -480 
            LINE N 320 -800 384 -800 
            LINE N 320 -832 384 -832 
            LINE N 320 -768 384 -768 
        END BLOCKDEF
        BEGIN BLOCKDEF dsp_reset
            TIMESTAMP 2009 9 23 4 49 33
            RECTANGLE N 64 -192 416 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 416 -96 480 -96 
            LINE N 416 -32 480 -32 
            LINE N 416 -160 480 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF bufg
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf12to16
            TIMESTAMP 2009 9 3 23 56 46
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ppi
            TIMESTAMP 2009 10 19 19 47 38
            RECTANGLE N 64 -192 432 48 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 432 -160 496 -160 
            RECTANGLE N 432 -108 496 -84 
            LINE N 432 -96 496 -96 
            LINE N 432 -32 496 -32 
            LINE N 496 16 432 16 
        END BLOCKDEF
        BEGIN BLOCKDEF TEST_BLOCK
            TIMESTAMP 2009 8 18 1 34 18
            RECTANGLE N 0 -768 608 32 
            LINE N 0 -736 -64 -736 
            RECTANGLE N 608 -748 672 -724 
            LINE N 608 -736 672 -736 
            RECTANGLE N -64 -716 0 -692 
            LINE N 0 -704 -64 -704 
            RECTANGLE N -64 -684 0 -660 
            LINE N 0 -672 -64 -672 
            RECTANGLE N -64 -652 0 -628 
            LINE N 0 -640 -64 -640 
            RECTANGLE N -64 -620 0 -596 
            LINE N 0 -608 -64 -608 
            RECTANGLE N -64 -588 0 -564 
            LINE N 0 -576 -64 -576 
            RECTANGLE N -64 -556 0 -532 
            LINE N 0 -544 -64 -544 
            RECTANGLE N -64 -524 0 -500 
            LINE N 0 -512 -64 -512 
            RECTANGLE N -64 -492 0 -468 
            LINE N 0 -480 -64 -480 
            RECTANGLE N -64 -268 0 -244 
            LINE N 0 -256 -64 -256 
            RECTANGLE N -64 -300 0 -276 
            LINE N 0 -288 -64 -288 
            RECTANGLE N -64 -332 0 -308 
            LINE N 0 -320 -64 -320 
            RECTANGLE N -64 -364 0 -340 
            LINE N 0 -352 -64 -352 
            RECTANGLE N -64 -396 0 -372 
            LINE N 0 -384 -64 -384 
            RECTANGLE N -64 -428 0 -404 
            LINE N 0 -416 -64 -416 
            RECTANGLE N -64 -460 0 -436 
            LINE N 0 -448 -64 -448 
            RECTANGLE N -64 -236 0 -212 
            LINE N 0 -224 -64 -224 
            RECTANGLE N -64 -204 0 -180 
            LINE N 0 -192 -64 -192 
            RECTANGLE N -64 -172 0 -148 
            LINE N 0 -160 -64 -160 
            RECTANGLE N -64 -140 0 -116 
            LINE N 0 -128 -64 -128 
            RECTANGLE N -64 -108 0 -84 
            LINE N 0 -96 -64 -96 
            RECTANGLE N -64 -76 0 -52 
            LINE N 0 -64 -64 -64 
            RECTANGLE N -64 -44 0 -20 
            LINE N 0 -32 -64 -32 
            RECTANGLE N 608 -716 672 -692 
            LINE N 608 -704 672 -704 
            RECTANGLE N 608 -684 672 -660 
            LINE N 608 -672 672 -672 
            RECTANGLE N 608 -652 672 -628 
            LINE N 608 -640 672 -640 
            RECTANGLE N 608 -620 672 -596 
            LINE N 608 -608 672 -608 
            RECTANGLE N 608 -588 672 -564 
            LINE N 608 -576 672 -576 
            RECTANGLE N 608 -556 672 -532 
            LINE N 608 -544 672 -544 
            RECTANGLE N 608 -524 672 -500 
            LINE N 608 -512 672 -512 
            RECTANGLE N 608 -492 672 -468 
            LINE N 608 -480 672 -480 
            RECTANGLE N 608 -460 672 -436 
            LINE N 608 -448 672 -448 
            RECTANGLE N 608 -428 672 -404 
            LINE N 608 -416 672 -416 
            RECTANGLE N 608 -396 672 -372 
            LINE N 608 -384 672 -384 
            LINE N 0 0 -64 0 
        END BLOCKDEF
        BEGIN BLOCKDEF Aurora_TOP
            TIMESTAMP 2009 8 17 0 49 52
            RECTANGLE N 0 -928 608 0 
            LINE N 0 -896 -64 -896 
            LINE N 608 -896 672 -896 
            RECTANGLE N -64 -876 0 -852 
            LINE N 0 -864 -64 -864 
            RECTANGLE N -64 -844 0 -820 
            LINE N 0 -832 -64 -832 
            RECTANGLE N -64 -812 0 -788 
            LINE N 0 -800 -64 -800 
            RECTANGLE N -64 -780 0 -756 
            LINE N 0 -768 -64 -768 
            RECTANGLE N -64 -748 0 -724 
            LINE N 0 -736 -64 -736 
            RECTANGLE N -64 -716 0 -692 
            LINE N 0 -704 -64 -704 
            RECTANGLE N -64 -684 0 -660 
            LINE N 0 -672 -64 -672 
            RECTANGLE N -64 -620 0 -596 
            LINE N 0 -608 -64 -608 
            RECTANGLE N -64 -652 0 -628 
            LINE N 0 -640 -64 -640 
            RECTANGLE N -64 -588 0 -564 
            LINE N 0 -576 -64 -576 
            RECTANGLE N -64 -556 0 -532 
            LINE N 0 -544 -64 -544 
            RECTANGLE N -64 -524 0 -500 
            LINE N 0 -512 -64 -512 
            RECTANGLE N -64 -492 0 -468 
            LINE N 0 -480 -64 -480 
            RECTANGLE N -64 -460 0 -436 
            LINE N 0 -448 -64 -448 
            RECTANGLE N -64 -428 0 -404 
            LINE N 0 -416 -64 -416 
            RECTANGLE N -64 -396 0 -372 
            LINE N 0 -384 -64 -384 
            RECTANGLE N -64 -364 0 -340 
            LINE N 0 -352 -64 -352 
            RECTANGLE N -64 -332 0 -308 
            LINE N 0 -320 -64 -320 
            RECTANGLE N 608 -876 672 -852 
            LINE N 608 -864 672 -864 
            RECTANGLE N 608 -844 672 -820 
            LINE N 608 -832 672 -832 
            RECTANGLE N 608 -812 672 -788 
            LINE N 608 -800 672 -800 
            RECTANGLE N 608 -780 672 -756 
            LINE N 608 -768 672 -768 
            RECTANGLE N 608 -748 672 -724 
            LINE N 608 -736 672 -736 
            RECTANGLE N 608 -716 672 -692 
            LINE N 608 -704 672 -704 
            RECTANGLE N 608 -684 672 -660 
            LINE N 608 -672 672 -672 
            RECTANGLE N 608 -652 672 -628 
            LINE N 608 -640 672 -640 
            RECTANGLE N 608 -620 672 -596 
            LINE N 608 -608 672 -608 
            RECTANGLE N 608 -588 672 -564 
            LINE N 608 -576 672 -576 
            RECTANGLE N 608 -556 672 -532 
            LINE N 608 -544 672 -544 
            RECTANGLE N 608 -524 672 -500 
            LINE N 608 -512 672 -512 
            RECTANGLE N 608 -460 672 -436 
            LINE N 608 -448 672 -448 
            RECTANGLE N 608 -492 672 -468 
            LINE N 608 -480 672 -480 
            RECTANGLE N 608 -428 672 -404 
            LINE N 608 -416 672 -416 
            RECTANGLE N 608 -396 672 -372 
            LINE N 608 -384 672 -384 
            RECTANGLE N 608 -364 672 -340 
            LINE N 608 -352 672 -352 
            RECTANGLE N 608 -332 672 -308 
            LINE N 608 -320 672 -320 
            RECTANGLE N 608 -300 672 -276 
            LINE N 608 -288 672 -288 
            RECTANGLE N 608 -268 672 -244 
            LINE N 608 -256 672 -256 
            RECTANGLE N 608 -236 672 -212 
            LINE N 608 -224 672 -224 
            RECTANGLE N 608 -204 672 -180 
            LINE N 608 -192 672 -192 
            RECTANGLE N 608 -172 672 -148 
            LINE N 608 -160 672 -160 
            RECTANGLE N 608 -140 672 -116 
            LINE N 608 -128 672 -128 
            RECTANGLE N 608 -108 672 -84 
            LINE N 608 -96 672 -96 
            RECTANGLE N 608 -76 672 -52 
            LINE N 608 -64 672 -64 
            RECTANGLE N 608 -44 672 -20 
            LINE N 608 -32 672 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF synchronous_latch
            TIMESTAMP 2009 10 6 21 25 16
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            LINE N 64 -112 80 -96 
            LINE N 80 -96 64 -80 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF ram16384x24
            TIMESTAMP 2009 10 19 19 49 27
            RECTANGLE N 32 32 320 432 
            BEGIN LINE W 0 64 32 64 
            END LINE
            BEGIN LINE W 0 160 32 160 
            END LINE
            BEGIN LINE W 0 112 32 112 
            END LINE
            LINE N 0 208 32 208 
            BEGIN LINE W 0 352 32 352 
            END LINE
            LINE N 0 400 32 400 
            BEGIN LINE W 352 400 320 400 
            END LINE
        END BLOCKDEF
        BEGIN BLOCK USBio USB_IO
            PIN IFCLK IFCLK
            PIN xSLOE xSLOE
            PIN xFIFOADR0 xFIFOADR(0)
            PIN xFIFOADR1 xFIFOADR(1)
            PIN xPKTEND xPKTEND
            PIN xSLWR xSLWR
            PIN xSLRD xSLRD
            PIN WAKEUP WAKEUP
            PIN CTL2 CTL2
            PIN CTL1 CTL1
            PIN CTL0 CTL0
            PIN PA7 PA7
            PIN PA3 PA3
            PIN PA1 PA1
            PIN PA0 PA0
            PIN CLKOUT CLKOUT
            PIN xTOGGLE xTOGGLE
            PIN xDATA_OUT(15:0) xFPGA_DATA(15:0)
            PIN xIFCLK xIFCLK
            PIN PA2 PA2
            PIN PA4 PA4
            PIN PA5 PA5
            PIN PA6 PA6
            PIN RDY1 RDY1
            PIN RDY0 RDY0
            PIN xFLAGA xFLAGA
            PIN xFLAGB xFLAGB
            PIN xFLAGC xFLAGC
            PIN xWAKEUP xWAKEUP
            PIN xUSB_DATA(15:0) xUSB_DATA(15:0)
            PIN FD(15:0) FD(15:0)
        END BLOCK
        BEGIN BLOCK USB_read USBread
            PIN xIFCLK xIFCLK
            PIN xFLAGA xFLAGA
            PIN xRESET xRESET
            PIN xWBUSY xWBUSY
            PIN xUSB_DATA(15:0) xUSB_DATA(15:0)
            PIN xRBUSY xRBUSY
            PIN xSLOE xSLOE
            PIN xSLRD xSLRD
            PIN xSYNC_USB xSYNC_USB
            PIN xSOFT_TRIG xSOFT_TRIG
            PIN xTOGGLE xTOGGLE
            PIN xFIFOADR(1:0) xFIFOADR(1:0)
            PIN xWRITE(23:0)
            PIN xWADDR(13:0)
            PIN xTX_LENGTH(13:0)
            PIN xW_EN(3:0)
            PIN xW_STRB
        END BLOCK
        BEGIN BLOCK RESET_CTRL PROGRESET
            PIN CLK xIFCLK
            PIN GLRST xRESET
            PIN WAKEUP xWAKEUP
            PIN Clr_all xCLR_ALL
        END BLOCK
        BEGIN BLOCK USB_write USBwrite
            PIN xIFCLK xIFCLK
            PIN xFLAGB xFLAGB
            PIN xFLAGC xFLAGC
            PIN xRBUSY xRBUSY
            PIN xRESET xRESET
            PIN xSTART xSTART
            PIN xSYNC_USB xSYNC_USB
            PIN xDONE xDONE
            PIN xPKTEND xPKTEND
            PIN xSLWR xSLWR
            PIN xWBUSY xWBUSY
            PIN xactive
        END BLOCK
        BEGIN BLOCK usbmess MESS
            PIN xSLWR xSLWR
            PIN xSTART xSTART
            PIN xDONE xDONE
            PIN xCLR_ALL xCLR_ALL
            PIN xREAD(23:0) xREAD0(23:0)
            PIN xFPGA_DATA(15:0) xFPGA_DATA(15:0)
            PIN xRADDR(13:0)
            PIN active
        END BLOCK
        BEGIN BLOCK XLXI_230 ibufg
            PIN I BCLK
            PIN O XLXN_2010
        END BLOCK
        BEGIN BLOCK XLXI_705 bufg
            PIN I XLXN_2010
            PIN O buffered_BCLK
        END BLOCK
        BEGIN BLOCK dspjtag dsp_jtag
            PIN TDI_JTAG TDI_JTAG
            PIN TRST_JTAG TRST_JTAG
            PIN TCK_JTAG TCK_JTAG
            PIN TMS_JTAG TMS_JTAG
            PIN DSP_EMU DSP_EMU
            PIN TDO_JTAG TDO_JTAG
            PIN EMU_JTAG EMU_JTAG
            PIN dsp0_tdo DSP_TDO_0
            PIN dsp1_tdo DSP_TDO_1
            PIN dsp0_trst DSP_TRST_0
            PIN dsp1_trst DSP_TRST_1
            PIN dsp0_tck DSP_TCK_0
            PIN dsp1_tck DSP_TCK_1
            PIN dsp1_tms DSP_TMS_1
            PIN dsp0_tms DSP_TMS_0
            PIN dsp1_tdi DSP_TDI_1
            PIN dsp0_tdi DSP_TDI_0
        END BLOCK
        BEGIN BLOCK dspcontrol dsp_control
            PIN xbmode0
            PIN dsp1_bmode0 dsp1_bmode0
            PIN dsp0_bmode0 dsp0_bmode0
            PIN dsp1_bmode1 dsp1_bmode1
            PIN dsp0_bmode1 dsp0_bmode1
            PIN xbmode1
            PIN dsp0_nmi1 dsp0_nmi1
            PIN dsp0_nmi0 dsp0_nmi0
            PIN dsp1_nmi0 dsp1_nmi0
            PIN dsp1_nmi1 dsp1_nmi1
            PIN dsp1_bus_ready dsp1_bus_ready
            PIN dsp0_bus_ready dsp0_bus_ready
            PIN dsp1_async_ready dsp1_async_ready
            PIN dsp0_async_ready dsp0_async_ready
            PIN dsp0_bypass dsp0_bypass
            PIN xbypass xbypass
            PIN dsp1_bypass dsp1_bypass
        END BLOCK
        BEGIN BLOCK dspreset dsp_reset
            PIN dsp_clock xdsp_clock
            PIN dsp_pll_bypass xbypass
            PIN dsp_reset_button XLXN_1754
            PIN dsp0_reset dsp0_reset
            PIN dsp1_reset dsp1_reset
            PIN xdsp_reset
        END BLOCK
        BEGIN BLOCK XLXI_866 gnd
            PIN G XLXN_1754
        END BLOCK
        BEGIN BLOCK dspclocks dsp_clocks
            PIN xdsp_ppi_clock xdsp_ppi_clock
            PIN xBCLK buffered_BCLK
            PIN dsp0_ppi0_clock dsp0_ppi0_clock
            PIN dsp0_ppi1_clock dsp0_ppi1_clock
            PIN dsp1_ppi0_clock dsp1_ppi0_clock
            PIN dsp1_ppi1_clock dsp1_ppi1_clock
            PIN dsp1_clock dsp1_clock
            PIN reset xCLR_ALL
            PIN xdsp_clock xdsp_clock
            PIN dsp0_clock dsp0_clock
        END BLOCK
        BEGIN BLOCK XLXI_679 ibuf
            PIN I dsp0_pf0
            PIN O XLXN_2629
        END BLOCK
        BEGIN BLOCK XLXI_824 ibuf
            PIN I dsp0_pf1
            PIN O XLXN_2628
        END BLOCK
        BEGIN BLOCK XLXI_826 ibuf
            PIN I dsp0_pf2
            PIN O XLXN_2627
        END BLOCK
        BEGIN BLOCK XLXI_828 ibuf
            PIN I dsp0_pf3
            PIN O XLXN_2626
        END BLOCK
        BEGIN BLOCK XLXI_895 ibuf
            PIN I dsp0_pf4
            PIN O XLXN_2625
        END BLOCK
        BEGIN BLOCK XLXI_896 ibuf
            PIN I dsp0_pf5
            PIN O XLXN_2624
        END BLOCK
        BEGIN BLOCK XLXI_897 ibuf
            PIN I dsp0_pf6
            PIN O XLXN_2623
        END BLOCK
        BEGIN BLOCK XLXI_823 obuf
            PIN I XLXN_2625
            PIN O mon4
        END BLOCK
        BEGIN BLOCK XLXI_825 obuf
            PIN I XLXN_2624
            PIN O mon5
        END BLOCK
        BEGIN BLOCK XLXI_827 obuf
            PIN I XLXN_2623
            PIN O mon6
        END BLOCK
        BEGIN BLOCK XLXI_209 obuf
            PIN I XLXN_2628
            PIN O mon1
        END BLOCK
        BEGIN BLOCK XLXI_229 obuf
            PIN I XLXN_2627
            PIN O mon2
        END BLOCK
        BEGIN BLOCK XLXI_894 obuf
            PIN I XLXN_2626
            PIN O mon3
        END BLOCK
        BEGIN BLOCK XLXI_915 obuf
            PIN I XLXN_2629
            PIN O mon0
        END BLOCK
        BEGIN BLOCK ppi_block ppi
            PIN data_pending XLXN_2629
            PIN ppi_clock xdsp_ppi_clock
            PIN reset xCLR_ALL
            PIN sync dsp0_ppi0_sync1
            PIN fifo_address(14:0) xRADDR0(14:0)
            PIN xppi_fifo_counting XLXN_2633
            PIN last clear_lam
        END BLOCK
        BEGIN BLOCK aurora_testblock TEST_BLOCK
            PIN xCLK xCLK
            PIN xSTART_TX_XFER(3:0) xSTART_TX_XFER(3:0)
            PIN xDONE_TX_XFER(3:0) xDONE_TX_XFER(3:0)
            PIN xTX_ADDR0(13:0) xTX_ADDR0(13:0)
            PIN xTX_ADDR1(13:0) xTX_ADDR1(13:0)
            PIN xTX_ADDR2(13:0) xTX_ADDR2(13:0)
            PIN xTX_ADDR3(13:0) xTX_ADDR3(13:0)
            PIN xTX_XFER_EN(3:0) xTX_XFER_EN(3:0)
            PIN xLAM(3:0) xLAM(3:0)
            PIN xRX_DATA0(23:0) xRX_DATA0(23:0)
            PIN xRX_LENGTH3(13:0) xRX_LENGTH3(13:0)
            PIN xRX_LENGTH2(13:0) xRX_LENGTH2(13:0)
            PIN xRX_LENGTH1(13:0) xRX_LENGTH1(13:0)
            PIN xRX_LENGTH0(13:0) xRX_LENGTH0(13:0)
            PIN xRX_DATA3(23:0) xRX_DATA3(23:0)
            PIN xRX_DATA2(23:0) xRX_DATA2(23:0)
            PIN xRX_DATA1(23:0) xRX_DATA1(23:0)
            PIN xRX_ADDR0(13:0) xRX_ADDR0(13:0)
            PIN xRX_ADDR1(13:0) xRX_ADDR1(13:0)
            PIN xRX_ADDR2(13:0) xRX_ADDR2(13:0)
            PIN xRX_ADDR3(13:0) xRX_ADDR3(13:0)
            PIN xRX_XFER_EN(3:0) xRX_XFER_EN(3:0)
            PIN xUPSTREAM_TRIG(3:0) xUPSTREAM_TRIG(3:0)
            PIN xUPSTREAM_CLR(3:0) xUPSTREAM_CLR(3:0)
            PIN xTX_DATA0(23:0) xTX_DATA0(23:0)
            PIN xTX_DATA1(23:0) xTX_DATA1(23:0)
            PIN xTX_DATA2(23:0) xTX_DATA2(23:0)
            PIN xTX_DATA3(23:0) xTX_DATA3(23:0)
            PIN xTX_LENGTH0(13:0) xTX_LENGTH0(13:0)
            PIN xTX_LENGTH1(13:0) xTX_LENGTH1(13:0)
            PIN xTX_LENGTH2(13:0) xTX_LENGTH2(13:0)
            PIN xTX_LENGTH3(13:0) xTX_LENGTH3(13:0)
            PIN xDOWNSTREAM_TRIG(3:0) xDOWNSTREAM_TRIG(3:0)
            PIN xDOWNSTREAM_CLR(3:0) xDOWNSTREAM_CLR(3:0)
            PIN xCLR_LAM(3:0) xCLR_LAM(3:0)
            PIN xCLEAR_LAM XLXN_2962
        END BLOCK
        BEGIN BLOCK auroratop Aurora_TOP
            PIN BCLK buffered_BCLK
            PIN xCLK xCLK
            PIN MOD0(3:0) MOD0(3:0)
            PIN MOD2(3:0) MOD2(3:0)
            PIN RX_LOSS(3:0) LOSS(3:0)
            PIN TX_FAULT(3:0) TX_FAULT(3:0)
            PIN RXP(3:0) RXP(3:0)
            PIN RXN(3:0) RXN(3:0)
            PIN xSTART_TX_XFER(3:0) xSTART_TX_XFER(3:0)
            PIN xTX_DATA1(23:0) xTX_DATA1(23:0)
            PIN xTX_DATA0(23:0) xTX_DATA0(23:0)
            PIN xTX_DATA2(23:0) xTX_DATA2(23:0)
            PIN xTX_DATA3(23:0) xTX_DATA3(23:0)
            PIN xTX_LENGTH0(13:0) xTX_LENGTH0(13:0)
            PIN xTX_LENGTH1(13:0) xTX_LENGTH1(13:0)
            PIN xTX_LENGTH2(13:0) xTX_LENGTH2(13:0)
            PIN xTX_LENGTH3(13:0) xTX_LENGTH3(13:0)
            PIN xDOWNSTREAM_TRIG(3:0) xDOWNSTREAM_TRIG(3:0)
            PIN xDOWNSTREAM_CLR(3:0) xDOWNSTREAM_CLR(3:0)
            PIN xCLR_LAM(3:0) xCLR_LAM(3:0)
            PIN MOD1(3:0) MOD1(3:0)
            PIN TX_DIS(3:0) TX_DIS(3:0)
            PIN TXP(3:0) TXP(3:0)
            PIN TXN(3:0) TXN(3:0)
            PIN xDONE_TX_XFER(3:0) xDONE_TX_XFER(3:0)
            PIN xTX_ADDR0(13:0) xTX_ADDR0(13:0)
            PIN xTX_ADDR1(13:0) xTX_ADDR1(13:0)
            PIN xTX_ADDR2(13:0) xTX_ADDR2(13:0)
            PIN xTX_ADDR3(13:0) xTX_ADDR3(13:0)
            PIN xTX_XFER_EN(3:0) xTX_XFER_EN(3:0)
            PIN xLAM(3:0) xLAM(3:0)
            PIN xRX_DATA0(23:0) xRX_DATA0(23:0)
            PIN xRX_DATA2(23:0) xRX_DATA2(23:0)
            PIN xRX_DATA1(23:0) xRX_DATA1(23:0)
            PIN xRX_DATA3(23:0) xRX_DATA3(23:0)
            PIN xRX_LENGTH0(13:0) xRX_LENGTH0(13:0)
            PIN xRX_LENGTH1(13:0) xRX_LENGTH1(13:0)
            PIN xRX_LENGTH2(13:0) xRX_LENGTH2(13:0)
            PIN xRX_LENGTH3(13:0) xRX_LENGTH3(13:0)
            PIN xRX_ADDR0(13:0) xRX_ADDR0(13:0)
            PIN xRX_ADDR1(13:0) xRX_ADDR1(13:0)
            PIN xRX_ADDR2(13:0) xRX_ADDR2(13:0)
            PIN xRX_ADDR3(13:0) xRX_ADDR3(13:0)
            PIN xRX_XFER_EN(3:0) xRX_XFER_EN(3:0)
            PIN xUPSTREAM_TRIG(3:0) xUPSTREAM_TRIG(3:0)
            PIN xUPSTREAM_CLR(3:0) xUPSTREAM_CLR(3:0)
            PIN xLINK_ACTIVE(3:0) xLINK_ACTIVE(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_918 buf
            PIN I XLXN_2953
            PIN O xSTART
        END BLOCK
        BEGIN BLOCK XLXI_954 synchronous_latch
            PIN slatch xSOFT_TRIG
            PIN clock xCLK
            PIN clear XLXN_2956
            PIN Q XLXN_2953
        END BLOCK
        BEGIN BLOCK XLXI_955 or2
            PIN I0 xCLR_ALL
            PIN I1 xDONE
            PIN O XLXN_2956
        END BLOCK
        BEGIN BLOCK XLXI_956 buf
            PIN I xRX_XFER_EN(0)
            PIN O XLXN_2961(0:0)
        END BLOCK
        BEGIN BLOCK XLXI_957 or2
            PIN I0 clear_lam
            PIN I1 xCLR_ALL
            PIN O XLXN_2962
        END BLOCK
        BEGIN BLOCK XLXI_959 synchronous_latch
            PIN slatch xLAM(0)
            PIN clock xCLK
            PIN clear xCLR_ALL
            PIN Q XLXN_2964
        END BLOCK
        BEGIN BLOCK XLXI_958 obuf
            PIN I XLXN_2964
            PIN O led_green
        END BLOCK
        BEGIN BLOCK XLXI_917 obuf
            PIN I XLXN_2633
            PIN O mon7
        END BLOCK
        BEGIN BLOCK XLXI_960 inv
            PIN I xdsp_ppi_clock
            PIN O XLXN_2965
        END BLOCK
        BEGIN BLOCK obuf12_to_16 obuf12to16
            PIN i(11:0) XLXN_2966(11:0)
            PIN o(15:0) dsp0_ppi0(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_961 ram16384x24
            PIN addra(13:0) xRX_ADDR0(13:0)
            PIN wea(0:0) XLXN_2961(0:0)
            PIN dina(23:0) xRX_DATA0(23:0)
            PIN clka xCLK
            PIN addrb(14:0) xRADDR0(14:0)
            PIN clkb XLXN_2965
            PIN doutb(11:0) XLXN_2966(11:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN BRANCH PA0
            WIRE 4480 672 4512 672
        END BRANCH
        BEGIN BRANCH PA1
            WIRE 4480 640 4512 640
        END BRANCH
        BEGIN BRANCH xFIFOADR(0)
            WIRE 4480 288 4512 288
            BEGIN DISPLAY 4480 288 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFIFOADR(1)
            WIRE 4480 320 4512 320
            BEGIN DISPLAY 4480 320 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xPKTEND
            WIRE 4480 352 4512 352
            BEGIN DISPLAY 4480 352 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSLWR
            WIRE 4480 384 4512 384
            BEGIN DISPLAY 4480 384 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSLRD
            WIRE 4480 416 4512 416
            BEGIN DISPLAY 4480 416 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WAKEUP
            WIRE 4480 448 4512 448
        END BRANCH
        BEGIN BRANCH CTL2
            WIRE 4480 480 4512 480
        END BRANCH
        BEGIN BRANCH CTL1
            WIRE 4480 512 4512 512
        END BRANCH
        BEGIN BRANCH CTL0
            WIRE 4480 544 4512 544
        END BRANCH
        BEGIN BRANCH PA7
            WIRE 4480 576 4512 576
        END BRANCH
        BEGIN BRANCH PA3
            WIRE 4480 608 4512 608
        END BRANCH
        BEGIN BRANCH CLKOUT
            WIRE 4480 704 4512 704
        END BRANCH
        BEGIN BRANCH xTOGGLE
            WIRE 4480 736 4512 736
            BEGIN DISPLAY 4480 736 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFPGA_DATA(15:0)
            WIRE 4480 768 4512 768
            BEGIN DISPLAY 4480 768 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSLOE
            WIRE 4480 256 4512 256
            BEGIN DISPLAY 4480 256 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE USBio 4576 800 R0
        END INSTANCE
        BEGIN BRANCH IFCLK
            WIRE 4496 224 4512 224
        END BRANCH
        BEGIN BRANCH xFLAGB
            WIRE 4480 1056 4512 1056
            BEGIN DISPLAY 4480 1056 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFLAGC
            WIRE 4480 1088 4512 1088
            BEGIN DISPLAY 4480 1088 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRBUSY
            WIRE 4480 1120 4512 1120
            BEGIN DISPLAY 4480 1120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRESET
            WIRE 4480 1152 4512 1152
            BEGIN DISPLAY 4480 1152 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSYNC_USB
            WIRE 4480 1216 4512 1216
            BEGIN DISPLAY 4480 1216 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xPKTEND
            WIRE 5008 1056 5024 1056
            BEGIN DISPLAY 5024 1056 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSLWR
            WIRE 5008 1088 5024 1088
            BEGIN DISPLAY 5024 1088 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xWBUSY
            WIRE 5008 1120 5024 1120
            BEGIN DISPLAY 5024 1120 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xIFCLK
            WIRE 4480 1024 4512 1024
            BEGIN DISPLAY 4480 1024 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSLWR
            WIRE 4496 832 4512 832
            BEGIN DISPLAY 4496 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLR_ALL
            WIRE 4496 928 4512 928
            BEGIN DISPLAY 4496 928 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFPGA_DATA(15:0)
            WIRE 5008 832 5040 832
            BEGIN DISPLAY 5040 832 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSTART
            WIRE 4480 1184 4512 1184
            BEGIN DISPLAY 4480 1184 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFIFOADR(1:0)
            WIRE 5008 1328 5024 1328
            BEGIN DISPLAY 5024 1328 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTOGGLE
            WIRE 5008 1456 5024 1456
            BEGIN DISPLAY 5024 1456 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSYNC_USB
            WIRE 5008 1488 5024 1488
            BEGIN DISPLAY 5024 1488 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSLRD
            WIRE 5008 1424 5024 1424
            BEGIN DISPLAY 5024 1424 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSLOE
            WIRE 5008 1392 5024 1392
            BEGIN DISPLAY 5024 1392 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRBUSY
            WIRE 5008 1360 5024 1360
            BEGIN DISPLAY 5024 1360 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE USB_read 4576 1680 R0
        END INSTANCE
        BEGIN BRANCH xSTART
            WIRE 4496 864 4512 864
            BEGIN DISPLAY 4496 864 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDONE
            WIRE 4496 896 4512 896
            BEGIN DISPLAY 4496 896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDONE
            WIRE 5008 1024 5024 1024
            BEGIN DISPLAY 5024 1024 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xREAD0(23:0)
            WIRE 4496 960 4512 960
            BEGIN DISPLAY 4496 960 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PA2
            WIRE 5008 256 5040 256
        END BRANCH
        BEGIN BRANCH PA4
            WIRE 5008 288 5040 288
        END BRANCH
        BEGIN BRANCH PA5
            WIRE 5008 320 5040 320
        END BRANCH
        BEGIN BRANCH PA6
            WIRE 5008 352 5040 352
        END BRANCH
        BEGIN BRANCH RDY1
            WIRE 5008 384 5040 384
        END BRANCH
        BEGIN BRANCH xFLAGA
            WIRE 5008 448 5040 448
            BEGIN DISPLAY 5040 448 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFLAGB
            WIRE 5008 480 5040 480
            BEGIN DISPLAY 5040 480 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFLAGC
            WIRE 5008 512 5040 512
            BEGIN DISPLAY 5040 512 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xWAKEUP
            WIRE 5008 544 5040 544
            BEGIN DISPLAY 5040 544 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(15:0)
            WIRE 5008 608 5040 608
        END BRANCH
        BEGIN BRANCH xIFCLK
            WIRE 5008 224 5040 224
            BEGIN DISPLAY 5040 224 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RDY0
            WIRE 5008 416 5040 416
        END BRANCH
        BEGIN BRANCH xUSB_DATA(15:0)
            WIRE 5008 576 5040 576
            BEGIN DISPLAY 5040 576 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE RESET_CTRL 4576 160 R0
        END INSTANCE
        BEGIN BRANCH xIFCLK
            WIRE 4544 128 4576 128
            BEGIN DISPLAY 4544 128 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRESET
            WIRE 4960 128 4992 128
            BEGIN DISPLAY 4992 128 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xWAKEUP
            WIRE 4544 160 4576 160
            BEGIN DISPLAY 4544 160 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLR_ALL
            WIRE 4960 160 4992 160
            BEGIN DISPLAY 4992 160 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE USB_write 4512 1248 R0
        END INSTANCE
        BEGIN BRANCH xIFCLK
            WIRE 4480 1328 4512 1328
            BEGIN DISPLAY 4480 1328 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xFLAGA
            WIRE 4480 1360 4512 1360
            BEGIN DISPLAY 4480 1360 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRESET
            WIRE 4480 1392 4512 1392
            BEGIN DISPLAY 4480 1392 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xUSB_DATA(15:0)
            WIRE 4480 1456 4512 1456
            BEGIN DISPLAY 4480 1456 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xWBUSY
            WIRE 4480 1424 4512 1424
            BEGIN DISPLAY 4480 1424 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSOFT_TRIG
            WIRE 5008 1520 5040 1520
            BEGIN DISPLAY 5040 1520 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE usbmess 4512 1120 R0
        END INSTANCE
        BEGIN BRANCH xSTART
            WIRE 5200 1824 5216 1824
            BEGIN DISPLAY 5216 1824 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        IOMARKER 4480 672 PA0 R180 28
        IOMARKER 4480 640 PA1 R180 28
        IOMARKER 4480 448 WAKEUP R180 28
        IOMARKER 4480 480 CTL2 R180 28
        IOMARKER 4480 512 CTL1 R180 28
        IOMARKER 4480 544 CTL0 R180 28
        IOMARKER 4480 576 PA7 R180 28
        IOMARKER 4480 608 PA3 R180 28
        IOMARKER 4480 704 CLKOUT R180 28
        IOMARKER 4496 224 IFCLK R180 28
        IOMARKER 5040 256 PA2 R0 28
        IOMARKER 5040 288 PA4 R0 28
        IOMARKER 5040 320 PA5 R0 28
        IOMARKER 5040 352 PA6 R0 28
        IOMARKER 5040 384 RDY1 R0 28
        IOMARKER 5040 608 FD(15:0) R0 28
        IOMARKER 5040 416 RDY0 R0 28
        BEGIN BRANCH buffered_BCLK
            WIRE 640 1984 656 1984
            WIRE 656 1984 688 1984
            WIRE 656 80 656 1984
            WIRE 656 80 768 80
            WIRE 768 80 1872 80
            BEGIN DISPLAY 768 80 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_2010
            WIRE 384 1984 416 1984
        END BRANCH
        BEGIN BRANCH BCLK
            WIRE 144 1984 160 1984
        END BRANCH
        INSTANCE XLXI_230 160 2016 R0
        INSTANCE XLXI_705 416 2016 R0
        BEGIN BRANCH xCLR_ALL
            WIRE 672 2208 688 2208
            BEGIN DISPLAY 672 2208 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DSP_TDO_0
            WIRE 624 3376 656 3376
        END BRANCH
        BEGIN BRANCH DSP_TDO_1
            WIRE 624 3408 656 3408
        END BRANCH
        BEGIN BRANCH DSP_EMU
            WIRE 624 3296 656 3296
        END BRANCH
        BEGIN BRANCH TRST_JTAG
            WIRE 624 3200 656 3200
        END BRANCH
        BEGIN BRANCH TCK_JTAG
            WIRE 624 3232 656 3232
        END BRANCH
        BEGIN BRANCH TMS_JTAG
            WIRE 624 3264 656 3264
        END BRANCH
        BEGIN BRANCH TDI_JTAG
            WIRE 624 3168 656 3168
        END BRANCH
        BEGIN BRANCH TDO_JTAG
            WIRE 1104 3168 1120 3168
        END BRANCH
        BEGIN BRANCH EMU_JTAG
            WIRE 1104 3200 1120 3200
        END BRANCH
        BEGIN BRANCH DSP_TDI_0
            WIRE 1104 3440 1120 3440
        END BRANCH
        BEGIN BRANCH DSP_TDI_1
            WIRE 1104 3472 1120 3472
        END BRANCH
        BEGIN BRANCH DSP_TCK_0
            WIRE 1104 3312 1120 3312
        END BRANCH
        BEGIN BRANCH DSP_TCK_1
            WIRE 1104 3344 1120 3344
        END BRANCH
        BEGIN BRANCH DSP_TMS_1
            WIRE 1104 3408 1120 3408
        END BRANCH
        BEGIN BRANCH DSP_TMS_0
            WIRE 1104 3376 1120 3376
        END BRANCH
        BEGIN BRANCH DSP_TRST_0
            WIRE 1104 3248 1120 3248
        END BRANCH
        BEGIN BRANCH DSP_TRST_1
            WIRE 1104 3280 1120 3280
        END BRANCH
        BEGIN INSTANCE dspjtag 656 3776 R0
        END INSTANCE
        BEGIN BRANCH xbypass
            WIRE 1104 2624 1408 2624
            WIRE 1408 2320 1408 2624
            WIRE 1408 2320 1472 2320
            WIRE 1472 2320 1536 2320
            BEGIN DISPLAY 1472 2320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH dsp0_bmode0
            WIRE 1104 2432 1120 2432
        END BRANCH
        BEGIN BRANCH dsp1_bmode0
            WIRE 1104 2464 1120 2464
        END BRANCH
        BEGIN BRANCH dsp0_bmode1
            WIRE 1104 2544 1120 2544
        END BRANCH
        BEGIN BRANCH dsp1_bmode1
            WIRE 1104 2576 1120 2576
        END BRANCH
        BEGIN BRANCH dsp0_bypass
            WIRE 1104 2656 1120 2656
        END BRANCH
        BEGIN BRANCH dsp1_bypass
            WIRE 1104 2688 1120 2688
        END BRANCH
        BEGIN BRANCH dsp0_nmi0
            WIRE 1104 2736 1120 2736
        END BRANCH
        BEGIN BRANCH dsp1_nmi0
            WIRE 1104 2768 1120 2768
        END BRANCH
        BEGIN BRANCH dsp0_nmi1
            WIRE 1104 2816 1120 2816
        END BRANCH
        BEGIN BRANCH dsp1_nmi1
            WIRE 1104 2848 1120 2848
        END BRANCH
        BEGIN BRANCH dsp0_bus_ready
            WIRE 1104 2896 1120 2896
        END BRANCH
        BEGIN BRANCH dsp1_bus_ready
            WIRE 1104 2928 1120 2928
        END BRANCH
        BEGIN BRANCH dsp0_async_ready
            WIRE 1104 2976 1120 2976
        END BRANCH
        BEGIN BRANCH dsp1_async_ready
            WIRE 1104 3008 1120 3008
        END BRANCH
        BEGIN INSTANCE dspcontrol 720 3456 R0
        END INSTANCE
        BEGIN BRANCH dsp0_ppi0_clock
            WIRE 1104 2032 1120 2032
        END BRANCH
        BEGIN BRANCH dsp0_ppi1_clock
            WIRE 1104 2064 1120 2064
        END BRANCH
        BEGIN BRANCH dsp1_ppi0_clock
            WIRE 1104 2096 1120 2096
        END BRANCH
        BEGIN BRANCH dsp1_ppi1_clock
            WIRE 1104 2128 1120 2128
        END BRANCH
        BEGIN BRANCH dsp0_clock
            WIRE 1104 2176 1120 2176
        END BRANCH
        BEGIN BRANCH dsp1_clock
            WIRE 1104 2208 1120 2208
        END BRANCH
        BEGIN BRANCH xdsp_ppi_clock
            WIRE 1104 1984 1296 1984
        END BRANCH
        BEGIN BRANCH xdsp_clock
            WIRE 1104 2256 1536 2256
        END BRANCH
        BEGIN INSTANCE dspreset 1536 2416 R0
        END INSTANCE
        BEGIN BRANCH dsp0_reset
            WIRE 2016 2320 2032 2320
        END BRANCH
        BEGIN BRANCH dsp1_reset
            WIRE 2016 2384 2032 2384
        END BRANCH
        BEGIN BRANCH XLXN_1754
            WIRE 1504 2384 1504 2400
            WIRE 1504 2384 1536 2384
        END BRANCH
        INSTANCE XLXI_866 1440 2528 R0
        BEGIN INSTANCE dspclocks 720 2400 R0
        END INSTANCE
        IOMARKER 144 1984 BCLK R180 28
        IOMARKER 624 3376 DSP_TDO_0 R180 28
        IOMARKER 624 3408 DSP_TDO_1 R180 28
        IOMARKER 624 3296 DSP_EMU R180 28
        IOMARKER 624 3200 TRST_JTAG R180 28
        IOMARKER 624 3232 TCK_JTAG R180 28
        IOMARKER 624 3264 TMS_JTAG R180 28
        IOMARKER 624 3168 TDI_JTAG R180 28
        IOMARKER 1120 2432 dsp0_bmode0 R0 28
        IOMARKER 1120 2464 dsp1_bmode0 R0 28
        IOMARKER 1120 2544 dsp0_bmode1 R0 28
        IOMARKER 1120 2576 dsp1_bmode1 R0 28
        IOMARKER 1120 2656 dsp0_bypass R0 28
        IOMARKER 1120 2688 dsp1_bypass R0 28
        IOMARKER 1120 2736 dsp0_nmi0 R0 28
        IOMARKER 1120 2768 dsp1_nmi0 R0 28
        IOMARKER 1120 2816 dsp0_nmi1 R0 28
        IOMARKER 1120 2848 dsp1_nmi1 R0 28
        IOMARKER 1120 2896 dsp0_bus_ready R0 28
        IOMARKER 1120 2928 dsp1_bus_ready R0 28
        IOMARKER 1120 2976 dsp0_async_ready R0 28
        IOMARKER 1120 3008 dsp1_async_ready R0 28
        IOMARKER 1120 2208 dsp1_clock R0 28
        IOMARKER 1120 2176 dsp0_clock R0 28
        IOMARKER 1120 2128 dsp1_ppi1_clock R0 28
        IOMARKER 1120 2096 dsp1_ppi0_clock R0 28
        IOMARKER 1120 2064 dsp0_ppi1_clock R0 28
        IOMARKER 1120 2032 dsp0_ppi0_clock R0 28
        IOMARKER 1120 3168 TDO_JTAG R0 28
        IOMARKER 1120 3200 EMU_JTAG R0 28
        IOMARKER 1120 3440 DSP_TDI_0 R0 28
        IOMARKER 1120 3472 DSP_TDI_1 R0 28
        IOMARKER 1120 3312 DSP_TCK_0 R0 28
        IOMARKER 1120 3344 DSP_TCK_1 R0 28
        IOMARKER 1120 3408 DSP_TMS_1 R0 28
        IOMARKER 1120 3376 DSP_TMS_0 R0 28
        IOMARKER 1120 3248 DSP_TRST_0 R0 28
        IOMARKER 1120 3280 DSP_TRST_1 R0 28
        IOMARKER 2032 2320 dsp0_reset R0 28
        IOMARKER 2032 2384 dsp1_reset R0 28
        INSTANCE XLXI_679 1904 2944 R0
        BEGIN BRANCH dsp0_pf1
            WIRE 1872 2976 1904 2976
        END BRANCH
        INSTANCE XLXI_824 1904 3008 R0
        BEGIN BRANCH dsp0_pf2
            WIRE 1872 3040 1904 3040
        END BRANCH
        INSTANCE XLXI_826 1904 3072 R0
        BEGIN BRANCH dsp0_pf3
            WIRE 1872 3104 1904 3104
        END BRANCH
        INSTANCE XLXI_828 1904 3136 R0
        BEGIN BRANCH dsp0_pf0
            WIRE 1872 2912 1904 2912
        END BRANCH
        BEGIN BRANCH dsp0_pf4
            WIRE 1872 3168 1904 3168
        END BRANCH
        BEGIN BRANCH dsp0_pf5
            WIRE 1872 3232 1904 3232
        END BRANCH
        BEGIN BRANCH dsp0_pf6
            WIRE 1872 3296 1904 3296
        END BRANCH
        INSTANCE XLXI_895 1904 3200 R0
        INSTANCE XLXI_896 1904 3264 R0
        INSTANCE XLXI_897 1904 3328 R0
        BEGIN BRANCH mon4
            WIRE 2384 3168 2400 3168
        END BRANCH
        BEGIN BRANCH mon5
            WIRE 2384 3232 2400 3232
        END BRANCH
        BEGIN BRANCH mon6
            WIRE 2384 3296 2400 3296
        END BRANCH
        INSTANCE XLXI_823 2160 3200 R0
        INSTANCE XLXI_825 2160 3264 R0
        INSTANCE XLXI_827 2160 3328 R0
        BEGIN BRANCH mon1
            WIRE 2384 2976 2400 2976
        END BRANCH
        BEGIN BRANCH mon2
            WIRE 2384 3040 2400 3040
        END BRANCH
        BEGIN BRANCH mon3
            WIRE 2384 3104 2400 3104
        END BRANCH
        INSTANCE XLXI_209 2160 3008 R0
        INSTANCE XLXI_229 2160 3072 R0
        INSTANCE XLXI_894 2160 3136 R0
        BEGIN BRANCH mon0
            WIRE 2384 2912 2400 2912
        END BRANCH
        INSTANCE XLXI_915 2160 2944 R0
        BEGIN BRANCH XLXN_2623
            WIRE 2128 3296 2160 3296
        END BRANCH
        BEGIN BRANCH XLXN_2624
            WIRE 2128 3232 2160 3232
        END BRANCH
        BEGIN BRANCH XLXN_2625
            WIRE 2128 3168 2160 3168
        END BRANCH
        BEGIN BRANCH XLXN_2626
            WIRE 2128 3104 2160 3104
        END BRANCH
        BEGIN BRANCH XLXN_2627
            WIRE 2128 3040 2160 3040
        END BRANCH
        BEGIN BRANCH XLXN_2628
            WIRE 2128 2976 2160 2976
        END BRANCH
        BEGIN BRANCH xdsp_ppi_clock
            WIRE 2768 2896 2784 2896
            BEGIN DISPLAY 2768 2896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE ppi_block 2784 2992 R0
        END INSTANCE
        BEGIN BRANCH xCLR_ALL
            WIRE 2768 2960 2784 2960
            BEGIN DISPLAY 2768 2960 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRADDR0(14:0)
            WIRE 3280 2896 3296 2896
            BEGIN DISPLAY 3296 2896 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_2633
            WIRE 3280 2960 3296 2960
            WIRE 3296 2960 3408 2960
        END BRANCH
        BEGIN BRANCH dsp0_ppi0_sync1
            WIRE 3280 2832 3312 2832
        END BRANCH
        BEGIN BRANCH XLXN_2629
            WIRE 2128 2912 2144 2912
            WIRE 2144 2912 2160 2912
            WIRE 2144 2832 2784 2832
            WIRE 2144 2832 2144 2912
        END BRANCH
        IOMARKER 1872 2912 dsp0_pf0 R180 28
        IOMARKER 1872 2976 dsp0_pf1 R180 28
        IOMARKER 1872 3040 dsp0_pf2 R180 28
        IOMARKER 1872 3104 dsp0_pf3 R180 28
        IOMARKER 1872 3168 dsp0_pf4 R180 28
        IOMARKER 1872 3232 dsp0_pf5 R180 28
        IOMARKER 1872 3296 dsp0_pf6 R180 28
        IOMARKER 2400 3168 mon4 R0 28
        IOMARKER 2400 3232 mon5 R0 28
        IOMARKER 2400 3296 mon6 R0 28
        IOMARKER 2400 2976 mon1 R0 28
        IOMARKER 2400 3040 mon2 R0 28
        IOMARKER 2400 3104 mon3 R0 28
        IOMARKER 2400 2912 mon0 R0 28
        IOMARKER 3312 2832 dsp0_ppi0_sync1 R0 28
        BEGIN BRANCH xRX_LENGTH0(13:0)
            WIRE 2608 592 2640 592
            BEGIN DISPLAY 2640 592 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLR_LAM(3:0)
            WIRE 2608 1360 2640 1360
            BEGIN DISPLAY 2640 1360 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDOWNSTREAM_CLR(3:0)
            WIRE 2608 1328 2640 1328
            BEGIN DISPLAY 2640 1328 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDOWNSTREAM_TRIG(3:0)
            WIRE 2608 1296 2640 1296
            BEGIN DISPLAY 2640 1296 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH3(13:0)
            WIRE 2608 1264 2640 1264
            BEGIN DISPLAY 2640 1264 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH2(13:0)
            WIRE 2608 1232 2640 1232
            BEGIN DISPLAY 2640 1232 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH1(13:0)
            WIRE 2608 1200 2640 1200
            BEGIN DISPLAY 2640 1200 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH0(13:0)
            WIRE 2608 1168 2640 1168
            BEGIN DISPLAY 2640 1168 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA3(23:0)
            WIRE 2608 1136 2640 1136
            BEGIN DISPLAY 2640 1136 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA2(23:0)
            WIRE 2608 1104 2640 1104
            BEGIN DISPLAY 2640 1104 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA1(23:0)
            WIRE 2608 1072 2640 1072
            BEGIN DISPLAY 2640 1072 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA0(23:0)
            WIRE 2608 1040 2640 1040
            BEGIN DISPLAY 2640 1040 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSTART_TX_XFER(3:0)
            WIRE 2608 1008 2640 1008
            BEGIN DISPLAY 2640 1008 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xUPSTREAM_CLR(3:0)
            WIRE 1840 1712 1872 1712
            BEGIN DISPLAY 1840 1712 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xUPSTREAM_TRIG(3:0)
            WIRE 1840 1680 1872 1680
            BEGIN DISPLAY 1840 1680 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_XFER_EN(3:0)
            WIRE 1840 1648 1872 1648
            BEGIN DISPLAY 1840 1648 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR3(13:0)
            WIRE 1840 1616 1872 1616
            BEGIN DISPLAY 1840 1616 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR2(13:0)
            WIRE 1840 1584 1872 1584
            BEGIN DISPLAY 1840 1584 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR1(13:0)
            WIRE 1840 1552 1872 1552
            BEGIN DISPLAY 1840 1552 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR0(13:0)
            WIRE 1840 1520 1872 1520
            BEGIN DISPLAY 1840 1520 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA1(23:0)
            WIRE 1840 1296 1872 1296
            BEGIN DISPLAY 1840 1296 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA2(23:0)
            WIRE 1840 1328 1872 1328
            BEGIN DISPLAY 1840 1328 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA3(23:0)
            WIRE 1840 1360 1872 1360
            BEGIN DISPLAY 1840 1360 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_LENGTH0(13:0)
            WIRE 1840 1392 1872 1392
            BEGIN DISPLAY 1840 1392 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_LENGTH1(13:0)
            WIRE 1840 1424 1872 1424
            BEGIN DISPLAY 1840 1424 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_LENGTH2(13:0)
            WIRE 1840 1456 1872 1456
            BEGIN DISPLAY 1840 1456 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_LENGTH3(13:0)
            WIRE 1840 1488 1872 1488
            BEGIN DISPLAY 1840 1488 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA0(23:0)
            WIRE 1840 1264 1872 1264
            BEGIN DISPLAY 1840 1264 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xLAM(3:0)
            WIRE 1840 1232 1872 1232
            BEGIN DISPLAY 1840 1232 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_XFER_EN(3:0)
            WIRE 1840 1200 1872 1200
            BEGIN DISPLAY 1840 1200 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_ADDR3(13:0)
            WIRE 1840 1168 1872 1168
            BEGIN DISPLAY 1840 1168 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_ADDR2(13:0)
            WIRE 1840 1136 1872 1136
            BEGIN DISPLAY 1840 1136 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_ADDR1(13:0)
            WIRE 1840 1104 1872 1104
            BEGIN DISPLAY 1840 1104 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_ADDR0(13:0)
            WIRE 1840 1072 1872 1072
            BEGIN DISPLAY 1840 1072 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDONE_TX_XFER(3:0)
            WIRE 1840 1040 1872 1040
            BEGIN DISPLAY 1840 1040 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLK
            WIRE 1840 1008 1872 1008
            BEGIN DISPLAY 1840 1008 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE aurora_testblock 1936 1744 R0
        END INSTANCE
        BEGIN BRANCH xTX_ADDR3(13:0)
            WIRE 2608 368 2640 368
            BEGIN DISPLAY 2640 368 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_ADDR2(13:0)
            WIRE 2608 336 2640 336
            BEGIN DISPLAY 2640 336 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_ADDR1(13:0)
            WIRE 2608 304 2640 304
            BEGIN DISPLAY 2640 304 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_ADDR0(13:0)
            WIRE 2608 272 2640 272
            BEGIN DISPLAY 2640 272 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xLINK_ACTIVE(3:0)
            WIRE 2608 944 2640 944
            BEGIN DISPLAY 2640 944 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xUPSTREAM_CLR(3:0)
            WIRE 2608 912 2640 912
            BEGIN DISPLAY 2640 912 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xUPSTREAM_TRIG(3:0)
            WIRE 2608 880 2640 880
            BEGIN DISPLAY 2640 880 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_LENGTH3(13:0)
            WIRE 2608 688 2640 688
            BEGIN DISPLAY 2640 688 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_LENGTH2(13:0)
            WIRE 2608 656 2640 656
            BEGIN DISPLAY 2640 656 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_LENGTH1(13:0)
            WIRE 2608 624 2640 624
            BEGIN DISPLAY 2640 624 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xLAM(3:0)
            WIRE 2608 432 2640 432
            BEGIN DISPLAY 2640 432 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_XFER_EN(3:0)
            WIRE 2608 400 2640 400
            BEGIN DISPLAY 2640 400 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR3(13:0)
            WIRE 2608 816 2640 816
            BEGIN DISPLAY 2640 816 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR2(13:0)
            WIRE 2608 784 2640 784
            BEGIN DISPLAY 2640 784 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR1(13:0)
            WIRE 2608 752 2640 752
            BEGIN DISPLAY 2640 752 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR0(13:0)
            WIRE 2608 720 2640 720
            BEGIN DISPLAY 2640 720 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDONE_TX_XFER(3:0)
            WIRE 2608 240 2640 240
            BEGIN DISPLAY 2640 240 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_XFER_EN(3:0)
            WIRE 2608 848 2640 848
            BEGIN DISPLAY 2640 848 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA3(23:0)
            WIRE 2608 560 2640 560
            BEGIN DISPLAY 2640 560 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA2(23:0)
            WIRE 2608 528 2640 528
            BEGIN DISPLAY 2640 528 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA1(23:0)
            WIRE 2608 496 2640 496
            BEGIN DISPLAY 2640 496 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA0(23:0)
            WIRE 2608 464 2640 464
            BEGIN DISPLAY 2640 464 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TX_DIS(3:0)
            WIRE 2608 144 2640 144
        END BRANCH
        BEGIN BRANCH MOD1(3:0)
            WIRE 2608 112 2640 112
        END BRANCH
        BEGIN BRANCH TXN(3:0)
            WIRE 2608 208 2640 208
        END BRANCH
        BEGIN BRANCH TXP(3:0)
            WIRE 2608 176 2640 176
        END BRANCH
        BEGIN BRANCH xCLK
            WIRE 2608 80 2640 80
            BEGIN DISPLAY 2640 80 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLR_LAM(3:0)
            WIRE 1840 656 1872 656
            BEGIN DISPLAY 1840 656 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDOWNSTREAM_CLR(3:0)
            WIRE 1840 624 1872 624
            BEGIN DISPLAY 1840 624 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDOWNSTREAM_TRIG(3:0)
            WIRE 1840 592 1872 592
            BEGIN DISPLAY 1840 592 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH3(13:0)
            WIRE 1840 560 1872 560
            BEGIN DISPLAY 1840 560 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH2(13:0)
            WIRE 1840 528 1872 528
            BEGIN DISPLAY 1840 528 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH1(13:0)
            WIRE 1840 496 1872 496
            BEGIN DISPLAY 1840 496 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_LENGTH0(13:0)
            WIRE 1840 464 1872 464
            BEGIN DISPLAY 1840 464 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xSTART_TX_XFER(3:0)
            WIRE 1840 304 1872 304
            BEGIN DISPLAY 1840 304 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA3(23:0)
            WIRE 1840 432 1872 432
            BEGIN DISPLAY 1840 432 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA2(23:0)
            WIRE 1840 400 1872 400
            BEGIN DISPLAY 1840 400 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA1(23:0)
            WIRE 1840 368 1872 368
            BEGIN DISPLAY 1840 368 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTX_DATA0(23:0)
            WIRE 1840 336 1872 336
            BEGIN DISPLAY 1840 336 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RXN(3:0)
            WIRE 1840 272 1872 272
        END BRANCH
        BEGIN BRANCH RXP(3:0)
            WIRE 1840 240 1872 240
        END BRANCH
        BEGIN BRANCH MOD0(3:0)
            WIRE 1840 112 1872 112
        END BRANCH
        BEGIN BRANCH MOD2(3:0)
            WIRE 1840 144 1872 144
        END BRANCH
        BEGIN BRANCH LOSS(3:0)
            WIRE 1840 176 1872 176
        END BRANCH
        BEGIN BRANCH TX_FAULT(3:0)
            WIRE 1840 208 1872 208
        END BRANCH
        BEGIN INSTANCE auroratop 1936 976 R0
        END INSTANCE
        IOMARKER 2640 144 TX_DIS(3:0) R0 28
        IOMARKER 2640 112 MOD1(3:0) R0 28
        IOMARKER 2640 208 TXN(3:0) R0 28
        IOMARKER 2640 176 TXP(3:0) R0 28
        IOMARKER 1840 272 RXN(3:0) R180 28
        IOMARKER 1840 240 RXP(3:0) R180 28
        IOMARKER 1840 112 MOD0(3:0) R180 28
        IOMARKER 1840 144 MOD2(3:0) R180 28
        IOMARKER 1840 176 LOSS(3:0) R180 28
        IOMARKER 1840 208 TX_FAULT(3:0) R180 28
        INSTANCE XLXI_918 4976 1856 R0
        BEGIN BRANCH XLXN_2953
            WIRE 4944 1824 4976 1824
        END BRANCH
        BEGIN INSTANCE XLXI_954 4560 1984 R0
        END INSTANCE
        BEGIN BRANCH xSOFT_TRIG
            WIRE 4528 1824 4560 1824
            BEGIN DISPLAY 4528 1824 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLK
            WIRE 4528 1888 4560 1888
            BEGIN DISPLAY 4528 1888 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_2956
            WIRE 4528 1952 4560 1952
        END BRANCH
        INSTANCE XLXI_955 4272 2048 R0
        BEGIN BRANCH xCLR_ALL
            WIRE 4256 1984 4272 1984
            BEGIN DISPLAY 4256 1984 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xDONE
            WIRE 4256 1920 4272 1920
            BEGIN DISPLAY 4256 1920 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRADDR0(14:0)
            WIRE 3664 2256 3696 2256
            BEGIN DISPLAY 3664 2256 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_ADDR0(13:0)
            WIRE 3680 1968 3696 1968
            BEGIN DISPLAY 3680 1968 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xRX_DATA0(23:0)
            WIRE 3680 2016 3696 2016
            BEGIN DISPLAY 3680 2016 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_2961(0:0)
            WIRE 3680 2064 3696 2064
        END BRANCH
        BEGIN BRANCH xCLK
            WIRE 3680 2112 3696 2112
            BEGIN DISPLAY 3680 2112 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_956 3456 2096 R0
        BEGIN BRANCH xRX_XFER_EN(3:0)
            WIRE 3088 1952 3088 2064
            WIRE 3088 2064 3088 2160
            BEGIN DISPLAY 3088 1952 ATTR Name
                ALIGNMENT SOFT-VLEFT
            END DISPLAY
        END BRANCH
        BUSTAP 3088 2064 3184 2064
        BEGIN BRANCH xRX_XFER_EN(0)
            WIRE 3184 2064 3312 2064
            WIRE 3312 2064 3456 2064
            BEGIN DISPLAY 3312 2064 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_957 1472 1920 R0
        BEGIN BRANCH XLXN_2962
            WIRE 1728 1824 1792 1824
            WIRE 1792 1744 1792 1824
            WIRE 1792 1744 1872 1744
        END BRANCH
        BEGIN BRANCH xCLR_ALL
            WIRE 1440 1792 1472 1792
            BEGIN DISPLAY 1440 1792 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clear_lam
            WIRE 1440 1856 1472 1856
            BEGIN DISPLAY 1440 1856 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clear_lam
            WIRE 3280 3008 3312 3008
            BEGIN DISPLAY 3312 3008 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_958 2688 2592 R0
        BEGIN BRANCH led_green
            WIRE 2912 2560 2944 2560
        END BRANCH
        IOMARKER 2944 2560 led_green R0 28
        BEGIN BRANCH XLXN_2964
            WIRE 2656 2560 2688 2560
        END BRANCH
        BEGIN INSTANCE XLXI_959 2272 2720 R0
        END INSTANCE
        BEGIN BRANCH xLAM(0)
            WIRE 2256 2560 2272 2560
            BEGIN DISPLAY 2256 2560 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLR_ALL
            WIRE 2256 2688 2272 2688
            BEGIN DISPLAY 2256 2688 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xCLK
            WIRE 2256 2624 2272 2624
            BEGIN DISPLAY 2256 2624 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH mon7
            WIRE 3632 2960 3664 2960
        END BRANCH
        INSTANCE XLXI_917 3408 2992 R0
        IOMARKER 3664 2960 mon7 R0 28
        INSTANCE XLXI_960 3440 2336 R0
        BEGIN BRANCH XLXN_2965
            WIRE 3664 2304 3696 2304
        END BRANCH
        BEGIN BRANCH xdsp_ppi_clock
            WIRE 3424 2304 3440 2304
            BEGIN DISPLAY 3424 2304 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE obuf12_to_16 4112 2336 R0
        END INSTANCE
        BEGIN BRANCH dsp0_ppi0(15:0)
            WIRE 4496 2304 4528 2304
        END BRANCH
        IOMARKER 4528 2304 dsp0_ppi0(15:0) R0 28
        BEGIN INSTANCE XLXI_961 3696 1904 R0
        END INSTANCE
        BEGIN BRANCH XLXN_2966(11:0)
            WIRE 4048 2304 4112 2304
        END BRANCH
    END SHEET
END SCHEMATIC
