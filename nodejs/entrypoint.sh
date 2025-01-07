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

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
