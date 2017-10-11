FROM php:apache
MAINTAINER ylck

RUN \ 
	apt update && \
	apt install -y --no-install-recommends \
	libmcrypt-dev \
	libssl-dev \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng12-dev \
	git && \
	apt-get clean && apt-get autoremove -y

RUN \
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
	&& docker-php-ext-install gd

WORKDIR /var/www/html

RUN \ 
	git clone  https://github.com/kalcaddle/KodExplorer && \
	mv  /var/www/html/KodExplorer/* . && \
	chmod -R 777 /var/www/html/*
# ports and volumes
EXPOSE 80
VOLUME /var/www/html/data/User 	/var/www/html/data/Group/public/home