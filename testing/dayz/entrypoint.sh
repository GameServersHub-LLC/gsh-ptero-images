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
echo -e "${WHITE} _____                                                     _____ ${NC}"
echo -e "${WHITE}( ___ )                                                   ( ___ )${NC}"
echo -e "${WHITE} |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ${NC}"
echo -e "${WHITE} |   | ·▄▄▄▄   ▄▄▄·  ▄· ▄▌    ·▄▄▄▄•    ▄▄▄ . ▄▄ •  ▄▄ •   |   | ${NC}"
echo -e "${WHITE} |   | ██▪ ██ ▐█ ▀█ ▐█▪██▌    ▪▀·.█▌    ▀▄.▀·▐█ ▀ ▪▐█ ▀ ▪  |   | ${NC}"
echo -e "${WHITE} |   | ▐█· ▐█▌▄█▀▀█ ▐█▌▐█▪    ▄█▀▀▀•    ▐▀▀▪▄▄█ ▀█▄▄█ ▀█▄  |   | ${NC}"
echo -e "${WHITE} |   | ██. ██ ▐█ ▪▐▌ ▐█▀·.    █▌▪▄█▀    ▐█▄▄▌▐█▄▪▐█▐█▄▪▐█  |   | ${NC}"
echo -e "${WHITE} |   | ▀▀▀▀▀•  ▀  ▀   ▀ •     ·▀▀▀ •     ▀▀▀ ·▀▀▀▀ ·▀▀▀▀   |   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} by that411guy                                       ${WHITE}|   | ${NC}"
echo -e "${WHITE} |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ${NC}"
echo -e "${WHITE}(_____)                                                   (_____)${NC}"
echo -e "${GREEN} Current timezone:${WHITE} $TZ ${GREEN} Current Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC}
sleep 3

echo -e "${WHITE} _______                                                                  _______ ${NC}"
echo -e "${WHITE}( _____ )                                                                ( _____ )${NC}"
echo -e "${WHITE} |     |                                                                  |     | ${NC}"
echo -e "${WHITE} |     | ▓█████▄  ▄▄▄     ▓██   ██▓   ▒███████▒   ▓█████   ▄████   ▄████  |     | ${NC}"
echo -e "${WHITE} |     | ▒██▀ ██▌▒████▄    ▒██  ██▒   ▒ ▒ ▒ ▄▀░   ▓█   ▀  ██▒ ▀█▒ ██▒ ▀█▒ |     | ${NC}"
echo -e "${WHITE} |     | ░██   █▌▒██  ▀█▄   ▒██ ██░   ░ ▒ ▄▀▒░    ▒███   ▒██░▄▄▄░▒██░▄▄▄░ |     | ${NC}"
echo -e "${WHITE} |     | ░▓█▄   ▌░██▄▄▄▄██  ░ ▐██▓░     ▄▀▒   ░   ▒▓█  ▄ ░▓█  ██▓░▓█  ██▓ |     | ${NC}"
echo -e "${WHITE} |     | ░▒████▓  ▓█   ▓██▒ ░ ██▒▓░   ▒███████▒   ░▒████▒░▒▓███▀▒░▒▓███▀▒ |     | ${NC}"
echo -e "${WHITE} |     |  ▒▒▓  ▒  ▒▒   ▓▒█░  ██▒▒▒    ░▒▒ ▓░▒░▒   ░░ ▒░ ░ ░▒   ▒  ░▒   ▒  |     | ${NC}"
echo -e "${WHITE} |     |  ░ ▒  ▒   ▒   ▒▒ ░▓██ ░▒░    ░░▒ ▒ ░ ▒    ░ ░  ░  ░   ░   ░   ░  |     | ${NC}"
echo -e "${WHITE} |     |  ░ ░  ░   ░   ▒   ▒ ▒ ░░     ░ ░ ░ ░ ░      ░   ░ ░   ░ ░ ░   ░  |     | ${NC}"
echo -e "${WHITE} |     |    ░          ░  ░░ ░          ░ ░          ░  ░      ░       ░  |     | ${NC}"
echo -e "${WHITE} |     |  ░                ░ ░        ░                                   |     | ${NC}"

