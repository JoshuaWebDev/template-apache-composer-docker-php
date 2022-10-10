FROM php:7.4-apache

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y g++
RUN apt-get install -y libicu-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y zip
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y curl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pgsql

WORKDIR /var/www/project

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
