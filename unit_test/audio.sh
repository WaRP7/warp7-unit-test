#!/bin/sh

#  WaRP7 - Audio test
#  This script records and plays an audio file.
#  Vanessa Maegima vanessa.maegima@nxp.com

#  Record
COMMAND="$(amixer -c 0 sset 'Mic' 50%)"
echo "${COMMAND}"
COMMAND="$(amixer -c 0 sset 'Capture' 50%)"
echo "${COMMAND}"
COMMAND="$(arecord -v -d 5 -f cd test.wav)"
echo "${COMMAND}"

#  Play
COMMAND="$(aplay test.wav)"
echo "${COMMAND}"
