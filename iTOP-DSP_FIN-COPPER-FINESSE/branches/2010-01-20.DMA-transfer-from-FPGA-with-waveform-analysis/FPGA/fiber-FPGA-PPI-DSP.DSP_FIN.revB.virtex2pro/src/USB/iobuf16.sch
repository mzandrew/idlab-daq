VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL FDOUT(15)
        SIGNAL FDIN(15)
        SIGNAL FDOUT(14)
        SIGNAL FDIN(14)
        SIGNAL FDOUT(13)
        SIGNAL FDIN(13)
        SIGNAL FDOUT(12)
        SIGNAL FDIN(12)
        SIGNAL FDOUT(11)
        SIGNAL FDIN(11)
        SIGNAL FDOUT(10)
        SIGNAL FDIN(10)
        SIGNAL FDOUT(9)
        SIGNAL FDIN(9)
        SIGNAL FDOUT(8)
        SIGNAL FDIN(8)
        SIGNAL FDOUT(7)
        SIGNAL FDIN(7)
        SIGNAL FDOUT(6)
        SIGNAL FDIN(6)
        SIGNAL FDOUT(5)
        SIGNAL FDIN(5)
        SIGNAL FDOUT(4)
        SIGNAL FDIN(4)
        SIGNAL FDOUT(3)
        SIGNAL FDIN(3)
        SIGNAL FDOUT(2)
        SIGNAL FDOUT(1)
        SIGNAL FDIN(2)
        SIGNAL FDIN(1)
        SIGNAL FDOUT(0)
        SIGNAL FDIN(0)
        SIGNAL FDOUT(15:0)
        SIGNAL FDIN(15:0)
        SIGNAL FD(15)
        SIGNAL FD(14)
        SIGNAL FD(13)
        SIGNAL FD(12)
        SIGNAL FD(11)
        SIGNAL FD(10)
        SIGNAL FD(9)
        SIGNAL FD(8)
        SIGNAL FD(7)
        SIGNAL FD(6)
        SIGNAL FD(5)
        SIGNAL FD(4)
        SIGNAL FD(3)
        SIGNAL FD(2)
        SIGNAL FD(1)
        SIGNAL TOGGLE
        SIGNAL FD(0)
        SIGNAL xTOGGLE
        SIGNAL FD(15:0)
        PORT Output FDOUT(15:0)
        PORT Input FDIN(15:0)
        PORT Input xTOGGLE
        PORT BiDirectional FD(15:0)
        BEGIN BLOCKDEF iobuf
            TIMESTAMP 2001 11 14 15 13 3
            LINE N 224 -128 128 -128 
            LINE N 160 -64 128 -64 
            LINE N 160 -128 160 -64 
            LINE N 0 -64 64 -64 
            LINE N 96 -140 96 -192 
            LINE N 0 -192 96 -192 
            LINE N 64 -96 64 -160 
            LINE N 128 -128 64 -96 
            LINE N 64 -160 128 -128 
            LINE N 128 -96 128 -32 
            LINE N 64 -64 128 -96 
            LINE N 128 -32 64 -64 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 2 2 12 35 54
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCK XLXI_3631 iobuf
            PIN I FDIN(15)
            PIN IO FD(15)
            PIN O FDOUT(15)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3630 iobuf
            PIN I FDIN(14)
            PIN IO FD(14)
            PIN O FDOUT(14)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3629 iobuf
            PIN I FDIN(13)
            PIN IO FD(13)
            PIN O FDOUT(13)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3628 iobuf
            PIN I FDIN(12)
            PIN IO FD(12)
            PIN O FDOUT(12)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3627 iobuf
            PIN I FDIN(11)
            PIN IO FD(11)
            PIN O FDOUT(11)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3626 iobuf
            PIN I FDIN(10)
            PIN IO FD(10)
            PIN O FDOUT(10)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3625 iobuf
            PIN I FDIN(9)
            PIN IO FD(9)
            PIN O FDOUT(9)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3624 iobuf
            PIN I FDIN(8)
            PIN IO FD(8)
            PIN O FDOUT(8)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3623 iobuf
            PIN I FDIN(7)
            PIN IO FD(7)
            PIN O FDOUT(7)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3622 iobuf
            PIN I FDIN(6)
            PIN IO FD(6)
            PIN O FDOUT(6)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3621 iobuf
            PIN I FDIN(5)
            PIN IO FD(5)
            PIN O FDOUT(5)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3620 iobuf
            PIN I FDIN(4)
            PIN IO FD(4)
            PIN O FDOUT(4)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3615 iobuf
            PIN I FDIN(3)
            PIN IO FD(3)
            PIN O FDOUT(3)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3614 iobuf
            PIN I FDIN(2)
            PIN IO FD(2)
            PIN O FDOUT(2)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3613 iobuf
            PIN I FDIN(1)
            PIN IO FD(1)
            PIN O FDOUT(1)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3611 iobuf
            PIN I FDIN(0)
            PIN IO FD(0)
            PIN O FDOUT(0)
            PIN T TOGGLE
        END BLOCK
        BEGIN BLOCK XLXI_3632 buf
            PIN I xTOGGLE
            PIN O TOGGLE
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        IOMARKER 2768 864 FDIN(15:0) R180 28
        IOMARKER 2704 4512 FDOUT(15:0) R180 28
        BEGIN BRANCH FDOUT(15)
            WIRE 3120 4416 3200 4416
            WIRE 3200 4416 3264 4416
            BEGIN DISPLAY 3200 4416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(15)
            WIRE 2960 4352 3168 4352
            WIRE 3168 4352 3264 4352
            BEGIN DISPLAY 3168 4352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 4288 3264 4288
            BEGIN DISPLAY 3216 4288 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(14)
            WIRE 3120 4192 3184 4192
            WIRE 3184 4192 3264 4192
            BEGIN DISPLAY 3184 4192 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(14)
            WIRE 2960 4128 3168 4128
            WIRE 3168 4128 3264 4128
            BEGIN DISPLAY 3168 4128 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 4064 3264 4064
            BEGIN DISPLAY 3216 4064 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(13)
            WIRE 3120 3968 3200 3968
            WIRE 3200 3968 3264 3968
            BEGIN DISPLAY 3200 3968 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(13)
            WIRE 2960 3904 3168 3904
            WIRE 3168 3904 3264 3904
            BEGIN DISPLAY 3168 3904 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 3840 3264 3840
            BEGIN DISPLAY 3216 3840 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(12)
            WIRE 3120 3744 3184 3744
            WIRE 3184 3744 3264 3744
            BEGIN DISPLAY 3184 3744 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(12)
            WIRE 2960 3680 3168 3680
            WIRE 3168 3680 3264 3680
            BEGIN DISPLAY 3168 3680 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 3616 3264 3616
            BEGIN DISPLAY 3216 3616 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(11)
            WIRE 3120 3472 3184 3472
            WIRE 3184 3472 3248 3472
            BEGIN DISPLAY 3184 3472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(11)
            WIRE 2960 3408 3168 3408
            WIRE 3168 3408 3248 3408
            BEGIN DISPLAY 3168 3408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3200 3344 3248 3344
            BEGIN DISPLAY 3200 3344 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(10)
            WIRE 3120 3248 3184 3248
            WIRE 3184 3248 3248 3248
            BEGIN DISPLAY 3184 3248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(10)
            WIRE 2960 3184 3152 3184
            WIRE 3152 3184 3248 3184
            BEGIN DISPLAY 3152 3184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3200 3120 3248 3120
            BEGIN DISPLAY 3200 3120 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(9)
            WIRE 3120 3024 3184 3024
            WIRE 3184 3024 3248 3024
            BEGIN DISPLAY 3184 3024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(9)
            WIRE 2960 2960 3152 2960
            WIRE 3152 2960 3248 2960
            BEGIN DISPLAY 3152 2960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3200 2896 3248 2896
            BEGIN DISPLAY 3200 2896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(8)
            WIRE 3120 2800 3184 2800
            WIRE 3184 2800 3248 2800
            BEGIN DISPLAY 3184 2800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(8)
            WIRE 2960 2736 3136 2736
            WIRE 3136 2736 3248 2736
            BEGIN DISPLAY 3136 2736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3200 2672 3248 2672
            BEGIN DISPLAY 3200 2672 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(7)
            WIRE 3120 2560 3184 2560
            WIRE 3184 2560 3248 2560
            BEGIN DISPLAY 3184 2560 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(7)
            WIRE 2960 2496 3152 2496
            WIRE 3152 2496 3248 2496
            BEGIN DISPLAY 3152 2496 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3200 2432 3248 2432
            BEGIN DISPLAY 3200 2432 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(6)
            WIRE 3120 2336 3184 2336
            WIRE 3184 2336 3248 2336
            BEGIN DISPLAY 3184 2336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(6)
            WIRE 2960 2272 3152 2272
            WIRE 3152 2272 3248 2272
            BEGIN DISPLAY 3152 2272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3200 2208 3248 2208
            BEGIN DISPLAY 3200 2208 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(5)
            WIRE 3120 2112 3184 2112
            WIRE 3184 2112 3248 2112
            BEGIN DISPLAY 3184 2112 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(5)
            WIRE 2960 2048 3136 2048
            WIRE 3136 2048 3248 2048
            BEGIN DISPLAY 3136 2048 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 1984 3248 1984
            BEGIN DISPLAY 3216 1984 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(4)
            WIRE 3120 1888 3184 1888
            WIRE 3184 1888 3248 1888
            BEGIN DISPLAY 3184 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(4)
            WIRE 2960 1824 3120 1824
            WIRE 3120 1824 3248 1824
            BEGIN DISPLAY 3120 1824 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 1760 3248 1760
            BEGIN DISPLAY 3216 1760 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(3)
            WIRE 3120 1632 3184 1632
            WIRE 3184 1632 3248 1632
            BEGIN DISPLAY 3184 1632 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(3)
            WIRE 2960 1568 3120 1568
            WIRE 3120 1568 3248 1568
            BEGIN DISPLAY 3120 1568 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 1504 3248 1504
            BEGIN DISPLAY 3216 1504 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(2)
            WIRE 3120 1408 3168 1408
            WIRE 3168 1408 3248 1408
            BEGIN DISPLAY 3168 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3216 1280 3248 1280
            BEGIN DISPLAY 3216 1280 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(1)
            WIRE 3120 1184 3168 1184
            WIRE 3168 1184 3248 1184
            BEGIN DISPLAY 3168 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH TOGGLE
            WIRE 3200 1056 3248 1056
            BEGIN DISPLAY 3200 1056 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(2)
            WIRE 2960 1344 3120 1344
            WIRE 3120 1344 3248 1344
            BEGIN DISPLAY 3120 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(1)
            WIRE 2960 1120 3120 1120
            WIRE 3120 1120 3248 1120
            BEGIN DISPLAY 3120 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDOUT(0)
            WIRE 3120 960 3168 960
            WIRE 3168 960 3248 960
            BEGIN DISPLAY 3168 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FDIN(0)
            WIRE 2960 912 3104 912
            WIRE 3104 896 3104 912
            WIRE 3104 896 3248 896
            BEGIN DISPLAY 3104 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2864 1344 2960 1344
        BUSTAP 2864 1120 2960 1120
        BUSTAP 2864 1568 2960 1568
        BUSTAP 2864 1824 2960 1824
        BUSTAP 2864 2048 2960 2048
        BUSTAP 2864 2272 2960 2272
        BUSTAP 2864 2496 2960 2496
        BUSTAP 2864 2736 2960 2736
        BUSTAP 2864 2960 2960 2960
        BUSTAP 2864 3184 2960 3184
        BUSTAP 2864 3408 2960 3408
        BUSTAP 2864 3680 2960 3680
        BUSTAP 2864 3904 2960 3904
        BUSTAP 2864 4128 2960 4128
        BUSTAP 2864 4352 2960 4352
        BUSTAP 3024 4416 3120 4416
        BUSTAP 3024 4192 3120 4192
        BUSTAP 3024 3968 3120 3968
        BUSTAP 3024 3744 3120 3744
        BUSTAP 3024 3472 3120 3472
        BUSTAP 3024 3248 3120 3248
        BUSTAP 3024 3024 3120 3024
        BUSTAP 3024 2800 3120 2800
        BUSTAP 3024 2560 3120 2560
        BUSTAP 3024 2336 3120 2336
        BUSTAP 3024 2112 3120 2112
        BUSTAP 3024 1888 3120 1888
        BUSTAP 3024 1632 3120 1632
        BUSTAP 3024 1408 3120 1408
        BUSTAP 3024 1184 3120 1184
        BUSTAP 3024 960 3120 960
        BUSTAP 2864 912 2960 912
        BEGIN BRANCH FDOUT(15:0)
            WIRE 2704 4512 3024 4512
            WIRE 3024 960 3024 1184
            WIRE 3024 1184 3024 1408
            WIRE 3024 1408 3024 1632
            WIRE 3024 1632 3024 1888
            WIRE 3024 1888 3024 2112
            WIRE 3024 2112 3024 2336
            WIRE 3024 2336 3024 2560
            WIRE 3024 2560 3024 2800
            WIRE 3024 2800 3024 3024
            WIRE 3024 3024 3024 3248
            WIRE 3024 3248 3024 3472
            WIRE 3024 3472 3024 3744
            WIRE 3024 3744 3024 3968
            WIRE 3024 3968 3024 4192
            WIRE 3024 4192 3024 4416
            WIRE 3024 4416 3024 4512
        END BRANCH
        BEGIN BRANCH FDIN(15:0)
            WIRE 2768 864 2864 864
            WIRE 2864 864 2864 912
            WIRE 2864 912 2864 1120
            WIRE 2864 1120 2864 1344
            WIRE 2864 1344 2864 1568
            WIRE 2864 1568 2864 1824
            WIRE 2864 1824 2864 2048
            WIRE 2864 2048 2864 2272
            WIRE 2864 2272 2864 2496
            WIRE 2864 2496 2864 2736
            WIRE 2864 2736 2864 2960
            WIRE 2864 2960 2864 3184
            WIRE 2864 3184 2864 3408
            WIRE 2864 3408 2864 3680
            WIRE 2864 3680 2864 3904
            WIRE 2864 3904 2864 4128
            WIRE 2864 4128 2864 4352
            WIRE 2864 4352 2864 4368
        END BRANCH
        BEGIN BRANCH FD(15)
            WIRE 3488 4352 3520 4352
            BEGIN DISPLAY 3520 4352 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(14)
            WIRE 3488 4128 3520 4128
            BEGIN DISPLAY 3520 4128 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(13)
            WIRE 3488 3904 3520 3904
            BEGIN DISPLAY 3520 3904 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(12)
            WIRE 3488 3680 3520 3680
            BEGIN DISPLAY 3520 3680 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(11)
            WIRE 3472 3408 3504 3408
            BEGIN DISPLAY 3504 3408 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(10)
            WIRE 3472 3184 3504 3184
            BEGIN DISPLAY 3504 3184 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(9)
            WIRE 3472 2960 3504 2960
            BEGIN DISPLAY 3504 2960 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(8)
            WIRE 3472 2736 3504 2736
            BEGIN DISPLAY 3504 2736 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(7)
            WIRE 3472 2496 3504 2496
            BEGIN DISPLAY 3504 2496 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(6)
            WIRE 3472 2272 3504 2272
            BEGIN DISPLAY 3504 2272 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(5)
            WIRE 3472 2048 3504 2048
            BEGIN DISPLAY 3504 2048 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(4)
            WIRE 3472 1824 3504 1824
            BEGIN DISPLAY 3504 1824 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(3)
            WIRE 3472 1568 3504 1568
            BEGIN DISPLAY 3504 1568 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(2)
            WIRE 3472 1344 3504 1344
            BEGIN DISPLAY 3504 1344 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(1)
            WIRE 3472 1120 3504 1120
            BEGIN DISPLAY 3504 1120 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN DISPLAY 3260 676 TEXT Low
            FONT 64 "Arial"
        END DISPLAY
        BEGIN DISPLAY 3144 580 TEXT "Output Data Bus"
            FONT 64 "Arial"
        END DISPLAY
        INSTANCE XLXI_3631 3264 4480 R0
        INSTANCE XLXI_3630 3264 4256 R0
        INSTANCE XLXI_3629 3264 4032 R0
        INSTANCE XLXI_3628 3264 3808 R0
        INSTANCE XLXI_3627 3248 3536 R0
        INSTANCE XLXI_3626 3248 3312 R0
        INSTANCE XLXI_3625 3248 3088 R0
        INSTANCE XLXI_3624 3248 2864 R0
        INSTANCE XLXI_3623 3248 2624 R0
        INSTANCE XLXI_3622 3248 2400 R0
        INSTANCE XLXI_3621 3248 2176 R0
        INSTANCE XLXI_3620 3248 1952 R0
        INSTANCE XLXI_3615 3248 1696 R0
        INSTANCE XLXI_3614 3248 1472 R0
        INSTANCE XLXI_3613 3248 1248 R0
        BEGIN BRANCH TOGGLE
            WIRE 3216 832 3248 832
            BEGIN DISPLAY 3216 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(0)
            WIRE 3472 896 3504 896
            BEGIN DISPLAY 3504 896 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_3611 3248 1024 R0
        INSTANCE XLXI_3632 2640 640 R0
        BEGIN BRANCH xTOGGLE
            WIRE 2608 608 2640 608
        END BRANCH
        IOMARKER 2608 608 xTOGGLE R180 28
        BEGIN BRANCH TOGGLE
            WIRE 2864 608 2880 608
            BEGIN DISPLAY 2880 608 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH FD(15:0)
            WIRE 3440 4560 3568 4560
        END BRANCH
        IOMARKER 3568 4560 FD(15:0) R0 28
    END SHEET
END SCHEMATIC
