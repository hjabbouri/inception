# FROM debian:buster
FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y vim wget php php-mysql php-fpm

EXPOSE 9000

RUN mkdir -p /run/php

WORKDIR /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh .

RUN chmod 755 script.sh

COPY conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD [ "./script.sh" ]