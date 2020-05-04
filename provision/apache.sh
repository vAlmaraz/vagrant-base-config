#!/bin/bash

echo "Installing Apache"
apt-get install apache2 -y > /dev/null

echo "Configuring Apache"
cp /var/www/provision/apache2/sites-available/web.conf /etc/apache2/sites-available/web.conf > /dev/null
a2ensite web.conf

a2dissite 000-default.conf
rm /etc/apache2/sites-available/000-default.conf

service apache2 restart > /dev/null
