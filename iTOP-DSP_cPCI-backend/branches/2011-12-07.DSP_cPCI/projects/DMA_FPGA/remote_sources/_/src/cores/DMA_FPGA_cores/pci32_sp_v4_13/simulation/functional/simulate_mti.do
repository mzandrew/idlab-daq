#
# PCI MTI Verilog run script
#
vlib work
vmap work

# Compiling the core structural model
vlog -work work ../../../pci32_sp_v4_13.v

# Compiling the example design
vlog -work work ../../example_design/userapp.v
vlog -work work ../../example_design/pci_lc.v
vlog -work work ../../example_design/pci32_sp_v4_13_top.v

# Compiling the demonstration testbench
vlog -work work +incdir+../ ../stimulus.v
vlog -work work ../busrec.v
vlog -work work ../test_tb.v
vlog -work work ../dumb_targ32.v
vlog -work work ../dumb_targ64.v

vsim -voptargs="+acc" -L unisims_ver -t ps work.TEST_TB work.glbl

do wave.do

run -all
