cd ./sim_ddr3
if ![file exists "./sim.mpf"] {
    project new "." sim
    project addfile "./../../tb/tb_controller.v"
    project addfile "./../../src/ddr3_controller.v"
    project addfile "./../../tb/prim_sim.v"
    project addfile "./../../tb/ddr3.v"
    project addfile "./../../tb/1024Mb_ddr3_parameters.vh"

if [file exists work] {
    vdel -lib work -all
}

if [file exists gw2a] {
vdel -lib gw2a -all
}

vlib work
vlib gw2a

vlog -sv -work gw2a -incr -stats=none \
   "./../../tb/prim_sim.v" \

vlog -sv -work work \
    "./../../tb/tb_controller.v" \
    "./../../src/ddr3_controller.v" \
    "./../../tb/ddr3.v" \
    "./../../tb/1024Mb_ddr3_parameters.vh" \

} else {
    project open "./sim"
    project compileoutofdate
}

vsim -voptargs="\+acc" -t 1ps -gui -L gw2a work.tb
#do "./../../simulation/sim_ddr3/wave.do"

view wave
add wave -r /*
wave zoomfull
update

run 200 ms

