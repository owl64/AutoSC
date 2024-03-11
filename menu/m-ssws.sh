#!/bin/bash
z="\033[96m"
ORANGE='\033[0;33m'
NC='\033[0m'
RED="\033[31m"
PURPLE='\e[35m'
biru="\033[0;36m"
GREEN='\033[0;32m'
Suffix="\033[0m"
Bold='\e[1m'

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

#set bot notif
if [ ! -e /etc/active ]; then
    mkdir -p /etc/active
fi

if [ ! -e /etc/active/5-shadowshocks ]; then
    sts="${RED}${Bold}OFF${NC}"
else
    sts="${Green}${Bold}ON${NC}"
fi

function statusbotoffshadowshocks(){
    clear
    if [ $sts = "OFF" ]; then
        echo -e " ${RED} Status Bot Off, Please On Bot First${NC}"
    fi

    start_spinner " Please wait, Process...."
    sleep 2
    rm -rf /etc/active/5-shadowshocks
    stop_spinner
    echo -e " ${Green} Sucess OFF Bot Notif SSH ${NC}"
}

function statusbotonshadowshocks(){
    clear
    if [ $sts = "ON" ]; then
        echo -e " ${ORANGE} Status Bot Is ON${NC}"
    fi

    start_spinner " Please wait, Process...."
    sleep 2
    touch /etc/active/5-shadowshocks
    stop_spinner
    echo -e " ${Green} Sucess ON Bot Notif SSH ${NC}"
}

echo -e "\e[32mloading...\e[0m"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
clear
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "$PURPLE             MENU SHADOWSHOCKS            $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE}  [01].${NC}${biru} Create Account Shadowshocks WS/GRPC${NC}"
echo -e "  ${ORANGE}  [02].${NC}${biru} Create Trial Shadowshocks WS/GRPC${NC}"
echo -e "  ${ORANGE}  [03].${NC}${biru} Delete Account Shadowsocks WS/GRPC${NC}"
echo -e "  ${ORANGE}  [04].${NC}${biru} Renew Shadowsocks Account${NC}"
echo -e "  ${ORANGE}  [05].${NC}${biru} Check Shadowsocks login Account${NC}"
echo -e "  ${ORANGE}  [06].${NC}${biru} Check Config Shadowsocks  Account${NC}"
echo -e "  ${ORANGE}  [07].${NC}${biru} Restore Shadowshocks Account${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE      LIMIT SHADOWSHOCKS              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  ${ORANGE}  [08].${NC}${biru} Change Limit IP${NC}"
echo -e "  ${ORANGE}  [09].${NC}${biru} Change Limit Quota${NC}"
echo -e "  ${ORANGE}  [10].${NC}${biru} Reset Usage Quota Acount${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e " $PURPLE                Set Bot Notif           $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "    STATUS BOT NOTIF : [ $sts ]"
echo -e "  ${ORANGE}  [11].${NC}${biru} On Bot Notif${NC}"
echo -e "  ${ORANGE}  [12].${NC}${biru} Off Bot Notif${NC}"
echo -e ""
echo -e "  ${RED}  [00].${NC}${RED} Back to Menu${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "     ACCOUNT : ${ORANGE}[ ${trb} ]${NC}   Usage : ${ORANGE}[ ${ttoday} ]${NC} "
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
read -p "Select From Options [ 1 - 6 ] : " menu
case $menu in
1 | 01)
    clear
    addss
    ;;
2 | 02)
    clear
    trialss
    ;;
3 | 03)
    clear
    delss
   ;;
4 | 04)
    clear
    renewss
    ;;
5 | 05)
    clear
    cekss
    ;;
6 | 06)
    clear
    user-ss
    ;;
7 | 07) 
    clear
    echo -e " Under Maintenance!"
    #restoreshadowshocks
    m-ssws
    ;;
8 | 08) 
    clear
    echo -e " Under Maintenance!"
    #changeiplimitshadowshocks
    m-ssws
    ;;
9 | 09) 
    clear
    echo -e " Under Maintenance!"
    #changelimitquotashadowshocks
    m-ssws
    ;;
10) 
    clear
    echo -e " Under Maintenance!"
    #resetquotashadowshocks
    m-ssws
    ;;
11)
    statusbotonshadowshocks
    m-ssws
    ;;
12)
    statusbotoffshadowshocks
    m-ssws
    ;;
0 | 00)
    clear
    menu
    ;;
*)
    clear
    menu
    ;;
esac