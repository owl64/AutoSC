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
red='\e[1;31m'
green='\e[0;32m'
z="\033[96m"
NC='\033[0m'
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
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
Suffix="\033[0m"
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
export CHATID="5008116231"
export KEY="6638955090:AAESojtt1ZPmuTNESoNHfgyPdU92Ue7d4H4"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
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
    echo -e "\033[1;93────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/andiowl"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/628217067357"
    echo -e "\033[1;93────────────────────────────────────────────\033[0m"
    sleep 5
    reboot
  fi
}
checking_sc
source /usr/local/sbin/changelimit
echo -e "\e[32mloading...\e[0m"
clear
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE           MENU VMESS              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE} [01].${NC}\033[0;36m Creating Vmess Account WS/GRPC${NC}"
echo -e "  ${ORANGE} [02].${NC}\033[0;36m Creating Trial Vmess Account WS/GRPC${NC}"
echo -e "  ${ORANGE} [03].${NC}\033[0;36m Delete Vmess Account WS/GRPC${NC}"
echo -e "  ${ORANGE} [04].${NC}\033[0;36m Renew Vmess Account${NC}"
echo -e "  ${ORANGE} [05].${NC}\033[0;36m Check Vmess login Account${NC}"
echo -e "  ${ORANGE} [06].${NC}\033[0;36m Check Config Vmess Account${NC}"
echo -e "  ${ORANGE} [07].${NC}\033[0;36m Restore Vmess Account${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE           LIMIT VMESS              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE} [08].${NC}\033[0;36m Change Limit IP${NC}"
echo -e "  ${ORANGE} [09].${NC}\033[0;36m Change Limit Quota${NC}"
echo -e "  ${ORANGE} [10].${NC}\033[0;36m Reset Usage Quota Acount${NC}"
echo -e ""
echo -e "  ${ORANGE} [00].${NC}${RED} Back To Menu${NC}"
echo -e ""
echo -e ""
read -p "Select From Options [ 1 - 10 ] : " menu
case $menu in
    1)  
        clear
        addws
        ;;
    2)
        clear
        trialws
        ;;
    3)
        clear
        delws
        ;;
    4)
        clear
        renewws
        ;;
    5) 
        clear
        cekws
        ;;
    6)
        clear
        user-ws
        ;;
    7)
        clear
        restorevmess
        ;;
    8)
        Clear
        changeiplimitvmess
        ;;
    9)
        clear
        changelimitquotavmess
        ;;
    10)
        clear
        resetquotavmess
        ;;
    0)
        clear
        menu
        ;;
    *) 
        clear
        menu
        ;;
esac