VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL const(15:0)
        SIGNAL const(0)
        SIGNAL const(1)
        SIGNAL const(2)
        SIGNAL const(3)
        SIGNAL const(4)
        SIGNAL const(5)
        SIGNAL const(6)
        SIGNAL const(7)
        SIGNAL const(8)
        SIGNAL const(9)
        SIGNAL const(10)
        SIGNAL const(11)
        SIGNAL const(12)
        SIGNAL const(13)
        SIGNAL const(14)
        SIGNAL const(15)
        SIGNAL o(13:0)
        SIGNAL o(0)
        SIGNAL o(1)
        SIGNAL o(2)
        SIGNAL o(3)
        SIGNAL o(13)
        SIGNAL o(12)
        SIGNAL o(11)
        SIGNAL o(10)
        SIGNAL o(9)
        SIGNAL o(8)
        SIGNAL o(7)
        SIGNAL o(6)
        SIGNAL o(5)
        SIGNAL o(4)
        PORT Output o(13:0)
        BEGIN BLOCKDEF constant
            TIMESTAMP 2006 1 1 10 10 10
            RECTANGLE N 0 0 112 64 
            LINE N 144 32 112 32 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCK burst_length constant
            BEGIN ATTR CValue "0400"
                DELETE all:1 sym:0
                EDITNAME all:1 sch:0
                VALUETYPE BitVector 32 Hexadecimal
            END ATTR
            PIN O const(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 buf
            PIN I const(0)
            PIN O o(0)
        END BLOCK
        BEGIN BLOCK XLXI_4 buf
            PIN I const(1)
            PIN O o(1)
        END BLOCK
        BEGIN BLOCK XLXI_5 buf
            PIN I const(2)
            PIN O o(2)
        END BLOCK
        BEGIN BLOCK XLXI_6 buf
            PIN I const(3)
            PIN O o(3)
        END BLOCK
        BEGIN BLOCK XLXI_9 buf
            PIN I const(4)
            PIN O o(4)
        END BLOCK
        BEGIN BLOCK XLXI_10 buf
            PIN I const(5)
            PIN O o(5)
        END BLOCK
        BEGIN BLOCK XLXI_11 buf
            PIN I const(6)
            PIN O o(6)
        END BLOCK
        BEGIN BLOCK XLXI_12 buf
            PIN I const(7)
            PIN O o(7)
        END BLOCK
        BEGIN BLOCK XLXI_13 buf
            PIN I const(8)
            PIN O o(8)
        END BLOCK
        BEGIN BLOCK XLXI_14 buf
            PIN I const(9)
            PIN O o(9)
        END BLOCK
        BEGIN BLOCK XLXI_15 buf
            PIN I const(10)
            PIN O o(10)
        END BLOCK
        BEGIN BLOCK XLXI_16 buf
            PIN I const(11)
            PIN O o(11)
        END BLOCK
        BEGIN BLOCK XLXI_17 buf
            PIN I const(12)
            PIN O o(12)
        END BLOCK
        BEGIN BLOCK XLXI_18 buf
            PIN I const(13)
            PIN O o(13)
        END BLOCK
        BEGIN BLOCK XLXI_19 buf
            PIN I const(14)
            PIN O
        END BLOCK
        BEGIN BLOCK XLXI_20 buf
            PIN I const(15)
            PIN O
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        BEGIN INSTANCE burst_length 32 64 R0
            BEGIN DISPLAY -16 -40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH const(15:0)
            WIRE 176 96 432 96
            WIRE 432 96 432 144
            WIRE 432 144 432 208
            WIRE 432 208 432 272
            WIRE 432 272 432 336
            WIRE 432 336 432 416
            WIRE 432 416 432 480
            WIRE 432 480 432 544
            WIRE 432 544 432 608
            WIRE 432 608 432 688
            WIRE 432 688 432 752
            WIRE 432 752 432 816
            WIRE 432 816 432 880
            WIRE 432 880 432 960
            WIRE 432 960 432 1024
            WIRE 432 1024 432 1088
            WIRE 432 1088 432 1152
            WIRE 432 1152 432 1232
        END BRANCH
        BUSTAP 432 144 528 144
        BUSTAP 432 208 528 208
        BUSTAP 432 272 528 272
        BUSTAP 432 336 528 336
        BUSTAP 432 416 528 416
        BUSTAP 432 480 528 480
        BUSTAP 432 544 528 544
        BUSTAP 432 608 528 608
        BUSTAP 432 688 528 688
        BUSTAP 432 752 528 752
        BUSTAP 432 816 528 816
        BUSTAP 432 880 528 880
        BUSTAP 432 960 528 960
        BUSTAP 432 1024 528 1024
        BUSTAP 432 1088 528 1088
        BUSTAP 432 1152 528 1152
        INSTANCE XLXI_3 640 176 R0
        INSTANCE XLXI_4 640 240 R0
        INSTANCE XLXI_5 640 304 R0
        INSTANCE XLXI_6 640 368 R0
        INSTANCE XLXI_9 640 448 R0
        INSTANCE XLXI_10 640 512 R0
        INSTANCE XLXI_11 640 576 R0
        INSTANCE XLXI_12 640 640 R0
        INSTANCE XLXI_13 640 720 R0
        INSTANCE XLXI_14 640 784 R0
        INSTANCE XLXI_15 640 848 R0
        INSTANCE XLXI_16 640 912 R0
        INSTANCE XLXI_17 640 992 R0
        INSTANCE XLXI_18 640 1056 R0
        INSTANCE XLXI_19 640 1120 R0
        INSTANCE XLXI_20 640 1184 R0
        BEGIN BRANCH const(0)
            WIRE 528 144 576 144
            WIRE 576 144 608 144
            WIRE 608 144 640 144
            BEGIN DISPLAY 576 144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(1)
            WIRE 528 208 576 208
            WIRE 576 208 608 208
            WIRE 608 208 640 208
            BEGIN DISPLAY 576 208 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(2)
            WIRE 528 272 576 272
            WIRE 576 272 608 272
            WIRE 608 272 640 272
            BEGIN DISPLAY 576 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(3)
            WIRE 528 336 592 336
            WIRE 592 336 608 336
            WIRE 608 336 640 336
            BEGIN DISPLAY 592 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(4)
            WIRE 528 416 576 416
            WIRE 576 416 608 416
            WIRE 608 416 640 416
            BEGIN DISPLAY 576 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(5)
            WIRE 528 480 576 480
            WIRE 576 480 608 480
            WIRE 608 480 640 480
            BEGIN DISPLAY 576 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(6)
            WIRE 528 544 576 544
            WIRE 576 544 608 544
            WIRE 608 544 640 544
            BEGIN DISPLAY 576 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(7)
            WIRE 528 608 576 608
            WIRE 576 608 608 608
            WIRE 608 608 640 608
            BEGIN DISPLAY 576 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(8)
            WIRE 528 688 576 688
            WIRE 576 688 608 688
            WIRE 608 688 640 688
            BEGIN DISPLAY 576 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(9)
            WIRE 528 752 592 752
            WIRE 592 752 608 752
            WIRE 608 752 640 752
            BEGIN DISPLAY 592 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(10)
            WIRE 528 816 576 816
            WIRE 576 816 608 816
            WIRE 608 816 640 816
            BEGIN DISPLAY 576 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(11)
            WIRE 528 880 576 880
            WIRE 576 880 608 880
            WIRE 608 880 640 880
            BEGIN DISPLAY 576 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(12)
            WIRE 528 960 576 960
            WIRE 576 960 608 960
            WIRE 608 960 640 960
            BEGIN DISPLAY 576 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(13)
            WIRE 528 1024 576 1024
            WIRE 576 1024 608 1024
            WIRE 608 1024 640 1024
            BEGIN DISPLAY 576 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(14)
            WIRE 528 1088 576 1088
            WIRE 576 1088 608 1088
            WIRE 608 1088 640 1088
            BEGIN DISPLAY 576 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH const(15)
            WIRE 528 1152 576 1152
            WIRE 576 1152 608 1152
            WIRE 608 1152 640 1152
            BEGIN DISPLAY 576 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH o(13:0)
            WIRE 1200 112 1200 144
            WIRE 1200 144 1200 208
            WIRE 1200 208 1200 272
            WIRE 1200 272 1200 336
            WIRE 1200 336 1200 416
            WIRE 1200 416 1200 480
            WIRE 1200 480 1200 544
            WIRE 1200 544 1200 608
            WIRE 1200 608 1200 688
            WIRE 1200 688 1200 752
            WIRE 1200 752 1200 816
            WIRE 1200 816 1200 880
            WIRE 1200 880 1200 960
            WIRE 1200 960 1200 1024
            WIRE 1200 1024 1200 1216
            WIRE 1200 1216 1216 1216
            WIRE 1216 1216 1312 1216
        END BRANCH
        IOMARKER 1312 1216 o(13:0) R0 28
        BUSTAP 1200 144 1104 144
        BEGIN BRANCH o(0)
            WIRE 864 144 992 144
            WIRE 992 144 1104 144
            BEGIN DISPLAY 992 144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 208 1104 208
        BEGIN BRANCH o(1)
            WIRE 864 208 992 208
            WIRE 992 208 1104 208
            BEGIN DISPLAY 992 208 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 272 1104 272
        BEGIN BRANCH o(2)
            WIRE 864 272 992 272
            WIRE 992 272 1104 272
            BEGIN DISPLAY 992 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 336 1104 336
        BEGIN BRANCH o(3)
            WIRE 864 336 992 336
            WIRE 992 336 1104 336
            BEGIN DISPLAY 992 336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 1024 1104 1024
        BEGIN BRANCH o(13)
            WIRE 864 1024 1008 1024
            WIRE 1008 1024 1104 1024
            BEGIN DISPLAY 1008 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 960 1104 960
        BEGIN BRANCH o(12)
            WIRE 864 960 1008 960
            WIRE 1008 960 1104 960
            BEGIN DISPLAY 1008 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 880 1104 880
        BEGIN BRANCH o(11)
            WIRE 864 880 1008 880
            WIRE 1008 880 1104 880
            BEGIN DISPLAY 1008 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 816 1104 816
        BEGIN BRANCH o(10)
            WIRE 864 816 1008 816
            WIRE 1008 816 1104 816
            BEGIN DISPLAY 1008 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 752 1104 752
        BEGIN BRANCH o(9)
            WIRE 864 752 1008 752
            WIRE 1008 752 1104 752
            BEGIN DISPLAY 1008 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 688 1104 688
        BEGIN BRANCH o(8)
            WIRE 864 688 1008 688
            WIRE 1008 688 1104 688
            BEGIN DISPLAY 1008 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 608 1104 608
        BEGIN BRANCH o(7)
            WIRE 864 608 1008 608
            WIRE 1008 608 1104 608
            BEGIN DISPLAY 1008 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 544 1104 544
        BEGIN BRANCH o(6)
            WIRE 864 544 1008 544
            WIRE 1008 544 1104 544
            BEGIN DISPLAY 1008 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 480 1104 480
        BEGIN BRANCH o(5)
            WIRE 864 480 1008 480
            WIRE 1008 480 1104 480
            BEGIN DISPLAY 1008 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1200 416 1104 416
        BEGIN BRANCH o(4)
            WIRE 864 416 992 416
            WIRE 992 416 1104 416
            BEGIN DISPLAY 992 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
