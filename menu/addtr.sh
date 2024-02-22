#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
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
z='\033[96m'
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
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
    echo -e "      \033[0;36mTelegram${NC} t.me/owl64"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282217067357"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    sleep 5
    reboot
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
source /var/lib/kyt/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
#tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Create Trojan Account${NC}           "
echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
echo -e "${z}  ──────────────────────────────────${NC}"
    echo -e "    ${biru}Just input a number for-"
    echo -e "     ${Green}Limit IP${Suffix}"
    echo -e ""
    echo -e "    ${biru}Format GB"
    echo -e "     ${ORANGE}20MB/2GB For Quota Limit${Suffix}"
    echo -e "     ${ORANGE}0${Suffix} ${biru}for Unlimited"
    echo -e "     ${ORANGE}0${Suffix} ${biru}for No Limit"
echo -e "${z}  ──────────────────────────────────${NC}"
echo -e ""
		read -rp "   User : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
echo -e "${ORANGE}${Bold} ┌──────────────────────────────────┐${NC}"
echo -e "         ${biru}Create Trojan Account${NC}           "
echo -e "${ORANGE}${Bold} └──────────────────────────────────┘${NC}"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\033[0;34────────────────────────────────────────────\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
			m-trojan
		fi
	done

if [ ! -e /etc/brand ]; then
  mkdir -p /etc/brand
fi

if [ ! -e /etc/brand/.brand.db ]; then
    touch /etc/brand/.brand.db
fi

cekbrand=$(cat /etc/brand/.brand.db | grep '#trojan#' | cut -d ' ' -f 2 | sort | uniq)

if [[ -z ${cekbrand} ]]; then
  uuid=$(cat /proc/sys/kernel/random/uuid)
else
  uuid="${cekbrand}-${user}"
fi

read -p "   Expired (days)    : " masaaktif
read -p "   Limit User (MB/GB): " Quota
read -p "   Limit User (IP)   : " iplimit
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

# Link Trojan Akun
systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bugkamu.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"

cat >/var/www/html/trojan-$user.txt <<-END
=========================
   SDC VPN Tunneling 
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

systemctl reload xray
systemctl reload nginx
service cron restart
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/trojan/ip
echo -e "$iplimit" > /etc/kyt/limit/trojan/ip/$user
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
  echo "${d}" >/etc/trojan/${user}
fi

if [ ! -e /etc/trojan/${user} ]; then
    Quota1="Unlimited"
else
    baca1=$(cat /etc/trojan/${user})
    Quota1=$(con ${baca1})
fi

DATADB=$(cat /etc/trojan/.trojan.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/trojan/.trojan.db
clear
echo -e ""
echo -e "${z} ──────────────────────────────${NC}"
echo -e " CREATE TROJAN ACCOUNT          "
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Remarks          : ${user}" 
echo -e "Host/IP          : ${domain}"
echo -e "Wilcard          : bug.${domain}"
echo -e "User Quota       : ${Quota1}"
echo -e "User Ip          : ${iplimit} IP"
echo -e "port             : 400-900" 
echo -e "Key              : ${uuid}" 
echo -e "Xray Dns.        : ${NS}"
echo -e "Pubkey.          : ${PUB}"
echo -e "Path             : /Multi-Path/trojan-ws"
echo -e "Dynamic          : https://bugmu.com/path"
echo -e "ServiceName      : trojan-grpc" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link WS          : ${trojanlink}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Link GRPC        : ${trojanlink1}" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt" 
echo -e "${z} ──────────────────────────────${NC}"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "${z} ──────────────────────────────${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on trojan menu"
m-trojan