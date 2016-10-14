#! /bin/bash

ifconfig wlan0 down
sleep 1
iwconfig wlan0 mode monitor
sleep 1
ifconfig wlan0 up
sleep 2
airmon-ng start wlan0
sleep 1
airbase-ng -e hellotest -c 1 wlan0
 
