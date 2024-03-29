#!/bin/bash
clear

PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
CITY=$(cat /etc/xray/city)
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m               CONFIG TROJAN ACCOUNT                   \e[0m"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ Enter ] to back on menu trojan"
    trojan
fi

  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m                CONFIG TROJAN ACCOUNT                 \E[0m"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
iplim=$(cat /etc/kyt/limit/trojan/ip/$user)
domain=$(cat /etc/xray/domain)
uuid=$(grep -E "^### " "/etc/trojan/.trojan.db" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
Quota=$(grep -E "^### " "/etc/trojan/.trojan.db" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
cat >/var/www/html/trojan-$user.txt <<-END
=========================
  WINGS VPN TUNNELING
=========================

# Format Trojan GO/WS

- name: Trojan-$user-GO/WS
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}

# Format Trojan gRPC

- name: Trojan-$user-gRPC
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
  grpc-service-name: trojan-grpc
  
END
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=none&host=${domain}&type=ws#${user}"
clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e " CREATE TROJAN ACCOUNT          "
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Remarks          : ${user}" 
echo -e "Host/IP          : ${domain}"
echo -e "Host XrayDNS     : ${NS}"
echo -e "Pub Key          : ${PUB}"
echo -e "Quota            : ${Quota}"
echo -e "Limit IP         : ${iplim}"
echo -e "port TLS/WS      : 443" 
echo -e "port None TLS/WS : 80,8880,8080"
echo -e "port GRPC        : 443"
echo -e "port OpenClash   : 443"
echo -e "port CDN TLS/WS  : 443"
echo -e "port None TLS/WS : 80,8880,8080"
echo -e "port CDN Grpc    : 443"
echo -e "Key              : ${uuid}" 
echo -e "Security         : auto"
echo -e "Network          : ws"
echo -e "Dynamic          : http://bugmu.com/path"
echo -e "Path             : /trojan-ws" 
echo -e "ServiceName      : trojan-grpc" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link WS          : ${trojanlink}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link None Ws     : ${trojanlink2}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link GRPC        : ${trojanlink1}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link CDN & OpenClash : https://${domain}:81/trojan-$user.txt"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link Qris        :https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=${trojanlink}"
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Berakhir Pada    : $exp"
echo -e "${z} ──────────────────────────────${NC}"
echo "" 
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu