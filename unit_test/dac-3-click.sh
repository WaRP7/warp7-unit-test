#!/bin/sh

# Mikrobus : DAC 3 Click test : http://www.mikroe.com/click/dac3/

# Show I2C address

i2cdetect -y 2 # (see Mikrobus connector)

# i2cdetect -y 2
#     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
#00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
#10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#60: 60 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
#70: -- -- -- -- -- -- -- --  

# Vars
response=0

while [ ${response} -ne 3 ]
do
  echo ""
	echo "1 - Set Max voltage"
	echo "2 - Set Min voltage" 
	echo ""
	
	echo -ne "enter [1 or 2] :"
	read response

		case ${response} in

			1) 
			echo "Set max voltage"
			# set a voltage (Max)
			i2cset -y 2 0x60 0x40 0xff 0xff i
			;;
		
			2)
			echo "Set min voltage"
			# set a voltage (min)
			i2cset -y 2 0x60 0x40 0x00 0x00 i
			;;
		
			*)
			echo "Unknow"
			exit;;
		esac
done
