# run_mdc.ps1
# PowerShell script to simulate design with Metrics DSim Cloud

# Analyze, Elaborate, and Run in one step.
mdc dsim -a '-F filelist.txt -L unisims_ver +acc+b -waves waves.vcd'
