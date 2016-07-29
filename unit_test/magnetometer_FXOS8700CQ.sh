#!/bin/sh

echo 1 > /sys/devices/virtual/misc/FreescaleMagnetometer/enable
printf '\n'
while [ 1 -eq 1 ] ; do
  printf 'Test for FXOS8700CQ (3-axis linear magnetomer)\n'
  printf '\nPlease check the device ID (Should be 0xC7)\n'
  printf '   Device ID\n'
  WHO_AM_I="$(i2cget -f -y 3 0x1e 0x0D)"
  echo "   WHO_AM_I: ${WHO_AM_I}"
  printf '\nPlease approach a magnet near to  the Board\n'
  printf '   AXIS X:\n'
  M_OUT_X_MSB="$(i2cget -f -y 3 0x1e 0x33)"
  M_OUT_X_LSB="$(i2cget -f -y 3 0x1e 0x34)"
  echo "   M_OUT_X_MSB: ${M_OUT_X_MSB}"
  echo "   M_OUT_X_LSB: ${M_OUT_X_LSB}"
  printf '\n   AXIS Y:\n'
  M_OUT_Y_MSB="$(i2cget -f -y 3 0x1e 0x35)"
  M_OUT_Y_LSB="$(i2cget -f -y 3 0x1e 0x36)"
  echo "   M_OUT_Y_MSB: ${M_OUT_Y_MSB}"
  echo "   M_OUT_Y_LSB: ${M_OUT_Y_LSB}"
  printf '\n   AXIS Z:\n'
  M_OUT_Z_MSB="$(i2cget -f -y 3 0x1e 0x37)"
  M_OUT_Z_LSB="$(i2cget -f -y 3 0x1e 0x38)"
  echo "   M_OUT_Z_MSB: ${M_OUT_Z_MSB}"
  echo "   M_OUT_Z_MSB: ${M_OUT_Z_LSB}"
  usleep 300000
  printf "\033[18A\033[K"
done
