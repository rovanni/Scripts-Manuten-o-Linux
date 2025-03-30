
### English Version of the Script (`update_system_en.sh`):
#!/bin/bash
### BEGIN INIT INFO
# Provides:          update_system_en.sh
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: System updater
# Description:       Full system upgrade, clean packages, update Snap/ClamAV.
### END INIT INFO

# Created by: Luciano R.N.

function pause(){
    ###################################################################
    # Function to pause script execution
    ###################################################################
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
}

clear
echo
echo "Updating system..."
echo

# Update package database before cleaning
echo "Updating package database..."
sudo apt-get update
echo "Package database updated. ✅"
sleep 1

# Clean package cache
echo "Cleaning package cache..."
sudo apt-get clean -y
echo "Cache cleaned. ✅"
sleep 1

# Fix broken packages
echo "Fixing dependency issues..."
sudo apt-get install -f -y
sudo dpkg --configure -a
sudo apt --fix-broken install
echo "Dependency issues fixed. ✅"
sleep 1

# Upgrade system packages
echo "Downloading and installing updates..."
sudo apt-get upgrade -y
echo "Updates installed. ✅"
sleep 1

# Upgrade distribution
echo "Downloading and installing distribution updates..."
sudo apt-get dist-upgrade -y
echo "Distribution updates installed. ✅"
sleep 1

# Remove old/unnecessary packages
echo "Removing old and unnecessary packages..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y
echo "Packages removed. ✅"
sleep 1

# Update Snap
echo "Updating Snap Store and Snap applications..."
sudo killall snap-store
sudo snap refresh
echo "Snap updates completed. ✅"
sleep 1

# Update ClamAV
echo "Updating ClamAV database..."
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam
echo "ClamAV database updated. ✅"
sleep 1

echo "Update completed!"
pause
exit 0