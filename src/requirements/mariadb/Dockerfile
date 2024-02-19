FROM debian:bullseye

ARG WP_DATABASE_NAME
ARG MYSQL_USER
ARG MYSQL_PASS
ARG MYSQL_ROOT_PASS

RUN apt -y update && apt -y upgrade && apt -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/startup.sh /tmp/startup.sh

RUN service mariadb start && sh /tmp/startup.sh

EXPOSE 3306

CMD ["mysqld"]