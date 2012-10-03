#
# PCI MTI Verilog run script
#
vlib work
vmap work

# Compiling the timing model
vlog -work work ../../implement/results/routed.v

# Compiling the demonstration testbench
vlog -work work +incdir+../ ../stimulus.v
vlog -work work ../busrec.v
vlog -work work ../test_tb.v
vlog -work work ../dumb_targ32.v
vlog -work work ../dumb_targ64.v

file copy -force ../../implement/results/routed.sdf .

vsim -voptargs="+acc" -L simprims_ver -novopt -sdftyp /TEST_TB/UUT/=routed.sdf +notimingchecks -t ps work.TEST_TB work.glbl

do wave.do

run -all
