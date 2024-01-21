#!/bin/bash
clear
echo "bot backup"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
cp -r /var/lib/kyt/ backup/kyt 
cp -r /etc/xray backup/xray
cp -r /etc/vmess backup/vmess
cp -r /etc/vless backup/vless
cp -r /etc/trojan backup/trojan
cp -r /etc/shadowsocks backup/shadowsocks
cp -r /etc/kyt/limit backup/ip
cp -r /var/www/html/ backup/html
cd /root
zip -r $IP-$date.zip backup
domain=$(cat /etc/xray/domain)
IP=$(curl -sS ipv4.icanhazip.com)

function send_backup(){
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>────────────────────</code>
<b>⚠️ AUTO BACKUP ⚠️</b>
<code>────────────────────</code>
<code>Domain/IP  : </code><code>$domain</code>
<code>IP VPS  : </code><code>$ip</code>
<code>File Backup : v</code>
<code>────────────────────</code>
"
curl -F --max-time $TIME chat_id="$CHATID&disable_web_page_preview=1" -F document=@/path/to/your/backup/file.txt -F caption="$TEXT&parse_mode=html" $URL >/dev/null
}
send_backup