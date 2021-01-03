#!/bin/bash

#Coded by Sourav aka @itninja.official

#Usage- ./Can.sh <Inferface> <NameForLogFile>
#Example- ./Can.sh vcan0 mylog

Interface="$1"
Logfile="$2"

bold="\e[1m"
italic="\e[3m"
reset="\e[0m"
blink="\e[5m"
crayn="\e[36m"
yellow="\e[93m"
red="\e[31m"
green="\e[92m"


if [ -z "$1" ]
  then
    echo "Interface not supplied"  #interface not supplied 
    echo "Usage : Can.sh <Inferface> <NameForLogFile>"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Log filename not supplied" #logs not supplied
    echo "Usage : Can.sh <Inferface> <NameForLogFile>"
    exit 1
fi


logo(){
echo ""
echo "               ██████████           "   
echo "           ████          ████          "
echo "         ██                  ██        "
echo "       ██                      ██      "
echo "        ██                      ██      "
echo "      ██    ████    ████          ██    "
echo "      ██  ██████    ██████        ██    "
echo "      ██  ██████    ██████        ██    "
echo "      ██  ████        ████        ██    "
echo "      ██                          ██    "
echo "      ██        ████      ████    ██    "
echo "    ██  ██      ████    ██        ██    "
echo "    ██  ▒▒██            ██  ██      ██  "
echo "      ▒▒  ▒▒████        ████          ██"
echo "      ▒▒  ▒▒    ██████              ██  "
echo "      ░░░░░░          ██████████████    "
echo "    ░░░░░░░░░░                          "
echo -e "    ░░  ░░  ░░   ${bold}${italic}${blink}${green}GHOST IN THE CAN :${reset}        "
echo "      ░░░░░░                            "
echo -e "\e[31m"
echo "  ██████ █████ ███    ██ ██████ ██   ██ ██████ ███████████████ "
echo " ██     ██   ██████   ████      ██   ████    ████        ██    "
echo " ██     █████████ ██  ████   ████████████    █████████   ██    "
echo " ██     ██   ████  ██ ████    ████   ████    ██     ██   ██    "
echo "  ████████   ████   ████ ██████ ██   ██ ██████ ███████   ██    "
echo -e "\e[0m"                                                            
}



menu(){
clear
logo
echo -e "${green}                 Coded by ${bold}@souravbaghz with ${red}<3${reset}"
echo -e "${bold} --------------------------------------------------------------"
echo -e "${red}  [01] Capture"
echo "  [02] Replay"
echo -e "  [09] Exit${reset}"
read -p "  [Choose the Option] " option

if [[ $option = 1 || $option = 01 ]]
	then
        echo -e "${green}  Dumping CAN Packets...${reset}"
		candump -L $Interface >$Logfile.log
		sleep 1
                clear
		menu

	elif [[ $option = 2 || $option = 02 ]]
	then
        echo -e "  ${green}Sending Captured Packets...${reset} "
	    canplayer -I $Logfile.log
	    sleep 1
            clear
	    menu
        
        elif [[ $option = 9 || $option = 09 ]]
                then
                    clear
                    exit

        else                              #except thing works from here
		echo "Invalid Option..."
		sleep 1
		clear
		menu
	fi	
}

menu

