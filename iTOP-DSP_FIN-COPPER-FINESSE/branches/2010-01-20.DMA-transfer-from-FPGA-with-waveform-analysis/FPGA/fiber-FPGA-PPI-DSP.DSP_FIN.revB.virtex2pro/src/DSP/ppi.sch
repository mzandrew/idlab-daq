VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_2088
        SIGNAL sync
        SIGNAL xppi_fifo_counting
        SIGNAL fifo_address(14:0)
        SIGNAL XLXN_2600
        SIGNAL reset
        SIGNAL XLXN_2083
        SIGNAL last
        SIGNAL ppi_clock
        SIGNAL data_pending
        SIGNAL XLXN_2601(14:0)
        PORT Output sync
        PORT Output xppi_fifo_counting
        PORT Output fifo_address(14:0)
        PORT Input reset
        PORT Output last
        PORT Input ppi_clock
        PORT Input data_pending
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF synchronous_latch
            TIMESTAMP 2009 9 24 2 0 58
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            LINE N 64 -112 80 -96 
            LINE N 80 -96 64 -80 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF ppi_control
            TIMESTAMP 2009 10 19 19 50 16
            RECTANGLE N 64 -320 448 0 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 448 -288 512 -288 
            RECTANGLE N 448 -236 512 -212 
            LINE N 448 -224 512 -224 
            LINE N 448 -160 512 -160 
            LINE N 448 -96 512 -96 
            LINE N 448 -32 512 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF constant_15bit
            TIMESTAMP 2009 10 19 19 52 21
            RECTANGLE N 96 -64 320 0 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_736 vcc
            PIN P XLXN_2083
        END BLOCK
        BEGIN BLOCK XLXI_797 obuf
            PIN I XLXN_2600
            PIN O sync
        END BLOCK
        BEGIN BLOCK ppicontrol ppi_control
            PIN data_in_buffer XLXN_2088
            PIN ppi_clock ppi_clock
            PIN buffer_length(14:0) XLXN_2601(14:0)
            PIN enable XLXN_2083
            PIN reset reset
            PIN last last
            PIN address(14:0) fifo_address(14:0)
            PIN first XLXN_2600
            PIN counting xppi_fifo_counting
            PIN running
        END BLOCK
        BEGIN BLOCK XLXI_865 synchronous_latch
            PIN slatch data_pending
            PIN clock ppi_clock
            PIN clear last
            PIN Q XLXN_2088
        END BLOCK
        BEGIN BLOCK XLXI_866 constant_15bit
            PIN o(14:0) XLXN_2601(14:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1760 1360
        BEGIN BRANCH XLXN_2088
            WIRE 32 16 32 544
            WIRE 32 544 560 544
            WIRE 32 16 928 16
            WIRE 928 16 928 128
            WIRE 752 128 928 128
        END BRANCH
        BEGIN BRANCH sync
            WIRE 1344 672 1360 672
        END BRANCH
        BEGIN BRANCH xppi_fifo_counting
            WIRE 1072 736 1120 736
        END BRANCH
        BEGIN BRANCH fifo_address(14:0)
            WIRE 1072 608 1104 608
        END BRANCH
        BEGIN BRANCH XLXN_2600
            WIRE 1072 672 1120 672
        END BRANCH
        BEGIN BRANCH reset
            WIRE 528 800 560 800
        END BRANCH
        BEGIN BRANCH XLXN_2083
            WIRE 160 720 160 736
            WIRE 160 736 560 736
        END BRANCH
        BEGIN BRANCH last
            WIRE 320 256 320 400
            WIRE 320 400 1120 400
            WIRE 1120 400 1120 544
            WIRE 1120 544 1152 544
            WIRE 320 256 368 256
            WIRE 1072 544 1120 544
        END BRANCH
        BEGIN BRANCH ppi_clock
            WIRE 256 192 288 192
            WIRE 288 192 368 192
            WIRE 288 192 288 432
            WIRE 288 432 512 432
            WIRE 512 432 512 608
            WIRE 512 608 560 608
        END BRANCH
        BEGIN BRANCH data_pending
            WIRE 256 128 368 128
        END BRANCH
        INSTANCE XLXI_736 96 720 R0
        INSTANCE XLXI_797 1120 704 R0
        BEGIN INSTANCE ppicontrol 560 832 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_865 368 288 R0
        END INSTANCE
        IOMARKER 256 192 ppi_clock R180 28
        IOMARKER 256 128 data_pending R180 28
        IOMARKER 1120 736 xppi_fifo_counting R0 28
        IOMARKER 1360 672 sync R0 28
        IOMARKER 1104 608 fifo_address(14:0) R0 28
        IOMARKER 528 800 reset R180 28
        IOMARKER 1152 544 last R0 28
        BEGIN INSTANCE XLXI_866 144 704 R0
        END INSTANCE
        BEGIN BRANCH XLXN_2601(14:0)
            WIRE 528 672 560 672
        END BRANCH
    END SHEET
END SCHEMATIC
