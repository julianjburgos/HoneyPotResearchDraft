#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Insufficient number of arguments"
  exit 1
else
  containerIP=`sudo lxc-ls -f | grep -w $1 | awk '{print $5}'`
  sudo sysctl -w net.ipv4.conf.all.route_localnet=1
  sudo forever -l ~/mitmLogs/testLog.log -a start ~/MITM/mitm.js -n $1 -i $containerIP -p 6900 --auto-access --auto-access-fixed 3 --debug

  sudo ip link set dev enp4s1 up
  sudo ip addr add $2/16 brd + dev "enp4s1"

  sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --jump DNAT --to-destination $containerIP
  sudo iptables --table nat --insert POSTROUTING --source $containerIP --destination 0.0.0.0/0 --jump SNAT --to-source $2
  sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --protocol tcp --dport 22 --jump DNAT --to-destination 172.30.138.78:6900

fi