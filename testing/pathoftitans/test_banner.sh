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
echo -e "${MAGENTA}                         GGG${GREEN}::::::::::::${MAGENTA}G SS${GREEN}:::::::::::::::${MAGENTA}SH${GREEN}:::::::${MAGENTA}H     H${GREEN}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                       GG${GREEN}:::::::::::::::${MAGENTA}GS${GREEN}:::::${MAGENTA}SSSSSS${GREEN}::::::${MAGENTA}SH${GREEN}:::::::${MAGENTA}H     H${GREEN}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                      G${GREEN}:::::${MAGENTA}GGGGGGGG${GREEN}::::${MAGENTA}GS${GREEN}:::::${MAGENTA}S     SSSSSSSHH${GREEN}::::::${MAGENTA}H     H${GREEN}::::::${MAGENTA}HH ${NC}"
echo -e "${MAGENTA}                     G${GREEN}:::::${MAGENTA}G       GGGGGGS${GREEN}:::::${MAGENTA}S              H${GREEN}:::::${MAGENTA}H     H${GREEN}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${GREEN}:::::${MAGENTA}G              S${GREEN}:::::${MAGENTA}S              H${GREEN}:::::${MAGENTA}H     H${GREEN}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${GREEN}:::::${MAGENTA}G               S${GREEN}::::${MAGENTA}SSSS           H${GREEN}::::::${MAGENTA}HHHHH${GREEN}::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${GREEN}:::::${MAGENTA}G    GGGGGGGGGG  SS${GREEN}::::::${MAGENTA}SSSSS      H${GREEN}:::::::::::::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${GREEN}:::::${MAGENTA}G    G${GREEN}::::::::${MAGENTA}G    SSS${GREEN}::::::::${MAGENTA}SS    H${GREEN}:::::::::::::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${GREEN}:::::${MAGENTA}G    GGGGG${GREEN}::::${MAGENTA}G       SSSSSS${GREEN}::::${MAGENTA}S   H${GREEN}::::::${MAGENTA}HHHHH${GREEN}::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                    G${GREEN}:::::${MAGENTA}G        G${GREEN}::::${MAGENTA}G            S${GREEN}:::::${MAGENTA}S  H${GREEN}:::::${MAGENTA}H     H${GREEN}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                     G${GREEN}:::::${MAGENTA}G       G${GREEN}::::${MAGENTA}G            S${GREEN}:::::${MAGENTA}S  H${GREEN}:::::${MAGENTA}H     H${GREEN}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                      G${GREEN}:::::${MAGENTA}GGGGGGGG${GREEN}::::${MAGENTA}GSSSSSSS     S${GREEN}:::::${MAGENTA}SHH${GREEN}::::::${MAGENTA}H     H${GREEN}::::::${MAGENTA}HH ${NC}"
echo -e "${MAGENTA}                       GG${GREEN}:::::::::::::::${MAGENTA}GS${GREEN}::::::${MAGENTA}SSSSSS${GREEN}:::::${MAGENTA}SH${GREEN}:::::::${MAGENTA}H     H${GREEN}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                         GGG${GREEN}::::::${MAGENTA}GGG${GREEN}:::${MAGENTA}GS${GREEN}:::::::::::::::${MAGENTA}SS H${GREEN}:::::::${MAGENTA}H     H${GREEN}:::::::${MAGENTA}H ${NC}"
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
echo -e "${WHITE}(_____)${BRIGHT_YELLOW}                               🎮 SERVER STARTING UP... 🎮                                  ${WHITE}(_____)${NC}"
echo -e "${GREEN} Timezone:${WHITE} $TZ ${GREEN} Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC} 