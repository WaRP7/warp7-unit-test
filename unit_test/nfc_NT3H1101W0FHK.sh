#!/bin/sh

#  Warp7 - NFC NT3H1101W0FHK
#  This script tests if the NTAG_I2C is connected or not.
#  Vanessa Maegima vanessa.maegima@nxp.com

#  Get I2C Address
printf '\nMake sure address 0x55 is shown at table below.\n\n'
COMMAND="$(i2cdetect -y -q 1)"
echo "${COMMAND}"

#  Get Manufacturer ID
printf '\nManufacturer ID is '
COMMAND="$(i2cget -y 1 0x55 0x00 b )"
echo "${COMMAND}"

printf '\n'
