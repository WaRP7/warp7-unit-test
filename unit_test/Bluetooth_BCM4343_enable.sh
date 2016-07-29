#!/bin/sh
#WaRP7 Bluetooth Enable Script

#Reset
echo 145 > /sys/class/gpio/export 
echo out > /sys/class/gpio/gpio145/direction 
echo 0 > /sys/class/gpio/gpio145/value 
echo 1 > /sys/class/gpio/gpio145/value

#Load Firmware
hciattach ttymxc2 bcm43xx 3000000 flow -t 20

#Start Bluetooth device
hci0 up
hci0 piscan
hciconfig -a
hcitool dev

