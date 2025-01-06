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

# Add shutdown handler function
shutdown_handler() {
    echo "Shutdown signal received, saving world..."
    
    # Try RCON save first
    if rcon -s -a "localhost:$RCON_PORT" -p "$ARK_ADMIN_PASSWORD" "saveworld" > /dev/null 2>&1; then
        echo "Save command sent successfully"
        sleep 5
    fi
    
    # Try RCON shutdown, but don't wait for response
    rcon -s -a "localhost:$RCON_PORT" -p "$ARK_ADMIN_PASSWORD" "doexit" > /dev/null 2>&1
    echo "Shutdown command sent"
    
    # Force kill the server process if it's still running after 10 seconds
    sleep 10
    if kill -0 $SERVER_PID 2>/dev/null; then
        echo "Server still running, forcing shutdown..."
        kill -9 $SERVER_PID 2>/dev/null || true
    fi
    
    echo "Server shutdown complete"
    exit 0
}

# Set up trap for more signal types
trap 'shutdown_handler' SIGTERM SIGINT SIGQUIT

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
echo -e "${WHITE} _____                                                      _____ ${NC}"
echo -e "${WHITE}( ___ )                                                    ( ___ )${NC}"
echo -e "${WHITE} |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ${NC}"
echo -e "${WHITE} |   |${RED} ▄▄▄· ▄▄▄  ▄ •▄     .▄▄ ·  ▄▄▄·     ▄▄▄ . ▄▄ •  ▄▄ •  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED}▐█ ▀█ ▀▄ █·█▌▄▌▪    ▐█ ▀. ▐█ ▀█     ▀▄.▀·▐█ ▀ ▪▐█ ▀ ▪ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED}▄█▀▀█ ▐▀▀▄ ▐▀▀▄·    ▄▀▀▀█▄▄█▀▀█     ▐▀▀▪▄▄█ ▀█▄▄█ ▀█▄ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED}▐█ ▪▐▌▐█•█▌▐█.█▌    ▐█▄▪▐█▐█ ▪▐▌    ▐█▄▄▌▐█▄▪▐█▐█▄▪▐█ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${RED} ▀  ▀ .▀  ▀·▀  ▀     ▀▀▀▀  ▀  ▀      ▀▀▀ ·▀▀▀▀ ·▀▀▀▀  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} by that411guy ${WHITE}                                       ${WHITE}|   | ${NC}"
echo -e "${WHITE} |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ${NC}"
echo -e "${WHITE}(_____)                                                    (_____)${NC}"
echo -e "${GREEN} Current timezone:${WHITE} $TZ ${GREEN} Current Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC}
sleep 3

