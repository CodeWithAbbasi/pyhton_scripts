#!/bin/bash

# ProtonVPN Installer for Kali Linux
# Tested on Kali Linux Rolling (Debian-based)

set -e

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] Updating system...${NC}"
sudo apt update && sudo apt upgrade -y

echo -e "${GREEN}[+] Installing dependencies...${NC}"
sudo apt install -y openvpn dialog python3-pip wireguard resolvconf

echo -e "${GREEN}[+] Installing ProtonVPN CLI...${NC}"
pip3 install --upgrade protonvpn-cli

echo -e "${GREEN}[+] ProtonVPN CLI installed.${NC}"
echo -e "${GREEN}[!] You may need to log out and log back in to apply group membership changes.${NC}"

echo -e "${GREEN}[+] Running initial ProtonVPN CLI setup...${NC}"
sudo protonvpn init

echo -e "${GREEN}[✓] Installation complete. You can now log in with:${NC} protonvpn login"
