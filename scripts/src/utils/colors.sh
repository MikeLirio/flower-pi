#!/bin/bash

###############################################################################################
# DESCRIPTION #################################################################################
###############################################################################################
#                                                                                             #
#   Version 0.1                                                                               #
#                                                                                             #
#   This script only contains the values of the colors for the scripts.                       #
#                                                                                             #
###############################################################################################
# IMPORTED SCRIPTS ############################################################################
###############################################################################################

export COLORS_SH_IMPORTED=true

# Text Reset
NC='\e[0m'

# Regular           Bold                Underline           High Intensity  
BLA='\e[0;30m';     BBLA='\e[1;30m';    UBLA='\e[4;30m';    IBLA='\e[0;90m';
RED='\e[0;31m';     BRED='\e[1;31m';    URED='\e[4;31m';    IRED='\e[0;91m';
GRE='\e[0;32m';     BGRE='\e[1;32m';    UGRE='\e[4;32m';    IGRE='\e[0;92m';
YEL='\e[0;33m';     BYEL='\e[1;33m';    UYEL='\e[4;33m';    IYEL='\e[0;93m';
BLU='\e[0;34m';     BBLU='\e[1;34m';    UBLU='\e[4;34m';    IBLU='\e[0;94m';
PUR='\e[0;35m';     BPUR='\e[1;35m';    UPUR='\e[4;35m';    IPUR='\e[0;95m';
CYA='\e[0;36m';     BCYA='\e[1;36m';    UCYA='\e[4;36m';    ICYA='\e[0;96m';
WHI='\e[0;37m';     BWHI='\e[1;37m';    UWHI='\e[4;37m';    IWHI='\e[0;97m';

#BoldHigh Intens     Background          High Intensity Backgrounds
BIBLA='\e[1;90m';   ON_BLA='\e[40m';    ON_IBLA='\e[0;100m';
BIRED='\e[1;91m';   ON_RED='\e[41m';    ON_IRED='\e[0;101m';
BIGRE='\e[1;92m';   ON_GRE='\e[42m';    ON_IGRE='\e[0;102m';
BIYEL='\e[1;93m';   ON_YEL='\e[43m';    ON_IYEL='\e[0;103m';
BIBLU='\e[1;94m';   ON_BLU='\e[44m';    ON_IBLU='\e[0;104m';
BIPUR='\e[1;95m';   ON_PUR='\e[45m';    ON_IPUR='\e[0;105m';
BICYA='\e[1;96m';   ON_CYA='\e[46m';    ON_ICYA='\e[0;106m';
BIWHI='\e[1;97m';   ON_WHI='\e[47m';    ON_IWHI='\e[0;107m';

# echo -e "${GRE}#::colors.sh::#${RED} Regular    ${BRED}Bold    ${URED}Underline   ${IRED}High Intensity ${NC}"
# echo -e "${GRE}#::colors.sh::#${BIRED}BoldHigh Intens    ${ON_RED}Background  ${ON_IRED}High Intensity Backgrounds ${NC}"