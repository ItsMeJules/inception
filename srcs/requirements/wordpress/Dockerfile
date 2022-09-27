FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y php7.3 php-mysqli php-fpm wget mariadb-client

WORKDIR /var/www

COPY conf/wp-config.php /var/www/wordpress
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget -c https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
RUN mkdir -p /run/php

CMD ["php-fpm7.3", "-F", "-R"]