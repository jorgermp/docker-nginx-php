First version of docker with nginx and php-fpm

Now only works nginx with html pages.

Build:

cd docker-nginx-php

docker build -t jorgermp/nginx-php .

Run:

docker run -d -p 8080:80 -v /path/html:/usr/share/nginx/www image_id /bin/bash /opt/startup.sh
