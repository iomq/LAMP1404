# DEVLAMP (Ubuntu 14.04)
# 0.6.20190516.0

Docker: I/O :: MQ - PHPDEV-Ubuntu 14.04

**Docker for PHP Developers**

Ubuntu 14.04 (Trusty Tahr) reaches End of Life on April 25 2019


external config (/docker/conf/)

* Ubuntu 14.04
* Apache 2.4.7
* MySQL 5.5.62
* PHP 5.5.9 (mod-php, xdebug, cli, phpunit, composer)
* mail: ssmtp (docker pull iomq/mailcatcher)
* cron.d-Support


example: docker run with iomq/mailcatcher
docker run --link mailcatcher:mailcatcher -d -p "80:80" -p "3306:3306" -v "/dockerdb/mysql/iomq1404:/var/lib/mysql" -v "/docker:/docker" -v "/var/www:/var/www" -v "/docker/opt/tools:/opt/tools" --name iomq1404 iomq/lamp1404


example: full docker run with iomq/mailcatcher

docker run --link mailcatcher:mailcatcher -d -h="iomq1404" --add-host="php.iomq:127.0.0.1" -p "80:80" -p "3306:3306" -v "/dockerdb/mysql/iomq1404:/var/lib/mysql" -v "/docker:/docker" -v "/usr/local/iomqwww:/usr/local/iomqwww" -v "/docker/opt:/opt" -e WORKDIR="/usr/local/iomqwww" -e APACHE_CHANGEUSER=Y -e APACHE_MYUSER=Y -e APACHE_USER=iomq -e APACHE_GROUP=iomq --name iomq1404 iomq/lamp1404


MySQL user 'root' has no password but only allows local connections
mysql -uadmin -pchangeit -h127.0.0.1

supervisorctl (start|stop) apache2
supervisorctl (start|stop) mysqld
