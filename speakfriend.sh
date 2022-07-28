#!/bin/bash          _      __     _             _ 
#  ____ __  ___ __ _| |__  / _|_ _(_)___ _ _  __| |
# (_-< '_ \/ -_) _` | / / |  _| '_| / -_) ' \/ _` |
# /__/ .__/\___\__,_|_\_\ |_| |_| |_\___|_||_\__,_|
#    |_|                                           
# rev 7/27/22          

# Mount usb volume
if ! mount /dev/sda1 /mnt/usb ; then
	exit
fi

# Check for wifi info file
if ! test -f /mnt/usb/wifi.txt ; then
	echo $(date "+%D %T") Data file is either missing, or corrupt. >> /var/log/speakeasy.log
	exit
fi

# Read wifi info file
SSID=$(head -n1 /mnt/usb/wifi.txt)
WKEY=$(tail -n1 /mnt/usb/wifi.txt)

# Check for wifi info
if [[ "$SSID" == "" || "$WKEY" == "" ]]
	echo $(date "+%D %T") Data file is either empty or incomplete. >> /var/log/speakeasy.log
	exit
fi

# Connect to wifi
sudo nmcli dev wifi connect $SSID password $WKEY >> /var/log/speakeasy.log
