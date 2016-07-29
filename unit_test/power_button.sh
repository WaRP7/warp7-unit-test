#!/bin/sh
#WaRP7 User Button Test

echo "Running power button test, press CTRL+C to exit"
echo "Press button below camera module on WaRP7 daughter card to trigger event"

evtest /dev/input/event2

