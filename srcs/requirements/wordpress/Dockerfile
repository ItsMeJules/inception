FROM debian:buster

RUN apt-get -yq update \
	&& apt-get -yq install \
		wget \
		vim \
		curl \
		php7.3-fpm \
		php7.3-common \
		php7.3-mysql \
		php7.3-gmp php7.3-curl \
		php7.3-intl \
		php7.3-mbstring \
		php7.3-xmlrpc \
		php7.3-gd \
		php7.3-xml \
		php7.3-cli \
		php7.3-zip \
		php7.3-soap \
		php7.3-imap

RUN apt-get -yq install \
		php-curl \
		php-gd \
		php-intl \
		php-mbstring \
		php-soap \
		php-xml \
		php-xmlrpc \
		php-zip

COPY ./tools/init.sh .
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000
		
RUN mkdir -p /var/www/html \
	&& mkdir -p /run/php

RUN wget -c https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz -C /var/www/html/ && rm -rf latest.tar.gz
RUN chmod 777 /var/www/html/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& wp core download --allow-root
	
RUN chmod 777 ./init.sh

ENTRYPOINT ["./init.sh"]