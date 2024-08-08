transcript on

#
# New libraries
#

if [file exists work] {
    vdel -lib work -all
}

if [file exists gw2a] {
vdel -lib gw2a -all
}

vlib work
vlib gw2a

vmap work work

vlog -sv -work gw2a "./../tb/prim_sim.v"

vlog -sv -incr -mfcu "+incdir+" "+define+den1024Mb+define+sg25+define+x16" -work work \
    "./../tb/tb_controller.v" \
    "./../src/ddr3_controller.v" \
    "./../tb/ddr3.v" \
    "./../tb/1024Mb_ddr3_parameters.vh"

vsim -voptargs="\+acc" -t 1ps -gui -L gw2a -L work work.tb
#do "./../../simulation/sim_ddr3/wave.do"

view wave
add wave -r /*
wave zoomfull
update

run 1 ms

