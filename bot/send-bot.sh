#!/bin/bash
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"

#Bot SSH
function send_ssh(){
    TEXT="
    ──────────────────────────────
        🏶 <strong>SSH and OVPN ACCOUNT</strong> 🏶
    ──────────────────────────────
    ⧆ Host             : <code>$domain</code>
    ⧆ Username         : <code>$Login</code>
    ⧆ Password         : <code>$Pass</code>
    ──────────────────────────────
    ⧆ Port OpenSSH     : 443, 80, 22
    ⧆ Port Dropbear    : 443, 109
    ⧆ Port Dropbear WS : 443, 109
    ⧆ Port SSH UDP     : 1-65535
    ⧆ Port SSH WS      : 80, 8080, 8081-9999
    ⧆ Port SSH SSL WS  : 443
    ⧆ Port SSL/TLS     : 400-900
    ⧆ Port OVPN WS SSL : 443
    ⧆ Port OVPN SSL    : 443
    ⧆ Port OVPN TCP    : 1194
    ⧆ Port OVPN UDP    : 2200
    ⧆ BadVPN UDP       : 7100, 7300, 7300
    ──────────────────────────────
    ⧆ <strong>SSH TLS/SNI : </strong> 
    <pre>$domain:443@$Login:$Pass</pre>
    ⧆ <strong>SSH Non TLS : </strong>
    <pre>$domain:80@$Login:$Pass</pre>
    ──────────────────────────────
    ⧆ <strong>Payload WSS: </strong>
    <pre>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</pre>
    ──────────────────────────────
    ⧆ Aktif Selama     : $masaaktif Hari
    ⧆ Dibuat Pada      : $tnggl
    ⧆ Berakhir Pada    : $expe
    ──────────────────────────────
    🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
    ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_sshtrial(){
    TEXT="
    ──────────────────────────────
       🏶 <strong>Your Trial VPN Details</strong> 🏶
    ──────────────────────────────
    ⧆ Hostname  : <code>$domain</code>
    ⧆ Username  : <code>$Login</code>
    ⧆ Password  : <code>$Pass</code>
    ──────────────────────────────
    ⧆ OpenSSH       : 22
    ⧆ Dropbear      : 443, 109, 143
    ⧆ SSL/TLS       : 400-900
    ⧆ SSH WS TLS    : 443
    ⧆ SSH WS NTLS   : 80, 8080, 8081-9999
    ⧆ OVPN WS NTLS  : 80, 8080, 8880
    ⧆ OVPN WS TLS   : 443
    ⧆ UDP           : 1-65353
    ⧆ BadVPN UDP    : 7100,7200,7300
    ──────────────────────────────
    ⧆ SSH TLS/SNI   : 
    <pre>$domain:443@$Login:$Pass</pre>
    ⧆ SSH Non TLS   : 
    <pre>$domain:80@$Login:$Pass</pre>
    ──────────────────────────────
    ⧆ Payload WSS : 
    <pre>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</pre>
    ──────────────────────────────
    ⧆ Ovpn Download : 
    <pre>https://$domain:81/</pre>
    ──────────────────────────────
    ⧆ Save Link Account: 
    <pre>https://$domain:81/ssh-$Login.txt</pre>
    ──────────────────────────────
    ⧆ Dibuat Pada    : $tnggl
    ⧆ Berakhir Pada  : $pup Menit
    ──────────────────────────────
    🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
    ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Vmess
function send_vmess(){
    TEXT="
     ────────────────────────────── 
        🏶 <strong>Xray/Vmess Account</strong> 🏶 
     ────────────────────────────── 
     ⧆ Remarks          : ${user}
     ⧆ Domain           : ${domain}
     ⧆ Wilcard          : bug.${domain}
     ⧆ User Quota       : ${Quota1}
     ⧆ User Ip          : ${iplimit} IP
     ⧆ Port TLS         : 400-900
     ⧆ Port none TLS    : 80, 8080, 8081-9999
     ⧆ id               : ${uuid}
     ⧆ alterId          : 0
     ⧆ Security         : auto
     ⧆ Network          : ws
     ⧆ Path             : /Multi-Path
     ⧆ Dynamic          : https://bugmu.com/path
     ⧆ ServiceName      : vmess-grpc
     ────────────────────────────── 
     ⧆ <strong>Link TLS : </strong> 
     <pre>${vmesslink1}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link none TLS : </strong> 
     <pre>${vmesslink2}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link GRPC : </strong>
     <pre>${vmesslink3}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Format OpenClash : </strong>
     <pre>https://${domain}:81/vmess-$user.txt</pre>
     ────────────────────────────── 
     ⧆ Aktif Selama     : $masaaktif Hari
     ⧆ Dibuat Pada      : $tnggl
     ⧆ Berakhir Pada    : $expe
     ────────────────────────────── 
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialvmess(){
    TEXT="
     ────────────────────────────── 
        🏶 <strong>Trial Vmess Account</strong> 🏶  
     ────────────────────────────── 
     ⧆ Remarks          : ${user} 
     ⧆ Domain           : ${domain} 
     ⧆ User Quota       : ${Quota} 
     ⧆ Limit IP         : ${iplimit} IP 
     ⧆ Port TLS         : 400-900 
     ⧆ Port none TLS    : 80, 8080, 8081-9999 
     ⧆ id               : ${uuid} 
     ⧆ alterId          : 0 
     ⧆ Security         : auto 
     ⧆ Network          : ws 
     ⧆ Path             : /Multi-Path 
     ⧆ Dynamic          : https://bugmu.com/path 
     ⧆ ServiceName      : vmess-grpc 
     ────────────────────────────── 
     ⧆ <strong>Link TLS : </strong> 
     <pre>${vmesslink1}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link none TLS : </strong>
     <pre>${vmesslink2}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link GRPC : </strong>
     <pre>${vmesslink3}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Format OpenClash : </strong>
     <pre>https://${domain}:81/vmess-$user.txt</pre> 
     ────────────────────────────── 
     ⧆ Dibuat Pada      : $tnggl 
     ⧆ Berakhir Pada    : $pup Minutes 
     ────────────────────────────── 
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Vless
function send_vless(){
    TEXT="
     ────────────────────────────── 
        🏶 <strong>Xray/Vless Account</strong> 🏶     
     ────────────────────────────── 
     ⧆ Remarks     : ${user}
     ⧆ Domain      : ${domain}
     ⧆ Wilcard     : bug.${domain}
     ⧆ User Quota  : ${Quota1}
     ⧆ User Ip     : ${iplimit} IP
     ⧆ port TLS    : 400-900
     ⧆ Port NTLS   : 80, 8080, 8081-9999
     ⧆ User ID     : ${uuid}
     ⧆ Encryption  : none
     ⧆ Path        : /Multi-Path
     ⧆ Dynamic     : https://bugmu.com/path
     ────────────────────────────── 
     ⧆ <strong>Link TLS : </strong>
     <pre>${vlesslink1}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link NTLS : </strong>
     <pre>${vlesslink2}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link GRPC : </strong>
     <pre>${vlesslink3}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Format OpenClash : </strong>
     <pre>https://${domain}:81/vless-$user.txt</pre>
     ────────────────────────────── 
     ⧆ Aktif Selama     : $masaaktif Hari
     ⧆ Dibuat Pada      : $tnggl
     ⧆ Berakhir Pada    : $expe
     ────────────────────────────── 
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialvless(){
    TEXT="
     ────────────────────────────── 
        🏶 <strong>Trial Vless Account</strong> 🏶    
     ────────────────────────────── 
     ⧆ Remarks     : ${user}
     ⧆ Domain      : ${domain}
     ⧆ Wilcard     : bug.${domain}
     ⧆ User Quota  : ${Quota1}
     ⧆ User Ip     : ${iplimit} IP
     ⧆ port TLS    : 400-900
     ⧆ Port NTLS   : 80, 8080, 8081-9999
     ⧆ User ID     : ${uuid}
     ⧆ Encryption  : none
     ⧆ Path        : /Multi-Path
     ⧆ Dynamic     : https://bugmu.com/path
     ────────────────────────────── 
     ⧆ <strong>Link TLS : </strong>
     <pre>${vlesslink1}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link NTLS   : </strong>
     <pre>${vlesslink2}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link GRPC   : </strong>
     <pre>${vlesslink3}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Format OpenClash : </strong>
     <pre>https://${domain}:81/vless-$user.txt</pre>
     ────────────────────────────── 
     ⧆ Aktif Selama     : $masaaktif Hari
     ⧆ Dibuat Pada      : $tnggl
     ⧆ Berakhir Pada    : $expe
     ────────────────────────────── 
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Trojan
function send_trojan(){
    TEXT="
     ──────────────────────────────  
        🏶 <strong>Xray/Trojan Account</strong> 🏶     
     ──────────────────────────────  
     ⧆ Remarks          : ${user}  
     ⧆ Host/IP          : ${domain} 
     ⧆ User Quota       : ${Quota} 
     ⧆ User IP          : ${iplimit} IP 
     ⧆ port             : 400-900  
     ⧆ Key              : ${uuid}  
     ⧆ Path             : /trojan-ws  
     ⧆ ServiceName      : trojan-grpc  
     ──────────────────────────────  
     ⧆ <strong>Link WS : </strong>  
     <pre>${trojanlink}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong> 
     <pre>${trojanlink1}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Format OpenClash : </strong> 
     <pre>https://${domain}:81/trojan-$user.txt</pre>  
     ──────────────────────────────  
     ⧆ Dibuat Pada      : $tnggl 
     ⧆ Berakhir Pada    : $pup Minutes 
     ──────────────────────────────  
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialtrojan(){
    TEXT="
     ──────────────────────────────  
       🏶 <strong>Trial Trojan Account</strong> 🏶     
     ──────────────────────────────  
     ⧆ Remarks          : ${user}  
     ⧆ Host/IP          : ${domain} 
     ⧆ User Quota       : ${Quota} 
     ⧆ User IP          : ${iplimit} IP 
     ⧆ port             : 400-900  
     ⧆ Key              : ${uuid}  
     ⧆ Path             : /trojan-ws  
     ⧆ ServiceName      : trojan-grpc  
     ──────────────────────────────  
     ⧆ <strong>Link WS  : </strong> 
     </pre>${trojanlink}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong>  
     </pre>${trojanlink1}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Format OpenClash : </strong>
     https://${domain}:81/trojan-$user.txt  
     ──────────────────────────────  
     ⧆ Dibuat Pada      : $tnggl 
     ⧆ Berakhir Pada    : $pup Minutes 
     ──────────────────────────────  
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#bot ssws
function send_shadowshocks(){
    TEXT="
     ────────────────────────────── 
     🏶 <strong>Xray/Shadowshock Account</strong> 🏶 
     ────────────────────────────── 
     ⧆ Remarks     : ${user} 
     ⧆ Domain      : ${domain} 
     ⧆ Wilcard     : bug.${domain} 
     ⧆ User Quota  : ${Quota} 
     ⧆ User Ip     : ${iplimit} IP 
     ⧆ Port TLS    : 400-900 
     ⧆ Password    : ${uuid} 
     ⧆ Cipers      : aes-128-gcm 
     ⧆ Network     : ws/grpc 
     ⧆ Path        : /ss-ws 
     ⧆ ServiceName : ss-grpc 
     ──────────────────────────────  
     ⧆ <strong>Link WS TLS : </strong>
     <pre>${sslinkws}</pre>
     ──────────────────────────────  
     ⧆ <strong>Link WS None TLS : </strong>
     <pre>${nonsslinkws}</pre>
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong>
     <pre>${sslinkgrpc}</pre> 
     ──────────────────────────────  
     ⧆ Aktif Selama   : $masaaktif Hari 
     ⧆ Dibuat Pada    : $tnggl 
     ⧆ Berakhir Pada  : $expe 
     ──────────────────────────────  
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialshadowshocks(){
    TEXT="
     ────────────────────────────── 
     🏶 <strong>Trial Shadowshock Account</strong> 🏶 
     ────────────────────────────── 
     ⧆ Remarks     : ${user} 
     ⧆ Domain      : ${domain} 
     ⧆ Wilcard     : bug.${domain} 
     ⧆ User Quota  : ${Quota} 
     ⧆ User Ip     : ${iplimit} IP 
     ⧆ Port TLS    : 400-900 
     ⧆ Password    : ${uuid} 
     ⧆ Cipers      : aes-128-gcm 
     ⧆ Network     : ws/grpc 
     ⧆ Path        : /ss-ws 
     ⧆ ServiceName : ss-grpc 
     ──────────────────────────────  
     ⧆ <strong>Link WS TLS : </strong>
     <pre>${sslinkws}</pre>
     ──────────────────────────────  
     ⧆ <strong>Link WS None TLS : </strong> 
     <pre>${nonsslinkws}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong>
     <pre>${sslinkgrpc}</pre> 
     ──────────────────────────────  
     ⧆ Dibuat Pada    : $tnggl 
     ⧆ Berakhir Pada  : $pup Minutes 
     ──────────────────────────────  
     🏶 <strong>Support Us SDC Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}