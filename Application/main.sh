#!/bin/bash

#Closes the Shell
close_shell() {
	clear
	b=5
	while [ "$b" -ge 0 ]
	do
		a=$((a + 1))
		clear
		echo "Closing Shell Script in $b Seconds"
		sleep 1
		b=$((b - 1))
		if [ "$b" == 0 ];
		then
			kill 225
		fi
	done
}

#Variables
a=0
rs_dir="$HOME/RuneScape"

#Main Loop
while [ "$a" == 0 ]
do
	clear
	echo "+-------------------------------------------------+"
	echo "| Welcome to RSPS Launcher Shell Script           |"
	echo "| Scripted by: John Willikers (A.K.A MrWillikers) |"
	echo "+-------------------------------------------------+"
	echo " "
	echo "      +-------------------------------+"
	echo "      | [Please Select an Option]     |"
	echo "      |* 1 - Download/Install Clients |"
	echo "      |* 2 - Run Installed Clients    |"
	echo "      +-------------------------------+"
	echo -n "      |[1-2]> "
	read input
	if [ "$input" == "1" ];
	then
		source "$rs_dir/download.sh"
	elif [ "$input" == "2" ];
	then
		source "$rs_dir/run.sh"
	else
		close_shell
	fi
done
