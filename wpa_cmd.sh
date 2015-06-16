wpa_supplicant -d -Dnl80211 -c/data/misc/wifi/wpa_supplicant.conf -iwlan0 -B

wpa_cli -p /data/misc/wifi/wlan0

add_network (assume returns 2)
>set_network 2 ssid  ""
>set_network 2 psk  ""
>select_network 2
>enable_network 2

dhpad wlan0

hostapd -d  /data/misc/wifi/hostapd.conf

wpa_supplicant  -iwlan0 -Dnl80211 -c/data/misc/wifi/wpa_supplicant.conf -N -ip2p0 -Dnl80211 -c/data/misc/wifi/p2p_supplicant.conf &


hostapd -B /data/misc/wifi/hostapd.conf

ifconfig wlan0 192.168.100.1  netmask 255.255.255.0 

echo 1 > /proc/sys/net/ipv4/ip_forward
busybox udhcpd  /data/misc/wifi/udhcpd.conf
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE


iw phy `ls /sys/class/ieee80211/` interface add p2p0 type managed


ifconfig p2p0 192.168.3.3 netmask 255.255.255.0 up

wpa_supplicant  -ip2p0 -Dnl80211 -c/data/misc/wifi/p2p_supplicant.conf &

wpa_cli -p /data/misc/wifi/wlan0


p2p_connect 8a:e3:ab:cb:4e:a4  pbc




