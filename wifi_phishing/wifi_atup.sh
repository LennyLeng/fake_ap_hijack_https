#! /bin/bash

ifconfig at0 up
sleep 1
ifconfig at0 192.168.123.1 netmask 255.255.255.0
sleep 1
route add -net 192.168.123.0 netmask 255.255.255.0 gw 192.168.123.1
sleep 1
echo 1 >/proc/sys/net/ipv4/ip_forward
sleep 2
dhcpd -cf /etc/dhcp/dhcpd.conf -pf /var/run/dhcpd.pid at0
sleep 2
service isc-dhcp-server start


