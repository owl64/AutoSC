#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
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
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
source /usr/local/sbin/spiner
# Valid Script
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/owl64/AutoSC/main/user/user"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/andiowl"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282217067357"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    sleep 5
    reboot
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear

domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
  echo -e ""
    echo -e " Just input a number for-"
    echo -e "  ${Green}Quota Limit${Suffix}"
    echo -e "  ${Green}Limit IP${Suffix}"
    echo -e " Format GB"
    echo -e ""
    echo -e " ${YELLOW}0${Suffix} for Unlimited"
    echo -e " ${YELLOW}0${Suffix} for No Limit"
    echo -e ""
  echo -e "\033[1;93m────────────────────────────────────────────\\033[0m"
	echo -e ""
  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
  echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[0;34────────────────────────────────────────────\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done

read -p "UUID : " uuid
read -p "Expired (days): " masaaktif
read -p "Limit User (GB): " Quota
read -p "Limit User (IP): " iplimit
echo -e ""
start_spinner " Please wait, Restore data...."
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray
sleep 1
stop_spinner
echo -e " ${Green}Success Restore Data....${Suffix}"
sleep 2

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"

if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vless/ip
echo -e "$iplimit" > /etc/kyt/limit/vless/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

# Menghapus semua karakter kecuali angka, MB, dan GB
sanitized_input=$(echo "${Quota}" | sed -E 's/[^0-9MBmbGBgb]*//g')

# Mendeteksi apakah input berisi MB atau GB
if [[ $sanitized_input =~ [Mm][Bb]$ ]]; then
  c=$(echo "${sanitized_input}" | sed 's/[Mm][Bb]$//')
  d=$((${c} * 1024 * 1024))
elif [[ $sanitized_input =~ [Gg][Bb]$ ]]; then
  c=$(echo "${sanitized_input}" | sed 's/[Gg][Bb]$//')
  d=$((${c} * 1024 * 1024 * 1024))
else
  echo "Input tidak valid. Harap masukkan nilai dengan satuan MB atau GB (contoh: 20MB, 2GB)"
  exit 1
fi

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi

if [ ! -e /etc/trojan/${user} ]; then
    Quota1="Unlimited"
else
    baca1=$(cat /etc/vless/${user})
    Quota1=$(con ${baca1})
fi

if [ ! -e /etc/kyt/limit/vless/ip/$user ]; then
    iplimit="Unlimited"
else
    iplimit=$(cat /etc/kyt/limit/vless/ip/$user)
fi

DATADB=$(cat /etc/vless/.vless.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vless/.vless.db
clear

cat >/var/www/html/vless-$user.txt <<-END

=========================
  SDC VPN TUNNELING 
=========================
# Format Vless WS TLS

- name: Vless-$user-WS TLS
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}

# Format Vless WS Non TLS

- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true

# Format Vless gRPC (SNI)

- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
    grpc-service-name: vless-grpc

=========================
Link Akun Vless 
=========================
Link TLS      : 
${vlesslink1}
=========================
Link none TLS : 
${vlesslink2}
=========================
Link GRPC     : 
${vlesslink3}
=========================
END

clear
echo -e ""
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " RESTORED VLESS ACCOUNT           "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "Wilcard     : bug.${domain}"
echo -e "User Quota  : ${Quota}"
echo -e "User Ip     : ${iplimit} IP"
echo -e "port TLS    : 400-900"
#echo -e "Port DNS    : 443"
echo -e "Port NTLS   : 80, 8080, 8081-9999"
echo -e "User ID     : ${uuid}"
#echo -e "Xray Dns.   : ${NS}"
#echo -e "Pubkey.     : ${PUB}"
echo -e "Encryption  : none"
echo -e "Path        : /Multi-Path"
echo -e "Dynamic     : https://bugmu.com/path"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link TLS    : ${vlesslink1}"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link NTLS   : ${vlesslink2}"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link GRPC   : ${vlesslink3}"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
read -n 1 -s -r -p "Press any key to back on vless menu"
m-vless