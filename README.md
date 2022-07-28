Speak Friend

by Nick Orozco

rev 7/27/22 

This script attempts to connect to wifi using info placed on a usb drive.

It is intended to be run at boot so that a device can connect to a network without having to first access the cli via serial connection or attached monitor and keyboard.

Place the script whereever you do your thang and then add it to the crontab like so:

  @reboot /path/to/speakfriend.sh
  
fin
