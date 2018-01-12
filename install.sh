#!/bin/bash
apt-get update && apt-get upgrade -y
apt-get install curl -y
apt-get install apache2 -y
apt-get install php5 libapache2-mod-php5 php5-mcrypt -y
service apache2 restart
apt-get install mysql-server php5-mysql -y
mysql_install_db
mysql_secure_installation
apt-get install phpmyadmin -y
php5enmod mcrypt
service apache2 restart
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
apt-get install libssh2-1-dev libssh2-php -y
mysql -h localhost -u root -p -e "CREATE DATABASE ssh"
php -m |grep ssh2
service apache2 restart
cd /var/www/html
wget https://github.com/0613561761za/panelssh/raw/master/chayanin11.zip
apt-get install unzip -y
unzip chayanin11.zip
rm chayanin11.zip index.html
clear
