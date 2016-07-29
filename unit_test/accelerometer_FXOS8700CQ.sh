#!/bin/sh

echo 1 > /sys/devices/virtual/misc/FreescaleAccelerometer/enable
printf '\n'
while [ 1 -eq 1 ] ; do
  printf 'Test for FXOS8700CQ (3-axis linear accelerometer)\n'
  printf '\nPlease check the device ID (Should be 0xC7)\n'
  printf '   Device ID\n'
  WHO_AM_I="$(i2cget -f -y 3 0x1e 0x0D)"
  echo "   WHO_AM_I: ${WHO_AM_I}"
  printf '\nPlease move the Board in different directions\n'
  printf '   AXIS X\n'
  OUT_X_MSB="$(i2cget -f -y 3 0x1e 0x01)"
  OUT_X_LSB="$(i2cget -f -y 3 0x1e 0x02)"
  echo "   OUT_X_MSB: ${OUT_X_MSB}"
  echo "   OUT_X_LSB: ${OUT_X_LSB}"
  printf '\n   AXIS Y\n'
  OUT_Y_MSB="$(i2cget -f -y 3 0x1e 0x03)"
  OUT_Y_LSB="$(i2cget -f -y 3 0x1e 0x04)"
  echo "   OUT_Y_MSB: ${OUT_Y_MSB}"
  echo "   OUT_Y_LSB: ${OUT_Y_LSB}"
  printf '\n   AXIS Z\n'
  OUT_Z_MSB="$(i2cget -f -y 3 0x1e 0x05)"
  OUT_Z_LSB="$(i2cget -f -y 3 0x1e 0x06)"
  echo "   OUT_Z_MSB: ${OUT_Z_MSB}"
  echo "   OUT_Z_LSB: ${OUT_Z_LSB}"
  usleep 300000
  printf "\033[18A\033[K"
done
