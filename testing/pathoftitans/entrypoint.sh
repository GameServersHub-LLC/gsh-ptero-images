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
echo -e "${WHITE} _____                                                                                           _____ ${NC}"
echo -e "${WHITE}( ___ )                                                                                         ( ___ )${NC}"
echo -e "${WHITE} |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ${NC}"
echo -e "${WHITE} |   |${RED} ▄▄▄· ▄▄▄· ▄▄▄▄▄ ▄ .▄          ·▄▄▄    ▄▄▄▄▄▪  ▄▄▄▄▄ ▄▄▄·  ▐ ▄ .▄▄ ·     ▄▄▄ . ▄▄ •  ▄▄ •  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED}▐█ ▄█▐█ ▀█ •██  ██▪▐█    ▪     ▐▄▄·    •██  ██ •██  ▐█ ▀█ •█▌▐█▐█ ▀.     ▀▄.▀·▐█ ▀ ▪▐█ ▀ ▪ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED} ██▀·▄█▀▀█  ▐█.▪██▀▐█     ▄█▀▄ ██▪      ▐█.▪▐█· ▐█.▪▄█▀▀█ ▐█▐▐▌▄▀▀▀█▄    ▐▀▀▪▄▄█ ▀█▄▄█ ▀█▄ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED}▐█▪·•▐█ ▪▐▌ ▐█▌·██▌▐▀    ▐█▌.▐▌██▌.     ▐█▌·▐█▌ ▐█▌·▐█ ▪▐▌██▐█▌▐█▄▪▐█    ▐█▄▄▌▐█▄▪▐█▐█▄▪▐█ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED}.▀    ▀  ▀  ▀▀▀ ▀▀▀ ·     ▀█▄▀▪▀▀▀      ▀▀▀ ▀▀▀ ▀▀▀  ▀  ▀ ▀▀ █▪ ▀▀▀▀      ▀▀▀ ·▀▀▀▀ ·▀▀▀▀  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} by that411guy ${WHITE}                                                                            ${WHITE}|   | ${NC}"
echo -e "${WHITE} |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ${NC}"
echo -e "${WHITE}(_____)                                                                                         (_____)${NC}"
echo -e "${GREEN} Current timezone:${WHITE} $TZ ${GREEN} Current Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC}
UE_TRUE_SCRIPT_NAME=$(echo \"$0\" | xargs readlink -f)
UE_PROJECT_ROOT=$(dirname "$UE_TRUE_SCRIPT_NAME")
chmod +x /home/container/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping
sleep 3

## Setup core dumps
echo -e "${YELLOW}Setting up core dumps folder${NC}"
mkdir -p /coredumps
chmod 777 /coredumps

echo -e "${YELLOW}Setting up core pattern settings permanently${NC}"
# Remove existing files first
rm -f /etc/sysctl.d/60-core-pattern.conf
echo 'kernel.core_uses_pid=1' > /etc/sysctl.d/60-core-pattern.conf
echo 'kernel.core_pattern=/coredumps/core-%e-%s-%u-%g-%p-%t' >> /etc/sysctl.d/60-core-pattern.conf

# Apply sysctl settings (may not work in container without --privileged)
sysctl -p /etc/sysctl.d/60-core-pattern.conf 2>/dev/null || echo -e "${YELLOW}Note: Core dump sysctl settings require --privileged mode${NC}"

# Set unlimited core dump size
ulimit -c unlimited

# Disable Ubuntu's crash reporting if apport exists
if command -v systemctl >/dev/null 2>&1; then
    systemctl stop apport 2>/dev/null || true
    systemctl disable apport 2>/dev/null || true
elif [ -f /etc/default/apport ]; then
    echo 'enabled=0' > /etc/default/apport
fi

echo -e "${GREEN}Core dumps configured - dumps will be saved to /coredumps/${NC}"

# Add error handling
set -e
trap 'echo -e "${RED}Script failed at line $LINENO${NC}"' ERR

# Add cleanup function for graceful shutdown
cleanup() {
    echo -e "${YELLOW}Received shutdown signal, gracefully stopping server...${NC}"
    pkill -TERM PathOfTitansServer 2>/dev/null || true
    sleep 5
    pkill -KILL PathOfTitansServer 2>/dev/null || true
    exit 0
}

# Trap signals for graceful shutdown
trap cleanup SIGTERM SIGINT

# Validate required environment variables
echo -e "${YELLOW}Validating environment variables...${NC}"
required_vars=("STARTUP" "RCON_PORT" "RCON_PASSWORD")
missing_vars=()

for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        missing_vars+=("$var")
    fi
done

if [ ${#missing_vars[@]} -ne 0 ]; then
    echo -e "${RED}ERROR: Missing required environment variables: ${missing_vars[*]}${NC}"
    echo -e "${YELLOW}Please ensure these variables are set in your container environment${NC}"
    exit 1
fi

echo -e "${GREEN}Environment validation passed${NC}"

# Display container information
echo -e "${CYAN}=== Container Information ===${NC}"
echo -e "${CYAN}Hostname:${WHITE} $(hostname)${NC}"
echo -e "${CYAN}Internal IP:${WHITE} $INTERNAL_IP${NC}"
echo -e "${CYAN}RCON Port:${WHITE} $RCON_PORT${NC}"
echo -e "${CYAN}Beta Branch:${WHITE} ${BETA_BRANCH:-"default"}${NC}"
echo -e "${CYAN}Auto Update:${WHITE} ${AUTO_UPDATE:-"1"}${NC}"
echo -e "${CYAN}================================${NC}"

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

# Log server startup
echo -e "${GREEN}Starting Path of Titans Server...${NC}"
echo -e "${YELLOW}Command: ${MODIFIED_STARTUP}${NC}"

# Temporarily disable error exit for server execution
set +e

# Run the Server
eval ${MODIFIED_STARTUP}

# Capture exit code
SERVER_EXIT_CODE=$?

# Log server shutdown
echo -e "${YELLOW}Server process ended with exit code: $SERVER_EXIT_CODE${NC}"

if [ $SERVER_EXIT_CODE -ne 0 ]; then
    echo -e "${RED}Server exited with error code $SERVER_EXIT_CODE${NC}"
    
    # Check for core dumps
    if ls /coredumps/core-* 1> /dev/null 2>&1; then
        echo -e "${CYAN}Core dumps found in /coredumps/:${NC}"
        ls -la /coredumps/core-*
    else
        echo -e "${YELLOW}No core dumps found${NC}"
    fi
fi

exit $SERVER_EXIT_CODE