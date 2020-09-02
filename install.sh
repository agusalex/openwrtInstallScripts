uci set network.lan.ipaddr='192.168.50.1';
uci commit network;
opkg update ; 
opkg install luci-app-sqm luci-app-watchcat zerotier ;
#Zerotier
uci set zerotier.openwrt_network=zerotier ;
uci add_list zerotier.openwrt_network.join='NETWORK' ;
uci set zerotier.openwrt_network.enabled='1' ;
uci commit zerotier ;
#Firewall
uci add firewall rule ;
uci set firewall.@rule[-1].name='Allow-ZeroTier-Inbound';
uci set firewall.@rule[-1].src='*';
uci set firewall.@rule[-1].target='ACCEPT';
uci set firewall.@rule[-1].proto='udp';
uci set firewall.@rule[-1].dest_port='9993';
uci commit firewall ;
reboot;
