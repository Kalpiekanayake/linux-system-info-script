#!/bin/bash
# Linux System Info Script (with Colors)

# Define colors
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${CYAN}----------------------------------${RESET}"
echo -e "   🐧 ${YELLOW}Linux System Information${RESET}"
echo -e "${CYAN}----------------------------------${RESET}"

# Show hostname
echo -e "${GREEN}Hostname:${RESET} $(hostname)"

# Show uptime
echo -e "${GREEN}Uptime:${RESET} $(uptime -p)"

# Show current date & time
echo -e "${GREEN}Date & Time:${RESET} $(date)"

# Show system load
echo -e "${GREEN}System Load:${RESET} $(uptime | awk -F'load average:' '{ print $2 }')"

# Show memory usage
echo -e "${GREEN}Memory Usage:${RESET}"
free -h | awk '/Mem:/ {print "  Used: " $3 " / " $2}'

# Show disk usage
echo -e "${GREEN}Disk Usage:${RESET}"
df -h --total | grep 'total' | awk '{print "  Used: " $3 " / " $2 " (" $5 " used)"}'

# Show logged in users
echo -e "${GREEN}Logged in Users:${RESET}"
who | awk '{print "  " $1 " - " $5}'

echo -e "${CYAN}----------------------------------${RESET}"
echo -e " Script ${YELLOW}Completed ✅${RESET}"

