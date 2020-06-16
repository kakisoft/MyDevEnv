FROM php:7.4.7-fpm-buster

### install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

### update package manager
RUN apt-get update

### install basic tools
RUN apt-get install -y \
      git  \
      zip  \
      unzip \
      vim



# RUN apt-get update && \
#     apt-get -y install git libicu-dev libonig-dev libzip-dev unzip locales && \
#     apt-get clean


#### delete unnecessary archive files
RUN apt-get clean


#### Set Working directory
WORKDIR /var/www

