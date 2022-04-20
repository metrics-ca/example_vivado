#!/bin/bash
# The VHDL Design is using unisim library from Xilinx Vivado
# Need to map the precompiled library
#dlib -work dsim_work map -lib unisims_ver $VIVADO_HOME/dsim_precompiled/vhdl93
# OR,
# Recommended: Use the helper script to setup

#dsim_precompiled_library_setup [-h] [-p {none,quartus,vivado}]
#                               [--work WORK_DIR] [--ieee {1993,2008}]
#                               [--dryrun]
dsim_precompiled_library_setup --package vivado --ieee 1993

# Analyze VHDL and Verilog files
dvhcom -F filelist_VHDL.txt
dvlcom -F filelist_SV.txt

### Elaborate and Run in 1 step
dsim -top work.carry_lookahead_adder_tb -timescale 1ns/1ps +acc+b -waves waves.vcd

#Or, Splitting the elaboration and run in 2 steps:
#dsim -genimage image -top work.carry_lookahead_adder_tb -timescale 1ns/1ps +acc+b 
#dsim -image image -waves waves.vcd