# Download and extract file from GitHub only if API is enabled
if [ "${USE_ASA_API}" == "1" ] || [ "${USE_ASA_API}" == "true" ]; then
    DOWNLOAD_PATH="/home/container/ShooterGame/Binaries/Win64"
    EXTRACT_PATH="/home/container/ShooterGame/Binaries/Win64"

    mkdir -p $DOWNLOAD_PATH
    mkdir -p $EXTRACT_PATH

    # Function to get latest version from GitHub
    get_latest_version() {
        curl -s https://api.github.com/repos/ArkServerApi/AsaApi/releases/latest | grep "tag_name" | cut -d '"' -f 4
    }

    # Function to get current installed version
    get_installed_version() {
        if [ -f "$EXTRACT_PATH/version.txt" ]; then
            cat "$EXTRACT_PATH/version.txt"
        else
            echo "0.0.0"
        fi
    }

    # Check if AsaApiLoader.exe exists and check for updates
    if [ -f "$EXTRACT_PATH/AsaApiLoader.exe" ]; then
        echo "AsaApiLoader.exe exists, checking for updates..."
        LATEST_VERSION=$(get_latest_version)
        CURRENT_VERSION=$(get_installed_version)
        
        if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]; then
            echo -e "\n=== Update Available ==="
            echo "Current version: $CURRENT_VERSION"
            echo "Latest version:  $LATEST_VERSION"
            echo "===================="
            echo -e "Would you like to update? [y/N] (timeout in 10s): "
            
            read -t 10 -n 1 REPLY
            RESULT=$?
            echo

            if [ $RESULT -eq 0 ] && [[ $REPLY =~ ^[Yy]$ ]]; then
                echo "Downloading update..."
                LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/ArkServerApi/AsaApi/releases/latest \
                    | grep "browser_download_url.*zip" \
                    | cut -d '"' -f 4)
                cd $DOWNLOAD_PATH
                wget -q --show-progress "$LATEST_RELEASE_URL" -O AsaApi.zip
                if [ -f "AsaApi.zip" ]; then
                    unzip -o AsaApi.zip
                    rm -f AsaApi.zip
                    echo "$LATEST_VERSION" > "$EXTRACT_PATH/version.txt"
                    echo "Successfully updated to version $LATEST_VERSION"
                fi
            else
                if [ $RESULT -eq 142 ]; then
                    echo "Update timed out after 10 seconds, skipping..."
                else
                    echo "Update skipped"
                fi
            fi
        else
            echo "AsaApi is up to date (version $CURRENT_VERSION)"
        fi
    else
        echo "AsaApiLoader.exe not found, performing first-time installation..."
        LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/ArkServerApi/AsaApi/releases/latest \
            | grep "browser_download_url.*zip" \
            | cut -d '"' -f 4)

        if [ ! -z "$LATEST_RELEASE_URL" ]; then
            echo "Downloading latest release from: $LATEST_RELEASE_URL"
            cd $DOWNLOAD_PATH
            wget -q --show-progress "$LATEST_RELEASE_URL" -O AsaApi.zip
            
            if [ -f "AsaApi.zip" ]; then
                unzip -o AsaApi.zip
                rm -f AsaApi.zip
                LATEST_VERSION=$(get_latest_version)
                echo "$LATEST_VERSION" > "$EXTRACT_PATH/version.txt"
                echo "Successfully installed version $LATEST_VERSION"
            else
                echo "Failed to download zip file from: $LATEST_RELEASE_URL"
            fi
        else
            echo "Failed to get latest release information from GitHub"
        fi
    fi
fi

# Set environment for Steam Proton
if [ -f "/usr/local/bin/proton" ]; then
    if [ ! -z ${SRCDS_APPID} ]; then
        mkdir -p /home/container/.steam/steam/steamapps/compatdata/${SRCDS_APPID}
        export STEAM_COMPAT_CLIENT_INSTALL_PATH="/home/container/.steam/steam"
        export STEAM_COMPAT_DATA_PATH="/home/container/.steam/steam/steamapps/compatdata/${SRCDS_APPID}"
        # Fix for pipx with protontricks
        export PATH=$PATH:/root/.local/bin
    else
        echo -e "----------------------------------------------------------------------------------"
        echo -e "WARNING!!! Proton needs variable SRCDS_APPID, else it will not work. Please add it"
        echo -e "Server stops now"
        echo -e "----------------------------------------------------------------------------------"
        exit 0
    fi
fi

# Switch to the container's working directory
cd /home/container || exit 1

## just in case someone removed the defaults.
if [ "${STEAM_USER}" == "" ]; then
    echo -e "steam user is not set.\n"
    echo -e "Using anonymous user.\n"
    STEAM_USER=anonymous
    STEAM_PASS=""
    STEAM_AUTH=""
else
    echo -e "user set to ${STEAM_USER}"
fi

