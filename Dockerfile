FROM php:7.2

RUN apt update && \
  apt install -y openssh-client rsync apt-transport-https build-essential gnupg git libxml2-dev zip unzip zlib1g-dev nodejs-dev node-gyp libssl1.0-dev
  
# Install additionnal PHP modules
RUN docker-php-ext-install -j$(nproc) soap zip

# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/ && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Node.js & Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install -y nodejs npm

RUN npm install -g gulp bower
RUN echo '{ "allow_root": true  }' > /root/.bowerrc

