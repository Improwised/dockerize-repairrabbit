FROM improwised/php-base

ADD ./vhost.conf /etc/nginx/conf.d/default.conf

COPY ./composer.* /var/www/

WORKDIR /var/www/

RUN mkdir -p /var/www/database

RUN	composer install --no-interaction --no-dev --no-scripts

ADD php.ini /usr/local/etc/php/conf.d/php.ini

ADD ./ /var/www/

RUN set -ex \
  && composer dump-autoload --optimize \
  && chown -R nginx:nginx /var/www
