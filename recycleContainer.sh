#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Argument needs to be container name"
  exit 1
else
  containerExist=`sudo lxc-ls -f | grep -w $1 | cut -d' ' -f1`
  if [[ $containerExist = $1 ]]
  then
    sudo forever stopall
    sleep 2

    containerIP=`sudo lxc-ls -f | grep -w  $1 | awk '{print $5}'`

    sudo iptables --table nat --delete PREROUTING --source 0.0.0.0/0 --destination 172.30.250.137 --jump DNAT --to-destination $containerIP
    sudo iptables --table nat --delete POSTROUTING --source $containerIP --destination 0.0.0.0/0 --jump SNAT --to-source 172.30.250.137
    sudo iptables --table nat --delete PREROUTING --source 0.0.0.0/0 --destination 172.30.250.137 --protocol tcp --dport 22 --jump DNAT --to-destination 172.30.138.78:6900
    sudo lxc-stop $1
    sudo lxc-destroy $1
    sleep 2
    ./createPersonalEmailHoneypot $1
  else
    echo "Container Does not exist"
    exit 1
  fi
fi