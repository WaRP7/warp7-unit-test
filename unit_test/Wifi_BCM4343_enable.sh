#!/bin/sh
#WaRP7 Wi-Fi Enablement Script
FILE=/lib/modules/$(uname -r)/kernel/drivers/net/wireless/bcmdhd/bcmdhd.ko
if [ -f $FILE ];
then
        modprobe bcmdhd
        ifconfig wlan0 up
        echo "Enter the network name (SSID)"
        read SSID
        echo "Type the passphrase for the network and hit enter"
        read PSW
        wpa_passphrase $SSID $PSW  > /etc/wpa_supplicant.conf
        cat /etc/wpasupplicant.conf
        wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf -D nl80211 &
        wait
        udhcpc -i wlan0
        echo "You can now use the ping command to test your connection"
else
        echo "bcmdhd.ko module file not found"
fi

