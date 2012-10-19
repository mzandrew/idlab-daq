VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL reset
        SIGNAL address(14:0)
        SIGNAL XLXN_115
        SIGNAL data_in_buffer
        SIGNAL XLXN_93
        SIGNAL buffer_length(14:0)
        SIGNAL enable
        SIGNAL XLXN_357
        SIGNAL XLXN_525
        SIGNAL ppi_clock
        SIGNAL first
        SIGNAL running
        SIGNAL second_to_last
        SIGNAL last
        SIGNAL counting
        SIGNAL XLXN_556
        PORT Input reset
        PORT Output address(14:0)
        PORT Input data_in_buffer
        PORT Input buffer_length(14:0)
        PORT Input enable
        PORT Input ppi_clock
        PORT Output first
        PORT Output running
        PORT Output last
        PORT Output counting
        BEGIN BLOCKDEF synchronous_latch
            TIMESTAMP 2009 9 25 21 25 15
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            LINE N 64 -112 80 -96 
            LINE N 80 -96 64 -80 
        END BLOCKDEF
        BEGIN BLOCKDEF block_ram_counter
            TIMESTAMP 2009 10 19 19 47 5
            RECTANGLE N 32 32 272 224 
            BEGIN LINE W 0 64 32 64 
            END LINE
            LINE N 0 96 32 96 
            LINE N 0 160 32 160 
            LINE N 0 192 32 192 
            LINE N 304 80 272 80 
            BEGIN LINE W 304 176 272 176 
            END LINE
        END BLOCKDEF
        BEGIN BLOCKDEF edge_to_pulse
            TIMESTAMP 2009 9 25 21 24 35
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF fdc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF address_comparator
            TIMESTAMP 2009 10 19 19 47 19
            RECTANGLE N 32 64 256 96 
            BEGIN LINE W 0 80 32 80 
            END LINE
            LINE N 288 80 256 80 
        END BLOCKDEF
        BEGIN BLOCK XLXI_17 address_comparator
            PIN a(14:0) address(14:0)
            PIN a_eq_b XLXN_115
        END BLOCK
        BEGIN BLOCK XLXI_2 block_ram_counter
            PIN l(14:0) buffer_length(14:0)
            PIN load XLXN_93
            PIN clk ppi_clock
            PIN ce counting
            PIN q_thresh0
            PIN q(14:0) address(14:0)
        END BLOCK
        BEGIN BLOCK e2p_loadcounter edge_to_pulse
            PIN i data_in_buffer
            PIN clock ppi_clock
            PIN o XLXN_93
        END BLOCK
        BEGIN BLOCK XLXI_1 synchronous_latch
            PIN slatch data_in_buffer
            PIN clock ppi_clock
            PIN clear XLXN_525
            PIN Q running
        END BLOCK
        BEGIN BLOCK XLXI_15 and2
            PIN I0 enable
            PIN I1 running
            PIN O XLXN_357
        END BLOCK
        BEGIN BLOCK XLXI_16 fdc
            PIN C ppi_clock
            PIN CLR XLXN_525
            PIN D XLXN_357
            PIN Q counting
        END BLOCK
        BEGIN BLOCK e2p_first edge_to_pulse
            PIN i running
            PIN clock ppi_clock
            PIN o first
        END BLOCK
        BEGIN BLOCK e2p_last edge_to_pulse
            PIN i XLXN_115
            PIN clock ppi_clock
            PIN o second_to_last
        END BLOCK
        BEGIN BLOCK XLXI_5 or2
            PIN I0 second_to_last
            PIN I1 reset
            PIN O XLXN_525
        END BLOCK
        BEGIN BLOCK XLXI_18 edge_to_pulse
            PIN i second_to_last
            PIN clock ppi_clock
            PIN o last
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 2720 1760
        BEGIN BRANCH address(14:0)
            WIRE 1248 208 1280 208
            WIRE 1280 208 1296 208
            WIRE 1280 112 1280 208
            WIRE 1280 112 1296 112
        END BRANCH
        BEGIN BRANCH data_in_buffer
            WIRE 384 128 400 128
            WIRE 400 128 480 128
            WIRE 400 128 400 384
            WIRE 400 384 464 384
        END BRANCH
        BEGIN BRANCH XLXN_93
            WIRE 864 128 944 128
        END BRANCH
        BEGIN BRANCH buffer_length(14:0)
            WIRE 432 32 928 32
            WIRE 928 32 928 96
            WIRE 928 96 944 96
        END BRANCH
        BEGIN BRANCH enable
            WIRE 1056 512 1088 512
        END BRANCH
        BEGIN BRANCH XLXN_357
            WIRE 1344 480 1392 480
        END BRANCH
        BEGIN INSTANCE XLXI_17 1296 128 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 944 32 R0
        END INSTANCE
        BEGIN INSTANCE e2p_loadcounter 480 224 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_1 464 544 R0
        END INSTANCE
        INSTANCE XLXI_15 1088 576 R0
        INSTANCE XLXI_16 1392 736 R0
        BEGIN BRANCH XLXN_525
            WIRE 400 512 448 512
            WIRE 448 512 464 512
            WIRE 448 512 448 832
            WIRE 448 832 1392 832
            WIRE 1392 704 1392 832
        END BRANCH
        BEGIN BRANCH first
            WIRE 1280 704 1296 704
        END BRANCH
        BEGIN BRANCH running
            WIRE 848 384 864 384
            WIRE 864 384 928 384
            WIRE 864 384 864 448
            WIRE 864 448 1088 448
            WIRE 864 448 864 704
            WIRE 864 704 896 704
        END BRANCH
        BEGIN INSTANCE e2p_first 896 800 R0
        END INSTANCE
        BEGIN BRANCH second_to_last
            WIRE 128 544 144 544
            WIRE 128 544 128 880
            WIRE 128 880 1616 880
            WIRE 1616 880 2160 880
            WIRE 2160 880 2160 1168
            WIRE 2160 1168 2192 1168
            WIRE 2160 880 2656 880
            WIRE 2592 208 2656 208
            WIRE 2656 208 2656 880
            BEGIN DISPLAY 1616 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_5 144 608 R0
        IOMARKER 384 128 data_in_buffer R180 28
        IOMARKER 1296 112 address(14:0) R0 28
        IOMARKER 928 384 running R0 28
        IOMARKER 1056 512 enable R180 28
        IOMARKER 1296 704 first R0 28
        IOMARKER 352 192 ppi_clock R180 28
        IOMARKER 432 32 buffer_length(14:0) R180 28
        BEGIN INSTANCE XLXI_18 2192 1264 R0
        END INSTANCE
        BEGIN BRANCH last
            WIRE 2576 1168 2608 1168
        END BRANCH
        IOMARKER 2608 1168 last R0 28
        BEGIN BRANCH XLXN_115
            WIRE 1584 208 2208 208
        END BRANCH
        BEGIN INSTANCE e2p_last 2208 304 R0
        END INSTANCE
        BEGIN BRANCH counting
            WIRE 912 224 944 224
            WIRE 912 224 912 320
            WIRE 912 320 1792 320
            WIRE 1792 320 1792 480
            WIRE 1792 480 1824 480
            WIRE 1776 480 1792 480
        END BRANCH
        IOMARKER 1824 480 counting R0 28
        BEGIN BRANCH ppi_clock
            WIRE 352 192 432 192
            WIRE 432 192 480 192
            WIRE 432 192 432 272
            WIRE 432 272 864 272
            WIRE 864 272 2064 272
            WIRE 2064 272 2064 1232
            WIRE 2064 1232 2192 1232
            WIRE 2064 272 2208 272
            WIRE 432 272 432 448
            WIRE 432 448 464 448
            WIRE 432 448 432 608
            WIRE 432 608 1392 608
            WIRE 432 608 432 768
            WIRE 432 768 896 768
            WIRE 864 192 944 192
            WIRE 864 192 864 272
        END BRANCH
        BEGIN BRANCH reset
            WIRE 112 480 128 480
            WIRE 128 480 144 480
        END BRANCH
        IOMARKER 112 480 reset R180 28
    END SHEET
END SCHEMATIC
