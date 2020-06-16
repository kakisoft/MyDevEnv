FROM php:7.4.7-fpm-buster

### install composer
# RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer
# RUN apt-get update \
# && apt-get install -y \
# git \
# zip \
# unzip \
# vim




# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# RUN apt-get update && \
#     apt-get -y install git libicu-dev libonig-dev libzip-dev unzip locales && \
#     apt-get clean


WORKDIR /var/www

