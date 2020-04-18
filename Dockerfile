FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install xdebug-2.5.5 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "[XDebug]" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN echo "hostname=localhost.localdomain" > /etc/ssmtp/ssmtp.conf \
    && echo "root=root@localhost" >> /etc/ssmtp/ssmtp.conf \
    && echo "mailhub=maildev" >> /etc/ssmtp/ssmtp.conf \
    && echo "sendmail_path=sendmail -i -t" >> /usr/local/etc/php/conf.d/php-sendmail.ini

RUN echo "[Date]" >> /usr/local/etc/php/conf.d/php-sendmail.ini \
    && echo "date.timezone = Europe/Berlin" >> /usr/local/etc/php/conf.d/php-sendmail.ini

RUN echo "localhost localhost.localdomain" >> /etc/hosts
