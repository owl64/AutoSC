CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"

function send_ssh(){
TEXT="
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>     SSH & OVPN ACCOUNT</code>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
Username         : $Login
Password         : $Pass
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8081-9999
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
SSH TLS/SNI : $domain:443@$Login:$Pass
SSH Non TLS : $domain:80@$Login:$Pass
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
"
}
