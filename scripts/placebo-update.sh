#!/bin/bash

cd ~/github/libplacebo &&
git pull &&
while true; do
read -p "libplacebo: Do you want to proceed? (y/n) " yn
case $yn in
	[yY] ) echo ok, we will proceed;
		break;;
	[nN] ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac
done
rm -rf build &&
./compile &&
sudo ninja -Cbuild install
