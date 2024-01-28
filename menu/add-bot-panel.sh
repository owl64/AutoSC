#!/bin/bash
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
blue2='\033[0;36m'
Lred='\e[91m'
Lyellow='\e[93m'
Lgreen='\e[92m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
GREENBG="\033[42;37m"
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
Suffix="\033[0m"
z="\033[96m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
#satusbot
bot_kyt=$(systemctl status kyt | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE  BOT 
if [[ $bot_kyt == "running" ]]; then 
   status_bot="${GREEN}Online${NC}"
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
  source /usr/local/sbin/spiner

  echo -e ""
  echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
  echo -e "      $PURPLE       Set Backup Time              $NC"
  echo -e " ${z}└──────────────────────────────────────────┘${NC}"
  echo -e ""

    botbackupcek="/etc/bot/.bot.db"
    if [ -s "$botbackupcek" ]; then   

      filecektime="/etc/list/.time.db"
      if [ -e "$filecektime" ]; then

        if [ -s "$filecektime" ]; then
          status="${green}ON${NC}"
          timegrep=$(cat /etc/list/.time.db | grep '#time#' | cut -d ' ' -f 2 )
          timegrep2=$(cat /etc/list/.time.db | grep '#time#' | cut -d ' ' -f 3 )
          timecek="${green}$timegrep [$timegrep2]"
          time1="Time-${green}${timecek}${NC}"
        else
          time1="${RED}OFF${NC}"
          status="${RED}OFF${NC}"
        fi

        echo -e "    Status Auto Backup : [$status] - [$time1]"
        echo -e ""
        echo -e "    ${ORANGE} [01].${NC}${blue2} 1 AM${NC}"
        echo -e "    ${ORANGE} [02].${NC}${blue2} 3 AM${NC}"
        echo -e "    ${ORANGE} [03].${NC}${blue2} 6 AM${NC}"
        echo -e "    ${ORANGE} [04].${NC}${blue2} 1 PM${NC}"
        echo -e "    ${ORANGE} [05].${NC}${blue2} 5 PM${NC}"
        echo -e "    ${ORANGE} [06].${NC}${blue2} Off Auto Backup Bot${NC}"
        echo -e ""
        echo -e "    ${ORANGE} [00].${NC}${RED} Back to Panel Bot${NC}"
        echo -e ""
        read -rp"    Select Option Menu [ Press ENTER to Back ]: " botmenu
        if [ -z $botmenu ]; then
          clear
          add-bot-panel
        else
          case $botmenu in
            1 | 01)
            start_spinner " Making 1 AM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 1 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 1 AM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            2 | 02)
            start_spinner " Making 3 AM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 3 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 3 AM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            3 | 03)
            start_spinner " Making 6 AM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 6 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 6 AM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            4 | 04)
            start_spinner " Making 1 PM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 13 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            echo "#time# 1 PM" >>/etc/list/.time.db
            sleep 1
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            5 | 05)
            start_spinner " Making 5 PM"
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            echo "0 17 * * * root /usr/local/sbin/backup-bot" > /etc/cron.d/auto_backup
            chmod +x /etc/cron.d/auto_backup
            service cron restart
            sleep 1
            echo "#time# 5 PM" >>/etc/list/.time.db
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            6 | 06)
            start_spinner " Off Auto Backup..."
            sleep 1
            rm -rf /etc/cron.d/auto_backup
            truncate -s 0 /etc/list/.time.db
            stop_spinner
            echo -e " ${green}Success${Suffix}"
            sleep 2
            add-bot-panel
            ;;
            0 | 00)
            clear
            add-bot-panel
            ;;
          esac
        fi
      else
          start_spinner " Making File data Bot..."
          mkdir /etc/list
          echo "test" >"/etc/list/.time.db"
          truncate -s 0 /etc/list/.time.db
          sleep 2
          stop_spinner
          echo -e " ${green}Success Make file${Suffix}"
          sleep 1
          echo -e " ${green}Refresh...${Suffix}"
          add-bot-panel
      fi
    else
      echo -e "    ${ORANGE}[*]${NC}${blue2} Please Add Bot Notif & Backup First"
      sleep 3
      add-bot-panel
    fi
}

echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "         ${PURPLE} MENU BOT PANEL            "
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e "" 
echo -e "   ${ORANGE}📫︎${NC} Status Bot : [ ${status_bot} ]"
echo -e ""
echo -e " ${ORANGE}   [01].${NC}${blue2} Add Bot Panel${NC}"
echo -e " ${ORANGE}   [02].${NC}${blue2} Delete Bot Panel${NC}"
echo -e " ${ORANGE}   [03].${NC}${blue2} Stop Bot Panel${NC}"
echo -e " ${ORANGE}   [04].${NC}${blue2} Restart Bot Panel${NC}"
echo -e " ${ORANGE}   [05].${NC}${blue2} Update Bot Panel${NC}"
echo -e " ${ORANGE}   [06].${NC}${blue2} AUTO Backup VPS [ file to Bot ]${NC}"
echo -e ""
echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE       Set Bot Notif              $NC"
echo -e " ${z}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e " ${ORANGE}   [07].${NC}${blue2} Add Bot Notif & Backup${NC}"
echo -e " ${ORANGE}   [08].${NC}${blue2} Delete Bot Notif & Backup${NC}"
echo -e ""
echo -e " ${ORANGE}   [00]${NC}${RED} \e[31mBack To Menu\033[0m"
echo -e ""
read -p " Select menu [ 1-8 ]:  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; wget https://raw.githubusercontent.com/owl64/AutoSC/main/kyt.sh && chmod +x kyt.sh && ./kyt.sh ;;
02 | 2) clear ; hapus-bot ;;
03 | 3) clear ; stop-bot ;;
04 | 4) clear ; restart-bot ;;
05 | 5) clear ; wget https://raw.githubusercontent.com/owl64/AutoSC/main/bot/update-bot.sh && chmod +x update-bot.sh && ./update-bot.sh ;;
06 | 6) clear ; bckp_bot;;
07 | 7) clear ; add-bot-notif ;;
08 | 8) clear ; del-bot-notif ;;
00 | 0) clear ; menu ;;
esac