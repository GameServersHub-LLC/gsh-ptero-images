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

# Force the TZ environment variable to UTC
TZ=UTC
export TZ

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# system informations                                                           
echo -e "${WHITE}                  ${YELLOW}Made By         ${MAGENTA}GGGGGGGGGGGGG   SSSSSSSSSSSSSSS HHHHHHHHH     HHHHHHHHH ${NC}"
echo -e "${MAGENTA}                               GGG${WHITE}::::::::::::${MAGENTA}G SS${WHITE}:::::::::::::::${MAGENTA}SH${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                             GG${WHITE}:::::::::::::::${MAGENTA}GS${WHITE}:::::${MAGENTA}SSSSSS${WHITE}::::::${MAGENTA}SH${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                            G${WHITE}:::::${MAGENTA}GGGGGGGG${WHITE}::::${MAGENTA}GS${WHITE}:::::${MAGENTA}S     SSSSSSSHH${WHITE}::::::${MAGENTA}H     H${WHITE}::::::${MAGENTA}HH ${NC}"
echo -e "${MAGENTA}                           G${WHITE}:::::${MAGENTA}G       GGGGGGS${WHITE}:::::${MAGENTA}S              H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                          G${WHITE}:::::${MAGENTA}G              S${WHITE}:::::${MAGENTA}S              H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                          G${WHITE}:::::${MAGENTA}G               S${WHITE}::::${MAGENTA}SSSS           H${WHITE}::::::${MAGENTA}HHHHH${WHITE}::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                          G${WHITE}:::::${MAGENTA}G    GGGGGGGGGG  SS${WHITE}::::::${MAGENTA}SSSSS      H${WHITE}:::::::::::::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                          G${WHITE}:::::${MAGENTA}G    G${WHITE}::::::::${MAGENTA}G    SSS${WHITE}::::::::${MAGENTA}SS    H${WHITE}:::::::::::::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                          G${WHITE}:::::${MAGENTA}G    GGGGG${WHITE}::::${MAGENTA}G       SSSSSS${WHITE}::::${MAGENTA}S   H${WHITE}::::::${MAGENTA}HHHHH${WHITE}::::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                          G${WHITE}:::::${MAGENTA}G        G${WHITE}::::${MAGENTA}G            S${WHITE}:::::${MAGENTA}S  H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                           G${WHITE}:::::${MAGENTA}G       G${WHITE}::::${MAGENTA}G            S${WHITE}:::::${MAGENTA}S  H${WHITE}:::::${MAGENTA}H     H${WHITE}:::::${MAGENTA}H   ${NC}"
echo -e "${MAGENTA}                            G${WHITE}:::::${MAGENTA}GGGGGGGG${WHITE}::::${MAGENTA}GSSSSSSS     S${WHITE}:::::${MAGENTA}SHH${WHITE}::::::${MAGENTA}H     H${WHITE}::::::${MAGENTA}HH ${NC}"
echo -e "${MAGENTA}                             GG${WHITE}:::::::::::::::${MAGENTA}GS${WHITE}::::::${MAGENTA}SSSSSS${WHITE}:::::${MAGENTA}SH${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                               GGG${WHITE}::::::${MAGENTA}GGG${WHITE}:::${MAGENTA}GS${WHITE}:::::::::::::::${MAGENTA}SS H${WHITE}:::::::${MAGENTA}H     H${WHITE}:::::::${MAGENTA}H ${NC}"
echo -e "${MAGENTA}                                  GGGGGG   GGGG SSSSSSSSSSSSSSS   HHHHHHHHH     HHHHHHHHH ${NC}"
echo -e "${WHITE} _______                                                                                                            _______      ${NC}"
echo -e "${WHITE}( _____ )  ${YELLOW}For need support, join our discord at: ${BLUE}discord.gg/gsh                                                   ${WHITE}( _____ )     ${NC}"
echo -e "${WHITE} |     |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|     |      ${NC}"
echo -e "${WHITE} |     |${YELLOW}   ███${YELLOW}███   ▄▄▄     ▄▄▄█████${RED}▓ ${YELLOW}██${RED}░ ${YELLOW}██${RED}     ▒${YELLOW}█████    █████${RED}▒ ${YELLOW}▄▄▄█████${RED}▓${YELLOW} ▄▄  █████${RED}▓${YELLOW}▄▄▄      ███▄    █  ██████  ${WHITE}  |     |      ${NC}"
echo -e "${WHITE} |     |${RED}   ▓${YELLOW}██${RED}░  ${YELLOW}██${RED}▒▒${YELLOW}████▄${RED}   ▓  ${YELLOW}██${RED}▒ ▓▒▓${YELLOW}██${RED}░ ${YELLOW}██${RED}▒   ▒${YELLOW}██${RED}▒  ${YELLOW}██${RED}▒▓${YELLOW}██${RED}   ▒  ▓  ${YELLOW}██${RED}▒ ▓▓${YELLOW}██${RED}▓  ${YELLOW}██${RED}▒ ▓▒${YELLOW}████▄${RED}    ${YELLOW}██ ▀█   █${RED}▒${YELLOW}██${RED}    ▒ ${WHITE}  |     |      ${NC}"
echo -e "${WHITE} |     |${RED}   ▓${YELLOW}██${RED}░ ${YELLOW}██${RED}▓▒▒${YELLOW}██  ▀█▄${RED} ▒ ▓${YELLOW}██${RED}░ ▒░▒${YELLOW}██▀▀██${RED}░   ▒${YELLOW}██${RED}░  ${YELLOW}██${RED}▒▒${YELLOW}████${RED} ░  ▒ ▓${YELLOW}██${RED}░ ▒▒${YELLOW}██${RED}▒ ▓${YELLOW}██${RED}░ ▒▒${YELLOW}██  ▀█▄${RED} ▓${YELLOW}██  ▀█ ██${RED}░ ▓${YELLOW}██▄   ${WHITE}  |     |      ${NC}"
echo -e "${WHITE} |     |   ${RED}▒${YELLOW}██▄█${RED}▓▒ ▒░${YELLOW}██▄▄▄▄██${RED}░ ▓${YELLOW}██${RED}▓ ░ ░▓${YELLOW}█${RED} ░${YELLOW}██${RED}    ▒${YELLOW}██${RED}   ${YELLOW}██${RED}░░▓${YELLOW}█${RED}▒  ░  ░ ▓${YELLOW}██${RED}▓ ░░${YELLOW}██${RED}░ ▓${YELLOW}██${RED}▓ ░░${YELLOW}██▄▄▄▄██${RED}▓${YELLOW}██${RED}▒  ${YELLOW}▐▌██${RED}▒ ▒   ${YELLOW}██${RED}▒${WHITE}  |     |      ${NC}"
echo -e "${WHITE} |     |   ${RED}▒${YELLOW}██${RED}▒ ░  ░ ▓${YELLOW}█${RED}   ▓${YELLOW}██${RED}▒ ▒${YELLOW}██${RED}▒ ░ ░▓${YELLOW}█${RED}▒░${YELLOW}██${RED}▓   ░ ${YELLOW}████${RED}▓▒░░▒${YELLOW}█${RED}░       ▒${YELLOW}██${RED}▒ ░░${YELLOW}██${RED}░ ▒${YELLOW}██${RED}▒ ░ ▓${YELLOW}█${RED}   ▓${YELLOW}██${RED}▒${YELLOW}██${RED}░   ▓${YELLOW}██${RED}▒${YELLOW}██████${RED}▒▒${WHITE}  |     |      ${NC}"
echo -e "${WHITE} |     |   ${RED}▒${YELLOW}█${RED}▒░ ░  ░ ▒▒   ▓▒${YELLOW}█${RED}░ ▒ ░░    ▒ ░░▒░▒   ░ ▒░▒░▒░  ▒ ░       ▒ ░░  ░▓   ▒ ░░   ▒▒   ▓▒${YELLOW}█${RED}░ ▒░   ▒ ▒▒ ▒▓▒ ▒ ░${WHITE}  |     |      ${NC}"
echo -e "${WHITE} |     |${RED}   ░▒ ░       ▒   ▒▒ ░   ░     ▒ ░▒░ ░     ░ ▒ ▒░  ░           ░    ▒ ░   ░     ▒   ▒▒ ░ ░░   ░ ▒░ ░▒  ░ ░${WHITE}  |     |      ${NC}"
echo -e "${WHITE} |_____|${WHITE}~~~${RED}░░${WHITE}~~~~~~~~~${RED}░${WHITE}~~~${RED}▒${WHITE}~~~~${RED}░${WHITE}~~~~~~~${RED}░${WHITE}~~${RED}░░${WHITE}~${RED}░${WHITE}~~~${RED}░${WHITE}~${RED}░${WHITE}~${RED}░${WHITE}~${RED}▒${WHITE}~~~~~${RED}░${WHITE}~~~~~~~${RED}░${WHITE}~~~~~~${RED}▒${WHITE}~${RED}░${WHITE}~${RED}░${WHITE}~~~~~~~${RED}░${WHITE}~~~${RED}▒${WHITE}~~~~~${RED}░${WHITE}~~~${RED}░${WHITE}~${RED}░░${WHITE}~~${RED}░${WHITE}~~${RED}░${WHITE}~~~~${WHITE}|_____|      ${NC}"
echo -e "${WHITE}(_______)${YELLOW}                                   🎮  SERVER STARTING UP... 🎮                         ${WHITE}                     (_______)     ${NC}"
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
    echo -e "${BLUE}-------------------------------------------------------------------------------------${NC}"
    echo -e "${YELLOW}Not updating game server as auto update was set to false. Starting Server${NC}"
    echo -e "${BLUE}-------------------------------------------------------------------------------------${NC}"
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