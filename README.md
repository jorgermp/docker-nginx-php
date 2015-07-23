First version of docker with nginx and php-fpm

Now only works nginx with html pages.

Build:

cd docker-nginx-php

docker build -t ubuntu:14.04 .

Run:

docker run -d -p localport:80 -v /path/html:/usr/share/nginx/www username/name /bin/bash /opt/startup.sh
