#!/bin/bash
z="\033[96m"
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33m            Please Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            #progresbar Update
            echo -ne "\033[0;32m$GREENBG "
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33m         Please Wait Downloading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

function profile(){
    cat >/root/.profile <<EOF
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi
fi
mesg n || true
##baru
info
EOF
}

res1() {
    #wget https://raw.githubusercontent.com/wingshope/ngentod/main/limit/menu.zip
    #unzip menu.zip
    #chmod +x menu/*
    #mv menu/* /usr/local/sbin
    #rm -rf menu
    #rm -rf menu.zip
    #rm -rf update.sh
    instalasi="https://raw.githubusercontent.com/owl64/AutoSC/main/"

    mkdir menu
    cd menu
    wget -O add-bot-notif "${instalasi}menu/add-bot-notif.sh"
    wget -O add-bot-panel "${instalasi}menu/add-bot-panel.sh"
    wget -O addhost "${instalasi}menu/addhost.sh"
    wget -O addss "${instalasi}menu/addss.sh"
    wget -O addssh "${instalasi}menu/addssh.sh"
    wget -O addtr "${instalasi}menu/addtr.sh"
    wget -O addvless "${instalasi}menu/addvless.sh"
    wget -O addws "${instalasi}menu/addws.sh"
    wget -O autokill "${instalasi}menu/adutokill.sh"
    wget -O autoreboot "${instalasi}menu/autoreboot.sh"
    wget -O backup "${instalasi}menu/backup.sh"
    wget -O bot "${instalasi}menu/bot.sh"
    wget -O bw "${instalasi}menu/bw.sh"
    wget -O cekssh "${instalasi}menu/cekssh.sh"
    wget -O cekss "${instalasi}menu/cekss.sh"
    wget -O cektr "${instalasi}menu/cektr.sh"
    wget -O cekvless "${instalasi}menu/cekvless.sh"
    wget -O cekws "${instalasi}menu/cekws.sh"
    wget -O clearcache "${instalasi}menu/clearcache.sh"
    wget -O clearlog "${instalasi}menu/clearlog.sh"
    wget -O del-bot-notif "${instalasi}menu/del-bot-notif.sh"
    wget -O delexp "${instalasi}menu/delexp.sh"
    wget -O delss "${instalasi}menu/delss.sh"
    wget -O delssh "${instalasi}menu/delssh.sh"
    wget -O deltr "${instalasi}menu/deltr.sh"
    wget -O delvless "${instalasi}menu/delvless.sh"
    wget -O delws "${instalasi}menu/delws.sh"
    wget -O fixcert "${instalasi}menu/fixcert.sh"
    wget -O hapus-bot "${instalasi}menu/hapus-bot.sh"
    wget -O limitspeed "${instalasi}menu/limitspeed.sh"
    wget -O m-sshws "${instalasi}menu/m-sshws.sh"
    wget -O m-ssws "${instalasi}menu/m-ssws.sh"
    wget -O m-trojan "${instalasi}menu/m-trojan.sh"
    wget -O m-vless "${instalasi}menu/m-vless.sh"
    wget -O m-vmess "${instalasi}menu/m-vmess.sh"
    wget -O mbot "${instalasi}menu/mbot.sh"
    wget -O member "${instalasi}menu/member.sh"
    wget -O menu-backup "${instalasi}menu/menu-backup.sh"
    wget -O menu "${instalasi}menu/menu.sh"
    wget -O renewss "${instalasi}menu/renewss.sh"
    wget -O renewssh "${instalasi}menu/renewssh.sh"
    wget -O renewtr "${instalasi}menu/renewtr.sh"
    wget -O renewvless "${instalasi}menu/renewvless.sh"
    wget -O renewws "${instalasi}menu/renewws.sh"
    wget -O reset "${instalasi}menu/reset.sh"
    wget -O restart-bot "${instalasi}menu/restart-bot.sh"
    wget -O restart "${instalasi}menu/restart.sh"
    wget -O restore "${instalasi}menu/restore.sh"
    wget -O restorevmess "${instalasi}menu/restorevmess.sh"
    wget -O run "${instalasi}menu/run.sh"
    wget -O sd "${instalasi}menu/sd.sh"
    wget -O stop-bot "${instalasi}menu/stop-bot.sh"
    wget -O tendang "${instalasi}menu/tendang.sh"
    wget -O trial "${instalasi}menu/trial.sh"
    wget -O trialss "${instalasi}menu/trialss.sh"
    wget -O trialtr "${instalasi}menu/trialtr.sh"
    wget -O trialvless "${instalasi}menu/trialvless.sh"
    wget -O trialws "${instalasi}menu/trialws.sh"
    wget -O user-ss "${instalasi}menu/user-ss.sh"
    wget -O user-tr "${instalasi}menu/user-tr.sh"
    wget -O user-vless "${instalasi}menu/user-vless.sh"
    wget -O user-ws "${instalasi}menu/user-ws.sh"
    wget -O xp "${instalasi}menu/xp.sh"
    wget -O info "${instalasi}menu/info.sh"
    wget -O notif-info-bot "${instalasi}bot/notif-info-bot.sh"
    wget -O fixhaproxy "${instalasi}system/fixhaproxy.sh"
    wget -O spiner "${instalasi}system/spiner.sh"
    cd /root
    #wget ${instalasi}menu/menu.zip
    #unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    
    #rm -rf menu.zip
}

    ##Check Version SC
    versi123=$(cat /root/versi/version)

    IZIN=$( curl https://raw.githubusercontent.com/owl64/AutoSC/main/system/version | grep $versi123 ); >/dev/null 2>&1

    versiupdate=$(curl https://raw.githubusercontent.com/owl64/AutoSC/main/system/version);

function gantiSC(){
    wget -O /root/versi/version "${instalasi}system/version" >/dev/null 2>&1
}

function clearcacheAndFix(){
    cat >/etc/cron.d/fix_hap <<-END
		SHELL=/bin/sh
		PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
		2 5 * * * root /usr/local/sbin/fixhaproxy
	END

    cat >/etc/cron.d/daily_reboot <<-END
		SHELL=/bin/sh
		PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
		0 5 * * * root /sbin/reboot
	END

    #cat >/etc/cron.d/clear_cache <<-END
		#SHELL=/bin/sh
		#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
		#3 5 * * * root /usr/local/sbin/clearcache
	#END

    cat >/etc/cron.d/notif_status <<-END
		SHELL=/bin/sh
		PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
        0 6 * * * root /usr/local/sbin/notif-info-bot
	END

    systemctl restart cron
}

function update(){
    res1
    profile
    gantiSC
    clearcacheAndFix
}
netfilter-persistent
clear
echo -e "${z}┌──────────────────────────────────────────┐\033[0m"
echo -e "             UPDATE SCRIPT SDC STORE       "
echo -e "${z}└──────────────────────────────────────────┘\033[0m"
echo -e ""
            if [ $versi123 = $IZIN ]; then
            echo -e "${NC}${Green}OUR SCRIPT IS UP TO DATE !${NC}"
            rm update.sh >/dev/null 2>&1
            rm -rf update
            else
            clear
            echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
            echo -e "                 NEW UPDATE AVAIBLE              $NC"
            echo -e " ${z}└──────────────────────────────────────────┘${NC}"
            echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
            echo -e "      ${BLUE}[*] ${YELLOW}V ${versiupdate}R[Longterm]${NC}"
            echo -e "      ${BLUE}[*] ${YELLOW}Optimasi Menu ${NC}"
            echo -e "      ${BLUE}[*] ${YELLOW}Add Bot Notif Status Service ${NC}"
            echo -e "      ${BLUE}[*] ${YELLOW}Auto Fix Haproxy Not Running ${NC}"
            echo -e " ${z}└──────────────────────────────────────────┘${NC}"
            read -n 1 -s -r -p "Press [ Enter ] to Update ! CTRL + C to Cancel"
            echo -e ""
            echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
            echo -e "  \033[1;91m         UPDATE SCRIPT SERVICE\033[1;37m"
            fun_bar 'update'
            rm update.sh >/dev/null 2>&1
            echo -e "  ${Green}           UPDATE SELESAI !!"
            echo -e " ${z}└──────────────────────────────────────────┘${NC}"
            fi
echo -e ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back"
info