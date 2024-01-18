# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
Suffix="\033[0m"

ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/owl64/AutoSC/main/user/user | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/owl64/AutoSC/main/user/user | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS https://raw.githubusercontent.com/owl64/AutoSC/main/user/user | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | Geo Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON✓${NC}"
else
   status_ssh="${RED}🔴${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON✓${NC}"
else
    status_ws_epro="${RED}🔴${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON✓${NC}"
else
   status_haproxy="${RED}🔴${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON✓${NC}"
else
   status_xray="${RED}🔴${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON✓${NC}"
else
   status_nginx="${RED}🔴${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON✓${NC}"
else
   status_dropbear="${RED}🔴${NC} "
fi


### Version SC
versiedition=$(cat /root/versi/version)

#Install UDP
function installUDP(){
    wget https://raw.githubusercontent.com/owl64/AutoSC/main/Udp/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh
}

#SETTINGS MENU
function setingsmenu(){
    clear

    echo -e " ${z}┌─────────────────────────────────────────────┐${NC}"
    echo -e " ${z}│$NC$purple             SETINGS MENU               $NC${z}│$NC"
    echo -e " ${z}└─────────────────────────────────────────────┘${NC}"
    echo -e ""
    echo -e " ${z}$NC [${grenbo}01${NC}]${z} Auto Reboot$NC"
    echo -e " ${z}$NC [${grenbo}02${NC}]${z} Backup or Restore$NC"
    echo -e " ${z}$NC [${grenbo}03${NC}]${z} Change Domain$NC"
    echo -e " ${z}$NC [${grenbo}04${NC}]${z} Cert SSL$NC"
    echo -e " ${z}$NC [${grenbo}05${NC}]${z} Cek Port$NC"
    echo -e " ${z}$NC [${grenbo}06${NC}]${z} Cek Bandwith$NC"
    echo -e " ${z}$NC [${grenbo}07${NC}]${z} Cek Service$NC"
    echo -e " ${z}$NC [${grenbo}08${NC}]${z} Clear Cache$NC"
    echo -e " ${z}$NC [${grenbo}09${NC}]${z} Clear Log$NC"
    echo -e " ${z}$NC [${grenbo}10${NC}]${z} Dell ALL Expired Account$NC"
    echo -e " ${z}$NC [${grenbo}11${NC}]${z} Install UDP$NC"
    echo -e " ${z}$NC [${grenbo}12${NC}]${z} Speedtest VPS$NC"
    echo -e " ${z}$NC [${grenbo}0${NC}]${z}  Back To Menu$NC"
    echo -e ""
    echo -e "${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -p " Select Menu From Option: " opt
    echo -e ""
    case $opt in
    1 | 01)
    clear
    autoreboot
    ;;
    2 | 02)
    clear
    menu-backup
    ;;
    3 | 03)
    clear
    addhost
    ;;
    4 | 04)
    clear
    fixcert
    ;;
    5 | 05)
    clear
    echo ""
    read -n 3 -s -r -p "Fitur Maintenance, Press Enter to Back Menu"
    setingsmenu
    ;;
    6 | 06)
    clear
    bw
    ;;
    7 | 07)
    clear
    run
    ;;
    8 | 08)
    clear
    clearcache
    ;;
    9 | 09)
    clear
    clearlog
    ;;
    10)
    clear
    xp
    echo ""
    echo -e " ${GREEN} Back to Setings menu in 1 sec ${NC}"
    sleep 1
    setingsmenu
    ;;
    11)
    clear
    installUDP
    ;;
    12)
    clear
    speedtest
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
    ;;
    0)
    menu
    ;;
    esac
}

