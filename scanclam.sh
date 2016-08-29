#!/bin/bash
#
# SCRIPT:	scanclam.sh
# AUTHOR:	s7ntax
# DATE:		28-02-2016
# REV:		1.1.A
# PLATFORM:	arch Linux
#
# PURPOSE:	This script will update the virus definitions and scan the 
#		directory or files specified using clamav.
#
# Requesting user password for sudo

sudo sleep 1
echo ""
# Updating virus definitions

echo -e "\e[30;48;5;10m***** UPDATING VIRUS DEFINITIONS *****\e[0m"
echo ""
sudo freshclam
echo ""

# Ask user for the directory to scan

echo -n "Make a selection or type path ( / = system) ( h = home ) ( p = pwd ) ( x = exit ) > "
read -r dirscan

# Scanning directory recursive

if [ "$dirscan" = / ]
then
	sudo clamscan --recursive=yes --infected --exclude-dir='^/sys|^/proc|^/dev|^/lib|^/bin|^/sbin' / -l ~/documents/sysinfo/clamscan/log
	exit
elif [ "$dirscan" = h ]
then
		sudo clamscan --recursive=yes --infected ~/ -l ~/documents/sysinfo/clamscan/log
		exit
	elif [ "$dirscan" = p ]
	then
			sudo clamscan --recursive=yes --infected . -l ~/documents/sysinfo/clamscan/log
		elif [ "$dirscan" = x ]
		then
			exit
		else
			sudo clamscan --recursive=yes --infected "$dirscan" -l ~/documents/sysinfo/clamscan/log
			exit
fi
