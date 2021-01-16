#!/bin/bash

# для того чтобы запускать скрипт алиасом
# добавить в .zshrc
# alias gitall=/bin/zsh /PATH_TO_SCRIPT/gitall.sh

CYAN='\033[0;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

printf  "${CYAN} > Find git repos... ${NC}\n "
pwd > /dev/null 2>&1;

find . -name .git -type d -prune | while IFS= read -r d;
do
   if [ -d $d:h ]; then
        printf "${YELLOW} --> ${GREEN} found repo in ${d:h} ${NC}\n"
        printf "execute: ${GREEN}git ${@}${NC}\n"
        cd $d:h
	printf "\n ${NC}"
        git $@
	printf "\n ${NC}"
        cd $OLDPWD
    fi
done
printf  "${CYAN} > SUCCESS! ${NC}\n"
