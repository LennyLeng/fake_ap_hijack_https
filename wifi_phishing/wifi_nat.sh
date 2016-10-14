#! /bin/bash

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sleep 1
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
sleep 1
iptables -A FORWARD -p tcp --syn -s 192.168.123.0/24 -j TCPMSS --set-mss 1356

