#!/bin/bash

echo "Provisioning virtual machine..."

echo "Configuring hostname"
echo "web" > /etc/hostname
hostname -F /etc/hostname
ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
echo "$ip   $ip hostname" >> /etc/hosts
apt-get update && apt-get upgrade -y

# Apache
echo "Installing Apache"
apt-get install apache2 -y > /dev/null

# PHP
echo "Updating PHP repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP"
apt-get install php7.2-common php7.2-dev php7.2-cli php7.2-fpm -y > /dev/null

echo "Installing PHP extensions"
apt-get install curl php7.2-curl -y > /dev/null

# PostgreSQL
echo "Installing PostgreSQL"
apt-get install postgresql -y > /dev/null

# Apache Configuration
echo "Configuring Apache"
cp /var/www/provision/apache2/sites-available/web.conf /etc/apache2/sites-available/web.conf > /dev/null
a2ensite web.conf

a2dissite 000-default.conf
rm /etc/apache2/sites-available/000-default.conf

# Restart Apache for the config to take effect
service apache2 restart > /dev/null

echo "Finished provisioning."
