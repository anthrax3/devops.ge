FROM sebp/lighttpd

MAINTAINER Tornike Zedginidze <tokozedg@gmail.com>

ADD ./public /var/www/localhost/htdocs

EXPOSE 80
