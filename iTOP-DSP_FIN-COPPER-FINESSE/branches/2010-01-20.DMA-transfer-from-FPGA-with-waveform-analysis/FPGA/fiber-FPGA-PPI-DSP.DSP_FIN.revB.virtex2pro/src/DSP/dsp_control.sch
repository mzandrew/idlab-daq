VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_267
        SIGNAL dsp0_nmi0
        SIGNAL dsp0_nmi1
        SIGNAL dsp1_nmi0
        SIGNAL dsp1_nmi1
        SIGNAL dsp0_bus_ready
        SIGNAL dsp1_bus_ready
        SIGNAL XLXN_234
        SIGNAL XLXN_254
        SIGNAL dsp0_async_ready
        SIGNAL dsp1_async_ready
        SIGNAL dsp0_bypass
        SIGNAL dsp1_bypass
        SIGNAL xbypass
        SIGNAL dsp1_bmode1
        SIGNAL dsp0_bmode1
        SIGNAL xbmode1
        SIGNAL dsp0_bmode0
        SIGNAL dsp1_bmode0
        SIGNAL xbmode0
        PORT Output dsp0_nmi0
        PORT Output dsp0_nmi1
        PORT Output dsp1_nmi0
        PORT Output dsp1_nmi1
        PORT Output dsp0_bus_ready
        PORT Output dsp1_bus_ready
        PORT Output dsp0_async_ready
        PORT Output dsp1_async_ready
        PORT Output dsp0_bypass
        PORT Output dsp1_bypass
        PORT Output xbypass
        PORT Output dsp1_bmode1
        PORT Output dsp0_bmode1
        PORT Output xbmode1
        PORT Output dsp0_bmode0
        PORT Output dsp1_bmode0
        PORT Output xbmode0
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_231 obuf
            PIN I XLXN_267
            PIN O dsp0_nmi0
        END BLOCK
        BEGIN BLOCK XLXI_234 obuf
            PIN I XLXN_267
            PIN O dsp0_nmi1
        END BLOCK
        BEGIN BLOCK XLXI_309 obuf
            PIN I XLXN_267
            PIN O dsp1_nmi0
        END BLOCK
        BEGIN BLOCK XLXI_312 obuf
            PIN I XLXN_267
            PIN O dsp1_nmi1
        END BLOCK
        BEGIN BLOCK XLXI_311 gnd
            PIN G XLXN_267
        END BLOCK
        BEGIN BLOCK XLXI_162 obuf
            PIN I XLXN_234
            PIN O dsp0_bus_ready
        END BLOCK
        BEGIN BLOCK XLXI_297 obuf
            PIN I XLXN_234
            PIN O dsp1_bus_ready
        END BLOCK
        BEGIN BLOCK XLXI_163 vcc
            PIN P XLXN_234
        END BLOCK
        BEGIN BLOCK XLXI_182 obuf
            PIN I XLXN_254
            PIN O dsp0_async_ready
        END BLOCK
        BEGIN BLOCK XLXI_301 obuf
            PIN I XLXN_254
            PIN O dsp1_async_ready
        END BLOCK
        BEGIN BLOCK XLXI_558 vcc
            PIN P XLXN_254
        END BLOCK
        BEGIN BLOCK XLXI_513 obuf
            PIN I xbypass
            PIN O dsp1_bypass
        END BLOCK
        BEGIN BLOCK XLXI_514 obuf
            PIN I xbypass
            PIN O dsp0_bypass
        END BLOCK
        BEGIN BLOCK XLXI_1 gnd
            PIN G
        END BLOCK
        BEGIN BLOCK XLXI_625 vcc
            PIN P xbypass
        END BLOCK
        BEGIN BLOCK XLXI_461 obuf
            PIN I xbmode1
            PIN O dsp1_bmode1
        END BLOCK
        BEGIN BLOCK XLXI_451 obuf
            PIN I xbmode1
            PIN O dsp0_bmode1
        END BLOCK
        BEGIN BLOCK XLXI_573 gnd
            PIN G xbmode1
        END BLOCK
        BEGIN BLOCK XLXI_598 vcc
            PIN P
        END BLOCK
        BEGIN BLOCK XLXI_449 obuf
            PIN I xbmode0
            PIN O dsp0_bmode0
        END BLOCK
        BEGIN BLOCK XLXI_460 obuf
            PIN I xbmode0
            PIN O dsp1_bmode0
        END BLOCK
        BEGIN BLOCK XLXI_574 vcc
            PIN P xbmode0
        END BLOCK
        BEGIN BLOCK XLXI_584 gnd
            PIN G
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        BEGIN BRANCH XLXN_267
            WIRE 960 80 960 144
            WIRE 960 144 960 208
            WIRE 960 208 960 272
            WIRE 960 272 960 336
            WIRE 960 272 1024 272
            WIRE 960 208 1024 208
            WIRE 960 144 1024 144
            WIRE 960 80 1024 80
        END BRANCH
        BEGIN BRANCH dsp0_nmi0
            WIRE 1248 80 1280 80
        END BRANCH
        BEGIN BRANCH dsp0_nmi1
            WIRE 1248 144 1280 144
        END BRANCH
        BEGIN BRANCH dsp1_nmi0
            WIRE 1248 208 1280 208
        END BRANCH
        BEGIN BRANCH dsp1_nmi1
            WIRE 1248 272 1280 272
        END BRANCH
        INSTANCE XLXI_231 1024 112 R0
        INSTANCE XLXI_234 1024 176 R0
        INSTANCE XLXI_309 1024 240 R0
        INSTANCE XLXI_312 1024 304 R0
        INSTANCE XLXI_311 896 464 R0
        IOMARKER 1280 80 dsp0_nmi0 R0 28
        IOMARKER 1280 144 dsp0_nmi1 R0 28
        IOMARKER 1280 208 dsp1_nmi0 R0 28
        IOMARKER 1280 272 dsp1_nmi1 R0 28
        BEGIN BRANCH dsp0_bus_ready
            WIRE 1392 496 1424 496
        END BRANCH
        BEGIN BRANCH dsp1_bus_ready
            WIRE 1392 560 1424 560
        END BRANCH
        BEGIN BRANCH XLXN_234
            WIRE 1120 464 1120 496
            WIRE 1120 496 1168 496
            WIRE 1120 496 1120 560
            WIRE 1120 560 1168 560
        END BRANCH
        INSTANCE XLXI_162 1168 528 R0
        INSTANCE XLXI_297 1168 592 R0
        INSTANCE XLXI_163 1056 464 R0
        IOMARKER 1424 496 dsp0_bus_ready R0 28
        IOMARKER 1424 560 dsp1_bus_ready R0 28
        BEGIN BRANCH XLXN_254
            WIRE 1008 672 1008 720
            WIRE 1008 720 1008 784
            WIRE 1008 784 1072 784
            WIRE 1008 720 1072 720
        END BRANCH
        BEGIN BRANCH dsp0_async_ready
            WIRE 1296 720 1328 720
        END BRANCH
        BEGIN BRANCH dsp1_async_ready
            WIRE 1296 784 1328 784
        END BRANCH
        INSTANCE XLXI_182 1072 752 R0
        INSTANCE XLXI_301 1072 816 R0
        INSTANCE XLXI_558 944 672 R0
        IOMARKER 1328 720 dsp0_async_ready R0 28
        IOMARKER 1328 784 dsp1_async_ready R0 28
        BEGIN BRANCH dsp0_bypass
            WIRE 1232 1072 1248 1072
        END BRANCH
        BEGIN BRANCH dsp1_bypass
            WIRE 1232 1136 1248 1136
        END BRANCH
        BEGIN BRANCH xbypass
            WIRE 992 976 992 1008
            WIRE 992 1008 1248 1008
            WIRE 992 1008 992 1072
            WIRE 992 1072 1008 1072
            WIRE 992 1072 992 1136
            WIRE 992 1136 1008 1136
        END BRANCH
        INSTANCE XLXI_513 1008 1168 R0
        INSTANCE XLXI_514 1008 1104 R0
        INSTANCE XLXI_1 928 1344 R0
        IOMARKER 1248 1008 xbypass R0 28
        IOMARKER 1248 1072 dsp0_bypass R0 28
        IOMARKER 1248 1136 dsp1_bypass R0 28
        INSTANCE XLXI_625 928 976 R0
        BEGIN BRANCH dsp1_bmode1
            WIRE 416 1120 448 1120
        END BRANCH
        BEGIN BRANCH dsp0_bmode1
            WIRE 416 1056 448 1056
        END BRANCH
        BEGIN BRANCH xbmode1
            WIRE 160 976 448 976
            WIRE 160 976 160 1056
            WIRE 160 1056 192 1056
            WIRE 160 1056 160 1120
            WIRE 160 1120 192 1120
            WIRE 160 1120 160 1152
        END BRANCH
        INSTANCE XLXI_461 192 1152 R0
        INSTANCE XLXI_451 192 1088 R0
        BEGIN DISPLAY 680 1092 TEXT BMODE1
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        INSTANCE XLXI_573 96 1280 R0
        INSTANCE XLXI_598 96 944 R0
        IOMARKER 448 1120 dsp1_bmode1 R0 28
        IOMARKER 448 1056 dsp0_bmode1 R0 28
        IOMARKER 448 976 xbmode1 R0 28
        BEGIN BRANCH dsp0_bmode0
            WIRE 384 400 416 400
        END BRANCH
        BEGIN BRANCH dsp1_bmode0
            WIRE 384 464 416 464
        END BRANCH
        BEGIN BRANCH xbmode0
            WIRE 128 256 128 288
            WIRE 128 288 416 288
            WIRE 128 288 128 400
            WIRE 128 400 160 400
            WIRE 128 400 128 464
            WIRE 128 464 160 464
        END BRANCH
        INSTANCE XLXI_449 160 432 R0
        INSTANCE XLXI_460 160 496 R0
        BEGIN DISPLAY 656 432 TEXT BMODE0
            FONT 32 "Arial"
            TEXTCOLOR 0 0 255
        END DISPLAY
        INSTANCE XLXI_574 64 256 R0
        INSTANCE XLXI_584 64 624 R0
        IOMARKER 416 400 dsp0_bmode0 R0 28
        IOMARKER 416 464 dsp1_bmode0 R0 28
        IOMARKER 416 288 xbmode0 R0 28
    END SHEET
END SCHEMATIC
