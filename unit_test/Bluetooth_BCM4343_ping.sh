#!/bin/bash
#WaRP7 Bluetooth Scan and Ping Script

hcitool scan

echo "Please input the BD address of the device you want to connect:"
echo "Use the following format ##:##:##:##:##:##"

read bd_address

l2ping -c 4 $bd_address

