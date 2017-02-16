#!/bin/bash

################################################################################################################
#                          __        ___         __                        _                                   #
#                         /__\___   / _ \___    / /  __ _ _   _ _ __   ___| |__   ___ _ __                     #
#                        / \// __| / /_)/ __|  / /  / _` | | | | '_ \ / __| '_ \ / _ \ '__|                    #
#                       / _  \__ \/ ___/\__ \ / /__| (_| | |_| | | | | (__| | | |  __/ |                       #
#                       \/ \_/___/\/    |___/ \____/\__,_|\__,_|_| |_|\___|_| |_|\___|_|                       #
#                                                                                                              #
#    Version: 0.1a                                                                Created by: MrWillikers      #
#                              _____              _           _  _                                             #
#                              \_   \ _ __   ___ | |_   __ _ | || |  ___  _ __                                 #
#                               / /\/| '_ \ / __|| __| / _` || || | / _ \| '__|                                #
#                            /\/ /_  | | | |\__ \| |_ | (_| || || ||  __/| |                                   #
#                            \____/  |_| |_||___/ \__| \__,_||_||_| \___||_|                                   #
#                                                                                                              #
################################################################################################################





#Variables
name="RsPs Launcer"
author="brian_milton"
version="0.1a"

a=0
rs_dir="$HOME/RuneScape"
cache_dir="$rs_dir/Cache"	
libs_dir="$rs_dir/Lib"
settings_dir="$rs_dir/Settings"

create_launcher() {
	file="$HOME/Desktop/RSPS.desktop"
	echo "[Desktop Entry]" > "$file"
	echo "Version=1.0" >> "$file"
	echo "Type=Application" >> "$file"
	echo "Comment=A built from the Ground up RSPS Launcher" >> "$file"
	echo "Terminal=true" >> "$file"
	echo "Path=$rs_dir" >> "$file"
	echo "Exec=./main.sh" >> "$file"
	echo "Name=RSPS Launcher" >> "$file"
	echo "Icon=$rs_dir/rs.png" >> "$file"
	sudo chmod +x "$file"
}


#Creates Software File System
create_filepaths() {
		clear
		echo "Creating $rs_dir"
		mkdir -p "$rs_dir"
		echo "$rs_dir Created"
		sleep 1
		echo -e "\n"
		echo "Creating $cache_dir"
		mkdir -p "$cache_dir"
		echo "$cache_dir Created"
		sleep 1
		echo -e "\n"
		echo "Creating $libs_dir"
		mkdir -p "$libs_dir"
		echo "$libs_dir Created"
		sleep 1
		echo -e "\n"
		echo "Creating $settings_dir"
		mkdir -p "$settings_dir"
		echo "$settings_dir Created"
		sleep 1
		echo -e "\n"
		echo "Three Shell Scripts need to be downloaded" 
		echo "These are in charge of Installing/Updating/Running the Clients"
		echo "Would you like to Download them?"
		echo "These are required to make the Launcher Work"
		echo -n "[Y/N]> "
		read answer
		if [[ "$answer" =~ y ]];
		then
			wget --output-document="$rs_dir/rs.png" "https://transfer.sh/11c2LX/rs.png"
			echo "Downloading Main.sh from https://transfer.sh/13uv9L/main.sh"
			wget --output-document="$rs_dir/main.sh" "https://transfer.sh/13uv9L/main.sh"
			echo "Download of Main.sh complete"
			echo "Downloading Download.sh from https://transfer.sh/wf5v5/download.sh"
			wget --output-document="$rs_dir/download.sh" "https://transfer.sh/wf5v5/download.sh"
			echo "Download of Download.sh complete"
			echo "Downloading Run.sh from https://transfer.sh/MjAM1/run.sh"
			wget --output-document="$rs_dir/run.sh" "https://transfer.sh/MjAM1/run.sh"
			echo "Download of Run.sh complete"
			echo -e "\n"
			echo -e "\n"
			echo -e "\n"
			echo "Now These scripts need to be given permission to execute."
			echo -n "[Y/N]> "
			read scripts
			if [[ "$scripts" =~ y ]];
			then
				chmod +x "$rs_dir/main.sh"
				chmod +x "$rs_dir/download.sh"
				chmod +x "$rs_dir/run.sh"
				echo "Permission have been assigned."
			else
				close_shell
			fi
		else
			close_shell
		fi
		create_launcher
		echo -e "/n"
		echo "File System has been Configured correctly. At anytime if you need to Reinstall this launcher."
		echo "use ./installer.sh -reinstall"
		echo -e "\n"
		echo "If you want to remove all traces of this launcher from your system"
		echo "user ./install.sh -uninstall"
		echo "[Press any key to Continue]"
		read derp
}

