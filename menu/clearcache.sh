#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
function notif_clearcache() {
    green "Notif AddHost Tele"
    versi=$(cat /root/versi/version)
    sleep 2
    CHATID="1624209723"
   KEY="6568779328:AAHaq75VFPoPwlXLfHtrwie7T-zDsOXabFc"
  TIME="10"
   URL="https://api.telegram.org/bot$KEY/sendMessage"
  TEXT="Installasi VPN Script V$versi R[Longterm]
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️CLEAR CACHE NOTIF⚠️</b>
<b>     Clear Cache VPS</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>Clear Cache Done</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>BY BOT : @sdctunneling_bot</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
echo "Checking VPS"
clear
echo ""
echo ""
echo -e "[ \033[32mInfo\033[0m ] Clear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ \033[32mok\033[0m ] Cache cleared"
notif_clearcache
echo ""
echo -e " ${GREEN} Back to menu in 2 sec ${NC}"
sleep 1
menu