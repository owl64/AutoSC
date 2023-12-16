echo -e " ${GREEN} Starting Restart All Service ${NC}"
sleep 2
systemctl restart ws
systemctl restart haproxy
systemctl restart xray
systemctl restart openvpn
/etc/init.d/ssh restart
systemctl restart ssh
/etc/init.d/dropbear restart
/etc/init.d/openvpn restart
/etc/init.d/fail2ban restart
/etc/init.d/nginx restart
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1
systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3
echo ""
echo -e " ${GREEN} Back to menu in 2 sec ${NC}"
sleep 2
menusable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3
echo ""
echo -e " ${GREEN} Back to menu in 2 sec ${NC}"
sleep 2
menu