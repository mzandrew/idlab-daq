#!/bin/sh

# remove old files
rm -rf simv* csrc DVEfiles AN.DB

# compile all of the files
# Note that -sverilog is not strictly required- You can
#   remove the -sverilog if you change the type of the
#   localparam for the periods in the testbench file to 
#   [63:0] from time
vlogan -sverilog \
      ${XILINX}/verilog/src/glbl.v \
      ../../../Aurora_FPGA_clock.v \
      ../../example_design/Aurora_FPGA_clock_exdes.v \
      ../Aurora_FPGA_clock_tb.v

# prepare the simulation 
vcs +vcs+lic+wait -debug Aurora_FPGA_clock_tb glbl

# run the simulation
./simv -ucli -i ucli_commands.key

# launch the viewer
dve -vpd vcdplus.vpd -session vcs_session.tcl
