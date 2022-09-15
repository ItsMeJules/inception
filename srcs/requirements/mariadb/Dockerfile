FROM debian:buster
EXPOSE 3306

RUN apt-get -yq update \
	&& apt-get -yq upgrade \
	&& apt-get -yq install \
		wget \
		vim \
		mariadb-server \
		procps

RUN mkdir /run/mysqld && chown mysql /run/mysqld \
	&& mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

COPY ./tools/init.sh .
COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN chmod 777 /var/lib/mysql
RUN chmod 777 ./init.sh

ENTRYPOINT ["./init.sh"]
