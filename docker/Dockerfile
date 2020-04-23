FROM ubuntu:18.04

LABEL maintainer="John Doe <info@app.com>" description="docker-compose-lamp-laravel-environment" Vendor="http://app.com"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
	curl wget graphviz mysql-client sudo apt-utils iputils-ping net-tools netcat less \
	apache2 libapache2-mod-fcgid php php-curl php-zip php-common php-mbstring php-dev libmcrypt-dev php-gd php-xdebug php-intl php-mysql php-imap php-sqlite3 php-pear php-apcu \
&& pecl channel-update pecl.php.net && pecl install mcrypt-1.0.1 \
&& apt-get clean

# * * * * * * * * * setup Apache
RUN chown www-data: /var/www -R && chmod -R 777 /var/www \
&& a2dissite 000-default && a2enmod rewrite

# * * * * * * * * * set server name
RUN echo "ServerName app.local" >> /etc/apache2/apache2.conf

# * * * * * * * * * install composer && nodejs
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
&& apt-get install nodejs -y

# * * * * * * * * * prepare directories & clean up
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/www \
&& rm -r /var/lib/apt/lists/*

WORKDIR /var/www

# * * * * * * * * * expose ports
EXPOSE 80

RUN a2enmod proxy_fcgi && a2dismod mpm_event && a2enmod mpm_prefork

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]