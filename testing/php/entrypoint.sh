#!/bin/bash
cd /home/container

# Output Current PHP Version
php -v

# Start Apache
apache2ctl start

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Add command listener
(
    while read line; do
        if [[ "$line" == "stop" ]]; then
            pkill -SIGTERM apache2
            break
        fi
        eval "$line"
    done
) &

# Run the Server
eval ${MODIFIED_STARTUP}