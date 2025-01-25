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
echo -e "${WHITE} _____                                                       _____ ${NC}"
echo -e "${WHITE}( ___ )                                                     ( ___ )${NC}"
echo -e "${WHITE} |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ${NC}"
echo -e "${WHITE} |   |  ▄▄▄· ▄· ▄▌▄▄▄▄▄ ▄ .▄       ▐ ▄     ▄▄▄ . ▄▄ •  ▄▄ •  |   | ${NC}"
echo -e "${WHITE} |   | ▐█ ▄█▐█▪██▌•██  ██▪▐█▪     •█▌▐█    ▀▄.▀·▐█ ▀ ▪▐█ ▀ ▪ |   | ${NC}"
echo -e "${WHITE} |   |  ██▀·▐█▌▐█▪ ▐█.▪██▀▐█ ▄█▀▄ ▐█▐▐▌    ▐▀▀▪▄▄█ ▀█▄▄█ ▀█▄ |   | ${NC}"
echo -e "${WHITE} |   | ▐█▪·• ▐█▀·. ▐█▌·██▌▐▀▐█▌.▐▌██▐█▌    ▐█▄▄▌▐█▄▪▐█▐█▄▪▐█ |   | ${NC}"
echo -e "${WHITE} |   | .▀     ▀ •  ▀▀▀ ▀▀▀ · ▀█▄▀▪▀▀ █▪     ▀▀▀ ·▀▀▀▀ ·▀▀▀▀  |   | ${NC}"
echo -e "${WHITE} |   |${YELLOW} by that411guy ${WHITE}                                                       ${WHITE}|   | ${NC}"
echo -e "${WHITE} |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ${NC}"
echo -e "${WHITE}(_____)                                                     (_____)${NC}"
echo -e "${GREEN} Current timezone:${WHITE} $TZ ${GREEN} Current Time: ${WHITE}$(date '+%A, %B %d, %Y %I:%M %p')"${NC}
# Print Python Version
python --version

# Handle Git operations only if USER_UPLOAD is not enabled
if [ "${USER_UPLOAD}" != "1" ] && [ -n "$GIT_ADDRESS" ] && [ "${AUTO_UPDATE}" == "1" ]; then
    # Add .git extension if missing
    [[ ${GIT_ADDRESS} != *.git ]] && GIT_ADDRESS=${GIT_ADDRESS}.git
    
    # Handle authentication
    if [ -n "${USERNAME}" ] && [ -n "${ACCESS_TOKEN}" ]; then
        GIT_ADDRESS="https://${USERNAME}:${ACCESS_TOKEN}@${GIT_ADDRESS#https://}"
    fi
    
    # Check if directory is empty
    if [ -z "$(ls -A /home/container)" ]; then
        echo "Directory is empty, cloning repository..."
        git clone "$GIT_ADDRESS" --branch="${BRANCH}" .
    elif [ -d .git ]; then
        echo "Repository exists, checking for updates..."
        # Store current commit hash
        OLD_COMMIT=$(git rev-parse HEAD)
        
        # Fetch and update
        git fetch origin "${BRANCH:-$(git rev-parse --abbrev-ref HEAD)}"
        git reset --hard origin/"${BRANCH:-$(git rev-parse --abbrev-ref HEAD)}"
        git clean -df
        
        # Show what changed
        NEW_COMMIT=$(git rev-parse HEAD)
        if [ "$OLD_COMMIT" != "$NEW_COMMIT" ]; then
            echo "Updates found! Changes:"
            git diff --stat --color $OLD_COMMIT..$NEW_COMMIT | sed 's/^/  /'
            echo "Updated from $OLD_COMMIT to $NEW_COMMIT"
        else
            echo "Already up to date!"
        fi
    else
        echo "Directory not empty and no git repository found."
    fi
fi

# Install pip requirements if they exist
if [ -f "requirements.txt" ]; then
    python -m pip install -r requirements.txt
fi

# Install additional packages if specified
if [ -n "$PIP_PACKAGES" ]; then
    python -m pip install $PIP_PACKAGES
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
