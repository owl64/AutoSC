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
yellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

function notif_clearcache() {
    green "Notif AddHost Tele"
    versi=$(cat /root/versi/version)
    sleep 2
    CHATID="1624209723"
    KEY="6568779328:AAHaq75VFPoPwlXLfHtrwie7T-zDsOXabFc"
    TIME="10"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    TEXT="Satus Service VPN Script V$versi R[Longterm]
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️STATUS SERVICE NOTIF⚠️</b>
<b>     domain: $domain</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>FIXED HAPROXY SUCCESS</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>BY BOT : @sdctunneling_bot</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

function fix(){
    green "FIXING"
    sleep 2
    rm -rf /etc/xray/xray.key
    rm -rf /etc/xray/xray.crt

    STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
    systemctl stop $STOPWEBSERVER
    systemctl stop nginx
    systemctl stop haproxy

    fixing="https://raw.githubusercontent.com/owl64/AutoSC/main/"

    wget -O /etc/xray/xray.crt "${fixing}system/key/xray.crt" >/dev/null 2>&1
    wget -O /etc/xray/xray.key "${fixing}system/key/xray.key" >/dev/null 2>&1

    chmod 777 /etc/xray/xray.key

    rm -fr /etc/haproxy/hap.pem
    cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem
    
    systemctl daemon-reload
    systemctl restart nginx
    systemctl restart xray
    systemctl restart haproxy
}
fix
notif_clearcache