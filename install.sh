#!/usr/bin/bash

# install modules
sudo apt install --no-install-recommends dkms libdw-dev clang lld llvm

# Add Ca
wget -qO - https://github.com/MineLarx/Xanmod/raw/refs/heads/master/archive.key | sudo gpg --dearmor -vo /etc/apt/keyrings/xanmod-archive-keyring.gpg

# Add Sources
echo "deb [signed-by=/etc/apt/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/xanmod-release.list

# Apt Update
sudo apt update

# ABI Check
wget -qO https://github.com/MineLarx/Xanmod/raw/refs/heads/master/check_x86-64_psabi.sh | chmod +x check_x86-64_psabi.sh && ./check_x86-64_psabi.sh
