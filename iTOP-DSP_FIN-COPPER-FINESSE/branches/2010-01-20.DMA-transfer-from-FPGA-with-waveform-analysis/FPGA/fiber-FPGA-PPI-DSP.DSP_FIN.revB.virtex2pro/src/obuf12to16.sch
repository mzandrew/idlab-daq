VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL i(11:0)
        SIGNAL o(15:0)
        SIGNAL i(0)
        SIGNAL i(1)
        SIGNAL i(2)
        SIGNAL i(3)
        SIGNAL i(4)
        SIGNAL i(5)
        SIGNAL i(6)
        SIGNAL i(7)
        SIGNAL i(8)
        SIGNAL i(9)
        SIGNAL i(10)
        SIGNAL i(11)
        SIGNAL o(11)
        SIGNAL o(10)
        SIGNAL o(9)
        SIGNAL o(8)
        SIGNAL o(7)
        SIGNAL o(6)
        SIGNAL o(5)
        SIGNAL o(4)
        SIGNAL o(3)
        SIGNAL o(2)
        SIGNAL o(1)
        SIGNAL o(0)
        SIGNAL XLXN_3
        SIGNAL o(15)
        SIGNAL o(14)
        SIGNAL o(13)
        SIGNAL o(12)
        SIGNAL XLXN_12
        PORT Input i(11:0)
        PORT Output o(15:0)
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
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
        BEGIN BLOCK XLXI_1 buf
            PIN I i(0)
            PIN O o(0)
        END BLOCK
        BEGIN BLOCK XLXI_2 buf
            PIN I i(1)
            PIN O o(1)
        END BLOCK
        BEGIN BLOCK XLXI_3 buf
            PIN I i(2)
            PIN O o(2)
        END BLOCK
        BEGIN BLOCK XLXI_4 buf
            PIN I i(3)
            PIN O o(3)
        END BLOCK
        BEGIN BLOCK XLXI_5 buf
            PIN I i(4)
            PIN O o(4)
        END BLOCK
        BEGIN BLOCK XLXI_6 buf
            PIN I i(5)
            PIN O o(5)
        END BLOCK
        BEGIN BLOCK XLXI_7 buf
            PIN I i(6)
            PIN O o(6)
        END BLOCK
        BEGIN BLOCK XLXI_8 buf
            PIN I i(7)
            PIN O o(7)
        END BLOCK
        BEGIN BLOCK XLXI_9 buf
            PIN I i(8)
            PIN O o(8)
        END BLOCK
        BEGIN BLOCK XLXI_10 buf
            PIN I i(9)
            PIN O o(9)
        END BLOCK
        BEGIN BLOCK XLXI_11 buf
            PIN I i(10)
            PIN O o(10)
        END BLOCK
        BEGIN BLOCK XLXI_12 buf
            PIN I i(11)
            PIN O o(11)
        END BLOCK
        BEGIN BLOCK XLXI_13 buf
            PIN I XLXN_12
            PIN O o(12)
        END BLOCK
        BEGIN BLOCK XLXI_14 buf
            PIN I XLXN_12
            PIN O o(13)
        END BLOCK
        BEGIN BLOCK XLXI_15 buf
            PIN I XLXN_12
            PIN O o(14)
        END BLOCK
        BEGIN BLOCK XLXI_16 buf
            PIN I XLXN_12
            PIN O o(15)
        END BLOCK
        BEGIN BLOCK XLXI_17 gnd
            PIN G XLXN_12
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1360 704 R0
        INSTANCE XLXI_2 1360 768 R0
        INSTANCE XLXI_3 1360 832 R0
        INSTANCE XLXI_4 1360 896 R0
        INSTANCE XLXI_5 1360 1024 R0
        INSTANCE XLXI_6 1360 1088 R0
        INSTANCE XLXI_7 1360 1152 R0
        INSTANCE XLXI_8 1360 1216 R0
        INSTANCE XLXI_9 1360 1360 R0
        INSTANCE XLXI_10 1360 1424 R0
        INSTANCE XLXI_11 1360 1488 R0
        INSTANCE XLXI_12 1360 1552 R0
        BEGIN BRANCH i(11:0)
            WIRE 480 512 992 512
            WIRE 992 512 992 672
            WIRE 992 672 992 736
            WIRE 992 736 992 800
            WIRE 992 800 992 864
            WIRE 992 864 992 992
            WIRE 992 992 992 1056
            WIRE 992 1056 992 1120
            WIRE 992 1120 992 1184
            WIRE 992 1184 992 1328
            WIRE 992 1328 992 1392
            WIRE 992 1392 992 1456
            WIRE 992 1456 992 1520
            WIRE 992 1520 992 1568
        END BRANCH
        BEGIN BRANCH o(15:0)
            WIRE 2000 512 2000 672
            WIRE 2000 672 2000 736
            WIRE 2000 736 2000 800
            WIRE 2000 800 2000 864
            WIRE 2000 864 2000 992
            WIRE 2000 992 2000 1056
            WIRE 2000 1056 2000 1120
            WIRE 2000 1120 2000 1184
            WIRE 2000 1184 2000 1328
            WIRE 2000 1328 2000 1392
            WIRE 2000 1392 2000 1456
            WIRE 2000 1456 2000 1520
            WIRE 2000 1520 2000 1664
            WIRE 2000 1664 2000 1728
            WIRE 2000 1728 2000 1792
            WIRE 2000 1792 2000 1856
            WIRE 2000 1856 2000 2144
            WIRE 2000 2144 2448 2144
        END BRANCH
        IOMARKER 480 512 i(11:0) R180 28
        BUSTAP 992 672 1088 672
        BEGIN BRANCH i(0)
            WIRE 1088 672 1200 672
            WIRE 1200 672 1360 672
            BEGIN DISPLAY 1200 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 736 1088 736
        BEGIN BRANCH i(1)
            WIRE 1088 736 1200 736
            WIRE 1200 736 1360 736
            BEGIN DISPLAY 1200 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 800 1088 800
        BEGIN BRANCH i(2)
            WIRE 1088 800 1200 800
            WIRE 1200 800 1360 800
            BEGIN DISPLAY 1200 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 864 1088 864
        BEGIN BRANCH i(3)
            WIRE 1088 864 1200 864
            WIRE 1200 864 1360 864
            BEGIN DISPLAY 1200 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 992 1088 992
        BEGIN BRANCH i(4)
            WIRE 1088 992 1200 992
            WIRE 1200 992 1360 992
            BEGIN DISPLAY 1200 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1056 1088 1056
        BEGIN BRANCH i(5)
            WIRE 1088 1056 1200 1056
            WIRE 1200 1056 1360 1056
            BEGIN DISPLAY 1200 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1120 1088 1120
        BEGIN BRANCH i(6)
            WIRE 1088 1120 1200 1120
            WIRE 1200 1120 1360 1120
            BEGIN DISPLAY 1200 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1184 1088 1184
        BEGIN BRANCH i(7)
            WIRE 1088 1184 1200 1184
            WIRE 1200 1184 1360 1184
            BEGIN DISPLAY 1200 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1328 1088 1328
        BEGIN BRANCH i(8)
            WIRE 1088 1328 1200 1328
            WIRE 1200 1328 1360 1328
            BEGIN DISPLAY 1200 1328 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1392 1088 1392
        BEGIN BRANCH i(9)
            WIRE 1088 1392 1200 1392
            WIRE 1200 1392 1360 1392
            BEGIN DISPLAY 1200 1392 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1456 1088 1456
        BEGIN BRANCH i(10)
            WIRE 1088 1456 1200 1456
            WIRE 1200 1456 1360 1456
            BEGIN DISPLAY 1200 1456 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1520 1088 1520
        BEGIN BRANCH i(11)
            WIRE 1088 1520 1200 1520
            WIRE 1200 1520 1360 1520
            BEGIN DISPLAY 1200 1520 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1520 1904 1520
        BEGIN BRANCH o(11)
            WIRE 1584 1520 1696 1520
            WIRE 1696 1520 1904 1520
            BEGIN DISPLAY 1696 1520 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1456 1904 1456
        BEGIN BRANCH o(10)
            WIRE 1584 1456 1696 1456
            WIRE 1696 1456 1904 1456
            BEGIN DISPLAY 1696 1456 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1392 1904 1392
        BEGIN BRANCH o(9)
            WIRE 1584 1392 1696 1392
            WIRE 1696 1392 1904 1392
            BEGIN DISPLAY 1696 1392 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1328 1904 1328
        BEGIN BRANCH o(8)
            WIRE 1584 1328 1696 1328
            WIRE 1696 1328 1904 1328
            BEGIN DISPLAY 1696 1328 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1184 1904 1184
        BEGIN BRANCH o(7)
            WIRE 1584 1184 1696 1184
            WIRE 1696 1184 1904 1184
            BEGIN DISPLAY 1696 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1120 1904 1120
        BEGIN BRANCH o(6)
            WIRE 1584 1120 1696 1120
            WIRE 1696 1120 1904 1120
            BEGIN DISPLAY 1696 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1056 1904 1056
        BEGIN BRANCH o(5)
            WIRE 1584 1056 1696 1056
            WIRE 1696 1056 1904 1056
            BEGIN DISPLAY 1696 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 992 1904 992
        BEGIN BRANCH o(4)
            WIRE 1584 992 1696 992
            WIRE 1696 992 1904 992
            BEGIN DISPLAY 1696 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 864 1904 864
        BEGIN BRANCH o(3)
            WIRE 1584 864 1712 864
            WIRE 1712 864 1904 864
            BEGIN DISPLAY 1712 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 800 1904 800
        BEGIN BRANCH o(2)
            WIRE 1584 800 1712 800
            WIRE 1712 800 1904 800
            BEGIN DISPLAY 1712 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 736 1904 736
        BEGIN BRANCH o(1)
            WIRE 1584 736 1712 736
            WIRE 1712 736 1904 736
            BEGIN DISPLAY 1712 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 672 1904 672
        BEGIN BRANCH o(0)
            WIRE 1584 672 1712 672
            WIRE 1712 672 1904 672
            BEGIN DISPLAY 1712 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2448 2144 o(15:0) R0 28
        INSTANCE XLXI_13 1360 1696 R0
        INSTANCE XLXI_14 1360 1760 R0
        INSTANCE XLXI_15 1360 1824 R0
        INSTANCE XLXI_16 1360 1888 R0
        BUSTAP 2000 1856 1904 1856
        BEGIN BRANCH o(15)
            WIRE 1584 1856 1696 1856
            WIRE 1696 1856 1904 1856
            BEGIN DISPLAY 1696 1856 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1792 1904 1792
        BEGIN BRANCH o(14)
            WIRE 1584 1792 1696 1792
            WIRE 1696 1792 1904 1792
            BEGIN DISPLAY 1696 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1728 1904 1728
        BEGIN BRANCH o(13)
            WIRE 1584 1728 1696 1728
            WIRE 1696 1728 1904 1728
            BEGIN DISPLAY 1696 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2000 1664 1904 1664
        BEGIN BRANCH o(12)
            WIRE 1584 1664 1696 1664
            WIRE 1696 1664 1904 1664
            BEGIN DISPLAY 1696 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 1344 1664 1360 1664
            WIRE 1344 1664 1344 1728
            WIRE 1344 1728 1344 1792
            WIRE 1344 1792 1344 1856
            WIRE 1344 1856 1360 1856
            WIRE 1344 1856 1344 1920
            WIRE 1344 1792 1360 1792
            WIRE 1344 1728 1360 1728
        END BRANCH
        INSTANCE XLXI_17 1280 2048 R0
    END SHEET
END SCHEMATIC
