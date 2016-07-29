#!/bin/sh

#  Warp7 - Battery Charger BC3770
#  This script tests if the battery is connected or not.
#  Diego Dorta diego.dorta@nxp.com

COMMAND="i2cget -y 0 0x49 0x06"
TEXT="Charging Status:"
OFF="0x00"
ON="0x02"

clear
printf "\t\033[7m# BATTERY CHARGER TEST #\033[0m\n"
echo
echo
printf "Press CTRL + c to exit\n"
echo
echo

while true
do
	sleep 1

	$COMMAND > output
	x="$(cat output)"

	if [ "$x" == "$OFF" ];
	then
		status="Off"
		printf "\033[1A\033[K"
		printf "$TEXT $status\n"

	elif [ "$x" == "$ON" ];
	then
		status="On"
		printf "\033[1A\033[K"
		printf "$TEXT $status\n"

	else
		status="Error"
		printf "\033[1A\033[K"
		printf "$TEXT $status\n"

	fi
done
