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

# Hardcoded API key - Replace this with your actual API key
PTERO_API_KEY=ptlc_4dNDToZB8P9ecXBPYSupTzEtttwnyrVfvqtK41eSmyT

# Function to read startup variables
read_startup_variables() {
    # Skip if SERVER_ID is not set
    if [ -z "${SERVER_ID}" ]; then
        echo -e "${RED}No Server ID available, skipping variable read${NC}"
        return
    fi

    echo -e "${YELLOW}Reading startup variables...${NC}"
    
    local RESPONSE=$(curl -s -X GET \
        "https://panel.gameservershub.com/api/client/servers/${SERVER_ID}/startup" \
        -H "Authorization: Bearer ${PTERO_API_KEY}" \
        -H "Accept: application/json")
    
    # Parse and store variables
    STORED_RCON_PASSWORD=$(echo $RESPONSE | jq -r '.data[] | select(.name=="RCON Password") | .value')
    STORED_SERVER_GUID=$(echo $RESPONSE | jq -r '.data[] | select(.name=="Server Guid") | .value')
    
    echo -e "${GREEN}Current RCON Password: ${WHITE}$STORED_RCON_PASSWORD${NC}"
    echo -e "${GREEN}Current Server GUID: ${WHITE}$STORED_SERVER_GUID${NC}"
}

# Add Pterodactyl API functionality
update_startup_variable() {
    local variable_name=$1
    local value=$2
    
    # Skip if SERVER_ID is not set
    if [ -z "${SERVER_ID}" ]; then
        echo -e "${RED}No Server ID available, skipping variable update${NC}"
        return
    fi

    echo -e "${YELLOW}Updating $variable_name to $value${NC}"
    
    curl -X PUT \
        "https://panel.gameservershub.com/api/client/servers/${SERVER_ID}/startup/variable" \
        -H "Authorization: Bearer ${PTERO_API_KEY}" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        -d "{\"key\":\"${variable_name}\",\"value\":\"${value}\"}"
}

# Function to generate random password
generate_secure_password() {
    < /dev/urandom tr -dc 'A-Za-z0-9' | head -c16
}

# Function to validate RCON password
validate_rcon_password() {
    local password=$1
    if [ -z "$password" ] || [ ${#password} -lt 8 ] || [ "$password" == "ChangeMe!" ]; then
        return 1
    fi
    return 0
}

# Function to validate SERVER_GUID
validate_server_guid() {
    local guid=$1
    if [ -z "$guid" ] || [ "$guid" == "ChangeMe!" ]; then
        return 1
    fi
    # Check if it matches UUID format
    if [[ ! $guid =~ ^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$ ]]; then
        return 1
    fi
    return 0
}

# Function to handle critical variables
handle_critical_variables() {
    # Read current values first
    read_startup_variables
    
    # Handle RCON password
    if ! validate_rcon_password "$STORED_RCON_PASSWORD"; then
        NEW_RCON_PASSWORD=$(generate_secure_password)
        update_startup_variable "RCON_PASSWORD" "$NEW_RCON_PASSWORD"
        export RCON_PASSWORD="$NEW_RCON_PASSWORD"
        echo -e "${YELLOW}Generated new secure RCON password${NC}"
    fi
    
    # Handle Server GUID
    if ! validate_server_guid "$STORED_SERVER_GUID"; then
        NEW_SERVER_GUID=$(uuidgen)
        update_startup_variable "SERVER_GUID" "$NEW_SERVER_GUID"
        export SERVER_GUID="$NEW_SERVER_GUID"
        echo -e "${YELLOW}Generated new Server GUID${NC}"
    fi
}

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

# Export P_SERVER_UUID if available and create SERVER_ID from first 8 characters
if [ -n "${P_SERVER_UUID}" ]; then
    export P_SERVER_UUID
    SERVER_ID=${P_SERVER_UUID:0:8}
    export SERVER_ID
    echo -e "${GREEN}Server UUID:${WHITE} $P_SERVER_UUID${NC}"
    echo -e "${GREEN}Server ID:${WHITE} $SERVER_ID${NC}"
    
    # Handle RCON password and Server GUID
    handle_critical_variables
fi
sleep 5
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