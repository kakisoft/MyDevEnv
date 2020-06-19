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

### install dev tools
RUN apt-get install -y \
      locales \
      libpq-dev \
      libicu-dev \
      libonig-dev \
      libzip-dev

#### install for frondend tools
## Node.js(npm)
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

## yarn
RUN curl -sL https://yarnpkg.com/install.sh | bash -s -- --version 1.22.4

#### delete unnecessary archive files
RUN apt-get clean

#### Set Working directory
WORKDIR /var/www

