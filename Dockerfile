FROM php:7.4-apache

# Instala dependências necessárias
RUN apt-get update && \
    apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip

# Habilita módulo rewrite do Apache
RUN a2enmod rewrite

# Instala o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# copiar arquivos do site para o diretório do Apache
COPY . /var/www/html

# Mudar o diretório de trabalho de volta para /var/www/htmlc
WORKDIR /var/www/html

# Copia o arquivo de configuração do Apache
COPY /app/.docker/000-default.conf /etc/apache2/sites-available/000-default.conf

# Copiar arquivo composer.json e composer.lock para dentro do container
COPY composer.json composer.lock /var/www/html/

RUN service apache2 start

# Instalar as dependências do composer dentro do container
RUN composer install

COPY /app/vendor /var/www/html/public/vendor

EXPOSE 80

# Inicia o Apache
CMD ["apache2-foreground"]