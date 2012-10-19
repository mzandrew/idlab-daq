VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL dsp0_reset
        SIGNAL dsp1_reset
        SIGNAL xdsp_reset
        SIGNAL dsp_clock
        SIGNAL dsp_pll_bypass
        SIGNAL dsp_reset_button
        PORT Output dsp0_reset
        PORT Output dsp1_reset
        PORT Output xdsp_reset
        PORT Input dsp_clock
        PORT Input dsp_pll_bypass
        PORT Input dsp_reset_button
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF blackfin_reset
            TIMESTAMP 2009 9 23 4 38 48
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 320 -160 384 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 obuf
            PIN I xdsp_reset
            PIN O dsp0_reset
        END BLOCK
        BEGIN BLOCK XLXI_3 obuf
            PIN I xdsp_reset
            PIN O dsp1_reset
        END BLOCK
        BEGIN BLOCK blackfinreset blackfin_reset
            PIN clock dsp_clock
            PIN reset xdsp_reset
            PIN bypass dsp_pll_bypass
            PIN button dsp_reset_button
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        INSTANCE XLXI_2 944 448 R0
        INSTANCE XLXI_3 944 512 R0
        BEGIN BRANCH dsp0_reset
            WIRE 1168 416 1184 416
        END BRANCH
        BEGIN BRANCH dsp1_reset
            WIRE 1168 480 1184 480
        END BRANCH
        BEGIN BRANCH xdsp_reset
            WIRE 864 416 928 416
            WIRE 928 416 944 416
            WIRE 928 416 928 480
            WIRE 928 480 944 480
            WIRE 928 336 928 416
            WIRE 928 336 1184 336
        END BRANCH
        BEGIN BRANCH dsp_clock
            WIRE 464 416 480 416
        END BRANCH
        BEGIN BRANCH dsp_pll_bypass
            WIRE 464 480 480 480
        END BRANCH
        BEGIN BRANCH dsp_reset_button
            WIRE 464 544 480 544
        END BRANCH
        IOMARKER 464 416 dsp_clock R180 28
        IOMARKER 464 480 dsp_pll_bypass R180 28
        IOMARKER 464 544 dsp_reset_button R180 28
        IOMARKER 1184 336 xdsp_reset R0 28
        IOMARKER 1184 416 dsp0_reset R0 28
        IOMARKER 1184 480 dsp1_reset R0 28
        BEGIN INSTANCE blackfinreset 480 576 R0
        END INSTANCE
    END SHEET
END SCHEMATIC