function brandname(){
   clear

   if [ ! -e /etc/brand ]; then
      mkdir -p /etc/brand
   fi
   file_path="/etc/brand/.brand.db"

   if [ -s "$file_path" ]; then
      branduuid="${green}ON${NC}"
   else
      branduuid="${RED}OFF${NC}"
   fi

   source /usr/local/sbin/brandname
   echo -e " ${z}┌─────────────────────────────────────────────┐${NC}"
   echo -e " ${z}│$NC$purple             BRAND NAME               $NC${z}│$NC"
   echo -e " ${z}└─────────────────────────────────────────────┘${NC}"
   echo -e ""
   echo -e "   Set UUID with Brand Name = $branduuid"
   echo -e ""
   echo -e " ${z}$NC   [${grenbo}01${NC}]${z} Add Brand Name$NC"
   echo -e " ${z}$NC   [${grenbo}02${NC}]${z} Change Brand Name$NC"
   echo -e " ${z}$NC   [${grenbo}03${NC}]${z} Deactivate Brand Name For UUID$NC"
   echo -e ""
   echo -e " ${z}$NC   [${RED}00${NC}]${z}${RED} Back to Menu$NC"
   echo -e "${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
   read -p " Select Menu From Option: " opt
   echo -e ""
   case $opt in
      1 | 01)
      clear
      addbrand
      ;;
      2 | 02)
      clear
      changebrand
      ;;
      3 | 03)
      clear
      offbrand
      ;;
      0 | 00)
      clear
      menu
      ;;
   esac
}

r="\033[1;31m"  #REDTERANG
a=" ${CYAN}ACCOUNT PREMIUM" 
echo -e " "
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC$purple                    SCRIPT SDC STORE                      $NC${z}│$NC"
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC${z} System OS ${NC}     $Blue=$NC $MODEL${NC}"
echo -e " ${z}│$NC${z} Core System ${NC}   $Blue=$NC $CORE${NC}"
echo -e " ${z}│$NC${z} Server RAM ${NC}    $Blue=$NC $uram/$RAM MB $NC"
echo -e " ${z}│$NC${z} Uptime Server ${NC} $Blue=$NC $SERONLINE${NC}"
echo -e " ${z}│$NC${z} Domain ${NC}        $Blue=$NC $domain${NC}"
echo -e " ${z}│$NC${z} IP VPS ${NC}        $Blue=$NC $IPVPS${NC}"
echo -e " ${z}│$NC${z} ISP ${NC}           $Blue=$NC $ISP${NC}"
echo -e " ${z}│$NC${z} City ${NC}          $Blue=$NC $CITY${NC}"
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│ ${NC}${z} SSH$NC : $status_ssh" "        ${z} NGINX$NC : $status_nginx" "        ${z} XRAY$NC : $status_xray      $NC${z}│$NC" 
echo -e " ${z}│ ${NC}${z} WS-ePRO$NC : $status_ws_epro" "    ${z} DROPBEAR$NC : $status_dropbear" "     ${z} HAPROXY$NC : $status_haproxy   $NC${z}│$NC" 
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}    $NC [${grenbo}01${NC}]${z} SSH MENU$NC       $NC [${grenbo}06${NC}]${z} SETINGS MENU$NC"
echo -e " ${z}    $NC [${grenbo}02${NC}]${z} VMESS MENU$NC     $NC [${grenbo}07${NC}]${z} BOT PANEL MENU$NC"    
echo -e " ${z}    $NC [${grenbo}03${NC}]${z} VLESS MENU$NC     $NC [${grenbo}08${NC}]${z} BRAND NAME MENU$NC"   
echo -e " ${z}    $NC [${grenbo}04${NC}]${z} TROJAN MENU$NC    $NC [${grenbo}09${NC}]${z} UPDATE MENU$NC" 
echo -e " ${z}    $NC [${grenbo}05${NC}]${z} SHADOW MENU$NC    $NC [${grenbo}10${NC}]${z} EXIT TO MENU$NC"
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e " ${z}┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC${z} Version$NC       ${Blue}=$NC $YELL V$versiedition R[Longterm]"
echo -e " ${z}│$NC${z} User$NC          ${Blue}=$NC $username"
echo -e " ${z}│$NC${z} Script Status$NC ${Blue}=$NC $sts "
echo -e " ${z}│$NC${z} Expiry script$NC $Blue=$green $exp $certifacate Days$NC "
echo -e " ${z}└─────────────────────────────────────────────────────┘${NC}"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
setingsmenu
;;
7 | 07)
clear
add-bot-panel
;;
8 | 08)
clear
brandname
;;
9 | 09)
clear
wget https://raw.githubusercontent.com/owl64/AutoSC/main/update.sh && chmod +x update.sh && ./update.sh
;;
10 | 10)
figlet SDC STORE 
exit
;;
x)
menu
;;
*)
echo -e ""
menu
;;
esac