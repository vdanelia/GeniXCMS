FROM ubuntu:utopic

MAINTAINER Puguh Wijayanto

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y nginx \
  php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt php5-gd libssh2-php && \
  apt-get install -y mariadb-server && \
	docker-php-ext-install mbstring mysqli 

RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
ADD docker-config/nginx.conf /etc/nginx/nginx.conf
COPY docker-config/sites-enabled /etc/nginx/sites-enabled

RUN sed -i -e 's/^listen =.*/listen = \/var\/run\/php5-fpm.sock/' /etc/php5/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html

VOLUME ["/var/www/html"]

EXPOSE 80

ADD docker-config/run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]