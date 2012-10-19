VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_148
        SIGNAL XLXN_149
        SIGNAL xREAD_CLOCK
        SIGNAL xREAD_ADDRESS(13:0)
        SIGNAL xWRITE_ENABLE
        SIGNAL XLXN_139
        SIGNAL XLXN_140
        SIGNAL xWRITE_ADDRESS(13:0)
        SIGNAL XLXN_2730
        SIGNAL XLXN_2731(0:0)
        SIGNAL xWRITE_DATA
        SIGNAL XLXN_2733(0:0)
        SIGNAL xREAD_DATA
        SIGNAL xWRITE_CLOCK
        PORT Input xREAD_CLOCK
        PORT Input xREAD_ADDRESS(13:0)
        PORT Input xWRITE_ENABLE
        PORT Input xWRITE_ADDRESS(13:0)
        PORT Input xWRITE_DATA
        PORT Output xREAD_DATA
        PORT Input xWRITE_CLOCK
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2001 2 2 12 37 29
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 2 2 12 37 29
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ramb16_s1_s1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 544 -1088 64 -1088 
            LINE N 544 -640 544 -1088 
            RECTANGLE N 544 -368 608 -336 
            RECTANGLE N 544 -880 608 -848 
            LINE N 64 -1088 64 -640 
            LINE N 80 -832 64 -848 
            LINE N 64 -816 80 -832 
            RECTANGLE N 0 -720 64 -688 
            RECTANGLE N 0 -784 64 -752 
            RECTANGLE N 0 -208 64 -176 
            RECTANGLE N 0 -272 64 -240 
            LINE N 80 -320 64 -336 
            LINE N 64 -304 80 -320 
            LINE N 128 -640 64 -640 
            LINE N 128 -576 128 -640 
            LINE N 64 -576 128 -576 
            LINE N 64 -128 64 -576 
            LINE N 544 -128 64 -128 
            LINE N 544 -576 544 -128 
            LINE N 480 -576 544 -576 
            LINE N 480 -640 480 -576 
            LINE N 544 -640 480 -640 
            LINE N 608 -352 544 -352 
            LINE N 608 -864 544 -864 
            LINE N 0 -704 64 -704 
            LINE N 0 -1024 64 -1024 
            LINE N 0 -768 64 -768 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 0 -384 64 -384 
            LINE N 0 -448 64 -448 
            LINE N 0 -512 64 -512 
            LINE N 0 -832 64 -832 
            LINE N 0 -896 64 -896 
            LINE N 0 -960 64 -960 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCK XLXI_45 gnd
            PIN G XLXN_148
        END BLOCK
        BEGIN BLOCK XLXI_46 gnd
            PIN G XLXN_149
        END BLOCK
        BEGIN BLOCK XLXI_35 vcc
            PIN P XLXN_139
        END BLOCK
        BEGIN BLOCK XLXI_36 vcc
            PIN P XLXN_140
        END BLOCK
        BEGIN BLOCK XLXI_1841 vcc
            PIN P XLXN_2730
        END BLOCK
        BEGIN BLOCK XLXI_1842 ramb16_s1_s1
            BEGIN ATTR INIT_3F "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_3E "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_3D "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_3C "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_3B "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_3A "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_39 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_38 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_37 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_36 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_35 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_34 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_33 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_32 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_31 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_30 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_2F "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_2E "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_2D "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_2C "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_2B "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_2A "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_29 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_28 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_27 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_26 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_25 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_24 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_23 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_22 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_21 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_20 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_1F "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_1E "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_1D "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_1C "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_1B "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_1A "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_19 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_18 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_17 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_16 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_15 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_14 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_13 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_12 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_11 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_10 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_0F "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_0E "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_0D "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_0C "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_0B "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_0A "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_09 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_08 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_07 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_06 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_05 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_04 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_03 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_02 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_01 "0123456701234567012345670123456701234567012345670123456701234567"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            BEGIN ATTR INIT_00 "a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 256 h
            END ATTR
            PIN ADDRA(13:0) xWRITE_ADDRESS(13:0)
            PIN ADDRB(13:0) xREAD_ADDRESS(13:0)
            PIN CLKA xWRITE_CLOCK
            PIN CLKB xREAD_CLOCK
            PIN DIA(0:0) xWRITE_DATA
            PIN DIB(0:0) XLXN_2731(0:0)
            PIN ENA XLXN_139
            PIN ENB XLXN_2730
            PIN SSRA XLXN_140
            PIN SSRB XLXN_149
            PIN WEA xWRITE_ENABLE
            PIN WEB XLXN_148
            PIN DOA(0:0)
            PIN DOB(0:0) XLXN_2733(0:0)
        END BLOCK
        BEGIN BLOCK XLXI_1843 gnd
            PIN G XLXN_2731(0:0)
        END BLOCK
        BEGIN BLOCK XLXI_1844 buf
            PIN I XLXN_2733(0:0)
            PIN O xREAD_DATA
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        BEGIN BRANCH XLXN_148
            WIRE 528 752 544 752
            WIRE 544 752 560 752
        END BRANCH
        INSTANCE XLXI_45 400 688 R90
        BEGIN BRANCH XLXN_149
            WIRE 528 880 544 880
            WIRE 544 880 560 880
        END BRANCH
        INSTANCE XLXI_46 400 816 R90
        BEGIN BRANCH xREAD_CLOCK
            WIRE 544 944 560 944
        END BRANCH
        BEGIN BRANCH xREAD_ADDRESS(13:0)
            WIRE 512 1008 560 1008
        END BRANCH
        BEGIN BRANCH xWRITE_ENABLE
            WIRE 544 240 560 240
        END BRANCH
        BEGIN BRANCH XLXN_139
            WIRE 528 304 560 304
        END BRANCH
        INSTANCE XLXI_35 528 368 R270
        BEGIN BRANCH XLXN_140
            WIRE 528 368 560 368
        END BRANCH
        INSTANCE XLXI_36 528 432 R270
        BEGIN BRANCH xWRITE_ADDRESS(13:0)
            WIRE 528 496 560 496
        END BRANCH
        IOMARKER 544 944 xREAD_CLOCK R180 28
        IOMARKER 512 1008 xREAD_ADDRESS(13:0) R180 28
        IOMARKER 544 240 xWRITE_ENABLE R180 28
        IOMARKER 528 496 xWRITE_ADDRESS(13:0) R180 28
        BEGIN BRANCH XLXN_2730
            WIRE 528 816 560 816
        END BRANCH
        INSTANCE XLXI_1841 528 880 R270
        BEGIN INSTANCE XLXI_1842 560 1264 R0
            BEGIN DISPLAY 40 -62 ATTR INIT_01
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
            BEGIN DISPLAY 40 -94 ATTR INIT_00
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH XLXN_2731(0:0)
            WIRE 528 1072 560 1072
        END BRANCH
        INSTANCE XLXI_1843 400 1008 R90
        BEGIN BRANCH xWRITE_DATA
            WIRE 528 560 560 560
        END BRANCH
        IOMARKER 528 560 xWRITE_DATA R180 28
        BEGIN BRANCH XLXN_2733(0:0)
            WIRE 1168 912 1200 912
        END BRANCH
        INSTANCE XLXI_1844 1200 944 R0
        BEGIN BRANCH xREAD_DATA
            WIRE 1424 912 1456 912
        END BRANCH
        IOMARKER 1456 912 xREAD_DATA R0 28
        BEGIN BRANCH xWRITE_CLOCK
            WIRE 528 432 560 432
        END BRANCH
        IOMARKER 528 432 xWRITE_CLOCK R180 28
    END SHEET
END SCHEMATIC
