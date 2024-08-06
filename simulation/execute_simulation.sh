#!/bin/bash

if [ ! -d sim_ddr3 ]
then
 mkdir sim_ddr3
fi

if [ $# -eq 0 ] || ([ $# -eq 1 ] && [ "$1" != "-n" ])
then
    # No arguments or only a different argument has been passed to the script.
    echo "(re)build project"
    if [ -d sim_ddr3/work ]
    then
        rm -Rf sim_ddr3/work
    fi

    if [ -f sim_ddr3/sim.mpf ]
    then
        rm -Rf sim_ddr3/sim.mpf
    fi
else
    # The "-n" argument has been passed to the script.
    echo "use existing project"
fi

vsim -do sim_ddr3.do
