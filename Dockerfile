FROM php:7.2-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        zlib1g-dev \
        libxml2-dev \
        git \
    && rm -rf /var/lib/apt/lists/* \

    && docker-php-ext-install -j$(nproc) \
        pdo \
        pdo_mysql \
        soap \
        bcmath \
        zip \

    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

WORKDIR /var/www/app

ADD composer.json composer.lock ./

RUN composer install

ADD . .

RUN ./bin/console cache:clear

EXPOSE 9000
CMD ["php-fpm"]
