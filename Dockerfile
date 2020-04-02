FROM php:7.2-apache
LABEL maintainer="dev@learning.net"

# Install supplimentary programs
RUN apt-get update && apt-get install -y \
    curl \
    git \
    supervisor \
    wget \
    build-essential \
    unzip \
    software-properties-common \
    libmcrypt-dev \
    libssh2-1-dev \
    libxml2-dev \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    gnupg \
    libldap2-dev

RUN pecl install xdebug redis \
    docker-php-ext-enable xdebug redis

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
# Install php extensions
RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    iconv \
    bcmath \
    mbstring \
    soap \
    zip \
    gd \
    ldap

# Enable apache modules
RUN a2enmod deflate rewrite ssl proxy_http speling

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

EXPOSE 80
EXPOSE 443
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
