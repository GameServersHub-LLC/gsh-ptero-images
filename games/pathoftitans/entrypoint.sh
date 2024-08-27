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

# Switch to the container's working directory
cd /home/container || exit 1

# Wait for the container to fully initialize
sleep 1

# Force the TZ environment variable to Eastern Standard Time
TZ=America/New_York
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# system informations

echo -e "${GREEN}---------------------------------------------------------------------${NC}"
echo -e "${MAGENTA}   .oooooo.     .oooooo..o ooooo   ooooo${NC}" 
echo -e "${MAGENTA}  d8P'  `Y8b   d8P'    `Y8 `888'   `888'${NC}" 
echo -e "${MAGENTA} 888           Y88bo.       888     888 ${NC}" 
echo -e "${MAGENTA} 888            `"Y8888o.   888ooooo888 ${NC}" 
echo -e "${MAGENTA} 888     ooooo      `"Y88b  888     888 ${NC}" 
echo -e "${MAGENTA} `88.    .88'  oo     .d8P  888     888 ${NC}" 
echo -e "${MAGENTA}  `Y8bood8P'   8""88888P'  o888o   o888o${NC}" 
echo -e "${MAGENTA}Path of Titans Image by GSH${NC}"
echo -e "${GREEN}---------------------------------------------------------------------${NC}"
echo -e "${CYAN}Running on Ubuntu ${RED} $(cat /etc/debian_version)${NC}"
echo -e "${GREEN}Current timezone: ${RED} $(date +"%Z %z")${NC}"
echo -e "${GREEN}---------------------------------------------------------------------${NC}"
sleep 2
chmod +x /home/container/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping

## check for serverupdates
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == "1" ]; then
    cd /home/container
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
    echo -e "${YELLOW}checkig for Server update. please wait...${NC}"
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
    export DOTNET_BUNDLE_EXTRACT_BASE_DIR=./temp/
    ./AlderonGamesCmd --game path-of-titans --server true --beta-branch $BETA_BRANCH --install-dir ./ --username $AG_SERVER_EMAIL --password $AG_SERVER_PASS
    chmod +x /home/container/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping
 else
    echo -e "${BLUE}---------------------------------------------------------------${NC}"
    echo -e "${YELLOW}Not updating game server as auto update was set to 0. Starting Server${NC}"
    echo -e "${BLUE}---------------------------------------------------------------${NC}"
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
