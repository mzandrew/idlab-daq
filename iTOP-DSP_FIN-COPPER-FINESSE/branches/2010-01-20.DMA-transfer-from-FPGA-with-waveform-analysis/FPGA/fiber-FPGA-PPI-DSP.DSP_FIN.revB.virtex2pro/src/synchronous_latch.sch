VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL slatch
        SIGNAL clock
        SIGNAL clear
        SIGNAL Q
        SIGNAL XLXN_5
        SIGNAL XLXN_8
        SIGNAL XLXN_10
        PORT Input slatch
        PORT Input clock
        PORT Input clear
        PORT Output Q
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
        BEGIN BLOCK XLXI_1 fjkc
            PIN C clock
            PIN CLR clear
            PIN J slatch
            PIN K XLXN_5
            PIN Q XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_2 gnd
            PIN G XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_3 buf
            PIN I XLXN_10
            PIN O Q
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        BEGIN BRANCH slatch
            WIRE 528 576 592 576
        END BRANCH
        BEGIN BRANCH clock
            WIRE 528 768 592 768
        END BRANCH
        BEGIN BRANCH clear
            WIRE 528 864 592 864
        END BRANCH
        IOMARKER 528 576 slatch R180 28
        IOMARKER 528 768 clock R180 28
        IOMARKER 528 864 clear R180 28
        INSTANCE XLXI_2 192 864 R0
        INSTANCE XLXI_1 592 896 R0
        BEGIN BRANCH XLXN_5
            WIRE 256 640 592 640
            WIRE 256 640 256 736
        END BRANCH
        BEGIN BRANCH Q
            WIRE 1248 640 1264 640
            WIRE 1264 640 1280 640
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 976 640 1024 640
        END BRANCH
        INSTANCE XLXI_3 1024 672 R0
        IOMARKER 1280 640 Q R0 28
    END SHEET
END SCHEMATIC
