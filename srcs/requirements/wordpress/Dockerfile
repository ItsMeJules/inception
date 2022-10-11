FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php7.3 php-mysqli php-fpm wget mariadb-client

WORKDIR /var/www

COPY conf/www.conf /etc/php/7.3/fpm/pool.d
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz

# COPY conf/wp-config.php /var/www/wordpress
COPY tools/conf.sh .
RUN chmod +x conf.sh
RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root

CMD ["sh", "conf.sh"]