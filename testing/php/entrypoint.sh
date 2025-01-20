#!/bin/bash
cd /home/container

# Output startup information
echo "Starting PHP Application..."
echo "Running on PHP version: $(php -v | head -n 1)"

# Make sure the directory exists and has correct permissions
mkdir -p /home/container/tmp
chmod 777 /home/container/tmp

# Install/update dependencies if composer.json exists
if [ -f "composer.json" ]; then
    echo "Installing dependencies..."
    composer install --no-dev --optimize-autoloader
fi

# Default the port to 8080 if not set
if [ -z "$SERVER_PORT" ]; then
    SERVER_PORT=8080
fi

# Replace variables in .env file if it exists
if [ -f ".env" ]; then
    echo "Configuring environment..."
    sed -i "s#APP_URL=.*#APP_URL=http://0.0.0.0:${SERVER_PORT}#" .env
fi

# Start PHP built-in server
echo "Starting PHP server on port ${SERVER_PORT}..."
exec php -S "0.0.0.0:${SERVER_PORT}" -t public