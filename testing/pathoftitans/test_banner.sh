#!/bin/bash
# Test script for Path of Titans banner display
clear
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m'
BOLD='\033[1m'
BLINK='\033[5m'
BRIGHT_GREEN='\033[1;32m'
BRIGHT_YELLOW='\033[1;33m'
BRIGHT_CYAN='\033[1;36m'

# Force the TZ environment variable to Eastern Standard Time
TZ=America/New_York
export TZ

# system informations                                                           
echo -e "${YELLOW}             Made By        ${MAGENTA}GGGGGGGGGGGGG   SSSSSSSSSSSSSSS HHHHHHHHH     HHHHHHHHH ${NC}"
echo -e "${MAGENTA}                         GGG${WHITE}::::::::::::${MAGENTA}G SS${WHITE}:::::::::::::::${MAGENTA}SH${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                       GG${WHITE}:::::::::::::::${MAGENTA}GS${WHITE}:::::${MAGENTA}SSSSSS${WHITE}::::::${MAGENTA}SH${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                      G${WHITE}:::::${MAGENTA}GGGGGGGG${WHITE}::::${MAGENTA}GS${WHITE}:::::${MAGENTA}S     SSSSSSSHH${WHITE}::::::${MAGENTA}H     H${WHITE}::::::${MAGENTA}HH ${NC}"
echo -e "${MAGENTA}                     G${WHITE}:::::${MAGENTA}G       GGGGGGS${WHITE}:::::${MAGENTA}S              H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${WHITE}:::::${MAGENTA}G              S${WHITE}:::::${MAGENTA}S              H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${WHITE}:::::${MAGENTA}G               S${WHITE}::::${MAGENTA}SSSS           H${WHITE}::::::${MAGENTA}HHHHH${WHITE}::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${WHITE}:::::${MAGENTA}G    GGGGGGGGGG  SS${WHITE}::::::${MAGENTA}SSSSS      H${WHITE}:::::::::::::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${WHITE}:::::${MAGENTA}G    G${WHITE}::::::::${MAGENTA}G    SSS${WHITE}::::::::${MAGENTA}SS    H${WHITE}:::::::::::::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${WHITE}:::::${MAGENTA}G    GGGGG${WHITE}::::${MAGENTA}G       SSSSSS${WHITE}::::${MAGENTA}S   H${WHITE}::::::${MAGENTA}HHHHH${WHITE}::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${WHITE}:::::${MAGENTA}G        G${WHITE}::::${MAGENTA}G            S${WHITE}:::::${MAGENTA}S  H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                     G${WHITE}:::::${MAGENTA}G       G${WHITE}::::${MAGENTA}G            S${WHITE}:::::${MAGENTA}S  H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                      G${WHITE}:::::${MAGENTA}GGGGGGGG${WHITE}::::${MAGENTA}GSSSSSSS     S${WHITE}:::::${MAGENTA}SHH${WHITE}::::::${MAGENTA}H     H${WHITE}::::::${MAGENTA}HH ${NC}"
echo -e "${MAGENTA}                       GG${WHITE}:::::::::::::::${MAGENTA}GS${WHITE}::::::${MAGENTA}SSSSSS${WHITE}:::::${MAGENTA}SH${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                         GGG${WHITE}::::::${MAGENTA}GGG${WHITE}:::${MAGENTA}GS${WHITE}:::::::::::::::${MAGENTA}SS H${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                            GGGGGG   GGGG SSSSSSSSSSSSSSS   HHHHHHHHH     HHHHHHHHH ${NC}"
echo -e "${WHITE} _____                                                                                             _____ ${NC}"
echo -e "${WHITE}( ___ )${YELLOW} For need support, join our discord at: ${BLUE}discord.gg/gsh                                 ${WHITE}    ( ___ )${NC}"
echo -e "${WHITE} |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ${NC}"
echo -e "${WHITE} |   |${RED}  ▄▄▄· ▄▄▄· ▄▄▄▄▄ ▄ .▄          ·▄▄▄    ▄▄▄▄▄▪  ▄▄▄▄▄ ▄▄▄·  ▐ ▄ .▄▄ ·     ▄▄▄ . ▄▄ •  ▄▄ •   ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED} ▐█ ▄█▐█ ▀█ •██  ██▪▐█    ▪     ▐▄▄·    •██  ██ •██  ▐█ ▀█ •█▌▐█▐█ ▀.     ▀▄.▀·▐█ ▀ ▪▐█ ▀ ▪  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED}  ██▀·▄█▀▀█  ▐█.▪██▀▐█     ▄█▀▄ ██▪      ▐█.▪▐█· ▐█.▪▄█▀▀█ ▐█▐▐▌▄▀▀▀█▄    ▐▀▀▪▄▄█ ▀█▄▄█ ▀█▄  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED} ▐█▪·•▐█ ▪▐▌ ▐█▌·██▌▐▀    ▐█▌.▐▌██▌.     ▐█▌·▐█▌ ▐█▌·▐█ ▪▐▌██▐█▌▐█▄▪▐█    ▐█▄▄▌▐█▄▪▐█▐█▄▪▐█  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED} .▀    ▀  ▀  ▀▀▀ ▀▀▀ ·     ▀█▄▀▪▀▀▀      ▀▀▀ ▀▀▀ ▀▀▀  ▀  ▀ ▀▀ █▪ ▀▀▀▀      ▀▀▀ ·▀▀▀▀ ·▀▀▀▀   ${WHITE}|   | ${NC}"
echo -e "${WHITE} |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ${NC}"
echo -e "${WHITE}(_____)${BRIGHT_YELLOW}                               🎮  SERVER STARTING UP... 🎮                                ${WHITE}(_____)${NC}"
echo -e "${GREEN} Timezone:${WHITE} $TZ ${GREEN} Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC} 