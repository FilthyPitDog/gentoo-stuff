#!/bin/bash

## Script to sync, update, build-install/kernel  
## update & build upstream git (9999**) packages  
## & finally clean dependencies 

# Deps
# app-portage/eix
# app-portage/smart-live-rebuild
# app-admin/eclean-kernel

# get colors
source $HOME/scripts/colors

echo -en '\n'
echo -e "${BB}###### [ ${BY}!! SUPER MEGA UPDATE !!${NC}${BB} ] ######${NC}"
sleep 0.5

## sync all repos on system

while true; do
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}Sync Repos ???${NC}${BB} ] ######${NC}"
read -p "$(echo -e "Yes or No [${BG}y${NC}/${BR}n${NC}]") " yn
	echo -en '\n'
case $yn in
	[yY] ) echo -e " ${BY}* ${BIG}OK${NC} Syncing${BB} ......${NC}"
	sleep 1
	eix-sync &&
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}!! Done !!${NC}${BB} ] ######${NC}"
		break;;
	[nN] ) echo -e " ${BY}*${NC} Skipping${BB} ......${NC}"
	sleep 1
		break;;
	 * )echo -e "${R} ****** INVALID RESPONSE ******${NC}"
    esac
done

## update all @world-set packages

while true; do
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}Update ???${NC}${BB} ] ######${NC}"
read -p "$(echo -e "Yes or No [${BG}y${NC}/${BR}n${NC}]") " yn
	echo -en '\n'
case $yn in
	[yY] ) echo -e " ${BY}* ${BIG}OK${NC} Updating${BB} ......${NC}"
	sleep 1
	emerge --ask --verbose --update --newuse --deep --usepkg=n --with-bdeps=y @world &&
	echo -en '\n'
	revdep-rebuild -ip
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}!! Done !!${NC}${BB} ] ######${NC}"
		break;;
	[nN] ) echo -e " ${BY}*${NC} Skipping${BB} ......${NC}"
	sleep 1
		break;;
	 * )echo -e "${R} ****** INVALID RESPONSE ******${NC}"
    esac
done

## run automated kernel make/install script

while true; do
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}Make && Install Kernel???${NC}${BB} ] ######${NC}"
read -p "$(echo -e "Yes or No [${BG}y${NC}/${BR}n${NC}]") " yn
	echo -en '\n'
case $yn in
	[yY] ) echo -e " ${BY}* ${BIG}OK${NC} Roll it up bro${BB} ......${NC}"
	sleep 1
	auto-clang-kernel.sh &&
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}!! Done !!${NC}${BB} ] ######${NC}"
		break;;
	[nN] ) echo -e " ${BY}*${NC} Skipping${BB} ......${NC}"
	sleep 1
		break;;
	 * )echo -e "${R} ****** INVALID RESPONSE ******${NC}"
    esac
done

## check & update all latest upstream versions "*-9999 (git) packages""

while true; do
   echo -en '\n'
   echo -e "${BB}###### [ ${BIP}Smart Live Rebuild ???${NC}${BB} ] ######${NC}"
read -p "$(echo -e "Yes or No [${BG}y${NC}/${BR}n${NC}]") " yn
case $yn in
   [yY] ) echo -e " ${BY}* ${BIG}OK${NC} Updating gits${BB} ......${NC}"
   sleep 1
   emerge --ask --verbose --keep-going @smart-live-rebuild &&
   echo -e "${BB}###### [ ${BIP}!! Done !!${NC}${BB} ] ######${NC}"
      break;;
   [nN] ) echo -e " ${BY}*${NC} Skipping${BB} ......${NC}"
   sleep 1
      break;;
    * )echo -e "${R} ****** INVALID RESPONSE ******${NC}"
    esac
done

## check @world-set & un-merge unneeded dependencies

while true; do
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}Clean Dependencies ???${NC}${BB} ] ######${NC}"
read -p "$(echo -e "Yes or No [${BG}y${NC}/${BR}n${NC}]") " yn
	echo -en '\n'
case $yn in
	[yY] ) echo -e " ${BY}* ${BIG}OK${NC} Checking...${BB} ......${NC}"
	sleep 1
	emerge --ask --depclean &&
	echo -en '\n'
	echo -e "${BB}###### [ ${BIP}!! Done !!${NC}${BB} ] ######${NC}"
		break;;
	[nN] ) echo -e " ${BY}*${NC} Skipping${BB} ......${NC}"
	sleep 1
		break;;
	 * )echo -e "${R} ****** INVALID RESPONSE ******${NC}"
    esac
done

echo -en '\n'
echo -e "${BB}###### [ ${BY}!! Finished !!${NC}${BB} ] ######${NC}"
sleep 0.5
