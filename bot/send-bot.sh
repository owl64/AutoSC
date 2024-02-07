#!/bin/bash
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"

function send_ssh(){
TEXT="
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>SSH and OVPN ACCOUNT</code>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>Username         : $Login</code>
<code>Password         : $Pass</code>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>Host             : $domain</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 443, 109</code>
<code>Port Dropbear WS : 443, 109</code>
<code>Port SSH UDP     : 1-65535</code>
<code>Port SSH WS      : 80, 8080, 8081-9999</code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 400-900</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>SSH TLS/SNI : $domain:443@$Login:$Pass</code>
<code>SSH Non TLS : $domain:80@$Login:$Pass</code>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
<code>Aktif Selama     : $masaaktif Hari</code>
<code>Dibuat Pada      : $tnggl</code>
<code>Berakhir Pada    : $expe</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