## if auto_update is not set or to 1 update
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == "1" ]; then 
    # Update Source Server
    if [ ! -z ${SRCDS_APPID} ]; then
	    if [ "${STEAM_USER}" == "anonymous" ]; then
            ./steamcmd/steamcmd.sh +force_install_dir /home/container +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ "${WINDOWS_INSTALL}" == "1" ]] && printf %s '+@sSteamCmdForcePlatformType windows' ) +app_update 1007 +app_update ${SRCDS_APPID} $( [[ -z ${SRCDS_BETAID} ]] || printf %s "-beta ${SRCDS_BETAID}" ) $( [[ -z ${SRCDS_BETAPASS} ]] || printf %s "-betapassword ${SRCDS_BETAPASS}" ) $( [[ -z ${HLDS_GAME} ]] || printf %s "+app_set_config 90 mod ${HLDS_GAME}" )  ${INSTALL_FLAGS} $( [[ "${VALIDATE}" == "1" ]] && printf %s 'validate' ) +quit
	    else
            numactl --physcpubind=+0 ./steamcmd/steamcmd.sh +force_install_dir /home/container +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ "${WINDOWS_INSTALL}" == "1" ]] && printf %s '+@sSteamCmdForcePlatformType windows' ) +app_update 1007 +app_update ${SRCDS_APPID} $( [[ -z ${SRCDS_BETAID} ]] || printf %s "-beta ${SRCDS_BETAID}" ) $( [[ -z ${SRCDS_BETAPASS} ]] || printf %s "-betapassword ${SRCDS_BETAPASS}" ) $( [[ -z ${HLDS_GAME} ]] || printf %s "+app_set_config 90 mod ${HLDS_GAME}" ) ${INSTALL_FLAGS} $( [[ "${VALIDATE}" == "1" ]] && printf %s 'validate' ) +quit
	    fi
    else
        echo -e "No appid set. Starting Server"
    fi

else
    echo -e "Not updating game server as auto update was set to 0. Starting Server"
fi

# Replace the existing RCON loop with just the background RCON stdin reader
(while read cmd; do
    rcon -s -a "localhost:$RCON_PORT" -p "$ARK_ADMIN_PASSWORD" "$cmd"
done) < /dev/stdin &

# Set executable based on USE_ASA_API
SERVER_EXECUTABLE="ArkAscendedServer.exe"
if [ "${USE_ASA_API}" == "1" ] || [ "${USE_ASA_API}" == "true" ]; then
    if [ -f "./ShooterGame/Binaries/Win64/AsaApiLoader.exe" ]; then
        SERVER_EXECUTABLE="AsaApiLoader.exe"
        echo "Using AsaApi loader..."
    else
        echo "WARNING: AsaApi loader not found, falling back to default executable"
    fi
fi

# Initialize variables with defaults
ARGS_PARAMS="${ARGS_PARAMS:-}"
ARGS_FLAGS="${ARGS_FLAGS:-}"
MOD_IDS="${MOD_IDS:-}"
PASS_MOD="${PASS_MOD:-}"
CLUSTER_ID="${CLUSTER_ID:-}"
CLUSTER_DIR_OVERRIDE="${CLUSTER_DIR_OVERRIDE:-}"
SERVER_PASSWORD="${SERVER_PASSWORD:-}"
BATTLE_EYE="${BATTLE_EYE:-1}"

# Build server startup command
build_startup_cmd() {
    local cmd="proton run ./ShooterGame/Binaries/Win64/${SERVER_EXECUTABLE}"
    
    # Base parameters need to be in correct order
    cmd+=" ${SERVER_MAP}"
    cmd+="?SessionName=\"${SESSION_NAME}\""
    cmd+="?listen"
    cmd+="?Port=${SERVER_PORT}"
    cmd+="?MultiHome=${INTERNAL_IP}"
    cmd+="?RCONEnabled=True"
    cmd+="?RCONPort=${RCON_PORT}"
    
    # Add conditional parameters
    [ "$SERVER_PVE" != "0" ] && cmd+="?ServerPVE=True"
    [ -n "$SERVER_PASSWORD" ] && cmd+="?ServerPassword=\"${SERVER_PASSWORD}\""
    [ -n "$ARGS_PARAMS" ] && cmd+="${ARGS_PARAMS}"
    
    # Add standard parameters - these need to be after the ? parameters
    cmd+=" -servergamelog"
    cmd+=" -WinLiveMaxPlayers=${MAX_PLAYERS}"
    cmd+=" -NoTransferFromFiltering"
    [ -n "${CLUSTER_ID}" ] && cmd+=" -clusterid=${CLUSTER_ID}"
    [ -n "${CLUSTER_DIR_OVERRIDE}" ] && cmd+=" -ClusterDirOverride=\"${CLUSTER_DIR_OVERRIDE}\""
    
    # Add optional parameters
    [ -n "$MOD_IDS" ] && cmd+=" -mods=$MOD_IDS"
    [ -n "$PASS_MOD" ] && cmd+=" -passivemod=$PASS_MOD"
    [ "$BATTLE_EYE" != "1" ] && cmd+=" -NoBattlEye"
    [ -n "$ARGS_FLAGS" ] && cmd+=" ${ARGS_FLAGS}"
    
    echo "$cmd"
}

