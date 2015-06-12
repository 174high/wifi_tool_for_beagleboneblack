wpa_supplicant -d -Dnl80211 -c/data/misc/wifi/wpa_supplicant.conf -iwlan0 -B
hostapd -d  /data/misc/wifi/hostapd.conf

wpa_supplicant  -iwlan0 -Dnl80211 -c/data/misc/wifi/wpa_supplicant.conf -N -ip2p0 -Dnl80211 -c/data/misc/wifi/p2p_supplicant.conf &


hostapd -B /data/misc/wifi/hostapd.conf

ifconfig wlan0 192.168.100.1  netmask 255.255.255.0 

echo 1 > /proc/sys/net/ipv4/ip_forward
busybox udhcpd  udhcpd.conf
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE



