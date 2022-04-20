#!/bin/bash
# Design is using unisim (unisims_ver) library from Xilinx Vivado
# Need to map the precompiled library
#dlib -work dsim_work map -lib unisims_ver $VIVADO_HOME/dsim_precompiled/verilog
# OR,
# Recommended: Use the helper script to setup

#dsim_precompiled_library_setup [-h] [-p {none,quartus,vivado}]
#                               [--work WORK_DIR] [--ieee {1993,2008}]
#                               [--dryrun]
dsim_precompiled_library_setup --package vivado --ieee 1993

# Compile and run simulation
dsim -F filelist.txt -L unisims_ver +acc+b -waves waves.vcd

