FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install wget php7.4 php7.4-fpm php7.4-mysql php7.4-gd

WORKDIR /var/www/wordpress

RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www 
RUN cd /var/www && tar -xzf wordpress-6.4.2.tar.gz && rm wordpress-6.4.2.tar.gz
    
COPY ./conf/php.conf  /etc/php/7.4/fpm/pool.d/www.conf

RUN chown -R www-data:www-data /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/wp-config.sh wp-config.sh

ENTRYPOINT ["/bin/bash", "/var/www/wordpress/wp-config.sh"]