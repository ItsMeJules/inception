FROM debian:buster

# Installing needed packages
RUN apt-get -yq update && apt-get -yq install \
	nginx \
	openssl \
	vim

EXPOSE 443

# Making the ssl contract
RUN mkdir /etc/nginx/ssl && \
		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/ssl/certs/site.crt -keyout /etc/ssl/private/site.key \
		-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=jpeyron/CN=jpeyron.42.fr"	

# Copying files into the container
COPY ./conf/default /etc/nginx/
COPY ./conf/nginx.conf /etc/nginx/sites-available/
COPY ./tools/config.sh .

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Making setup script executable
RUN chmod +x ./config.sh

ENTRYPOINT [ "./config.sh" ]