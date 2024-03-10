#!/bin/bash
clear

RED='\033[0;31m'
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BGX="\033[42m"

echo -e " ${YELL}┌──────────────────────────────────────────┐${NC}"
echo -e "      $PURPLE          Add Bot Notif              $NC"
echo -e " ${YELL}└──────────────────────────────────────────┘${NC}"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e " ${YELL} ───────────────────────────────────────────${NC}"
read -rp "  [*] Input your Bot Token : " -e bottoken 
read -rp "  [*] Input Your Id Telegram : " -e admin
echo -e " ${YELL} ───────────────────────────────────────────${NC}"
clear

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/bot/${bottoken}
fi
DATADB=$(cat /etc/bot/.bot.db | grep "^#bot#" | grep -w "${bottoken}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/bot/.bot.db
fi
echo "#bot# ${bottoken} ${admin}" >>/etc/bot/.bot.db

echo -e " ${YELL}┌──────────────────────────────────────────┐${NC}"
echo -e "               Success Add Bot Notif            $NC"
echo -e " ${YELL}└──────────────────────────────────────────┘${NC}"
echo "  Bot Token    : $bottoken"
echo "  ID Telegram  : $admin"
echo -e " ${YELL} ───────────────────────────────────────────${NC}"
read -n 1 -s -r -p "Press [ Enter ] to back menu"
menu