————————————————————————————— 💻 DASHBOARD SCRIPT 💻 —————————————————————————————

Save the following as `dashboard.sh` and make it executable:

chmod +x dashboard.sh

Then run it live with:

watch -n 1 -c ./dashboard.sh

📜 CODE:

#!/bin/bash

# Clear screen
tput clear

# Colors
BOLD=$(tput bold)
RESET=$(tput sgr0)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
YELLOW=$(tput setaf 3)

# Title
tput cup 1 10; echo "${BOLD}${GREEN}🟢 SYSTEM DASHBOARD${RESET}"
tput cup 2 10; echo "${CYAN}---------------------${RESET}"

# Uptime
tput cup 4 5; echo -n "${BOLD}${CYAN}Uptime:        ${RESET}"
tput cup 4 21; uptime | awk '{print substr($0,1)}'

# CPU Load
tput cup 6 5; echo -n "${BOLD}${CYAN}CPU Load Avg:  ${RESET}"
tput cup 6 21; cat /proc/loadavg | awk '{print $1, $2, $3}'

# Memory Usage
tput cup 8 5; echo -n "${BOLD}${CYAN}Memory Usage:  ${RESET}"
tput cup 8 21; free -h | awk '/Mem:/ {printf "%s / %s", $3, $2}'

# Disk Usage
tput cup 10 5; echo -n "${BOLD}${CYAN}Disk Usage /:  ${RESET}"
tput cup 10 21; df -h / | awk 'NR==2 {print $3 " / " $2}'

# IP Address
tput cup 12 5; echo -n "${BOLD}${CYAN}IP Address:    ${RESET}"
tput cup 12 21; ip addr show | awk '/inet / && $NF != "lo" {print $2}' | head -n1

# System Time
tput cup 14 5; echo -n "${BOLD}${CYAN}System Time:   ${RESET}"
tput cup 14 21; date +"%Y-%m-%d %H:%M:%S"

# Footer
tput cup 16 10; echo "${YELLOW}Press Ctrl+C to exit.${RESET}"

————————————————————————————— 🔽 BONUS COMMANDS 🔽 —————————————————————————————

📊 Terminal Table View (Random values):
seq 1 5 | xargs -I{} bash -c 'echo "Row {} | Value $RANDOM"' | column -t -s '|'

🪵 Live Log Viewer (No Clutter):
journalctl -f -o cat

————————————————————————————— 🎯 SUPPORT THE CHANNEL 🎯 —————————————————————————————

If this helped you, please:
👍 Like  
🧠 Comment  
🔔 Subscribe for more CLI wisdom

Follow: @TheLinuxLighthouse
