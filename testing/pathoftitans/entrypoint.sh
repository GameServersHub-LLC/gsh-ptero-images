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

## Setup core dumps
echo -e "${YELLOW}Setting up core dumps folder${NC}"

# Try multiple locations for core dumps (Pterodactyl-friendly)
CORE_DUMP_DIRS=(
    "/home/container/coredumps"
    "/home/container/.coredumps" 
    "/tmp/coredumps"
    "/coredumps"
)

CORE_DUMP_DIR=""
for dir in "${CORE_DUMP_DIRS[@]}"; do
    echo -e "${CYAN}Trying core dump directory: $dir${NC}"
    if mkdir -p "$dir" 2>/dev/null && [ -w "$dir" ]; then
        CORE_DUMP_DIR="$dir"
        echo -e "${GREEN}✓ Using writable directory: $CORE_DUMP_DIR${NC}"
        break
    else
        echo -e "${YELLOW}⚠ Cannot use $dir (not writable or creation failed)${NC}"
    fi
done

if [ -z "$CORE_DUMP_DIR" ]; then
    echo -e "${RED}✗ No writable directory found for core dumps${NC}"
    echo -e "${YELLOW}Core dumps will be disabled${NC}"
    CORE_DUMPS_ENABLED=false
else
    echo -e "${GREEN}✓ Core dumps will be saved to: $CORE_DUMP_DIR${NC}"
    CORE_DUMPS_ENABLED=true
fi

if [ "$CORE_DUMPS_ENABLED" = true ]; then
    echo -e "${YELLOW}Setting up core pattern settings${NC}"
    # Try to configure sysctl settings, handle read-only filesystem gracefully
    if echo 'kernel.core_uses_pid=1' > /etc/sysctl.d/60-core-pattern.conf 2>/dev/null && \
       echo "kernel.core_pattern=$CORE_DUMP_DIR/core-%e-%s-%u-%g-%p-%t" >> /etc/sysctl.d/60-core-pattern.conf 2>/dev/null; then
        echo -e "${GREEN}✓ Core pattern configuration file created${NC}"
        # Apply sysctl settings
        if sysctl -p /etc/sysctl.d/60-core-pattern.conf 2>/dev/null; then
            echo -e "${GREEN}✓ Core pattern settings applied${NC}"
        else
            echo -e "${YELLOW}⚠ Core pattern settings configured but not applied (requires elevated privileges)${NC}"
        fi
    else
        echo -e "${YELLOW}⚠ Cannot write sysctl configuration (read-only filesystem or no permissions)${NC}"
        echo -e "${YELLOW}  Attempting to apply settings directly...${NC}"
        # Try to apply settings directly without writing to file
        if sysctl -w kernel.core_uses_pid=1 2>/dev/null && \
           sysctl -w "kernel.core_pattern=$CORE_DUMP_DIR/core-%e-%s-%u-%g-%p-%t" 2>/dev/null; then
            echo -e "${GREEN}✓ Core pattern settings applied directly${NC}"
        else
            echo -e "${YELLOW}⚠ Cannot apply core pattern settings - limited permissions in Pterodactyl${NC}"
            echo -e "${YELLOW}  Automatic crash dumps may not work, but gcore will still function${NC}"
        fi
    fi
else
    echo -e "${YELLOW}Skipping core pattern setup - no writable directory available${NC}"
fi

# Set unlimited core dump size
ulimit -c unlimited

# Disable Ubuntu's crash reporting if apport exists
if command -v systemctl >/dev/null 2>&1; then
    systemctl stop apport 2>/dev/null || true
    systemctl disable apport 2>/dev/null || true
elif [ -f /etc/default/apport ]; then
    echo 'enabled=0' > /etc/default/apport
fi

if [ "$CORE_DUMPS_ENABLED" = true ]; then
    echo -e "${GREEN}Core dumps configured - dumps will be saved to $CORE_DUMP_DIR${NC}"
    echo -e "${YELLOW}Note: Running in Pterodactyl with limited permissions${NC}"
    echo -e "${YELLOW}Automatic crash dumps may be limited, but gcore will work${NC}"
else
    echo -e "${RED}Core dumps disabled - no writable directory available${NC}"
fi
echo ""
echo -e "${CYAN}=== ON-DEMAND CORE DUMP FUNCTIONALITY ===${NC}"
if command -v gcore >/dev/null 2>&1 && [ "$CORE_DUMPS_ENABLED" = true ]; then
    echo -e "${GREEN}✓ gcore is available for on-demand core dumps${NC}"
    echo -e "${GREEN}You can generate core dumps of the running server using:${NC}"
    echo -e "${YELLOW}Method 1 - Signal (in Pterodactyl console):${NC}"
    echo -e "${WHITE}  Enter: kill -SIGUSR1 \$(pgrep -f PathOfTitansServer)${NC}"
    echo -e "${YELLOW}Method 2 - File trigger:${NC} touch $CORE_DUMP_DIR/trigger_core_dump"
    echo -e "${WHITE}Generated files will be named: manual_core_YYYYMMDD_HHMMSS.<pid>${NC}"
    echo -e "${WHITE}Core dumps will be saved to: $CORE_DUMP_DIR${NC}"
