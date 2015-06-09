wpa_supplicant -d -Dnl80211 -c/data/misc/wifi/wpa_supplicant.conf -iwlan0 -B
hostapd -d  /data/misc/wifi/hostapd.conf

wpa_supplicant  -iwlan0 -Dnl80211 -c/data/misc/wifi/wpa_supplicant.conf -N -ip2p0 -Dnl80211 -c/data/misc/wifi/p2p_supplicant.conf &

