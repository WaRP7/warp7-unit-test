#!/bin/sh
#WaRP7 User Button Test

echo "Running user button test, press CTRL+C to exit"
echo "Press middle button on WaRP7 daughter card to trigger event"

evtest /dev/input/event4


