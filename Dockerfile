FROM php:7.2

RUN apt update && apt install -y \
    openssh-client \
    rsync \
    apt-transport-https \
    gnupg2 \
    build-essential \
    git \
    imagemagick \
    unzip \
    libpng-dev \
    nodejs \
    pngquant \
    libxml2-dev \
    zip \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libjpeg-turbo-progs \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libxml2-dev \
    python \
    unzip \
    zlib1g-dev \
  
# Install additionnal PHP modules
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    curl \
    exif \
    gd \
    mbstring \
    mcrypt \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    soap 
    zip

# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/ && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Node.js & Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install -y nodejs npm

RUN npm install -g gulp bower
RUN echo '{ "allow_root": true  }' > /root/.bowerrc