#Installs Java 8
install_java() {
	clear
	echo "Checking to see if Java 8 is Installed"
	echo -e "\n"
	status=$(dpkg -s oracle-java8-installer|grep installed)
	if [ "" == "$status" ];
	then
		echo -e "Java 8 isn'''t installed"
		echo -e "\n"
		echo "+---------------------+"
		echo "| Java 8 Installation |"
		echo "+---------------------+"
		echo -e "\n"
		echo "Java 8 is needed to allow the Rsps Clients to run"
		echo "this requires ppa:webupd8team/java to be added to"
		echo "your PPA keychain to Java 8 can be downloaded and"
		echo "installed."
		echo -e "\n"
		echo -n "Do you Understand [Y/N]> "
		read response
		if [[ "$response" =~ y ]];
		then
			echo "Adding ppa:webupd8team/java to PPA Keychain"
			sudo add-apt-repository ppa:webupd8team/java
			echo "ppa:webupd8team/java added to PPA Kaychain"
			echo "Updating apt-get"
			sudo apt-get update
			printf
			echo "apt-get updated"
			echo "Installing Java 8"
			sudo apt-get install oracle-java8-installer
			echo "Java 8 Installed"
			sleep 5
		else
			close_shell
		fi
	else
		echo "Java 8 is already installed."
		sleep 5
	fi
}

help() {

	local k=10
	while [ "$k" != 0 ];
	do
		clear
		echo "Usage: ./installer.sh -h/--help(Shows this screen), -u/--uninstall(Uninstalls), -r/--repair(Repairs)"
		echo -e "\n"
		echo "Use Ctrl + C to close early or wait $k Seconds"
		sleep 1
		k=$((k - 1))
	done
}

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

uninstall_launcher() {
	clear
	echo "Using this option is going to rm -rf $rs_dir ."
	echo "There is no way to recover this once you hit yes."
	echo -n "[Y/N]> "
	read uninstall
	if [[ "$uninstall" =~ y ]];
	then
		rm -rf "$rs_dir"
		rm -rf "$HOME/Desktop/RSPS.desktop"
		echo "Uninstallation Completed."
	else
		close_shell
	fi
}

uninstall_java() {
	clear
	echo "Are you sure you want to get ride of Java 8?"
	echo -n "[Y/N]> "
	read java
	if [[ "$java" =~ y ]];
	then
		echo "Removing Oracle-Java8-Installer"
		sudo apt-get remove oracle-java8-installer
		echo "Purging Oracle-Java8-Installer"
		sudo apt-get purge oracle-java8-installer
		echo "Auto Removing left over Dependencies from Oracle-Java8-Installer"
		sudo apt-get autoremove
		echo "Done! Have fun!"
		close_shell
	fi
}

uninstaller(){
	clear
	echo "You have Selected to Uninstall RSPS Launcher."
	echo "Select an Option"
	echo "1 - Remove Launcher only"
	echo "2 - Remove Java + Launcher"
	echo "3 - Cancel"
	echo -n "[1-3]> "
	read cough
	if [ "$cough" == 1 ];
	then
		uninstall_launcher
	elif [ "$cough" == 2 ];
	then
		uninstall_launcher
		uninstall_java
	elif [ "$cough" -ge 3 ];
	then
		close_shell
	fi
}

repair() {
	clear
	echo "You are about to Reinstall RSPS Launcher"
	echo "Please select an Option"
	echo "1 - Repair Launcher only"
	echo "2 - Repair Launcher + Java"
	echo "3 - Close"
	echo -n "[1-3]> "
	read repair
	if [ "$repair" == 1 ];
	then
		uninstall_launcher
		create_filepaths
	elif [ "$repair" == 2 ];
	then
		uninstall_launcher
		create_filepaths
		uninstall_java
		install_java
	else
		close_shell
	fi
}

if [ $# -gt 0 ];
then
	while [[ $# == 1 ]]
	do
		if [ "$1" == "-u" ] || [ "$1" == "--uninstall" ];
		then
			uninstaller
			close_shell
		elif [ "$1" == "-r" ] || [ "$1" == "--repair" ];
		then
			repair
			close_shell
		elif [ "$1" == "-h" ] || [ "$1" == "--help" ];
		then
			help
			break
		fi
	done
else
	while [ "$a" == 0 ]
	do
		clear
		echo "     +--------------------------------------------------------------------+"
		echo "     | Welcome to the RuneScape Private Server Client launcher for Linux. |"
		echo "     | This software is under fair use. I dont care what you do with it,  |"
		echo "     | unless its for dark/evil reasons (Which I highly doubt would be    |"
		echo "     | the case), or charging for this software is free for everyone      |"
		echo "     +--------------------------------------------------------------------+"
		echo -e "\n"
		echo "                [Do you agree to the agreement stated above?]"
		echo -n "                [Y/N]> "
		read eula
		if [[ "$eula" =~ y ]];
		then
			clear
			echo "     +--------------------------------------------------------------------+"
			echo "     | The First Process of the installer is going to setup the necessary |"
			echo "     | files. A folder will be made in /home/<user>/ called RuneScape.    |"
			echo "     | Inside will be all the Script Files, Folders, Cache, Etc.          |"
			echo "     +--------------------------------------------------------------------+"
			echo -e "\n"
			echo "                [Are you ok with these changes to your filesystem?]"
			echo -n "                [Y/N]> "
			read question
			if [[ "$question" =~ y ]];
			then
				create_filepaths
			else
				close_shell
			fi
			clear
			echo "The Next Process of this installer is going to check if you need Java, if needed"
			echo "it will install for you automatically. This is needed for The clients since they are .jars."
			echo "would you like to install Java 8"
			echo -n "[Y/N]> "
			read real_answer
			if [[ "$real_answer" =~ y ]];
			then
				install_java
			else
				close_shell
			fi
		else
			close_shell
		fi
	done
fi
