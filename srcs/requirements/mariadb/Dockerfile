FROM debian:buster

WORKDIR /tmp

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server procps

COPY tools/start_db.sh .
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN chmod +x start_db.sh

CMD ["sh", "start_db.sh"]