#!/bin/bash

if [ $# -eq 1 ]
then
  sudo lxc-attach -n $1 -- mkdir /var/log/.downloads
  sudo lxc-attach -n $1 -- sudo apt-get update
  echo -e "Y\n" | sudo lxc-attach -n $1 -- sudo apt install wget
  echo -e "Y\n" | sudo lxc-attach -n $1 -- sudo apt install curl

  sudo lxc-attach -n $1 -- mv /usr/bin/wget /usr/bin/real_wget
  sudo lxc-attach -n $1 -- mv /usr/bin/curl /usr/bin/real_curl

  sudo cp fake_wget /var/lib/lxc/$1/rootfs/usr/bin/wget
  sudo cp fake_curl /var/lib/lxc/$1/rootfs/usr/bin/curl

else
  echo "Needs only one argument"
  exit 1
fi