FROM php:7.2

RUN apt update && \
  apt install -y openssh-client rsync apt-transport-https build-essential gnupg2 git imagemagick libpng-dev libxml2-dev nodejs node-gyp zip unzip zlib1g-dev
  
# Install additionnal PHP modules
RUN docker-php-ext-install -j$(nproc) mbstring mysqli pdo_mysql soap zip
RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd

# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/ && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Node.js & Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install -y nodejs npm

RUN npm install -g gulp bower
RUN echo '{ "allow_root": true  }' > /root/.bowerrc

