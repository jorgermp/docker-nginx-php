FROM jorgermp/nginx-php

RUN dpkg-divert --local --rename --add /sbin/initctl

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install wget
RUN echo "deb http://packages.couchbase.com/ubuntu trusty trusty/main" > /etc/apt/sources.list
RUN wget -O- http://packages.couchbase.com/ubuntu/couchbase.key | sudo apt-key add -
RUN apt-get update

RUN apt-get -y install libcouchbase2-core libcouchbase-dev

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD ./files/www.conf /etc/php5/fpm/pool.d/www.conf
ADD ./files/20-xdebug.ini /etc/php5/fpm/conf.d/20-xdebug.ini
ADD ./files/30-couchbase.ini /etc/php5/fpm/conf.d/30-couchbase.ini
ADD ./files/30-xhprof.ini /etc/php5/fpm/conf.d/30-xhprof.ini
ADD ./files/couchbase.so /usr/lib/php5/ext/couchbase.so
ADD ./files/xhprof.so /usr/lib/php5/ext/xhprof.so
ADD ./files/php.ini /etc/php5/fpm/php.ini
ADD ./files/default /etc/nginx/sites-enabled/default
ADD ./files/startup.sh /opt/startup.sh


EXPOSE 80
