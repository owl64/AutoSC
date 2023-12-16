echo -e ""
echo -e "  \033[1;91m service daemon-reload\033[1;37m"
fun_bar 'res1'
echo -e "  \033[1;91m service restart nginx\033[1;37m"
fun_bar 'res2'
echo -e "  \033[1;91m service restart xray\033[1;37m"
fun_bar 'res3'
echo -e "  \033[1;91m service restart rc-local\033[1;37m"
fun_bar 'res4'
# echo -e "  \033[1;91m service restart client dns\033[1;37m"
# fun_bar 'res5'
# echo -e "  \033[1;91m service restart server dns\033[1;37m"
# fun_bar 'res6'
echo -e "  \033[1;91m service restart dropbear\033[1;37m"
fun_bar 'res7'
echo -e "  \033[1;91m service restart websocket\033[1;37m"
fun_bar 'res8'
echo -e "  \033[1;91m service restart openvpn\033[1;37m"
 fun_bar 'res9'
echo -e "  \033[1;91m service restart cron\033[1;37m"
fun_bar 'res10'
# echo -e "  \033[1;91m service restart haproxy\033[1;37m"
# fun_bar 'res11'
# echo -e "  \033[1;91m service restart netfilter-persistent\033[1;37m"
# fun_bar 'res12'
echo -e "  \033[1;91m service restart squid\033[1;37m"
fun_bar 'res13'
echo -e "  \033[1;91m service restart badvpn\033[1;37m"
fun_bar 'res14'
echo -e ""
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
read -n 1 -s -r -p "Press any key to back on menu"
menu