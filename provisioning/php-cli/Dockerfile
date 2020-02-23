FROM php:7.4.3-cli

RUN apt-get update
RUN apt-get install -y --no-install-recommends git zip
RUN rm -r /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/code


