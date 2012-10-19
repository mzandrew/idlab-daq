VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL i(23:0)
        SIGNAL o(11:0)
        SIGNAL i(0)
        SIGNAL i(12)
        SIGNAL i(1)
        SIGNAL i(13)
        SIGNAL i(2)
        SIGNAL i(14)
        SIGNAL i(3)
        SIGNAL i(15)
        SIGNAL i(4)
        SIGNAL i(16)
        SIGNAL i(5)
        SIGNAL i(17)
        SIGNAL o(0)
        SIGNAL o(1)
        SIGNAL o(2)
        SIGNAL o(3)
        SIGNAL o(4)
        SIGNAL o(5)
        SIGNAL o(6)
        SIGNAL o(7)
        SIGNAL o(8)
        SIGNAL o(9)
        SIGNAL o(10)
        SIGNAL o(11)
        SIGNAL i(6)
        SIGNAL i(18)
        SIGNAL i(7)
        SIGNAL i(19)
        SIGNAL i(8)
        SIGNAL i(20)
        SIGNAL i(9)
        SIGNAL i(21)
        SIGNAL i(10)
        SIGNAL i(22)
        SIGNAL i(11)
        SIGNAL i(23)
        SIGNAL XLXN_49
        SIGNAL XLXN_50
        SIGNAL XLXN_51
        SIGNAL XLXN_52
        SIGNAL XLXN_53
        SIGNAL a
        SIGNAL XLXN_55
        SIGNAL XLXN_56
        SIGNAL XLXN_57
        SIGNAL XLXN_58
        PORT Input i(23:0)
        PORT Output o(11:0)
        PORT Input a
        BEGIN BLOCKDEF m2_1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 96 -64 96 -192 
            LINE N 256 -96 96 -64 
            LINE N 256 -160 256 -96 
            LINE N 96 -192 256 -160 
            LINE N 176 -32 96 -32 
            LINE N 176 -80 176 -32 
            LINE N 0 -32 96 -32 
            LINE N 320 -128 256 -128 
            LINE N 0 -96 96 -96 
            LINE N 0 -160 96 -160 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 m2_1
            PIN D0 i(0)
            PIN D1 i(12)
            PIN S0 a
            PIN O o(0)
        END BLOCK
        BEGIN BLOCK XLXI_3 m2_1
            PIN D0 i(1)
            PIN D1 i(13)
            PIN S0 a
            PIN O o(1)
        END BLOCK
        BEGIN BLOCK XLXI_4 m2_1
            PIN D0 i(2)
            PIN D1 i(14)
            PIN S0 a
            PIN O o(2)
        END BLOCK
        BEGIN BLOCK XLXI_5 m2_1
            PIN D0 i(3)
            PIN D1 i(15)
            PIN S0 a
            PIN O o(3)
        END BLOCK
        BEGIN BLOCK XLXI_6 m2_1
            PIN D0 i(4)
            PIN D1 i(16)
            PIN S0 a
            PIN O o(4)
        END BLOCK
        BEGIN BLOCK XLXI_7 m2_1
            PIN D0 i(5)
            PIN D1 i(17)
            PIN S0 a
            PIN O o(5)
        END BLOCK
        BEGIN BLOCK XLXI_10 m2_1
            PIN D0 i(6)
            PIN D1 i(18)
            PIN S0 a
            PIN O o(6)
        END BLOCK
        BEGIN BLOCK XLXI_11 m2_1
            PIN D0 i(7)
            PIN D1 i(19)
            PIN S0 a
            PIN O o(7)
        END BLOCK
        BEGIN BLOCK XLXI_12 m2_1
            PIN D0 i(8)
            PIN D1 i(20)
            PIN S0 a
            PIN O o(8)
        END BLOCK
        BEGIN BLOCK XLXI_13 m2_1
            PIN D0 i(9)
            PIN D1 i(21)
            PIN S0 a
            PIN O o(9)
        END BLOCK
        BEGIN BLOCK XLXI_8 m2_1
            PIN D0 i(10)
            PIN D1 i(22)
            PIN S0 a
            PIN O o(10)
        END BLOCK
        BEGIN BLOCK XLXI_9 m2_1
            PIN D0 i(11)
            PIN D1 i(23)
            PIN S0 a
            PIN O o(11)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH i(23:0)
            WIRE 192 96 304 96
            WIRE 304 96 1824 96
            WIRE 1824 96 1824 608
            WIRE 1824 608 1824 672
            WIRE 1824 672 1824 832
            WIRE 1824 832 1824 896
            WIRE 1824 896 1824 1056
            WIRE 1824 1056 1824 1120
            WIRE 1824 1120 1824 1280
            WIRE 1824 1280 1824 1344
            WIRE 1824 1344 1824 1504
            WIRE 1824 1504 1824 1568
            WIRE 1824 1568 1824 1728
            WIRE 1824 1728 1824 1792
            WIRE 1824 1792 1824 1904
            WIRE 304 96 304 656
            WIRE 304 656 304 720
            WIRE 304 720 304 784
            WIRE 304 784 304 880
            WIRE 304 880 304 944
            WIRE 304 944 304 960
            WIRE 304 960 304 1008
            WIRE 304 1008 304 1104
            WIRE 304 1104 304 1168
            WIRE 304 1168 304 1328
            WIRE 304 1328 304 1392
            WIRE 304 1392 304 1552
            WIRE 304 1552 304 1616
            WIRE 304 1616 304 1776
            WIRE 304 1776 304 1840
            WIRE 304 1840 304 1952
        END BRANCH
        IOMARKER 192 96 i(23:0) R180 28
        INSTANCE XLXI_2 608 816 R0
        INSTANCE XLXI_3 608 1040 R0
        INSTANCE XLXI_4 608 1264 R0
        INSTANCE XLXI_5 608 1488 R0
        INSTANCE XLXI_6 608 1712 R0
        INSTANCE XLXI_7 608 1936 R0
        INSTANCE XLXI_10 2176 768 R0
        INSTANCE XLXI_11 2176 992 R0
        INSTANCE XLXI_12 2176 1216 R0
        INSTANCE XLXI_13 2176 1440 R0
        INSTANCE XLXI_8 2176 1664 R0
        INSTANCE XLXI_9 2176 1888 R0
        BEGIN BRANCH o(11:0)
            WIRE 1552 448 1552 688
            WIRE 1552 688 1552 912
            WIRE 1552 912 1552 1136
            WIRE 1552 1136 1552 1360
            WIRE 1552 1360 1552 1584
            WIRE 1552 1584 1552 1808
            WIRE 1552 1808 1552 2256
            WIRE 1552 2256 2960 2256
            WIRE 2960 2256 3280 2256
            WIRE 2960 432 2960 640
            WIRE 2960 640 2960 864
            WIRE 2960 864 2960 1088
            WIRE 2960 1088 2960 1312
            WIRE 2960 1312 2960 1536
            WIRE 2960 1536 2960 1760
            WIRE 2960 1760 2960 2256
        END BRANCH
        IOMARKER 3280 2256 o(11:0) R0 28
        BUSTAP 304 656 400 656
        BEGIN BRANCH i(0)
            WIRE 400 656 432 656
            WIRE 432 656 608 656
            BEGIN DISPLAY 432 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 720 400 720
        BEGIN BRANCH i(12)
            WIRE 400 720 432 720
            WIRE 432 720 608 720
            BEGIN DISPLAY 432 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 880 400 880
        BEGIN BRANCH i(1)
            WIRE 400 880 432 880
            WIRE 432 880 608 880
            BEGIN DISPLAY 432 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 944 400 944
        BEGIN BRANCH i(13)
            WIRE 400 944 432 944
            WIRE 432 944 608 944
            BEGIN DISPLAY 432 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1104 400 1104
        BEGIN BRANCH i(2)
            WIRE 400 1104 432 1104
            WIRE 432 1104 608 1104
            BEGIN DISPLAY 432 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1168 400 1168
        BEGIN BRANCH i(14)
            WIRE 400 1168 448 1168
            WIRE 448 1168 608 1168
            BEGIN DISPLAY 448 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1328 400 1328
        BEGIN BRANCH i(3)
            WIRE 400 1328 432 1328
            WIRE 432 1328 608 1328
            BEGIN DISPLAY 432 1328 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1392 400 1392
        BEGIN BRANCH i(15)
            WIRE 400 1392 432 1392
            WIRE 432 1392 608 1392
            BEGIN DISPLAY 432 1392 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1552 400 1552
        BEGIN BRANCH i(4)
            WIRE 400 1552 432 1552
            WIRE 432 1552 608 1552
            BEGIN DISPLAY 432 1552 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1616 400 1616
        BEGIN BRANCH i(16)
            WIRE 400 1616 432 1616
            WIRE 432 1616 608 1616
            BEGIN DISPLAY 432 1616 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1776 400 1776
        BEGIN BRANCH i(5)
            WIRE 400 1776 432 1776
            WIRE 432 1776 608 1776
            BEGIN DISPLAY 432 1776 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 304 1840 400 1840
        BEGIN BRANCH i(17)
            WIRE 400 1840 432 1840
            WIRE 432 1840 608 1840
            BEGIN DISPLAY 432 1840 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1552 688 1456 688
        BEGIN BRANCH o(0)
            WIRE 928 688 1200 688
            WIRE 1200 688 1456 688
            BEGIN DISPLAY 1200 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1552 912 1456 912
        BEGIN BRANCH o(1)
            WIRE 928 912 1200 912
            WIRE 1200 912 1456 912
            BEGIN DISPLAY 1200 912 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1552 1136 1456 1136
        BEGIN BRANCH o(2)
            WIRE 928 1136 1216 1136
            WIRE 1216 1136 1456 1136
            BEGIN DISPLAY 1216 1136 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1552 1360 1456 1360
        BEGIN BRANCH o(3)
            WIRE 928 1360 1216 1360
            WIRE 1216 1360 1456 1360
            BEGIN DISPLAY 1216 1360 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1552 1584 1456 1584
        BEGIN BRANCH o(4)
            WIRE 928 1584 1216 1584
            WIRE 1216 1584 1456 1584
            BEGIN DISPLAY 1216 1584 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1552 1808 1456 1808
        BEGIN BRANCH o(5)
            WIRE 928 1808 1216 1808
            WIRE 1216 1808 1456 1808
            BEGIN DISPLAY 1216 1808 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2960 640 2864 640
        BEGIN BRANCH o(6)
            WIRE 2496 640 2720 640
            WIRE 2720 640 2864 640
            BEGIN DISPLAY 2720 640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2960 864 2864 864
        BEGIN BRANCH o(7)
            WIRE 2496 864 2720 864
            WIRE 2720 864 2864 864
            BEGIN DISPLAY 2720 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2960 1088 2864 1088
        BEGIN BRANCH o(8)
            WIRE 2496 1088 2704 1088
            WIRE 2704 1088 2864 1088
            BEGIN DISPLAY 2704 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2960 1312 2864 1312
        BEGIN BRANCH o(9)
            WIRE 2496 1312 2720 1312
            WIRE 2720 1312 2864 1312
            BEGIN DISPLAY 2720 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2960 1536 2864 1536
        BEGIN BRANCH o(10)
            WIRE 2496 1536 2736 1536
            WIRE 2736 1536 2864 1536
            BEGIN DISPLAY 2736 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2960 1760 2864 1760
        BEGIN BRANCH o(11)
            WIRE 2496 1760 2704 1760
            WIRE 2704 1760 2864 1760
            BEGIN DISPLAY 2704 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 608 1920 608
        BEGIN BRANCH i(6)
            WIRE 1920 608 1984 608
            WIRE 1984 608 2176 608
            BEGIN DISPLAY 1984 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 672 1920 672
        BEGIN BRANCH i(18)
            WIRE 1920 672 1984 672
            WIRE 1984 672 2176 672
            BEGIN DISPLAY 1984 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 832 1920 832
        BEGIN BRANCH i(7)
            WIRE 1920 832 1984 832
            WIRE 1984 832 2176 832
            BEGIN DISPLAY 1984 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 896 1920 896
        BEGIN BRANCH i(19)
            WIRE 1920 896 1984 896
            WIRE 1984 896 2176 896
            BEGIN DISPLAY 1984 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1056 1920 1056
        BEGIN BRANCH i(8)
            WIRE 1920 1056 1968 1056
            WIRE 1968 1056 2176 1056
            BEGIN DISPLAY 1968 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1120 1920 1120
        BEGIN BRANCH i(20)
            WIRE 1920 1120 1984 1120
            WIRE 1984 1120 2176 1120
            BEGIN DISPLAY 1984 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1280 1920 1280
        BEGIN BRANCH i(9)
            WIRE 1920 1280 1984 1280
            WIRE 1984 1280 2176 1280
            BEGIN DISPLAY 1984 1280 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1344 1920 1344
        BEGIN BRANCH i(21)
            WIRE 1920 1344 2000 1344
            WIRE 2000 1344 2176 1344
            BEGIN DISPLAY 2000 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1504 1920 1504
        BEGIN BRANCH i(10)
            WIRE 1920 1504 1984 1504
            WIRE 1984 1504 2176 1504
            BEGIN DISPLAY 1984 1504 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1568 1920 1568
        BEGIN BRANCH i(22)
            WIRE 1920 1568 2000 1568
            WIRE 2000 1568 2176 1568
            BEGIN DISPLAY 2000 1568 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1728 1920 1728
        BEGIN BRANCH i(11)
            WIRE 1920 1728 1984 1728
            WIRE 1984 1728 2176 1728
            BEGIN DISPLAY 1984 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1824 1792 1920 1792
        BEGIN BRANCH i(23)
            WIRE 1920 1792 2000 1792
            WIRE 2000 1792 2176 1792
            BEGIN DISPLAY 2000 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a
            WIRE 256 2048 592 2048
            WIRE 592 2048 2160 2048
            WIRE 592 784 608 784
            WIRE 592 784 592 1008
            WIRE 592 1008 608 1008
            WIRE 592 1008 592 1232
            WIRE 592 1232 608 1232
            WIRE 592 1232 592 1456
            WIRE 592 1456 608 1456
            WIRE 592 1456 592 1680
            WIRE 592 1680 608 1680
            WIRE 592 1680 592 1904
            WIRE 592 1904 608 1904
            WIRE 592 1904 592 2048
            WIRE 2160 736 2176 736
            WIRE 2160 736 2160 960
            WIRE 2160 960 2176 960
            WIRE 2160 960 2160 1184
            WIRE 2160 1184 2176 1184
            WIRE 2160 1184 2160 1408
            WIRE 2160 1408 2176 1408
            WIRE 2160 1408 2160 1632
            WIRE 2160 1632 2176 1632
            WIRE 2160 1632 2160 1856
            WIRE 2160 1856 2176 1856
            WIRE 2160 1856 2160 2048
        END BRANCH
        IOMARKER 256 2048 a R180 28
    END SHEET
END SCHEMATIC
