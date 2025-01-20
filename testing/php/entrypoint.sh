#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes
export INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')

# Output Current PHP Version
php -v

# Start Apache
apache2ctl start

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
exec env ${MODIFIED_STARTUP}