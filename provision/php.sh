echo "Updating PHP repository"
apt-get install python-software-properties build-essential -y > /dev/null
add-apt-repository ppa:ondrej/php -y > /dev/null
apt-get update > /dev/null

echo "Installing PHP"
apt-get install php7.2-common php7.2-dev php7.2-cli php7.2-fpm -y > /dev/null

echo "Installing PHP extensions"
apt-get install curl php7.2-curl -y > /dev/null
