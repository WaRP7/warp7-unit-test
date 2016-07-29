#!/bin/sh

echo 1 > /sys/devices/virtual/input/input3/enable
printf '\n'
while [ 1 -eq 1 ] ; do
  printf 'Test for MPL3115A2 (Precision Altimeter and thermometer)\n'
  printf '\nPlease check the device ID (Should be 0xC4)\n'
  printf '   Device ID\n'
  WHO_AM_I="$(i2cget -f -y 3 0x60 0x0C)"
  echo "   WHO_AM_I: ${WHO_AM_I}"
  printf '\nPlease lift the board up\n'
  printf '   Pressure\n'
  OUT_P_MSB="$(i2cget -f -y 3 0x60 0x01)"
  OUT_P_CSB="$(i2cget -f -y 3 0x60 0x02)"
  OUT_P_LSB="$(i2cget -f -y 3 0x60 0x03)"
  echo "   OUT_P_MSB: ${OUT_P_MSB}"
  echo "   OUT_P_CSB: ${OUT_P_CSB}"
  echo "   OUT_P_LSB: ${OUT_P_LSB}"
  printf '\nPlease heat the board\n'
  printf '   Temperature\n'
  OUT_T_MSB="$(i2cget -f -y 3 0x60 0x04)"
  OUT_T_LSB="$(i2cget -f -y 3 0x60 0x05)"
  echo "   OUT_T_MSB: ${OUT_T_MSB}"
  echo "   OUT_T_LSB: ${OUT_T_LSB}"
  usleep 300000
  printf "\033[16A\033[K"
done
