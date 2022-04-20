#!/bin/bash
# The VHDL Design is using unisim library from Xilinx
# Need to map the precompiled library
#dlib -work dsim_work map -lib lpm_ver $QUARTUS_HOME/dsim_precompiled/vhdl93
# OR,
# Recommended: Use the helper script to setup

#dsim_precompiled_library_setup [-h] [-p {none,quartus,vivado}]
#                               [--work WORK_DIR] [--ieee {1993,2008}]
#                               [--dryrun]
dsim_precompiled_library_setup --package vivado --ieee 1993

### Start Compiling Design
# Analyze VHDL files
dvhcom -F filelist_VHDL.txt

### Elaborate and Run in 1 step
dsim -top work.carry_lookahead_adder_tb -timescale 1ns/1ps +acc+b -waves waves.vcd -run-until 60
# Note: In pure VHDL environment, you can use -run-until to control the amount of simulation time

#Or, separate the elaboration and run into 2 steps:
#dsim -genimage image -top work.carry_lookahead_adder_tb -timescale 1ns/1ps +acc+b
#dsim -image image -waves waves.vcd -run-until 60
