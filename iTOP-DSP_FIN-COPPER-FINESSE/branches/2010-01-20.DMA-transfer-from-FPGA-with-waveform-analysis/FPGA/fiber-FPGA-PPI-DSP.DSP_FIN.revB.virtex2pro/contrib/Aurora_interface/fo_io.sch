VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL TX_FAULT
        SIGNAL XLXN_5
        SIGNAL RX_LOSS
        SIGNAL MOD2
        SIGNAL XLXN_11
        SIGNAL MOD0
        SIGNAL XLXN_32
        SIGNAL XLXN_33
        SIGNAL XLXN_35
        SIGNAL xTX_FAULT
        SIGNAL xMOD2
        SIGNAL xMOD0
        SIGNAL TX_DIS
        SIGNAL MOD1
        SIGNAL XLXN_38
        SIGNAL XLXN_34
        SIGNAL xRX_LOSS_N
        PORT Input TX_FAULT
        PORT Input RX_LOSS
        PORT Input MOD2
        PORT Input MOD0
        PORT Output xTX_FAULT
        PORT Output xMOD2
        PORT Output xMOD0
        PORT Output TX_DIS
        PORT Output MOD1
        PORT Output xRX_LOSS_N
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
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
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 ibuf
            PIN I TX_FAULT
            PIN O XLXN_35
        END BLOCK
        BEGIN BLOCK XLXI_2 obuf
            PIN I XLXN_5
            PIN O TX_DIS
        END BLOCK
        BEGIN BLOCK XLXI_3 gnd
            PIN G XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 ibuf
            PIN I RX_LOSS
            PIN O XLXN_38
        END BLOCK
        BEGIN BLOCK XLXI_5 ibuf
            PIN I MOD2
            PIN O XLXN_33
        END BLOCK
        BEGIN BLOCK XLXI_6 obuf
            PIN I XLXN_11
            PIN O MOD1
        END BLOCK
        BEGIN BLOCK XLXI_7 gnd
            PIN G XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_8 ibuf
            PIN I MOD0
            PIN O XLXN_32
        END BLOCK
        BEGIN BLOCK XLXI_17 buf
            PIN I XLXN_32
            PIN O xMOD0
        END BLOCK
        BEGIN BLOCK XLXI_18 buf
            PIN I XLXN_33
            PIN O xMOD2
        END BLOCK
        BEGIN BLOCK XLXI_20 buf
            PIN I XLXN_35
            PIN O xTX_FAULT
        END BLOCK
        BEGIN BLOCK XLXI_22 inv
            PIN I XLXN_38
            PIN O XLXN_34
        END BLOCK
        BEGIN BLOCK XLXI_19 buf
            PIN I XLXN_34
            PIN O xRX_LOSS_N
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        INSTANCE XLXI_1 496 528 R0
        BEGIN BRANCH TX_FAULT
            WIRE 464 496 496 496
        END BRANCH
        INSTANCE XLXI_2 496 592 R0
        BEGIN BRANCH XLXN_5
            WIRE 464 560 496 560
        END BRANCH
        INSTANCE XLXI_3 336 496 R90
        BEGIN BRANCH RX_LOSS
            WIRE 464 624 496 624
        END BRANCH
        INSTANCE XLXI_4 496 656 R0
        INSTANCE XLXI_5 496 720 R0
        BEGIN BRANCH MOD2
            WIRE 464 688 496 688
        END BRANCH
        INSTANCE XLXI_6 496 784 R0
        BEGIN BRANCH XLXN_11
            WIRE 464 752 496 752
        END BRANCH
        INSTANCE XLXI_7 336 688 R90
        BEGIN BRANCH MOD0
            WIRE 464 816 496 816
        END BRANCH
        INSTANCE XLXI_8 496 848 R0
        BEGIN BRANCH XLXN_32
            WIRE 720 816 752 816
        END BRANCH
        INSTANCE XLXI_17 752 848 R0
        BEGIN BRANCH XLXN_33
            WIRE 720 688 752 688
        END BRANCH
        INSTANCE XLXI_18 752 720 R0
        BEGIN BRANCH XLXN_35
            WIRE 720 496 752 496
        END BRANCH
        INSTANCE XLXI_20 752 528 R0
        BEGIN BRANCH xTX_FAULT
            WIRE 976 496 1008 496
        END BRANCH
        BEGIN BRANCH xMOD2
            WIRE 976 688 1008 688
        END BRANCH
        BEGIN BRANCH xMOD0
            WIRE 976 816 1008 816
        END BRANCH
        BEGIN BRANCH TX_DIS
            WIRE 720 560 752 560
        END BRANCH
        BEGIN BRANCH MOD1
            WIRE 720 752 752 752
        END BRANCH
        BEGIN BRANCH XLXN_38
            WIRE 720 624 752 624
        END BRANCH
        INSTANCE XLXI_22 752 656 R0
        BEGIN BRANCH XLXN_34
            WIRE 976 624 1008 624
        END BRANCH
        BEGIN BRANCH xRX_LOSS_N
            WIRE 1232 624 1264 624
        END BRANCH
        INSTANCE XLXI_19 1008 656 R0
        IOMARKER 464 496 TX_FAULT R180 28
        IOMARKER 464 624 RX_LOSS R180 28
        IOMARKER 464 688 MOD2 R180 28
        IOMARKER 464 816 MOD0 R180 28
        IOMARKER 1008 496 xTX_FAULT R0 28
        IOMARKER 1008 688 xMOD2 R0 28
        IOMARKER 1008 816 xMOD0 R0 28
        IOMARKER 752 560 TX_DIS R0 28
        IOMARKER 752 752 MOD1 R0 28
        IOMARKER 1264 624 xRX_LOSS_N R0 28
    END SHEET
END SCHEMATIC
