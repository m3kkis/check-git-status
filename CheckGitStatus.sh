#!/bin/sh

#check if its a git directory then check status 
#and at the end of execution, press any key to exit

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

for d in */ ; do
	cd $d
	if [ -d .git ]; then 
		if [[ `git status --porcelain` ]]; then
			echo -e "${RED}"$d"${NOCOLOR}"
		else
			echo -e "${GREEN}"$d"${NOCOLOR}"
		fi
	fi
	cd ..
done
read -n 1 -s -r -p "Press any key to continue"