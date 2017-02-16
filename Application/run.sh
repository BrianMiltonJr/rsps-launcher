#!/bin/bash

#Variables
a=0
rs_dir="$HOME/RuneScape"
cache_dir="$rs_dir/Cache"	
hClients=("MbScape" "SimplicityPs")
fClients=("mbscape.jar" "simplicity.jar")

#Checks if client is installed
check_status() {
	if [ ! -f "$cache_dir/${fClients[$1]}" ];
	then
		echo "0"
	else
		echo "1"
	fi
}

#Launches RuneScape Client
launch_runescape() {
	clear
	status=$(check_status "$1")
	if [ "$status" == "1" ];
	then
		echo "Starting ${hClients[$1]}"
		java -jar "$cache_dir/${fClients[$1]}" &
		echo "${hClients[$1]} Started"
	else
		echo "${hClients[$1]} Is not Installed"
		echo "Would you like to install ${hClients[$1]}?"
		echo -n "[Y/N]> "
		read install
		if [[ "$install" =~ y ]];
		then
			sh "$rs_dir/download.sh"
		fi
	fi
}

# Render RSPS run menu
while [ "$a" == 0 ]
do
	clear
	echo "+-----------------------------+"
	echo "| Run Downloaded RSPS Clients |"
	echo "+-----------------------------+"
	y=0
	z=${#hClients[@]}
	while [ "$y" -lt "$z" ]
	do
		string="$y - ${hClients[$y]}"
		echo "$string"
		y=$((y + 1))
	done
	echo "$z - Return"
	echo -n "[0-$z]> "
	read choice
	if [ "$choice" -ge "$z" ];
	then
		source "$rs_dir/main.sh"
	else
		launch_runescape "$choice"
	fi
done