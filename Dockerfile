FROM php:8-apache
#Install git

RUN apt-get update  \
    && apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server python-mysqldb
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-configure gd \
    && docker-php-ext-install gd
RUN apt-get -y update \
&& apt-get install -y libicu-dev\
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl
RUN apt-get install -y curl php8.*-mbstring php8.*-json php8.*-mysqlnd php8.*-intl
RUN a2enmod ssl && a2enmod rewrite
RUN mkdir -p /etc/apache2/ssl

# COPY ssl/key. /etc/apache2/ssl/.key
# COPY ssl/crt /etc/apache2/ssl/.crt
# COPY ssl/ca-bundle /etc/apache2/ssl/.ca-bundle
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/
# COPY . /var/www/html/
#RUN mkdir /var/www/html/lib/
#COPY lib/ /var/www/html/lib/
#COPY composer.json /var/www/html/
#RUN composer require khanamiryan/qrcode-detector-decoder

EXPOSE 80
EXPOSE 443