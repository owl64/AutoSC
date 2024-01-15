source /usr/local/sbin/spiner
function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}
function changelimitquotavmess(){
    clear
    data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
    defaultgb="60"
    d=$((${defaultgb} * 1024 * 1024 * 1024))

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit Quota              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e ""
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e "         Username                 Quota       "
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e ""
        for akun in "${data[@]}"
        if [[ -z "/etc/vmess/$akun" ]]; then
            echo "${d}" >/etc/vmess/${akun}    
        fi
        do
            wey=$(cat /etc/vmess/${akun})
            gb=$(con ${wey})
        done
    printf "         %-13s %-7s %-8s %2s\n"   "${akun}" "          $gb";
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [[ $data == $change ]]; then
        start_spinner " Please wait...."
        rm /etc/vmess/$change
        sleep 1
        lmn=$((${limitnew} * 1024 * 1024 * 1024))
        echo "$lmn" >> /etc/vmess/$change
        echo -e " ${Green}Success Change Limit${Suffix}"
        sleep 2
        m-vmess
    else
        echo -e "     ${RED}Incorect Username Input, Please Try Again"
        sleep 1
        m-vmess
    fi
}
function changeiplimitvmess(){
    clear
    data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
    defaultip="2"

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit Quota              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e ""
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e "         Username                 IP Limit     "
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e ""
        for akun in "${data[@]}"
        if [[ -z "/etc/vmess/$akun" ]]; then
            echo "${defaultip}" >/etc/kyt/limit/vmess/ip/${akun}    
        fi
        do
            iplimit=$(cat /etc/kyt/limit/vmess/ip/${akun})
        done
    printf "         %-13s %-7s %-8s %2s\n"   "${akun}" "          $iplimit";
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [[ $data == $change ]]; then
        start_spinner " Please wait...."
        rm /etc/kyt/limit/vmess/ip/$change
        sleep 1
        echo "$limitnew" >> /etc/kyt/limit/vmess/ip/$change
        echo -e " ${Green}Success Change Limit${Suffix}"
        sleep 2
        m-vmess
    else
        echo -e "     ${RED}Incorect Username Input, Please Try Again"
        sleep 1
        m-vmess
    fi
}