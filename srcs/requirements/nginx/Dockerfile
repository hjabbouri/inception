# FROM debian:buster
FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y vim nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/my_private_certif.crt \
	-keyout /etc/nginx/ssl/my_private_key.key \
	-subj "/C=$COUNTRY/L=$CITY/O=$ORGANISATION/CN=$LOGIN"

COPY conf/nginx.conf /etc/nginx/sites-available/default 

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]