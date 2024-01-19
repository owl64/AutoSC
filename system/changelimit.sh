#!/bin/bash
source /usr/local/sbin/spiner
function con(){
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes} B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 )) KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 )) MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 )) GB"
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
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e "         Username                 Quota       "
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e ""
        directory="/etc/vmess"

        for akun in "${data[@]}"; do
            filename="$akun"

            # Mencari file di direktori
            if [ -e "$directory/$filename" ]; then
                wey=$(cat "/etc/vmess/${akun}")
                gb=$(con "${wey}")
                printf "         %-13s %-7s %-8s %2s\n"    "${akun}" "          $gb"
            else
                echo "Account $filename, Limit Quota Not Found in $directory."

                # Membuat file jika tidak ditemukan
                touch "$directory/$filename"
                echo "${d}" >"/etc/vmess/${akun}"
            fi          
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-vmess
    else
        ceklagi=$(grep -wE "^### $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."
            truncate -s 0 /etc/vmess/$change
            sleep 1
            lmn=$((${limitnew} * 1024 * 1024 * 1024))
            echo "$lmn" >> /etc/vmess/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-vmess
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vmess
        fi
    fi
}
function changeiplimitvmess(){
    clear
    data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
    defaultip="2"

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE      Change Limit IP              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e "         Username                 IP Limit     "
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e ""
        directory="/etc/kyt/limit/vmess/ip"

        for akun in "${data[@]}"; do
            filename="$akun"

            # Mencari file di direktori
            if [ -e "$directory/$filename" ]; then
                iplimit=$(cat $directory/$akun)
                printf "         %-13s %-7s %-8s %2s\n"   "${akun}" "          $iplimit IP";
            else
                echo "Account $filename, Limit Quota Not Found in $directory."

                # Membuat file jika tidak ditemukan
                touch "$directory/$filename"
                echo "${defaultip}" >"/etc/kyt/limit/vmess/ip/${akun}"
            fi          
        done
    echo -e ""
    read -rp "  Input Username to Change Limit : " change
    read -rp "  Input New Limit : " limitnew
    echo -e ""
    if [ -z $change ]; then
        m-vmess
    else
        ceklagi=$(grep -wE "^### $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."
            truncate -s 0 /etc/kyt/limit/vmess/ip/$change
            sleep 1
            echo "$limitnew" >> /etc/kyt/limit/vmess/ip/$change
            stop_spinner
            echo -e " ${Green}Success Change Limit${Suffix}"
            sleep 2
            m-vmess
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vmess
        fi
    fi
}
function resetquotavmess(){
    clear
    data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);

    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE       Reset Usage               $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e "         Username                 Usage       "
    echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ${NC}"
    echo -e ""
        directory="/etc/limit/vmess"

            for akun in "${data[@]}"; do
                filename="$akun"

                # Mencari file di direktori
                if [ -e "$directory/$filename" ]; then
                    wey=$(cat "/etc/limit/vmess/${akun}")
                    gb=$(con "${wey}")
                    printf "         %-13s %-7s %-8s %2s\n"     "${akun}" "          $gb"
                else
                    echo "Usage $filename, Quota Not Found in $directory."
                fi          
            done
    echo -e ""
    read -rp "  Input Username for Reset Usage : " change
    echo -e ""
    if [ -z $change ]; then
        m-vmess
    else
        ceklagi=$(grep -wE "^### $change" "/etc/xray/config.json" | cut -d ' ' -f 2 | sort | uniq)
        if [[ $ceklagi == $change ]]; then
            start_spinner " Please wait...."
            truncate -s 0 /etc/limit/vmess/$change
            sleep 1
            stop_spinner
            echo -e " ${Green}Success Reset Usage Account${Suffix}"
            sleep 2
            m-vmess
        else
            echo -e "     ${RED}Incorect Username Input, Please Try Again"
            sleep 1
            m-vmess
        fi
    fi
}