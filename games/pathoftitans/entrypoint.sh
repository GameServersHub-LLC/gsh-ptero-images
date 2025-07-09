#!/bin/bash
#System variables
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

# Switch to the container's working directory
cd /home/container

# Wait for the container to fully initialize
sleep 1

# Force the TZ environment variable to Eastern Standard Time
TZ=America/New_York
export TZ

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

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
echo -e "${WHITE}(_____)${BRIGHT_YELLOW}                               🎮  SERVER STARTING UP... 🎮                                  ${WHITE}(_____)${NC}"
echo -e "${GREEN} Timezone:${WHITE} $TZ ${GREEN} Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC}  
UE_TRUE_SCRIPT_NAME=$(echo \"$0\" | xargs readlink -f)
UE_PROJECT_ROOT=$(dirname "$UE_TRUE_SCRIPT_NAME")
chmod +x /home/container/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping
sleep 3

## check for serverupdates
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == "1" ]; then
    cd /home/container
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
    echo -e "${YELLOW}Checking for Server Updates. please wait...${NC}"
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
    sleep 1
    export DOTNET_BUNDLE_EXTRACT_BASE_DIR=./temp/
    ./AlderonGamesCmd --game path-of-titans --server true --beta-branch $BETA_BRANCH --install-dir ./ --username $AG_SERVER_EMAIL --password $AG_SERVER_PASS
    chmod +x /home/container/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping
 else
    echo -e "${BLUE}---------------------------------------------------------------${NC}"
    echo -e "${YELLOW}Not updating game server as auto update was set to 0. Starting Server${NC}"
    echo -e "${BLUE}---------------------------------------------------------------${NC}"
    sleep 3
fi

# RCON loop with command-line arguments for address and password
(while read cmd; do
    rcon -s -a "localhost:$RCON_PORT" -p "$RCON_PASSWORD" "$cmd"
done) < /dev/stdin &

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}