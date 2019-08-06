FROM php:7.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    openssh-client \
    rsync \
    apt-transport-https \
    imagemagick \
    libmcrypt-dev \
    libmagickwand-dev \
    openssl \
    zip unzip \
    git

# install php dependencies
RUN pecl install imagick mcrypt-1.0.2 \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql \
    && docker-php-ext-enable mcrypt


# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/ && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer


# Install Node.js & Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install -y nodejs npm

