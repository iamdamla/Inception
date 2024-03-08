FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install vim mariadb-server -y

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.cnf
COPY tools/sql-script.sh /etc/mysql/sql-script.sh

RUN chmod +x /etc/mysql/sql-script.sh
ENTRYPOINT ["/bin/bash", "/etc/mysql/sql-script.sh"]
CMD ["mysqld"]