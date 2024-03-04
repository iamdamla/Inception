FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install vim mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/sql-script.sh sql-script.sh
RUN chmod 755 sql-script.sh
ENTRYPOINT ["bash", "sql-script.sh"]
EXPOSE 3306
