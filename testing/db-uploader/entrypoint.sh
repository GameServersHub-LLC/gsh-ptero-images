#!/bin/bash

clear
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m'


# Wait for the container to fully initialize
sleep 1

# Force the TZ environment variable to Eastern Standard Time
TZ=America/New_York
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# system informations                                                           
echo -e "${YELLOW} Made By                                                          ${NC}"
echo -e "${MAGENTA}         GGGGGGGGGGGGG   SSSSSSSSSSSSSSS HHHHHHHHH     HHHHHHHHH ${NC}"
echo -e "${MAGENTA}      GGG::::::::::::G SS:::::::::::::::SH:::::::H     H:::::::H ${NC}"
echo -e "${MAGENTA}    GG:::::::::::::::GS:::::SSSSSS::::::SH:::::::H     H:::::::H ${NC}"
echo -e "${MAGENTA}   G:::::GGGGGGGG::::GS:::::S     SSSSSSSHH::::::H     H::::::HH ${NC}"
echo -e "${MAGENTA}  G:::::G       GGGGGGS:::::S              H:::::H     H:::::H   ${NC}"
echo -e "${MAGENTA} G:::::G              S:::::S              H:::::H     H:::::H   ${NC}"
echo -e "${MAGENTA} G:::::G               S::::SSSS           H::::::HHHHH::::::H   ${NC}"
echo -e "${MAGENTA} G:::::G    GGGGGGGGGG  SS::::::SSSSS      H:::::::::::::::::H   ${NC}"
echo -e "${MAGENTA} G:::::G    G::::::::G    SSS::::::::SS    H:::::::::::::::::H   ${NC}"
echo -e "${MAGENTA} G:::::G    GGGGG::::G       SSSSSS::::S   H::::::HHHHH::::::H   ${NC}"
echo -e "${MAGENTA} G:::::G        G::::G            S:::::S  H:::::H     H:::::H   ${NC}"
echo -e "${MAGENTA}  G:::::G       G::::G            S:::::S  H:::::H     H:::::H   ${NC}"
echo -e "${MAGENTA}   G:::::GGGGGGGG::::GSSSSSSS     S:::::SHH::::::H     H::::::HH ${NC}"
echo -e "${MAGENTA}    GG:::::::::::::::GS::::::SSSSSS:::::SH:::::::H     H:::::::H ${NC}"
echo -e "${MAGENTA}      GGG::::::GGG:::GS:::::::::::::::SS H:::::::H     H:::::::H ${NC}"
echo -e "${MAGENTA}         GGGGGG   GGGG SSSSSSSSSSSSSSS   HHHHHHHHH     HHHHHHHHH ${NC}"
echo -e "${YELLOW} If you need support please join our discord at: discord.gg/gsh   ${NC}"
echo -e "${WHITE} _____                                                                                      _____ ${NC}"
echo -e "${WHITE}( ___ )                                                                                    ( ___ )${NC}"
echo -e "${WHITE} |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} .▄▄ ·  ▄▄▄· ▄▄▄▄▄▪  .▄▄ · ·▄▄▄ ▄▄▄·  ▄▄· ▄▄▄▄▄      ▄▄▄   ▄· ▄▌    ▄▄▄ . ▄▄ •  ▄▄ •  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} ▐█ ▀. ▐█ ▀█ •██  ██ ▐█ ▀. ▐▄▄·▐█ ▀█ ▐█ ▌▪•██  ▪     ▀▄ █·▐█▪██▌    ▀▄.▀·▐█ ▀ ▪▐█ ▀ ▪ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} ▄▀▀▀█▄▄█▀▀█  ▐█.▪▐█·▄▀▀▀█▄██▪ ▄█▀▀█ ██ ▄▄ ▐█.▪ ▄█▀▄ ▐▀▀▄ ▐█▌▐█▪    ▐▀▀▪▄▄█ ▀█▄▄█ ▀█▄ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} ▐█▄▪▐█▐█ ▪▐▌ ▐█▌·▐█▌▐█▄▪▐███▌.▐█ ▪▐▌▐███▌ ▐█▌·▐█▌.▐▌▐█•█▌ ▐█▀·.    ▐█▄▄▌▐█▄▪▐█▐█▄▪▐█ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW}  ▀▀▀▀  ▀  ▀  ▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀▀  ▀  ▀ ·▀▀▀  ▀▀▀  ▀█▄▀▪.▀  ▀  ▀ •      ▀▀▀ ·▀▀▀▀ ·▀▀▀▀  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} by that411guy ${WHITE}                                                                       ${WHITE}|   | ${NC}"
echo -e "${WHITE} |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ${NC}"
echo -e "${WHITE}(_____)                                                                                    (_____)${NC}"
echo -e "${GREEN} Current timezone:${WHITE} $TZ ${GREEN} Current Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC}
sleep 3
# Switch to the container's working directory
cd /home/container || exit 1

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}