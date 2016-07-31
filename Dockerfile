FROM phusion/baseimage:0.9.19

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt-get update && apt-get install -y \
    php7.0 php7.0-mysql php7.0-gd \
    php7.0-dev \
    php-pear \
    libgpgme11-dev \
    memcached

RUN pecl install gnupg-1.4.0RC2 \
    && echo "extension=gnupg.so;" > /etc/php/7.0/mods-available/gnupg.ini

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
