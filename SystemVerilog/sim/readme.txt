To send a command to DSim Cloud, use
> mdc <DSim command> -a '[options]'
See this article for details:
https://support.metrics.ca/hc/en-us/articles/10166809979789-User-Guide-DSim-Cloud-CLI-Tool-simulator-commands

Design is using UNISIMS library from Xilinx.
Need to set up the precompiled libraries first:
https://support.metrics.ca/hc/en-us/articles/9645819351949-How-To-Set-up-Xilinx-Vivado-Precompiled-Libraries-in-DSim-Cloud

DSim supports different ways to compile and run a simulation.
Please refer to the DSim User Manual for more information:
https://support.metrics.ca/hc/en-us/articles/360061975232-User-Guide-DSim-User-Manual

Compile and Run Simulation
Note: '-L unisims_ver' is needed at elaboration time, it will instruct DSim to look for the component in the library called unisims_ver.
unisims_ver is one of the precompiled libraries from Vivado.
Depending on your previous experience and preference, you can choose one of the following methods to achieve the same purpose.

1. 1-step Method: Analyze, Elaborate, and Run in one step.
> mdc dsim -a '-F filelist.txt -L unisims_ver +acc+b -waves waves.vcd'

2. 2-step Method: Analyze and Elaborate in one step, Run in a second step. These are perfect for "compile-once, run many" simulations with random seed flows.
> mdc dsim -a '-genimage myimage -F filelist.txt -L unisims_ver +acc+b'
> mdc dsim -a '-image myimage -waves waves.vcd'

3. 3-step Method: Analyze, Elaborate and Run in 3 separate steps. These are best suited for VHDL and mixed language flows.
> mdc dvlcom -a '-F filelist.txt'
> mdc dsim -a '-genimage myimage -top work.carry_lookahead_adder_tb -L unisims_ver +acc+b'
> mdc dsim -a '-image myimage -waves waves.vcd'

Conclusion:
1. To send a command to DSim Cloud, use:
> mdc <DSim command> -a '[options]'

2. There are different ways to compile and run a simulation using DSim. Please refer to the User Manual.

3. In Verilog/SystemVerilog, you need to specify the required library through the '-L <lib>' switch.
