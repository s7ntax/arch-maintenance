#!/bin/bash
#
# SCRIPT:	pac_update.sh
# AUTHOR:	s7ntax
# DATE:		20-02-2016
# REV:		1.1.A
# PLATFORM:	arch Linux
#
# PURPOSE:	This script will update the pacman repository and all installed packages
# 		remove unused (orphan) packages, write a list of installed packages to
# 		file, check for broken symlinks, check for failed systemd services and
# 		display journalctl log.
#

# Update pacman repository and update packages

echo -e "\e[30;48;5;10m***** UPDATING PACMAN REPOSITORY AND PACKAGES *****\e[0m"
sudo pacman -Syyu
echo ""

# Pruning the pacman cache

echo -e "\e[30;48;5;10m***** PRUNING THE PACKAGE CACHE *****\e[0m"
sudo paccache -r
echo ""

# Remove orphan packages

echo -e "\e[30;48;5;10m***** REMOVING UNUSED PACKAGES (ORPHANS) *****\e[0m"
sudo pacman -Rns $(pacman -Qtdq)
echo ""

# Writing installed package lists to file: ~/Documents/Sysinfo/

echo -e "\e[30;48;5;10m***** WRITING INSTALLED PACKAGE LISTS TO FILE *****\e[0m"
sudo pacman -Qe >| ~/documents/sysinfo/packagesQe.txt
sudo pacman -Qe >| /mnt/2tb_hd/Backup/arch/sysinfo/packagesQe.txt
sudo pacman -Qn >| ~/documents/sysinfo/packagesQn.txt
sudo pacman -Qn >| /mnt/2tb_hd/Backup/arch/sysinfo/packagesQn.txt
echo -e "\e[1;10mDone.\e[0m"
echo ""

# Check for broken symlinks

echo -e "\e[30;48;5;10m***** CHECKING FOR BROKEN SYMLINKS *****\e[0m"
find . -type l -! -exec test -e {} \; -print
echo -e "\e[1;10mDone.\e[0m"
echo ""

# Display active failed systemd services

echo -e "\e[30;48;5;10m***** FAILED ACTIVE SYSTEMD SERVICES *****\e[0m"
systemctl --failed
echo ""

# Display failed systemd services including inactive

echo -e "\e[30;48;5;10m***** ALL FAILED SYSTEMD SERVICES *****\e[0m"
systemctl --failed --all
echo ""

# Display journalctl log

echo -e "\e[30;48;5;10m***** JOURNALCTL LOG *****\e[0m"
journalctl -p 3 -xb
echo ""
echo -e "\e[1;10mDone.\e[0m"
