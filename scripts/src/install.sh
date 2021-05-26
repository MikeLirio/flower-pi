#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 1.0                                                                               #
#                                                                                             #
#   Script to run to deploy all the scripts on Raspberry configuring:                         #
#       - Copying bash files from the Github repository to Raspberry Pi.                      #
#                                                                                             #
###############################################################################################
## ENVIRONMENT VARIABLE #######################################################################
###############################################################################################

: "${BASE_PATH_SCRIPTS:= "$(pwd)"}"

if [[ -z "${UTILS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/utils/utils.sh        # Variables with the colors for the terminal.
    : "${UTILS_SH_IMPORTED:? The variable needs to be defined}" 
fi

if [[ -z "${COLORS_SH_IMPORTED}" ]]; then
    . $BASE_PATH_SCRIPTS/utils/colors.sh        # Variables with the colors for the terminal.
    : "${COLORS_SH_IMPORTED:? The variable needs to be defined}" 
fi

export INSTALL_VERSION=1.0

install_log="${GRE}#::${YEL}./install.sh${GRE}::#${NC}"

###############################################################################################

function initial_setup() {
    read_configuration
    move_delirio_system_files
    while true; do 
        read -p "$(echo -e $install_log${YEL} Do you want to configure the Nespi4Case? Y/N)" option
        case $option in
            Y | y ) case_setup; break;;
            N | n ) break;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function case_setup() {
    while true; do
        echo -e "$install_log${YEL} Which action would you like to perform about ${BYEL}Nespi4Case${YEL} ?${NC}"
        echo -e "$install_log${BLU}    [${RED}0${BLU}] Install/Update on Raspberry Pi.${NC}"
        echo -e "$install_log${BLU}    [${RED}1${BLU}] Install Reset button daemon.${NC}"
        echo -e "$install_log${BLU}    [${RED}2${BLU}] Install Shutdown button daemon.${NC}"
        echo -e "$install_log${BLU}    [${RED}3${BLU}] Install the safe-close scripts.${NC}"
        echo -e "$install_log${BLU}    [${RED}4${BLU}] Install/Update all.${NC}"
        echo -e "$install_log${BLU}    [${RED}5${BLU}] Exit.${NC}"

        read -p "$(echo -e $install_log${YEL} Write the number of the option: ${NC})" option
        case $option in 
            0 ) move_nespi4case_system_files;;
            1 ) bash $BASE_PATH_SCRIPTS/case/setup.sh -r;;
            2 ) bash $BASE_PATH_SCRIPTS/case/setup.sh -s;;
            3 ) bash $BASE_PATH_SCRIPTS/case/setup.sh -c;;
            4 ) 
                move_nespi4case_system_files
                bash $BASE_PATH_SCRIPTS/case/setup.sh
                ;;
            5 ) break;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

function docker_setup() {
    echo -e "$install_log${YEL} docker_setup${NC}"
}

function unistall() {
    while true; do
        echo -e "$install_log${YEL} Which software do you want to remove?${NC}"
        echo -e "$install_log${BLU}    [${RED}0${BLU}] Initial Setup.${NC}"
        echo -e "$install_log${BLU}    [${RED}1${BLU}] .bash_profile from users.${NC}"
        echo -e "$install_log${BLU}    [${RED}2${BLU}] Nespi4Case software.${NC}"
        echo -e "$install_log${BLU}    [${RED}3${BLU}] Docker.${NC}"
        echo -e "$install_log${BLU}    [${RED}4${BLU}] All.${NC}"
        echo -e "$install_log${BLU}    [${RED}5${BLU}] Exit.${NC}"

        read -p "$(echo -e $install_log${YEL} Write the number of the option: ${NC})" option
        case $option in 
            0 )  
                unistall_initial_setup
                ;;
            1 )  
                uninstall_bash_profiles
                ;;
            2 )  
                bash $BASE_PATH_SCRIPTS/case/setup.sh -u
                remove_nespi4case_system_files
                ;;
            3 )  
                echo "Docker WIP"
                ;;
            4 ) 
                # .bash_profile
                uninstall_bash_profiles
                # docker
                echo "Docker WIP"
                # Case
                bash $BASE_PATH_SCRIPTS/case/setup.sh -u
                remove_nespi4case_system_files
                # Initial Setup
                unistall_initial_setup
                ;;
            5 ) break;;
            * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
        esac
    done
}

echo -e "${GRE} ######################################################################################################${NC}"
echo -e "${install_log}${RED} /\  __-.  /\  ___\   /\ \       /\ \   /\  == \   /\ \   /\  __ \      /\  == \ /\ \   "
echo -e "${install_log}${RED} \ \ \/\ \ \ \  __\   \ \ \____  \ \ \  \ \  __<   \ \ \  \ \ \/\ \     \ \  _-/ \ \ \  "
echo -e "${install_log}${RED}  \ \____-  \ \_____\  \ \_____\  \ \_\  \ \_\ \_\  \ \_\  \ \_____\     \ \_\    \ \_\ "
echo -e "${install_log}${RED}   \/____/   \/_____/   \/_____/   \/_/   \/_/ /_/   \/_/   \/_____/      \/_/     \/_/ "
echo -e "${GRE} ######################################################################################################${NC}"
echo -e "$install_log${YEL} Setting the ${BYEL}Delirio Pi${YEL} configuration. Thanks for downloading!${NC}"
echo -e "$install_log${NC}"
echo -e "$install_log${YEL} Bear in mind that if it is the first time you are executing this script,${NC}"
echo -e "$install_log${YEL} please, to avoid issues select the option <${RED}[0] Initial setup.${YEL}> first.${NC}"
while true; do
    echo -e "${GRE} ######################################################################################################${NC}"
    echo -e "$install_log${YEL} What to you want to setup? ${NC}"
    echo -e "$install_log${BLU}    [${RED}0${BLU}] Initial setup.${NC}"
    echo -e "$install_log${BLU}    [${RED}1${BLU}] Nespi4Case setup.${NC}"
    echo -e "$install_log${BLU}    [${RED}2${BLU}] Docker.${NC}"
    echo -e "$install_log${BLU}    [${RED}3${BLU}] Install/Update .bash_profile files.${NC}"
    echo -e "$install_log${BLU}    [${RED}4${BLU}] Uninstall.${NC}"
    echo -e "$install_log${BLU}    [${RED}5${BLU}] Exit.${NC}"

    read -p "$(echo -e $install_log${YEL} Write the number of the option: ${NC})" option
    case $option in 
        0 ) initial_setup;;
        1 ) case_setup;;
        2 ) docker_setup;;
        3 ) install_bash_profiles;;
        4 ) unistall;;
        5 ) break;;
        * ) echo -e "$install_log${RED} No valid option. Try again...${NC}";;
    esac
    echo -e "${GRE} ######################################################################################################${NC}"
done
echo -e "$install_log${YEL} Thanks for using ${BYEL}Delirio Pi${YEL} scripts.${NC}"
echo -e "${GRE} ######################################################################################################${NC}"