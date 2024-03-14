#!/bin/bash
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"

#Bot SSH
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
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_sshtrial(){
    TEXT="<code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    <code>Your Trial VPN Details</code>
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    <code>Hostname  :</code> <code>$domain</code>
    <code>Username  :</code> <code>$Login</code>
    <code>Password  :</code> <code>$Pass</code>
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    <code>OpenSSH : 22
    Dropbear      : 443, 109, 143
    SSL/TLS       : 400-900
    SSH WS TLS    : 443
    SSH WS NTLS   : 80, 8080, 8081-9999
    OVPN WS NTLS  : 80, 8080, 8880
    OVPN WS TLS   : 443
    BadVPN UDP    : 7100,7200,7300</code>
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    SSH TLS/SNI   : $domain:443@$Login:$Pass
    SSH Non TLS   : $domain:80@$Login:$Pass
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    <code>Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    Ovpn Download : https://$domain:81/
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    Save Link Account: https://$domain:81/ssh-$Login.txt
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    Dibuat Pada    : $tnggl
    Berakhir Pada  : $pup Menit
    <code>━━━━━━━━━━━━━━━━━━━━━━━━━━━━</code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Vmess
function send_vmess(){
    TEXT="
    <code> ────────────────────────────── </code>
    <code>    🏶 Xray/Vmess Account 🏶 </code>
    <code> ────────────────────────────── </code>
    <code> Remarks          : ${user}</code>
    <code> Domain           : ${domain}</code>
    <code> Wilcard          : bug.${domain}</code>
    <code> User Quota       : ${Quota1}</code>
    <code> User Ip          : ${iplimit} IP</code>
    <code> Port TLS         : 400-900</code>
    <code> Port none TLS    : 80, 8080, 8081-9999</code>
    <code> id               : ${uuid}</code>
    <code> alterId          : 0</code>
    <code> Security         : auto</code>
    <code> Network          : ws</code>
    <code> Path             : /Multi-Path</code>
    <code> Dynamic          : https://bugmu.com/path</code>
    <code> ServiceName      : vmess-grpc</code>
    <code> ────────────────────────────── </code>
    <code> Link TLS         : </code>
    <code> `${vmesslink1}` </code>
    <code> ────────────────────────────── </code>
    <code> Link none TLS    : </code>
    <code> `${vmesslink2}` </code>
    <code> ────────────────────────────── </code>
    <code> Link GRPC        : </code>
    <code> `${vmesslink3}` </code>
    <code> ────────────────────────────── </code>
    <code> Format OpenClash : https://${domain}:81/vmess-$user.txt</code>
    <code> ────────────────────────────── </code>
    <code> Aktif Selama     : $masaaktif Hari</code>
    <code> Dibuat Pada      : $tnggl</code>
    <code> Berakhir Pada    : $expe</code>
    <code> ────────────────────────────── </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialvmess(){
    TEXT="
    <code> ────────────────────────────── </code>
    <code>    🏶 Trial Vmess Account 🏶 </code> 
    <code> ────────────────────────────── </code>
    <code> Remarks          : ${user} </code>
    <code> Domain           : ${domain} </code>
    <code> User Quota       : ${Quota} </code>
    <code> Limit IP         : ${iplimit} IP </code>
    <code> Port TLS         : 400-900 </code>
    <code> Port none TLS    : 80, 8080, 8081-9999 </code>
    <code> id               : ${uuid} </code>
    <code> alterId          : 0 </code>
    <code> Security         : auto </code>
    <code> Network          : ws </code>
    <code> Path             : /Multi-Path </code>
    <code> Dynamic          : https://bugmu.com/path </code>
    <code> ServiceName      : vmess-grpc </code>
    <code> ────────────────────────────── </code>
    <code> Link TLS         : </code>
    <code> `${vmesslink1}` </code>
    <code> ────────────────────────────── </code>
    <code> Link none TLS    : </code>
    <code> `${vmesslink2}` </code>
    <code> ────────────────────────────── </code>
    <code> Link GRPC        : </code>
    <code> `${vmesslink3}` </code>
    <code> ────────────────────────────── </code>
    <code> Format OpenClash : https://${domain}:81/vmess-$user.txt </code>
    <code> ────────────────────────────── </code>
    <code> Dibuat Pada      : $tnggl </code>
    <code> Berakhir Pada    : $pup Minutes </code>
    <code> ────────────────────────────── </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Vless
function send_vless(){
    TEXT="
    <code> ────────────────────────────── </code>
    <code>    🏶 Xray/Vless Account 🏶     </code>
    <code> ────────────────────────────── </code>
    <code> Remarks     : ${user}</code>
    <code> Domain      : ${domain}</code>
    <code> Wilcard     : bug.${domain}</code>
    <code> User Quota  : ${Quota1}</code>
    <code> User Ip     : ${iplimit} IP</code>
    <code> port TLS    : 400-900</code>
    <code> Port NTLS   : 80, 8080, 8081-9999</code>
    <code> User ID     : ${uuid}</code>
    <code> Encryption  : none</code>
    <code> Path        : /Multi-Path</code>
    <code> Dynamic     : https://bugmu.com/path</code>
    <code> ────────────────────────────── </code>
    <code> Link TLS    : </code>
    <code> `${vlesslink1}` </code>
    <code> ────────────────────────────── </code>
    <code> Link NTLS   : </code>
    <code> `${vlesslink2}` </code>
    <code> ────────────────────────────── </code>
    <code> Link GRPC   : </code>
    <code> `${vlesslink3}` </code>
    <code> ────────────────────────────── </code>
    <code> Format OpenClash : https://${domain}:81/vless-$user.txt</code>
    <code> ────────────────────────────── </code>
    <code> Aktif Selama     : $masaaktif Hari</code>
    <code> Dibuat Pada      : $tnggl</code>
    <code> Berakhir Pada    : $expe</code>
    <code> ────────────────────────────── </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialvless(){
    TEXT="
    <code> ────────────────────────────── </code>
    <code>    🏶 Trial Vless Account 🏶    </code>
    <code> ────────────────────────────── </code>
    <code> Remarks     : ${user}</code>
    <code> Domain      : ${domain}</code>
    <code> Wilcard     : bug.${domain}</code>
    <code> User Quota  : ${Quota1}</code>
    <code> User Ip     : ${iplimit} IP</code>
    <code> port TLS    : 400-900</code>
    <code> Port NTLS   : 80, 8080, 8081-9999</code>
    <code> User ID     : ${uuid}</code>
    <code> Encryption  : none</code>
    <code> Path        : /Multi-Path</code>
    <code> Dynamic     : https://bugmu.com/path</code>
    <code> ────────────────────────────── </code>
    <code> Link TLS    : </code>
    <code> `${vlesslink1}` </code>
    <code> ────────────────────────────── </code>
    <code> Link NTLS   : </code>
    <code> `${vlesslink2}` </code>
    <code> ────────────────────────────── </code>
    <code> Link GRPC   : </code>
    <code> `${vlesslink3}` </code>
    <code> ────────────────────────────── </code>
    <code> Format OpenClash : https://${domain}:81/vless-$user.txt</code>
    <code> ────────────────────────────── </code>
    <code> Aktif Selama     : $masaaktif Hari</code>
    <code> Dibuat Pada      : $tnggl</code>
    <code> Berakhir Pada    : $expe</code>
    <code> ────────────────────────────── </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Trojan
function send_trojan(){
    TEXT="
    <code> ──────────────────────────────  </code>
    <code>    🏶 Xray/Trojan Account 🏶     </code>
    <code> ──────────────────────────────  </code>
    <code> Remarks          : ${user} </code> 
    <code> Host/IP          : ${domain} </code>
    <code> User Quota       : ${Quota} </code>
    <code> User IP          : ${iplimit} IP </code>
    <code> port             : 400-900 </code> 
    <code> Key              : ${uuid} </code> 
    <code> Path             : /trojan-ws </code> 
    <code> ServiceName      : trojan-grpc </code> 
    <code> ──────────────────────────────  </code>
    <code> Link WS          : </code> 
    <code> `${trojanlink}` </code>
    <code> ──────────────────────────────  </code>
    <code> Link GRPC        : </code> 
    <code> `${trojanlink1}` </code>
    <code> ──────────────────────────────  </code>
    <code> Format OpenClash : https://${domain}:81/trojan-$user.txt </code> 
    <code> ──────────────────────────────  </code>
    <code> Dibuat Pada      : $tnggl </code>
    <code> Berakhir Pada    : $pup Minutes </code>
    <code> ──────────────────────────────  </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialtrojan(){
    TEXT="
    <code> ──────────────────────────────  </code>
    <code>   🏶 Trial Trojan Account 🏶     </code>
    <code> ──────────────────────────────  </code>
    <code> Remarks          : ${user} </code> 
    <code> Host/IP          : ${domain} </code>
    <code> User Quota       : ${Quota} </code>
    <code> User IP          : ${iplimit} IP </code>
    <code> port             : 400-900 </code> 
    <code> Key              : ${uuid} </code> 
    <code> Path             : /trojan-ws </code> 
    <code> ServiceName      : trojan-grpc </code> 
    <code> ──────────────────────────────  </code>
    <code> Link WS          : </code> 
    <code> `${trojanlink}` </code>
    <code> ──────────────────────────────  </code>
    <code> Link GRPC        : </code> 
    <code> `${trojanlink1}` </code>
    <code> ──────────────────────────────  </code>
    <code> Format OpenClash : https://${domain}:81/trojan-$user.txt </code> 
    <code> ──────────────────────────────  </code>
    <code> Dibuat Pada      : $tnggl </code>
    <code> Berakhir Pada    : $pup Minutes </code>
    <code> ──────────────────────────────  </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#bot ssws
function send_shadowshocks(){
    TEXT="
    <code> ────────────────────────────── </code>
    <code> 🏶 Xray/Shadowshock Account 🏶 </code>
    <code> ────────────────────────────── </code>
    <code> Remarks     : ${user} </code>
    <code> Domain      : ${domain} </code>
    <code> Wilcard     : bug.${domain} </code>
    <code> User Quota  : ${Quota} </code>
    <code> User Ip     : ${iplimit} IP </code>
    <code> Port TLS    : 400-900 </code>
    <code> Password    : ${uuid} </code>
    <code> Cipers      : aes-128-gcm </code>
    <code> Network     : ws/grpc </code>
    <code> Path        : /ss-ws </code>
    <code> ServiceName : ss-grpc </code>
    <code> ──────────────────────────────  </code>
    <code> Link WS TLS : ${sslinkws} </code>
    <code> ──────────────────────────────  </code>
    <code> Link WS None TLS : ${nonsslinkws} </code>
    <code> ──────────────────────────────  </code>
    <code> Link GRPC : ${sslinkgrpc} </code>
    <code> ──────────────────────────────  </code>
    <code> Aktif Selama   : $masaaktif Hari </code>
    <code> Dibuat Pada    : $tnggl </code>
    <code> Berakhir Pada  : $expe </code>
    <code> ──────────────────────────────  </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialshadowshocks(){
    TEXT="
    <code> ────────────────────────────── </code>
    <code> 🏶 Trial Shadowshock Account 🏶 </code>
    <code> ────────────────────────────── </code>
    <code> Remarks     : ${user} </code>
    <code> Domain      : ${domain} </code>
    <code> Wilcard     : bug.${domain} </code>
    <code> User Quota  : ${Quota} </code>
    <code> User Ip     : ${iplimit} IP </code>
    <code> Port TLS    : 400-900 </code>
    <code> Password    : ${uuid} </code>
    <code> Cipers      : aes-128-gcm </code>
    <code> Network     : ws/grpc </code>
    <code> Path        : /ss-ws </code>
    <code> ServiceName : ss-grpc </code>
    <code> ──────────────────────────────  </code>
    <code> Link WS TLS : ${sslinkws} </code>
    <code> ──────────────────────────────  </code>
    <code> Link WS None TLS : ${nonsslinkws} </code>
    <code> ──────────────────────────────  </code>
    <code> Link GRPC : ${sslinkgrpc} </code>
    <code> ──────────────────────────────  </code>
    <code> Dibuat Pada    : $tnggl </code>
    <code> Berakhir Pada  : $pup Minutes </code>
    <code> ──────────────────────────────  </code>
    <code> 🏶 Support Us SDC Tunneling 🏶 </code>
    <code> ────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}