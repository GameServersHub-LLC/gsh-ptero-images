#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Print Node.js Version
node -v

# Handle Git operations
if [ -n "$GIT_ADDRESS" ]; then
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
        echo "Repository exists, fetching updates..."
        git fetch origin "${BRANCH:-$(git rev-parse --abbrev-ref HEAD)}"
        git reset --hard origin/"${BRANCH:-$(git rev-parse --abbrev-ref HEAD)}"
        git clean -df
    else
        echo "Directory not empty and no git repository found."
    fi
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
