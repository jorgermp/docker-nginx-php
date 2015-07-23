# **docker**

Primera version de docker con nginx, php y Couchbase. La base del software es la siguiente:
+ Ubuntu 14.04
+ nginx 1.4.6
+ php 5.5.9 con xdebug y libreria de Couchbase

Hay que tener instalado docker en el ordenador para poder utilizar esta configuración, en Ubuntu 14.04 es tan sencillo
como ejecutar este comando:
~~~
wget -qO- https://get.docker.com/ | sh
~~~
Para comprobar que todo funciona bien ejecutamos el comando:
~~~
sudo docker run hello-world
~~~

Primero docker tiene que construir imagen con la configuración, para eso ejecutamos los comandos:
~~~
cd docker
docker build .
~~~
Nos quedamos con el id que nos devuelve al final de la ejecución

Ahora solo nos queda ejecutar la imagen:
~~~
docker run -d -p 8080:80 -v /path/html:/usr/share/nginx/www image_id /bin/bash /opt/startup.sh
~~~