elif [ "$CORE_DUMPS_ENABLED" != true ]; then
    echo -e "${RED}✗ Core dumps disabled - no writable directory available${NC}"
else
    echo -e "${RED}✗ Warning: gcore not found - on-demand core dumps disabled${NC}"
fi
echo -e "${CYAN}=========================================${NC}"

# Add error handling
set -e
trap 'echo -e "${RED}Script failed at line $LINENO${NC}"' ERR

# Add cleanup function for graceful shutdown
cleanup() {
    echo -e "${YELLOW}Received shutdown signal, gracefully stopping server...${NC}"
    pkill -TERM PathOfTitansServer 2>/dev/null || true
    sleep 5
    pkill -KILL PathOfTitansServer 2>/dev/null || true
    exit 0
}

# Function to generate core dump on demand using gcore
generate_core_dump() {
    echo -e "${CYAN}=== GENERATING CORE DUMP ON DEMAND ===${NC}"
    
    # Check if gcore is available
    if ! command -v gcore >/dev/null 2>&1; then
        echo -e "${RED}Error: gcore command not found${NC}"
        echo -e "${YELLOW}gcore is required for on-demand core dumps${NC}"
        return 1
    fi
    
    # Find the Path of Titans server process
    POT_PID=$(pgrep -f "PathOfTitansServer-Linux-Shipping" | head -n1)
    
    if [ -z "$POT_PID" ]; then
        echo -e "${RED}Error: Path of Titans server process not found${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}Found Path of Titans server with PID: $POT_PID${NC}"
    
    # Generate timestamp for unique filename
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    CORE_PREFIX="manual_core_${TIMESTAMP}"
    
    # Check if core dumps are enabled and directory is available
    if [ "$CORE_DUMPS_ENABLED" != true ] || [ ! -w "$CORE_DUMP_DIR" ]; then
        echo -e "${RED}Error: Core dumps are not available${NC}"
        echo -e "${YELLOW}No writable directory found during startup${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}Generating core dump using gcore...${NC}"
    echo -e "${YELLOW}Output will be: $CORE_DUMP_DIR/${CORE_PREFIX}.$POT_PID${NC}"
    
    # Use gcore with -a flag to dump all memory mappings
    if gcore -a -o "$CORE_DUMP_DIR/${CORE_PREFIX}" "$POT_PID" 2>&1; then
        echo -e "${GREEN}Core dump generated successfully!${NC}"
        
        # Show the generated file info
        if [ -f "$CORE_DUMP_DIR/${CORE_PREFIX}.$POT_PID" ]; then
            echo -e "${CYAN}Core dump details:${NC}"
            ls -lah "$CORE_DUMP_DIR/${CORE_PREFIX}.$POT_PID"
            echo -e "${YELLOW}File size: $(du -h "$CORE_DUMP_DIR/${CORE_PREFIX}.$POT_PID" | cut -f1)${NC}"
        fi
    else
        echo -e "${RED}Failed to generate core dump${NC}"
        return 1
    fi
    
    echo -e "${CYAN}=================================${NC}"
}

# Signal handler for manual core dump generation (SIGUSR1)
handle_core_dump_signal() {
    echo -e "${CYAN}Received SIGUSR1 - generating core dump...${NC}"
    generate_core_dump
}

# Trap signals for graceful shutdown and core dump generation
trap cleanup SIGTERM SIGINT
trap handle_core_dump_signal SIGUSR1

# Validate required environment variables
echo -e "${YELLOW}Validating environment variables...${NC}"
required_vars=("STARTUP" "RCON_PORT" "RCON_PASSWORD")
missing_vars=()

for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        missing_vars+=("$var")
    fi
done