# Replace the existing RCON loop with just the background RCON stdin reader
(while read cmd; do
    rcon -s -a "localhost:$RCON_PORT" -p "$ARK_ADMIN_PASSWORD" "$cmd"
done) < /dev/stdin &

# Build the startup command
STARTUP_CMD="proton run ./ShooterGame/Binaries/Win64/${SERVER_EXECUTABLE}"
STARTUP_CMD+=" ${SERVER_MAP}?listen?SessionName=\"${SESSION_NAME}\""
STARTUP_CMD+="?Port=${SERVER_PORT}?RCONEnabled=True?RCONPort=${RCON_PORT}"
STARTUP_CMD+="$( [ \"$SERVER_PVE\" == \"0\" ] || printf %s '?ServerPVE=True' )"
STARTUP_CMD+="$(if [ -n \"${SERVER_PASSWORD:-}\" ]; then echo \"?ServerPassword=\\\"${SERVER_PASSWORD}\\\"\"; fi)"
STARTUP_CMD+="${ARGS_PARAMS:-}"
STARTUP_CMD+=" -WinLiveMaxPlayers=${MAX_PLAYERS}"
STARTUP_CMD+=" -NoTransferFromFiltering"
STARTUP_CMD+=" -clusterid=${CLUSTER_ID:-}"
STARTUP_CMD+=" -ClusterDirOverride=\"${CLUSTER_DIR_OVERRIDE:-}\""
STARTUP_CMD+=" -servergamelog"
STARTUP_CMD+="$( [ -z \"${MOD_IDS:-}\" ] || printf %s \" -mods=${MOD_IDS}\" )"
STARTUP_CMD+="$( [ -z \"${PASS_MOD:-}\" ] || printf '%s' \" -passivemod=${PASS_MOD}\" )"
STARTUP_CMD+="$( [ \"${BATTLE_EYE:-1}\" != \"1\" ] || printf %s \" -NoBattlEye\" )"
STARTUP_CMD+=" ${ARGS_FLAGS:-}"

# Clear the log file before starting
echo "" > "ShooterGame/Saved/Logs/ShooterGame.log"

# Execute the startup command
echo -e ":/home/container$ ${STARTUP_CMD}"
eval ${STARTUP_CMD} &
SERVER_PID=$!

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Clear the log file before starting
echo "" > "ShooterGame/Saved/Logs/ShooterGame.log"

# Execute the startup command
echo -e ":/home/container$ ${MODIFIED_STARTUP}"
eval ${MODIFIED_STARTUP} &
SERVER_PID=$!

# Monitor server in a way that won't interfere with shutdown
# Using tail -F to follow the new file if it gets recreated, and --pid to exit when server exits
tail -F --pid=$SERVER_PID "ShooterGame/Saved/Logs/ShooterGame.log" & TAIL_PID=$!
trap 'kill $TAIL_PID 2>/dev/null' EXIT

# Wait for server and handle interrupts
wait $SERVER_PID || true
kill $TAIL_PID 2>/dev/null || true

exit 0