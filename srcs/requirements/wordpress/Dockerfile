FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vim wget lsb-release php7.4 php7.4-fpm php7.4-mysql php7.4-gd && \
    sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf 

WORKDIR /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz && \
    tar -xvf wordpress-6.4.2-fr_FR.tar.gz && \
    cp -rf wordpress/* . && \
    rm -rf wordpress wordpress-6.4.2-fr_FR.tar.gz && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp 


COPY conf/wp-config.sh /var/www/html/wp-config.sh

RUN mkdir -p /run/php/ && \
    chmod +x /var/www/html/wp-config.sh


CMD ["/bin/bash", "/var/www/html/wp-config.sh"]




