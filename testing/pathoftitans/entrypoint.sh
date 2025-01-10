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

# Function to generate UUID v4
generate_uuid() {
    cat /proc/sys/kernel/random/uuid
}

# Function to update Pterodactyl variable
update_ptero_variable() {
    local key=$1
    local value=$2
    local response
    
    # Extract server ID (first part before the hyphen)
    local server_id=$(hostname | sed 's/^pterodactyl-//' | cut -d'-' -f1)
    
    # Debug server ID
    echo -e "${YELLOW}Server ID: ${server_id}${NC}"
    
    # Try the API call and capture the response
    response=$(curl -s -w "\n%{http_code}" -X PATCH \
        -H "Authorization: Bearer $PTERO_API_KEY" \
        -H "Content-Type: application/json" \
        -H "Accept: Application/vnd.pterodactyl.v1+json" \
        -d "{\"value\": \"$value\"}" \
        "$PTERO_URL/api/client/servers/$server_id/startup/variable/$key")
    
    # Get HTTP status code from response
    local status_code=$(echo "$response" | tail -n1)
    local body=$(echo "$response" | sed '$d')
    
    # Debug output
    echo -e "${YELLOW}API Response for $key:${NC}"
    echo -e "${YELLOW}URL: $PTERO_URL/api/client/servers/$server_id/startup/variable/$key${NC}"
    echo -e "${YELLOW}Status: $status_code${NC}"
    echo -e "${YELLOW}Body: $body${NC}"
    
    # Check for errors
    if [ "$status_code" != "200" ]; then
        echo -e "${RED}Failed to update $key. Status: $status_code${NC}"
        echo -e "${RED}Response: $body${NC}"
        
        # Store value locally if API fails
        echo "$value" > "/home/container/.${key}_value"
        echo -e "${YELLOW}Stored $key locally as API update failed${NC}"
        return 1
    fi
    
    echo -e "${GREEN}Successfully updated $key in Pterodactyl${NC}"
    return 0
}

# Generate random RCON password if not set or too short
if [ -z "${RCON_PASSWORD}" ] || [ "${RCON_PASSWORD}" == "ChangeMe!" ] || [ ${#RCON_PASSWORD} -lt 8 ]; then
    NEW_RCON_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
    
    if update_ptero_variable "RCON_PASSWORD" "$NEW_RCON_PASSWORD"; then
        RCON_PASSWORD=$NEW_RCON_PASSWORD
        export RCON_PASSWORD
    else
        # Use stored password if API failed
        if [ -f "/home/container/.RCON_PASSWORD_value" ]; then
            RCON_PASSWORD=$(cat "/home/container/.RCON_PASSWORD_value")
            export RCON_PASSWORD
        fi
    fi
fi

# Generate new SERVER_GUID if default or empty
if [ -z "${SERVER_GUID}" ] || [ "${SERVER_GUID}" == "ChangeMe!" ]; then
    NEW_SERVER_GUID=$(cat /proc/sys/kernel/random/uuid)
    
    if update_ptero_variable "SERVER_GUID" "$NEW_SERVER_GUID"; then
        SERVER_GUID=$NEW_SERVER_GUID
        export SERVER_GUID
    else
        # Use stored GUID if API failed
        if [ -f "/home/container/.SERVER_GUID_value" ]; then
            SERVER_GUID=$(cat "/home/container/.SERVER_GUID_value")
            export SERVER_GUID
        fi
    fi
fi

# Print server details with status
echo -e "${GREEN}Server Details:${NC}"
echo -e "${GREEN}RCON Port:${WHITE} $RCON_PORT"
echo -e "${GREEN}RCON Password:${WHITE} $RCON_PASSWORD"
echo -e "${GREEN}Server GUID:${WHITE} $SERVER_GUID"
if [ -f "/home/container/.RCON_PASSWORD_value" ] || [ -f "/home/container/.SERVER_GUID_value" ]; then
    echo -e "${YELLOW}Note: Some values are stored locally due to API issues${NC}"
fi

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

# Add trap for graceful shutdown
trap 'echo "Shutting down..."; kill -TERM "$child" 2>/dev/null' SIGTERM

# Improved RCON handling with error checking
(while read cmd; do
    if ! rcon -s -a "localhost:$RCON_PORT" -p "$RCON_PASSWORD" "$cmd"; then
        echo "RCON command failed: $cmd"
    fi
done) < /dev/stdin &

# Log update results
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == "1" ]; then
    update_log="/home/container/update.log"
    echo "Update started at $(date)" > "$update_log"
    if ./AlderonGamesCmd --game path-of-titans --server true --beta-branch $BETA_BRANCH --install-dir ./ --username $AG_SERVER_EMAIL --password $AG_SERVER_PASS >> "$update_log" 2>&1; then
        echo "Update completed successfully at $(date)" >> "$update_log"
    else
        echo "Update failed at $(date)" >> "$update_log"
    fi
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server and store PID
eval ${MODIFIED_STARTUP} &
child=$!

# Wait for process
wait "$child"