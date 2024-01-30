#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
z="\033[96m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
clear
# Getting
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/owl64/AutoSC/main/user/user"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/owl64"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282217067357"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    sleep 5
    reboot
  fi
}
checking_sc
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
echo -e "\e[32mloading...\e[0m"
clear
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "                 MENU TROJAN              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE}  [01].${NC} \033[0;36m Create Account XRAY Trojan WS/GRPC${NC}"
echo -e "  ${ORANGE}  [02].${NC} \033[0;36m Create Trial XRAY Trojan WS/GRPC${NC}"
echo -e "  ${ORANGE}  [03].${NC} \033[0;36m Delete Account XRAY Trojan WS/GRPC${NC}"
echo -e "  ${ORANGE}  [04].${NC} \033[0;36m Renew Trojan Account${NC}"
echo -e "  ${ORANGE}  [05].${NC} \033[0;36m Check Trojan login Account${NC}"
echo -e "  ${ORANGE}  [06].${NC} \033[0;36m Check Config Trojan  Account${NC}"
echo -e ""
echo -e "  ${RED}  [00].${NC}${RED} Back to Menu${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "     ACCOUNT : ${ORANGE}[ ${trb} ]${NC}   Usage : ${ORANGE}[ ${ttoday} ]${NC} "
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
read -p "Select From Options [ 1 - 6 ] : " menu
case $menu in
1)
    addtr
    ;;
2)
    trialtr
    ;;
3)
    deltr
    ;;
4)
    renewtr
    ;;
5)
    cektr
    ;;
6)
    user-tr
    ;;
7)
    menu
    ;;
*)
    menu
    ;;
esac