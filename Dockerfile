FROM php:8.1-fpm

# Install system dependencies required for Composer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        zip \
        unzip

# Download and install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update

COPY . /var/www/html

WORKDIR /var/www/html

EXPOSE 8080

# Command to run the PHP file using PHP's built-in web server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/public"]