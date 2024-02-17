FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/asouchet.42.ch.key -out /etc/ssl/asouchet.42.ch.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=asouchet/CN=asouchet.42.ch"

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/

RUN rm -rf /etc/nginx/sites-enabled/default

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]