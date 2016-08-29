# arch-maintenance
Bash scripts to help run tasks on arch linux systems.

pac_update.sh will update the repository, system and packages. Check for orphaned packages, check for broken symlinks, check for failed systemd services and display journalctl log.

update_db.sh will update the local file database, alert when the file system usage surpasses a defined limit, display the hostname information, display file system usage, display free and used memory in the system, display system uptime and load, display logged in users and display top 5 processes as far as memory usage is concerned.

scanclam.sh is a user interactive script written to update the virus definitions and scan the directory or files specified using clamav. Log files will be placed in /home/$USER/clamav/log/ and this directory will be created if it doesn't exist. If quarantine is selected then infected files will placed in /home/$USER/clamav/quarantine and this directory will also be created if it doesn't exist. There is also an option to remove infected files, use this option with caution!
