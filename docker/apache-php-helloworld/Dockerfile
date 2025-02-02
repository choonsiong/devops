FROM php:8-apache

RUN apt-get update && apt-get install -y tzdata && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

ENV TZ="Asia/Tokyo"

COPY index.php /var/www/html