#!/bin/bash

## Script to automatically check repo git status. If 'out of date' then pull & build; if not SKIP.
## Location of build-$(scripts) need to be in your $PATH i.e "$HOME/scripts".  

# Get colors
source $HOME/scripts/colors

echo -en '\n'
echo -e "${BB}###### [ ${BIG}!! SUPER MEGA GIT UPDATE !!${NC}${BB} ] ######${NC}"
echo -en '\n'

cd $HOME/github/ares
echo -e "${BIB}###### [ ${BIC}ares-emu ${NC}${BIB}] ######${NC}"
if [[ $(git remote show origin | grep 'out of date') ]]; then
while true; do
	echo -e "${BB}###### [ ${BIP}update ???${NC}${BB} ] ######${NC}"
read -p "$(echo -e "Yes or No [${BG}y${NC}/${BR}n${NC}]") " yn
	echo -en '\n'
case $yn in
	[yY] ) echo -e " ${BY}* ${BIG}OK${NC} we will proceed${BB} ......${NC}"
	echo -en '\n'
	sleep 1
	git pull &&
	build-ares.sh &&
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}!! Done !!${NC}${BB}] ######${NC}"
		break;;
	[nN] ) echo -e " ${BY}*${NC} Skipping${BB} ......${NC}"
		break;;
	* )echo -e "${R} ****** INVALID RESPONSE ******${NC}"
	echo -en '\n';;
    esac
done
else
	echo -e "${BIB}###### [ ${BIY}Up to Date, Skipping${NC}${BIB} ] ######${NC}";
fi

echo -en '\n'
echo -e "${BB}###### [ ${BIG}!! FINISHED !!${NC}${BB} ] ######${NC}"

cd $HOME/github/dhewm3
echo -en '\n'
echo -e "${BIB}###### [ ${BIC}dhewm3 ${NC}${BIB} ] ######${NC}"
if [[ $(git remote show origin | grep 'out of date') ]]; then
while true; do
	echo -e "${BB}###### [ ${BIP}update ???${NC}${BB} ] ######${NC}"
read -p "$(echo -e "Yes or No [${BG}y${NC}/${BR}n${NC}]") " yn
	echo -en '\n'
case $yn in
	[yY] ) echo -e " ${BY}* ${BIG}OK${NC} we will proceed${BB} ......${NC}"
	echo -en '\n'
	sleep 1
	git pull &&
	build-dhewm3.sh &&
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}!! Done !!${NC}${BB} ] ######${NC}"
		break;;
	[nN] ) echo -e " ${BY}*${NC} Skipping${BB} ......${NC}"
		break;;
	* )echo -e "${R} ****** INVALID RESPONSE ******${NC}"
	echo -en '\n';;
    esac
done
else
	echo -e "${BIB}###### [ ${BIY}Up to Date, Skipping${NC}${BIB} ] ######${NC}";
fi

echo -en '\n'
echo -e "${BB}###### [ ${BIG}!! FINISHED !!${NC}${BB} ] ######${NC}"
