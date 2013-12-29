FROM ubuntu
 
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl
 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
 
RUN apt-get -y install nginx php5-fpm php5-cli php5-mysql

ADD ./startup.sh /opt/startup.sh
ADD ./default /etc/nginx/sites-enabled/default
 
EXPOSE 80

