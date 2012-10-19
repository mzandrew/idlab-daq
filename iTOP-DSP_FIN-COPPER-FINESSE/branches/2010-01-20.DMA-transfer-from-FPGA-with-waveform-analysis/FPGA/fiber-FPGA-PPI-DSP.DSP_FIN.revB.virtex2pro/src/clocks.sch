VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL clock_in
        SIGNAL reset
        SIGNAL dcm_not_locked
        SIGNAL XLXN_13
        SIGNAL XLXN_17
        SIGNAL XLXN_18
        SIGNAL clkdv180
        SIGNAL clock_out_dv180
        SIGNAL clock_out_dv
        SIGNAL clock_out_180
        PORT Input clock_in
        PORT Input reset
        PORT Output dcm_not_locked
        PORT Output clock_out_dv180
        PORT Output clock_out_dv
        PORT Output clock_out_180
        BEGIN BLOCKDEF aurora_clocks
            TIMESTAMP 2009 10 5 20 57 16
            RECTANGLE N 64 -320 384 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -32 0 -32 
            LINE N 384 -288 448 -288 
            LINE N 384 -224 448 -224 
            LINE N 384 -160 448 -160 
            LINE N 384 -96 448 -96 
            LINE N 384 -32 448 -32 
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
        BEGIN BLOCKDEF bufg
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 aurora_clocks
            PIN CLKIN_IN clock_in
            PIN RST_IN reset
            PIN LOCKED_OUT XLXN_13
            PIN CLK180_OUT XLXN_17
            PIN CLKFX_OUT XLXN_18
            PIN CLKFX180_OUT clkdv180
            PIN CLK0_OUT
        END BLOCK
        BEGIN BLOCK XLXI_2 inv
            PIN I XLXN_13
            PIN O dcm_not_locked
        END BLOCK
        BEGIN BLOCK XLXI_5 bufg
            PIN I XLXN_17
            PIN O clock_out_180
        END BLOCK
        BEGIN BLOCK XLXI_6 bufg
            PIN I XLXN_18
            PIN O clock_out_dv
        END BLOCK
        BEGIN BLOCK blah bufg
            PIN I clkdv180
            PIN O clock_out_dv180
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        BEGIN INSTANCE XLXI_1 320 512 R0
        END INSTANCE
        BEGIN BRANCH clock_in
            WIRE 288 224 320 224
        END BRANCH
        BEGIN BRANCH reset
            WIRE 288 480 320 480
        END BRANCH
        INSTANCE XLXI_2 912 256 R0
        BEGIN BRANCH dcm_not_locked
            WIRE 1136 224 1168 224
        END BRANCH
        IOMARKER 288 224 clock_in R180 28
        IOMARKER 288 480 reset R180 28
        IOMARKER 1168 224 dcm_not_locked R0 28
        BEGIN BRANCH XLXN_13
            WIRE 768 224 912 224
        END BRANCH
        INSTANCE XLXI_5 912 320 R0
        INSTANCE XLXI_6 912 384 R0
        INSTANCE blah 912 448 R0
        BEGIN BRANCH XLXN_17
            WIRE 768 288 912 288
        END BRANCH
        BEGIN BRANCH XLXN_18
            WIRE 768 352 912 352
        END BRANCH
        BEGIN BRANCH clkdv180
            WIRE 768 416 912 416
        END BRANCH
        BEGIN BRANCH clock_out_dv180
            WIRE 1136 416 1152 416
            WIRE 1152 416 1168 416
        END BRANCH
        BEGIN BRANCH clock_out_dv
            WIRE 1136 352 1152 352
            WIRE 1152 352 1168 352
        END BRANCH
        BEGIN BRANCH clock_out_180
            WIRE 1136 288 1152 288
            WIRE 1152 288 1168 288
        END BRANCH
        IOMARKER 1168 288 clock_out_180 R0 28
        IOMARKER 1168 352 clock_out_dv R0 28
        IOMARKER 1168 416 clock_out_dv180 R0 28
    END SHEET
END SCHEMATIC
