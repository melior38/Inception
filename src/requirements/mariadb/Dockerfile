FROM debian:bullseye

ARG WP_DATABASE_NAME
ARG MARIADB_USER
ARG MARIADB_PASS
ARG MARIADB_ROOT_PASS

RUN apt -y update && apt -y upgrade && apt -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/ /tmp/startup.sh

RUN service mariadb start && sh /tmp/startup.sh

EXPOSE 3306

CMD ["mysqld"]