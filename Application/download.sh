#!/bin/bash
#Variables
a=0
rs_dir="$HOME/RuneScape"
cache_dir="$rs_dir/Cache"	

clientsDl=("http://mbscape.org/forums/?app=forums&module=forums&controller=forums&id=5&%2Fforum%2F5-mbscape-718-client-download%2F=" "http://www.simplicity-ps.com/play/SimplicityPs.jar")
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

#Downloads RuneScape Clients
download_runescape_client() {
	output_file="$cache_dir/${fClients[$1]}"
	echo "Downloading ${hClients[$1]}"
	sudo wget --output-document="$output_file" "${clientsDl[$1]}"
	echo "${hClients[$1]} Downloaded Succesfully"
	sleep 2
}

while [ "$a" == 0 ]
do
	clear
	echo "+-------------------------------+"
	echo "| Download/Install RSPS Clients |"
	echo "+-------------------------------+"
	c=0
	while [ "$c" -lt "${#hClients[@]}" ] 
	do
		status=$(check_status "$c")
		if [ "$status" == "1" ];
		then
			string="$c - ${hClients[$c]} [Installed]"
		else
			string="$c - ${hClients[$c]} [Not Installed]"
		fi
			echo "$string" 
			c=$((c + 1))
	done
	echo "$c - Return"
	echo -n "[0 - $c]> "
	read client
	c_status=$(check_status "$client")
	if [ "$client" -lt "${#fClients[@]}" ];
	then
		if [ "$c_status" == "1" ];
		then
			echo "${hClients[$client]} is already Installed"
			echo "Would you like to Re-Install ${hClients[$client]}?"
			echo -n "[Y/N]> "
			read lol
			if [[ "$lol" =~ y ]];
			then
				rm "$cache_dir/${fClients[$client]}"
				sleep 5
				download_runescape_client "$client"
				continue
			else
				continue
			fi
		else
			download_runescape_client "$client"
			continue
		fi
	else
		source "$rs_dir/main.sh"
	fi
done