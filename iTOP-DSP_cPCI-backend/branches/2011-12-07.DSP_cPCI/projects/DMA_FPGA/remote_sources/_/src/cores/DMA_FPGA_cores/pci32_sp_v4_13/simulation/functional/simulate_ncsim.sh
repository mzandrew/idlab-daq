#!/bin/sh

mkdir work

echo 'Compiling PCI Core Simulation Model'
ncvlog -work work ../../../pci32_sp_v4_13.v

echo 'Compiling PCI Example Design'
ncvlog -work work ../../example_design/userapp.v
ncvlog -work work ../../example_design/pci_lc.v
ncvlog -work work ../../example_design/pci32_sp_v4_13_top.v

echo 'Compiling Testbench'
ncvlog -work work -incdir ../ ../stimulus.v
ncvlog -work work ../busrec.v
ncvlog -work work ../test_tb.v
ncvlog -work work ../dumb_targ32.v
ncvlog -work work ../dumb_targ64.v

ncelab -relax -access +r work.TEST_TB glbl

ncsim -gui work.TEST_TB -input @"simvision -input wave.sv"
