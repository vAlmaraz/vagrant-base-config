#!/bin/bash

echo "Provisioning virtual machine..."

echo "Configuring hostname"
echo "web" > /etc/hostname
hostname -F /etc/hostname
ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
echo "$ip   $ip hostname" >> /etc/hosts
apt-get update && apt-get upgrade -y

echo "Finished provisioning."
