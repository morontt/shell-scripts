#!/bin/bash

# cache
rm -R ./app/cache/*

# vendors
if [ ! -f ./composer.phar ];
then
    curl -sS https://getcomposer.org/installer | php
fi

php composer.phar self-update
php composer.phar install --optimize-autoloader --prefer-dist

# migrations
app/console doctrine:migrations:migrate --env=prod --no-interaction

# assetic
php app/console assetic:dump --env=prod --no-debug

# cache
rm -R ./app/cache/*
