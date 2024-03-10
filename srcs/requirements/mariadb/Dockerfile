# FROM debian:buster
FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

EXPOSE 3306

COPY ./tools/script.sh .

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 755 script.sh

CMD [ "./script.sh" ]
