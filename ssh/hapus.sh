#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
#########################

green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m               DELETE USER                \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -p "Username SSH to Delete : " Pengguna

if getent passwd $Pengguna >/dev/null 2>&1; then
    userdel $Pengguna >/dev/null 2>&1
    echo -e "User $Pengguna was removed."
else
    echo -e "Failure: User $Pengguna Not Exist."
fi

read -n 1 -s -r -p "Press any key to back on menu"

menu
