VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL TDI_JTAG
        SIGNAL TDO_JTAG
        SIGNAL XLXN_61
        SIGNAL TRST_JTAG
        SIGNAL dsp0_trst
        SIGNAL EMU_JTAG
        SIGNAL xTRST
        SIGNAL dsp1_trst
        SIGNAL XLXN_376
        SIGNAL XLXN_77
        SIGNAL TCK_JTAG
        SIGNAL xTCK
        SIGNAL dsp0_tck
        SIGNAL XLXN_93
        SIGNAL TMS_JTAG
        SIGNAL xTMS
        SIGNAL dsp0_tms
        SIGNAL dsp1_tms
        SIGNAL dsp1_tck
        SIGNAL DSP_EMU
        SIGNAL dsp0_tdo
        SIGNAL dsp0_tdi
        SIGNAL dsp1_tdi
        SIGNAL dsp1_tdo
        SIGNAL XLXN_408
        SIGNAL XLXN_409
        SIGNAL XLXN_410
        PORT Input TDI_JTAG
        PORT Output TDO_JTAG
        PORT Input TRST_JTAG
        PORT Output dsp0_trst
        PORT Output EMU_JTAG
        PORT Output dsp1_trst
        PORT Input TCK_JTAG
        PORT Output dsp0_tck
        PORT Input TMS_JTAG
        PORT Output dsp0_tms
        PORT Output dsp1_tms
        PORT Output dsp1_tck
        PORT Input DSP_EMU
        PORT Input dsp0_tdo
        PORT Output dsp0_tdi
        PORT Output dsp1_tdi
        PORT Input dsp1_tdo
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCK XLXI_34 ibuf
            PIN I TDI_JTAG
            PIN O XLXN_408
        END BLOCK
        BEGIN BLOCK XLXI_336 obuf
            PIN I XLXN_410
            PIN O TDO_JTAG
        END BLOCK
        BEGIN BLOCK XLXI_46 ibuf
            PIN I TRST_JTAG
            PIN O XLXN_61
        END BLOCK
        BEGIN BLOCK XLXI_47 buf
            PIN I XLXN_61
            PIN O xTRST
        END BLOCK
        BEGIN BLOCK XLXI_48 obuf
            PIN I xTRST
            PIN O dsp0_trst
        END BLOCK
        BEGIN BLOCK XLXI_55 obuf
            PIN I XLXN_376
            PIN O EMU_JTAG
        END BLOCK
        BEGIN BLOCK XLXI_308 obuf
            PIN I xTRST
            PIN O dsp1_trst
        END BLOCK
        BEGIN BLOCK XLXI_321 ibuf
            PIN I DSP_EMU
            PIN O XLXN_376
        END BLOCK
        BEGIN BLOCK XLXI_60 ibuf
            PIN I TCK_JTAG
            PIN O XLXN_77
        END BLOCK
        BEGIN BLOCK XLXI_61 buf
            PIN I XLXN_77
            PIN O xTCK
        END BLOCK
        BEGIN BLOCK XLXI_62 obuf
            PIN I xTCK
            PIN O dsp0_tck
        END BLOCK
        BEGIN BLOCK XLXI_69 buf
            PIN I XLXN_93
            PIN O xTMS
        END BLOCK
        BEGIN BLOCK XLXI_70 obuf
            PIN I xTMS
            PIN O dsp0_tms
        END BLOCK
        BEGIN BLOCK XLXI_306 obuf
            PIN I xTMS
            PIN O dsp1_tms
        END BLOCK
        BEGIN BLOCK XLXI_307 obuf
            PIN I xTCK
            PIN O dsp1_tck
        END BLOCK
        BEGIN BLOCK XLXI_68 ibuf
            PIN I TMS_JTAG
            PIN O XLXN_93
        END BLOCK
        BEGIN BLOCK XLXI_35 ibuf
            PIN I dsp0_tdo
            PIN O XLXN_410
        END BLOCK
        BEGIN BLOCK XLXI_37 obuf
            PIN I XLXN_409
            PIN O dsp0_tdi
        END BLOCK
        BEGIN BLOCK XLXI_38 obuf
            PIN I XLXN_408
            PIN O dsp1_tdi
        END BLOCK
        BEGIN BLOCK XLXI_335 ibuf
            PIN I dsp1_tdo
            PIN O XLXN_409
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        INSTANCE XLXI_34 448 192 R0
        BEGIN BRANCH TDI_JTAG
            WIRE 416 160 448 160
        END BRANCH
        BEGIN DISPLAY 1168 288 TEXT "to JTAG"
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        BEGIN BRANCH TDO_JTAG
            WIRE 928 288 960 288
        END BRANCH
        INSTANCE XLXI_336 704 320 R0
        BEGIN DISPLAY 84 164 TEXT JTAG_TDI
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        IOMARKER 416 160 TDI_JTAG R180 28
        IOMARKER 960 288 TDO_JTAG R0 28
        INSTANCE XLXI_46 496 496 R0
        BEGIN BRANCH XLXN_61
            WIRE 720 464 752 464
        END BRANCH
        INSTANCE XLXI_47 752 496 R0
        INSTANCE XLXI_48 752 560 R0
        BEGIN BRANCH TRST_JTAG
            WIRE 464 464 496 464
        END BRANCH
        BEGIN BRANCH dsp0_trst
            WIRE 976 528 1008 528
        END BRANCH
        INSTANCE XLXI_55 752 688 R0
        BEGIN BRANCH EMU_JTAG
            WIRE 976 656 1008 656
        END BRANCH
        BEGIN BRANCH xTRST
            WIRE 976 464 1008 464
            BEGIN DISPLAY 1008 464 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTRST
            WIRE 720 528 752 528
            BEGIN DISPLAY 720 528 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH dsp1_trst
            WIRE 976 592 1008 592
        END BRANCH
        BEGIN BRANCH xTRST
            WIRE 720 592 752 592
            BEGIN DISPLAY 720 592 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_308 752 624 R0
        BEGIN BRANCH XLXN_376
            WIRE 720 656 752 656
        END BRANCH
        INSTANCE XLXI_321 496 688 R0
        INSTANCE XLXI_60 496 864 R0
        BEGIN BRANCH XLXN_77
            WIRE 720 832 752 832
        END BRANCH
        INSTANCE XLXI_61 752 864 R0
        BEGIN BRANCH TCK_JTAG
            WIRE 464 832 496 832
        END BRANCH
        BEGIN BRANCH xTCK
            WIRE 976 832 1008 832
            BEGIN DISPLAY 1008 832 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTCK
            WIRE 720 896 752 896
            BEGIN DISPLAY 720 896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH dsp0_tck
            WIRE 976 896 1008 896
        END BRANCH
        INSTANCE XLXI_62 752 928 R0
        BEGIN BRANCH XLXN_93
            WIRE 720 1024 752 1024
        END BRANCH
        INSTANCE XLXI_69 752 1056 R0
        BEGIN BRANCH TMS_JTAG
            WIRE 464 1024 496 1024
        END BRANCH
        BEGIN BRANCH xTMS
            WIRE 976 1024 1008 1024
            BEGIN DISPLAY 1008 1024 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH xTMS
            WIRE 720 1088 752 1088
            BEGIN DISPLAY 720 1088 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH dsp0_tms
            WIRE 976 1088 1008 1088
        END BRANCH
        INSTANCE XLXI_70 752 1120 R0
        BEGIN BRANCH xTMS
            WIRE 720 1152 752 1152
            BEGIN DISPLAY 720 1152 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH dsp1_tms
            WIRE 976 1152 1008 1152
        END BRANCH
        INSTANCE XLXI_306 752 1184 R0
        BEGIN BRANCH xTCK
            WIRE 720 960 752 960
            BEGIN DISPLAY 720 960 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH dsp1_tck
            WIRE 976 960 1008 960
        END BRANCH
        INSTANCE XLXI_307 752 992 R0
        BEGIN BRANCH DSP_EMU
            WIRE 464 656 496 656
        END BRANCH
        INSTANCE XLXI_68 496 1056 R0
        BEGIN DISPLAY 72 464 TEXT JTAG_TRST
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        BEGIN DISPLAY 116 832 TEXT JTAG_TCK
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        BEGIN DISPLAY 112 1020 TEXT JTAG_TMS
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        BEGIN DISPLAY 1232 664 TEXT JTAG_EMU
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        BEGIN DISPLAY 96 664 TEXT DSP_EMU
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        IOMARKER 464 464 TRST_JTAG R180 28
        IOMARKER 1008 656 EMU_JTAG R0 28
        IOMARKER 1008 528 dsp0_trst R0 28
        IOMARKER 1008 592 dsp1_trst R0 28
        IOMARKER 464 832 TCK_JTAG R180 28
        IOMARKER 1008 896 dsp0_tck R0 28
        IOMARKER 464 1024 TMS_JTAG R180 28
        IOMARKER 1008 1088 dsp0_tms R0 28
        IOMARKER 1008 1152 dsp1_tms R0 28
        IOMARKER 1008 960 dsp1_tck R0 28
        IOMARKER 464 656 DSP_EMU R180 28
        INSTANCE XLXI_35 448 320 R0
        BEGIN BRANCH dsp0_tdo
            WIRE 416 288 448 288
        END BRANCH
        BEGIN DISPLAY 24 292 TEXT "from DSP 0"
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        IOMARKER 416 288 dsp0_tdo R180 28
        INSTANCE XLXI_37 704 256 R0
        BEGIN BRANCH dsp0_tdi
            WIRE 928 224 960 224
        END BRANCH
        BEGIN DISPLAY 1168 228 TEXT "to DSP 0"
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        IOMARKER 960 224 dsp0_tdi R0 28
        BEGIN DISPLAY 1168 160 TEXT "to DSP1"
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        INSTANCE XLXI_38 704 192 R0
        BEGIN BRANCH dsp1_tdi
            WIRE 928 160 944 160
            WIRE 944 160 960 160
        END BRANCH
        IOMARKER 960 160 dsp1_tdi R0 28
        BEGIN DISPLAY 24 228 TEXT "from DSP 1"
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        BEGIN BRANCH dsp1_tdo
            WIRE 416 224 448 224
        END BRANCH
        INSTANCE XLXI_335 448 256 R0
        IOMARKER 416 224 dsp1_tdo R180 28
        BEGIN BRANCH XLXN_408
            WIRE 672 160 704 160
        END BRANCH
        BEGIN BRANCH XLXN_409
            WIRE 672 224 704 224
        END BRANCH
        BEGIN BRANCH XLXN_410
            WIRE 672 288 704 288
        END BRANCH
    END SHEET
END SCHEMATIC
