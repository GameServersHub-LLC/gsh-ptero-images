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
echo -e "${WHITE} _____                                                             _____ ${NC}"
echo -e "${WHITE}( ___ )                                                           ( ___ )${NC}"
echo -e "${WHITE} |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ${NC}"
echo -e "${WHITE} |   |${GREEN} ▄▄▄▄▄ ▄ .▄▄▄▄ .    ▪  .▄▄ · ▄▄▌  ▄▄▄ .    ▄▄▄ . ▄▄ •  ▄▄ •  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${GREEN} •██  ██▪▐█▀▄.▀·    ██ ▐█ ▀. ██•  ▀▄.▀·    ▀▄.▀·▐█ ▀ ▪▐█ ▀ ▪ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${GREEN}  ▐█.▪██▀▐█▐▀▀▪▄    ▐█·▄▀▀▀█▄██▪  ▐▀▀▪▄    ▐▀▀▪▄▄█ ▀█▄▄█ ▀█▄ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${GREEN}  ▐█▌·██▌▐▀▐█▄▄▌    ▐█▌▐█▄▪▐█▐█▌▐▌▐█▄▄▌    ▐█▄▄▌▐█▄▪▐█▐█▄▪▐█ ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${GREEN}  ▀▀▀ ▀▀▀ · ▀▀▀     ▀▀▀ ▀▀▀▀ .▀▀▀  ▀▀▀      ▀▀▀ ·▀▀▀▀ ·▀▀▀▀  ${WHITE}|   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} by that411guy ${WHITE}                                              ${WHITE}|   | ${NC}"
echo -e "${WHITE} |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ${NC}"
echo -e "${WHITE}(_____)                                                           (_____)${NC}"
echo -e "${GREEN} Current timezone:${WHITE} $TZ ${GREEN} Current Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC}
chmod +x /home/container/TheIsle/Binaries/Linux/TheIsleServer-Linux-Shipping
sleep 3

# Switch to the container's working directory
cd /home/container || exit 1

# writing dotnet infos to file
#dotnetinfo=$(dotnet --info)
#echo $dotnetinfo >| dotnet_info.txt

echo -e "${BLUE}---------------------------------------------------------------------${NC}"
echo -e "${GREEN}Starting Server.... Please wait...${NC}"
echo -e "${BLUE}---------------------------------------------------------------------${NC}"
sleep 1

## just in case someone removed the defaults.
if [ "${STEAM_USER}" == "" ]; then
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
    echo -e "${YELLOW}Steam user is not set. ${NC}"
    echo -e "${YELLOW}Using anonymous user.${NC}"
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
    STEAM_USER=anonymous
    STEAM_PASS=""
    STEAM_AUTH=""
else
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
    echo -e "${YELLOW}user set to ${STEAM_USER} ${NC}"
    echo -e "${BLUE}---------------------------------------------------------------------${NC}"
fi

# Auto-update logic
if [ -z "${AUTO_UPDATE}" ] || [ "${AUTO_UPDATE}" == "1" ]; then 
    # Update Source Server
    if [ -n "${SRCDS_APPID}" ]; then
        if [ "${STEAM_USER}" == "anonymous" ]; then
            ./steamcmd/steamcmd.sh +force_install_dir /home/container \
            +login "${STEAM_USER}" "${STEAM_PASS}" "${STEAM_AUTH}" \
            $( [[ "${WINDOWS_INSTALL}" == "1" ]] && printf %s '+@sSteamCmdForcePlatformType windows' ) \
            $( [[ "${STEAM_SDK}" == "1" ]] && printf %s '+app_update 1007' ) \
            +app_update "${SRCDS_APPID}" \
            $( [[ -z "${SRCDS_BETAID}" ]] || printf %s "-beta ${SRCDS_BETAID}" ) \
            $( [[ -z "${STEAM_BETAPASS}" ]] || printf %s "-betapassword ${STEAM_BETAPASS}" ) \
            ${INSTALL_FLAGS} \
            $( [[ "${VALIDATE}" == "1" ]] && printf %s 'validate' ) +quit
        else
            numactl --physcpubind=+0 ./steamcmd/steamcmd.sh +force_install_dir /home/container \
            +login "${STEAM_USER}" "${STEAM_PASS}" "${STEAM_AUTH}" \
            $( [[ "${WINDOWS_INSTALL}" == "1" ]] && printf %s '+@sSteamCmdForcePlatformType windows' ) \
            $( [[ "${STEAM_SDK}" == "1" ]] && printf %s '+app_update 1007' ) \
            +app_update "${SRCDS_APPID}" \
            $( [[ -z "${SRCDS_BETAID}" ]] || printf %s "-beta ${SRCDS_BETAID}" ) \
            $( [[ -z "${STEAM_BETAPASS}" ]] || printf %s "-betapassword ${STEAM_BETAPASS}" ) \
            ${INSTALL_FLAGS} \
            $( [[ "${VALIDATE}" == "1" ]] && printf %s 'validate' ) +quit
        fi
    else
        echo -e "${BLUE}---------------------------------------------------------------------${NC}"
        echo -e "${YELLOW}No Steam App ID set. Skipping update.${NC}"
        echo -e "${BLUE}---------------------------------------------------------------------${NC}"
        sleep 3
    fi
else
    echo -e "${BLUE}---------------------------------------------------------------${NC}"
    echo -e "${YELLOW}Not updating game server as auto-update was set to 0. Starting Server.${NC}"
    echo -e "${BLUE}---------------------------------------------------------------${NC}"
fi


# Setup NSS Wrapper with error checking
if [ -f "/usr/lib/x86_64-linux-gnu/libnss_wrapper.so" ]; then
    export USER_ID=$(id -u)
    export GROUP_ID=$(id -g)
    envsubst < /passwd.template > ${NSS_WRAPPER_PASSWD}
    export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libnss_wrapper.so
else
    echo -e "${YELLOW}Warning: libnss_wrapper.so not found, continuing without it${NC}"
fi

# RCON setup with proper authentication and error handling
if [ -n "$RCON_PASSWORD" ] && [ -n "$RCON_PORT" ]; then
    echo -e "${GREEN}Setting up RCON on port $RCON_PORT${NC}"
    (while read cmd; do
        if [ -n "$cmd" ]; then
            # Ensure proper UTF-8 encoding and add retry logic
            for i in {1..3}; do
                if rcon -H "127.0.0.1" -p "$RCON_PORT" -P "$RCON_PASSWORD" "$cmd"; then
                    break
                else
                    echo -e "${YELLOW}RCON command failed, attempt $i/3${NC}"
                    sleep 2
                fi
            done
        fi
    done) < /dev/stdin &
else
    echo -e "${YELLOW}Warning: RCON_PASSWORD or RCON_PORT not set, RCON functionality disabled${NC}"
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}