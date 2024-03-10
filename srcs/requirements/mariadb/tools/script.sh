#!/bin/bash

service mariadb start
mysql -e "drop database if exists $DB_NAME;"
mysql -e "create database $DB_NAME;"
mysql -e "drop user if exists $DB_USER;"
mysql -e "create user '$DB_USER'@'%' identified by '$DB_USER_PASSWORD';"
mysql -e "grant all privileges on $DB_NAME.* to '$DB_USER'@'%';"
mysql -e "alter user 'root'@'localhost' identified by '$DB_ROOT_PASSWORD';"
mysql -u root -p$DB_ROOT_PASSWORD -e "flush privileges;"
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

mysqld_safe