#!/bin/bash

#DOCKER
DOCKER_DIR=${DOCKER_DIR:-"/docker"}
mkdir -p $DOCKER_DIR

#MYSQL
/mysql_admin.sh

#APACHE-PHP
/apache_php_admin.sh
ln -s $DOCKER_DIR/conf/php/99-docker.ini /etc/php5/apache2/conf.d/99-docker.ini
#CLI-PHP
ln -s $DOCKER_DIR/conf/php/99-docker-cli.ini /etc/php5/cli/conf.d/99-docker-cli.ini

#ssmtp
mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.org
ln -s $DOCKER_DIR/conf/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf

#Profile
cp -ar /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo "Europe/Berlin" > /etc/timezone
cat $DOCKER_DIR/conf/profile/profilelamp1404.txt > /etc/profile.d/ownprofile.sh
dpkg-reconfigure locales

#nsenter4docker
NSENTER_USER=${NSENTER_USER:-"holger"}
useradd --home /home/$NSENTER_USER -m --shell /bin/bash $NSENTER_USER

exec supervisord -n
