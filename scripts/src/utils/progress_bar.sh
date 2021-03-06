#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 1.0                                                                               #
#                                                                                             #
#   Progress bar used by any process.                                                         #
#                                                                                             #
#   Contains 3 methods:                                                                       #
#       progress_bar_start  -  Initialize and start the bar with a progress of Zero.          #
#       progress_bar $var   -  Add the number give it as a parameter to the bar.              #
#       progress_bar_end    -  Complete the bar with a value of 100.                          #
#       progress_bar_demo   -  Demo of a progress bar with 30 60 and 100 values.              #
#                                                                                             #
###############################################################################################
# REQUIRED SCRIPTS ############################################################################
###############################################################################################

: "${BASE_PATH_SCRIPTS:? The variable needs to be defined}"

if [[ -z "${COLORS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/colors.sh        # Variables with the colors for the terminal.
fi

###############################################################################################
# VARIABLES ###################################################################################
###############################################################################################

export PROGRESS_BAR_SH_IMPORTED=true

PB_PROGRESS=0   # Can have the values 0 to 100.
PB_BAR=""       # Variable with the characters of the bar.

###############################################################################################
# FUNCTIONS ###################################################################################
###############################################################################################

function progress_bar () {
    if [ $# -gt 1 ]; then # If parameters no equal 1
		echo -e "${GRE}#::progress_bar.sh::#${RED} Incorrect number of parameters passed.${NC}"
	else
        for i in `seq 1 $1`
        do
            PB_PROGRESS=$(($PB_PROGRESS + 1))
            PB_BAR="$PB_BAR#"
            if [ $PB_PROGRESS -gt 100 ]
            then
                break
            fi
            sleep .01
            echo -ne "${CYA}|${GRE} ${PB_BAR} ${CYA}|${BLU} ${PB_PROGRESS}% ${CYA}|${NC}\r"
        done
	fi
}

function progress_bar_end () {
    progress_bar $((100 - $PB_PROGRESS))
}

function progress_bar_start () {
    PB_PROGRESS=0
    PB_BAR=""
    echo -ne "${CYA}|${GRE} ${PB_BAR} ${CYA}|${BLU} ${PB_PROGRESS}% ${CYA}|${NC}\r"
}

function progress_bar_demo() {
    progress_bar_start
    sleep 1
    progress_bar 30
    sleep 1
    progress_bar 30
    sleep 1
    progress_bar 50
    sleep 1
    progress_bar_end
}

# For debug purposes.
# progress_bar_demo