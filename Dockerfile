FROM ubuntu:16.04
MAINTAINER Teerapat Khunpech <ball@engineerball.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
    libpcre3-dev gcc make \
    apache2 \
    git \
    php7.0 \
    php7.0-cli \
    php7.0-dev \
    libapache2-mod-php7.0 \
    php-xdebug \
    php7.0-gd \
    php7.0-json \
    php7.0-ldap \
    php7.0-mbstring \
    php7.0-mysql \
    php7.0-pgsql \
    php7.0-sqlite3 \
    php7.0-xsl \
    php7.0-zip \
    php7.0-soap

#Install Phalcon
RUN git clone git://github.com/phalcon/cphalcon.git && \
    cd /cphalcon/build && \
    ./install
RUN apt-get remove --purge -y software-properties-common make && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    echo -n > /var/lib/apt/extended_states && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/man/?? && \
    rm -rf /usr/share/man/??_* && \
    cd / && rm -rf /cphalcon


COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