if [ ${#missing_vars[@]} -ne 0 ]; then
    echo -e "${RED}ERROR: Missing required environment variables: ${missing_vars[*]}${NC}"
    echo -e "${YELLOW}Please ensure these variables are set in your container environment${NC}"
    exit 1
fi

echo -e "${GREEN}Environment validation passed${NC}"

# Display container information
echo -e "${CYAN}=== Container Information ===${NC}"
echo -e "${CYAN}Hostname:${WHITE} $(hostname)${NC}"
echo -e "${CYAN}Internal IP:${WHITE} $INTERNAL_IP${NC}"
echo -e "${CYAN}RCON Port:${WHITE} $RCON_PORT${NC}"
echo -e "${CYAN}Beta Branch:${WHITE} ${BETA_BRANCH:-"default"}${NC}"
echo -e "${CYAN}Auto Update:${WHITE} ${AUTO_UPDATE:-"1"}${NC}"
echo -e "${CYAN}================================${NC}"

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

# RCON loop with command-line arguments for address and password
(while read cmd; do
    rcon -s -a "localhost:$RCON_PORT" -p "$RCON_PASSWORD" "$cmd"
done) < /dev/stdin &

# Background monitor for core dump trigger file (only if core dumps are enabled)
if [ "$CORE_DUMPS_ENABLED" = true ]; then
    (while true; do
        if [ -f "$CORE_DUMP_DIR/trigger_core_dump" ]; then
            echo -e "${CYAN}Core dump trigger file detected, generating core dump...${NC}"
            generate_core_dump
            # Remove the trigger file after processing
            rm -f "$CORE_DUMP_DIR/trigger_core_dump"
        fi
        sleep 5
    done) &
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Log server startup
echo -e "${GREEN}Starting Path of Titans Server...${NC}"
echo -e "${YELLOW}Command: ${MODIFIED_STARTUP}${NC}"

# Temporarily disable error exit for server execution
set +e

# Run the Server
eval ${MODIFIED_STARTUP}

# Capture exit code
SERVER_EXIT_CODE=$?

# Log server shutdown
echo -e "${YELLOW}Server process ended with exit code: $SERVER_EXIT_CODE${NC}"

if [ $SERVER_EXIT_CODE -ne 0 ]; then
    echo -e "${RED}Server exited with error code $SERVER_EXIT_CODE${NC}"
    
    # Check for core dumps in the configured directory
    if [ "$CORE_DUMPS_ENABLED" = true ] && ls $CORE_DUMP_DIR/core-* 1> /dev/null 2>&1; then
        echo -e "${CYAN}=== CORE DUMPS FOUND ===${NC}"
        echo -e "${CYAN}Core dumps found in $CORE_DUMP_DIR:${NC}"
        ls -la $CORE_DUMP_DIR/core-*
        echo -e "${CYAN}========================${NC}"
        
        # Get the newest core dump for analysis
        NEWEST_CORE=$(ls -at $CORE_DUMP_DIR/core-* 2>/dev/null | head -n1)
        if [ -n "$NEWEST_CORE" ]; then
            echo -e "${YELLOW}Most recent core dump: $NEWEST_CORE${NC}"
            echo -e "${YELLOW}Core dump size: $(du -h "$NEWEST_CORE" | cut -f1)${NC}"
            echo -e "${YELLOW}Core dump timestamp: $(stat -c %y "$NEWEST_CORE")${NC}"
            
            # Try to get basic info from the core dump if gdb is available
            if command -v gdb >/dev/null 2>&1 && [ -f "/home/container/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping" ]; then
                echo -e "${CYAN}Attempting to extract stack trace from core dump...${NC}"
                timeout 30 gdb --batch --quiet -ex "thread apply all bt" -ex "quit" \
                    /home/container/PathOfTitans/Binaries/Linux/PathOfTitansServer-Linux-Shipping "$NEWEST_CORE" 2>/dev/null || \
                    echo -e "${YELLOW}Could not extract stack trace (this is normal if binary doesn't match core)${NC}"
            fi
        fi
    else
        echo -e "${YELLOW}No core dumps found${NC}"
        if [ "$CORE_DUMPS_ENABLED" = true ]; then
            echo -e "${YELLOW}Checked directory: $CORE_DUMP_DIR${NC}"
        else
            echo -e "${YELLOW}Core dumps were disabled during startup${NC}"
        fi
        echo -e "${YELLOW}Current ulimit -c setting: $(ulimit -c)${NC}"
        echo -e "${YELLOW}Core pattern: $(cat /proc/sys/kernel/core_pattern 2>/dev/null || echo 'Cannot read core pattern')${NC}"
    fi
    
    # Additional debugging information
    echo -e "${CYAN}=== DEBUGGING INFO ===${NC}"
    if [ "$CORE_DUMPS_ENABLED" = true ]; then
        echo -e "${CYAN}Available disk space in $CORE_DUMP_DIR:${NC}"
        df -h "$CORE_DUMP_DIR" 2>/dev/null || echo "Cannot check disk space"
    fi
    echo -e "${CYAN}Recent system messages (last 20 lines):${NC}"
    dmesg | tail -20 2>/dev/null || echo "Cannot access system messages"
    echo -e "${CYAN}===================${NC}"
fi

exit $SERVER_EXIT_CODE