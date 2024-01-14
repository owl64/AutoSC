function head(){
   echo -e " ${z}┌─────────────────────────────────────────────┐${NC}"
   echo -e " ${z}│$NC$purple             SET BRAND NAME               $NC${z}│$NC"
   echo -e " ${z}└─────────────────────────────────────────────┘${NC}"
}

function addbrand(){
    head
    echo -e ""
    echo -e " Example : Brand-"
    echo -e "  Input Brand Name : " name
    echo -e "  For Core :"
    echo -e "  [${grenbo}01${NC}]${z} Vmess"
    echo -e "  [${grenbo}02${NC}]${z} Vless"
    echo -e ""
    read -p " Select For Core, From Option: " brand
    echo -e ""
    case $brand in
        1 | 01)
        clear
        core="vmess"
        echo "### ${name} ${core}" >>/etc/brand/.brand.db
        ;;
        2 | 02)
        clear
        core="vless"
        echo "### ${name} ${core}" >>/etc/brand/.brand.db
        ;;
    esac
}

function changebrand(){
    brandnow=$(cat cat /etc/brand/.brand.db | grep '###' | cut -d ' ' -f 2 | sort | uniq)
    head
    echo -e ""
    echo -e "  Brand Now : $brandnow"
    echo -e ""
    echo -e "  Enter New Brand Name : " newname
    echo -e "  For Core :"
    echo -e "  [${grenbo}01${NC}]${z} Vmess"
    echo -e "  [${grenbo}02${NC}]${z} Vless"
    echo -e ""
    read -p " Select For Core, From Option: " brand
    echo -e ""
    case $brand in
        1 | 01)
        clear
        core="vmess"
        sed -i "/### $brandnow/c\### $newname $core" /etc/brand/.brand.db
        ;;
        2 | 02)
        clear
        core="vless"
        sed -i "/### $brandnow/c\### $newname $core" /etc/brand/.brand.db
        ;;
    esac
}

function offbrand(){
    head
    
}