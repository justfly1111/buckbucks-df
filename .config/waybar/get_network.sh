#!/usr/local/bin/bash
network=$(route get 1.1.1.1 | grep 'interface' | cut -f3 -w -)
interface_easyname=$network
ping=$(ping -c 1 www.google.com | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)

if ! [ $network ]
then
   network_active="⛔"
elif [[ $interface_easyname == *"lagg0"* ]]
then
   network_active=""
else
   network_active=""
fi

echo "$network_active $interface_easyname ($ping ms\)"
