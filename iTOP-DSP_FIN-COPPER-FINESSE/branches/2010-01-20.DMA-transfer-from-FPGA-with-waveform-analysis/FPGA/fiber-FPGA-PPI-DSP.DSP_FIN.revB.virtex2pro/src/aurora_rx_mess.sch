VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL xlink_active
        SIGNAL xclr_lam
        SIGNAL xclk
        SIGNAL xgood_packet
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        SIGNAL xlam
        SIGNAL XLXN_19
        PORT Input xlink_active
        PORT Input xclr_lam
        PORT Input xclk
        PORT Input xgood_packet
        PORT Output xlam
        BEGIN BLOCKDEF fjkc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -320 64 -320 
            LINE N 384 -256 320 -256 
            LINE N 0 -256 64 -256 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 64 -384 320 -64 
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
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 fjkc
            PIN C xclk
            PIN CLR xclr_lam
            PIN J xgood_packet
            PIN K XLXN_16
            PIN Q XLXN_19
        END BLOCK
        BEGIN BLOCK XLXI_3 gnd
            PIN G XLXN_16
        END BLOCK
        BEGIN BLOCK XLXI_4 buf
            PIN I XLXN_19
            PIN O xlam
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH xlink_active
            WIRE 1216 448 1408 448
        END BRANCH
        IOMARKER 1216 448 xlink_active R180 28
        INSTANCE XLXI_2 1520 1088 R0
        BEGIN BRANCH xclr_lam
            WIRE 1456 1056 1520 1056
        END BRANCH
        IOMARKER 1456 1056 xclr_lam R180 28
        BEGIN BRANCH xclk
            WIRE 1456 960 1520 960
        END BRANCH
        IOMARKER 1456 960 xclk R180 28
        BEGIN BRANCH xgood_packet
            WIRE 1456 768 1520 768
        END BRANCH
        IOMARKER 1456 768 xgood_packet R180 28
        INSTANCE XLXI_3 1216 992 R0
        BEGIN BRANCH XLXN_16
            WIRE 1280 832 1520 832
            WIRE 1280 832 1280 864
        END BRANCH
        INSTANCE XLXI_4 1920 864 R0
        BEGIN BRANCH xlam
            WIRE 2144 832 2160 832
            WIRE 2160 832 2192 832
        END BRANCH
        IOMARKER 2192 832 xlam R0 28
        BEGIN BRANCH XLXN_19
            WIRE 1904 832 1920 832
        END BRANCH
    END SHEET
END SCHEMATIC