echo -e "${RED}                                                                  ${NC}"
echo -e "${RED} ▓${WHITE}█████▄  ▄▄▄     ${RED}▓${WHITE}██   ██${RED}▓   ▒${WHITE}███████${RED}▒${WHITE}   ▓█████   ▄████   ▄████  ${NC}"
echo -e "${RED} ▒${WHITE}██▀ ██▌${RED}▒${WHITE}████▄    ${RED}▒${WHITE}██  ██${RED}▒   ▒ ▒ ▒ ${WHITE}▄▀${RED}░   ${WHITE}▓█   ▀  ██${RED}▒ ${WHITE}▀█${RED}▒ ${WHITE}██${RED}▒ ${WHITE}▀█${RED}▒ ${NC}"
echo -e "${RED} ░${WHITE}██   █▌${RED}▒${WHITE}██  ▀█▄   ${RED}▒${WHITE}██ ██${RED}░   ░ ▒ ${WHITE}▄▀${RED}▒░    ▒${WHITE}███   ${RED}▒${WHITE}██${RED}░${WHITE}▄▄▄${RED}░▒${WHITE}██${RED}░${WHITE}▄▄▄${RED}░ ${NC}"
echo -e "${RED} ░${WHITE}▓█▄   ▌${RED}░${WHITE}██▄▄▄▄██  ${RED}░ ${WHITE}▐██${RED}▓░     ${WHITE}▄▀${RED}▒   ░   ▒▓${WHITE}█  ▄ ${RED}░▓${WHITE}█  ██${RED}▓░▓${WHITE}█  ██${RED}▓ ${NC}"
echo -e "${RED} ░▒${WHITE}████▓  ▓█   ▓██${RED}▒ ░ ${WHITE}██${RED}▒▓░   ▒${WHITE}███████${RED}▒   ░▒${WHITE}████${RED}▒░▒▓${WHITE}███▀${RED}▒░▒▓${WHITE}███▀${RED}▒ ${NC}"
echo -e "${RED}  ▒▒▓  ▒  ▒▒   ▓▒${WHITE}█${RED}░  ${WHITE}██${RED}▒▒▒    ░▒▒ ▓░▒░▒   ░░ ▒░ ░ ░▒   ▒  ░▒   ▒  ${NC}"
echo -e "${RED}  ░ ▒  ▒   ▒   ▒▒ ░▓${WHITE}██ ${RED}░▒░    ░░▒ ▒ ░ ▒    ░ ░  ░  ░   ░   ░   ░  ${NC}"
echo -e "${RED}  ░ ░  ░   ░   ▒   ▒ ▒ ░░     ░ ░ ░ ░ ░      ░   ░ ░   ░ ░ ░   ░  ${NC}"
echo -e "${RED}    ░          ░  ░░ ░          ░ ░          ░  ░      ░       ░  ${NC}"
echo -e "${RED}  ░                ░ ░        ░                                   ${NC}"

## === CONSTANTS ===
STEAMCMD_DIR="./steamcmd"                       # SteamCMD's directory containing steamcmd.sh
WORKSHOP_DIR="./Steam/steamapps/workshop"       # SteamCMD's directory containing workshop downloads
STEAMCMD_LOG="${STEAMCMD_DIR}/steamcmd.log"     # Log file for SteamCMD
GAME_ID=221100                                  # SteamCMD ID for the DayZ GAME (not server). Only used for Workshop mod downloads.
MODS_DIR="./mods"                               # Base directory for all mods

## === ENVIRONMENT VARS ===
# STARTUP, STARTUP_PARAMS, STEAM_USER, STEAM_PASS, SERVER_BINARY, MOD_FILE, MODIFICATIONS, SERVERMODS, UPDATE_SERVER, VALIDATE_SERVER, MODS_LOWERCASE, STEAMCMD_EXTRA_FLAGS, STEAMCMD_APPID, SERVER_PASSWORD, STEAMCMD_ATTEMPTS, DISABLE_MOD_UPDATES

## === GLOBAL VARS ===
# validateServer, extraFlags, updateAttempt, modifiedStartup, allMods, CLIENT_MODS

## === DEFINE FUNCTIONS ===

