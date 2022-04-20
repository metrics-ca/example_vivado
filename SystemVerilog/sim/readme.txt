To send a command to Aurora Verification Cloud, use 
> aurora execute '<your command>'

DSim supports different ways to compile and run a simulation.
Depending on your previous experience and preference, you can choose one of the following steps to achieve the same purpose.
Please refer to DSim User Guide for more information

Setup Vivado Precompiled Library, for example:
> aurora execute 'dsim_precompiled_library_setup --package vivado --ieee 1993'
Generally,
#dsim_precompiled_library_setup [-h] [-p {none,quartus,vivado}]
#                               [--work WORK_DIR] [--ieee {1993,2008}]
#                               [--dryrun]

Compile and Run Simulation
1. Compile and Run Simulation in 1-step. 
> aurora execute 'dsim -F filelist.txt -L unisims_ver +acc+b -waves waves.vcd'
Note: `-L unisims_ver` is needed at the elaboration time, it will instruct DSim to look for the component in the library called unisims_ver.
unisims_ver is one of the precompiled-libraries from Vivado. 

2. Compile and Run in 2-steps. These are perfect for compile-once, run many simulation with random seed flow.
> aurora execute 'dsim -genimage myimage -F filelist.txt +acc+b'
> aurora execute 'dsim -image myimage -waves waves.vcd'

3. Analyze, Elaborate and Run in 3-steps. These are best suited for VHDL and mixed language flow.
> aurora execute 'dvlcom -F filelist.txt'
> aurora execute 'dsim -genimage myimage -top work.carry_lookahead_adder_tb +acc+b'
> aurora execute 'dsim -image myimage -waves waves.vcd'


Conclusion:
1. To send a command to Aurora Verification Cloud, use:
> aurora execute '<your command>'

2. There are different ways to compile and run a simulation using DSim. Please refer to the User Guide 

3. In Verilog/SystemVerilog, you need to specify the required library through -L <lib> switch.