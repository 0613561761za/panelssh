#!/bin/bash

# Clear terminal first
clear

# Make sure user is root

if [[ $EUID -ne 0 ]]; then
   echo "INIT 0!, SCRIPT SHOULD BE RUN AS ROOT!" 1>&2
   exit 1
fi

default=Vm0wd2VHUXhTWGhX0V0doV

apt-get update && apt-get upgrade -y
apt-get install curl -y
apt-get install apache2 -y
apt-get install php5 libapache2-mod-php5 php5-mcrypt php-mysql php-mbstring php-curl php-tokenizer php-xml -y
apt install sed
sed -i 's/var\/www/var\/www\/html\/public/g' /etc/apache2/apache2.conf
service apache2 restart
apt-get install mysql-server php5-mysql -y
mysql_install_db
mysql_secure_installation
apt-get install phpmyadmin -y
php5enmod mcrypt
service apache2 restart
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
apt-get install libssh2-1-dev libssh2-php -y
mysql -u root -p$default -e "CREATE DATABASE IF NOT EXISTS sshpanel;exit;"
php -m |grep ssh2
service apache2 restart
cd /var/www/html
wget https://github.com/0613561761za/panelssh/raw/master/chayanin12.zip
apt-get install unzip -y
unzip chayanin12.zip
rm chayanin12.zip index.html
clear
mysql -u root -p$default -e "use html; SET autocommit =0; source database/database.sql; COMMIT; exit;"

chmod -R 755 /var/www/html/*
chmod -R 755 /var/www/html/storage

# Complete installation
clear 


# Tell user installation is complete
echo "Congratulation, SSHPANEL Now installed on your server!"
echo "Default login email is : admin@admin.admin & default password is : admin"