# Runs SteamCMD with specified variables and performs error handling.
RunSteamCMD() {
    if [ -f "${STEAMCMD_LOG}" ]; then
        rm -f "${STEAMCMD_LOG:?}"
    fi
    
    updateAttempt=0
    while [ $updateAttempt -lt $STEAMCMD_ATTEMPTS ]; do
        updateAttempt=$((updateAttempt+1))
        
        if [ $updateAttempt -gt 1 ]; then
            echo -e "\t${YELLOW}Re-Attempting download/update in 3 seconds...${NC} (Attempt ${CYAN}${updateAttempt}${NC} of ${CYAN}${STEAMCMD_ATTEMPTS}${NC})\n"
            sleep 3
        fi
        
        # Check if updating server or mod
        if [ $1 -eq 0 ]; then # Server
            ${STEAMCMD_DIR}/steamcmd.sh +force_install_dir /home/container "+login \"${STEAM_USER}\" \"${STEAM_PASS}\"" +app_update $2 $extraFlags $validateServer +quit | tee -a "${STEAMCMD_LOG}"
        else # Mod
            ${STEAMCMD_DIR}/steamcmd.sh "+login \"${STEAM_USER}\" \"${STEAM_PASS}\"" +workshop_download_item $GAME_ID $2 +quit | tee -a "${STEAMCMD_LOG}"
        fi
        
        # Error checking for SteamCMD
        steamcmdExitCode=${PIPESTATUS[0]}
        # Catch errors (ignore setlocale, SDL, steamservice, thread priority, and libcurl warnings)
        loggedErrors=$(grep -i "error\|failed" "${STEAMCMD_LOG}" | grep -iv "setlocal\|SDL\|steamservice\|thread\|libcurl")
        if [ -n "${loggedErrors}" ]; then
            # Soft errors
            if [ -n "$(grep -i "Timeout downloading item" "${STEAMCMD_LOG}")" ]; then # Mod download timeout
                echo -e "\n${YELLOW}[UPDATE]: ${NC}Timeout downloading Steam Workshop mod: \"${CYAN}${modName}${NC}\" (${CYAN}${2}${NC})"
                echo -e "\t(This is expected for particularly large mods)"
            elif [ -n "$(grep -i "0x402\|0x6\|0x602" "${STEAMCMD_LOG}")" ]; then # Connection issue with Steam
                echo -e "\n${YELLOW}[UPDATE]: ${NC}Connection issue with Steam servers."
                echo -e "\t(Steam servers may currently be down, or a connection cannot be made reliably)"
            # Hard errors
            elif [ -n "$(grep -i "Password check for AppId" "${STEAMCMD_LOG}")" ]; then # Incorrect beta branch password
                echo -e "\n${RED}[UPDATE]: ${YELLOW}Incorrect password given for beta branch. ${CYAN}Skipping download...${NC}"
                echo -e "\t(Check your \"[ADVANCED] EXTRA FLAGS FOR STEAMCMD\" startup parameter)"
                break
            # Fatal errors
            elif [ -n "$(grep -i "Invalid Password\|two-factor\|No subscription" "${STEAMCMD_LOG}")" ]; then # Wrong username/password, Steam Guard is turned on, or host is using anonymous account
                echo -e "\n${RED}[UPDATE]: Cannot login to Steam - Improperly configured account and/or credentials"
                echo -e "\t${YELLOW}Please contact your administrator/host and give them the following message:${NC}"
                echo -e "\t${CYAN}Your Egg, or your client's server, is not configured with valid Steam credentials.${NC}"
                echo -e "\t${CYAN}Either the username/password is wrong, or Steam Guard is not properly configured\n\taccording to this egg's documentation/README.${NC}\n"
                exit 1
            elif [ -n "$(grep -i "Download item" "${STEAMCMD_LOG}")" ]; then # Steam account does not own base game for mod downloads, or unknown
                echo -e "\n${RED}[UPDATE]: Cannot download mod - Download failed"
                echo -e "\t${YELLOW}While unknown, this error is likely due to your host's Steam account not owning the base game.${NC}"
                echo -e "\t${YELLOW}(Please contact your administrator/host if this issue persists)${NC}\n"
                exit 1
            elif [ -n "$(grep -i "0x202\|0x212" "${STEAMCMD_LOG}")" ]; then # Not enough disk space
                echo -e "\n${RED}[UPDATE]: Unable to complete download - Not enough storage"
                echo -e "\t${YELLOW}You have run out of your allotted disk space.${NC}"
                echo -e "\t${YELLOW}Please contact your administrator/host for potential storage upgrades.${NC}\n"
                exit 1
            elif [ -n "$(grep -i "0x606" "${STEAMCMD_LOG}")" ]; then # Disk write failure
                echo -e "\n${RED}[UPDATE]: Unable to complete download - Disk write failure"
                echo -e "\t${YELLOW}This is normally caused by directory permissions issues,\n\tbut could be a more serious hardware issue.${NC}"
                echo -e "\t${YELLOW}(Please contact your administrator/host if this issue persists)${NC}\n"
                exit 1
            else # Unknown caught error
                echo -e "\n${RED}[UPDATE]: ${YELLOW}An unknown error has occurred with SteamCMD. ${CYAN}Skipping download...${NC}"
                echo -e "\t(Please contact your administrator/host if this issue persists)"
                break
            fi
        elif [ $steamcmdExitCode -ne 0 ]; then # Unknown fatal error
            echo -e "\n${RED}[UPDATE]: SteamCMD has crashed for an unknown reason!${NC} (Exit code: ${CYAN}${steamcmdExitCode}${NC})"
            echo -e "\t${YELLOW}(Please contact your administrator/host for support)${NC}\n"
            cp -r /tmp/dumps /home/container/dumps
            exit $steamcmdExitCode
        else # Success!
            if [ $1 -eq 0 ]; then # Server
                echo -e "\n${GREEN}[UPDATE]: Game server is up to date!${NC}"
            else # Mod
                # Move the downloaded mod to the mods directory
                mkdir -p "${MODS_DIR}/@$2"
                rm -rf "${MODS_DIR}/@$2/*"
                mv -f ${WORKSHOP_DIR}/content/$GAME_ID/$2/* "${MODS_DIR}/@$2"
                rm -d ${WORKSHOP_DIR}/content/$GAME_ID/$2
                # Make the mods contents all lowercase
                ModsLowercase "${MODS_DIR}/@$2"
                # Move any .bikey's to the keys directory
                echo -e "\tMoving any mod ${CYAN}.bikey${NC} files to the ${CYAN}${CONFIG_DIR}/keys/${NC} folder..."
                find "${MODS_DIR}/@$2" -name "*.bikey" -type f -exec cp {} ${CONFIG_DIR}/keys \;
                echo -e "${GREEN}[UPDATE]: Mod download/update successful!${NC}"
            fi
            break
        fi
        if [ $updateAttempt -eq $STEAMCMD_ATTEMPTS ]; then # Notify if failed last attempt
            if [ $1 -eq 0 ]; then # Server
                echo -e "\t${RED}Final attempt made! ${YELLOW}Unable to complete game server update. ${CYAN}Skipping...${NC}"
                echo -e "\t(Please try again at a later time)"
                sleep 3
            else # Mod
                echo -e "\t${RED}Final attempt made! ${YELLOW}Unable to complete mod download/update. ${CYAN}Skipping...${NC}"
                echo -e "\t(You may try again later, or manually upload this mod to your server via SFTP)"
                sleep 3
            fi
        fi
    done
}

# Takes a directory (string) as input, and recursively makes all files & folders lowercase.
ModsLowercase() {
    echo -e "\n\tMaking mod ${CYAN}$1${NC} files/folders lowercase..."
    find ./$1 -depth | while read SRC; do
        DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
        if [ "${SRC}" != "${DST}" ]; then
            [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}"
        fi
    done
}

# Removes duplicate items from a semicolon delimited string
RemoveDuplicates() {
    if [ -n "$1" ]; then
        echo $1 | sed -e 's/;/\n/g' | sort -u | xargs printf '%s;'
    fi
}

## === ENTRYPOINT START ===

# Create required directories
mkdir -p battleye keys serverprofile mods mpmissions
chmod 755 battleye keys serverprofile mods mpmissions

# Wait for the container to fully initialize
sleep 1


# Switch to the container's working directory
cd /home/container || exit 1

# Process mod string to proper format
if [ -n "${MODIFICATIONS}" ]; then
    # Strip existing @ symbols and spaces, replace commas with semicolons
    CLEAN_MODS=$(echo "${MODIFICATIONS}" | tr -d ' ' | sed 's/@//g' | tr ',' ';')
    # Add @ to each number
    CLIENT_MODS=$(echo $CLEAN_MODS | sed 's/[;]/;@/g')
    CLIENT_MODS="@${CLIENT_MODS}"
    # Remove trailing semicolon and any empty segments
    CLIENT_MODS=$(echo $CLIENT_MODS | sed 's/;$//' | sed 's/;@$//' | sed 's/^@;//')
else
    CLIENT_MODS=""
fi

# Process server mods the same way
if [ -n "${SERVERMODS}" ]; then
    CLEAN_MODS=$(echo "${SERVERMODS}" | tr -d ' ' | sed 's/@//g' | tr ',' ';')
    SERVERMODS=$(echo $CLEAN_MODS | sed 's/[;]/;@/g')
    SERVERMODS="@${SERVERMODS}"
    # Remove trailing semicolon and any empty segments
    SERVERMODS=$(echo $SERVERMODS | sed 's/;$//' | sed 's/;@$//' | sed 's/^@;//')
else
    SERVERMODS=""
fi

# If the mod list file exists and is valid, parse and add mods to the client-side mods list
if [ -f "${MOD_FILE}" ] && [ -n "$(cat ${MOD_FILE} | grep 'Created by DayZ Launcher')" ]; then
    CLIENT_MODS+=$(cat ${MOD_FILE} | grep 'id=' | cut -d'=' -f3 | cut -d'"' -f1 | xargs printf '@%s;')
elif [ -n "${MOD_FILE}" ]; then # If MOD_FILE is not null, warn user file is missing or invalid
    echo -e "\n${YELLOW}[STARTUP_WARN]: DayZ Modlist file \"${CYAN}${MOD_FILE}${YELLOW}\" could not be found, or is invalid!${NC}"
    echo -e "\tEnsure your uploaded modlist's file name matches your Startup Parameter."
    echo -e "\tOnly files exported from a DayZ Launcher are permitted."
    if [ -n "${CLIENT_MODS}" ]; then
        echo -e "\t${CYAN}Reverting to the manual mod list...${NC}"
    fi
fi
# Add server mods to the master mods list, while checking for trailing semicolon
if [ -n "${SERVERMODS}" ] && [ "${SERVERMODS}" != *\; ]; then
    allMods="${SERVERMODS};"
else
    allMods=${SERVERMODS}
fi
allMods+=$CLIENT_MODS # Add all client-side mods to the master mod list
CLIENT_MODS=$(RemoveDuplicates ${CLIENT_MODS}) # Remove duplicate mods from CLIENT_MODS, if present
allMods=$(RemoveDuplicates ${allMods}) # Remove duplicate mods from allMods, if present
allMods=$(echo $allMods | sed -e 's/;/ /g') # Convert from string to array

# Update everything (server and mods), if specified
if [ "${UPDATE_SERVER}" -eq 1 ]; then
    echo -e "\n${GREEN}[STARTUP]: ${CYAN}Starting checks for all updates...${NC}"
    echo -e "(It is okay to ignore any \"SDL\" and \"thread priority\" errors during this process)\n"
    
    ## Update game server
    echo -e "${GREEN}[UPDATE]:${NC} Checking for game server updates with App ID: ${CYAN}${STEAMCMD_APPID}${NC}..."
    
    if [ "${VALIDATE_SERVER}" -eq 1 ]; then # Validate will be added as a parameter if specified
        echo -e "\t${CYAN}File validation enabled.${NC} (This may take extra time to complete)"
        validateServer="validate"
    else
        validateServer=""
    fi
    
    # Determine what extra flags should be set
    if [ -n "${STEAMCMD_EXTRA_FLAGS}" ]; then
        echo -e "\t(${YELLOW}Advanced${NC}) Extra SteamCMD flags specified: ${CYAN}${STEAMCMD_EXTRA_FLAGS}${NC}\n"
        extraFlags=${STEAMCMD_EXTRA_FLAGS}
    else
        echo -e ""
        extraFlags=""
    fi
    
    RunSteamCMD 0 ${STEAMCMD_APPID}
    
    ## Update mods
    if [ -n "$allMods" ] && [ "${DISABLE_MOD_UPDATES}" -ne 1 ]; then
        echo -e "\n${GREEN}[UPDATE]:${NC} Checking all ${CYAN}Steam Workshop mods${NC} for updates..."
        for modID in $(echo $allMods | sed -e 's/@//g')
        do
            if [[ $modID =~ ^[0-9]+$ ]]; then # Only check mods that are in ID-form
                # Create mod directory if it doesn't exist
                mkdir -p "${MODS_DIR}/@${modID}"
                
                # Get mod's latest update in epoch time from its Steam Workshop changelog page
                latestUpdate=$(curl -sL https://steamcommunity.com/sharedfiles/filedetails/changelog/$modID | grep '<p id=' | head -1 | cut -d'"' -f2)
                
                # Get current mod timestamp or use 0 if directory is empty/new
                currentTime=$(find "${MODS_DIR}/@${modID}" -type f -exec stat -c %Y {} + 2>/dev/null | sort -nr | head -n1)
                if [ -z "$currentTime" ]; then
                    currentTime=0
                fi
                
                # Check if update needed
                if [ "$currentTime" -eq 0 ] || [ -n "$latestUpdate" ] && [ "$latestUpdate" -gt "$currentTime" ]; then
                    # Get the mod's name
                    modName=$(curl -sL https://steamcommunity.com/sharedfiles/filedetails/changelog/$modID | grep 'workshopItemTitle' | cut -d'>' -f2 | cut -d'<' -f1)
                    if [ -z "$modName" ]; then
                        modName="[NAME UNAVAILABLE]"
                    fi
                    
                    if [ "$currentTime" -eq 0 ]; then
                        echo -e "\n${GREEN}[UPDATE]:${NC} Downloading new Mod: \"${CYAN}${modName}${NC}\" (${CYAN}${modID}${NC})"
                    else
                        echo -e "\n${GREEN}[UPDATE]:${NC} Mod update found for: \"${CYAN}${modName}${NC}\" (${CYAN}${modID}${NC})"
                    fi
                    
                    # Clear cache and download
                    rm -f "${WORKSHOP_DIR}/appworkshop_${GAME_ID}.acf"
                    RunSteamCMD 1 $modID
                fi
            fi
        done
        echo -e "${GREEN}[UPDATE]:${NC} Steam Workshop mod update check ${GREEN}complete${NC}!"
    fi
fi

# Check if specified server binary exists.
if [ ! -f ./${SERVER_BINARY} ]; then
    echo -e "\n${RED}[STARTUP_ERR]: Specified DayZ server binary could not be found in the root directory!${NC}"
    echo -e "${YELLOW}Please do the following to resolve this issue:${NC}"
    echo -e "\t${CYAN}- Double check your \"Server Binary\" Startup Variable is correct.${NC}"
    echo -e "\t${CYAN}- Ensure your server has properly installed/updated without errors (reinstalling/updating again may help).${NC}"
    echo -e "\t${CYAN}- Use the File Manager to check that your specified server binary file is not missing from the root directory.${NC}\n"
    exit 1
fi

# Make mods lowercase, if specified
if [ "${MODS_LOWERCASE}" -eq 1 ]; then
    for modDir in $allMods
    do
        ModsLowercase $modDir
    done
fi

# Modify startup command to reference mods directory
CLIENT_MODS=$(echo $CLIENT_MODS | sed "s|@|${MODS_DIR}/@|g")
SERVERMODS=$(echo $SERVERMODS | sed "s|@|${MODS_DIR}/@|g")

# Setup NSS Wrapper for use ($NSS_WRAPPER_PASSWD and $NSS_WRAPPER_GROUP have been set by the Dockerfile)
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
envsubst < /passwd.template > ${NSS_WRAPPER_PASSWD}
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libnss_wrapper.so

# Replace Startup Variables
modifiedStartup=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Start the Server
echo -e "\n${GREEN}[STARTUP]:${NC} Starting server with the following startup command:"
echo -e "${CYAN}${modifiedStartup}${NC}\n"
${modifiedStartup}

if [ $? -ne 0 ]; then
    echo -e "\n${RED}[STARTUP_ERR]: There was an error while attempting to run the start command.${NC}\n"
    exit 1
fi
