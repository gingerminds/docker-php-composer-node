FROM php:7.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    imagemagick \
    libmcrypt-dev \
    libmagickwand-dev \
    openssl \
    zip unzip \
    git
# install php dependencies
RUN pecl install imagick mcrypt\
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable mcrypt



# RUN apt update && \
#   apt install -y openssh-client rsync apt-transport-https build-essential gnupg2 git imagemagick libpng-dev libxml2-dev node-gyp zip unzip zlib1g-dev
  
# Install additionnal PHP modules
# RUN docker-php-ext-install -j$(nproc) mbstring mysqli pdo_mysql soap zip

# Install composer and put binary into $PATH
# RUN curl -sS https://getcomposer.org/installer | php && \
    # mv composer.phar /usr/local/bin/ && \
    # ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Node.js & Yarn
# RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    # apt install -y nodejs

# RUN docker-php-ext-configure gd
# RUN docker-php-ext-install gd

# RUN npm install -g gulp bower
# RUN echo '{ "allow_root": true  }' > /root/.bowerrc

