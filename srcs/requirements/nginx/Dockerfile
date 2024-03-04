FROM debian:bullseye


RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install vim nginx -y && \
    mkdir -p /etc/nginx/ssl && \
    apt install openssl -y && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Mulhouse/0=42/OU=42/CN=login.42.fr/UID=login" && \
    mkdir -p /var/run/nginx



COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html


CMD [ "nginx", "-g", "daemon off;"]