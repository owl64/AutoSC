DF='\e[39m'
RED='\033[0;31m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
YELLOW="\033[33m"
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lyellow='\e[93m'
Lgreen='\e[92m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
GREENBG="\033[42;37m"
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
#satusbot
bot_kyt=$(systemctl status kyt | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE  BOT 
if [[ $bot_kyt == "running" ]]; then 
   status_bot="${GREEN}Online$NC${c}$NC"
else
   status_bot="${RED}Offline${NC}"
fi
#####
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/owl64/AutoSC/main/user/user"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/andiowl"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282217067357"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    sleep 5
    reboot
  fi
}
checking_sc

echo -e "\e[32mloading...\e[0m"
clear
MYIP=$(wget -qO- ipinfo.io/ip);
clear 

function bckp_bot(){
  clear

  echo -e ""
  echo -e " ${yell}┌──────────────────────────────────────────┐${NC}"
  echo -e "      $PURPLE       Set Backup Time              $NC"
  echo -e " ${yell}└──────────────────────────────────────────┘${NC}"
  echo -e ""

    if [ $status_bot == "OFF" ]; then
      echo -e "    Please Add Bot First and check runing or not"
    else

      filecektime="/etc/list/time.db"
      if [ -e "$filecektime" ]; then

        if [ -s "$filecektime" ]; then
          status="${green}ON${NC}"
          timecek=$(cat /etc/list/time.db)
          time1="${green}ON${NC} Time-${green}${timecek}${NC}"
        else
          time1="${RED}OFF${NC}"
          status="${RED}OFF${NC}"
        fi

      else
        touch "$filecektime"
      fi

      echo -e "    Status Backup : [$status] - [$time1]"
      echo -e ""
      echo -e "    [01]. 1 AM"
      echo -e "    [02]. 3 AM"
      echo -e "    [03]. 6 AM"
      echo -e "    [04]. 1 PM"
      echo -e "    [05]. 5 PM"
      echo -e "    [06]. Off Auto Backup Bot"
      echo -e "    [00]. Back to Panel Bot"
      echo -e ""
      read -rp"    Select Option Menu : " botmenu
      if [ -z $botmenu ]; then
        clear
        add-bot-panel
      else
        case $botmenu in
          1 | 01)
          clear
          ;;
          2 | 02)
          clear
          ;;
          3 | 03)
          clear
          ;;
          4 | 04)
          clear
          ;;
          5 | 05)
          clear
          ;;
          6 | 06)
          clear
          ;;
          0 | 00)
          clear
          add-bot-panel
          ;;
        esac
      fi
    fi
}

echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "         ${PURPLE} MENU BOT PANEL            "
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "" 
echo -e " ${KIRI} Status Bot [${status_bot}]"
echo -e ""
echo -e " [\e[36m1\e[0m] Add Bot Panel"
echo -e " [\e[36m2\e[0m] Delete Bot Panel"
echo -e " [\e[36m3\e[0m] Stop Bot Panel"
echo -e " [\e[36m4\e[0m] Restart Bot Panel"
echo -e " [\e[36m5\e[0m] Update Bot Panel"
echo -e " [\e[36m2\e[0m] Backup VPS from Bot"
echo -e "" 
echo -e " [\e[31m0\e[0m] \e[31mBack To Menu\033[0m"
echo -e "" 
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; wget https://raw.githubusercontent.com/owl64/AutoSC/main/kyt.sh && chmod +x kyt.sh && ./kyt.sh ;;
02 | 2) clear ; hapus-bot ;;
03 | 3) clear ; stop-bot ;;
04 | 4) clear ; restart-bot ;;
05 | 5) clear ; wget https://raw.githubusercontent.com/owl64/AutoSC/main/bot/update-bot.sh && chmod +x update-bot.sh && ./update-bot.sh ;;
06 | 6) clear ; echo -e "Under Maintenenace!"; sleep 2 ; add-bot-panel;;
00 | 0) clear ; menu ;;
esac