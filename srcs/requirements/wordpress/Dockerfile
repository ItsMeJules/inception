FROM debian:buster

RUN apt-get -yq update \
	&& apt-get -yq install \
		wget \
		vim \
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
		
RUN wget -c https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm -rf latest.tar.gz