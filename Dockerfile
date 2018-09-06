FROM php:7.1-cli

LABEL maintainer="d@dmitri.io"

# zip
RUN apt-get update && apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip \
    && rm -r /var/lib/apt/lists/*

# icu
RUN curl -sS -o /tmp/icu.tar.gz -L http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.tgz \
    && tar -zxf /tmp/icu.tar.gz -C /tmp \
    && cd /tmp/icu/source \
    && ./configure --prefix=/usr/local \
    && make \
    && make install

# intl
RUN docker-php-ext-configure intl --with-icu-dir=/usr/local \
    && docker-php-ext-install intl

RUN apt-get update && apt-get install -y git && rm -r /var/lib/apt/lists/*

# Composer
RUN cd /usr/local/bin \
    && php -r "readfile('https://getcomposer.org/installer');" | php \
    && mv composer.phar composer

# Node
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -r /var/lib/apt/lists/*

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    && rm -r /var/lib/apt/lists/*

ENV SYMFONY_PHPUNIT_VERSION=6.5
