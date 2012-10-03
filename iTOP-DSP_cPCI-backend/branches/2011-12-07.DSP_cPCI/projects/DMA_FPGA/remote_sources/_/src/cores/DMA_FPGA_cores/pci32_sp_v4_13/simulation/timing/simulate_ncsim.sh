#!/bin/sh

mkdir work

echo 'Compiling PCI Timing Model'
ncvlog -work work ../../implement/results/routed.v

echo 'Compiling Testbench'
ncvlog -work work -incdir ../ ../stimulus.v
ncvlog -work work ../busrec.v
ncvlog -work work ../test_tb.v
ncvlog -work work ../dumb_targ32.v
ncvlog -work work ../dumb_targ64.v

echo 'Compiling SDF file'
ncsdfc ../../implement/results/routed.sdf -output ./routed.sdf.X

echo 'Generating SDF command file'
echo 'COMPILED_SDF_FILE = "routed.sdf.X",' > sdf.cmd
echo 'SCOPE = TEST_TB.UUT,' >> sdf.cmd
echo 'MTM_CONTROL = "MINIMUM";' >> sdf.cmd

ncelab -relax -access +r -sdf_cmd_file sdf.cmd work.TEST_TB glbl

ncsim -gui work.TEST_TB -input @"simvision -input wave.sv"
