//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.10 (64-bit) 
//Created Time: 2024-07-21 23:30:47
//create_clock -name clk -period 12.698 -waveform {0 5} [get_nets {clk}]
//create_clock -name clk_x4 -period 3.175 -waveform {0 1.25} [get_nets {clk_x4}]

// P&R does not work if time is corrected !!!
create_clock -name clk -period 10 -waveform {0 5} [get_nets {clk}]
create_clock -name clk_x4 -period 2.5 -waveform {0 1.25} [get_nets {clk_x4}]
set_clock_groups -asynchronous -group [get_clocks {clk_x4}] -group [get_clocks {clk}]
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
