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
NC='\033[0m'
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
z="\033[96m"
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
export CHATID="5008116231"
export KEY="6638955090:AAESojtt1ZPmuTNESoNHfgyPdU92Ue7d4H4"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
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
    exit
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
#Domain
domain=$(cat /etc/xray/domain)

echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e " $NC$purple                  SSH & OpenVPN           $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "  ${ORANGE}  [01].${NC}\033[0;36m Create SSH & OpenVPN Account${NC}"
echo -e "  ${ORANGE}  [02].${NC}\033[0;36m Trial SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}  [03].${NC}\033[0;36m Renew SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}  [04].${NC}\033[0;36m Check User Login SSH & OpenVPN${NC}"
echo -e "  ${ORANGE}  [05].${NC}\033[0;36m Daftar Member SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}  [06].${NC}\033[0;36m Hapus SSH & OpenVpn Account ${NC}"
echo -e "  ${ORANGE}  [07].${NC}\033[0;36m Hapus User Expired SSH & OpenVPN ${NC}"
echo -e "  ${ORANGE}  [08].${NC}\033[0;36m Set up Autokill SSH ${NC}"
echo -e "  ${ORANGE}  [09].${NC}\033[0;36m Cek User Multi Login SSH ${NC}"
echo -e "  ${ORANGE}  [10].${NC}\033[0;36m Config SSH ACCOUNT ${NC}"
echo -e ""
echo -e "  ${RED}  [00].${NC}${RED} Back to Menu ${NC}"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
read -p "Select From Options [ 1 - 10 ] : " menu
echo -e ""
case $menu in
1 | 01)
    addssh
    ;;
2 | 02)
    trial
    ;;
3 | 03)
    renewssh
    ;;
4 | 04)
    clear
    cekssh
    ;;
5 | 05)
    member
    ;;
6 | 06)
    delssh
    ;;
7 | 07)
    delexp
    ;;
8 | 08)
    autokill
    ;;
9 | 09)
    clear
    echo -e "Under Maintenance ! Please Try again Later"
    sleep 2
    m-sshws
    ;;
10 | 10)
    clear
    echo -e "Under Maintenance ! Please Try again Later"
    sleep 2
    m-sshws
    ;;
0 | 00)
    clear
    menu
    ;;
*)
    menu
    ;;
esac